$PBExportHeader$w_sheet_1614.srw
forward
global type w_sheet_1614 from window
end type
type cb_2 from commandbutton within w_sheet_1614
end type
type cb_1 from commandbutton within w_sheet_1614
end type
end forward

global type w_sheet_1614 from window
integer width = 3378
integer height = 1408
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
end type
global w_sheet_1614 w_sheet_1614

type variables
string is_message
end variables
forward prototypes
public function integer of_window (boolean ab_dynamic)
public function integer of_cb (boolean ab_dynamic)
public function integer of_long (boolean ab_dynamic)
end prototypes

public function integer of_window (boolean ab_dynamic);//通过发送消息最大化该sheet窗体

if ab_dynamic then
	w_mdi_1614.dynamic of_handle1(handle(this),"test")
else
	w_mdi_1614.of_handle1(handle(this),"test")
end if

return 1
end function

public function integer of_cb (boolean ab_dynamic);//通过发送消息最大化该sheet窗体
is_message = "of_cb("+string(ab_dynamic)+")"
if ab_dynamic then
	w_mdi_1614.dynamic of_handle2(handle(this),handle(cb_2),"test")
else
	w_mdi_1614.of_handle2(handle(this),handle(cb_2),"test")
end if

return 1
end function

public function integer of_long (boolean ab_dynamic);//通过发送消息最大化该sheet窗体
long ll_window
long ll_cb
ll_window = handle(this)
ll_cb = handle(cb_2)
is_message = "of_long("+string(ab_dynamic)+")"
if ab_dynamic then
	w_mdi_1614.dynamic of_handle2(ll_window,ll_cb,"test")
else
	w_mdi_1614.of_handle2(ll_window,ll_cb,"test")
end if

return 1
end function

on w_sheet_1614.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.cb_1}
end on

on w_sheet_1614.destroy
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_2 from commandbutton within w_sheet_1614
integer x = 782
integer y = 496
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "test2"
end type

event clicked;is_message = "cb_2.clicked is triggered"
end event

type cb_1 from commandbutton within w_sheet_1614
integer x = 782
integer y = 312
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "test1"
end type

