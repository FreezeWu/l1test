$PBExportHeader$w_parm_test.srw
forward
global type w_parm_test from window
end type
type cb_1 from commandbutton within w_parm_test
end type
end forward

global type w_parm_test from window
integer width = 3538
integer height = 1624
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
end type
global w_parm_test w_parm_test

type variables
str_testcase istr_testcase
end variables

on w_parm_test.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_parm_test.destroy
destroy(this.cb_1)
end on

event open;//
boolean lb_test[]
istr_testcase = message.powerobjectparm

if istr_testcase.value_int = 11 and istr_testcase.value_string = 'Test' and istr_testcase.value_boolean = true then
	lb_test[1] = true
	gw_setvalue.dynamic of_setvalue(1, lb_test[])
end if


istr_testcase.value_int = 33
istr_testcase.value_string = 'Case'
istr_testcase.value_boolean = false

CloseWithReturn(This, istr_testcase)
end event

type cb_1 from commandbutton within w_parm_test
integer x = 430
integer y = 188
integer width = 599
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CloseWithReturn"
end type

event clicked;CloseWithReturn(Parent, istr_testcase)
end event

