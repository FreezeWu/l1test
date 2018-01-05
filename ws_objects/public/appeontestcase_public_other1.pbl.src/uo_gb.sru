$PBExportHeader$uo_gb.sru
forward
global type uo_gb from groupbox
end type
end forward

global type uo_gb from groupbox
integer width = 1161
integer height = 676
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test"
end type
global uo_gb uo_gb

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

on uo_gb.create
end on

on uo_gb.destroy
end on

