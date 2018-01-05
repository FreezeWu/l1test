$PBExportHeader$uo_cb.sru
forward
global type uo_cb from commandbutton
end type
end forward

global type uo_cb from commandbutton
integer width = 457
integer height = 132
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type
global uo_cb uo_cb

type variables
window iw

end variables

on uo_cb.create
end on

on uo_cb.destroy
end on

event constructor;string ls_output
iw = gf_parentwindow(this)

ls_output = this.classname( )+" constructor Triggered !"

iw.function dynamic wf_output(ls_output,true)
end event

event destructor;string ls_output

ls_output = this.classname( )+" Destuctor Triggered !"

iw.function dynamic wf_output(ls_output,true)


end event

