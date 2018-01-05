$PBExportHeader$n_cst_uso112_nvo.sru
forward
global type n_cst_uso112_nvo from nonvisualobject
end type
end forward

global type n_cst_uso112_nvo from nonvisualobject
end type
global n_cst_uso112_nvo n_cst_uso112_nvo

type variables
String is_str = "Create"

end variables

on n_cst_uso112_nvo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso112_nvo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

