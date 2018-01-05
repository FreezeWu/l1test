$PBExportHeader$uo_tree_ds.sru
forward
global type uo_tree_ds from treeview
end type
end forward

global type uo_tree_ds from treeview
integer width = 553
integer height = 1000
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type
global uo_tree_ds uo_tree_ds

type variables
window iw
datastore ids
end variables

event constructor;string ls_output,ls_depart,ls_fn,ls_ln,ls_name
long ll_id,ll_count,ll_cate,ll_count2
long ll_parent,ll_child
treeviewitem itr_1,itr_2

datastore lds
lds = create datastore
lds.dataobject = 'dddw_department'
lds.settransobject( sqlca)
lds.retrieve( )
ids = message.powerobjectparm
ids.settransobject(sqlca)
for ll_count = 1 to lds.rowcount()
	ls_depart = lds.getitemstring(ll_count,'dept_name')
	ll_id = lds.getitemnumber(ll_count,'dept_id')
	ids.setfilter( 'dept_id = '+string(ll_id))
	ids.filter( )
	itr_1.label = ls_depart
	itr_1.data = 1
	ll_parent = this.insertitemlast( 0,itr_1)
	for ll_count2 = 1 to ids.rowcount()
		ls_fn = ids.getitemstring(ll_count2,'emp_fname')
		ls_ln = ids.getitemstring(ll_count2,'emp_lname')
		ls_name = ls_fn+" "+ls_ln
		itr_2.label = ls_name
		itr_2.data = 2
		this.insertitemlast( ll_parent, itr_2)
	next
next
iw = gf_parentwindow(this)
ls_output = this.classname( )+" constructor Triggered !"
iw.function dynamic wf_output(ls_output,true)
end event

on uo_tree_ds.create
end on

on uo_tree_ds.destroy
end on

event destructor;string ls_output
ls_output = this.classname( )+" destructor Triggered !"
iw.function dynamic wf_output(ls_output,true)
end event

event itempopulate;string ls_output
ls_output = this.classname( )+" itempopulate Triggered !"
iw.function dynamic wf_output(ls_output,true)
end event

