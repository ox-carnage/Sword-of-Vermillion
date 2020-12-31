// **************************************************
// *      [SMD] Sword of Vermilion				    *
// *         Patch de Tradução v3.0                 *
// **************************************************
// * Tradutor: OX-Carnage                           *
// **************************************************
// * Modificações:                                  *
// *  - Textos dos tMenus                           *
// ***************************************************
// * Informações:                                    *
// *  - 30 caracteres por linha                      *
// *  - Máximo de 3 linhas por caixa de dialogo      *
// *  - A cada 3 linhas de textos, insere uma janela *
// *  - Sem limitação de próxima janela				 *
// ***************************************************



origin $000A07E1 // ----> Endereço de onde será gravado os textos

text_menu_01:
    menu_text("Start"         	)
	menu_text("Continue"		  	)					
	end()
	
text_menu_02:
    menu_text("Talk Magic"		)
	menu_text("Item Equip"		)
	menu_text("Str  Seek"			)
	menu_text("Open Take"			)
	end()
	
text_menu_03:
    menu_text("Message Speed"		)
	menu_text("     Fast"			)
	menu_text("     Normal"		)
	menu_text("     Slow"			)
	end()
// Expanded menu box if you need to use in another language
; ; text_menu_03:
; ;     db "  Message ",$E5,$E3," Speed"
; ; 	db BREAKLINE
; ; 	db "             ",$E5,$E3,"     Fast"
; ; 	db BREAKLINE	
; ; 	db "             ",$E5,$E3,"     Normal"
; ; 	db BREAKLINE		
; ; 	db "             ",$E5,$E3,"     Slow"		
; ; 	end()

text_menu_04:
	menu_text("Yes"				)
	menu_text("No"				)
	end()

text_menu_05:
    menu_text("Use"				)
	menu_text("Discard"			)
	end()
text_menu_06:
    menu_text("Use"				)
	menu_text("Cast"				)
	menu_text("Read"				)
	end()
text_menu_07:
    menu_text("Put on"			)
	menu_text("Remove"			)
	menu_text("Stop"				)
	end()
text_menu_08:
	menu_text("Weapon"			)
	menu_text("Shield"			)
	menu_text("Armor"				)	
	end()
text_menu_09:
	menu_text("Remove a curse"	)
	menu_text("Apply poison balm"	)
	menu_text("Save your game"	)
	menu_text("Stop"				)
	end()
text_menu_10:
	menu_text("Buy"				)
	menu_text("Sell"				)
	menu_text("Stop"				)
	end()
	
text_menu_11:
	menu_text("Kim"				)
	end()
text_menu_12:
    menu_text("Name:"				)
	menu_text("þCondition:"		)
	menu_text("Level:       EXP:"	)
	menu_text("Next level EXP:"	)
	menu_text("HP:          MHP:"	)
	menu_text("MP:          MMP:"	)
	menu_text("STR:         AC:"	)
	menu_text("INT:         DEX:"	)
	menu_text("LUK:         KIM:"	)
	end()
text_menu_13:
	menu_text("Equipment Readied"	)
	menu_text("Weapon:"			)
	menu_text("Shield:"			)
	menu_text("Armor:"			)
	menu_text("Magic:"			)
	end()
text_menu_14:
	menu_text("Gear (Combat)"		)
text_menu_15:
	menu_text("Gear (Magic)"		)

text_menu_16:
	menu_text("Gear (Item)"		)
text_menu_17:
	menu_text("Rings"				)





