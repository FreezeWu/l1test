$PBExportHeader$uo_dp_stringparm.sru
forward
global type uo_dp_stringparm from uo_dp
end type
end forward

global type uo_dp_stringparm from uo_dp
end type
global uo_dp_stringparm uo_dp_stringparm

event constructor;call super::constructor;string ls_data

ls_data = message.stringparm

this.value = datetime(date(ls_data),now())
end event

on uo_dp_stringparm.create
call super::create
end on

on uo_dp_stringparm.destroy
call super::destroy
end on

