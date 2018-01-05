$PBExportHeader$u_cst_1.sru
forward
global type u_cst_1 from userobject
end type
type dw_1 from datawindow within u_cst_1
end type
type cb_1 from commandbutton within u_cst_1
end type
end forward

global type u_cst_1 from userobject
integer width = 974
integer height = 584
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_1 dw_1
cb_1 cb_1
end type
global u_cst_1 u_cst_1

type variables


String	is_temp

end variables

on u_cst_1.create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_1}
end on

on u_cst_1.destroy
destroy(this.dw_1)
destroy(this.cb_1)
end on

type dw_1 from datawindow within u_cst_1
integer x = 14
integer y = 160
integer width = 928
integer height = 400
integer taborder = 20
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within u_cst_1
integer x = 9
integer y = 8
integer width = 457
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "cb_1"
end type

