$PBExportHeader$uo_hsb.sru
forward
global type uo_hsb from hprogressbar
end type
end forward

global type uo_hsb from hprogressbar
integer width = 622
integer height = 68
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type
global uo_hsb uo_hsb

type variables
window iw
end variables

event destructor;string ls_output
ls_output = this.classname( )+" destructor Triggered !"
iw.function dynamic wf_output(ls_output,true)
end event

event constructor;string ls_output
iw = gf_parentwindow(this)
ls_output = this.classname( )+" destructor Triggered !"
iw.function dynamic wf_output(ls_output,true)
end event

on uo_hsb.create
end on

on uo_hsb.destroy
end on

