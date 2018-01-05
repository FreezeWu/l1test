$PBExportHeader$uo_shy.sru
forward
global type uo_shy from statichyperlink
end type
end forward

global type uo_shy from statichyperlink
integer width = 402
integer height = 108
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
string url = "http://192.0.1.74/AEM"
end type
global uo_shy uo_shy

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

on uo_shy.create
end on

on uo_shy.destroy
end on

