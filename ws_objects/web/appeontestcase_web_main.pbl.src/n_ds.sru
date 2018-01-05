$PBExportHeader$n_ds.sru
forward
global type n_ds from datastore
end type
end forward

global type n_ds from datastore
end type
global n_ds n_ds

event destructor;gs_output = 'destructor'
end event

on n_ds.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_ds.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

