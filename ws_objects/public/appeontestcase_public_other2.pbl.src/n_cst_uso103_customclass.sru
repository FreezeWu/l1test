$PBExportHeader$n_cst_uso103_customclass.sru
forward
global type n_cst_uso103_customclass from nonvisualobject
end type
end forward

global type n_cst_uso103_customclass from nonvisualobject
end type
global n_cst_uso103_customclass n_cst_uso103_customclass

type variables

end variables

forward prototypes
public subroutine uf_call ()
end prototypes

public subroutine uf_call ();n_cst_uso103_autouo	luo_autouo

gs_str = luo_autouo.is_str
end subroutine

on n_cst_uso103_customclass.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso103_customclass.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

