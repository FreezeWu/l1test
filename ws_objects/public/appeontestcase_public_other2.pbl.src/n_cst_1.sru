$PBExportHeader$n_cst_1.sru
forward
global type n_cst_1 from nonvisualobject
end type
end forward

global type n_cst_1 from nonvisualobject
end type
global n_cst_1 n_cst_1

type variables
Integer ii_nvo_number = 12345
end variables

on n_cst_1.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_1.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

