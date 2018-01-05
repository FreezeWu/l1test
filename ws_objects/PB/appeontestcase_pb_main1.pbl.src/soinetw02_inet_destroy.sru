$PBExportHeader$soinetw02_inet_destroy.sru
forward
global type soinetw02_inet_destroy from inet
end type
end forward

global type soinetw02_inet_destroy from inet
end type
global soinetw02_inet_destroy soinetw02_inet_destroy

on soinetw02_inet_destroy.create
call super::create
TriggerEvent( this, "constructor" )
end on

on soinetw02_inet_destroy.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;return 1
end event

