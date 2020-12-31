// System Macros
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

// Control Macros
macro text(TEXT) {
    table "tbl/global.tbl"
    db {TEXT}
    end()
}
macro intro_text(TEXT) {
    table "tbl/global.tbl"
    db {TEXT}
    break_line()
}
macro menu_text(TEXT) {
    table "tbl/global.tbl"
    db {TEXT}
    break_line()
 }
macro dialogue_text(TEXT) {
    table "tbl/global.tbl
    db {TEXT}
    break_line()
 }
macro end() {
    db ENDSTRING
}
macro break_line() {
    db BREAKLINE
}
macro new_page() {
    db NEWPAGE
}
macro align() {
    db NULL
}