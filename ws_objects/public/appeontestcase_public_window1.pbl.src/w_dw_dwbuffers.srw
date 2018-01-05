$PBExportHeader$w_dw_dwbuffers.srw
forward
global type w_dw_dwbuffers from w_base_case
end type
type cb_3 from commandbutton within w_dw_dwbuffers
end type
type dw_copy from datawindow within w_dw_dwbuffers
end type
type dw_statues from datawindow within w_dw_dwbuffers
end type
type cb_1 from commandbutton within w_dw_dwbuffers
end type
type dw_data from datawindow within w_dw_dwbuffers
end type
end forward

global type w_dw_dwbuffers from w_base_case
integer width = 2661
integer height = 2388
cb_3 cb_3
dw_copy dw_copy
dw_statues dw_statues
cb_1 cb_1
dw_data dw_data
end type
global w_dw_dwbuffers w_dw_dwbuffers

type variables
string is_date1, is_date2
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public function string of_rowstatus (long al_row, long al_col, string as_buffer)
end prototypes

public subroutine of_testcase_point_module ();long ll_row, ll_count, i 
Long		ll_RowCnt,  ll_ColCnt, ll_NewRow , ll_MaxRow, li_Start
string ls_data_status, ls_primary, ls_filter, ls_delete

string ls_classname, ls_filename, ls_data1, ls_data2
n_resource_manager ln_resource_manager


dw_data.SetTransObject (sqlca)
dw_data.Retrieve()




ls_classname = This.classname()

// modify

for i = 1 to 3
	dw_data.setitem(i, 'dept_name', 'Appeon' + string(i))
	dw_data.setitem(i, 'dept_head_id', 1000+i)
next

dw_data.setitem(4, 'dept_id', 1000)

//  insert

ll_row = dw_data.insertrow(0)


// insert and modify

ll_row = dw_data.insertrow(0)

dw_data.setitem(ll_row, 'dept_name', 'Appeon1')

// filter and modify
ll_row = dw_data.find("dept_id = 666", 1,  dw_data.rowcount())
if ll_row > 0 then
	dw_data.setitem(ll_row, 'dept_name', 'Appeon' + string(666))
end if
dw_data.setfilter("dept_id <> 666 and dept_id <> 505")
dw_data.filter()


//delete

ll_row = dw_data.find("dept_id = 700", 1,  dw_data.rowcount())
if ll_row > 0 then
	dw_data.setitem(ll_row, 'dept_name', 'Appeon' + string(700))
	dw_data.deleterow(ll_row)
end if

ll_row = dw_data.find("dept_id = 500", 1,  dw_data.rowcount())
if ll_row > 0  then
	dw_data.deleterow(ll_row)
end if


// Set row/column status from the Primary Buffer
ll_MaxRow  = dw_data.RowCount()

For ll_RowCnt = 1 To ll_MaxRow				// ll_RowCnt represents the rows in the filter buffer
	ll_NewRow = dw_statues.InsertRow(0)		// ll_NewRow represents newly inserted rows in the status dw
	For ll_ColCnt = 0 To 3							// for each column, 0 = row status
		dw_statues.SetItem(ll_NewRow, ll_ColCnt + 1, of_rowstatus( ll_NewRow, ll_ColCnt, "primary"))
	Next
	
	// Attach the row id so the status window is easier to read.
	dw_statues.SetItem(ll_NewRow, "row_id", dw_data.GetItemNumber(ll_RowCnt, 1))
Next

li_Start = ll_RowCnt

// Set row/column status from the Filter Buffer.  Append To Primary Buffer statuses
ll_MaxRow  = dw_data.FilteredCount()

For ll_RowCnt = 1 To ll_MaxRow				// ll_RowCnt represents the rows in the filter buffer
	ll_NewRow = dw_statues.InsertRow(0)		// ll_NewRow represents newly inserted rows in the status dw
	For ll_ColCnt = 0 To 3							// for each column, 0 = row status
		dw_statues.SetItem(ll_NewRow, ll_ColCnt + 1, of_rowstatus(ll_RowCnt, ll_ColCnt, "filter"))
	Next
	dw_statues.SetItem(ll_NewRow, "row_id", dw_data.GetItemNumber(ll_RowCnt, 1, Filter!, true))
Next


// Set row/column status from the delete Buffer.  Append To Primary Buffer statuses
ll_MaxRow  = dw_data.DeletedCount()

For ll_RowCnt = 1 To ll_MaxRow				// ll_RowCnt represents the rows in the filter buffer
	ll_NewRow = dw_statues.InsertRow(0)		// ll_NewRow represents newly inserted rows in the status dw
	For ll_ColCnt = 0 To 3							// for each column, 0 = row status
		dw_statues.SetItem(ll_NewRow, ll_ColCnt + 1, of_rowstatus(ll_RowCnt, ll_ColCnt, "delete"))
	Next
	dw_statues.SetItem(ll_NewRow, "row_id", dw_data.GetItemNumber(ll_RowCnt, 1,Delete!, true))
Next


// 查看Buffer内各状态是否正常
ls_data_status = dw_statues.Object.DataWindow.data
is_date1 = ls_data_status
ls_filename = ls_classname + "_status"
ls_data1 = ln_resource_manager.f_get_resource(ls_filename+ ".txt")

is_resultlog += wf_result_add("testcasepoint1", "Datawindow buffer's status", ls_data1 = ls_data_status )

// 查看primary数据
dw_copy.reset()
dw_data.RowsCopy(1, dw_data.rowcount(), Primary!, dw_copy, 1, Primary!)
 ls_primary = dw_copy.Object.DataWindow.data
//查看filter内数据
dw_copy.reset()
dw_data.RowsCopy(1, dw_data.rowcount(), Filter!, dw_copy, 1, Primary!)
ls_filter= dw_copy.Object.DataWindow.data
//查看delete内数据
dw_copy.reset()
dw_data.RowsCopy(1, dw_data.rowcount(), Delete!, dw_copy, 1, Primary!)
ls_delete = dw_copy.Object.DataWindow.data

is_date2 = ls_primary + ls_filter + ls_delete

ls_filename = ls_classname + "_data"
ls_data2 = ln_resource_manager.f_get_resource(ls_filename+ ".txt")

is_resultlog += wf_result_add("testcasepoint1", "Datawindow buffer's data", ls_data1 = ls_data_status )


end subroutine

public function string of_rowstatus (long al_row, long al_col, string as_buffer);dwItemStatus		ldis_Status

Choose Case Lower(as_buffer)
	Case "primary"
		ldis_Status = dw_data.GetItemStatus(al_Row, al_Col, PRIMARY!)
	Case "filter"
		ldis_Status = dw_data.GetItemStatus(al_Row, al_Col, FILTER!)
	Case "delete"
		ldis_Status = dw_data.GetItemStatus(al_Row, al_Col, DELETE!)
	Case Else
		Return "Error!"
End Choose

Choose Case ldis_Status
	Case notmodified!
		Return "NotModified!"

	Case datamodified!
		Return "DataModified!"

	Case new!
		Return "New!"

	Case newmodified!
		Return "NewModified!"

	Case Else
		Return "Error!"
End Choose

end function

on w_dw_dwbuffers.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.dw_copy=create dw_copy
this.dw_statues=create dw_statues
this.cb_1=create cb_1
this.dw_data=create dw_data
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.dw_copy
this.Control[iCurrent+3]=this.dw_statues
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.dw_data
end on

on w_dw_dwbuffers.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.dw_copy)
destroy(this.dw_statues)
destroy(this.cb_1)
destroy(this.dw_data)
end on

type cb_3 from commandbutton within w_dw_dwbuffers
integer x = 1934
integer y = 368
integer width = 567
integer height = 116
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update resource file"
end type

event clicked;string ls_classname, ls_filename
n_resource_manager ln_resource_manager

ls_classname = Parent.classname()

ls_filename = ls_classname + "_status"

ln_resource_manager.f_insert_resource(ls_filename+ ".txt", is_date1)

ls_filename = ls_classname + "_data"
ln_resource_manager.f_insert_resource(ls_filename+ ".txt", is_date2)

end event

type dw_copy from datawindow within w_dw_dwbuffers
integer x = 23
integer y = 1868
integer width = 1760
integer height = 384
integer taborder = 40
string dataobject = "d_departments"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_statues from datawindow within w_dw_dwbuffers
integer x = 23
integer y = 924
integer width = 1774
integer height = 912
integer taborder = 30
string dataobject = "d_statuses"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_dw_dwbuffers
integer x = 1934
integer y = 52
integer width = 567
integer height = 116
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.Testcasepoint"
end type

event clicked;of_testcase_point_module()
end event

type dw_data from datawindow within w_dw_dwbuffers
integer x = 27
integer y = 24
integer width = 1760
integer height = 876
integer taborder = 10
string dataobject = "d_departments"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

