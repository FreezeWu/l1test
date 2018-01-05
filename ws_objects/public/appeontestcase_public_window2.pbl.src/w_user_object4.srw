$PBExportHeader$w_user_object4.srw
forward
global type w_user_object4 from w_base_case
end type
type cb_1 from commandbutton within w_user_object4
end type
end forward

global type w_user_object4 from w_base_case
cb_1 cb_1
end type
global w_user_object4 w_user_object4

on w_user_object4.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_user_object4.destroy
call super::destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_user_object4
integer x = 288
integer y = 496
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

