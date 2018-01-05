$PBExportHeader$uo_cbx.sru
forward
global type uo_cbx from checkbox
end type
end forward

global type uo_cbx from checkbox
integer width = 407
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Red"
end type
global uo_cbx uo_cbx

type variables
long il_backcolor

window iw
end variables

event clicked;

if this.checked then
	iw.backcolor = 255
else
	iw.backcolor = il_backcolor
end if

end event

on uo_cbx.create
end on

on uo_cbx.destroy
end on

event constructor;string ls_output
iw = gf_parentwindow(this)
il_backcolor = iw.backcolor
ls_output = this.classname( )+" constructor Triggered !"

iw.function dynamic wf_output(ls_output,true)
end event

event destructor;string ls_output

ls_output = this.classname( )+" destructor Triggered !"

iw.function dynamic wf_output(ls_output,true)
end event

