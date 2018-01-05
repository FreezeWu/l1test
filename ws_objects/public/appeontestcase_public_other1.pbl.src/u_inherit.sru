$PBExportHeader$u_inherit.sru
forward
global type u_inherit from u_parent
end type
end forward

global type u_inherit from u_parent
end type
global u_inherit u_inherit

on u_inherit.create
call super::create
end on

on u_inherit.destroy
call super::destroy
end on

type cb_extend from u_parent`cb_extend within u_inherit
end type

event cb_extend::clicked;ii_test++

if ii_test = 1 then
   this.text = 'inherit'
end if
end event

type cb_insert from u_parent`cb_insert within u_inherit
string text = "insert_test"
end type

type cb_update from u_parent`cb_update within u_inherit
string text = "update_test"
end type

type cb_delete from u_parent`cb_delete within u_inherit
string text = "delete_test"
end type

type cb_retrieve from u_parent`cb_retrieve within u_inherit
integer width = 462
string text = "retrieve_test"
end type

