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
	
origin $B000A26F0 // ----> Endereço de onde será gravado os textos

texto_espadas_0:
	script_sword("Leather Shield") 
texto_espadas_1:
	script_sword("Small Shield")
texto_espadas_2:
	script_sword("Large Shield")
texto_espadas_3:	
	script_sword("Silver Shield")
texto_espadas_4:
	script_sword("Gold Shield")
texto_espadas_5:
	script_sword("Platinum Shield")
texto_espadas_6:
	script_sword("Gem Shield")
texto_espadas_7:
	script_sword("Sapphire Shield")
texto_espadas_8:
	script_sword("Diamond Shield")
texto_espadas_09:
	script_sword("Dragon Shield")
texto_espadas_10:
	script_sword("Magic Shield")		
texto_espadas_11:
	script_sword("Phantom Shield")		
texto_espadas_12:
	script_sword("Grizzly Shield")		
texto_espadas_13:
	script_sword("Carmine Shield")		
texto_espadas_14:
	script_sword("Royal Shield")		
texto_espadas_15:
	script_sword("Poison Shield")		
texto_espadas_16:
	script_sword("Knight Shield")


