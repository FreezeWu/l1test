$PBExportHeader$uo_em.sru
forward
global type uo_em from editmask
end type
end forward

global type uo_em from editmask
integer width = 457
integer height = 132
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type
global uo_em uo_em

type variables
window iw
end variables

on uo_em.create
end on

on uo_em.destroy
end on

event constructor;string ls_output
iw = gf_parentwindow(this)

ls_output = this.classname( )+" constructor Triggered !"

iw.function dynamic wf_output(ls_output,true)
end event

event destructor;string ls_output

ls_output = this.classname( )+" destructor Triggered !"

iw.function dynamic wf_output(ls_output,true)
end event

