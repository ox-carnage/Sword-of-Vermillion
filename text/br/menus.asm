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
    menu_text("INICIAR"           )
	menu_text("CONTINUAR"			)					
	end()
	
text_menu_02:
    menu_text("FALAR MAGIA"				)
	menu_text("ITEM  EQUIPAR"				)
	menu_text("HEROI OLHAR"				)
	menu_text("ABRIR PEGAR"				)
	end()
text_menu_03:
    db "  VELOCIDADE ",$E5,$E3," DOS DIALOGOS"
	db BREAKLINE
	db "             ",$E5,$E3,"     RAPIDO"
	db BREAKLINE	
	db "             ",$E5,$E3,"     NORMAL"
	db BREAKLINE		
	db "             ",$E5,$E3,"     LENTO"		
	end()
text_menu_04:
	menu_text("SIM"					)
	menu_text("NAO"					)
	end()
text_menu_05:
    menu_text("USAR"					)
	menu_text("DESCARTAR"				)
	end()
text_menu_06:
    menu_text("LANCAR"				)
	menu_text("PREPARAR"				)
	menu_text("DESCARTAR"				)
	end()
text_menu_07:
    menu_text("COLOCAR"				)
	menu_text("REMOVER"				)
	menu_text("SAIR"					)
	end()
text_menu_08:
	menu_text("ARMA"					)
	menu_text("ESCUDO"				)
	menu_text("ARMADURA"				)	
	end()
text_menu_09:
	menu_text("REMOVER MALDICAO"	)
	menu_text("APLICAR BALSAMO")
	menu_text("SALVAR "	)
	menu_text("SAIR"					)
	end()
text_menu_10:
	menu_text("COMPRAR"				)
	menu_text("VENDER"				)
	menu_text("SAIR"					)
	end()
text_menu_11:
	menu_text("KIM"					)
	end()
text_menu_12:
    menu_text("NOME:"					)
	menu_text("CONDICAO:"				)
	menu_text("NIVEL:       EXP:"		)
	menu_text("PROXIMO NIVEL EXP:"	)
	menu_text("PV:          MPV:"		)
	menu_text("PM:          MPM:"		)
	menu_text("FRC:          AC:"		)
	menu_text("INT:         DEX:"		)
	menu_text("SOT:         KIM:"		)
	end()
text_menu_13:
	menu_text("PREPARAR EQUIPAMENTO"	)
	menu_text("ARMA:"					)
	menu_text("ESCUDO:"				)
	menu_text("ARMADURA:"				)
	menu_text("MAGIA:"				)
	end()
text_menu_14:
	menu_text("EQUIPAMENTO (COMBATE)")
	end()
text_menu_15:
	menu_text("EQUIPAMENTO (MAGICO)")
	end()
text_menu_16:
	menu_text("EQUIPAMENTO (ITEM)")
	end()
text_menu_17:
	menu_text("ANEIS")
	end()