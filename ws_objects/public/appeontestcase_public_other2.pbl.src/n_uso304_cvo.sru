$PBExportHeader$n_uso304_cvo.sru
forward
global type n_uso304_cvo from userobject
end type
type cb_1 from commandbutton within n_uso304_cvo
end type
type st_1 from statictext within n_uso304_cvo
end type
end forward

global type n_uso304_cvo from userobject
integer width = 773
integer height = 444
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_event ( )
event ue_event_user ( )
event ue_event_this ( )
event ue_same ( )
cb_1 cb_1
st_1 st_1
end type
global n_uso304_cvo n_uso304_cvo

type variables
String	is_str = 'Create'

end variables

forward prototypes
public subroutine of_event_user ()
public subroutine of_callsameevent ()
public subroutine of_event_this ()
end prototypes

event ue_event();w_user_object1.wf_output('Object Type:   Custom Visual Object', True)
w_user_object1.wf_output('Scope:           Instance', False)
w_user_object1.wf_output('Object Define: n_uso304_cvo uo_cvo', False)
w_user_object1.wf_output('Information:     Call Object Event n_uso304_cvo.ue_event()', False)


end event

event ue_event_user();Event ue_event()
end event

event ue_event_this();This.Event ue_event()
end event

event ue_same();gs_str = 'Call Object Event n_uso303_cvo.ue_same()'
end event

public subroutine of_event_user ();Event ue_event_user()
end subroutine

public subroutine of_callsameevent ();Event ue_same()
end subroutine

public subroutine of_event_this ();Event ue_event_this()
end subroutine

on n_uso304_cvo.create
this.cb_1=create cb_1
this.st_1=create st_1
this.Control[]={this.cb_1,&
this.st_1}
end on

on n_uso304_cvo.destroy
destroy(this.cb_1)
destroy(this.st_1)
end on

event constructor;is_str = 'Call Object Event n_uso303_cvo.Constructor()'
end event

event destructor;If gb_close Then
	MessageBox('message', 'Call Object Event n_uso304_cvo.Destructor()')
	gb_close = False
End If


end event

type cb_1 from commandbutton within n_uso304_cvo
integer x = 78
integer y = 192
integer width = 599
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "CommandButton"
end type

event clicked;Event ue_event()
end event

type st_1 from statictext within n_uso304_cvo
integer x = 146
integer y = 64
integer width = 457
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "StaticText"
boolean focusrectangle = false
end type

