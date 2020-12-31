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

define   CONFIG_ROM_NAME("SWORD OF VERMILION                              ")
define   CONFIG_ROM_REGION("U")
define   CONFIG_ROM_SIZE(new_end)

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


if (CONFIG_LANGUAGE == PORTUGUESE) {    
    origin ROM_END 

    define   CONFIG_ROM_NAME("VERMILION: A ESPADA DO CAVALEIRO VERMELHO       ")
    define   CONFIG_ROM_REGION("JUE")

    constant CONFIG_MENU_BOX_X($02)
    constant CONFIG_MENU_BOX_Y($02)
    constant CONFIG_MENU_BOX_WIDTH($0F)
    constant CONFIG_MENU_BOX_HEIGHT($0A)

    constant CONFIG_MENU_BOX_CLEAR_X(CONFIG_MENU_BOX_X)
    constant CONFIG_MENU_BOX_CLEAR_Y(CONFIG_MENU_BOX_Y)
    constant CONFIG_MENU_BOX_CLEAR_WIDTH(CONFIG_MENU_BOX_WIDTH)
    constant CONFIG_MENU_BOX_CLEAR_HEIGHT(CONFIG_MENU_BOX_HEIGHT)

    gfx_font_latin:
        insert "gfx/br/font.bin"
    gfx_font_latin_end:

    tilemap_logo_br:
        insert "tilemap/br/logo.bin"
    tilemap_logo_br_end:
    
    load_gfx_font_latin:
        jsr     ($0000FCDC).l   
        tilecopy_to_vram(gfx_font_latin, (gfx_font_latin_end-gfx_font_latin), ORIGINAL_FONT_RENDER)
        jmp 	($00001082).l
        
    load_gfx_logo_br:
        jsr     ($0001325E).l
        //tilecopy_to_vram(tilemap_logo_br, (tilemap_logo_br_end-tilemap_logo_br), PLANE_B)
        jmp 	($00016BDE).l


    // New Branchs
    origin $0000107C
        jmp  load_gfx_font_latin

    origin $00016BD8 
        jmp  load_gfx_logo_br
    
}

origin $00000150
    db {CONFIG_ROM_NAME}

origin $000001A4
    dl {CONFIG_ROM_SIZE}

origin $000001F0
    db {CONFIG_ROM_REGION}

// Draw Menu box
origin ROM_MENU_BOX_ATTRIBUTES
    move.w  #CONFIG_MENU_BOX_X,(MENU_BOX_POSITION_X).w                              // X
    move.w  #CONFIG_MENU_BOX_Y,(MENU_BOX_POSITION_Y).w                              // Y
    move.w  #CONFIG_MENU_BOX_WIDTH,(MENU_BOX_WIDTH).w                               // Width
    move.w  #CONFIG_MENU_BOX_HEIGHT,(MENU_BOX_HEIGHT).w                             // Height

// Clear Menu box
origin ROM_MENU_CLEAR_BOX_ATTRIBUTES
    move.w  #CONFIG_MENU_BOX_CLEAR_X,(MENU_BOX_CLEAR_POSITION_X).w                  // X
    move.w  #CONFIG_MENU_BOX_CLEAR_Y,(MENU_BOX_CLEAR_POSITION_Y).w                  // Y
    move.w  #CONFIG_MENU_BOX_CLEAR_WIDTH,(MENU_BOX_CLEAR_WIDTH).w                   // Width
    move.w  #CONFIG_MENU_BOX_CLEAR_HEIGHT,(MENU_BOX_CLEAR_HEIGHT).w                 // Height

// Draw Text Speed box
origin ROM_MENU_TEXTSPEED_BOX_ATTRIBUTES
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_X,(MENU_BOX_POSITION_X).w                    // X   
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_Y,(MENU_BOX_POSITION_Y).w                    // Y
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_WIDTH,(MENU_BOX_WIDTH).w                     // Width
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_HEIGHT,(MENU_BOX_HEIGHT).w                   // Height

// Clear Text Speed box
origin ROM_MENU_TEXTSPEED_CLEAR_BOX_ATTRIBUTES
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CLEAR_X,(MENU_BOX_CLEAR_POSITION_X).w        // X
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CLEAR_Y,(MENU_BOX_CLEAR_POSITION_Y).w        // Y
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CLEAR_WIDTH,(MENU_BOX_CLEAR_WIDTH).w         // Width
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CLEAR_HEIGHT,(MENU_BOX_CLEAR_HEIGHT).w       // Heigth

// Text Speed Box Content Alignment
origin ROM_MENU_TEXTSPEED_BOX_CONTENT_ATTRIBUTES
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CONTENT_X,(MENU_TEXTSPEED_BOX_CONTENT_X).w   // X
    move.w  #CONFIG_MENU_TEXTSPEED_BOX_CONTENT_Y,(MENU_TEXTSPEED_BOX_CONTENT_Y).w   // Y

new_end:
