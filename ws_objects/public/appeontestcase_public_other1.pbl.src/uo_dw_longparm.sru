$PBExportHeader$uo_dw_longparm.sru
forward
global type uo_dw_longparm from datawindow
end type
end forward

global type uo_dw_longparm from datawindow
integer width = 1682
integer height = 784
string title = "none"
string dataobject = "d_employer"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type
global uo_dw_longparm uo_dw_longparm

type variables
window iw
end variables

on uo_dw_longparm.create
end on

on uo_dw_longparm.destroy
end on

event constructor;long ll_id
string ls_output

iw = gf_parentwindow(this)
ll_id = message.doubleparm
this.settransobject( sqlca)
this.retrieve( )

this.setfilter( "dept_id = "+string(ll_id))
this.filter( )

ls_output = this.classname( )+" constructor Triggered !"
iw.function dynamic wf_output(ls_output,true)
end event

event destructor;string ls_output
ls_output = this.classname( )+" destructor Triggered !"
iw.function dynamic wf_output(ls_output,true)
end event

event sqlpreview;string ls_output
ls_output = this.classname( )+" sqlpreview Triggered !"
//iw.function dynamic wf_output(sqlsyntax,true)
iw.function dynamic wf_output(ls_output,true)
end event

