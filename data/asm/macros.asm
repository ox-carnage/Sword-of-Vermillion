//Macros de controle

macro script_itens(TEXT) {
  db {TEXT}
  db NEWPAGE
}
macro script_armory(TEXT) {
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
