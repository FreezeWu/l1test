$PBExportHeader$w_opensheet_test.srw
forward
global type w_opensheet_test from window
end type
type cb_1 from commandbutton within w_opensheet_test
end type
end forward

global type w_opensheet_test from window
integer width = 3566
integer height = 1648
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
end type
global w_opensheet_test w_opensheet_test

on w_opensheet_test.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_opensheet_test.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_opensheet_test
integer x = 238
integer y = 168
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;Close(Parent)
end event

