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

// Sistema de Ordenação dos Bytes
arch md.cpu
endian msb

// ROM Patcheada
output "Sword of Vermillion (BR) [!] V3.0.bin",create
// ROM Original
origin $0000000
insert "Sword of Vermilion (UE) [!].gen"
  
    table   "tabela/geral.tbl"
    include "asm/macros.asm"
  	include "asm/constants.asm"
    include "asm/ponteiros.asm"

//Desenha caixa do menu
origin $00010C9E
    move.w  #2,($FF9902).w       // Posição X
    move.w  #2,($FF9908).w       // Posição Y
    move.w  #$F,($FF9904).w      // Largura da caixa do menu
    move.w  #$A,($FF990A).w      // Altura da caixa do menu

//Limpa caixa do menu
origin $000120CA
    move.w  #2,($FFC220).w       // Posição X
    move.w  #2,($FFC222).w       // Posição Y
    move.w  #$F,($FFC228).w      // Largura da caixa do menu
    move.w  #$A,($FFC22A).w      // Altura da caixa do menu


//Desenha caixa do menu "Velocidade dos dialogos"
origin $00010CE2
    move.w  #$A,($FF9902).w     // Posição X   
    move.w  #$A,($FF9908).w     // Posição Y
    move.w  #$E,($FF9904).w     // Largura da caixa do menu
    move.w  #$A,($FF990A).w     // Altura da caixa do menu

//Limpa caixa do menu "Velocidade dos dialogos"
origin $000120A8
    move.w  #$A,($FFC220).w
    move.w  #$A,($FFC222).w
    move.w  #$E,($FFC228).w
    move.w  #$A,($FFC22A).w

//Alinhamento conteudo Menu velocidade dos dialogos
origin $00010D0A
    move.w  #1,($FF9906).w      //Posição X
    move.w  #1,($FF990C).w      //Posição Y



if (traducao) {  
    include "text_br/intro.asm"
    include "text_br/itens.asm"
    include "text_br/armaduras.asm"
    include "text_br/menus.asm"
    include "text_br/espadas.asm"
    include "text_br/escudos.asm"
    include "text_br/magias.asm"
    include "text_br/reinos.asm"
    include "text_br/dialogos.asm"
    
} else {
   // include "text/intro.asm"
   // include "text/itens.asm"
    include "text/armor.asm"
   // include "text/menus.asm"
    include "text/swords.asm"
    include "text/spells.asm"
    include "text/shields.asm"
    include "text/kingdom.asm"
    include "text/dialogos.asm"
}
   
origin $00016BD8 
   jmp  new_tilemap_logo
if (fonte_acentuada) {

origin $0000107C 
    desvio_1:
        jmp     new_fonte

    origin $000A55D5  // ---> Endreço da rom expandida

    
    new_fonte:
        jsr     $0000FCDC   
        tilecopy_to_vram(gfx_new_font, (gfx_new_font_end-gfx_new_font), font_original_vram)
        jmp 	$00001082
        

    gfx_new_font:
        insert "gfx/font.bin"
    gfx_new_font_end:
}

    new_tilemap_logo:
        jsr     $1325E
        tilecopy_to_vram(tilemap_logo, (tilemap_logo_end-tilemap_logo), $C000)
        jmp 	$16BDE

    tilemap_logo:
        insert "gfx/logo.bin"
    tilemap_logo_end:



