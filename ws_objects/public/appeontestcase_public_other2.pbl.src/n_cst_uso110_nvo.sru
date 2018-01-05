$PBExportHeader$n_cst_uso110_nvo.sru
forward
global type n_cst_uso110_nvo from nonvisualobject
end type
end forward

global type n_cst_uso110_nvo from nonvisualobject
end type
global n_cst_uso110_nvo n_cst_uso110_nvo

type variables
String is_str = "Create"
end variables

on n_cst_uso110_nvo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso110_nvo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;gs_str = 'Call UserObject Event n_cst_uso110_nvo.Constructor()'
end event

event destructor;gs_str = 'Call UserObject Event n_cst_uso110_nvo.Destructor()'
end event

