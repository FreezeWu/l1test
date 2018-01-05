$PBExportHeader$n_errobj3.sru
forward
global type n_errobj3 from error
end type
end forward

global type n_errobj3 from error
event ue_custom01 ( )
end type
global n_errobj3 n_errobj3

forward prototypes
public subroutine of_custom01 ()
end prototypes

event ue_custom01();gs_output = "Ancester ue_custom01 event triggered."
end event

public subroutine of_custom01 ();gs_output = "Ancester error object of_custom01 function triggered."
end subroutine

on n_errobj3.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_errobj3.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;


gs_output = "Ancester constructor event triggered."
end event

event destructor;
gs_output = "Ancester destructor event triggered."
end event

