$PBExportHeader$uo_tab.sru
forward
global type uo_tab from tab
end type
type tabpage_1 from uo_cus_1 within uo_tab
end type
type tabpage_1 from uo_cus_1 within uo_tab
end type
type tabpage_2 from userobject within uo_tab
end type
type cb_2 from commandbutton within tabpage_2
end type
type cb_1 from uo_cb within tabpage_2
end type
type tabpage_2 from userobject within uo_tab
cb_2 cb_2
cb_1 cb_1
end type
end forward

global type uo_tab from tab
integer width = 1687
integer height = 1116
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean createondemand = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
global uo_tab uo_tab

type variables
window iw
end variables

event constructor;string ls_output
iw = gf_parentwindow(this)

ls_output = this.classname( )+" constructor Triggered !"

iw.function dynamic wf_output(ls_output,true)
end event

event destructor;string ls_output

ls_output = this.classname( )+" destructore Triggered !"

iw.function dynamic wf_output(ls_output,true)
end event

on uo_tab.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on uo_tab.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from uo_cus_1 within uo_tab
integer x = 18
integer y = 124
integer width = 1650
integer height = 976
string text = "UserObject"
end type

event constructor;call super::constructor;string ls_output
iw = gf_parentwindow(this)

ls_output = this.classname( )+" constructor Triggered !"

iw.function dynamic wf_output(ls_output,true)
end event

event destructor;call super::destructor;string ls_output

ls_output = this.classname( )+" destructor Triggered !"

iw.function dynamic wf_output(ls_output,true)
end event

type tabpage_2 from userobject within uo_tab
event create ( )
event destroy ( )
integer x = 18
integer y = 124
integer width = 1650
integer height = 976
long backcolor = 67108864
string text = "Tabpage"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_2 cb_2
cb_1 cb_1
end type

on tabpage_2.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.cb_1}
end on

on tabpage_2.destroy
destroy(this.cb_2)
destroy(this.cb_1)
end on

event constructor;string ls_output
uo_em lem
iw = gf_parentwindow(this)

ls_output = this.classname( )+" constructor Triggered !"

iw.function dynamic wf_output(ls_output,true)

this.openuserobject(lem,0,150 )
end event

event destructor;string ls_output

ls_output = this.classname( )+" destructor Triggered !"

iw.function dynamic wf_output(ls_output,true)
end event

type cb_2 from commandbutton within tabpage_2
integer x = 736
integer y = 16
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

type cb_1 from uo_cb within tabpage_2
integer y = 4
integer taborder = 20
string text = "UO_CB"
end type

