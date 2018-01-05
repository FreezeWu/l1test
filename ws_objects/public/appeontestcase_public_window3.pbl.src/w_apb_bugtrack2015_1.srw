$PBExportHeader$w_apb_bugtrack2015_1.srw
forward
global type w_apb_bugtrack2015_1 from w_base_case
end type
type cb_1 from commandbutton within w_apb_bugtrack2015_1
end type
end forward

global type w_apb_bugtrack2015_1 from w_base_case
cb_1 cb_1
end type
global w_apb_bugtrack2015_1 w_apb_bugtrack2015_1

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid34234"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34232"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34227"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34224"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34223"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34217"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34213"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34208"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34207"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34206"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34203"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34202"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34200"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34199"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34198"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34195"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34194"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34185"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34184"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34182"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34180"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34179"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34171"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34170"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34169"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34165"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34162"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34161"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34143"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34142"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34141"


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
		case lower("bugid34234")
			
		case lower("bugid34232")
		case lower("bugid34227")
		case lower("bugid34224")
		case lower("bugid34223")
		case lower("bugid34217")
		case lower("bugid34213")
		case lower("bugid34208")
		case lower("bugid34207")
		case lower("bugid34206")
		case lower("bugid34203")
		case lower("bugid34202")
		case lower("bugid34200")
		case lower("bugid34199")
		case lower("bugid34198")
		case lower("bugid34195")
		case lower("bugid34194")
		case lower("bugid34185")
		case lower("bugid34184")
		case lower("bugid34182")
		case lower("bugid34180")
		case lower("bugid34179")
		case lower("bugid34171")
		case lower("bugid34170")
		case lower("bugid34169")
		case lower("bugid34165")
		case lower("bugid34162")
		case lower("bugid34161")
		case lower("bugid34143")
		case lower("bugid34142")
		case lower("bugid34141")	
			//Maximum script size exceeded. 		//2100
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

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

//ls_array[Upperbound(ls_array) + 1 ] = "testcasepoint_example1"			//edit you test case point name

ls_array[Upperbound(ls_array) + 1 ] = "bugid34137"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34136"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34135"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34134"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34132"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34130"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34126"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34124"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34116"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34115"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34113"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34105"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34104"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34103"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34102"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34098"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34097"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34090"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34087"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34085"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34081"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34075"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34071"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34070"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34068"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34067"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34066"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34064"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34060"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34056"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34054"



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
		case lower("bugid34137")
			
		case lower("bugid34136")
		case lower("bugid34135")
		case lower("bugid34134")
		case lower("bugid34132")
		case lower("bugid34130")
		case lower("bugid34126")
		case lower("bugid34124")
		case lower("bugid34116")
		case lower("bugid34115")
		case lower("bugid34113")
		case lower("bugid34105")
		case lower("bugid34104")
		case lower("bugid34103")
		case lower("bugid34102")
		case lower("bugid34098")
		case lower("bugid34097")
		case lower("bugid34090")
		case lower("bugid34087")
		case lower("bugid34085")
		case lower("bugid34081")
		case lower("bugid34075")
		case lower("bugid34071")
		case lower("bugid34070")
		case lower("bugid34068")
		case lower("bugid34067")
		case lower("bugid34066")
		case lower("bugid34064")
		case lower("bugid34060")
		case lower("bugid34056")
		case lower("bugid34054")
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module2 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid34053"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34051"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34048"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34043"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34042"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34041"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34040"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34039"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34036"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34035"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34034"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34033"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34032"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34031"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34030"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34029"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34027"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34026"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34022"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34018"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34014"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34012"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34009"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34007"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34006"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34005"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34003"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34000"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33998"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33997"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33996"



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
		case lower("bugid34053")
			
		case lower("bugid34051")
		case lower("bugid34048")
		case lower("bugid34043")
		case lower("bugid34042")
		case lower("bugid34041")
		case lower("bugid34040")
		case lower("bugid34039")
		case lower("bugid34036")
		case lower("bugid34035")
		case lower("bugid34034")
		case lower("bugid34033")
		case lower("bugid34032")
		case lower("bugid34031")
		case lower("bugid34030")
		case lower("bugid34029")
		case lower("bugid34027")
		case lower("bugid34026")
		case lower("bugid34022")
		case lower("bugid34018")
		case lower("bugid34014")
		case lower("bugid34012")
		case lower("bugid34009")
		case lower("bugid34007")
		case lower("bugid34006")
		case lower("bugid34005")
		case lower("bugid34003")
		case lower("bugid34000")
		case lower("bugid33998")
		case lower("bugid33997")
		case lower("bugid33996")
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module3 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid33991"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33989"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33986"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33977"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33973"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33972"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33969"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33967"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33966"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33965"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33962"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33961"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33960"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33957"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33956"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33955"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33954"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33952"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33948"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33947"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33944"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33943"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33942"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33938"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33933"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33930"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33929"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33928"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33927"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33925"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33922"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33915"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33910"


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
		case lower("bugid33991")
			
		case lower("bugid33989")
		case lower("bugid33986")
		case lower("bugid33977")
		case lower("bugid33973")
		case lower("bugid33972")
		case lower("bugid33969")
		case lower("bugid33967")
		case lower("bugid33966")
		case lower("bugid33965")
		case lower("bugid33962")
		case lower("bugid33961")
		case lower("bugid33960")
		case lower("bugid33957")
		case lower("bugid33956")
		case lower("bugid33955")
		case lower("bugid33954")
		case lower("bugid33952")
		case lower("bugid33948")
		case lower("bugid33947")
		case lower("bugid33944")
		case lower("bugid33943")
		case lower("bugid33942")
		case lower("bugid33938")
		case lower("bugid33933")
		case lower("bugid33930")
		case lower("bugid33929")
		case lower("bugid33928")
		case lower("bugid33927")
		case lower("bugid33925")
		case lower("bugid33922")
		case lower("bugid33915")
		case lower("bugid33910")	
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_bugtrack2015_1.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_apb_bugtrack2015_1.destroy
call super::destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_apb_bugtrack2015_1
integer x = 64
integer y = 72
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

