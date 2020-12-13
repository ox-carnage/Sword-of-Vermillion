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
    include "intro.asm"
    include "itens.asm"
    include "menus.asm"
    include "macros.asm"
    include "ponteiros.asm"
	include "constants.asm"

constant font_original_vram($9C00)
constant font_original_ram($FFA400)
constant VDP_DATA($C00000)
constant VDP_CTRL($C00004)
constant M68K_RAM($FF0000)

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
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #1
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #2
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #3
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #4
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #5
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #6
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #7
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #8
    dbf     d0,-

    load_registers_from_sp()
}
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