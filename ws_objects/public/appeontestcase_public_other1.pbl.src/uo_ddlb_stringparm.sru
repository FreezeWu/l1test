$PBExportHeader$uo_ddlb_stringparm.sru
forward
global type uo_ddlb_stringparm from dropdownlistbox
end type
end forward

global type uo_ddlb_stringparm from dropdownlistbox
integer width = 549
integer height = 112
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"Test","Test2"}
borderstyle borderstyle = stylelowered!
end type
global uo_ddlb_stringparm uo_ddlb_stringparm

type variables
window iw
end variables

event constructor;string ls_output
string ls_parm
iw = gf_parentwindow(this)
ls_output = this.classname( )+" constructor Triggered !"
iw.function dynamic wf_output(ls_output,true)

end event

event destructor;string ls_output
iw = gf_parentwindow(this)
ls_output = this.classname( )+" destructor Triggered !"
iw.function dynamic wf_output(ls_output,true)
end event

on uo_ddlb_stringparm.create
end on

on uo_ddlb_stringparm.destroy
end on

