$PBExportHeader$w_opensheet_test3.srw
forward
global type w_opensheet_test3 from window
end type
type cb_1 from commandbutton within w_opensheet_test3
end type
end forward

global type w_opensheet_test3 from window
integer width = 2231
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
global w_opensheet_test3 w_opensheet_test3

on w_opensheet_test3.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_opensheet_test3.destroy
destroy(this.cb_1)
end on

event open;string ls_parm
boolean lb_case[]

ls_parm = message.stringparm

if ls_parm = 'Test' then  lb_case[1] = true

gw_setvalue.dynamic of_setvalue(6,lb_case[])



end event

type cb_1 from commandbutton within w_opensheet_test3
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

