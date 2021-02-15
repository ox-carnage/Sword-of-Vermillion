// ; **************************************************
// ; *      [SMD] Sword of Vermilion				    *
// ; *         Patch de Tradução v3.0                 *
// ; **************************************************
// ; * Tradutor: OX-Carnage                           *
// ; **************************************************
// ; * Modificações:                                  *
// ; *  - Textos dos Menus                            *
// ; *  - Textos dos Diálogos                         *
// ; **************************************************
// ; * Informações:                                   *
// ; *  - 30 caracteres por linha                     *
// ; *  - Máximo de 3 linhas por caixa de dialogo     *
// ; *  - A cada 3 linhas de textos, insere uma janela*
// ; *  - Sem limitação de próxima janela				*
// ; **************************************************

// ; Definitions
arch    md.cpu
endian  msb

// ; Patched Output
output  "bin/vermilion_br.bin",create

// ; Configuration
constant CONFIG_LANGUAGE(PORTUGUESE)
constant ENABLE_VWF(1)

define   CONFIG_ROM_NAME("SWORD OF VERMILION                              ")
define   CONFIG_ROM_REGION("U")
define   CONFIG_ROM_SIZE(eof)

constant CONFIG_MENU_BOX_X($02)
constant CONFIG_MENU_BOX_Y($02)
constant CONFIG_MENU_BOX_WIDTH($0D)
constant CONFIG_MENU_BOX_HEIGHT($0A)

constant CONFIG_MENU_BOX_CLEAR_X(CONFIG_MENU_BOX_X)
constant CONFIG_MENU_BOX_CLEAR_Y(CONFIG_MENU_BOX_Y)
constant CONFIG_MENU_BOX_CLEAR_WIDTH(CONFIG_MENU_BOX_WIDTH)
constant CONFIG_MENU_BOX_CLEAR_HEIGHT(CONFIG_MENU_BOX_HEIGHT)

constant CONFIG_MENU_TEXTSPEED_BOX_X($0A)
constant CONFIG_MENU_TEXTSPEED_BOX_Y($0A)
constant CONFIG_MENU_TEXTSPEED_BOX_WIDTH($0E)
constant CONFIG_MENU_TEXTSPEED_BOX_HEIGHT($0A)

constant CONFIG_MENU_TEXTSPEED_BOX_CLEAR_X(CONFIG_MENU_TEXTSPEED_BOX_X)
constant CONFIG_MENU_TEXTSPEED_BOX_CLEAR_Y(CONFIG_MENU_TEXTSPEED_BOX_Y)
constant CONFIG_MENU_TEXTSPEED_BOX_CLEAR_WIDTH(CONFIG_MENU_TEXTSPEED_BOX_WIDTH)
constant CONFIG_MENU_TEXTSPEED_BOX_CLEAR_HEIGHT(CONFIG_MENU_TEXTSPEED_BOX_HEIGHT)

constant CONFIG_MENU_TEXTSPEED_BOX_CONTENT_X($01)
constant CONFIG_MENU_TEXTSPEED_BOX_CONTENT_Y($01)

constant CONFIG_DIALOGUE_BOX_X($04)
constant CONFIG_DIALOGUE_BOX_Y($15)
constant CONFIG_DIALOGUE_BOX_WIDTH($1F)
constant CONFIG_DIALOGUE_BOX_HEIGHT($05)

origin ROM_START
    // ; Original File
    insert "bin/vermilion.bin"
    
    // ; Includes
    include "asm/macros.asm"
    include "asm/constants.asm"

if (CONFIG_LANGUAGE == ENGLISH) {

// ;  include "text/en/intro.asm"
// ;  include "text/en/items.asm"
    include "text/en/armors.asm"
// ;  include "text/en/menus.asm"
    include "text/en/swords.asm"
    include "text/en/spells.asm"
    include "text/en/shields.asm"
    include "text/en/kingdom.asm"
    include "text/en/dialogues.asm"
}


if (CONFIG_LANGUAGE == PORTUGUESE) {

    define   CONFIG_ROM_NAME("VERMILION: A ESPADA DO CAVALEIRO VERMELHO       ")
    define   CONFIG_ROM_REGION("JUE")

    constant CONFIG_DIALOGUE_BOX_X($08)
    constant CONFIG_DIALOGUE_BOX_Y($15)
    constant CONFIG_DIALOGUE_BOX_WIDTH($1A)
    constant CONFIG_DIALOGUE_BOX_HEIGHT($05)

    constant VWF_FONT_RENDER($A800)

    include "text/br/intro.asm"
    include "text/br/items.asm"
    include "text/br/armors.asm"
    include "text/br/menus.asm"
    include "text/br/swords.asm"
    include "text/br/shields.asm"
    include "text/br/spells.asm"
    include "text/br/kingdom.asm"
    include "text/br/dialogues.asm"
}

include "asm/pointers.asm"


origin $00000150
    db {CONFIG_ROM_NAME}

origin $000001A4
    dl {CONFIG_ROM_SIZE}

origin $000001F0
    db {CONFIG_ROM_REGION}

// ; Draw Menu box
origin ROM_MENU_BOX_ATTRIBUTES
    move.w  #CONFIG_MENU_BOX_X,(BOX_POSITION_X).w                                   // ; X
    move.w  #CONFIG_MENU_BOX_Y,(BOX_POSITION_Y).w                                   // ; Y
    move.w  #CONFIG_MENU_BOX_WIDTH,(BOX_WIDTH).w                                    // ; Width
    move.w  #CONFIG_MENU_BOX_HEIGHT,(BOX_HEIGHT).w                                  // ; Height

// ; Clear Menu box
origin ROM_MENU_CLEAR_BOX_ATTRIBUTES
    move.w  #CONFIG_MENU_BOX_CLEAR_X,(BOX_CLEAR_POSITION_X).w                       // ; X
    move.w  #CONFIG_MENU_BOX_CLEAR_Y,(BOX_CLEAR_POSITION_Y).w                       // ; Y
    move.w  #CONFIG_MENU_BOX_CLEAR_WIDTH,(BOX_CLEAR_WIDTH).w                        // ; Width
    move.w  #CONFIG_MENU_BOX_CLEAR_HEIGHT,(BOX_CLEAR_HEIGHT).w                      // ; Height

// ; Draw Text Speed box
origin ROM_MENU_TEXTSPEED_BOX_ATTRIBUTES
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_X,(BOX_POSITION_X).w                         // ; X   
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_Y,(BOX_POSITION_Y).w                         // ; Y
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_WIDTH,(BOX_WIDTH).w                          // ; Width
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_HEIGHT,(BOX_HEIGHT).w                        // ; Height

// ; Clear Text Speed box
origin ROM_MENU_TEXTSPEED_CLEAR_BOX_ATTRIBUTES
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CLEAR_X,(BOX_CLEAR_POSITION_X).w             // ; X
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CLEAR_Y,(BOX_CLEAR_POSITION_Y).w             // ; Y
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CLEAR_WIDTH,(BOX_CLEAR_WIDTH).w              // ; Width
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CLEAR_HEIGHT,(BOX_CLEAR_HEIGHT).w            // ; Heigth

// ; Text Speed Box Content Alignment
origin ROM_MENU_TEXTSPEED_BOX_CONTENT_ATTRIBUTES
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CONTENT_X,(MENU_TEXTSPEED_BOX_CONTENT_X).w   // ; X
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CONTENT_Y,(MENU_TEXTSPEED_BOX_CONTENT_Y).w   // ; Y


// ; Draw Dialogue Box
origin ROM_DIALOGUE_BOX_ATTRIBUTES
    move.w  #CONFIG_DIALOGUE_BOX_X+1,(BOX_CONTENT_POSITION_X).w
    move.w  #CONFIG_DIALOGUE_BOX_Y,(BOX_CONTENT_POSITION_Y).w
    move.w  #0,($FFC208).w
    clr.w   ($FFC234).w
    move.w  #CONFIG_DIALOGUE_BOX_X,(BOX_POSITION_X).w                               // ; X
    move.w  #CONFIG_DIALOGUE_BOX_Y,(BOX_POSITION_Y).w                               // ; Y
    move.w  #CONFIG_DIALOGUE_BOX_WIDTH,(BOX_WIDTH).w                                // ; Width
    move.w  #CONFIG_DIALOGUE_BOX_HEIGHT,(BOX_HEIGHT).w                              // ; Height


// ; VWF
if (ENABLE_VWF == 1) {
    // ; Injection point for VWF Reset
    origin $00010BBE
        jmp vwf_reset

    // ; Injection point for VWF call
    origin $00010A24
        jmp vwf_font

    // ; Injection point for VWF Newline
    origin $00010ABC
        jmp (vwf_add_newline).l
}

origin $100000

// ; VWF Newline check
vwf_add_newline:
    save_registers_to_sp()
    clr.w    d0
    move.w   (VWF_TILE_COUNT).l,d0
    cmp.w    #$600,d0                                       // ; If equal second line: 0x600 bytes
    ble      +
    move.w   #$A00,(VWF_TILE_COUNT).l                       // ; add new line to upper tile count
    move.w   #$A00,(VWF_TILE_COUNT_2).l                     // ; add new line to lower tile count
    move.w   #$0,(VWF_COLUMN_COUNT).l                       // ; reset upper vwf column count
    move.w   #$0,(VWF_COLUMN_COUNT_2).l                     // ; reset lower vwf column count
    bra      vwf_add_newline_end
+
    cmp.w    #$A00,d0                                       // ; If equal third line: 0xA00 bytes
    ble      +
    move.w   #$E00,(VWF_TILE_COUNT).l                       // ; add new line to upper tile count
    move.w   #$E00,(VWF_TILE_COUNT_2).l                     // ; add new line to lower tile count
    move.w   #$0,(VWF_COLUMN_COUNT).l                       // ; reset upper vwf column count
    move.w   #$0,(VWF_COLUMN_COUNT_2).l                     // ; reset lower vwf column count
    bra      vwf_add_newline_end
+     
    if (CONFIG_LANGUAGE == PORTUGUESE) {
        move.w   #$500,(VWF_TILE_COUNT).l                       // ; add new line to upper tile count
        move.w   #$500,(VWF_TILE_COUNT_2).l                     // ; add new line to lower tile count
    } else {
        move.w   #$600,(VWF_TILE_COUNT).l                       // ; add new line to upper tile count
        move.w   #$600,(VWF_TILE_COUNT_2).l                     // ; add new line to lower tile count
    }
    move.w   #$0,(VWF_COLUMN_COUNT).l                       // ; reset upper vwf column count
    move.w   #$0,(VWF_COLUMN_COUNT_2).l                     // ; reset lower vwf column count
vwf_add_newline_end:           
    load_registers_from_sp()
    jmp     ($00010BD8).l

// ; VWF reset check
vwf_reset:

    // ; Copy Buffer to VRAM
    dma_copy_to_vram(VWF_FONT_BUFFER, (VWF_FONT_BUFFER+$C00), VWF_FONT_RENDER)

    // ; Reset VWF Flags
    move.w  #$0000,(VWF_RESET_FLAG).l                       // ; VWF clear buffer flag
    move.w  #$0000,(VWF_TILE_COUNT).l                       // ; VWF upper tile count
    move.w  #$0000,(VWF_TILE_COUNT_2).l                     // ; VWF lower tile count
    move.w  #$0000,(VWF_COLUMN_COUNT).l                     // ; VWF upper column count
    move.w  #$0000,(VWF_COLUMN_COUNT_2).l                   // ; VWF lower column count
    move.w  #$0000,(VWF_SRC_COLUMN_COUNT).l                 // ; VWF upper src column count
    move.w  #$0000,(VWF_SRC_COLUMN_COUNT_2).l               // ; VWF lower src column count 

    // ; Clear Font Buffer loop 
    lea     (VWF_FONT_BUFFER),a1
    move.w  #$1000,d1
-
    move.b  #$33,(a1)+
    dbf     d1,-

    bra     vwf_reset_continue

jmp_10BD2:
    jmp     ($10BD2).l

vwf_reset_continue:
    tst.b   ($FFC213).w
    beq     jmp_10BD2
    clr.b   ($FFC213).w
    clr.w   ($FFC214).w

    jmp     ($00010BCC).l

// ; VWF Tilemap Render
vwf_font:
    move    #$FF,($9C)
    jsr     vwf_init
    save_registers_to_sp()

    // ; Get PLANE_B position for rows
    move.w  ($FFC40E).w,d0
    lsr.w   #3,d0
    move.w  ($FFC410).w,d1
    lsr.w   #3,d1
    add.w   ($FFC234).w,d0
    add.w   ($FFC230).w,d0
    add.w   ($FFC232).w,d1
    subq.w  #1,d0
    subq.w  #1,d1
    andi.w  #$3F,d0 ; '?'
    andi.w  #$3F,d1 ; '?'
    add.w   d0,d0
    asl.w   #7,d1
    add.w   d1,d0
    andi.l  #$1FFF,d0
    add.w   #4,d0                                           // ; pad 2 tiles
    add.w   #$100,d0                                        // ; add 2 rows
    move.l  d0,d1
    add.w   #$80,d1
    swap    d0
    swap    d1
    ori.l   #$40000003,d0
    ori.l   #$40000003,d1   

    // ; Draw upper tilemap for first row
    movea.l #(vwf_tilemap_1),a0
    move.l  #$4A540003,d2
    move.l  d0,d3
    jsr     (vwf_tilemap_draw).l

    // ; Draw lower tilemap for first row
    movea.l #(vwf_tilemap_2),a0
    move.l  d1,d2
    move.l  d1,d3
    jsr     (vwf_tilemap_draw).l


    // ; Draw upper tilemap for second row
    movea.l #(vwf_tilemap_3),a0
    add.l   #$01000000,d0  
    move.l  d0,d2
    move.l  d0,d3
    jsr     (vwf_tilemap_draw).l

    // ; Draw lower tilemap for second row
    movea.l #(vwf_tilemap_4),a0
    add.l   #$01000000,d1 
    move.l  d1,d2
    move.l  d1,d3
    jsr     (vwf_tilemap_draw).l

    load_registers_from_sp()
    jmp     $10A6A

vwf_tilemap_draw:
    if (CONFIG_LANGUAGE == PORTUGUESE) {
        move.l  #23,d7                                      //; Quantity of chars on line
    } else {
        move.l  #28,d7                                      //; Quantity of chars on line
    }
    andi.l  #$7E0000,d2
-
    move.l  d3,d4
    move.l  d4,(VDP_CTRL).l
    move.w  (a0)+,(VDP_DATA).l
    cmp.l   #$7E0000,d2
    bne     +
    sub.l   #$00800000,d3
+
    add.l   #$00020000,d3
    move.l  d3,d2
    andi.l  #$7E0000,d2
    dbf     d7,-
    rts


// ; VWF Main Routine
vwf_init:
    save_registers_to_sp()

vwf_continue:
    cmp.w   #1,(VWF_RESET_FLAG).l                           // ; Check VWF reset flag
    beq     vwf_skip_reset_buffer                           // ; skip if setted
    move.w  #$0001,(VWF_RESET_FLAG).l                       // ; if not setted presume it's first tile
                                                            // ; so prepare for draw
    lea     (VWF_FONT_BUFFER),a1                            // ; get VWF buffer location
    move.w  #$1000,d1                                       // ; set buffer size
-                                                           // ; start clear loop
    move.b  #$33,(a1)+
    dbf     d1,-

vwf_skip_reset_buffer:
    lea     (VWF_FONT_BUFFER).l,a1                          // ; get VWF buffer location

vwf_get_char_id:
    clr.l   d3                                              // ; clear Char ID
    dl      $16302000                                       // ; copy Char ID to d3
    clr.l   d1
    move.b  d3,d1                                           
    lea     (gfx_vwf_font).l,a0                             // ; get VWF font src location


vwf_get_char_width:
    lea     (vwf_table).l,a4                                // ; get VWF width tbl location
    adda.w  d1,a4                                           // ; set VWF width tbl at char position
    move.b  (a4),d4                                         // ; get Char Width
    move.b  (a4),(VWF_CHAR_WIDTH)                           // ; get Char Width and save on VAR

vwf_get_char_tile:
    mulu.w  #64,d1                                          // ; Multiple by 2 tiles
    adda.w  d1,a0                                           // ; Add multiplied char ID
                                                            // ; to VWF vwf src location
                                                            // ; now can copy tiles of char

// ; Start Char tile draw
vwf_draw_char_on_buffer:

// ; Copy Upper Tile to VWF Font Buffer
vwf_draw_char_upper:
    tilecopy_by_column(vwf_draw_char_upper, VWF_COLUMN_COUNT, VWF_TILE_COUNT, VWF_SRC_COLUMN_COUNT)
    clr.l   d4
    move.b  (a4),d4                                         // ; get Char Width saved on VAR
    adda.l  #$20,a0                                         // ; increment a tile
    adda.l  #$200,a1                                        // ; increment a row
// ; Copy Lower Tile to VWF Font Buffer
vwf_draw_char_lower:
    tilecopy_by_column(vwf_draw_char_lower, VWF_COLUMN_COUNT_2, VWF_TILE_COUNT_2, VWF_SRC_COLUMN_COUNT_2)
    suba.l  #$200,a1                                        // ; decrement a row

vwf_end:
    load_registers_from_sp()

    // ; At finish
    // ; Copy all buffer to font render location on VRAM
    if (CONFIG_LANGUAGE == PORTUGUESE) {
        dma_copy_to_vram(VWF_FONT_BUFFER, (VWF_FONT_BUFFER+$C00), VWF_FONT_RENDER)
    } else {
      dma_copy_to_vram(VWF_FONT_BUFFER, (VWF_FONT_BUFFER+$1000), VWF_FONT_RENDER)  
    }

    rts

vwf_skip:
    rts

// ; VWF Font GFX
gfx_vwf_font:
    insert  "gfx/vwf/font_16x8_4bpp.bin"
gfx_vwf_font_end:

// ; VWF Char Width Table
vwf_table:
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $02 // ; SPACE
    db      $03 // ; !
    db      $03 // ; "
    db      $07 // ; #
    db      $05 // ; $
    db      $07 // ; %
    db      $05 // ; &
    db      $01 // ; '
    db      $03 // ; (
    db      $03 // ; )
    db      $03 // ; *
    db      $05 // ; +
    db      $03 // ; ,
    db      $05 // ; -
    db      $02 // ; .
    db      $04 // ; /
    db      $04 // ; 0
    db      $03 // ; 1
    db      $04 // ; 2
    db      $04 // ; 3
    db      $04 // ; 4
    db      $04 // ; 5
    db      $04 // ; 6
    db      $04 // ; 7
    db      $04 // ; 8
    db      $04 // ; 9
    db      $01 // ; :
    db      $02 // ; ;
    db      $06 // ; <
    db      $05 // ; =
    db      $06 // ; >
    db      $05 // ; ?
    db      $04 // ; @
    db      $04 // ; A
    db      $04 // ; B
    db      $04 // ; C
    db      $04 // ; D
    db      $04 // ; E
    db      $04 // ; F
    db      $04 // ; G
    db      $05 // ; H
    db      $03 // ; I
    db      $04 // ; J
    db      $05 // ; K
    db      $04 // ; L    
    db      $05 // ; M
    db      $05 // ; N
    db      $04 // ; O
    db      $04 // ; P
    db      $05 // ; Q
    db      $05 // ; R
    db      $04 // ; S
    db      $05 // ; T
    db      $05 // ; U
    db      $05 // ; V
    db      $05 // ; W
    db      $05 // ; X   
    db      $05 // ; Y
    db      $05 // ; Z
    db      $03 // ; [
    db      $05 // ; \
    db      $03 // ; ]
    db      $05 // ; ^
    db      $06 // ; _
    db      $02 
    db      $04 // ; a
    db      $04 // ; b
    db      $04 // ; c
    db      $04 // ; d
    db      $04 // ; e
    db      $03 // ; f
    db      $04 // ; g
    db      $04 // ; h
    db      $01 // ; i
    db      $02 // ; j
    db      $04 // ; k
    db      $01 // ; l
    db      $05 // ; m
    db      $04 // ; n
    db      $04 // ; o
    db      $04 // ; p
    db      $04 // ; q
    db      $04 // ; r
    db      $04 // ; s
    db      $03 // ; t
    db      $04 // ; u
    db      $04 // ; v
    db      $05 // ; w
    db      $05 // ; x
    db      $04 // ; y
    db      $04 // ; z
    db      $00
    db      $00
    db      $00
    db      $00
    db      $06 // ; á
    db      $05 // ; à
    db      $05 // ; ã
    db      $05 // ; é
    db      $05 // ; ê
    db      $06 // ; ó
    db      $06 // ; õ
    db      $05 // ; ç
    db      $02 // ; í
    db      $05 // ; ô
    db      $05 
    db      $05  
    db      $05 
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $05 // ; ú
    db      $00
    db      $00
    db      $05 // ; â
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
vwf_table_end:

    db $00
if (CONFIG_LANGUAGE == PORTUGUESE) {
    vwf_tilemap_1:
        dl $85408541
        dl $85428543
        dl $85448545
        dl $85468547
        dl $85488549
        dl $854A854B
        dl $854C854D
        dl $854E854F
        dl $85608561
        dl $85628563
        dl $85648565
        dl $856684E0
        dl $84E084E0
        dl $84E084E0
        dw $84E0
    vwf_tilemap_1_end:

    vwf_tilemap_2:
        dl $85508551
        dl $85528553
        dl $85548555
        dl $85568557
        dl $85588559
        dl $855A855B
        dl $855C855D
        dl $855E855F
        dl $85708571
        dl $85728573
        dl $85748575
        dl $857684E0
        dl $84E084E0
        dl $84E084E0
        dw $84E0
    vwf_tilemap_2_end:

    vwf_tilemap_3:
        dl $85688569
        dl $856A856B
        dl $856C856D
        dl $856E856F
        dl $85808581
        dl $85828583
        dl $85848585
        dl $85868587
        dl $85888589
        dl $858A858B
        dl $858C858D
        dl $858E858F
        dl $84E084E0
        dl $84E084E0
        dw $84E0
    vwf_tilemap_3_end:

    vwf_tilemap_4:
        dl $85788579
        dl $857A857B
        dl $857C857D
        dl $857E857F
        dl $85908591
        dl $85928593
        dl $85948595
        dl $85968597
        dl $85988599
        dl $859A859B
        dl $859C859D
        dl $859E859F
        dl $84E084E0
        dl $84E084E0
        dw $84E0
    vwf_tilemap_4_end:
} else {
    vwf_tilemap_1:
        dl $85208521
        dl $85228523
        dl $85248525
        dl $85268527
        dl $85288529
        dl $852A852B
        dl $852C852D
        dl $852E852F
        dl $85408541
        dl $85428543
        dl $85448545
        dl $85468547
        dl $85488549
        dl $854A854B
        dw $854C
    vwf_tilemap_1_end:

    vwf_tilemap_2:
        dl $85308531
        dl $85328533
        dl $85348535
        dl $85368537
        dl $85388539
        dl $853A853B
        dl $853C853D
        dl $853E853F
        dl $85508551
        dl $85528553
        dl $85548555
        dl $85568557
        dl $85588559
        dl $855A855B
        dw $855C
    vwf_tilemap_2_end:

    vwf_tilemap_3:
        dl $85608561
        dl $85628563
        dl $85648565
        dl $85668567
        dl $85688569
        dl $856A856B
        dl $856C856D
        dl $856E856F
        dl $85808581
        dl $85828583
        dl $85848585
        dl $85868587
        dl $85888589
        dl $858A858B
        dw $858C
    vwf_tilemap_3_end:

    vwf_tilemap_4:
        dl $85708571
        dl $85728573
        dl $85748575
        dl $85768577
        dl $85788579
        dl $857A857B
        dl $857C857D
        dl $857E857F
        dl $85908591
        dl $85928593
        dl $85948595
        dl $85968597
        dl $85988599
        dl $859A859B
        dw $859C
    vwf_tilemap_4_end:
}
db $00

// ; Localization Hacks and Resources

if (CONFIG_LANGUAGE == PORTUGUESE) {
    origin  $120000
    gfx_font_latin:
        insert "gfx/br/font.bin"
        //insert "gfx/br/font_2.bin"
    gfx_font_latin_end:

    tilemap_logo_br:
        insert "tilemap/br/logo.bin"
    tilemap_logo_br_end:

    load_menubox_latin:
        dma_copy_to_vram((gfx_font_latin+$C00), (gfx_font_latin_end-$200), ORIGINAL_FONT_RENDER+$800)
        move.w  #CONFIG_MENU_BOX_X,(BOX_POSITION_X).w                                   // ; X
        move.w  #CONFIG_MENU_BOX_Y,(BOX_POSITION_Y).w                                   // ; Y
        move.w  #CONFIG_MENU_BOX_WIDTH,(BOX_WIDTH).w                                    // ; Width
        move.w  #CONFIG_MENU_BOX_HEIGHT,(BOX_HEIGHT).w                                  // ; Height
        rts

    load_menubox_textspeed_latin:
        dma_copy_to_vram((gfx_font_latin+$C00), (gfx_font_latin_end-$200), ORIGINAL_FONT_RENDER+$800)
        move.w  #CONFIG_MENU_TEXTSPEED_BOX_X,(BOX_POSITION_X).w                         // ; X   
        move.w  #CONFIG_MENU_TEXTSPEED_BOX_Y,(BOX_POSITION_Y).w                         // ; Y
        move.w  #CONFIG_MENU_TEXTSPEED_BOX_WIDTH,(BOX_WIDTH).w                          // ; Width
        move.w  #CONFIG_MENU_TEXTSPEED_BOX_HEIGHT,(BOX_HEIGHT).w                        // ; Height
        rts

    // ; Load new font for menus
    load_gfx_font_latin:
        jsr     ($0000FCDC).l
        dma_copy_to_vram(gfx_font_latin, gfx_font_latin_end, ORIGINAL_FONT_RENDER)
        jmp 	($00001082).l
        
    // ; Load new logo
    load_gfx_logo_br:
        jsr     ($0001325E).l
        //tilecopy_to_vram(tilemap_logo_br, (tilemap_logo_br_end-tilemap_logo_br), PLANE_B)
        jmp 	($00016BDE).l

    define CONFIG_ROM_SIZE(pc())

    // ; New font Injection Point
    origin $0000107C
        jmp  load_gfx_font_latin

    // ; New logo Injection Point
    //origin $00016BD8 
    //    jmp  load_gfx_logo_br

    origin ROM_MENU_BOX_ATTRIBUTES
        jsr load_menubox_latin
        bra pc()+23

    origin ROM_MENU_TEXTSPEED_BOX_ATTRIBUTES
        jsr load_menubox_textspeed_latin
        bra pc()+23
}

eof:
