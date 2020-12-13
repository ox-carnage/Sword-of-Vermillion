// **************************************************
// *      [SMD] Sword of Vermilion				    *
// *         Patch de Tradução v3.0                 *
// **************************************************
// * Tradutor: OX-Carnage                           *
// **************************************************
// * Modificações:                                  *
// *  - Textos dos Itens                            *
// ***************************************************
// * Informações:                                    *
// *  - 30 caracteres por linha                      *
// *  - Máximo de 3 linhas por caixa de dialogo      *
// *  - A cada 3 linhas de textos, insere uma janela *
// *  - Sem limitação de próxima janela				 *
// ***************************************************

	include "data/asm/macros.asm"
	include "data/asm/ponteiros.asm"
	table	"tabela/vermillion_tabela.tbl"
	
origin $000A02B1  // ----> Endereço de onde será gravado os textos

texto_itens_01:
	script_itens("Leather Armor") 
texto_itens_02:
	script_itens("Bronze Armor")
texto_itens_03:
	script_itens("Metal Armor")
texto_itens_04:	
	script_itens("Scale Armor")
texto_itens_05:
	script_itens("Plate Armor")
texto_itens_06:
	script_itens("Silver Armor")
texto_itens_07:
	script_itens("Gold Armor")
texto_itens_08:
	script_itens("Crystal Armor")
texto_itens_09:
	script_itens("Emerald Armor")
texto_itens_10:
	script_itens("Diamond Armor")
texto_itens_11:
	script_itens("Knight Armor")		
texto_itens_12:
	script_itens("Ultimate Armor")		
texto_itens_13:
	script_itens("Odin Armor")		
texto_itens_14:
	script_itens("Secret Armor")		
texto_itens_15:
	script_itens("Skeleton Armor")		
texto_itens_16:
	script_itens("Crimson Armor")		
texto_itens_17:
	script_itens("Old Nick Armor")


