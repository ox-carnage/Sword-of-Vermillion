// **************************************************
// *      [SMD] Sword of Vermilion				    *
// *         Patch de Tradução v3.                 *
// **************************************************
// * Tradutor: OX-Carnage                           *
// **************************************************
// * Modificações:                                  *
// *  - Textos dos Itens                            *
// ***************************************************
// * Informações:                                    *
// *  - 3 caracteres por linha                      *
// *  - Máximo de 3 linhas por caixa de dialogo      *
// *  - A cada 3 linhas de textos, insere uma janela *
// *  - Sem limitação de próxima janela				 *
// ***************************************************

	include "data/asm/macros.asm"
	include "data/asm/ponteiros.asm"
	table	"tabela/vermillion_tabela.tbl"
	
origin $B000A02B1 // ----> Endereço de onde será gravado os textos

texto_escudos_0:
	script_shield("Leather Shield") 
texto_escudos_1:
	script_shield("Small Shield")
texto_escudos_2:
	script_shield("Large Shield")
texto_escudos_3:	
	script_shield("Silver Shield")
texto_escudos_4:
	script_shield("Gold Shield")
texto_escudos_5:
	script_shield("Platinum Shield")
texto_escudos_6:
	script_shield("Gem Shield")
texto_escudos_7:
	script_shield("Sapphire Shield")
texto_escudos_8:
	script_shield("Diamond Shield")
texto_escudos_09:
	script_shield("Dragon Shield")
texto_escudos_10:
	script_shield("Magic Shield")		
texto_escudos_11:
	script_shield("Phantom Shield")		
texto_escudos_12:
	script_shield("Grizzly Shield")		
texto_escudos_13:
	script_shield("Carmine Shield")		
texto_escudos_14:
	script_shield("Royal Shield")		
texto_escudos_15:
	script_shield("Poison Shield")		
texto_escudos_16:
	script_shield("Knight Shield")


