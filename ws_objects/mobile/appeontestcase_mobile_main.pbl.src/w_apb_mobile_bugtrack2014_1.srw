$PBExportHeader$w_apb_mobile_bugtrack2014_1.srw
forward
global type w_apb_mobile_bugtrack2014_1 from w_base_case
end type
type uo_webview from eon_mobile_webviewex within w_apb_mobile_bugtrack2014_1
end type
end forward

global type w_apb_mobile_bugtrack2014_1 from w_base_case
uo_webview uo_webview
end type
global w_apb_mobile_bugtrack2014_1 w_apb_mobile_bugtrack2014_1

type variables

end variables

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

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

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

//ls_array[Upperbound(ls_array) + 1 ] = "testcasepoint_example1"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "bugid33779"

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
		//case lower("")			
			//Maximum script size exceeded. 		//2100
			
		case lower("bugid33779")
			//webview: return value of of_runjavascript, exceeds 1024 bytes part is garbled
			string ls_res
			long ll_len			
			uo_webview.of_runjavascript("getTestValue()", ls_res)
			ll_len = len(ls_res)

			if ll_len = 1032 and match(ls_res,'Hello World!') = true then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "webview: return value of of_runjavascript, exceeds 1024 bytes part is garbled", lbn_flag)
			
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_mobile_bugtrack2014_1.create
int iCurrent
call super::create
this.uo_webview=create uo_webview
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_webview
end on

on w_apb_mobile_bugtrack2014_1.destroy
call super::destroy
destroy(this.uo_webview)
end on

type uo_webview from eon_mobile_webviewex within w_apb_mobile_bugtrack2014_1
integer x = 142
integer y = 128
integer width = 480
integer height = 352
integer taborder = 10
end type

on uo_webview.destroy
call eon_mobile_webviewex::destroy
end on

event constructor;call super::constructor;string ls_value,ls_html
			integer li_temp

			ls_value = '1234567890ABCDEFGHIJ'
			for li_temp = 1 to 50
				ls_value = ls_value + '1234567890ABCDEFGHIJ'
			next
			ls_html = "<script>var test = '" + ls_value + "Hello World!'; function getTestValue() {return test;}</script>"
			li_temp = uo_webview.of_LoadHtmlString(ls_html)
end event

