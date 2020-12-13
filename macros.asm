// **************************************************
// *      [SMD] Sword of Vermilion				    *
// *         Patch de Tradução v3.0                 *
// **************************************************
// * Tradutor: OX-Carnage                           *
// **************************************************
// * Macros: 	                                    *
// *  - Textos dos Menus                            *
// *  - Textos dos Diálogos  						*
// *  - Textos dos Itens                            *
// **************************************************

  
macro script_itens(TEXT) {
  db {TEXT}
  db NEWPAGE
}
macro script_jogo(TEXT) {
  db {TEXT}
  db ENDSTRING
  db NULL
}
macro script_intro(TEXT) {
  db {TEXT}
  db BREAKLINE
 }
macro script_menu(TEXT) {
  db {TEXT}
  db BREAKLINE
 }
macro final_script() {
  db NEWPAGE
}
macro quebra_linha() {
  db BREAKLINE
}