$PBExportHeader$w_sheet_response.srw
forward
global type w_sheet_response from window
end type
type cb_1 from commandbutton within w_sheet_response
end type
end forward

global type w_sheet_response from window
integer width = 3200
integer height = 1712
boolean titlebar = true
string title = "ResponseWindowType"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
end type
global w_sheet_response w_sheet_response

on w_sheet_response.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_sheet_response.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_sheet_response
integer x = 2043
integer y = 756
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OK"
end type

event clicked;messagebox('00','')
end event

