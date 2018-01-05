$PBExportHeader$soinetw03_inet_fun.sru
forward
global type soinetw03_inet_fun from inet
end type
end forward

global type soinetw03_inet_fun from inet
end type
global soinetw03_inet_fun soinetw03_inet_fun

type variables
window iw_window
end variables

forward prototypes
public subroutine wf_getparent (window aw_window)
end prototypes

public subroutine wf_getparent (window aw_window);iw_window = aw_window
end subroutine

on soinetw03_inet_fun.create
call super::create
TriggerEvent( this, "constructor" )
end on

on soinetw03_inet_fun.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;IF isvalid(iw_window) THEN
	iw_window.dynamic wf_output('Inet Object Constructor event be triggered!',false)
END IF
end event

event destructor;IF isvalid(iw_window) THEN
	iw_window.dynamic wf_output('Inet Object Destructor event be triggered!',false)
END IF
end event

