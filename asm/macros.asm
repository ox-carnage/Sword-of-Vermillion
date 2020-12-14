//Macros de controle

macro script_itens(TEXT) {
  db {TEXT}
  final_script()
  }
macro script_armory(TEXT) {
  db {TEXT}
  final_script()
}
macro script_shield(TEXT) {
  db {TEXT}
  final_script()
}
macro script_sword(TEXT) {
  db {TEXT}
  final_script()
}
macro script_jogo(TEXT) {
  db {TEXT}
  final_script()
  db NULL
}
macro script_intro(TEXT) {
  db {TEXT}
  quebra_linha()
  
 }
macro script_menu(TEXT) {
  db {TEXT}
  quebra_linha()
 }
macro final_script() {
  db ENDSTRING
}
macro quebra_linha() {
  db BREAKLINE
}


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