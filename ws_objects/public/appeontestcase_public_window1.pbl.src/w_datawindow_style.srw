$PBExportHeader$w_datawindow_style.srw
forward
global type w_datawindow_style from w_base
end type
type cb_12 from commandbutton within w_datawindow_style
end type
type cb_11 from commandbutton within w_datawindow_style
end type
type cb_10 from commandbutton within w_datawindow_style
end type
type cb_9 from commandbutton within w_datawindow_style
end type
type cb_8 from commandbutton within w_datawindow_style
end type
type cb_7 from commandbutton within w_datawindow_style
end type
type cb_6 from commandbutton within w_datawindow_style
end type
type cb_5 from commandbutton within w_datawindow_style
end type
type cb_4 from commandbutton within w_datawindow_style
end type
type cb_3 from commandbutton within w_datawindow_style
end type
type cb_2 from commandbutton within w_datawindow_style
end type
type dw_1 from datawindow within w_datawindow_style
end type
type cb_1 from commandbutton within w_datawindow_style
end type
type st_1 from statictext within w_datawindow_style
end type
end forward

global type w_datawindow_style from w_base
integer width = 2843
integer height = 1688
string title = "datawindow Styles"
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
st_1 st_1
end type
global w_datawindow_style w_datawindow_style

on w_datawindow_style.create
int iCurrent
call super::create
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_12
this.Control[iCurrent+2]=this.cb_11
this.Control[iCurrent+3]=this.cb_10
this.Control[iCurrent+4]=this.cb_9
this.Control[iCurrent+5]=this.cb_8
this.Control[iCurrent+6]=this.cb_7
this.Control[iCurrent+7]=this.cb_6
this.Control[iCurrent+8]=this.cb_5
this.Control[iCurrent+9]=this.cb_4
this.Control[iCurrent+10]=this.cb_3
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.dw_1
this.Control[iCurrent+13]=this.cb_1
this.Control[iCurrent+14]=this.st_1
end on

on w_datawindow_style.destroy
call super::destroy
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.st_1)
end on

event ue_execute;call super::ue_execute;choose case as_testcasename 
	case 'DW_datawindow_Composite'
		cb_1.triggerevent( clicked!)
	case 'DW_datawindow_CrossTab'
		cb_2.triggerevent( clicked!)
	case 'DW_datawindow_FreeForm'
		cb_3.triggerevent( clicked!)
	case 'DW_datawindow_Graph'
		cb_4.triggerevent( clicked!)
	case 'DW_datawindow_Grid'
		cb_5.triggerevent( clicked!)
	case 'DW_datawindow_Group'
		cb_6.triggerevent( clicked!)
	case 'DW_datawindow_Label'
		cb_7.triggerevent( clicked!)
	case 'DW_datawindow_Nup'
		cb_8.triggerevent( clicked!)
	case 'DW_datawindow_OLE'
		cb_9.triggerevent( clicked!)
//	case 'DW_datawindow_RichText' not support
//		cb_10.triggerevent( clicked!)
	case 'DW_datawindow_Tabular'
		cb_11.triggerevent( clicked!)
	case 'DW_datawindow_TreeView'
		cb_12.triggerevent( clicked!)
end choose

close(this)



end event

type cb_12 from commandbutton within w_datawindow_style
integer x = 645
integer y = 1012
integer width = 457
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "TreeView Test"
end type

event clicked;string ls_result
string ls_firstname
long ll_rowcount,ll_return
datastore lds_1
lds_1 = create datastore

//TreeView

lds_1.dataobject = 'd_dwstyle_treeview'
dw_1.dataobject = 'd_dwstyle_treeview'
lds_1.settransobject( sqlca)
dw_1.settransobject(sqlca)

lds_1.retrieve( )
dw_1.retrieve( )

ls_result = "dw_1.dataobject = "+dw_1.dataobject+"~r~n"
ls_result += "ds_1.rowcount() = "+string(lds_1.rowcount())+"~r~n"
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "datawindow.processing = "+string(dw_1.object.datawindow.Processing)+"~r~n"

ls_firstname = dw_1.getitemstring(2,"t_products_fproname")
ls_result += "dw_1.getitemstring(2,'t_products_fproname') = "+ls_firstname+"~r~n"
ls_result += "ds_1.object.t_products_fproname[2] = "+lds_1.object.t_products_fproname[2]+"~r~n"
ll_return = dw_1.selectrow(3,true)
ls_result += "dw_1.selectrow(3,true) = "+string(ll_return)+"~r~n"
ll_return = dw_1.setfilter("t_products_funit_price > 20")
ls_result += "dw_1.setfilter('t_products_funit_price > 20') = "+string(ll_return)+"~r~n"
dw_1.filter()
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "dw_1.filteredcount( ) = "+string(dw_1.filteredcount( ))+"~r~n"

ll_return = dw_1.ExpandAll()
ls_result += "dw_1.ExpandAll() = "+string(ll_return)+"~r~n"

ll_return = lds_1.ExpandAll()
ls_result += "ds_1.ExpandAll() = "+string(ll_return)+"~r~n"

ll_return = dw_1.CollapseAll()
ls_result += "dw_1.CollapseAll() = "+string(ll_return)+"~r~n"

ll_return = lds_1.CollapseAll()
ls_result += "ds_1.CollapseAll() = "+string(ll_return)+"~r~n"

If IsValid ( lds_1 ) Then destroy ( lds_1 )

gf_returnresult(ls_result)
end event

type cb_11 from commandbutton within w_datawindow_style
integer x = 645
integer y = 864
integer width = 457
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Tabular Test"
end type

event clicked;string ls_result
string ls_firstname
long ll_rowcount,ll_return
datastore lds_1
lds_1 = create datastore

//Tabular

lds_1.dataobject = 'd_dwstyle_Tabular2'
dw_1.dataobject = 'd_dwstyle_Tabular2'
lds_1.settransobject( sqlca)
dw_1.settransobject(sqlca)

lds_1.retrieve( )
dw_1.retrieve( )

ls_result = "dw_1.dataobject = "+dw_1.dataobject+"~r~n"
ls_result += "ds_1.rowcount() = "+string(lds_1.rowcount())+"~r~n"
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "datawindow.processing = "+string(dw_1.object.datawindow.Processing)+"~r~n"

ls_firstname = dw_1.getitemstring(2,"emp_fname")
ls_result += "dw_1.getitemstring(2,'emp_fname') = "+ls_firstname+"~r~n"
ls_result += "ds_1.object.emp_fname[2] = "+lds_1.object.emp_fname[2]+"~r~n"
ll_return = dw_1.selectrow(3,true)
ls_result += "dw_1.selectrow(3,true) = "+string(ll_return)+"~r~n"
ll_return = dw_1.setfilter("emp_id > 200")
ls_result += "dw_1.setfilter('emp_id > 200') = "+string(ll_return)+"~r~n"
dw_1.filter()
//dw_1.DeleteRow(1)
//ls_result += "dw_1.DeleteRow(1) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "dw_1.filteredcount( ) = "+string(dw_1.filteredcount( ))+"~r~n"
//ls_result += "dw_1.deletedcount( ) = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.DeleteRow(1)
ls_result += "dw_1.DeleteRow(1) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.Deletedcount() = "+string(dw_1.Deletedcount( ))+"~r~n"

ll_return = dw_1.RowsDiscard(1,1,primary!)
ls_result += "dw_1.RowsDiscard(1,1,primary!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsDiscard = "+string(dw_1.rowcount( ))+"~r~n"

ll_return = dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!)
ls_result += "dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsCopy = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.Deletedcount() for RowsCopy = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.RowsMove(1,1,primary!,dw_1,1,filter!)
ls_result += "dw_1.RowsMove(1,1,primary!,dw_1,1,filter!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsMove = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.filteredcount() for RowsMove = "+string(dw_1.filteredcount( ))+"~r~n"

If IsValid ( lds_1 ) Then destroy ( lds_1 )

gf_returnresult(ls_result)
end event

type cb_10 from commandbutton within w_datawindow_style
integer x = 645
integer y = 716
integer width = 457
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "RichText Test"
end type

event clicked;string ls_result
string ls_firstname
long ll_rowcount,ll_return
datastore lds_1
lds_1 = create datastore

//RichText  not support... 

//lds_1.dataobject = 'd_dwstyle_composite1'
//dw_1.dataobject = 'd_dwstyle_composite1'
//lds_1.settransobject( sqlca)
//dw_1.settransobject(sqlca)
//
//lds_1.retrieve( )
//dw_1.retrieve( )
//
//ls_result = "dw_1.dataobject = "+dw_1.dataobject+"~r~n"
//ls_result += "ds_1.rowcount() = "+string(lds_1.rowcount())+"~r~n"
//ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
//ls_result += "datawindow.processing = "+string(dw_1.object.datawindow.Processing)+"~r~n"
//
//ls_firstname = dw_1.getitemstring(2,"emp_fname")
//ls_result += "dw_1.getitemstring(2,'emp_fname') = "+ls_firstname+"~r~n"
//ls_result += "ds_1.object.emp_fname[2] = "+lds_1.object.emp_fname[2]+"~r~n"
//ll_return = dw_1.selectrow(3,true)
//ls_result += "dw_1.selectrow(3,true) = "+string(ll_return)+"~r~n"
//ll_return = dw_1.setfilter("emp_id > 200")
//ls_result += "dw_1.setfilter('emp_id > 200') = "+string(ll_return)+"~r~n"
//dw_1.filter()
//ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
//ls_result += "dw_1.filteredcount( ) = "+string(dw_1.filteredcount( ))+"~r~n"

If IsValid ( lds_1 ) Then destroy ( lds_1 )

gf_returnresult(ls_result)
end event

type cb_9 from commandbutton within w_datawindow_style
integer x = 645
integer y = 568
integer width = 457
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OLE Test"
end type

event clicked;string ls_result
//string ls_firstname
//long ll_rowcount,ll_return
//datastore lds_1
//lds_1 = create datastore
//
//
////OLE 2.0
//
//lds_1.dataobject = 'd_dwstyle_composite1'
//dw_1.dataobject = 'd_dwstyle_composite1'
//lds_1.settransobject( sqlca)
//dw_1.settransobject(sqlca)
//
//lds_1.retrieve( )
//dw_1.retrieve( )
//
//ls_result = "dw_1.dataobject = "+dw_1.dataobject+"~r~n"
//ls_result += "ds_1.rowcount() = "+string(lds_1.rowcount())+"~r~n"
//ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
//ls_result += "datawindow.processing = "+string(dw_1.object.datawindow.Processing)+"~r~n"
//
//ls_firstname = dw_1.getitemstring(2,"emp_fname")
//ls_result += "dw_1.getitemstring(2,'emp_fname') = "+ls_firstname+"~r~n"
//ls_result += "ds_1.object.emp_fname[2] = "+lds_1.object.emp_fname[2]+"~r~n"
//ll_return = dw_1.selectrow(3,true)
//ls_result += "dw_1.selectrow(3,true) = "+string(ll_return)+"~r~n"
//ll_return = dw_1.setfilter("emp_id > 200")
//ls_result += "dw_1.setfilter('emp_id > 200') = "+string(ll_return)+"~r~n"
//dw_1.filter()
//ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
//ls_result += "dw_1.filteredcount( ) = "+string(dw_1.filteredcount( ))+"~r~n"
//
//If IsValid ( lds_1 ) Then destroy ( lds_1 )

gf_returnresult(ls_result)
end event

type cb_8 from commandbutton within w_datawindow_style
integer x = 645
integer y = 420
integer width = 457
integer height = 112
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Nup Test"
end type

event clicked;string ls_result
string ls_firstname
long ll_rowcount,ll_return
datastore lds_1
lds_1 = create datastore

//N-Up

lds_1.dataobject = 'd_dwstyle_nup3'
dw_1.dataobject = 'd_dwstyle_nup3'
lds_1.settransobject( sqlca)
dw_1.settransobject(sqlca)

lds_1.retrieve( )
dw_1.retrieve( )

ls_result = "dw_1.dataobject = "+dw_1.dataobject+"~r~n"
ls_result += "ds_1.rowcount() = "+string(lds_1.rowcount())+"~r~n"
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "datawindow.processing = "+string(dw_1.object.datawindow.Processing)+"~r~n"

ls_firstname = dw_1.getitemstring(2,"fname")
ls_result += "dw_1.getitemstring(2,'fname') = "+ls_firstname+"~r~n"
ls_result += "ds_1.object.fname[2] = "+lds_1.object.fname[2]+"~r~n"
ll_return = dw_1.selectrow(3,true)
ls_result += "dw_1.selectrow(3,true) = "+string(ll_return)+"~r~n"
ll_return = dw_1.setfilter("fname <> '" +ls_firstname + "'" )
ls_result += "dw_1.setfilter(fname <> '" +ls_firstname + "' ) = "+string(ll_return)+"~r~n"
dw_1.filter()
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "dw_1.filteredcount( ) = "+string(dw_1.filteredcount( ))+"~r~n"

ll_return = dw_1.DeleteRow(1)
ls_result += "dw_1.DeleteRow(1) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.deletedcount() = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.RowsDiscard(1,1,primary!)
ls_result += "dw_1.RowsDiscard(1,1,primary!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsDiscard = "+string(dw_1.rowcount( ))+"~r~n"

ll_return = dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!)
ls_result += "dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsCopy = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.Deletedcount() for RowsCopy = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.RowsMove(1,1,primary!,dw_1,1,filter!)
ls_result += "dw_1.RowsMove(1,1,primary!,dw_1,1,filter!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsMove = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.filteredcount() for RowsMove = "+string(dw_1.filteredcount( ))+"~r~n"

If IsValid ( lds_1 ) Then destroy ( lds_1 )
gf_returnresult(ls_result)
end event

type cb_7 from commandbutton within w_datawindow_style
integer x = 645
integer y = 272
integer width = 457
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Label Test"
end type

event clicked;string ls_result
string ls_firstname
long ll_rowcount,ll_return
datastore lds_1
lds_1 = create datastore

//Label

lds_1.dataobject = 'd_dwstyle_Label3'
dw_1.dataobject = 'd_dwstyle_Label3'
lds_1.settransobject( sqlca)
dw_1.settransobject(sqlca)

lds_1.retrieve( )
dw_1.retrieve( )

ls_result = "dw_1.dataobject = "+dw_1.dataobject+"~r~n"
ls_result += "ds_1.rowcount() = "+string(lds_1.rowcount())+"~r~n"
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "datawindow.processing = "+string(dw_1.object.datawindow.Processing)+"~r~n"

ls_firstname = dw_1.getitemstring(2,"employee_emp_fname")
ls_result += "dw_1.getitemstring(2,'employee_emp_fname') = "+ls_firstname+"~r~n"
ls_result += "ds_1.object.employee_emp_fname[2] = "+lds_1.object.employee_emp_fname[2]+"~r~n"
ll_return = dw_1.selectrow(3,true)
ls_result += "dw_1.selectrow(3,true) = "+string(ll_return)+"~r~n"
ll_return = dw_1.setfilter("emp_id > 200")
ls_result += "dw_1.setfilter('emp_id > 200') = "+string(ll_return)+"~r~n"
dw_1.filter()
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "dw_1.filteredcount( ) = "+string(dw_1.filteredcount( ))+"~r~n"

ll_return = dw_1.DeleteRow(1)
ls_result += "dw_1.DeleteRow(1) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.Deletedcount() = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.RowsDiscard(1,1,primary!)
ls_result += "dw_1.RowsDiscard(1,1,primary!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsDiscard = "+string(dw_1.rowcount( ))+"~r~n"

ll_return = dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!)
ls_result += "dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsCopy = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.Deletedcount() for RowsCopy = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.RowsMove(1,1,primary!,dw_1,1,filter!)
ls_result += "dw_1.RowsMove(1,1,primary!,dw_1,1,filter!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsMove = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.filteredcount() for RowsMove = "+string(dw_1.filteredcount( ))+"~r~n"

If IsValid ( lds_1 ) Then destroy ( lds_1 )

gf_returnresult(ls_result)
end event

type cb_6 from commandbutton within w_datawindow_style
integer x = 96
integer y = 1012
integer width = 457
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Group Test"
end type

event clicked;string ls_result
string ls_firstname
long ll_rowcount,ll_return
datastore lds_1
lds_1 = create datastore

//Group

lds_1.dataobject = 'd_dwstyle_Group1'
dw_1.dataobject = 'd_dwstyle_Group1'
lds_1.settransobject( sqlca)
dw_1.settransobject(sqlca)

lds_1.retrieve( )
dw_1.retrieve( )

ls_result = "dw_1.dataobject = "+dw_1.dataobject+"~r~n"
ls_result += "ds_1.rowcount() = "+string(lds_1.rowcount())+"~r~n"
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "datawindow.processing = "+string(dw_1.object.datawindow.Processing)+"~r~n"

ls_firstname = dw_1.getitemstring(2,"emp_fname")
ls_result += "dw_1.getitemstring(2,'emp_fname') = "+ls_firstname+"~r~n"
ls_result += "ds_1.object.emp_fname[2] = "+lds_1.object.emp_fname[2]+"~r~n"
ll_return = dw_1.selectrow(3,true)
ls_result += "dw_1.selectrow(3,true) = "+string(ll_return)+"~r~n"
ll_return = dw_1.setfilter("emp_id > 200")
ls_result += "dw_1.setfilter('emp_id > 200') = "+string(ll_return)+"~r~n"
dw_1.filter()
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "dw_1.filteredcount( ) = "+string(dw_1.filteredcount( ))+"~r~n"

ll_return = dw_1.DeleteRow(1)
ls_result += "dw_1.DeleteRow(1) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.Deletedcount() = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.RowsDiscard(1,1,primary!)
ls_result += "dw_1.RowsDiscard(1,1,primary!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsDiscard = "+string(dw_1.rowcount( ))+"~r~n"

ll_return = dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!)
ls_result += "dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.Rowcount() for RowsCopy = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.Deletedcount() for RowsCopy = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.RowsMove(1,1,primary!,dw_1,1,filter!)
ls_result += "dw_1.RowsMove(1,1,primary!,dw_1,1,filter!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.Rowcount() for RowsMove = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.Filteredcount() for RowsMove = "+string(dw_1.filteredcount( ))+"~r~n"

If IsValid ( lds_1 ) Then destroy ( lds_1 )

destroy lds_1

gf_returnresult(ls_result)
end event

type cb_5 from commandbutton within w_datawindow_style
integer x = 96
integer y = 864
integer width = 457
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Grid Test"
end type

event clicked;string ls_result
string ls_firstname
long ll_rowcount,ll_return
datastore lds_1
lds_1 = create datastore

//Grid

lds_1.dataobject = 'd_dwstyle_Grid2'
dw_1.dataobject = 'd_dwstyle_Grid2'
lds_1.settransobject( sqlca)
dw_1.settransobject(sqlca)

lds_1.retrieve( )
dw_1.retrieve( )

ls_result = "dw_1.dataobject = "+dw_1.dataobject+"~r~n"
ls_result += "ds_1.rowcount() = "+string(lds_1.rowcount())+"~r~n"
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "datawindow.processing = "+string(dw_1.object.datawindow.Processing)+"~r~n"

ls_firstname = dw_1.getitemstring(2,"emp_fname")
ls_result += "dw_1.getitemstring(2,'emp_fname') = "+ls_firstname+"~r~n"
ls_result += "ds_1.object.emp_fname[2] = "+lds_1.object.emp_fname[2]+"~r~n"
ll_return = dw_1.selectrow(3,true)
ls_result += "dw_1.selectrow(3,true) = "+string(ll_return)+"~r~n"
ll_return = dw_1.setfilter("emp_id > 200")
ls_result += "dw_1.setfilter('emp_id > 200') = "+string(ll_return)+"~r~n"
dw_1.filter()
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "dw_1.filteredcount( ) = "+string(dw_1.filteredcount( ))+"~r~n"

ll_return = dw_1.DeleteRow(1)
ls_result += "dw_1.DeleteRow(1) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.Deletedcount() = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.RowsDiscard(1,1,primary!)
ls_result += "dw_1.RowsDiscard(1,1,primary!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsDiscard = "+string(dw_1.rowcount( ))+"~r~n"

ll_return = dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!)
ls_result += "dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsCopy = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.Deletedcount() for RowsCopy = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.RowsMove(1,1,primary!,dw_1,1,filter!)
ls_result += "dw_1.RowsMove(1,1,primary!,dw_1,1,filter!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsMove = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.filteredcount() for RowsMove = "+string(dw_1.filteredcount( ))+"~r~n"


If IsValid ( lds_1 ) Then destroy ( lds_1 )

//dw_1.SaveAs("testxml.xml", XML!, false)

gf_returnresult(ls_result)
end event

type cb_4 from commandbutton within w_datawindow_style
integer x = 96
integer y = 716
integer width = 457
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Graph Test"
end type

event clicked;string ls_result
string ls_firstname
long ll_rowcount,ll_return
datastore lds_1
lds_1 = create datastore

//Graph
lds_1.dataobject = 'd_products_pie3d_graph3'
dw_1.dataobject = 'd_products_pie3d_graph3'
lds_1.settransobject( sqlca)
dw_1.settransobject(sqlca)
lds_1.retrieve( )
dw_1.retrieve( )

ls_result = "dw_1.dataobject = "+dw_1.dataobject+"~r~n"
ls_result += "ds_1.rowcount() = "+string(lds_1.rowcount())+"~r~n"
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "datawindow.processing = "+string(dw_1.object.datawindow.Processing)+"~r~n"
ll_return = dw_1.CategoryCount("gr_1")
ls_result += "dw_1.CategoryCount('gr_1') = "+string(ll_return)+"~r~n"
ls_result += "dw_1.CategoryName('gr_1',2) = "+string(dw_1.CategoryName('gr_1',2))+"~r~n"
ls_result += "dw_1.Object.gr_1.GraphType = "+string(dw_1.Object.gr_1.GraphType)+"~r~n"
ls_result += "ds_1.Object.gr_1.GraphType = "+string(lds_1.Object.gr_1.GraphType)+"~r~n"
ll_return = dw_1.FindCategory("gr_1", "Sweatshirt")
ls_result += "dw_1.FindCategory('gr_1', 'Sweatshirt') = "+string(ll_return)+"~r~n"
ll_return = dw_1.FindSeries("gr_1", "Sweatshirt")
ls_result += "dw_1.FindSeries('gr_1', 'Sweatshirt') = "+string(ll_return)+"~r~n"
integer datapoint,percentage
percentage = 50
ll_return= dw_1.GetDataPieExplode('gr_1',1,10, percentage)
ls_result += "dw_1.GetDataPieExplode('gr_1',1,10, 50) = "+string(percentage)+"~r~n"
long color_nbr
ll_return = dw_1.GetDataStyle('gr_1',1,1, Foreground!, color_nbr)
ls_result += "dw_1.GetDataStyle('gr_1',1,1, Foreground!, color_nbr) = "+string(color_nbr)+"~r~n"


If IsValid ( lds_1 ) Then destroy ( lds_1 )

gf_returnresult(ls_result)
end event

type cb_3 from commandbutton within w_datawindow_style
integer x = 96
integer y = 568
integer width = 457
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "FreeForm Test"
end type

event clicked;string ls_result
string ls_firstname
long ll_rowcount,ll_return
datastore lds_1
lds_1 = create datastore

//FreeForm

lds_1.dataobject = 'd_dwstyle_FreeForm1'
dw_1.dataobject = 'd_dwstyle_FreeForm1'
lds_1.settransobject( sqlca)
dw_1.settransobject(sqlca)

lds_1.retrieve( )
dw_1.retrieve( )

ls_result = "dw_1.dataobject = "+dw_1.dataobject+"~r~n"
ls_result += "ds_1.rowcount() = "+string(lds_1.rowcount())+"~r~n"
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "datawindow.processing = "+string(dw_1.object.datawindow.Processing)+"~r~n"

ls_firstname = dw_1.getitemstring(2,"employee_emp_fname")
ls_result += "dw_1.getitemstring(2,'employee_emp_fname') = "+ls_firstname+"~r~n"
ls_result += "ds_1.object.employee_emp_fname[2] = "+lds_1.object.employee_emp_fname[2]+"~r~n"
ll_return = dw_1.selectrow(3,true)
ls_result += "dw_1.selectrow(3,true) = "+string(ll_return)+"~r~n"

ll_return = dw_1.setfilter("employee_emp_id > 500")
ls_result += "dw_1.setfilter('employee_emp_id > 500') = "+string(ll_return)+"~r~n"
dw_1.filter()
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "dw_1.filteredcount( ) = "+string(dw_1.filteredcount( ))+"~r~n"

ll_return = dw_1.DeleteRow(1)
ls_result += "dw_1.DeleteRow(1) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.deletedcount() = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.RowsDiscard(1,1,primary!)
ls_result += "dw_1.RowsDiscard(1,1,primary!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsDiscard = "+string(dw_1.rowcount( ))+"~r~n"

ll_return = dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!)
ls_result += "dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsCopy = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.deletedcount() for RowsCopy = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.RowsMove(1,1,primary!,dw_1,1,filter!)
ls_result += "dw_1.RowsMove(1,1,primary!,dw_1,1,filter!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsMove = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.filteredcount() for RowsMove = "+string(dw_1.filteredcount( ))+"~r~n"




If IsValid ( lds_1 ) Then destroy ( lds_1 )

gf_returnresult(ls_result)
end event

type cb_2 from commandbutton within w_datawindow_style
integer x = 96
integer y = 420
integer width = 457
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CrossTab Test"
end type

event clicked;string ls_result
string ls_firstname
long ll_rowcount,ll_return
datastore lds_1
lds_1 = create datastore

Double 	ldb_Max

//CrossTab

lds_1.dataobject = 'd_dwstyle_CrossTab1'
dw_1.dataobject = 'd_dwstyle_CrossTab1'
lds_1.settransobject( sqlca)
dw_1.settransobject(sqlca)

lds_1.retrieve( )
dw_1.retrieve( )

ls_result = "dw_1.dataobject = "+dw_1.dataobject+"~r~n"
ls_result += "ds_1.rowcount() = "+string(lds_1.rowcount())+"~r~n"
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "datawindow.processing = "+string(dw_1.object.datawindow.Processing)+"~r~n"

ls_firstname = dw_1.getitemstring(2,"fname")
ls_result += "dw_1.getitemstring(2,'fname') = "+ls_firstname+"~r~n"
ls_result += "ds_1.object.fname[2] = "+lds_1.object.fname[2]+"~r~n"
ll_return = dw_1.selectrow(3,true)
ls_result += "dw_1.selectrow(3,true) = "+string(ll_return)+"~r~n"
ll_return = dw_1.setfilter("cust_id > 110")
ls_result += "dw_1.setfilter('cust_id > 110') = "+string(ll_return)+"~r~n"
dw_1.filter()
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "dw_1.filteredcount( ) = "+string(dw_1.filteredcount( ))+"~r~n"

ll_return = dw_1.DeleteRow(1)
ls_result += "dw_1.DeleteRow(1) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.deletedcount() = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.RowsDiscard(1,1,primary!)
ls_result += "dw_1.RowsDiscard(1,1,primary!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsDiscard = "+string(dw_1.rowcount( ))+"~r~n"

ll_return = dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!)
ls_result += "dw_1.RowsCopy(1,1,primary!,dw_1,1,delete!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsCopy = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.deletedcount() for RowsCopy = "+string(dw_1.deletedcount( ))+"~r~n"

ll_return = dw_1.RowsMove(1,1,primary!,dw_1,1,filter!)
ls_result += "dw_1.RowsMove(1,1,primary!,dw_1,1,filter!) = "+string(ll_return)+"~r~n"
ls_result += "dw_1.rowcount() for RowsMove = "+string(dw_1.rowcount( ))+"~r~n"
ls_result += "dw_1.filteredcount() for RowsMove = "+string(dw_1.filteredcount( ))+"~r~n"


If IsValid ( lds_1 ) Then destroy ( lds_1 )

gf_returnresult(ls_result)
end event

type dw_1 from datawindow within w_datawindow_style
integer x = 1303
integer y = 268
integer width = 1422
integer height = 784
integer taborder = 10
string title = "none"
boolean livescroll = true
end type

type cb_1 from commandbutton within w_datawindow_style
integer x = 96
integer y = 272
integer width = 457
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Composite Test"
end type

event clicked;string ls_result
string ls_firstname
long ll_rowcount,ll_return
DataWindowChild 	ldc_1
datastore lds_1
lds_1 = create datastore

//Composite

lds_1.dataobject = 'd_dwstyle_composite1'
dw_1.dataobject = 'd_dwstyle_composite1'
lds_1.settransobject( sqlca)
dw_1.settransobject(sqlca)

lds_1.retrieve( )
dw_1.retrieve( )

ls_result = "dw_1.dataobject = "+dw_1.dataobject+"~r~n"
ls_result += "ds_1.rowcount() = "+string(lds_1.rowcount())+"~r~n"
ls_result += "dw_1.rowcount() = "+string(dw_1.rowcount())+"~r~n"
ls_result += "datawindow.processing = "+string(dw_1.object.datawindow.Processing)+"~r~n"

dw_1.GetChild ( "dw_3", ldc_1 )
ls_firstname = ldc_1.getitemstring(2,"name")
ls_result += "ldc_1.getitemstring(2,'name') = "+ls_firstname+"~r~n"
//ls_result += "ds_1.object.name[2] = "+ldc_1.object.name[2]+"~r~n"
ll_return = ldc_1.selectrow(3,true)
ls_result += "ldc_1.selectrow(3,true) = "+string(ll_return)+"~r~n"
ll_return = ldc_1.setfilter("id > 400")
ls_result += "ldc_1.setfilter('id > 400') = "+string(ll_return)+"~r~n"
ldc_1.filter()
ls_result += "ldc_1.rowcount() = "+string(ldc_1.rowcount())+"~r~n"
ls_result += "ldc_1.filteredcount( ) = "+string(ldc_1.filteredcount( ))+"~r~n"
ll_return = ldc_1.DeleteRow(1)
ls_result += "ldc_1.DeleteRow(1) = "+string(ll_return)+"~r~n"
ls_result += "ldc_1.deletedcount( ) = "+string(ldc_1.deletedcount( ))+"~r~n"

ll_return = ldc_1.RowsDiscard(1,1,primary!)
ls_result += "ldc_1.RowsDiscard(1,1,primary!) = "+string(ll_return)+"~r~n"
ls_result += "ldc_1.rowcount() for RowsDiscard = "+string(ldc_1.rowcount( ))+"~r~n"

ll_return = ldc_1.RowsCopy(1,1,primary!,ldc_1,1,delete!)
ls_result += "ldc_1.RowsCopy(1,1,primary!,ldc_1,1,delete!) = "+string(ll_return)+"~r~n"
ls_result += "ldc_1.rowcount() for RowsCopy = "+string(ldc_1.rowcount( ))+"~r~n"
ls_result += "ldc_1.deletedcount() for RowsCopy = "+string(ldc_1.deletedcount( ))+"~r~n"

ll_return = ldc_1.RowsMove(1,1,primary!,ldc_1,1,filter!)
ls_result += "ldc_1.RowsMove(1,1,primary!,ldc_1,1,filter!) = "+string(ll_return)+"~r~n"
ls_result += "ldc_1.rowcount() for RowsMove = "+string(ldc_1.rowcount( ))+"~r~n"
ls_result += "ldc_1.filteredcount() for RowsMove = "+string(ldc_1.filteredcount( ))+"~r~n"

If IsValid ( lds_1 ) Then destroy ( lds_1 )

gf_returnresult(ls_result)
end event

type st_1 from statictext within w_datawindow_style
integer x = 361
integer y = 108
integer width = 759
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "DataWindow Style Test"
boolean focusrectangle = false
end type

