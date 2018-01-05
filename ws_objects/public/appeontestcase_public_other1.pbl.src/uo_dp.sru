$PBExportHeader$uo_dp.sru
forward
global type uo_dp from datepicker
end type
end forward

global type uo_dp from datepicker
integer width = 686
integer height = 100
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
integer textsize = -12
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean todaysection = true
boolean todaycircle = true
end type
global uo_dp uo_dp

type variables
window iw
end variables

on uo_dp.create
end on

on uo_dp.destroy
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

event valuechanged;string ls_output
ls_output ="Value changed To "+string(dtm)
iw.function dynamic wf_output(ls_output,true)
end event

