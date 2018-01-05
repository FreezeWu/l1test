$PBExportHeader$nv_wf_functions.sru
forward
global type nv_wf_functions from nonvisualobject
end type
end forward

global type nv_wf_functions from nonvisualobject
end type
global nv_wf_functions nv_wf_functions

forward prototypes
public function integer f_test ()
end prototypes

public function integer f_test ();int li_n
li_n = 7

return li_n
end function

on nv_wf_functions.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nv_wf_functions.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

