$PBExportHeader$n_cst_uso101_customclass.sru
forward
global type n_cst_uso101_customclass from nonvisualobject
end type
end forward

global type n_cst_uso101_customclass from nonvisualobject
end type
global n_cst_uso101_customclass n_cst_uso101_customclass

type variables
n_cst_uso101_autouo iuo_autouo
end variables

on n_cst_uso101_customclass.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso101_customclass.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

