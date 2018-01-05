$PBExportHeader$u_cst_taba04.sru
forward
global type u_cst_taba04 from userobject
end type
type sle_1 from singlelineedit within u_cst_taba04
end type
type uo_1 from u_cst_commandbutton within u_cst_taba04
end type
type tab_1 from tab within u_cst_taba04
end type
type tabpage_1 from userobject within tab_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_2 cb_2
end type
type tab_1 from tab within u_cst_taba04
tabpage_1 tabpage_1
end type
end forward

global type u_cst_taba04 from userobject
integer width = 800
integer height = 488
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
sle_1 sle_1
uo_1 uo_1
tab_1 tab_1
end type
global u_cst_taba04 u_cst_taba04

on u_cst_taba04.create
this.sle_1=create sle_1
this.uo_1=create uo_1
this.tab_1=create tab_1
this.Control[]={this.sle_1,&
this.uo_1,&
this.tab_1}
end on

on u_cst_taba04.destroy
destroy(this.sle_1)
destroy(this.uo_1)
destroy(this.tab_1)
end on

event constructor;//w_taba04w01_opentabevent.wf_OutPut( "u_cst_taba04.Constructor()", False)
end event

type sle_1 from singlelineedit within u_cst_taba04
integer x = 393
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "sle_1"
borderstyle borderstyle = stylelowered!
end type

event constructor;//w_taba04w01_opentabevent.wf_OutPut('u_cst_taba04.sle_1.Constructor()', False)
end event

type uo_1 from u_cst_commandbutton within u_cst_taba04
integer width = 398
integer taborder = 20
end type

on uo_1.destroy
call u_cst_commandbutton::destroy
end on

event constructor;call super::constructor;//w_taba04w01_opentabevent.wf_OutPut('u_cst_taba04.uo_1.Constructor()', False)
end event

type tab_1 from tab within u_cst_taba04
integer x = 5
integer y = 120
integer width = 791
integer height = 364
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

event constructor;//w_taba04w01_opentabevent.wf_OutPut( "u_cst_taba04.tab_1.Constructor()", False)
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 754
integer height = 236
long backcolor = 67108864
string text = "page1"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_2 cb_2
end type

on tabpage_1.create
this.cb_2=create cb_2
this.Control[]={this.cb_2}
end on

on tabpage_1.destroy
destroy(this.cb_2)
end on

event constructor;//w_taba04w01_opentabevent.wf_OutPut( "u_cst_taba04.tab_1.tabpage_1.Constructor()", False)
end event

type cb_2 from commandbutton within tabpage_1
integer x = 151
integer y = 64
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "cb_2"
end type

event constructor;//w_taba04w01_opentabevent.wf_OutPut('u_cst_taba04.tab_1.tabpage_1.cb_2.Constructor()', False)
end event

