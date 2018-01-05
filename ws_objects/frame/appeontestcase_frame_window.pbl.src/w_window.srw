$PBExportHeader$w_window.srw
forward
global type w_window from w_base
end type
type cb_1 from commandbutton within w_window
end type
type dw_1 from datawindow within w_window
end type
end forward

global type w_window from w_base
integer width = 1568
integer height = 936
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_1 cb_1
dw_1 dw_1
end type
global w_window w_window

on w_window.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_1
end on

on w_window.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;call super::open;string ls_testcaseid

ls_testcaseid = message.stringparm

dw_1.settransobject( sqlca)
dw_1.retrieve(ls_testcaseid )
end event

type cb_1 from commandbutton within w_window
integer x = 485
integer y = 680
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OK"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_window
integer x = 5
integer width = 1536
integer height = 648
integer taborder = 10
string title = "none"
string dataobject = "d_window"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

