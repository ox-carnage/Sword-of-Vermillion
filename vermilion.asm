// **************************************************
// *      [SMD] Sword of Vermilion				    *
// *         Patch de Tradução v3.0                 *
// **************************************************
// * Tradutor: OX-Carnage                           *
// **************************************************
// * Modificações:                                  *
// *  - Textos dos Menus                            *
// *  - Textos dos Diálogos                         *
// **************************************************
// * Informações:                                   *
// *  - 30 caracteres por linha                     *
// *  - Máximo de 3 linhas por caixa de dialogo     *
// *  - A cada 3 linhas de textos, insere uma janela*
// *  - Sem limitação de próxima janela				*
// **************************************************

// Definitions
arch    md.cpu
endian  msb

// Patched Output
output  "vermilion_br.md",create

// Configuration
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
    // Original File
    insert "vermilion.md"
    
    // Includes
    include "asm/macros.asm"
    include "asm/constants.asm"

if (CONFIG_LANGUAGE == ENGLISH) {

//  include "text/en/intro.asm"
//  include "text/en/items.asm"
    include "text/en/armors.asm"
//  include "text/en/menus.asm"
    include "text/en/swords.asm"
    include "text/en/spells.asm"
    include "text/en/shields.asm"
    include "text/en/kingdom.asm"
    include "text/en/dialogues.asm"
}


if (CONFIG_LANGUAGE == PORTUGUESE) {

    define   CONFIG_ROM_NAME("VERMILION: A ESPADA DO CAVALEIRO VERMELHO       ")
    define   CONFIG_ROM_REGION("JUE")

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

// Draw Menu box
origin ROM_MENU_BOX_ATTRIBUTES
    move.w  #CONFIG_MENU_BOX_X,(BOX_POSITION_X).w                                   // X
    move.w  #CONFIG_MENU_BOX_Y,(BOX_POSITION_Y).w                                   // Y
    move.w  #CONFIG_MENU_BOX_WIDTH,(BOX_WIDTH).w                                    // Width
    move.w  #CONFIG_MENU_BOX_HEIGHT,(BOX_HEIGHT).w                                  // Height

// Clear Menu box
origin ROM_MENU_CLEAR_BOX_ATTRIBUTES
    move.w  #CONFIG_MENU_BOX_CLEAR_X,(BOX_CLEAR_POSITION_X).w                       // X
    move.w  #CONFIG_MENU_BOX_CLEAR_Y,(BOX_CLEAR_POSITION_Y).w                       // Y
    move.w  #CONFIG_MENU_BOX_CLEAR_WIDTH,(BOX_CLEAR_WIDTH).w                        // Width
    move.w  #CONFIG_MENU_BOX_CLEAR_HEIGHT,(BOX_CLEAR_HEIGHT).w                      // Height

// Draw Text Speed box
origin ROM_MENU_TEXTSPEED_BOX_ATTRIBUTES
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_X,(BOX_POSITION_X).w                         // X   
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_Y,(BOX_POSITION_Y).w                         // Y
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_WIDTH,(BOX_WIDTH).w                          // Width
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_HEIGHT,(BOX_HEIGHT).w                        // Height

// Clear Text Speed box
origin ROM_MENU_TEXTSPEED_CLEAR_BOX_ATTRIBUTES
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CLEAR_X,(BOX_CLEAR_POSITION_X).w             // X
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CLEAR_Y,(BOX_CLEAR_POSITION_Y).w             // Y
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CLEAR_WIDTH,(BOX_CLEAR_WIDTH).w              // Width
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CLEAR_HEIGHT,(BOX_CLEAR_HEIGHT).w            // Heigth

// Text Speed Box Content Alignment
origin ROM_MENU_TEXTSPEED_BOX_CONTENT_ATTRIBUTES
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CONTENT_X,(MENU_TEXTSPEED_BOX_CONTENT_X).w   // X
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CONTENT_Y,(MENU_TEXTSPEED_BOX_CONTENT_Y).w   // Y


// Draw Dialogue Box
origin ROM_DIALOGUE_BOX_ATTRIBUTES
    move.w  #CONFIG_DIALOGUE_BOX_X,(BOX_POSITION_X).w                            // X
    move.w  #CONFIG_DIALOGUE_BOX_Y,(BOX_POSITION_Y).w                            // Y
    move.w  #CONFIG_DIALOGUE_BOX_WIDTH,(BOX_WIDTH).w                             // Width
    move.w  #CONFIG_DIALOGUE_BOX_HEIGHT,(BOX_HEIGHT).w                           // Height


// VWF
if (ENABLE_VWF == 1) {
    // Injection point for VWF Reset
    origin $00010BBE
        jmp vwf_reset

    // Injection point for VWF call
    origin $00010A24
        jmp vwf_font

    // Injection point for VWF Newline
    origin $00010ABC
        jmp (vwf_add_newline).l
}

origin $100000

// VWF Newline check
vwf_add_newline:
    save_registers_to_sp()
    clr.w    d0
    move.w   (VWF_TILE_COUNT).l,d0
    cmp.w    #$600,d0                                       // If equal second line: 0x600 bytes
    ble      +
    move.w   #$A00,(VWF_TILE_COUNT).l                       // add new line to upper tile count
    move.w   #$A00,(VWF_TILE_COUNT_2).l                     // add new line to lower tile count
    move.w   #$0,(VWF_COLUMN_COUNT).l                       // reset upper vwf column count
    move.w   #$0,(VWF_COLUMN_COUNT_2).l                     // reset lower vwf column count
    bra      vwf_add_newline_end
+
    cmp.w    #$A00,d0                                       // If equal third line: 0xA00 bytes
    ble      +
    move.w   #$E00,(VWF_TILE_COUNT).l                       // add new line to upper tile count
    move.w   #$E00,(VWF_TILE_COUNT_2).l                     // add new line to lower tile count
    move.w   #$0,(VWF_COLUMN_COUNT).l                       // reset upper vwf column count
    move.w   #$0,(VWF_COLUMN_COUNT_2).l                     // reset lower vwf column count
    bra      vwf_add_newline_end
+     
    move.w   #$600,(VWF_TILE_COUNT).l                       // add new line to upper tile count
    move.w   #$600,(VWF_TILE_COUNT_2).l                     // add new line to lower tile count
    move.w   #$0,(VWF_COLUMN_COUNT).l                       // reset upper vwf column count
    move.w   #$0,(VWF_COLUMN_COUNT_2).l                     // reset lower vwf column count
vwf_add_newline_end:           
    load_registers_from_sp()
    jmp     ($00010BD8).l

// VWF reset check
vwf_reset:

    // Copy Buffer to VRAM
    dma_copy_to_vram(VWF_FONT_BUFFER, (VWF_FONT_BUFFER+$C00), VWF_FONT_RENDER)

    // Reset VWF Flags
    move.w  #$0000,(VWF_RESET_FLAG).l                       // VWF clear buffer flag
    move.w  #$0000,(VWF_TILE_COUNT).l                       // VWF upper tile count
    move.w  #$0000,(VWF_TILE_COUNT_2).l                     // VWF lower tile count
    move.w  #$0000,(VWF_COLUMN_COUNT).l                     // VWF upper column count
    move.w  #$0000,(VWF_COLUMN_COUNT_2).l                   // VWF lower column count
    move.w  #$0000,(VWF_SRC_COLUMN_COUNT).l                 // VWF upper src column count
    move.w  #$0000,(VWF_SRC_COLUMN_COUNT_2).l               // VWF lower src column count 

    // Clear Font Buffer loop 
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

// VWF Tilemap Render
vwf_font:
    move    #$FF,($9C)
    jsr     vwf_init
    save_registers_to_sp()

    // Get PLANE_B position for rows
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
    add.w   #4,d0                                           // pad 2 tiles
    add.w   #$100,d0                                        // add 2 rows
    move.l  d0,d1
    add.w   #$80,d1
    swap    d0
    swap    d1
    ori.l   #$40000003,d0
    ori.l   #$40000003,d1   

    // Draw upper tilemap for first row
    move.l  d0,(VDP_CTRL).l
    move.l  #$85208521,(VDP_DATA).l
    move.l  #$85228523,(VDP_DATA).l
    move.l  #$85248525,(VDP_DATA).l
    move.l  #$85268527,(VDP_DATA).l
    move.l  #$85288529,(VDP_DATA).l
    move.l  #$852A852B,(VDP_DATA).l
    move.l  #$852C852D,(VDP_DATA).l
    move.l  #$852E852F,(VDP_DATA).l
    move.l  #$85408541,(VDP_DATA).l
    move.l  #$85428543,(VDP_DATA).l
    move.l  #$85448545,(VDP_DATA).l
    move.l  #$85468547,(VDP_DATA).l
    move.l  #$85488549,(VDP_DATA).l
    move.l  #$854A854B,(VDP_DATA).l
    move.w  #$854C,(VDP_DATA).l

    // Draw lower tilemap for first row
    move.l  d1,(VDP_CTRL).l
    move.l  #$85308531,(VDP_DATA).l
    move.l  #$85328533,(VDP_DATA).l
    move.l  #$85348535,(VDP_DATA).l
    move.l  #$85368537,(VDP_DATA).l
    move.l  #$85388539,(VDP_DATA).l
    move.l  #$853A853B,(VDP_DATA).l
    move.l  #$853C853D,(VDP_DATA).l
    move.l  #$853E853F,(VDP_DATA).l
    move.l  #$85508551,(VDP_DATA).l
    move.l  #$85528553,(VDP_DATA).l
    move.l  #$85548555,(VDP_DATA).l
    move.l  #$85568557,(VDP_DATA).l
    move.l  #$85588559,(VDP_DATA).l
    move.l  #$855A855B,(VDP_DATA).l
    move.w  #$855C,(VDP_DATA).l

    // Draw upper tilemap for second row
    add.l   #$01000000,d0  
    move.l  d0,(VDP_CTRL).l
    move.l  #$85608561,(VDP_DATA).l
    move.l  #$85628563,(VDP_DATA).l
    move.l  #$85648565,(VDP_DATA).l
    move.l  #$85668567,(VDP_DATA).l
    move.l  #$85688569,(VDP_DATA).l
    move.l  #$856A856B,(VDP_DATA).l
    move.l  #$856C856D,(VDP_DATA).l
    move.l  #$856E856F,(VDP_DATA).l
    move.l  #$85808581,(VDP_DATA).l
    move.l  #$85828583,(VDP_DATA).l
    move.l  #$85848585,(VDP_DATA).l
    move.l  #$85868587,(VDP_DATA).l
    move.l  #$85888589,(VDP_DATA).l
    move.l  #$858A858B,(VDP_DATA).l

    // Draw lower tilemap for second row
    add.l   #$01000000,d1
    move.l  d1,(VDP_CTRL).l
    move.l  #$85708571,(VDP_DATA).l
    move.l  #$85728573,(VDP_DATA).l
    move.l  #$85748575,(VDP_DATA).l
    move.l  #$85768577,(VDP_DATA).l
    move.l  #$85788579,(VDP_DATA).l
    move.l  #$857A857B,(VDP_DATA).l
    move.l  #$857C857D,(VDP_DATA).l
    move.l  #$857E857F,(VDP_DATA).l
    move.l  #$85908591,(VDP_DATA).l
    move.l  #$85928593,(VDP_DATA).l
    move.l  #$85948595,(VDP_DATA).l
    move.l  #$85968597,(VDP_DATA).l
    move.l  #$85988599,(VDP_DATA).l
    move.l  #$859A859B,(VDP_DATA).l

    load_registers_from_sp()
    jmp     $10A6A


// VWF Main Routine
vwf_init:
    save_registers_to_sp()

vwf_continue:
    cmp.w   #1,(VWF_RESET_FLAG).l                           // Check VWF reset flag
    beq     vwf_skip_reset_buffer                           // skip if setted
    move.w  #$0001,(VWF_RESET_FLAG).l                       // if not setted presume it's first tile
                                                            // so prepare for draw
    lea     (VWF_FONT_BUFFER),a1                            // get VWF buffer location
    move.w  #$1000,d1                                       // set buffer size
-                                                           // start clear loop
    move.b  #$33,(a1)+
    dbf     d1,-

vwf_skip_reset_buffer:
    lea     (VWF_FONT_BUFFER).l,a1                          // get VWF buffer location

vwf_get_char_id:
    clr.l   d3                                              // clear Char ID
    dl      $16302000                                       // copy Char ID to d3
    clr.l   d1
    move.b  d3,d1                                           
    lea     (gfx_vwf_font).l,a0                             // get VWF font src location


vwf_get_char_width:
    lea     (vwf_table).l,a4                                // get VWF width tbl location
    adda.w  d1,a4                                           // set VWF width tbl at char position
    move.b  (a4),d4                                         // get Char Width
    move.b  (a4),(VWF_CHAR_WIDTH)                           // get Char Width and save on VAR

vwf_get_char_tile:
    mulu.w  #64,d1                                          // Multiple by 2 tiles
    adda.w  d1,a0                                           // Add multiplied char ID
                                                            // to VWF vwf src location
                                                            // now can copy tiles of char

// Start Char tile draw
vwf_draw_char_on_buffer:

// Copy Upper Tile to VWF Font Buffer
vwf_draw_char_upper:
    tilecopy_by_column(vwf_draw_char_upper, VWF_COLUMN_COUNT, VWF_TILE_COUNT, VWF_SRC_COLUMN_COUNT)
    clr.l   d4
    move.b  (a4),d4                                         // get Char Width saved on VAR
    adda.l  #$20,a0                                         // increment a tile
    adda.l  #$200,a1                                        // increment a row
// Copy Lower Tile to VWF Font Buffer
vwf_draw_char_lower:
    tilecopy_by_column(vwf_draw_char_lower, VWF_COLUMN_COUNT_2, VWF_TILE_COUNT_2, VWF_SRC_COLUMN_COUNT_2)
    suba.l  #$200,a1                                        // decrement a row

vwf_end:
    load_registers_from_sp()

    // At finish
    // Copy all buffer to font render location on VRAM
    dma_copy_to_vram(VWF_FONT_BUFFER, (VWF_FONT_BUFFER+$1000), VWF_FONT_RENDER)

    rts

vwf_skip:
    rts

// VWF Font GFX
gfx_vwf_font:
    insert  "gfx/vwf/font_16x8_4bpp.bin"
gfx_vwf_font_end:

// VWF Char Width Table
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
    db      $02 // SPACE
    db      $03 // !
    db      $03 // "
    db      $07 // #
    db      $05 // $
    db      $07 // %
    db      $05 // &
    db      $01 // '
    db      $03 // (
    db      $03 // )
    db      $03 // *
    db      $05 // +
    db      $03 // ,
    db      $05 // -
    db      $02 // .
    db      $04 // /
    db      $04 // 0
    db      $03 // 1
    db      $04 // 2
    db      $04 // 3
    db      $04 // 4
    db      $04 // 5
    db      $04 // 6
    db      $04 // 7
    db      $04 // 8
    db      $04 // 9
    db      $01 // :
    db      $02 // ;
    db      $06 // <
    db      $05 // =
    db      $06 // >
    db      $05 // ?
    db      $04 // @
    db      $04 // A
    db      $04 // B
    db      $04 // C
    db      $04 // D
    db      $04 // E
    db      $04 // F
    db      $04 // G
    db      $05 // H
    db      $03 // I
    db      $04 // J
    db      $05 // K
    db      $04 // L    
    db      $05 // M
    db      $05 // N
    db      $04 // O
    db      $04 // P
    db      $05 // Q
    db      $05 // R
    db      $04 // S
    db      $05 // T
    db      $05 // U
    db      $05 // V
    db      $05 // W
    db      $05 // X   
    db      $05 // Y
    db      $05 // Z
    db      $03 // [
    db      $05 // \
    db      $03 // ]
    db      $05 // ^
    db      $06 // _
    db      $02 
    db      $04 // a
    db      $04 // b
    db      $04 // c
    db      $04 // d
    db      $04 // e
    db      $03 // f
    db      $04 // g
    db      $04 // h
    db      $01 // i
    db      $02 // j
    db      $04 // k
    db      $01 // l
    db      $05 // m
    db      $04 // n
    db      $04 // o
    db      $04 // p
    db      $04 // q
    db      $04 // r
    db      $04 // s
    db      $03 // t
    db      $04 // u
    db      $04 // v
    db      $05 // w
    db      $05 // x
    db      $04 // y
    db      $04 // z
    db      $00
    db      $00
    db      $00
    db      $00
    db      $06 // á
    db      $05 // à
    db      $05 // ã
    db      $05 // é
    db      $05 // ê
    db      $06 // ó
    db      $06 // õ
    db      $05 // ç
    db      $02 // í
    db      $05 // ô
    db      $05 
    db      $05  
    db      $05 
    db      $00
    db      $00
    db      $00
    db      $00
    db      $00
    db      $05 // ú
    db      $00
    db      $00
    db      $05 // â
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

// Localization Hacks and Resources

if (CONFIG_LANGUAGE == PORTUGUESE) {
    origin  $180000
    gfx_font_latin:
        insert "gfx/br/font.bin"
        //insert "gfx/br/font_2.bin"
    gfx_font_latin_end:

    tilemap_logo_br:
        insert "tilemap/br/logo.bin"
    tilemap_logo_br_end:

    // Load new font for menus
    load_gfx_font_latin:
        jsr     ($0000FCDC).l
        dma_copy_to_vram(gfx_font_latin, gfx_font_latin_end, ORIGINAL_FONT_RENDER)
        jmp 	($00001082).l
        
    // Load new logo
    load_gfx_logo_br:
        jsr     ($0001325E).l
        //tilecopy_to_vram(tilemap_logo_br, (tilemap_logo_br_end-tilemap_logo_br), PLANE_B)
        jmp 	($00016BDE).l

    define CONFIG_ROM_SIZE(pc())

    // New font Injection Point
    //origin $0000107C
    //    jmp  load_gfx_font_latin

    // New logo Injection Point
    origin $00016BD8 
        jmp  load_gfx_logo_br
}

eof:
