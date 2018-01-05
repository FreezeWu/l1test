$PBExportHeader$u_cst_uso101_customvisual.sru
forward
global type u_cst_uso101_customvisual from userobject
end type
type st_1 from statictext within u_cst_uso101_customvisual
end type
end forward

global type u_cst_uso101_customvisual from userobject
integer width = 631
integer height = 120
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
end type
global u_cst_uso101_customvisual u_cst_uso101_customvisual

type variables
n_cst_uso101_autouo iuo_autouo
end variables

on u_cst_uso101_customvisual.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on u_cst_uso101_customvisual.destroy
destroy(this.st_1)
end on

type st_1 from statictext within u_cst_uso101_customvisual
integer x = 9
integer y = 24
integer width = 635
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Custom Visual Object"
boolean focusrectangle = false
end type

