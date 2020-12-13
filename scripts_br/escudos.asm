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

texto_armadura_1:
	script_armory("Leather Armor") 
texto_armadura_2:
	script_armory("Bronze Armor")
texto_armadura_3:
	script_armory("Metal Armor")
texto_armadura_4:	
	script_armory("Scale Armor")
texto_armadura_5:
	script_armory("Plate Armor")
texto_armadura_6:
	script_armory("Silver Armor")
texto_armadura_7:
	script_armory("Gold Armor")
texto_armadura_8:
	script_armory("Crystal Armor")
texto_armadura_9:
	script_armory("Emerald Armor")
texto_armadura_10:
	script_armory("Diamond Armor")
texto_armadura_11:
	script_armory("Knight Armor")		
texto_armadura_12:
	script_armory("Ultimate Armor")		
texto_armadura_13:
	script_armory("Odin Armor")		
texto_armadura_14:
	script_armory("Secret Armor")		
texto_armadura_15:
	script_armory("Skeleton Armor")		
texto_armadura_16:
	script_armory("Crimson Armor")		
texto_armadura_17:
	script_armory("Old Nick Armor")


