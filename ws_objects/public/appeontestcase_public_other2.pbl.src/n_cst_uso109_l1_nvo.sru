$PBExportHeader$n_cst_uso109_l1_nvo.sru
forward
global type n_cst_uso109_l1_nvo from nonvisualobject
end type
end forward

global type n_cst_uso109_l1_nvo from nonvisualobject
end type
global n_cst_uso109_l1_nvo n_cst_uso109_l1_nvo

type variables
String is_str = "Create"
Boolean ib_constructor = False
end variables

on n_cst_uso109_l1_nvo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso109_l1_nvo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ib_constructor = True
end event

