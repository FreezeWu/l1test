$PBExportHeader$w_dw_item_status.srw
$PBExportComments$Shows the GetItemStatus and SetItemStatus functions and how they affect updates.
forward
global type w_dw_item_status from w_base_case
end type
type cb_1 from commandbutton within w_dw_item_status
end type
type st_col_status from statictext within w_dw_item_status
end type
type st_label from statictext within w_dw_item_status
end type
type st_bar from statictext within w_dw_item_status
end type
type dw_1 from datawindow within w_dw_item_status
end type
end forward

global type w_dw_item_status from w_base_case
integer x = 137
integer y = 8
integer width = 3598
integer height = 1944
string title = "Item Status and Updating"
string menuname = "m_item_status"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_retrieve pbm_custom01
event ue_deleterow pbm_custom02
event ue_insertrow pbm_custom03
event ue_setitemstatus pbm_custom04
event ue_open pbm_custom05
event ue_update_syntax pbm_custom06
cb_1 cb_1
st_col_status st_col_status
st_label st_label
st_bar st_bar
dw_1 dw_1
end type
global w_dw_item_status w_dw_item_status

type variables
// Menuid of the window
m_item_status   im_menuid

// Lets the sqlpreview event know whether the DW is
// updating or retrieving
boolean   ib_update

transaction   it_trans

string  is_update_syntax



end variables

forward prototypes
protected subroutine wf_show_col_status ()
protected subroutine wf_show_row_status ()
public subroutine of_testcase_point_module ()
end prototypes

on ue_retrieve;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the DataWindow
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_1.Retrieve()

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Show row and column statuses.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
wf_show_row_status()
wf_show_col_status()

end on

on ue_deleterow;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Delete the current row from the DataWindow.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

dw_1.DeleteRow (0)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// If the rowcount is zero, disable menu items.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if dw_1.RowCount() = 0 then
	im_menuid.m_rows.m_deleterow.enabled = false
	im_menuid.m_rows.m_setitemstatus.enabled = false
end if
end on

on ue_insertrow;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Insert a new row into the DataWindow prior to the current row.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long	ll_cur_row, &
		ll_new_row


ll_cur_row = dw_1.GetRow()
ll_new_row = dw_1.InsertRow(ll_cur_row)
dw_1.ScrollToRow(ll_new_row)
dw_1.SetColumn(1)


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable menu items for delete row
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
im_menuid.m_rows.m_deleterow.enabled = true

end on

on ue_setitemstatus;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Perform the SetItemStatus() function on the row/column specified from the menu selection.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int				li_wordparm
long			ll_longparm, &
				ll_row
dwItemStatus	le_status
string			ls_col


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the current row and column to perform the SetItemStatus function on.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ll_row = dw_1.GetRow()
if ll_row = 0 then
	MessageBox ("Error", "No current row.  Item status not changed.", exclamation!)
	return
end if
ls_col = dw_1.GetColumnName()
if ls_col = "" then
	MessageBox ("Error", "No current column.  Item status not changed.", exclamation!)
	return
end if


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the WordParm and LongParm values from the message object.  These determine
// whether to perform the SetItemStatus function on a row or a column.  These values come
// from the menu items.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
li_wordparm = message.WordParm
ll_longparm = message.LongParm


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Determine what status to set the row/column to based on the LongParm value.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
choose case ll_longparm

	case 1
		le_status = new!

	case 2
		le_status = newmodified!

	case 3
		le_status = datamodified!

	case 4
		le_status = notmodified!

	case else
		le_status = notmodified!
end choose


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// If the WordParm value is 0, set the item status for the current row.  If the WordParm value is 1,
// set the item status for the current column.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_1.SetRedraw (false)

if li_wordparm = 0 then
	dw_1.SetItemStatus (ll_row, 0, primary!, le_status)
else
	dw_1.SetItemStatus (ll_row, ls_col, primary!, le_status)
end if

// Show column status
wf_show_col_status()

// Show row status
wf_show_row_status()

dw_1.SetRedraw (true)

end on

event ue_open;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Create a separate transaction object for this example, because we want to show the SQL
// syntax generated by the Update function on a DataWindow in the sqlpreview event.
// The new transaction object will have the disablebind setting enabled on the dbparm attribute.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
it_trans = create transaction
it_trans.dbms = sqlca.dbms
it_trans.database = sqlca.database
it_trans.userid = sqlca.userid
it_trans.dbpass = sqlca.dbpass
it_trans.logid = sqlca.logid
it_trans.logpass = sqlca.logpass
it_trans.servername = sqlca.servername
it_trans.dbparm = sqlca.dbparm + ",disablebind=1"


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// DataWindow intialization
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
connect using it_trans;
if it_trans.SQLCode = -1 then
	//MessageBox("Connect Error for Data Source Name: 'EAS Demo DB V126'", it_trans.SQLErrText, exclamation!)
	is_resultlog += wf_result_add("ee_open", "Connect Error for Data Source," + it_trans.SQLErrText, False )
end if
dw_1.SetTransObject(it_trans)
dw_1.SetRowFocusIndicator(hand!)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Store a reference to the menuid in an instance variable
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
im_menuid = this.menuid

dw_1.Retrieve()
end event

event ue_update_syntax;if dw_1.Update() = -1 then
	rollback using it_trans;
else
	rollback using it_trans; // 阻止数据库更新
	//commit;
end if
end event

protected subroutine wf_show_col_status ();////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Function: wf_show_col_status
//
// Purpose: Displays the current item status of the current column in the DataWindow.
//		     Checks/unchecks column item status menu items to appropriate values.
//
// Scope: protected
//
// Arguments: none
//
// Returns: none
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

dwItemStatus	le_status
string			ls_col_label, &
				ls_col, &
				ls_left, &
				ls_right
int				li_pos


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the current column name (object name and text for label) & item status from the DW.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ls_col = dw_1.GetColumnName()
ls_col_label = dw_1.Describe (ls_col + "_t.text")
le_status = dw_1.GetItemStatus (dw_1.GetRow(), dw_1.GetColumn(), primary!)

// Strip out new line and carriage returns from the label text
li_pos = Pos (ls_col_label, "~r")
if li_pos > 0 then
	ls_left = Mid (ls_col_label, 2, li_pos - 2)
	ls_right = Mid (ls_col_label, li_pos + 2, Len (ls_col_label) - li_pos - 2)
	ls_col_label =  ls_left + " " + ls_right
end if
st_label.text = "Column Status for " + ls_col_label + ":"

if le_status = notmodified! then
	st_col_status.textcolor = 0
	st_col_status.text = "notmodified!"

	im_menuid.m_rows.m_setitemstatus.m_column.m_notmodified1.checked = true
	im_menuid.m_rows.m_setitemstatus.m_column.m_datamodified1.checked = false
else
	st_col_status.textcolor = 8388736
	st_col_status.text = "datamodified!"

	im_menuid.m_rows.m_setitemstatus.m_column.m_notmodified1.checked = false
	im_menuid.m_rows.m_setitemstatus.m_column.m_datamodified1.checked = true
end if
end subroutine

protected subroutine wf_show_row_status ();////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Function: wf_show_row_status
//
// Purpose:  Enable/Disable, and Check/Uncheck appropriate item status menu items
//			based on the current row.
//
// Scope: protected
//
// Arguments: none
//
// Returns: none
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

dwItemStatus	le_status
boolean			lb_notmodified, &
				lb_datamodified, &
				lb_new, &
				lb_newmodified


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the current item status of the row
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
le_status = dw_1.GetItemStatus (dw_1.GetRow(), 0, primary!)

choose case le_status

	case notmodified!
		lb_notmodified = true

	case datamodified!
		lb_datamodified = true

	case new!
		lb_new = true

	case newmodified!
		lb_newmodified = true		

end choose


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Check menu items for row status accordingly.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
im_menuid.m_rows.m_setitemstatus.m_row.m_notmodified.checked = lb_notmodified
im_menuid.m_rows.m_setitemstatus.m_row.m_datamodified.checked = lb_datamodified
im_menuid.m_rows.m_setitemstatus.m_row.m_new.checked = lb_new
im_menuid.m_rows.m_setitemstatus.m_row.m_newmodified.checked = lb_newmodified


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// When performing the SetItemStatus function on rows, certain combinations of row status
// changes are invalid.  Disable the "change row status" menu items for the invalid combinations
// based on the current row status.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Changing row status from new! to notmodified! is invalid
if lb_new then
	im_menuid.m_rows.m_setitemstatus.m_row.m_notmodified.enabled = false
	im_menuid.m_rows.m_setitemstatus.m_row.m_new.enabled = true
else
	// Changing row status from newmodified! to new! is invalid
	if lb_newmodified then
		im_menuid.m_rows.m_setitemstatus.m_row.m_new.enabled = false
		im_menuid.m_rows.m_setitemstatus.m_row.m_notmodified.enabled = true
	else
		// All other combinations are valid.
		im_menuid.m_rows.m_setitemstatus.m_row.m_notmodified.enabled = true
		im_menuid.m_rows.m_setitemstatus.m_row.m_datamodified.enabled = true
		im_menuid.m_rows.m_setitemstatus.m_row.m_new.enabled = true
		im_menuid.m_rows.m_setitemstatus.m_row.m_newmodified.enabled = true
	end if
end if
end subroutine

public subroutine of_testcase_point_module ();long ll_count, i, ll_row
string ls_temp, ls_status
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Create a separate transaction object for this example, because we want to show the SQL
// syntax generated by the Update function on a DataWindow in the sqlpreview event.
// The new transaction object will have the disablebind setting enabled on the dbparm attribute.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
it_trans = create transaction
it_trans.dbms = sqlca.dbms
it_trans.database = sqlca.database
it_trans.userid = sqlca.userid
it_trans.dbpass = sqlca.dbpass
it_trans.logid = sqlca.logid
it_trans.logpass = sqlca.logpass
it_trans.servername = sqlca.servername
it_trans.dbparm = sqlca.dbparm + ",disablebind=1"
it_trans.autocommit = false;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// DataWindow intialization
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
connect using it_trans;
if it_trans.SQLCode = -1 then
	//MessageBox("Connect Error for Data Source Name: 'EAS Demo DB V126'", it_trans.SQLErrText, exclamation!)
	is_resultlog += wf_result_add("testcasepoint1", "Connect Error for Data Source," + it_trans.SQLErrText, False )
end if
dw_1.SetTransObject(it_trans)
dw_1.SetRowFocusIndicator(hand!)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Store a reference to the menuid in an instance variable
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
im_menuid = this.menuid

ll_count = dw_1.Retrieve()
if ll_count < 0 then 
	is_resultlog += wf_result_add("testcasepoint1", "Datawindow retrieved data", False )
end if

//get updating syntax--update
ls_temp = "UPDATE sales_order SET sales_rep = 100 WHERE id = 2602 AND cust_id = 199 AND order_date = '2005-10-20 00:00:00.000' AND sales_rep = 129 "
dw_1.setitem(1, 'sales_rep', 100)
dw_1.accepttext()
This.TriggerEvent ("ue_update_syntax")
is_resultlog += wf_result_add("testcasepoint1", "get updating syntax:update", is_update_syntax = ls_temp )


//get updating syntax--delete
dw_1.Retrieve()
ls_temp = "DELETE FROM sales_order WHERE id = 2602 AND cust_id = 199 AND order_date = '2005-10-20 00:00:00.000' AND sales_rep = 129 "
dw_1.deleterow(1)
dw_1.accepttext()
This.TriggerEvent ("ue_update_syntax")
is_resultlog += wf_result_add("testcasepoint1", "get updating syntax:delete", is_update_syntax = ls_temp )

//get updating syntax--insert
dw_1.Retrieve()
ls_temp = "INSERT INTO sales_order ( id, cust_id, order_date, sales_rep ) VALUES ( 121, 100, '2017-04-18 00:00:00.000', 200 )"
ll_row = dw_1.insertrow(1)
dw_1.setitem(1, 'id', 121)
dw_1.setitem(1, 'cust_id', 100)
dw_1.setitem(1, 'sales_rep', 200)
dw_1.setitem(1, 'order_date', datetime('2017/04/18'))
dw_1.accepttext()

This.TriggerEvent ("ue_update_syntax")
is_resultlog += wf_result_add("testcasepoint1", "get updating syntax:insert", is_update_syntax = ls_temp )

// change_status
//已在w_dw_dwbuffers中写入测试案例, 此处只作简单测试
ls_temp = "notmodified!datamodified!new!newmodified!"
dw_1.Retrieve()

ls_status += dw_1.object.status[1]
dw_1.setitem(2, 'sales_rep', 100)
ls_status += dw_1.object.status[2]
ll_row = dw_1.insertrow(0)
ls_status += dw_1.object.status[ll_row]
ll_row = dw_1.insertrow(0)
dw_1.setitem(ll_row, 'sales_rep', 100)
ls_status += dw_1.object.status[ll_row]
is_resultlog += wf_result_add("testcasepoint1", "Set datawindow row status", ls_status = ls_temp )

destroy it_trans
end subroutine

event open;call super::open;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Because a retrieve is performed when the window is opened, post an event that performs
// the retrieve instead of doing it directly in the open event.  This allows the window to visually
// open faster.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//this.PostEvent ("ue_open")


end event

on w_dw_item_status.create
int iCurrent
call super::create
if this.MenuName = "m_item_status" then this.MenuID = create m_item_status
this.cb_1=create cb_1
this.st_col_status=create st_col_status
this.st_label=create st_label
this.st_bar=create st_bar
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_col_status
this.Control[iCurrent+3]=this.st_label
this.Control[iCurrent+4]=this.st_bar
this.Control[iCurrent+5]=this.dw_1
end on

on w_dw_item_status.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.st_col_status)
destroy(this.st_label)
destroy(this.st_bar)
destroy(this.dw_1)
end on

event close;call super::close;// Destroy the instance transaction object that was created
//destroy it_trans


end event

event resize;//不注释会报错
end event

type cb_1 from commandbutton within w_dw_item_status
integer x = 2642
integer y = 84
integer width = 727
integer height = 132
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

type st_col_status from statictext within w_dw_item_status
integer x = 1010
integer y = 1656
integer width = 375
integer height = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
boolean focusrectangle = false
end type

type st_label from statictext within w_dw_item_status
integer x = 18
integer y = 1656
integer width = 992
integer height = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "Column Status for Sales Order ID:"
boolean focusrectangle = false
end type

type st_bar from statictext within w_dw_item_status
integer x = 9
integer y = 1644
integer width = 2597
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_dw_item_status
integer x = 41
integer y = 36
integer width = 2533
integer height = 1544
integer taborder = 10
string dataobject = "d_item_status"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

on rbuttondown;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// popup menu based on position of pointer
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_object, &
		ls_temp
int		li_pos
long	ll_row


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the object in the DataWindow that is under the pointer.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ls_temp = this.GetObjectAtPointer()
li_pos = Pos(ls_temp, "~t")
if li_pos > 0 then
	ls_object = Left(ls_temp, li_pos - 1)
	ll_row = Long(Mid (ls_temp, li_pos + 1))
else
	return
end if


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Set current row/column to the object under the pointer
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if ll_row > 0 then
	this.ScrollToRow(ll_row)
end if
li_pos = Pos(ls_object, "_t")
if ls_object <> "status" and li_pos = 0 then
	this.SetColumn(ls_object)
end if


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// If the pointer is over a Customer Order column, popup the menu to change item status for 
// columns.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if ls_object = "id" or ls_object = "cust_id" or ls_object = "order_date" or ls_object = "sales_rep" then	
	im_menuid.m_rows.m_setitemstatus.m_column.PopMenu(parent.PointerX(), parent.PointerY())
else
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// If the pointer is over the row status column, popup the menu to change item status for row.
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	if ls_object = "status_t" or ls_object = "status" then
		im_menuid.m_rows.m_setitemstatus.m_row.PopMenu(parent.PointerX(), parent.PointerY())
	end if
end if 

end on

on updateend;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// re-retrieve the DataWindow, ONLY because this example needs the item statuses to be 
// refreshed for all the rows/columns.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_1.Retrieve()
dw_1.SetRowFocusIndicator (hand!)

end on

event sqlpreview;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// If the DataWindow is updating, then open the reponse window to step through the SQL syntax
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


int		li_ret
long		ll_row
dwbuffer	le_buffer


if ib_update then
	// If the row is in the primary buffer, scroll to the row.
	if buffer = primary! then
		this.SetRowFocusIndicator (hand!)
		this.ScrollToRow (row)
	else
		this.SetRowFocusIndicator (off!)
	end if

	//OpenWithParm (w_step, "SQL Syntax generated by Update function@" + sqlsyntax)		
	// obsolete code: OpenWithParm (w_step, "SQL Syntax generated by Update function@" + this.GetSQLPreview())		
	is_update_syntax = sqlsyntax
//	// If return value is 1, continue; else abort
//	li_ret = message.DoubleParm
//	if li_ret = 0 then
//		return 1 // Stop processing
//	end if
end if



end event

on itemchanged;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Redisplay new row status when an item is changed.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.PostEvent (rowfocuschanged!)


end on

on rowfocuschanged;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Displays the current row status.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

wf_show_row_status()
end on

on itemfocuschanged;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Displays the current item status of the current column in the DataWindow.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

wf_show_col_status()


end on

on retrieveend;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable menu items after retrieve
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if this.RowCount() > 0 then
	im_menuid.m_rows.m_deleterow.enabled = true
	im_menuid.m_rows.m_setitemstatus.enabled = true
end if
end on

on retrievestart;ib_update = false
end on

on updatestart;ib_update = true
end on

