$PBExportHeader$soinetw04_inet_hplk.sru
forward
global type soinetw04_inet_hplk from inet
end type
end forward

global type soinetw04_inet_hplk from inet
end type
global soinetw04_inet_hplk soinetw04_inet_hplk

on soinetw04_inet_hplk.create
call super::create
TriggerEvent( this, "constructor" )
end on

on soinetw04_inet_hplk.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

