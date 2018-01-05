$PBExportHeader$n_ddlb.sru
forward
global type n_ddlb from dropdownlistbox
end type
end forward

global type n_ddlb from dropdownlistbox
integer width = 549
integer height = 476
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type
global n_ddlb n_ddlb

type variables
datastore ids_test
end variables

event constructor;
ids_test = Create DataStore
ids_test.DataObject = 'd_cust34632'

This.Sorted = False
This.VScrollBar = True

gs_output = 'none'

if isvalid(ids_test) then
	gs_output = 'valid'
else
	gs_output = 'invalid'
end if






end event

on n_ddlb.create
end on

on n_ddlb.destroy
end on

event destructor;destroy ids_test
end event

