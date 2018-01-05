$PBExportHeader$uo_graph_stru.sru
forward
global type uo_graph_stru from uo_graph_ds
end type
end forward

global type uo_graph_stru from uo_graph_ds
end type
global uo_graph_stru uo_graph_stru

type variables
stru_dept  istru_ds
end variables

event constructor;string ls_output,ls_depart
long ll_id,ll_count,ll_cate

datastore lds
lds = create datastore
lds.dataobject = 'dddw_department'
lds.settransobject( sqlca)
lds.retrieve( )
istru_ds = message.powerobjectparm
ids = istru_ds.d_ds
ids.settransobject(sqlca)
this.title = istru_ds.s_tile
for ll_count = 1 to lds.rowcount()
	ls_depart = lds.getitemstring(ll_count,'dept_name')
	ll_id = lds.getitemnumber(ll_count,'dept_id')
	ll_cate = this.addseries( ls_depart)
	ids.setfilter( 'dept_id = '+string(ll_id))
	ids.filter( )
	this.adddata(ll_cate,ids.rowcount())
	this.category.label = 'Department'
	this.Values.Label = 'People Count'
next
iw = gf_parentwindow(this)
ls_output = this.classname( )+" constructor Triggered !"
iw.function dynamic wf_output(ls_output,true)
end event

