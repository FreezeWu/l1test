$PBExportHeader$u_cst_taba03_tabpage.sru
forward
global type u_cst_taba03_tabpage from userobject
end type
type tab_1 from tab within u_cst_taba03_tabpage
end type
type tabpage_1 from userobject within tab_1
end type
type cb_1 from u_taba03_commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_1 cb_1
end type
type tab_1 from tab within u_cst_taba03_tabpage
tabpage_1 tabpage_1
end type
end forward

global type u_cst_taba03_tabpage from userobject
string tag = "Tag_uo"
integer width = 645
integer height = 308
long backcolor = 67108864
string pointer = "Arrow!"
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
string powertiptext = "PowerTipText"
tab_1 tab_1
end type
global u_cst_taba03_tabpage u_cst_taba03_tabpage

type variables
String  is_str = '12345'
Integer ii_arr[] = {1, 2, 3, 4, 5}
str_taba03_tab istru_1


n_cst_1  invo_1

//u_cst_taba03_external	u_cst_etn
 
 
end variables

on u_cst_taba03_tabpage.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on u_cst_taba03_tabpage.destroy
destroy(this.tab_1)
end on

event constructor;
istru_1.num    = 1
istru_1.Name   = 'Test'
istru_1.flag   = False
istru_1.timing = DateTime(Date('2004/07/01'))


invo_1 = Create n_cst_1
//u_cst_etn = Create u_cst_taba03_external 

end event

type tab_1 from tab within u_cst_taba03_tabpage
integer width = 645
integer height = 308
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

event selectionchanged;String   ls_tab_Str 
Integer  li_tab_Int[]



ls_tab_Str = "ls_tab_Str"

li_tab_Int[1] = 1
li_tab_Int[2] = 2
li_tab_Int[3] = 3


end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 608
integer height = 180
long backcolor = 67108864
string text = "uo_page1"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_1 cb_1
end type

on tabpage_1.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on tabpage_1.destroy
destroy(this.cb_1)
end on

type cb_1 from u_taba03_commandbutton within tabpage_1
integer x = 78
integer y = 28
integer taborder = 40
end type

