$PBExportHeader$uo_cbx_parm.sru
forward
global type uo_cbx_parm from uo_cbx
end type
end forward

global type uo_cbx_parm from uo_cbx
integer width = 553
string text = "Parm_Number"
end type
global uo_cbx_parm uo_cbx_parm

on uo_cbx_parm.create
call super::create
end on

on uo_cbx_parm.destroy
call super::destroy
end on

event constructor;call super::constructor;il_backcolor = message.doubleparm

this.text = string(il_backcolor)

end event

event clicked;call super::clicked;iw.backcolor = il_backcolor
end event

