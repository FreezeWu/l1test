$PBExportHeader$n_errobj1.sru
forward
global type n_errobj1 from error
end type
end forward

global type n_errobj1 from error
event ue_custom01 ( )
end type
global n_errobj1 n_errobj1

forward prototypes
public subroutine of_custom01 ()
end prototypes

event ue_custom01();


gs_output = "Ancester error object ue_custom01 event triggered."
end event

public subroutine of_custom01 ();

gs_output = "Ancester error object of_custom01 function triggered."
end subroutine

on n_errobj1.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_errobj1.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;

gs_output = "Ancester error object constructor event triggered."
end event

event destructor;

gs_output = "Ancester error object destructor event triggered."
end event

