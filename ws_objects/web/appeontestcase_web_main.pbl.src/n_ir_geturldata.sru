$PBExportHeader$n_ir_geturldata.sru
forward
global type n_ir_geturldata from internetresult
end type
end forward

global type n_ir_geturldata from internetresult
end type
global n_ir_geturldata n_ir_geturldata

type variables
string is_data
end variables

forward prototypes
public function integer internetdata (blob data)
end prototypes

public function integer internetdata (blob data);is_data = string(data, encodingansi!)

return 1
end function

on n_ir_geturldata.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_ir_geturldata.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

