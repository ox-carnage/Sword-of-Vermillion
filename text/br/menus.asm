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
    menu_text("Iniciar"           )
	menu_text("Continuar"			)					
	end()
	
text_menu_02:
    menu_text("Falar Magia"				)
	menu_text("Item  Equipar"				)
	menu_text("Str   Olhar"				)
	menu_text("Abrir Pegar"				)
	end()
text_menu_03:
    db "  Velocidade ",$E5,$E3," dos Diálogos"
	db BREAKLINE
	db "             ",$E5,$E3,"     Rápido"
	db BREAKLINE	
	db "             ",$E5,$E3,"     Normal"
	db BREAKLINE		
	db "             ",$E5,$E3,"     Lento"		
	end()
text_menu_04:
	menu_text("Sim"					)
	menu_text("Não"					)
	end()
text_menu_05:
    menu_text("Usar"					)
	menu_text("Descartar"				)
	end()
text_menu_06:
    menu_text("Lançar"				)
	menu_text("Preparar"				)
	menu_text("Descartar"				)
	end()
text_menu_07:
    menu_text("Colocar"				)
	menu_text("Remover"				)
	menu_text("Sair"					)
	end()
text_menu_08:
	menu_text("Arma"					)
	menu_text("Escudo"				)
	menu_text("Armadura"				)	
	end()
text_menu_09:
	menu_text("Remover uma maldição"	)
	menu_text("Aplicar veneno bálsamo")
	menu_text("Salvar o seu menu "	)
	menu_text("Sair"					)
	end()
text_menu_10:
	menu_text("Comprar"				)
	menu_text("Vender"				)
	menu_text("Sair"					)
	end()
text_menu_11:
	menu_text("Kim"					)
	end()
text_menu_12:
    menu_text("Nome:"					)
	menu_text("Condição:"				)
	menu_text("Nível:       EXP:"		)
	menu_text("Próximo nível EXP:"	)
	menu_text("PV:          MPV:"		)
	menu_text("PM:          MPM:"		)
	menu_text("FRÇ:          AC:"		)
	menu_text("INT:         DEX:"		)
	menu_text("SOT:         KIM:"		)
	end()
text_menu_13:
	menu_text("Preparar Equipamento"	)
	menu_text("Arma:"					)
	menu_text("Escudo:"				)
	menu_text("Armadura:"				)
	menu_text("Magia:"				)
	end()
text_menu_14:
	menu_text("Equipamento (Combate)")
	end()
text_menu_15:
	menu_text("Equipamento (Mágico)")
	end()
text_menu_16:
	menu_text("Equipamento (Item)")
	end()
text_menu_17:
	menu_text("Anéis")
	end()