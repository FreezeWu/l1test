﻿$PBExportHeader$n_cst_uso105_customautoclass.sru
forward
global type n_cst_uso105_customautoclass from nonvisualobject
end type
end forward

global type n_cst_uso105_customautoclass from nonvisualobject autoinstantiate
end type

type variables
String	is_str = 'Create'
end variables

on n_cst_uso105_customautoclass.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso105_customautoclass.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

