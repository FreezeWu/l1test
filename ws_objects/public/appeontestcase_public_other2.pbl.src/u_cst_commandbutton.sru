$PBExportHeader$u_cst_commandbutton.sru
forward
global type u_cst_commandbutton from userobject
end type
type cb_1 from commandbutton within u_cst_commandbutton
end type
end forward

global type u_cst_commandbutton from userobject
integer width = 389
integer height = 112
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_1 cb_1
end type
global u_cst_commandbutton u_cst_commandbutton

on u_cst_commandbutton.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on u_cst_commandbutton.destroy
destroy(this.cb_1)
end on

event constructor;//w_taba04w01_opentabevent.wf_OutPut('u_cst_commandbutton.Constructor()', False)
end event

type cb_1 from commandbutton within u_cst_commandbutton
integer width = 389
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "cb_1"
end type

event clicked;//w_taba04w01_opentabevent.wf_OutPut('u_cst_commandbutton.cb_1.Constructor()', False)
end event

