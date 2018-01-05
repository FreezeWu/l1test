$PBExportHeader$w_tabs.srw
forward
global type w_tabs from w_clase_tabs
end type
type tabpage_5 from userobject within tab_1
end type
type tabpage_5 from userobject within tab_1
end type
type tabpage_4 from userobject within tab_1
end type
type tabpage_4 from userobject within tab_1
end type
end forward

global type w_tabs from w_clase_tabs
string title = ""
end type
global w_tabs w_tabs

on w_tabs.create
int iCurrent
call super::create
end on

on w_tabs.destroy
call super::destroy
end on

type tab_1 from w_clase_tabs`tab_1 within w_tabs
tabpage_5 tabpage_5
tabpage_4 tabpage_4
end type

on tab_1.create
this.tabpage_5=create tabpage_5
this.tabpage_4=create tabpage_4
call super::create
this.Control[]={this.tabpage_5,&
this.tabpage_4,&
this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
call super::destroy
destroy(this.tabpage_5)
destroy(this.tabpage_4)
end on

event tab_1::selectionchanged;call super::selectionchanged;gs_output = control[tab_1.Selectedtab].text
close(parent)
end event

type tabpage_1 from w_clase_tabs`tabpage_1 within tab_1
end type

type tabpage_2 from w_clase_tabs`tabpage_2 within tab_1
end type

type tabpage_3 from w_clase_tabs`tabpage_3 within tab_1
end type

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3045
integer height = 1040
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3045
integer height = 1040
long backcolor = 67108864
string text = "tabpage_4"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

