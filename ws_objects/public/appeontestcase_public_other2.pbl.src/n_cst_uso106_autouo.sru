$PBExportHeader$n_cst_uso106_autouo.sru
forward
global type n_cst_uso106_autouo from nonvisualobject
end type
end forward

global type n_cst_uso106_autouo from nonvisualobject autoinstantiate
event ue_customevent ( )
event ue_same ( )
end type

type variables
String is_str = "Create"

String is_status = 'No Event Triggered'
end variables

forward prototypes
public subroutine of_event ()
public subroutine of_this_event ()
public subroutine of_callsameevent ()
end prototypes

event ue_customevent();is_status = 'Call UserObject Event n_cst_uso106_nvo.ue_customevent()'
end event

event ue_same();is_status = 'Call UserObject Event n_cst_uso106_nvo.ue_same()'
end event

public subroutine of_event ();Event ue_customevent()
end subroutine

public subroutine of_this_event ();This.Event ue_customevent()
end subroutine

public subroutine of_callsameevent ();Event ue_same()
end subroutine

on n_cst_uso106_autouo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso106_autouo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;is_status = 'Call UserObject Event n_cst_uso106_nvo.constructor()'
end event

