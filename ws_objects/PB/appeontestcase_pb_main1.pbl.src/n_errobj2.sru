$PBExportHeader$n_errobj2.sru
forward
global type n_errobj2 from error
end type
end forward

global type n_errobj2 from error
event ue_custom01 ( )
end type
global n_errobj2 n_errobj2

forward prototypes
public subroutine of_custom01 ()
end prototypes

public subroutine of_custom01 ();
end subroutine

on n_errobj2.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_errobj2.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

