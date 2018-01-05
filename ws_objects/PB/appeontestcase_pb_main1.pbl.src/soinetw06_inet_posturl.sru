$PBExportHeader$soinetw06_inet_posturl.sru
forward
global type soinetw06_inet_posturl from inet
end type
end forward

global type soinetw06_inet_posturl from inet
end type
global soinetw06_inet_posturl soinetw06_inet_posturl

on soinetw06_inet_posturl.create
call super::create
TriggerEvent( this, "constructor" )
end on

on soinetw06_inet_posturl.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

