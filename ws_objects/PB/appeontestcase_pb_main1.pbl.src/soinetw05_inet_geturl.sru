$PBExportHeader$soinetw05_inet_geturl.sru
forward
global type soinetw05_inet_geturl from inet
end type
end forward

global type soinetw05_inet_geturl from inet
end type
global soinetw05_inet_geturl soinetw05_inet_geturl

on soinetw05_inet_geturl.create
call super::create
TriggerEvent( this, "constructor" )
end on

on soinetw05_inet_geturl.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

