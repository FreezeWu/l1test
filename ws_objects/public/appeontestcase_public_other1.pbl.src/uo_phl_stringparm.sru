$PBExportHeader$uo_phl_stringparm.sru
forward
global type uo_phl_stringparm from picturehyperlink
end type
end forward

global type uo_phl_stringparm from picturehyperlink
integer width = 626
integer height = 140
string pointer = "HyperLink!"
string picturename = "D:\program\demo\developer\Appeondemo125e\XmiDemo\images\appeon-logo.jpg"
boolean focusrectangle = false
end type
global uo_phl_stringparm uo_phl_stringparm

type variables
window iw
end variables

event constructor;string ls_output,ls_url
iw = gf_parentwindow(this)

ls_output = this.classname( )+" constructor Triggered !"

iw.function dynamic wf_output(ls_output,true)

ls_url = message.stringparm

this.url = ls_url
end event

event destructor;string ls_output
ls_output = this.classname( )+" destructor Triggered !"
iw.function dynamic wf_output(ls_output,true)
end event

on uo_phl_stringparm.create
end on

on uo_phl_stringparm.destroy
end on

