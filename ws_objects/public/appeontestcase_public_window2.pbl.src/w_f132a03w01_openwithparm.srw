$PBExportHeader$w_f132a03w01_openwithparm.srw
forward
global type w_f132a03w01_openwithparm from window
end type
type cb_1 from commandbutton within w_f132a03w01_openwithparm
end type
end forward

global type w_f132a03w01_openwithparm from window
integer width = 3959
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
cb_1 cb_1
end type
global w_f132a03w01_openwithparm w_f132a03w01_openwithparm

forward prototypes
public function integer wf_output (string as_mess, boolean ab_clear)
end prototypes

public function integer wf_output (string as_mess, boolean ab_clear);//
return 1
end function

on w_f132a03w01_openwithparm.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_f132a03w01_openwithparm.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_f132a03w01_openwithparm
integer x = 1202
integer y = 596
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

