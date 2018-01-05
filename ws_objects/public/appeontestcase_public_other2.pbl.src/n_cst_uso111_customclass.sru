$PBExportHeader$n_cst_uso111_customclass.sru
forward
global type n_cst_uso111_customclass from nonvisualobject
end type
end forward

global type n_cst_uso111_customclass from nonvisualobject
end type
global n_cst_uso111_customclass n_cst_uso111_customclass

type variables
String	is_str = 'Create'
end variables

on n_cst_uso111_customclass.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso111_customclass.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

