$PBExportHeader$w_clase_tabs.srw
forward
global type w_clase_tabs from window
end type
type tab_1 from tab within w_clase_tabs
end type
type tabpage_1 from userobject within tab_1
end type
type tabpage_1 from userobject within tab_1
end type
type tabpage_2 from userobject within tab_1
end type
type tabpage_2 from userobject within tab_1
end type
type tabpage_3 from userobject within tab_1
end type
type tabpage_3 from userobject within tab_1
end type
type tab_1 from tab within w_clase_tabs
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
end forward

global type w_clase_tabs from window
integer width = 3378
integer height = 1408
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
tab_1 tab_1
end type
global w_clase_tabs w_clase_tabs

on w_clase_tabs.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_clase_tabs.destroy
destroy(this.tab_1)
end on

type tab_1 from tab within w_clase_tabs
integer x = 82
integer y = 64
integer width = 3081
integer height = 1168
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3045
integer height = 1040
long backcolor = 67108864
string text = "tabpage_1"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3045
integer height = 1040
long backcolor = 67108864
string text = "tabpage_2"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3045
integer height = 1040
long backcolor = 67108864
string text = "tabpage_3"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

