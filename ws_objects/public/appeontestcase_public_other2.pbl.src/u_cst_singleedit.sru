$PBExportHeader$u_cst_singleedit.sru
forward
global type u_cst_singleedit from userobject
end type
type sle_1 from singlelineedit within u_cst_singleedit
end type
end forward

global type u_cst_singleedit from userobject
integer width = 361
integer height = 108
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
sle_1 sle_1
end type
global u_cst_singleedit u_cst_singleedit

on u_cst_singleedit.create
this.sle_1=create sle_1
this.Control[]={this.sle_1}
end on

on u_cst_singleedit.destroy
destroy(this.sle_1)
end on

type sle_1 from singlelineedit within u_cst_singleedit
integer width = 357
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "sle_1"
borderstyle borderstyle = stylelowered!
end type

