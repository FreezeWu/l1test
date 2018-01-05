$PBExportHeader$n_cst_uso104_autouo.sru
forward
global type n_cst_uso104_autouo from nonvisualobject
end type
end forward

global type n_cst_uso104_autouo from nonvisualobject autoinstantiate
end type

type variables
String is_str = "Create"
n_cst_uso104_customclass iuo_customclass
n_cst_uso104_customautoclass iuo_customautoclass
str_uso104_string istr_string
end variables

on n_cst_uso104_autouo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso104_autouo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

