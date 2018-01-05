$PBExportHeader$w_dde_test1.srw
forward
global type w_dde_test1 from window
end type
type cb_2 from commandbutton within w_dde_test1
end type
type cb_1 from commandbutton within w_dde_test1
end type
end forward

global type w_dde_test1 from window
integer width = 3566
integer height = 1648
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
end type
global w_dde_test1 w_dde_test1

on w_dde_test1.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.cb_1}
end on

on w_dde_test1.destroy
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;//
this.visible = false
end event

type cb_2 from commandbutton within w_dde_test1
integer x = 366
integer y = 592
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CLOSE"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_dde_test1
integer x = 338
integer y = 228
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "dde test"
end type

event clicked;//string ls_data
//String ls_ddeappl = "DDE_Demo",ls_ddetopic="DDE"
//string ls_item1="Data1",ls_item2="Data2",ls_item3="Data3"


//setnull(gi_StartHotLink)
//setnull(gi_GetRemote)
//setnull(gi_ExecRemote)
//setnull(gi_StopHotLink)
//
//gi_StartHotLink = StartHotLink('Data1', 'DDE_Demo', 'DDE')
//gi_GetRemote  = GetRemote(ls_item1, ls_data, ls_ddeappl, ls_ddetopic)
//gi_ExecRemote  = ExecRemote('', 'DDE_Demo', 'DDE')
//gi_StopHotLink = StopHotLink('Data1', 'DDE_Demo', 'DDE')

//StartHotLink('Data1', 'DDE_Demo', 'DDE')
//StartHotLink("Any", "MyPBApp", "Any")
//StopHotLink("Any", "MyPBApp", "Any")
//GetRemote(ls_item1, ls_data, ls_ddeappl, ls_ddetopic)
//ExecRemote('', 'DDE_Demo', 'DDE')
//StopHotLink('Data1', 'DDE_Demo', 'DDE')
end event

