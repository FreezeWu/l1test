$PBExportHeader$uo_listview.sru
forward
global type uo_listview from listview
end type
end forward

global type uo_listview from listview
integer width = 549
integer height = 476
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long largepicturemaskcolor = 536870912
long smallpicturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type
global uo_listview uo_listview

type variables
window iw
end variables

event constructor;string ls_output
iw = gf_parentwindow(this)

ls_output = this.classname( )+" constructor Triggered !"

iw.function dynamic wf_output(ls_output,true)
end event

event destructor;string ls_output
ls_output = this.classname( )+" destructor Triggered !"

iw.function dynamic wf_output(ls_output,true)
end event

on uo_listview.create
end on

on uo_listview.destroy
end on

