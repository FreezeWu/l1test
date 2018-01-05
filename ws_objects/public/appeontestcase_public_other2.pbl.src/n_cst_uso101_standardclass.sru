$PBExportHeader$n_cst_uso101_standardclass.sru
forward
global type n_cst_uso101_standardclass from datastore
end type
end forward

global type n_cst_uso101_standardclass from datastore
end type
global n_cst_uso101_standardclass n_cst_uso101_standardclass

type variables
n_cst_uso101_autouo iuo_autouo
end variables

on n_cst_uso101_standardclass.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso101_standardclass.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

