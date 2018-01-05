$PBExportHeader$uo_pic.sru
forward
global type uo_pic from picture
end type
end forward

global type uo_pic from picture
integer width = 320
integer height = 168
boolean originalsize = true
boolean focusrectangle = false
end type
global uo_pic uo_pic

type variables
window iw
end variables

event constructor;string ls_output,ls_picture,ls_filename
long ll_file
iw = gf_parentwindow(this)

ls_output = this.classname( )+" constructor Triggered !"

iw.function dynamic wf_output(ls_output,true)

ll_file = getfileopenname("Select Picture",ls_picture,ls_filename,'bmp','Bmp file(*.bmp),*.bmp')

if ll_file = 1 then
	this.picturename = ls_picture
end if
end event

event destructor;string ls_output
ls_output = this.classname( )+" destructor Triggered !"
iw.function dynamic wf_output(ls_output,true)
end event

on uo_pic.create
end on

on uo_pic.destroy
end on

