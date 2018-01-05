$PBExportHeader$w_apb_mobile_bugtrack2015_1.srw
forward
global type w_apb_mobile_bugtrack2015_1 from w_base_case
end type
type dw_1 from datawindow within w_apb_mobile_bugtrack2015_1
end type
end forward

global type w_apb_mobile_bugtrack2015_1 from w_base_case
dw_1 dw_1
end type
global w_apb_mobile_bugtrack2015_1 w_apb_mobile_bugtrack2015_1

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
ls_array[Upperbound(ls_array) + 1 ] = "bugid34223"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34148"
//ls_array[Upperbound(ls_array) + 1 ] = "bugid34129"	//can not auto close website
ls_array[Upperbound(ls_array) + 1 ] = "bugid34023"

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
		
		case lower("bugid34223")
			//datawidnow: expression 'string(1234.2, '')' of computed field cause IE crash
			dw_1.dataobject = 'd_test34223'
			li_rtn = 0
			li_rtn = dw_1.retrieve()
			if li_rtn = -1  then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, "datawidnow: expression 'string(1234.2, '')' of computed field cause IE crash", lbn_flag)
		
//		case lower("bugid34129")
//			//hyperlinktourl not work on iOS when URL has double-byte charactor
//			inet linet
//			string ls_url
//			long ll_rtn
//			linet = create inet
//			ls_url = 'http://192.0.3.140/apk/てすと.html'
//			ll_rtn = linet.hyperlinktourl(ls_url)
//			destroy linet
//			if ll_rtn = 1  then 
//				lbn_flag = true
//			else
//				lbn_flag = false
//			end if
//			ls_result += wf_result_add(ls_item, "hyperlinktourl not work on iOS when URL has double-byte charactor", lbn_flag)
		
		case lower("bugid34148")
			//date function only work with string format 'yyyy/mm/dd' on Mobile
			date ld_today1,ld_today2
			ld_today1 = Date('2015-03-19')
			ld_today2 = Date('2015-mar-19')
			if string(ld_today1,'yyyy-mm-dd') = '2015-03-19' and string(ld_today2,'yyyy-mm-dd') = '2015-03-19'  then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, "date function only work with string format 'yyyy/mm/dd' on Mobile", lbn_flag)	
		
		case lower("bugid34023")
			//beep function not work on Mobile
			li_rtn = beep(5)
			if li_rtn = 1  then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, "beep function not work on Mobile", lbn_flag)			
		
			
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_mobile_bugtrack2015_1.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_apb_mobile_bugtrack2015_1.destroy
call super::destroy
destroy(this.dw_1)
end on

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator

if FileExists(ls_filepath+"33942.htm") then
	FileDelete(ls_filepath+"33942.htm")
end if
end event

type dw_1 from datawindow within w_apb_mobile_bugtrack2015_1
integer x = 457
integer y = 240
integer width = 686
integer height = 400
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

