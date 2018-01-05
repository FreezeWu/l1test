$PBExportHeader$w_window_functions.srw
forward
global type w_window_functions from w_base
end type
type cb_2 from commandbutton within w_window_functions
end type
type st_1 from statictext within w_window_functions
end type
end forward

global type w_window_functions from w_base
integer width = 2523
integer height = 1352
string title = "window Events & Functions"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_2 cb_2
st_1 st_1
end type
global w_window_functions w_window_functions

type variables
string  is_result 



end variables

on w_window_functions.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.st_1
end on

on w_window_functions.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.st_1)
end on

event ue_execute;call super::ue_execute;choose case as_testcasename 
	case 'W_window_functions'
		cb_2.triggerevent( clicked!)
		
end choose

close(this)
end event

type cb_2 from commandbutton within w_window_functions
integer x = 206
integer y = 392
integer width = 713
integer height = 108
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Testing Window Functions"
end type

event clicked;PowerObject lo_temp
is_result += "ClassName() Function  = "+ String (Parent.ClassName()) +"~r~n"
//is_result += "GetParent() Function  = "+ String ( GetParent().ClassName() ) +"~r~n"
is_result += "ParentWindow() Function  = "+ String ( Parent.ParentWindow().ClassName() ) +"~r~n"
is_result += "GetActiveSheet() Function  = "+ String (Parent.ParentWindow().GetActiveSheet().ClassName() ) +"~r~n"
is_result += "GetFirstSheet() Function  = "+ String ( Parent.ParentWindow().GetFirstSheet().ClassName() ) +"~r~n"
is_result += "GetNextSheet() Function  = "+ String ( Parent.ParentWindow().GetFirstSheet().ClassName() ) +"~r~n"

//is_result += "TypeOf() Function  = "+ String ( Parent.TypeOf() ) +"~r~n"


gf_returnresult( is_result)
end event

type st_1 from statictext within w_window_functions
integer x = 178
integer y = 120
integer width = 1152
integer height = 100
boolean dragauto = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "Window Functions Test"
boolean focusrectangle = false
end type

