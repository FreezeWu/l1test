$PBExportHeader$u_cst_tabpage.sru
forward
global type u_cst_tabpage from userobject
end type
type tab_1 from tab within u_cst_tabpage
end type
type tabpage_1 from userobject within tab_1
end type
type tabpage_1 from userobject within tab_1
end type
type tab_1 from tab within u_cst_tabpage
tabpage_1 tabpage_1
end type
end forward

global type u_cst_tabpage from userobject
integer width = 795
integer height = 456
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
tab_1 tab_1
end type
global u_cst_tabpage u_cst_tabpage

on u_cst_tabpage.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on u_cst_tabpage.destroy
destroy(this.tab_1)
end on

type tab_1 from tab within u_cst_tabpage
integer width = 791
integer height = 452
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
integer width = 754
integer height = 324
long backcolor = 67108864
string text = "page1"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

