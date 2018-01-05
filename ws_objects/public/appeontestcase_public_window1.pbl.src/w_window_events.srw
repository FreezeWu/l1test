$PBExportHeader$w_window_events.srw
forward
global type w_window_events from w_base
end type
type cb_1 from commandbutton within w_window_events
end type
type st_1 from statictext within w_window_events
end type
end forward

global type w_window_events from w_base
integer width = 2551
integer height = 1376
string title = "window Events & Functions"
cb_1 cb_1
st_1 st_1
end type
global w_window_events w_window_events

type variables
string  is_result = "Declare Instance Variables = "+ "successfully!" +"~r~n"
Boolean 	lb_Activate = False, lb_deActivate = False,lb_Other = False


end variables

on w_window_events.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_1
end on

on w_window_events.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_1)
end on

event close;call super::close;is_result += "Close() Event  = "+ "Trigger successfully!" +"~r~n"

gf_returnresult( is_result)
end event

event open;call super::open;//is_result += "Open() Event  = "+ "Trigger successfully!" +"~r~n" //Move to ue_preopen

end event

event resize;call super::resize;is_result += "Resize() Event  = "+ "Trigger successfully!" +"~r~n"
end event

event activate;call super::activate; If Not lb_Activate Then
	is_result += "Activate() Event  = "+ "Trigger successfully!" +"~r~n"
	lb_Activate = True
End If
end event

event clicked;call super::clicked;is_result += "Clicked() Event  = "+ "Trigger successfully!" +"~r~n"
end event

event closequery;call super::closequery;is_result += "CloseQuery() Event  = "+ "Trigger successfully!" +"~r~n"

end event

event deactivate;call super::deactivate; If Not lb_DeActivate Then
	is_result += "DeActivate() Event  = "+ "Trigger successfully!" +"~r~n"
	lb_DeActivate = True
End If
end event

event doubleclicked;call super::doubleclicked;is_result += "DoubleClicked() Event  = "+ "Trigger successfully!" +"~r~n"
end event

event dragdrop;call super::dragdrop;is_result += "DragDrop( st_1 ) Event  = "+ "Trigger successfully!" +"~r~n"
end event

event dragenter;call super::dragenter;is_result += "DragEnter( st_1 ) Event  = "+ "Trigger successfully!" +"~r~n"
end event

event dragleave;call super::dragleave;is_result += "DragLeave( st_1 ) Event  = "+ "Trigger successfully!" +"~r~n"
end event

event dragwithin;call super::dragwithin;is_result += "DragWithin( st_1) Event  = "+ "Trigger successfully!" +"~r~n"
end event

event hide;call super::hide;is_result += "Hide() Event  = "+ "Trigger successfully!" +"~r~n"
end event

event rbuttondown;call super::rbuttondown;is_result += "RButtonDown() Event  = "+ "Trigger successfully!" +"~r~n"
end event

event show;call super::show;is_result += "Show() Event  = "+ "Trigger successfully!" +"~r~n"
end event

event timer;call super::timer;is_result += "Timer() Event  = "+ "Trigger successfully!" +"~r~n"
end event

event ue_execute;call super::ue_execute;choose case as_testcasename 
	case 'W_window_events'
		cb_1.triggerevent( clicked!)
		
end choose

is_result += "close() Event  = "+ "Testing..." +"~r~n"
close(this)
end event

event ue_preopen;call super::ue_preopen;is_result += "Open() Event  = "+ "Trigger successfully!" +"~r~n"
end event

event mousedown;call super::mousedown;is_result += "MouseDown() Event  = "+ "Trigger successfully!" +"~r~n"
end event

event mousemove;call super::mousemove;is_result += "MouseMove() Event  = "+ "Trigger successfully!" +"~r~n"
end event

event mouseup;call super::mouseup;is_result += "MouseUp() Event  = "+ "Trigger successfully!" +"~r~n"
end event

event key;call super::key;IF key = KeyF2! THEN
	is_result += "Key( F2! ) Event  = "+ "F2 KeyDown successfully!" +"~r~n"
Else	
	is_result += "Key( F2! ) Event  = "+ "KeyDown fail!" +"~r~n"
END IF

end event

event help;call super::help;is_result += "Help( 1,1 ) Event  = "+ "Trigger successfully!" +"~r~n"
end event

event other;call super::other;If Not lb_Other Then
	is_result += "Other() Event  = "+ "Trigger successfully!" +"~r~n"
	lb_Other = True
End if
end event

event systemkey;call super::systemkey;IF key = KeyAlt! THEN
	is_result += "SystemKey( KeyAlt! ) Event  = "+ "Alt KeyDown successfully!" +"~r~n"
Else
	is_result += "SystemKey( KeyAlt! ) Event  = "+ "KeyDown fail!" +"~r~n"
END IF

end event

type cb_1 from commandbutton within w_window_events
integer x = 206
integer y = 368
integer width = 713
integer height = 108
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Testing Window Events"
end type

event clicked;
is_result += "Clicked() Event Begin = "+ "Testing..." +"~r~n"
Parent.TriggerEvent (Clicked!)
is_result += "DoubleClicked() Event Begin = "+ "Testing..." +"~r~n"
Parent.TriggerEvent (DoubleClicked!)
is_result += "RButtonDown() Event Begin = "+ "Testing..." +"~r~n"
Parent.TriggerEvent (Rbuttondown!)
is_result += "MouseDown() Event Begin = "+ "Testing..." +"~r~n"
Parent.TriggerEvent (MouseDown!)
is_result += "MouseMove() Event Begin = "+ "Testing..." +"~r~n"
Parent.TriggerEvent (MouseMove!)
is_result += "MouseUp() Event Begin = "+ "Testing..." +"~r~n"
Parent.TriggerEvent (MouseUp!)

is_result += "DragDrop( st_1 ) Event Begin = "+ "Testing..." +"~r~n"
Parent.Event Dragdrop( st_1 )
is_result += "DragEnter( st_1 ) Event Begin = "+ "Testing..." +"~r~n"
Parent.Event Dragenter( st_1 )
is_result += "DragLeave( st_1 ) Event Begin = "+ "Testing..." +"~r~n"
Parent.Event Dragleave( st_1 )
is_result += "DragWithin( st_1 )  = "+ "Testing..." +"~r~n"
Parent.Event DragWithin( st_1 )

is_result += "Key( KeyF2! ,0) Event Begin = "+ "Testing..." +"~r~n"
Parent.Event Key( KeyF2! ,0)

is_result += "SystemKey( KeyAlt!,0 ) Event Begin = "+ "Testing..." +"~r~n"
Parent.Event SystemKey ( KeyAlt!,0 ) 

is_result += "Help( 1,1 ) Event Begin = "+ "Testing..." +"~r~n"
Parent.Event Help(1,1  )

is_result += "Show() Event Begin = "+ "Testing..." +"~r~n"
Parent.Show()

is_result += "Hide() Event Begin = "+ "Testing..." +"~r~n"
Parent.Hide()

//is_result += "Timer(0.1) Event Begin = "+ "Testing..." +"~r~n"
//Timer(0.1)


end event

type st_1 from statictext within w_window_events
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
string text = "Window Events Test"
boolean focusrectangle = false
end type

