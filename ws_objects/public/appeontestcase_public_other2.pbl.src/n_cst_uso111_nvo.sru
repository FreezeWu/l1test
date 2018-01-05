$PBExportHeader$n_cst_uso111_nvo.sru
forward
global type n_cst_uso111_nvo from nonvisualobject
end type
end forward

global type n_cst_uso111_nvo from nonvisualobject
end type
global n_cst_uso111_nvo n_cst_uso111_nvo

type variables
String is_str = "Create"
n_cst_uso111_customclass iuo_customclass
n_cst_uso111_customautoclass iuo_customautoclass
str_uso111_string istr_string
end variables

on n_cst_uso111_nvo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso111_nvo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

