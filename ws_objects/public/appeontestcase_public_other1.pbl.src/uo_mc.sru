$PBExportHeader$uo_mc.sru
forward
global type uo_mc from monthcalendar
end type
end forward

global type uo_mc from monthcalendar
integer width = 1006
integer height = 760
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean todaysection = true
boolean todaycircle = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type
global uo_mc uo_mc

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

on uo_mc.create
end on

on uo_mc.destroy
end on

