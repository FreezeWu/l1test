$PBExportHeader$soinetw02_inet_create.sru
forward
global type soinetw02_inet_create from inet
end type
end forward

global type soinetw02_inet_create from inet
end type
global soinetw02_inet_create soinetw02_inet_create

on soinetw02_inet_create.create
call super::create
TriggerEvent( this, "constructor" )
end on

on soinetw02_inet_create.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;return 1
end event

