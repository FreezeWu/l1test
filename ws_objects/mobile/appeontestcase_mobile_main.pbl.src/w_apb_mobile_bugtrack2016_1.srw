$PBExportHeader$w_apb_mobile_bugtrack2016_1.srw
forward
global type w_apb_mobile_bugtrack2016_1 from w_base_case
end type
type dw_2 from datawindow within w_apb_mobile_bugtrack2016_1
end type
type dw_1 from datawindow within w_apb_mobile_bugtrack2016_1
end type
end forward

global type w_apb_mobile_bugtrack2016_1 from w_base_case
dw_2 dw_2
dw_1 dw_1
end type
global w_apb_mobile_bugtrack2016_1 w_apb_mobile_bugtrack2016_1

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname,ls_retrun
integer 		li_rtn, li_col,li_retrun
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time 
Decimal		ldc_data
blob  Emp_Id_Pic

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] =  "bugid34552"         //edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] =  "bugid34521"			
ls_array[Upperbound(ls_array) + 1 ] =  "bugid34513"
ls_array[Upperbound(ls_array) + 1 ] =  "bugid34476"
ls_array[Upperbound(ls_array) + 1 ] =  "bugid34470"
ls_array[Upperbound(ls_array) + 1 ] =  "bugid34338"


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
		
		case lower("bugid34552")
			//getfullstate/setfullstate not work on ipad mini(ios 10)
			blob lblb
			dw_1.dataobject = 'd_emp34552'
				dw_1.settransobject(SQLCA)
				dw_1.retrieve()
				ll_null = dw_1.getfullstate(lblb)
				ll_tmp = dw_2.SetFullState(lblb)
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_null) and ll_null = 73 )	
			
		case lower("bugid34521")
			//upper/lower function not work well with german characters
			ls_temp= upper("Erlös")
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp) and ls_temp =  'ERLÖS')	
	
		case lower("bugid34513")	
//			querymode handle date type as datetime type
//			dw_3.dataobject = 'd_asa'
//			transaction tran_SQLCA
//			tran_SQLCA = Create transaction
//			ld_date = date(2001,1,1)
//			If f_db_connect (tran_SQLCA, "ODBC", '') Then
//				dw_3.SetTransObject (tran_SQLCA)
//				dw_3.Modify("datawindow.querymode=yes")
//				dw_3.insertrow ( 0)
//				dw_3.setitem(1,"call_date", ld_date)
//				dw_3.AcceptText()
//				dw_3.event itemchanged(1,dw_3.object.call_date,string (ld_date))
//				dw_3.object.call_date[1] = ld_date
//				dw_3.Modify("datawindow.querymode=no")
//				dw_3.Retrieve()
//				ls_temp = is_temp
//				messageBox( "", ls_temp )
//			end if
//			ls_result += wf_result_add(ls_item, " ", not isnull(ld_date) and ld_date = date( '2001-01-01'))	

		case lower("bugid34476")
			//get 'expecting 7 retrieval arguments bug get 6' error when arguments over 6 on mobile
			dw_1.dataobject = 'd_34476test'
			dw_1.settransobject(SQLCA)	
			long days1, days2, days3, days4, days5,days6,days7
			days1 =1
			days2 =2
			days3 = 3
			days4 = 4
			days5 =5
			days6 = 6
			days7 = 7
			ll_tmp = dw_1.Retrieve(days1, days2, days3, days4, days5,days6,days7)
			ls_result += wf_result_add(ls_item, " ", (not isnull(ll_tmp)) and ll_tmp >0)	

		case lower("bugid34470")
			//datetime not work well when date format is 'YYYY年MM月DD日' on huawei(nexus)
			dw_1.dataobject = 'd_34470'
			dw_1.settransobject(SQLCA)	
			dw_1.retrieve()
			datetime ldt_now
			ldt_datatime = datetime('2017/9/28 09:38:42')
			dw_1.setitem(1,'c_time',ldt_datatime)
			ldt_now=dw_1.getitemdatetime(1,'c_time')
         	ls_result += wf_result_add(ls_item, " ", (not isnull(ldt_now)) and ldt_now= ldt_datatime)
             //string ( ldt_now, 'yyyy-mm-dd hh:mm:ss' ) = '2017-09-28 09:38:42'

		case lower("bugid34338")
			dw_1.dataobject = 'd_sort34338'
			String ls_rtn1,ls_rtn2	
			dw_1.setSort ( "text A" )
			dw_1.sort ( )
			ls_rtn1 = DW_1.GetItemString(2,'Text')
			dw_1.setSort ( "text D" )
			dw_1.sort ( )
			ls_rtn2 = DW_1.GetItemString(3,'Text')
			ls_result += wf_result_add(ls_item, " ", ls_rtn1='Ä' and ls_rtn2 = 'Ü' )

			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_mobile_bugtrack2016_1.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.dw_1
end on

on w_apb_mobile_bugtrack2016_1.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.dw_1)
end on

type dw_2 from datawindow within w_apb_mobile_bugtrack2016_1
integer x = 1920
integer y = 268
integer width = 686
integer height = 400
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_apb_mobile_bugtrack2016_1
integer x = 974
integer y = 260
integer width = 686
integer height = 400
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

