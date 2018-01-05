$PBExportHeader$u_cst_l2.sru
forward
global type u_cst_l2 from u_cst_l1
end type
type tab_1 from tab within u_cst_l2
end type
type tabpage_1 from userobject within tab_1
end type
type tabpage_1 from userobject within tab_1
end type
type tab_1 from tab within u_cst_l2
tabpage_1 tabpage_1
end type
end forward

global type u_cst_l2 from u_cst_l1
integer width = 905
integer height = 432
tab_1 tab_1
end type
global u_cst_l2 u_cst_l2

on u_cst_l2.create
int iCurrent
call super::create
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
end on

on u_cst_l2.destroy
call super::destroy
destroy(this.tab_1)
end on

type tab_1 from tab within u_cst_l2
integer width = 901
integer height = 428
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

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 864
integer height = 300
long backcolor = 67108864
string text = "page1"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

