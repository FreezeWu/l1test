$PBExportHeader$u_cst_l3.sru
forward
global type u_cst_l3 from u_cst_l2
end type
type cb_1 from commandbutton within tabpage_1
end type
end forward

global type u_cst_l3 from u_cst_l2
end type
global u_cst_l3 u_cst_l3

on u_cst_l3.create
int iCurrent
call super::create
end on

on u_cst_l3.destroy
call super::destroy
end on

type tab_1 from u_cst_l2`tab_1 within u_cst_l3
end type

type tabpage_1 from u_cst_l2`tabpage_1 within tab_1
cb_1 cb_1
end type

on tabpage_1.create
this.cb_1=create cb_1
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on tabpage_1.destroy
call super::destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within tabpage_1
integer x = 206
integer y = 80
integer width = 457
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "cb_1"
end type

