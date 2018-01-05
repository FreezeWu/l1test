$PBExportHeader$n_cst_uso101_autocustomclass.sru
forward
global type n_cst_uso101_autocustomclass from nonvisualobject
end type
end forward

global type n_cst_uso101_autocustomclass from nonvisualobject autoinstantiate
end type

type variables
n_cst_uso101_autouo iuo_autouo
end variables

on n_cst_uso101_autocustomclass.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso101_autocustomclass.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

