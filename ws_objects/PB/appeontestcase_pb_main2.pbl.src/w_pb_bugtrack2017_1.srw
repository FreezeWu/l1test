$PBExportHeader$w_pb_bugtrack2017_1.srw
forward
global type w_pb_bugtrack2017_1 from w_base_case
end type
type dw_2 from datawindow within w_pb_bugtrack2017_1
end type
type dw_1 from datawindow within w_pb_bugtrack2017_1
end type
end forward

global type w_pb_bugtrack2017_1 from w_base_case
integer width = 3109
integer height = 2188
dw_2 dw_2
dw_1 dw_1
end type
global w_pb_bugtrack2017_1 w_pb_bugtrack2017_1

type variables
boolean		ibn_flag = false 
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_setflag (boolean abn_flag)
end prototypes

public subroutine of_testcase_point_module (); //==============================================================================
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
integer 		li_rtn, li_col, li_row
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

//ls_array[Upperbound(ls_array) + 1 ] = "testcasepoint_example1"			//edit you test case point name
//ls_array[Upperbound(ls_array) + 1 ] = ""
ls_array[Upperbound(ls_array) + 1 ] = "bugid1062"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1063"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1069"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1074"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1079"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1084"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1085"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1086"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1113"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1120"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1121"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1122"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1123"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1124"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1125"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1126"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1127"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1128"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1152"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1153"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1154"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1158"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1159"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1161"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1163"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1170"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1176"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1177"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1178"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1179"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1180"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1181"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1182"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1183"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1184"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1190"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1193"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1229"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1237"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1248"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1253"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1254"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1285"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1287"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1327"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1358"

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
//		case lower("testcasepoint_example1")	
			//			... your test case code...
			//	ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
		case lower("bugid1062")
		case lower("bugid1063")
		case lower("bugid1069")
		case lower("bugid1074")
		case lower("bugid1079")
		case lower("bugid1084")
		case lower("bugid1085")
		case lower("bugid1086")
		case lower("bugid1113")
		case lower("bugid1120")
		case lower("bugid1121")
		case lower("bugid1122")
		case lower("bugid1123")
		case lower("bugid1124")
		case lower("bugid1125")
		case lower("bugid1126")
		case lower("bugid1127")
		case lower("bugid1128")
		case lower("bugid1152")
		case lower("bugid1153")
		case lower("bugid1154")
		case lower("bugid1158")
		case lower("bugid1159")
		case lower("bugid1161")
		case lower("bugid1163")
		case lower("bugid1170")
		case lower("bugid1176")
		case lower("bugid1177")
		case lower("bugid1178")
		case lower("bugid1179")
		case lower("bugid1180")
		case lower("bugid1181")
		case lower("bugid1182")
		case lower("bugid1183")
		case lower("bugid1184")
		case lower("bugid1190")
		case lower("bugid1193")
		case lower("bugid1229")
		case lower("bugid1237")
		case lower("bugid1248")
		case lower("bugid1253")
		case lower("bugid1254")
		case lower("bugid1285")
		case lower("bugid1287")
		case lower("bugid1327")
			
		case lower("bugid1358")
			//The Width.AutoSize property does not work on the Grid DataWindow
			dw_1.dataobject = 'd_external_grid1358'
			dw_1.settransobject(SQLCA)
			li_row = dw_1.insertrow(0)
			dw_1.setitem(li_row, "target2","123456789012345678901234567890")
			ls_temp = dw_1.describe("target2.width.autosize")
			//messagebox('',ls_temp)
			if ls_temp = "3"  then
					lbn_flag = true
				else
					lbn_flag = false
				end if
			ls_result += wf_result_add(ls_item, " The Width.AutoSize property does not work on the Grid DataWindow", lbn_flag)
			
			
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
blob			lblob_data

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

//ls_array[Upperbound(ls_array) + 1 ] = "testcasepoint_example1"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "bugid1367"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1371"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1372"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1375"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1381"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1387"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1388"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1394"
/*.............................*/
ls_array[Upperbound(ls_array) + 1 ] = "bugid1401"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1491"
ls_array[Upperbound(ls_array) + 1 ] = "bugid1520"

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
//		case lower("testcasepoint_example1")	
			//			... your test case code...
			//ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
		case lower("bugid1367")
		case lower("bugid1371")
			this.visible = true
			dw_1.dataobject = 'd_imagedata1371'
			dw_1.settransobject(SQLCA)
			dw_1.reset( )
			dw_1.dbcancel( )
			dw_1.retrieve( )
			
			yield()
			sleep(2)
			ll_tmp = dw_1.rowcount( ) 			
			ls_result += wf_result_add(ls_item, " retrieve data > 0 ", not isnull(ll_tmp) and ll_tmp = 4)
			this.visible = false
		case lower("bugid1372")
		case lower("bugid1375")
		case lower("bugid1381")
		case lower("bugid1387")
		case lower("bugid1388")
		case lower("bugid1394")		
		
		case lower("bugid1401")
			ibn_flag = false 
			gw_setvalue = this
			openwithparm(w_bugid1401, 61458)			
			if isvalid(w_bugid1401) then close(w_bugid1401)
			ls_result += wf_result_add(ls_item, " message.longparm in the other event ", ibn_flag)
			//Maximum script size exceeded. 		//2100
		case lower("bugid1491")
			//<DW Control Name>.Describe("DataWindow.Table.Sort")
			dw_2.DataObject = "d_external_1491"
			dw_2.SetTransObject ( SQLCA )
			dw_2.Retrieve()
			string ls_bb			
			dw_2.Modify('table(column=(type=char(10) updatewhereclause=yes name=t1 dbname="T1"  )column=(type=char(10) updatewhereclause=yes name=t2 dbname="T2"  )column=(type=char(10) updatewhereclause=yes name=t3 dbname="T3"  ) sort="c_sort A")')
			ls_bb = dw_2.Describe("DataWindow.Table.Sort")			
			If ls_bb = "c_sort A" Then
				ls_result += wf_result_add(ls_item, " Modify ( 'c_sort A' ) -> c_sort A", true)
			Else
				ls_result += wf_result_add(ls_item, " Modify ( 'c_sort A' ) -> c_sort A", false)
			End If
		case lower("bugid1520")
			dw_2.DataObject = "d_external_null1520"
			dw_2.SetTransObject ( SQLCA )
			dw_2.Retrieve()
			int li_aa
			li_aa = dw_2.GetItemNumber( 1, 'N' )
			if Not IsNull ( li_aa ) Then
				ls_result += wf_result_add(ls_item, " GetItemNumber( 1, '1 + null' ) -> NULL", false)
			Else
				ls_result += wf_result_add(ls_item, " GetItemNumber( 1, '1 + null' ) -> NULL", true)
			End If
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_setflag (boolean abn_flag);ibn_flag  = abn_flag
end subroutine

on w_pb_bugtrack2017_1.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.dw_1
end on

on w_pb_bugtrack2017_1.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.dw_1)
end on

type dw_2 from datawindow within w_pb_bugtrack2017_1
integer x = 59
integer y = 708
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "d_external_1491"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_pb_bugtrack2017_1
integer x = 128
integer y = 28
integer width = 2821
integer height = 1984
integer taborder = 10
string title = "none"
string dataobject = "d_external_grid1358"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

