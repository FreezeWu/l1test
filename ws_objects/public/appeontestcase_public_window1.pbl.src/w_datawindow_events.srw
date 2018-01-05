$PBExportHeader$w_datawindow_events.srw
forward
global type w_datawindow_events from w_base_case
end type
type cb_2 from commandbutton within w_datawindow_events
end type
type dw_2 from datawindow within w_datawindow_events
end type
type dw_1 from datawindow within w_datawindow_events
end type
type cb_1 from commandbutton within w_datawindow_events
end type
type st_1 from statictext within w_datawindow_events
end type
end forward

global type w_datawindow_events from w_base_case
integer width = 2843
integer height = 1688
string title = "DataWindow Events Test"
cb_2 cb_2
dw_2 dw_2
dw_1 dw_1
cb_1 cb_1
st_1 st_1
end type
global w_datawindow_events w_datawindow_events

type variables
Boolean 		ib_Retrieve, ib_Other, ib_Printpage
end variables

forward prototypes
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position, ll_row 
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "Collapsed"          //treeview test again
ls_array[Upperbound(ls_array) + 1 ] = "Collapsing"           //treeview test again
ls_array[Upperbound(ls_array) + 1 ] = "Constructor"
ls_array[Upperbound(ls_array) + 1 ] = "Destructor"
ls_array[Upperbound(ls_array) + 1 ] = "DBError"
ls_array[Upperbound(ls_array) + 1 ] = "Error"		
ls_array[Upperbound(ls_array) + 1 ] = "Expanded"
ls_array[Upperbound(ls_array) + 1 ] = "Expanding"
ls_array[Upperbound(ls_array) + 1 ] = "GetFocus"
ls_array[Upperbound(ls_array) + 1 ] = "ItemError"
ls_array[Upperbound(ls_array) + 1 ] = "ItemFocusChanged"
ls_array[Upperbound(ls_array) + 1 ] = "Print"
ls_array[Upperbound(ls_array) + 1 ] = "PrintEnd"
ls_array[Upperbound(ls_array) + 1 ] = "PrintPage"
ls_array[Upperbound(ls_array) + 1 ] = "PrintStart"
ls_array[Upperbound(ls_array) + 1 ] = "Resize"
ls_array[Upperbound(ls_array) + 1 ] = "RowFocusChanging"
ls_array[Upperbound(ls_array) + 1 ] = "RowFocusChanged"
ls_array[Upperbound(ls_array) + 1 ] = "SQLPreview"
ls_array[Upperbound(ls_array) + 1 ] = "WSError"




ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	Yield ( )
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")	
	is_log = ''
	ls_temp = ''
	li_rtn = 0 
	ls_temp2 = ''
	ll_tmp = 0
	choose case lower(ls_item)
		case lower("Collapsed")	
			li_rtn = dw_2.triggerevent(Collapsed!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'Collapsed')  > 0)				
		case lower("Collapsing")	
			li_rtn = dw_2.triggerevent(Collapsing!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'Collapsing')  > 0)						
		case lower("Constructor")	
			li_rtn = dw_1.triggerevent(Constructor!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'Constructor')  > 0)						
		case lower("Destructor")	
			li_rtn = dw_1.triggerevent(Destructor!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'Destructor')  > 0)								
		case lower("DBError")	
			//Mandatory Field With Null Value
			yield()
			is_type = "DBError"
			timer(1)
		
			dw_1.Reset()
			ll_row = dw_1.insertrow(0)
			dw_1.setItem(ll_row,'emp_fname','test')
			li_rtn = dw_1.Update()
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = -1 and not isnull(is_log) and pos(is_log, 'DBError')  > 0)							
		case lower("Error")
			exceptionaction			action
			any						returnvalue
			dw_1.event error( 1001, "test case", "datawindow", "datawindow", "event error",1, action,returnvalue)
			ls_result += wf_result_add(ls_item, " TriggerEvent ",  not isnull(is_log) and pos(is_log, 'error: errornumber :1001 errortext=test case')  > 0)						
		case lower("Expanded")	
			li_rtn = dw_2.triggerevent(Expanded!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'Expanded')  > 0)						
		case lower("Expanding")	
			li_rtn = dw_2.triggerevent(Expanding!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'Expanding')  > 0)						
		case lower("GetFocus")	
			li_rtn = dw_1.triggerevent(GetFocus!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'GetFocus')  > 0)						
		case lower("ItemError")	
			li_rtn = dw_1.triggerevent(ItemError!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'ItemError')  > 0)						
		case lower("ItemFocusChanged")	
			li_rtn = dw_1.triggerevent(ItemFocusChanged!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'ItemFocusChanged')  > 0)						
		case lower("Print")
			yield()
			is_type = "Print Timer"
			timer(1)
			is_log = ""			
			li_rtn = dw_1.print( )
			ls_result += wf_result_add(ls_item, " function no arg ", li_rtn = 1 and pos(is_log, 'Trigger')  > 0)						
			
			is_log = ""			
			li_rtn = dw_1.Print(false)
			ls_result += wf_result_add(ls_item, " function false arg ", li_rtn = 1 and pos(is_log, 'Trigger')  > 0)						
			
			is_log = ""			
			li_rtn = dw_1.Print(true)
			ls_result += wf_result_add(ls_item, " function true arg ",li_rtn = 1 and pos(is_log, 'Trigger')  > 0)						
			
			is_log = ""			
			li_rtn = dw_1.Print(true, false)
			ls_result += wf_result_add(ls_item, " function true arg false ", li_rtn = 1 and pos(is_log, 'Trigger')  > 0)						
			
			is_log = ""			
			li_rtn = dw_1.Print(false, true)
			ls_result += wf_result_add(ls_item, " function false arg true ", li_rtn = -1 and pos(is_log, 'Trigger')  > 0)						
		
			is_log = ""			
			li_rtn = dw_1.Print(true, true)
			ls_result += wf_result_add(ls_item, " function true arg true ", li_rtn = -1 and pos(is_log, 'Trigger')  > 0)						
		case lower("PrintEnd")	
			li_rtn = dw_1.triggerevent(PrintEnd!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'PrintEnd')  > 0)						
		case lower("PrintPage")	
			li_rtn = dw_1.triggerevent(PrintPage!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'PrintPage')  > 0)						
		case lower("PrintStart")	
			li_rtn = dw_1.triggerevent(PrintStart!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'PrintStart')  > 0)						
		case lower("Resize")	
			li_rtn = dw_1.triggerevent(Resize!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'Resize')  > 0)						
		case lower("RowFocusChanging")	  
			dw_1.retrieve()
			ll_row = dw_1.GetRow()
			li_rtn = dw_1.ScrollToRow( ll_row + 1)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 2 and not isnull(is_log) and pos(is_log, 'RowFocusChanging')  > 0)						
		case lower("RowFocusChanged")	  
			dw_1.retrieve()
			ll_row = dw_1.GetRow()
			li_rtn = dw_1.ScrollToRow( ll_row + 1)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 2 and not isnull(is_log) and pos(is_log, 'RowFocusChanged')  > 0)						
		case lower("SQLPreview")	
			dw_1.retrieve()
			dw_1.ScrollToRow(2)
			li_rtn = dw_1.triggerevent(SQLPreview!)
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(li_rtn) and li_rtn = 1 and not isnull(is_log) and pos(is_log, 'SQLPreview')  > 0)						
		case lower("WSError")	
			dw_1.event wserror( "Update", 3, "Primary", "WSDL file", "invoked_webservice","exception message")
			ls_result += wf_result_add(ls_item, " TriggerEvent ", not isnull(is_log) and pos(is_log, 'wserror: rownum :3 errormessage=exception message')  > 0)						
			//Maximum script size exceeded. 		//2100
		case lower("")
	end choose 
next 

is_resultlog += ls_result
//ls_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module ();//==============================================================================
// 
// Copyright © 2017 Appeon Limited and its subsidiaries.  All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: of_testcase_point_module
//------------------------------------------------------------------------------
// Description:
//
//------------------------------------------------------------------------------
// Arguments:
//
//------------------------------------------------------------------------------
// Returns:  (None)
//
//------------------------------------------------------------------------------
// Author:         Mark            Date: 2017-03
//------------------------------------------------------------------------------
// Revision History:
//                                       1.0   Initial version
//==============================================================================
string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data


long			ll_row
dw_1.SetTransObject ( SQLCA )
dw_1.Retrieve()
dw_2.SetTransObject ( SQLCA )
dw_2.Retrieve ( )

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "SetFocus"
ls_array[Upperbound(ls_array) + 1 ] = "Clicked"
ls_array[Upperbound(ls_array) + 1 ] = "DoubleClicked"
ls_array[Upperbound(ls_array) + 1 ] = "ButtonClicked"
ls_array[Upperbound(ls_array) + 1 ] = "ButtonClicking"
ls_array[Upperbound(ls_array) + 1 ] = "RbuttonDown"
ls_array[Upperbound(ls_array) + 1 ] = "Dragdrop"
ls_array[Upperbound(ls_array) + 1 ] = "DragEnter"
ls_array[Upperbound(ls_array) + 1 ] = "DragLeave"
ls_array[Upperbound(ls_array) + 1 ] = "EditChanged"
ls_array[Upperbound(ls_array) + 1 ] = "ItemChanged"
ls_array[Upperbound(ls_array) + 1 ] = "Resize"
ls_array[Upperbound(ls_array) + 1 ] = "ScrollVertical"
ls_array[Upperbound(ls_array) + 1 ] = "ScrollHorizontal"
ls_array[Upperbound(ls_array) + 1 ] = "Update"
ls_array[Upperbound(ls_array) + 1 ] = "LostFocus"
ls_array[Upperbound(ls_array) + 1 ] = "Expand"
ls_array[Upperbound(ls_array) + 1 ] = "Collapse"
ls_array[Upperbound(ls_array) + 1 ] = "SelectTreeNode"
ls_array[Upperbound(ls_array) + 1 ] = ""

ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	Yield ( )
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")	
	is_log = ''
	ls_temp = ''
	li_rtn = 0 
	ls_temp2 = ''
	ll_tmp = 0
	lbn_flag = false
	choose case lower(ls_item)
		case lower("SetFocus")
			dw_1.SetFocus()
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('GetFocus() Event')) > 0)	
		case lower("Clicked")
			dw_1.Event Clicked ( 1,1,1,dw_1.object.emp_id ) 
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('Clicked() Event')) > 0)	
		case lower("DoubleClicked")
			dw_1.Event DoubleClicked ( 1,1,1,dw_1.object.emp_id ) 
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('DoubleClicked() Event')) > 0)	
		case lower("ButtonClicked")
			dw_1.Event ButtonClicked ( 1,0,dw_1.object.b_1 ) 
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('ButtonClicked() Event')) > 0)	
		case lower("ButtonClicking")
			dw_1.Event ButtonClicking ( 1,dw_1.object.b_1 ) 
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('ButtonClicking() Event')) > 0)	
		case lower("RbuttonDown")
			dw_1.Event RbuttonDown ( 1,1,1,dw_1.object.emp_id ) 
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('RbuttonDown() Event')) > 0)	
		case lower("Dragdrop")
			dw_1.Event Dragdrop ( st_1,1, dw_1.Object.emp_id )
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('Dragdrop() Event')) > 0)	
		case lower("DragEnter")
			dw_1.Event DragEnter ( st_1 )
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('DragEnter() Event')) > 0)	
		case lower("DragLeave")
			dw_1.Event DragLeave ( st_1 )
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('DragLeave() Event')) > 0)	
		case lower("EditChanged")
			dw_1.Event EditChanged ( 1, dw_1.Object.start_date, String ( today(), 'yyyy-mm-dd' ) )
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('EditChanged() Event')) > 0)	
		case lower("ItemChanged")
			dw_1.Event ItemChanged( 1, dw_1.Object.start_date, String ( today(), 'yyyy-mm-dd' ) )
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('ItemChanged() Event')) > 0)	
		case lower("Resize")
			dw_1.Event Resize (0,1400,500 )
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('Resize() Event')) > 0)	
		case lower("ScrollVertical")
			dw_1.Event ScrollVertical(2)
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('ScrollVertical() Event')) > 0)	
		case lower("ScrollHorizontal")
			dw_1.Event ScrollHorizontal(2,2)
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('ScrollHorizontal() Event')) > 0)	
		case lower("Update")
			dw_1.SetItem ( 2, 'emp_id', '105' )
			dw_1.Update() 
			RollBack;
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('UpdateStart() Event')) > 0 and pos(lower(is_log), lower('UpdateEnd() Event')) > 0  )
		case lower("LostFocus")			
			dw_1.event losefocus( )
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('LostFocus() Event')) > 0)	
		case lower("Expand")
			dw_2.Expand(1,1)
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and (pos(lower(is_log),lower('Expanding() Event')) > 0 ) and pos(lower(is_log),lower('Expanded() Event')) > 0  )	
		case lower("Collapse")
			dw_2.Collapse(1,1)
			ls_result += wf_result_add(ls_item, " Event ", not isnull(is_log) and pos(lower(is_log), lower('Collapsing() Event')) > 0 and pos(lower(is_log), lower('Collapsed() Event')) > 0 )	
		case lower("SelectTreeNode")
			dw_2.SelectTreeNode( 1,1,True )
			ls_result += wf_result_add(ls_item, "1. Event True ", not isnull(is_log) and pos(lower(is_log), lower('TreeNodeSelecting() Event')) > 0 and pos(lower(is_log), lower('TreeNodeSelected() Event')) > 0 )	

			is_log = ''
			dw_2.SelectTreeNode( 1,1,false )
			ls_result += wf_result_add(ls_item, "2. Event false ", not isnull(is_log) and is_log = "")	
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result


end subroutine

on w_datawindow_events.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.st_1
end on

on w_datawindow_events.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.st_1)
end on

event timer;call super::timer;if lower(is_type) = lower("Print Timer") then 
	wf_closepopwindow( "Save the file as", 'Cancel')
	wf_closepopwindow( "Save Print Output As", 'Cancel')			//for win10 print machine
	wf_closepopwindow( "Print to File", 'Cancel')
	wf_closepopwindow( "Print", 'Cancel')
elseif lower(is_type) = lower("Saveas Timer") then 
	wf_closepopwindow( "Save the file as", 'Cancel')
	wf_closepopwindow( "Save Print Output As", 'Cancel')			//for win10 print machine
elseif lower(is_type) = lower("Child Print Timer") then 
	wf_closepopwindow( "Save the file as", 'Cancel')
	wf_closepopwindow( "Save Print Output As", 'Cancel')			//for win10 print machine
elseif lower(is_type) = lower("PrintCancel") then 
	wf_closepopwindow( "Save the file as", 'Save')
	wf_closepopwindow( "Print to File", 'OK')
	wf_closepopwindow( "Save Print Output As", 'Save')			//for win10 print machine
elseif lower(is_type) = lower("DBError") then                                //for DBError
	wf_closepopwindow( "DataWindow Error", 'OK')
end if 
end event

type cb_2 from commandbutton within w_datawindow_events
integer x = 96
integer y = 404
integer width = 457
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Events Add"
end type

event clicked;of_testcase_point_module1()
end event

type dw_2 from datawindow within w_datawindow_events
integer x = 1294
integer y = 824
integer width = 1422
integer height = 504
integer taborder = 10
string title = "none"
string dataobject = "d_dwstyle_treeview"
boolean livescroll = true
end type

event help;//is_log += " Help() Event = "+ "Trigger successfully! " +"~r~n"
end event

event buttonclicked;is_log += " ButtonClicked() Event = "+ "Trigger successfully! " +"~r~n"
end event

event buttonclicking;is_log += " ButtonClicking() Event = "+ "Trigger successfully! " +"~r~n"
end event

event clicked;is_log += " Clicked() Event = "+ "Trigger successfully! " +"~r~n"
end event

event collapsed;is_log += " Collapsed() Event = "+ "Trigger successfully! " +"~r~n"

is_log += " Collapsed() Event = "+ "Trigger successfully! " +"~r~n"
end event

event collapsing;is_log += " Collapsing() Event = "+ "Trigger successfully! " +"~r~n"

is_log += " Collapsing() Event = "+ "Trigger successfully! " +"~r~n"

end event

event constructor;//is_log += " Constructor() Event = "+ "Trigger successfully! " +"~r~n"

is_log += " Constructor() Event = "+ "Trigger successfully! " +"~r~n"
end event

event dberror;is_log += " DBError() Event = "+ "Trigger successfully! " +"~r~n"
end event

event wserror;//is_log += " WSError() Event = "+ "Trigger successfully! " +"~r~n"
end event

event destructor;//is_log += " Destructor() Event = "+ "Trigger successfully! " +"~r~n"

is_log += " Destructor() Event = "+ "Trigger successfully! " +"~r~n"
end event

event doubleclicked;is_log += " DoubleClicked() Event = "+ "Trigger successfully! " +"~r~n"
end event

event dragdrop;is_log += " Dragdrop() Event = "+ "Trigger successfully! " +"~r~n"
end event

event dragenter;is_log += " DragEnter() Event = "+ "Trigger successfully! " +"~r~n"
end event

event dragleave;is_log += " DragLeave() Event = "+ "Trigger successfully! " +"~r~n"
end event

event dragwithin;is_log += " DragWithin() Event = "+ "Trigger successfully! " +"~r~n"
end event

event editchanged;is_log += " EditChanged() Event = "+ "Trigger successfully! " +"~r~n"
end event

event expanded;is_log += " Expanded() Event = "+ "Trigger successfully! " +"~r~n"
end event

event expanding;is_log += " Expanding() Event = "+ "Trigger successfully! " +"~r~n"
end event

event getfocus;//is_log += " GetFocus() Event = "+ "Trigger successfully! " +"~r~n"
end event

event itemchanged;//is_log += " ItemChanged() Event = "+ "Trigger successfully! " +"~r~n"
end event

event itemerror;is_log += " ItemError() Event = "+ "Trigger successfully! " +"~r~n"
end event

event itemfocuschanged;//is_log += " ItemFocusChanged() Event = "+ "Trigger successfully! " +"~r~n"
end event

event losefocus;//is_log += " LoseFocus() Event = "+ "Trigger successfully! " +"~r~n"
end event

event other;//is_log += " Other() Event = "+ "Trigger successfully! " +"~r~n"
end event

event printend;//is_log += " Printend() Event = "+ "Trigger successfully! " +"~r~n"
end event

event printpage;is_log += " PrintPage() Event = "+ "Trigger successfully! " +"~r~n"
end event

event printstart;//is_log += " PrintStart() Event = "+ "Trigger successfully! " +"~r~n"
end event

event rbuttondown;is_log += " RbuttonDown() Event = "+ "Trigger successfully! " +"~r~n"
end event

event resize;is_log += " Resize() Event = "+ "Trigger successfully! " +"~r~n"
end event

event retrieveend;//is_log += " RetrieveEnd() Event = "+ "Trigger successfully! " +"~r~n"
end event

event retrieverow;//is_log += " RetrieveRow() Event = "+ "Trigger successfully! " +"~r~n"
end event

event retrievestart;//is_log += " RetrieveStart() Event = "+ "Trigger successfully! " +"~r~n"
end event

event rowfocuschanged;//is_log += " RowFocusChanged() Event = "+ "Trigger successfully! " +"~r~n"
end event

event rowfocuschanging;//is_log += " RowFocusChanging() Event = "+ "Trigger successfully! " +"~r~n"
end event

event scrollhorizontal;is_log += " ScrollHorizontal() Event = "+ "Trigger successfully! " +"~r~n"
end event

event scrollvertical;is_log += " ScrollVertical() Event = "+ "Trigger successfully! " +"~r~n"
end event

event sqlpreview;//is_log += " SQLPreView() Event = "+ "Trigger successfully! " +"~r~n"
end event

event treenodeselected;is_log += " TreeNodeSelected() Event = "+ "Trigger successfully! " +"~r~n"
end event

event treenodeselecting;is_log += " TreeNodeSelecting() Event = "+ "Trigger successfully! " +"~r~n"
end event

event updateend;is_log += " UpdateEnd() Event = "+ "Trigger successfully! " +"~r~n"
end event

event updatestart;is_log += " UpdateStart() Event = "+ "Trigger successfully! " +"~r~n"
end event

event error;//is_log += " Error() Event = "+ "Trigger successfully! " +"~r~n"

is_log += "error: errornumber :"+string(errornumber)+" errortext="+string(errortext)+" errorobject="+errorobject+" errorscript=" +errorscript

end event

event richtextcurrentstylechanged;is_log += " RichTextCurrentStyleChanged() Event = "+ "Trigger successfully! " +"~r~n"
end event

event richtextlosefocus;is_log += " RichTextLoseFocus() Event = "+ "Trigger successfully! " +"~r~n"
end event

event richtextlimiterror;is_log += " RichTextLimitError() Event = "+ "Trigger successfully! " +"~r~n"
end event

type dw_1 from datawindow within w_datawindow_events
integer x = 1303
integer y = 268
integer width = 1422
integer height = 504
integer taborder = 10
string title = "none"
string dataobject = "d_dwstyle_grid3"
boolean livescroll = true
end type

event constructor;is_log += " Constructor() Event = "+ "Trigger successfully! " +"~r~n"
end event

event destructor;is_log += " Destructor() Event = "+ "Trigger successfully! " +"~r~n"


end event

event clicked;is_log += " Clicked() Event = "+ "Trigger successfully! " +"~r~n"
end event

event doubleclicked;is_log += " DoubleClicked() Event = "+ "Trigger successfully! " +"~r~n"
end event

event buttonclicked;is_log += " ButtonClicked() Event = "+ "Trigger successfully! " +"~r~n"


end event

event buttonclicking;is_log += " ButtonClicking() Event = "+ "Trigger successfully! " +"~r~n"
end event

event dragdrop;is_log += " Dragdrop() Event = "+ "Trigger successfully! " +"~r~n"
end event

event dragenter;is_log += " DragEnter() Event = "+ "Trigger successfully! " +"~r~n"
end event

event dragleave;is_log += " DragLeave() Event = "+ "Trigger successfully! " +"~r~n"
end event

event dragwithin;is_log += " DragWithin() Event = "+ "Trigger successfully! " +"~r~n"
end event

event editchanged;is_log += " EditChanged() Event = "+ "Trigger successfully! " +"~r~n"
end event

event getfocus;is_log += " GetFocus() Event = "+ "Trigger successfully! " +"~r~n"
end event

event itemchanged;is_log += " ItemChanged() Event = "+ "Trigger successfully! " +"~r~n"
end event

event itemerror;is_log += " ItemError() Event = "+ "Trigger successfully! " +"~r~n"
end event

event itemfocuschanged;is_log += " ItemFocusChanged() Event = "+ "Trigger successfully! " +"~r~n"
end event

event losefocus;is_log += " LostFocus() Event = "+ "Trigger successfully! " +"~r~n"
end event

event printend;is_log += " PrintEnd() Event = "+ "Trigger successfully! " +"~r~n"
end event

event printpage;is_log += " PrintPage() Event = "+ "Trigger successfully! " +"~r~n"
ib_Printpage = True

end event

event other;If Not ib_Other Then
	is_log += " Other() Event = "+ "Trigger successfully! " +"~r~n"
	ib_Other = True
End If
end event

event collapsed;is_log += " Collapsed() Event = "+ "Trigger successfully! " +"~r~n"
end event

event collapsing;is_log += " Collapsing() Event = "+ "Trigger successfully! " +"~r~n"
end event

event dberror;is_log += " DBError() Event = "+ "Trigger successfully! " +"~r~n"

is_log += " DBError() Event = "+ "Trigger successfully! " +"~r~n"
end event

event error;//is_log += " Error() Event = "+ "Trigger successfully! " +"~r~n"
is_log += "error: errornumber :"+string(errornumber)+" errortext="+string(errortext)+" errorobject="+errorobject+" errorscript=" +errorscript
end event

event expanded;is_log += " Expanded() Event = "+ "Trigger successfully! " +"~r~n"
end event

event expanding;is_log += " Expanding() Event = "+ "Trigger successfully! " +"~r~n"
end event

event help;//is_log += " Help() Event = "+ "Trigger successfully! " +"~r~n"
end event

event printstart;is_log += " PrintStart() Event = "+ "Trigger successfully! " +"~r~n"
end event

event rbuttondown;is_log += " RbuttonDown() Event = "+ "Trigger successfully! " +"~r~n"
end event

event resize;is_log += " Resize() Event = "+ "Trigger successfully! " +"~r~n"

end event

event retrieveend;is_log += " RetrieveEnd() Event = "+ "Trigger successfully! " +"~r~n"
end event

event retrieverow;//If Not ib_Retrieve Then
//	is_log += " RetrieveRow() Event = "+ "Trigger successfully! " +"~r~n"
//	ib_Retrieve = True
//End If
end event

event retrievestart;is_log += " RetrieveStart() Event = "+ "Trigger successfully! " +"~r~n"
end event

event richtextcurrentstylechanged;is_log += " RichTextCurrentStyleChanged() Event = "+ "Trigger successfully! " +"~r~n"
end event

event richtextlimiterror;is_log += " RichTextLimitError() Event = "+ "Trigger successfully! " +"~r~n"
end event

event richtextlosefocus; is_log += " RichTextLoseFocus() Event = "+ "Trigger successfully! " +"~r~n"
 

end event

event rowfocuschanged;is_log += "RowFocusChanged() event is trigger. row="+string(currentrow)




end event

event rowfocuschanging;is_log += " RowFocusChanging() Event = "+ "Trigger successfully! " +"~r~n"
end event

event scrollhorizontal;is_log += " ScrollHorizontal() Event = "+ "Trigger successfully! " +"~r~n"
end event

event scrollvertical;is_log += " ScrollVertical() Event = "+ "Trigger successfully! " +"~r~n"
end event

event sqlpreview;is_log += " SQLPreview() Event = "+ "Trigger successfully! " +"~r~n"
end event

event treenodeselected;is_log += " TreeNodeSelected() Event = "+ "Trigger successfully! " +"~r~n"
end event

event treenodeselecting;is_log += " TreeNodeSelecting() Event = "+ "Trigger successfully! " +"~r~n"
end event

event updateend;is_log += " UpdateEnd() Event = "+ "Trigger successfully! " +"~r~n"
end event

event updatestart;is_log += " UpdateStart() Event = "+ "Trigger successfully! " +"~r~n"
end event

event wserror;//is_log += " WSError() Event = "+ "Trigger successfully! " +"~r~n"

is_log += "wserror: rownum :"+string(rownum)+" errormessage="+string(errormessage)+" operation:"+operation +" buffername="+buffername
end event

type cb_1 from commandbutton within w_datawindow_events
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
string text = "Events Test"
end type

event clicked;//of_testcase_point_module()
end event

type st_1 from statictext within w_datawindow_events
integer x = 361
integer y = 108
integer width = 814
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "DataWindow Events Test"
boolean focusrectangle = false
end type

