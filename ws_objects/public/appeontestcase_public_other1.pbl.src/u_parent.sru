$PBExportHeader$u_parent.sru
forward
global type u_parent from userobject
end type
type cb_extend from commandbutton within u_parent
end type
type cb_insert from commandbutton within u_parent
end type
type cb_update from commandbutton within u_parent
end type
type cb_delete from commandbutton within u_parent
end type
type cb_retrieve from commandbutton within u_parent
end type
end forward

global type u_parent from userobject
integer width = 1957
integer height = 840
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_retrieve pbm_custom01
event ue_delete pbm_custom02
event ue_update pbm_custom03
event ue_insert pbm_custom04
cb_extend cb_extend
cb_insert cb_insert
cb_update cb_update
cb_delete cb_delete
cb_retrieve cb_retrieve
end type
global u_parent u_parent

type variables
int  ii_test
end variables

event ue_retrieve;//
cb_retrieve.visible = true
end event

event ue_delete;//
cb_delete.visible = true
end event

event ue_update;//
cb_update.visible = true
end event

event ue_insert;//
cb_insert.visible = true
end event

on u_parent.create
this.cb_extend=create cb_extend
this.cb_insert=create cb_insert
this.cb_update=create cb_update
this.cb_delete=create cb_delete
this.cb_retrieve=create cb_retrieve
this.Control[]={this.cb_extend,&
this.cb_insert,&
this.cb_update,&
this.cb_delete,&
this.cb_retrieve}
end on

on u_parent.destroy
destroy(this.cb_extend)
destroy(this.cb_insert)
destroy(this.cb_update)
destroy(this.cb_delete)
destroy(this.cb_retrieve)
end on

type cb_extend from commandbutton within u_parent
integer x = 1198
integer y = 160
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Extend"
boolean default = true
end type

event clicked;ii_test = 1

this.text = 'ancestor'
end event

type cb_insert from commandbutton within u_parent
boolean visible = false
integer x = 640
integer y = 236
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "insert"
end type

event clicked;parent.TriggerEvent ("ue_insert")
end event

type cb_update from commandbutton within u_parent
boolean visible = false
integer x = 101
integer y = 232
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "update"
end type

event clicked;parent.TriggerEvent ("ue_update")
end event

type cb_delete from commandbutton within u_parent
boolean visible = false
integer x = 635
integer y = 64
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "delete"
end type

event clicked;parent.TriggerEvent ("ue_delete")
end event

type cb_retrieve from commandbutton within u_parent
boolean visible = false
integer x = 110
integer y = 56
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "retrieve"
end type

event clicked;parent.TriggerEvent ("ue_retrieve")
end event

