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
  
    table "tabela/geral.tbl"
    include "asm/macros.asm"
  	include "asm/constants.asm"
    include "text_br/intro.asm"
    include "text_br/itens.asm"
    include "text_br/armory.asm"
    include "text_br/menus.asm"
    include "text_br/swords.asm"

    


origin $0000107C 
desvio_1:
	jmp     new_fonte

origin $00100000
new_fonte:
	jsr     $0000FCDC   
	tilecopy_to_vram(gfx_new_font, (gfx_new_font_end-gfx_new_font), font_original_vram)
	jmp 	$00001082
	
	
gfx_new_font:
	insert "gfx/font.bin"
gfx_new_font_end: