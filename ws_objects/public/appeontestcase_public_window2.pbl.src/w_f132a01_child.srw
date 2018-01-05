$PBExportHeader$w_f132a01_child.srw
forward
global type w_f132a01_child from window
end type
type cb_1 from commandbutton within w_f132a01_child
end type
end forward

global type w_f132a01_child from window
integer width = 2533
integer height = 1408
boolean titlebar = true
string title = "ChildWindowType"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
end type
global w_f132a01_child w_f132a01_child

on w_f132a01_child.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_f132a01_child.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_f132a01_child
integer x = 937
integer y = 660
integer width = 457
integer height = 128
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
end type

event clicked;Close(parent)
end event

