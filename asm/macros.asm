// System Macros
macro save_registers_to_sp() {
    movem.l #$FFFF,-(a7)
}
macro load_registers_from_sp() {
    movem.l (a7)+,#$FFFF
}

macro tilecopy_to_vram(SRC, LENGTH, DEST) {
    save_registers_to_sp()

    move.l  #($40000000+(({DEST}&$3FFF)<<16)+(({DEST}&$C000)>>14)),(VDP_CTRL).l
    movea.l #({SRC}),a0
    clr.l   d0
    move.l  #(({LENGTH}/32)-3),d0
-;
    move.l  (a0)+,(VDP_DATA).l                              //; TILE LINE #1
    move.l  (a0)+,(VDP_DATA).l                              //; TILE LINE #2
    move.l  (a0)+,(VDP_DATA).l                              //; TILE LINE #3
    move.l  (a0)+,(VDP_DATA).l                              //; TILE LINE #4
    move.l  (a0)+,(VDP_DATA).l                              //; TILE LINE #5
    move.l  (a0)+,(VDP_DATA).l                              //; TILE LINE #6
    move.l  (a0)+,(VDP_DATA).l                              //; TILE LINE #7
    move.l  (a0)+,(VDP_DATA).l                              //; TILE LINE #8
    dbf     d0,-

    load_registers_from_sp()
}


macro dma_copy_to_vram(START, END, DEST) {
    save_registers_to_sp()
    move.w #$8174,(VDP_CTRL).l
    move.w #$8F02,(VDP_CTRL).l
    // load plane a gfx via dma copy to vram
    move.w #$9300+((({END}-{START})>>1)&$FF),(VDP_CTRL).l
    move.w #$9400+(((({END}-{START})>>1)&$FF00)>>8),(VDP_CTRL).l
    move.w #$9500+(({START}>>1)&$FF),(VDP_CTRL).l
    move.w #$9600+((({START}>>1)&$FF00)>>8),(VDP_CTRL).l
    move.w #$9700+((({START}>>1)&$7F0000)>>16),(VDP_CTRL).l
    move.l #$40000080+(({DEST}&$3FFF)<<16)+(({DEST}&$C000)>>14),(VDP_CTRL).l
-                    
	move.w 	VDP_CTRL,d1          		                    // ; Read VDP status reg
	btst   	#1,d1                 		                    // ; Check if DMA finished
	bne  	-
    move.w #$8164,(VDP_CTRL).l
    load_registers_from_sp()
}

macro dma_fill(LENGTH, DEST) {
    save_registers_to_sp()
    move.w #$8174,(VDP_CTRL).l
    move.w #$8F01,($c00004).l
    move.w #$9300+(({LENGTH}>>1)&$FF),($c00004).l
    move.w #$9400+((({LENGTH}>>1)&$FF00)>>8),($c00004).l
    move.w #$9780,($c00004).l
    move.l #$40000080+(({DEST}&$3FFF)<<16)+(({DEST}&$C000)>>14),($C00004).l
    move.w #$8164,(VDP_CTRL).l
    load_registers_from_sp()
}

macro tilecopy_by_column(start, column_count, tile_count, src_column_count) {
{start}_check_start_column:
    clr.l   d5
    move.w  ({column_count}).l,d5
    andi.b  #1,d5
    beq     {start}_jump_start_on_odd_column
    jmp     {start}_jump_start_on_even_column

{start}_jump_start_on_odd_column:
    jmp     {start}_start_on_odd_column_check
{start}_jump_start_on_even_column:
    jmp     {start}_start_on_even_column_check


{start}_start_on_odd_column_check:
{start}_start_odd_check_buffer_line_1:
    move.w  ({tile_count}).l,d0
    cmp.w   #$200,d0                                        // if not fullfill 16 tiles skip
    bne     {start}_start_odd_check_buffer_line_2
    add.w   #$200,({tile_count}).l                          // if 16 tiles fullfilled add new line
{start}_start_odd_check_buffer_line_2:
    cmp.w   #$600,d0 
    bne     {start}_start_odd_check_buffer_line_3
    add.w   #$200,({tile_count}).l                          // if 16 tiles fullfilled add new line
{start}_start_odd_check_buffer_line_3:
    cmp.w   #$A00,d0 
    bne     {start}_start_odd_check_end
    add.w   #$200,({tile_count}).l                          // if 16 tiles fullfilled add new line
{start}_start_odd_check_end:
    nop
    nop

{start}_start_odd_init_column_draw:
    clr.l   d1
    clr.l   d2
    move.w  #7,d1       // Total Lines
    move.l  #0,d2       // Line ID
    jmp     {start}_start_on_odd_check_column_draw_is_even_or_odd

{start}_start_on_odd_column_draw_is_odd:
    tilecopy_by_column_start_on_odd_draw_odd({column_count}, {tile_count}, {src_column_count})
    jmp     {start}_start_on_odd_column_draw_end

{start}_start_on_odd_check_column_draw_is_even_or_odd:
    move.w  ({column_count}).l,d5
    andi.b  #1,d5
    beq     {start}_start_on_odd_column_draw_is_odd
{start}_start_on_odd_column_draw_is_even:
    tilecopy_by_column_start_on_odd_draw_even({column_count}, {tile_count}, {src_column_count})
    jmp     {start}_start_on_odd_column_draw_end 

{start}_start_on_odd_column_draw_end:
    add.w   #1,({column_count}).l
    add.w   #1,({src_column_count}).l
    cmp.w   #8,({column_count}).l 
    bne     {start}_start_on_odd_skip_buffer_tile_increment
    move.w  #0,({column_count}).l                           // temp
    add.w   #$0020,({tile_count}).l                         // increment 1 tile   
{start}_start_on_odd_skip_buffer_tile_increment:
    dbf     d4,{start}_start_on_odd_column_check 
    move.w  #0,({src_column_count}).l                       // temp
    jmp     {start}_finish

{start}_start_on_even_column_check:
{start}_start_even_check_buffer_line_1:
    move.w  ({tile_count}).l,d0
    cmp.w   #$200,d0                                        // if not fullfill 16 tiles skip
    bne     {start}_start_even_check_buffer_line_2
    add.w   #$200,({tile_count}).l                          // if 16 tiles fullfilled add new line
{start}_start_even_check_buffer_line_2:
    cmp.w   #$600,d0 
    bne     {start}_start_even_check_buffer_line_3
    add.w   #$200,({tile_count}).l                          // if 16 tiles fullfilled add new line
{start}_start_even_check_buffer_line_3:
    cmp.w   #$A00,d0 
    bne     {start}_start_even_check_end
    add.w   #$200,({tile_count}).l                          // if 16 tiles fullfilled add new line
{start}_start_even_check_end:
    nop
    nop

{start}_start_even_init_column_draw:
    clr.l   d1
    clr.l   d2
    move.w  #7,d1       // Total Lines
    move.l  #0,d2       // Line ID
    jmp     {start}_start_on_even_check_column_draw_is_even_or_odd
{start}_start_on_even_column_draw_is_odd:
    tilecopy_by_column_start_on_even_draw_odd({column_count}, {tile_count}, {src_column_count})
    jmp     {start}_start_on_even_column_draw_end

{start}_start_on_even_check_column_draw_is_even_or_odd:
    move.w  ({column_count}).l,d5
    andi.b  #1,d5
    beq     {start}_start_on_even_column_draw_is_odd
{start}_start_on_even_column_draw_is_even:
    tilecopy_by_column_start_on_even_draw_even({column_count}, {tile_count}, {src_column_count})
    jmp     {start}_start_on_even_column_draw_end  

{start}_start_on_even_column_draw_end:
    add.w   #1,({column_count}).l
    add.w   #1,({src_column_count}).l
    cmp.w   #8,({column_count}).l 
    bne     {start}_start_on_even_skip_buffer_tile_increment
    move.w  #0,({column_count}).l             // temp
    add.w   #$0020,({tile_count}).l           // walk 1 tile   
{start}_start_on_even_skip_buffer_tile_increment:
    dbf     d4,{start}_start_on_even_column_check
    move.w  #0,({src_column_count}).l             // temp
    jmp     {start}_finish

{start}_finish:
}


macro tilecopy_by_column_start_on_odd_draw_odd(column_count, tile_count, src_column_count) {
-
    movea.l a0,a2
    movea.l a1,a3
    adda.w  ({tile_count}).l,a3
    adda.w  d2,a2
    adda.w  d2,a3
    move.w  ({column_count}).l,d7
    lsr.w   #1,d7
    move.w  ({src_column_count}).l,d5
    lsr.w   #1,d5
    add.w   d5,a2
    add.w   d7,a3
    move.b  (a2),d6
    andi.b  #$F0,d6
    add.b   #$03,d6  // Next col only bg
    move.b  d6,(a3)
    add.b   #4,d2
    dbf     d1,-
}

macro tilecopy_by_column_start_on_odd_draw_even(column_count, tile_count, src_column_count) {
-
    movea.l a0,a2
    movea.l a1,a3
    adda.w  ({tile_count}).l,a3
    adda.w  d2,a2
    adda.w  d2,a3
    move.w  ({column_count}).l,d7
    lsr.w   #1,d7
    move.w  ({src_column_count}).l,d5
    lsr.w   #1,d5
    add.w   d5,a2
    add.w   d7,a3
    move.b  (a2),d6
    andi.b  #$0F,d6
    andi.b  #$F0,(a3)
    add.b   d6,(a3)
    add.b   #4,d2
    dbf     d1,-
}


macro tilecopy_by_column_start_on_even_draw_odd(column_count, tile_count, src_column_count) {
-
    movea.l a0,a2
    movea.l a1,a3
    adda.w  ({tile_count}).l,a3
    adda.w  d2,a2
    adda.w  d2,a3
    move.w  ({column_count}).l,d7
    lsr.w   #1,d7
    move.w  ({src_column_count}).l,d5
    lsr.w   #1,d5
    add.w   d5,a2
    add.w   d7,a3

    move.b  (a2),d6
    andi.b  #$0F,d6
    lsl.b   #4,d6
    andi.b  #$F0,d6
    add.b   #$03,d6  // Next col only bg
    move.b  d6,(a3)

    add.b   #4,d2
    dbf     d1,-
}

macro tilecopy_by_column_start_on_even_draw_even(column_count, tile_count, src_column_count) {
-
    movea.l a0,a2
    movea.l a1,a3
    adda.w  ({tile_count}).l,a3
    adda.w  d2,a2
    adda.w  d2,a3
    move.w  ({column_count}).l,d7
    lsr.w   #1,d7
    move.w  ({src_column_count}).l,d5
    lsr.w   #1,d5
    add.w   d5,a2
    add.w   d7,a3

    move.b  (a2),d6
    andi.b  #$F2,d6
    lsr.b   #4,d6
    andi.b  #$F0,(a3)
    add.b   d6,(a3)

    add.b   #4,d2
    dbf     d1,-
}

// Control Macros
macro text(TEXT) {
    table "tbl/global.tbl"
    db {TEXT}
    end()
}
macro intro_text(TEXT) {
    table "tbl/global.tbl"
    db {TEXT}
    break_line()
}
macro menu_text(TEXT) {
    table "tbl/menus.tbl"
    db {TEXT}
    break_line()
}
macro menu_textspeed(TEXT) {
    table "tbl/menus.tbl"
    db {TEXT}
}
macro dialogue_text(TEXT) {
    table "tbl/global.tbl"
    db {TEXT}
    break_line()
}
macro end() {
    db ENDSTRING
}
macro break_line() {
    db BREAKLINE
}
macro new_page() {
    db NEWPAGE
}
macro align() {
    db NULL
}
