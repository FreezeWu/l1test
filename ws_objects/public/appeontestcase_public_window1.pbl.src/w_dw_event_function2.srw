$PBExportHeader$w_dw_event_function2.srw
forward
global type w_dw_event_function2 from w_base_case
end type
type cb_6 from commandbutton within w_dw_event_function2
end type
type dw_datatype from datawindow within w_dw_event_function2
end type
type dw_3 from datawindow within w_dw_event_function2
end type
type cb_5 from commandbutton within w_dw_event_function2
end type
type cb_4 from commandbutton within w_dw_event_function2
end type
type dw_2 from datawindow within w_dw_event_function2
end type
type dw_1 from datawindow within w_dw_event_function2
end type
type cb_3 from commandbutton within w_dw_event_function2
end type
type dw_cust from datawindow within w_dw_event_function2
end type
type st_1 from statictext within w_dw_event_function2
end type
type st_direct from statictext within w_dw_event_function2
end type
type st_getitem from statictext within w_dw_event_function2
end type
type st_clipboard from statictext within w_dw_event_function2
end type
type st_array from statictext within w_dw_event_function2
end type
type st_rowscopy from statictext within w_dw_event_function2
end type
type cb_2 from commandbutton within w_dw_event_function2
end type
type dw_source from datawindow within w_dw_event_function2
end type
type dw_dest from datawindow within w_dw_event_function2
end type
type st_6 from statictext within w_dw_event_function2
end type
type st_7 from statictext within w_dw_event_function2
end type
type cb_1 from commandbutton within w_dw_event_function2
end type
type dw_dept from datawindow within w_dw_event_function2
end type
type os_data from structure within w_dw_event_function2
end type
end forward

type os_data from structure
	integer		id
	integer		line_id
	integer		prod_id
	integer		quantity
	datetime		ship_date
end type

global type w_dw_event_function2 from w_base_case
integer width = 4155
integer height = 2272
string title = "Event&Function2"
cb_6 cb_6
dw_datatype dw_datatype
dw_3 dw_3
cb_5 cb_5
cb_4 cb_4
dw_2 dw_2
dw_1 dw_1
cb_3 cb_3
dw_cust dw_cust
st_1 st_1
st_direct st_direct
st_getitem st_getitem
st_clipboard st_clipboard
st_array st_array
st_rowscopy st_rowscopy
cb_2 cb_2
dw_source dw_source
dw_dest dw_dest
st_6 st_6
st_7 st_7
cb_1 cb_1
dw_dept dw_dept
end type
global w_dw_event_function2 w_dw_event_function2

type variables
// handle to the DropDownDataWindow
datawindowchild   idw_child
Long	il_Begin, il_Rows
string is_str_syntax, is_nvo_syntax
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public function double of_calctime ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
public subroutine of_testcase_point_module4 ()
end prototypes

public subroutine of_testcase_point_module ();long ll_rc, ll_rc2
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//// Obtain the handle of the DropDownDataWindow
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_dept.SetTransObject (sqlca)
dw_dept.Retrieve()

//dw_dept.GetChild ("dept_head_id", idw_child)
//idw_child.SetTransObject (sqlca)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Change the dataobject of the DropDownDataWindow.
// When the dataobject of the DDDW is changed, a retrieve will be performed UNLESS data
// already exists in the DDDW.  The DDDWs used in this example have a dummy row stored
// in them for this purpose.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_dept.Object.dept_head_id.dddw.name = 'd_dddw_emp_by_dept' 

dw_dept.Object.dept_head_id.dddw.PercentWidth = 450
ll_rc = dw_dept.GetChild ("dept_head_id", idw_child)
idw_child.SetTransObject (sqlca)

// Force the DDDW to retrieve employees for the current department of the current row
dw_dept.Trigger Event RowFocusChanged (dw_dept.GetRow())

is_resultlog += wf_result_add("testcasepoint", "Set DDDW DataObject:d_dddw_emp_by_dept", idw_child.rowcount() > 0 and ll_rc = 1 )

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Change the dataobject of the DropDownDataWindow.
// When the dataobject of the DDDW is changed, a retrieve will be performed UNLESS data
// already exists in the DDDW.  The DDDWs used in this example have a dummy row stored
// in them for this purpose.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_dept.Object.dept_head_id.dddw.name = 'd_dddw_empsal_by_dept'

dw_dept.Object.dept_head_id.dddw.PercentWidth = 600
dw_dept.GetChild ("dept_head_id", idw_child)
idw_child.SetTransObject (sqlca)

// Force the DDDW to retrieve employees for the current department of the current row
dw_dept.Trigger Event RowFocusChanged (dw_dept.GetRow())

is_resultlog += wf_result_add("testcasepoint", "Set DDDW DataObject:d_dddw_empsal_by_dept", idw_child.rowcount() > 0  and ll_rc = 1 )

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Specify sort criteria for the DDDW
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_sort

ls_sort = "emp_lname A, emp_fname D"
ll_rc = idw_child.SetSort (ls_sort)
ll_rc2 = idw_child.sort()

// Force DDDW to retrieve, (which will apply sort criteria specified)
dw_dept.Trigger Event RowFocusChanged (dw_dept.GetRow())

is_resultlog += wf_result_add("testcasepoint", " DDDW sort", idw_child.rowcount() > 0  and ll_rc = 1 and ll_rc2 = 1 )


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Specify filter criteria for the DDDW
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_filter

ls_filter  = "emp_id > 1000"
//SetNull (ls_filter)
ll_rc = idw_child.SetFilter (ls_filter)
ll_rc2 = idw_child.filter()

// Force DDDW to retrieve, (which will apply filter criteria specified)
dw_dept.Trigger Event RowFocusChanged (dw_dept.GetRow())
is_resultlog += wf_result_add("testcasepoint", " DDDW filter", idw_child.rowcount() > 0  and ll_rc = 1 and ll_rc2 = 1 )
end subroutine

public subroutine of_testcase_point_module1 ();Long			ll_Cnt
Integer		li_Data
DateTime	ldt_Data

dw_source.SetTransObject(sqlca)
il_Rows = dw_source.Retrieve()


SetPointer(HourGlass!)

// First, reset the destination DataWindow and turn redraw off
dw_dest.Reset()
dw_dest.SetRedraw(False)

// Start Timer
il_Begin = CPU()

For ll_Cnt = 1 To il_Rows
	
	// Insert a blank row
	dw_dest.InsertRow(0)
	
	// Copy data from the source DataWindow using GetItem...
	// And write it to the destination DataWindow using SetItem
	li_Data = dw_source.GetItemNumber(ll_Cnt, "id")
	dw_dest.SetItem(ll_Cnt, "id", li_Data)
	
	li_Data = dw_source.GetItemNumber(ll_Cnt, "line_id")
	dw_dest.SetItem(ll_Cnt, "line_id", li_Data)
	
	li_Data = dw_source.GetItemNumber(ll_Cnt, "prod_id")
	dw_dest.SetItem(ll_Cnt, "prod_id", li_Data)
	
	li_Data = dw_source.GetItemNumber(ll_Cnt, "quantity")
	dw_dest.SetItem(ll_Cnt, "quantity", li_Data)
	
	// 在sqlserver中使用smalldatetime类型，只能用GetItemDate取值，否则会报错
	// 在asa数据库中使用GetItemDateTime取值 
	//ldt_Data = dw_source.GetItemDateTime(ll_Cnt, "ship_date")
	ldt_Data = datetime(dw_source.GetItemDate(ll_Cnt, "ship_date"))
	dw_dest.SetItem(ll_Cnt, "ship_date", ldt_Data)
Next

// Display Time
st_getitem.Text = String(of_calctime())

dw_dest.SetRedraw(True)

is_resultlog += wf_result_add("testcasepoint1", "Copy Datawindow:Copy Using GetItem/SetItem", dw_source.rowcount() = dw_dest.rowcount() )


// Copy Using Clipboard

SetPointer(HourGlass!)

// First, reset the destination DataWindow
dw_dest.Reset()

// Start Timer
il_Begin = CPU()

// Copy the data to the clipboard
dw_source.SaveAs("", Clipboard!, False)

// Copy the data from the clipboard to the destination DataWindow
dw_dest.ImportClipboard()

// Display Time
st_clipboard.Text = String(of_calctime())

is_resultlog += wf_result_add("testcasepoint1", "Copy Datawindow:Copy Using Clipboard", dw_source.rowcount() = dw_dest.rowcount() )


// Copy Using Structure Array
os_data	lstr_Data[]

SetPointer(HourGlass!)

// First, reset the destination DataWindow
dw_dest.Reset()

// Start Timer
il_Begin = CPU()

// Copy the data from the source DataWindow to the array of structures
lstr_Data = dw_source.Object.Data

// Copy the data from the array of structures to the destination DataWindow
dw_dest.Object.Data = lstr_Data

// Display Time
st_array.Text = String(of_calctime())

is_resultlog += wf_result_add("testcasepoint1", "Copy Datawindow:Copy Using Structure Array", dw_source.rowcount() = dw_dest.rowcount() )

// Copy Using Direct Reference

SetPointer(HourGlass!)

// First, reset the destination DataWindow
dw_dest.Reset()

// Start Timer
il_Begin = CPU()

// Copy the data to the destination DataWindow
dw_dest.Object.Data = dw_source.Object.Data

// Display Time
st_direct.Text = String(of_calctime())

is_resultlog += wf_result_add("testcasepoint1", "Copy Datawindow:Copy Using Direct Reference", dw_source.rowcount() = dw_dest.rowcount() )

// Copy Using RowsCopy()
//
//SetPointer(HourGlass!)
//
// First, reset the destination DataWindow
dw_dest.Reset()

// Start Timer
il_Begin = CPU()

// Copy the data to the destination DataWindow
dw_source.RowsCopy(1, il_Rows, Primary!, dw_dest, 1, Primary!)

// Display Time
st_rowscopy.Text = String(of_calctime())

is_resultlog += wf_result_add("testcasepoint1", "Copy Datawindow:Copy Using RowsCopy", dw_source.rowcount() = dw_dest.rowcount() )

end subroutine

public function double of_calctime ();Long		ll_End
Double	ldb_Diff

ll_End = CPU()

ldb_Diff = (ll_End - il_Begin) / 1000

Return ldb_Diff

end function

public subroutine of_testcase_point_module2 ();long ll_count, ll_id, ll_row, ll_cur_row, ll_col
integer li_return
string ls_coltype, ls_cell, ls_temp, ls_temp2
int			li_cell
//retrieve
dw_cust.SetTransObject (sqlca)
ll_count = dw_cust.Retrieve()

is_resultlog += wf_result_add("testcasepoint3", "Functions:retrieve ", ll_count > 0  )

// update
ll_id = 101
ll_row = dw_cust.find("id =" + string(ll_id), 1, ll_count)
if ll_row < 1 then return

dw_cust.setitem(ll_row, 'city', 'Rutherford_test')
dw_cust.accepttext()
if dw_cust.Update() = -1 then
	li_return = 0
	rollback;
else
	li_return = 1
	commit;
end if

select city into :ls_temp from customer where id = :ll_id;

is_resultlog += wf_result_add("testcasepoint3", "Functions:update ", li_return = 1 and  ls_temp = "Rutherford_test" )

// 还原更新的数据

dw_cust.setitem(ll_row, 'city', 'Rutherford')
dw_cust.accepttext()
if dw_cust.Update() = -1 then
	li_return = 0
	rollback;
else
	li_return = 1
	commit;
end if

// insert
// Get the current and row
ll_cur_row = dw_cust.GetRow()

// Insert new row prior to current row
ll_row = dw_cust.InsertRow (ll_cur_row)
dw_cust.ScrollToRow (ll_row)
dw_cust.SetColumn ('id')

is_resultlog += wf_result_add("testcasepoint3", "Functions:insertrow ", ll_row > 0  and  dw_cust.rowcount() = ll_count + 1 )

//deleterow
li_return = dw_cust.DeleteRow (ll_row + 1)

is_resultlog += wf_result_add("testcasepoint3", "Functions:deleterow ", li_return = 1  and  dw_cust.rowcount() = ll_count  and dw_cust.DeletedCount() = 1)

// undo
ll_count = dw_cust.Retrieve()
if ll_count = 0 then return
ll_row = 2
dw_cust.ScrollToRow (ll_row)
dw_cust.SetColumn ('city')
ls_temp = dw_cust.getitemstring(ll_row, 'city')
dw_cust.setitem(ll_row, 'city', 'New York_test')


ll_row = dw_cust.GetRow()
ll_col = dw_cust.GetColumn()

if ll_row > 0 and ll_col > 0 then
	ls_coltype = dw_cust.Describe ("#" + String (ll_col) + ".coltype")
	if ls_coltype = "number" then
		li_cell = dw_cust.GetItemNumber (ll_row, ll_col, primary!, true)

		// Reset it to the original value
		dw_cust.SetItem (ll_row, ll_col, li_cell)
	else
		ls_cell = dw_cust.GetItemString (ll_row, ll_col, primary!, true) 

		// Reset it to the original value
		dw_cust.SetItem (ll_row, ll_col, ls_cell)
	end if

	// reset the modified flag for this row column and call wf_set_counts
	// to recalculate all displayed row counts.
	dw_cust.SetItemStatus (ll_row, ll_col, primary!, NotModified!)
end if

ls_temp2 = dw_cust.getitemstring(ll_row, 'city')
 
 is_resultlog += wf_result_add("testcasepoint3", "Undo datawindow operating", ls_temp2 = ls_temp)
 

//Select Modified
for ll_row = 1  to 5
	dw_cust.setitem(ll_row, 'city', 'appeon_test')
next

dw_cust.accepttext()
// Deselect everything
dw_cust.SelectRow (0, false)

// Loop thru all modified rows and select them
ll_row = 0 
do
	ll_row = dw_cust.GetNextModified (ll_row, primary!)
	if ll_row > 0 then dw_cust.SelectRow (ll_row, true)
loop until ll_row < 1 

// 修改了五行数据，应该有五行数据被选中
li_return = 0 
for  ll_row = 1  to ll_count
	if dw_cust.IsSelected (ll_row)  then 
		li_return = li_return + 1 
	end if
next

 is_resultlog += wf_result_add("testcasepoint3", "select datawindow modified", li_return = 5 and dw_cust.ModifiedCount() = 5)


// Reset Modified

li_return = dw_cust.ResetUpdate()

 is_resultlog += wf_result_add("testcasepoint3", "Functions:resetupdate", li_return = 1 and dw_cust.ModifiedCount() = 0)

end subroutine

public subroutine of_testcase_point_module3 ();dwbuffer		lb_buffer
integer		li_rc, li_count, i, li_modify_count

dw_1.SetTransObject (sqlca)
dw_2.SetTransObject (sqlca)
li_count = dw_1.Retrieve()


// rowscopy

//datawindow间的复制
li_rc = dw_1.RowsCopy (1,dw_1.rowcount(),  primary!, dw_2, 1, primary!)	
is_resultlog += wf_result_add("testcasepoint4", "A datawidnow RowsCopy data to anthoer datawindow", li_rc = 1 and  dw_1.rowcount() = dw_2.rowcount())

//datawindow 缓冲区复制
dw_2.reset()
li_rc = dw_1.RowsCopy (1,dw_1.rowcount(),  primary!, dw_2, 1, delete!)	
is_resultlog += wf_result_add("testcasepoint4", "datawidnow RowsCopy data to delete buffer", li_rc = 1 and  dw_2.rowcount() = 0 and dw_1.rowcount() = dw_2.DeletedCount())

dw_2.reset()
li_rc = dw_1.RowsCopy (1,dw_1.rowcount(),  primary!, dw_2, 1, filter!)	
is_resultlog += wf_result_add("testcasepoint4", "datawidnow RowsCopy data to filter buffer", li_rc = 1 and  dw_2.rowcount() = 0 and dw_1.rowcount() = dw_2.FilteredCount())


// RowsMove

//datawindow间的move
dw_2.reset()
li_rc = dw_1.RowsMove (1,dw_1.rowcount(),  primary!, dw_2, 1, primary!)	
is_resultlog += wf_result_add("testcasepoint4", "A datawidnow RowsMove data to anthoer datawindow", li_rc = 1 and  dw_1.rowcount() = 0 and  dw_2.rowcount() = li_count)

//datawindow 缓冲区move

li_rc = dw_2.RowsMove (1,dw_2.rowcount(),  primary!, dw_2, 1, delete!)	
is_resultlog += wf_result_add("testcasepoint4", "datawidnow RowsMove data to delete buffer", li_rc = 1 and  dw_2.rowcount() = 0 and li_count = dw_2.DeletedCount())

li_rc = dw_2.RowsMove (1,dw_2.DeletedCount(),  delete!, dw_2, 1, filter!)	
is_resultlog += wf_result_add("testcasepoint4", "datawidnow RowsMove data to filter buffer", li_rc = 1 and  dw_2.rowcount() = 0 and li_count = dw_2.FilteredCount() and  dw_2.DeletedCount() = 0 )


//RowsDiscard
//delete
li_count = dw_1.Retrieve()
li_rc = dw_1.RowsMove (1,dw_1.rowcount(),  primary!, dw_1, 1, delete!)	
li_rc += dw_1.RowsDiscard ( 1, dw_1.DeletedCount(), delete!)
is_resultlog += wf_result_add("testcasepoint4", "datawidnow RowsDiscard delete buffer's data", li_rc = 2 and  dw_1.DeletedCount() = 0)

//filter
li_count = dw_1.Retrieve()
li_rc = dw_1.RowsMove (1,dw_1.rowcount(),  primary!, dw_1, 1, filter!)	
li_rc += dw_1.RowsDiscard ( 1, dw_1.FilteredCount(), filter!)
is_resultlog += wf_result_add("testcasepoint4", "datawidnow RowsDiscard filter buffer's data", li_rc = 2  and   dw_1.FilteredCount() = 0)

//modify
li_count = dw_1.Retrieve()
for i = 1 to li_count
	dw_1.setitem(i, 'state_name', 'Appeon')
next
li_modify_count = dw_1.ModifiedCount()
li_rc = dw_1.RowsDiscard ( 1, dw_1.rowCount(), primary!)
is_resultlog += wf_result_add("testcasepoint4", "datawidnow RowsDiscard primary buffer's data", li_rc = 1  and   dw_1.ModifiedCount() = 0 and li_count = li_modify_count)






end subroutine

public subroutine of_testcase_point_module4 ();integer li_count, li_i
string ls_colname[]
string ls_coltype[]
string  ls_struct_name, ls_prefix,  ls_classname, ls_filename, ls_temp, ls_objects, ls_dw, ls_syntax
string ls_fullname, ls_file = "ts_test_pbl.pbl"
n_resource_manager ln_resource_manager


ls_fullname = gs_cachedir+gs_dirseparator+ls_file
if not FileExists(ls_fullname)  then 
	if isvalid(w_controller) then 					
		w_controller.of_createfile(ls_fullname, sqlca)
		if not FileExists(ls_fullname)  then
			is_resultlog += wf_result_add("testcasepoint5", "Get resource file" + ls_file, False )
			return
		end if 
	else
		is_resultlog += wf_result_add("testcasepoint5", "Get resource file" + ls_file, False )
		return
	end if 
 end if 

 // 测试LibraryDirectory 是否正常
ls_dw = 'd_products170310'
ls_objects = LibraryDirectory ( ls_file, dirdatawindow!)
is_resultlog += wf_result_add("testcasepoint5", "LibraryDirectory function" , len(ls_objects)> 0 and pos(ls_objects, ls_dw) > 0  )
 // LibraryExport 是否正常
ls_syntax = LibraryExport(ls_file, ls_dw, ExportDataWindow!)
is_resultlog += wf_result_add("testcasepoint5", "LibraryExport function" , len(ls_syntax)> 0)
if dw_3.create(ls_syntax) < 0 then
	is_resultlog += wf_result_add("testcasepoint5", "create datawindow" , False)
	return 
end if


ls_classname = this.classname()
li_count = Integer(dw_3.describe("datawindow.column.count"))

for li_i=1 to li_count
	ls_colname[li_i] = dw_3.describe("#" + String(li_i) + ".name")
	ls_coltype[li_i] = dw_3.describe(ls_colname[li_i]+".coltype")
	dw_datatype.object.colname[li_i] = ls_colname[li_i]
	dw_datatype.object.coltype[li_i] = ls_coltype[li_i]
next

ls_struct_name = "products"
//of_create_auto_nvo_export
string ls_header="$PBExportHeader$"
string ls_comment="$PBExportComments$"
string ls_file_ext=".sru"
string ls_global_type = "global type "
string ls_global = "global "
string ls_forward = "forward"
string ls_end_forward = "end forward"
string ls_global_type_auto = " from nonvisualobject autoinstantiate"
string ls_type_vars = "type variables"
string ls_end_vars = "end variables"
string ls_event_con = "TriggerEvent( this, ~"constructor~" )"
string ls_event_des = "TriggerEvent( this, ~"destructor~" )"
string ls_name 
string ls_type_end = " from nonvisualobject"
string ls_end_type = "end type"
string ls_tab = "~t"
string ls_return ="~r~n"
string ls_export_txt
string ls_data_type
int    li_file_handle
int    li_len
long   ll_pos

ls_prefix = "nvo_"
// set header
ls_export_txt = ls_header+ls_prefix+ls_struct_name+ls_file_ext+ls_return


ls_export_txt += ls_comment+"of_create_auto_nvo_export"+ls_return


// forward
ls_export_txt += ls_return
ls_export_txt += ls_forward+ls_return
ls_export_txt += ls_global_type+ls_prefix+ls_struct_name+ls_type_end+ls_return
ls_export_txt += ls_end_type+ls_return
ls_export_txt += ls_end_forward+ls_return

// global
ls_export_txt += ls_return
ls_export_txt += ls_global_type+ls_prefix+ls_struct_name+ls_global_type_auto+ls_return
ls_export_txt += ls_end_type+ls_return

// global definition
ls_export_txt += ls_global+ls_prefix+ls_struct_name+" "+ls_prefix+ls_struct_name+ls_return

// type variables
ls_export_txt += ls_return
ls_export_txt += ls_type_vars+ls_return

// set data types
li_count = dw_datatype.rowcount()

for li_i=1 to li_count
	// set data type value
	ls_data_type = dw_datatype.object.coltype[li_i]
	
	if  pos(ls_data_type, "decimal") > 0 then
		li_len = (pos(ls_data_type, ")") - pos(ls_data_type,"(")) -1
		ls_data_type = "decimal {" + mid(ls_data_type, pos(ls_data_type,"(")+1, li_len) + "}"
		
	elseif pos(ls_data_type, "char") > 0 then
		ls_data_type="string"
	elseif pos(ls_data_type, "num") > 0 then
		ls_data_type="integer"
	end if
	ls_export_txt += ls_tab+ls_data_type+ls_tab+dw_datatype.object.colname[li_i]+ls_return
next
// end type variables
ls_export_txt += ls_end_vars+ls_return

// constructor event
ls_export_txt += ls_return
ls_export_txt += "on "+ls_prefix+ls_struct_name+".create"+ls_return
ls_export_txt += ls_event_con+ls_return
ls_export_txt += "end on"+ls_return

// destructor event
ls_export_txt += ls_return
ls_export_txt += "on "+ls_prefix+ls_struct_name+".destroy"+ls_return
ls_export_txt += ls_event_des+ls_return
ls_export_txt += "end on"+ls_return

// set instance variable
is_nvo_syntax = ls_export_txt


ls_filename = ls_classname + "_" + ls_struct_name+ "_nvo"
ls_temp = ln_resource_manager.f_get_resource(ls_filename+ ".sru")

is_resultlog += wf_result_add("testcasepoint5", "Datawindow to NVO", ls_temp = ls_export_txt )


ls_prefix = "str_"
// of_create_structure_export
ls_header="$PBExportHeader$"
ls_comment="$PBExportComments$"
ls_file_ext=".srs"
string ls_type = "global type "
ls_type_end = " from structure"
string ls_end = "end type"
ls_tab = "~t"
ls_return ="~r~n"

// set header
ls_export_txt = ls_header+ls_prefix+ls_struct_name+ls_file_ext+ls_return

ls_export_txt += ls_comment+"of_create_structure_export"+ls_return


ls_export_txt += ls_type+ls_tab+ls_prefix+ls_struct_name+ls_type_end+ls_return

li_count = dw_datatype.rowcount()

for li_i=1 to li_count
	// set data type value
	ls_data_type = dw_datatype.object.coltype[li_i]
	if  pos(ls_data_type, "decimal") > 0 then
		li_len = (pos(ls_data_type, ")") - pos(ls_data_type,"(")) -1
		ls_data_type = "decimal {" + mid(ls_data_type, pos(ls_data_type,"(")+1, li_len) + "}"
		
	elseif pos(ls_data_type, "char") > 0 then
		ls_data_type="string"
	elseif pos(ls_data_type, "num") > 0 then
		ls_data_type="integer"
	end if
	ls_export_txt += ls_tab+ls_data_type+ls_tab+dw_datatype.object.colname[li_i]+ls_return

next

ls_export_txt += ls_end

is_str_syntax = ls_export_txt



ls_filename = ls_classname + "_" + ls_struct_name+ "_str"
ls_temp = ln_resource_manager.f_get_resource(ls_filename+ ".srs")

is_resultlog += wf_result_add("testcasepoint5", "Datawindow to Structure", ls_temp = ls_export_txt )
end subroutine

on w_dw_event_function2.create
int iCurrent
call super::create
this.cb_6=create cb_6
this.dw_datatype=create dw_datatype
this.dw_3=create dw_3
this.cb_5=create cb_5
this.cb_4=create cb_4
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_3=create cb_3
this.dw_cust=create dw_cust
this.st_1=create st_1
this.st_direct=create st_direct
this.st_getitem=create st_getitem
this.st_clipboard=create st_clipboard
this.st_array=create st_array
this.st_rowscopy=create st_rowscopy
this.cb_2=create cb_2
this.dw_source=create dw_source
this.dw_dest=create dw_dest
this.st_6=create st_6
this.st_7=create st_7
this.cb_1=create cb_1
this.dw_dept=create dw_dept
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_6
this.Control[iCurrent+2]=this.dw_datatype
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.cb_5
this.Control[iCurrent+5]=this.cb_4
this.Control[iCurrent+6]=this.dw_2
this.Control[iCurrent+7]=this.dw_1
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.dw_cust
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.st_direct
this.Control[iCurrent+12]=this.st_getitem
this.Control[iCurrent+13]=this.st_clipboard
this.Control[iCurrent+14]=this.st_array
this.Control[iCurrent+15]=this.st_rowscopy
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.dw_source
this.Control[iCurrent+18]=this.dw_dest
this.Control[iCurrent+19]=this.st_6
this.Control[iCurrent+20]=this.st_7
this.Control[iCurrent+21]=this.cb_1
this.Control[iCurrent+22]=this.dw_dept
end on

on w_dw_event_function2.destroy
call super::destroy
destroy(this.cb_6)
destroy(this.dw_datatype)
destroy(this.dw_3)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.dw_cust)
destroy(this.st_1)
destroy(this.st_direct)
destroy(this.st_getitem)
destroy(this.st_clipboard)
destroy(this.st_array)
destroy(this.st_rowscopy)
destroy(this.cb_2)
destroy(this.dw_source)
destroy(this.dw_dest)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.cb_1)
destroy(this.dw_dept)
end on

event ue_cleantempfile;call super::ue_cleantempfile;string ls_filepath
ls_filepath = gs_cachedir+gs_dirseparator + "ts_test_pbl.pbl"

if FileExists(ls_filepath) then
	FileDelete(ls_filepath)
end if

end event

type cb_6 from commandbutton within w_dw_event_function2
integer x = 1577
integer y = 2052
integer width = 567
integer height = 96
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update resource file"
end type

event clicked;string ls_classname, ls_filename, ls_struct_name
n_resource_manager ln_resource_manager

ls_classname = Parent.classname()
ls_struct_name = "products"

 ls_filename = ls_classname + "_" + ls_struct_name+ "_str"

ln_resource_manager.f_insert_resource(ls_filename+ ".srs", is_str_syntax)

ls_filename = ls_classname +  "_" + ls_struct_name+ "_nvo"
ln_resource_manager.f_insert_resource(ls_filename+ ".sru", is_nvo_syntax)

end event

type dw_datatype from datawindow within w_dw_event_function2
integer x = 1298
integer y = 1828
integer width = 1033
integer height = 220
integer taborder = 80
string dataobject = "d_datatype"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_3 from datawindow within w_dw_event_function2
integer x = 50
integer y = 1832
integer width = 1207
integer height = 304
integer taborder = 70
string dataobject = "d_products170310"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within w_dw_event_function2
integer x = 2793
integer y = 1944
integer width = 1143
integer height = 132
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "5.Testcasepoint:DW_to_Structure"
end type

event clicked;of_testcase_point_module4()
end event

type cb_4 from commandbutton within w_dw_event_function2
integer x = 2821
integer y = 1488
integer width = 1143
integer height = 132
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "4.Testcasepoint:Copy,Move,Discard Rows"
end type

event clicked;of_testcase_point_module3()
end event

type dw_2 from datawindow within w_dw_event_function2
integer x = 1326
integer y = 1416
integer width = 1221
integer height = 404
integer taborder = 60
string dataobject = "d_state_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_dw_event_function2
integer x = 32
integer y = 1408
integer width = 1266
integer height = 404
integer taborder = 50
string dataobject = "d_state_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_dw_event_function2
integer x = 2834
integer y = 860
integer width = 1074
integer height = 132
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "3.Testcasepoint:Datawindow_functions"
end type

event clicked;of_testcase_point_module2()
end event

type dw_cust from datawindow within w_dw_event_function2
integer x = 9
integer y = 888
integer width = 2542
integer height = 500
integer taborder = 40
string dataobject = "d_cust"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_dw_event_function2
integer x = 2889
integer y = 344
integer width = 219
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "seconds"
boolean focusrectangle = false
end type

type st_direct from statictext within w_dw_event_function2
integer x = 2446
integer y = 340
integer width = 206
integer height = 88
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_getitem from statictext within w_dw_event_function2
integer x = 1797
integer y = 340
integer width = 206
integer height = 88
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_clipboard from statictext within w_dw_event_function2
integer x = 2011
integer y = 340
integer width = 206
integer height = 88
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_array from statictext within w_dw_event_function2
integer x = 2231
integer y = 336
integer width = 206
integer height = 88
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_rowscopy from statictext within w_dw_event_function2
integer x = 2661
integer y = 340
integer width = 206
integer height = 88
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_dw_event_function2
integer x = 2834
integer y = 460
integer width = 969
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2.Testcasepoint:Copy_Datawindow"
end type

event clicked;of_testcase_point_module1()
end event

type dw_source from datawindow within w_dw_event_function2
integer y = 464
integer width = 1321
integer height = 404
integer taborder = 30
string dataobject = "d_items"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_dest from datawindow within w_dw_event_function2
integer x = 1353
integer y = 464
integer width = 1198
integer height = 412
integer taborder = 30
string dataobject = "d_items"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_dw_event_function2
integer y = 396
integer width = 311
integer height = 64
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "Source"
boolean focusrectangle = false
end type

type st_7 from statictext within w_dw_event_function2
integer x = 1353
integer y = 396
integer width = 361
integer height = 64
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "Destination"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_dw_event_function2
integer x = 2834
integer y = 68
integer width = 969
integer height = 132
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.Testcasepoint:DDDW Techniques"
end type

event clicked;of_testcase_point_module()
end event

type dw_dept from datawindow within w_dw_event_function2
integer x = 32
integer y = 48
integer width = 1522
integer height = 328
integer taborder = 10
string dataobject = "d_example_dddw"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Re-retrieve the DropDownDataWindow of employees so that only employees from the
// current department are displayed.
//
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int	li_dept_id

if currentrow > 0 then
	li_dept_id = this.Object.dept_id[currentrow]
	If li_dept_id > 0 Then
		idw_child.Retrieve (li_dept_id)	
	End If
end if
end event

