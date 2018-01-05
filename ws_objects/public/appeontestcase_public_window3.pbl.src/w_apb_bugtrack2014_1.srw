$PBExportHeader$w_apb_bugtrack2014_1.srw
forward
global type w_apb_bugtrack2014_1 from w_base_case
end type
type cb_1 from commandbutton within w_apb_bugtrack2014_1
end type
end forward

global type w_apb_bugtrack2014_1 from w_base_case
cb_1 cb_1
end type
global w_apb_bugtrack2014_1 w_apb_bugtrack2014_1

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
public subroutine of_testcase_point_module4 ()
public subroutine of_testcase_point_module5 ()
public subroutine of_testcase_point_module6 ()
public subroutine of_testcase_point_module7 ()
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid33902"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33894"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33893"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33892"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33891"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33886"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33877"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33874"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33868"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33867"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33866"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33865"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33863"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33862"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33861"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33857"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33849"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33847"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33845"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33843"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33841"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33839"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33834"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33833"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33830"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33823"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33821"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33818"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33812"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33808"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33807"



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
		case lower("bugid33902")
		case lower("bugid33894")
		case lower("bugid33893")
		case lower("bugid33892")
		case lower("bugid33891")
		case lower("bugid33886")
		case lower("bugid33877")
		case lower("bugid33874")
		case lower("bugid33868")
		case lower("bugid33867")
		case lower("bugid33866")
		case lower("bugid33865")
		case lower("bugid33863")
		case lower("bugid33862")
		case lower("bugid33861")
		case lower("bugid33857")
		case lower("bugid33849")
		case lower("bugid33847")
		case lower("bugid33845")
		case lower("bugid33843")
		case lower("bugid33841")
		case lower("bugid33839")
		case lower("bugid33834")
		case lower("bugid33833")
		case lower("bugid33830")
		case lower("bugid33823")
		case lower("bugid33821")
		case lower("bugid33818")
		case lower("bugid33812")
		case lower("bugid33808")
		case lower("bugid33807")			
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid33804"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33784"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33779"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33778"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33771"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33769"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33768"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33767"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33765"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33757"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33755"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33753"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33750"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33747"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33743"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33739"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33736"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33728"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33727"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33725"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33724"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33720"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33713"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33697"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33696"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33695"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33689"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33682"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33679"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33678"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33676"


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
		case lower("bugid33804")
		case lower("bugid33784")
		case lower("bugid33779")
		case lower("bugid33778")
		case lower("bugid33771")
		case lower("bugid33769")
		case lower("bugid33768")
		case lower("bugid33767")
		case lower("bugid33765")
		case lower("bugid33757")
		case lower("bugid33755")
		case lower("bugid33753")
		case lower("bugid33750")
		case lower("bugid33747")
		case lower("bugid33743")
		case lower("bugid33739")
		case lower("bugid33736")
		case lower("bugid33728")
		case lower("bugid33727")
		case lower("bugid33725")
		case lower("bugid33724")
		case lower("bugid33720")
		case lower("bugid33713")
		case lower("bugid33697")
		case lower("bugid33696")
		case lower("bugid33695")
		case lower("bugid33689")
		case lower("bugid33682")
		case lower("bugid33679")
		case lower("bugid33678")
		case lower("bugid33676")
		
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid33672"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33670"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33664"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33658"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33656"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33654"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33653"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33643"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33642"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33637"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33635"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33628"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33624"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33618"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33609"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33598"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33596"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33590"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33582"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33580"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33579"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33577"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33574"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33570"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33561"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33558"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33549"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33548"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33545"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33544"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33542"



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
		case lower("bugid33672")
		case lower("bugid33670")
		case lower("bugid33664")
		case lower("bugid33658")
		case lower("bugid33656")
		case lower("bugid33654")
		case lower("bugid33653")
		case lower("bugid33643")
		case lower("bugid33642")
		case lower("bugid33637")
		case lower("bugid33635")
		case lower("bugid33628")
		case lower("bugid33624")
		case lower("bugid33618")
		case lower("bugid33609")
		case lower("bugid33598")
		case lower("bugid33596")
		case lower("bugid33590")
		case lower("bugid33582")
		case lower("bugid33580")
		case lower("bugid33579")
		case lower("bugid33577")
		case lower("bugid33574")
		case lower("bugid33570")
		case lower("bugid33561")
		case lower("bugid33558")
		case lower("bugid33549")
		case lower("bugid33548")
		case lower("bugid33545")
		case lower("bugid33544")
		case lower("bugid33542")		
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid33540"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33538"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33537"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33529"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33528"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33515"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33487"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33473"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33469"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33451"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33447"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33442"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33436"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33432"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33431"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33430"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33427"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33415"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33410"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33407"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33406"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33405"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33404"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33400"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33398"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33391"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33390"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33388"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33382"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33381"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33375"



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
		case lower("bugid33540")
		case lower("bugid33538")
		case lower("bugid33537")
		case lower("bugid33529")
		case lower("bugid33528")
		case lower("bugid33515")
		case lower("bugid33487")
		case lower("bugid33473")
		case lower("bugid33469")
		case lower("bugid33451")
		case lower("bugid33447")
		case lower("bugid33442")
		case lower("bugid33436")
		case lower("bugid33432")
		case lower("bugid33431")
		case lower("bugid33430")
		case lower("bugid33427")
		case lower("bugid33415")
		case lower("bugid33410")
		case lower("bugid33407")
		case lower("bugid33406")
		case lower("bugid33405")
		case lower("bugid33404")
		case lower("bugid33400")
		case lower("bugid33398")
		case lower("bugid33391")
		case lower("bugid33390")
		case lower("bugid33388")
		case lower("bugid33382")
		case lower("bugid33381")
		case lower("bugid33375")	
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module4 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid33367"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33366"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33365"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33357"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33356"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33353"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33349"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33347"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33340"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33336"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33328"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33323"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33317"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33314"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33313"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33302"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33296"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33294"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33289"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33287"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33283"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33277"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33276"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33266"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33258"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33257"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33253"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33248"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33244"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33232"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33230"


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
		case lower("bugid33367")
		case lower("bugid33366")
		case lower("bugid33365")
		case lower("bugid33357")
		case lower("bugid33356")
		case lower("bugid33353")
		case lower("bugid33349")
		case lower("bugid33347")
		case lower("bugid33340")
		case lower("bugid33336")
		case lower("bugid33328")
		case lower("bugid33323")
		case lower("bugid33317")
		case lower("bugid33314")
		case lower("bugid33313")
		case lower("bugid33302")
		case lower("bugid33296")
		case lower("bugid33294")
		case lower("bugid33289")
		case lower("bugid33287")
		case lower("bugid33283")
		case lower("bugid33277")
		case lower("bugid33276")
		case lower("bugid33266")
		case lower("bugid33258")
		case lower("bugid33257")
		case lower("bugid33253")
		case lower("bugid33248")
		case lower("bugid33244")
		case lower("bugid33232")
		case lower("bugid33230")	
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module5 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid33229"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33219"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33217"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33216"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33215"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33207"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33206"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33204"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33175"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33168"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33153"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33143"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33142"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33135"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33130"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33129"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33126"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33115"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33114"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33113"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33112"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33111"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33101"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33095"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33094"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33082"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33079"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33076"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33075"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33070"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33061"



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
		case lower("bugid33229")
		case lower("bugid33219")
		case lower("bugid33217")
		case lower("bugid33216")
		case lower("bugid33215")
		case lower("bugid33207")
		case lower("bugid33206")
		case lower("bugid33204")
		case lower("bugid33175")
		case lower("bugid33168")
		case lower("bugid33153")
		case lower("bugid33143")
		case lower("bugid33142")
		case lower("bugid33135")
		case lower("bugid33130")
		case lower("bugid33129")
		case lower("bugid33126")
		case lower("bugid33115")
		case lower("bugid33114")
		case lower("bugid33113")
		case lower("bugid33112")
		case lower("bugid33111")
		case lower("bugid33101")
		case lower("bugid33095")
		case lower("bugid33094")
		case lower("bugid33082")
		case lower("bugid33079")
		case lower("bugid33076")
		case lower("bugid33075")
		case lower("bugid33070")
		case lower("bugid33061")
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module6 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid33052"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33050"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33047"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33046"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33044"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33042"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33041"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33038"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33036"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33031"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33025"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33021"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33020"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33011"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33003"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33002"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32990"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32977"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32969"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32966"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32962"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32959"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32958"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32938"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32932"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32926"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32919"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32908"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32892"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32890"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32889"


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
		case lower("bugid33052")
		case lower("bugid33050")
		case lower("bugid33047")
		case lower("bugid33046")
		case lower("bugid33044")
		case lower("bugid33042")
		case lower("bugid33041")
		case lower("bugid33038")
		case lower("bugid33036")
		case lower("bugid33031")
		case lower("bugid33025")
		case lower("bugid33021")
		case lower("bugid33020")
		case lower("bugid33011")
		case lower("bugid33003")
		case lower("bugid33002")
		case lower("bugid32990")
		case lower("bugid32977")
		case lower("bugid32969")
		case lower("bugid32966")
		case lower("bugid32962")
		case lower("bugid32959")
		case lower("bugid32958")
		case lower("bugid32938")
		case lower("bugid32932")
		case lower("bugid32926")
		case lower("bugid32919")
		case lower("bugid32908")
		case lower("bugid32892")
		case lower("bugid32890")
		case lower("bugid32889")		
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module7 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid32884"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32881"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32873"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32862"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32844"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32842"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32841"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32840"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32836"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32830"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32822"					//bugid32822b   有两个案例
ls_array[Upperbound(ls_array) + 1 ] = "bugid32818"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32816"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32813"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32810"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32790"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32785"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32773"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32772"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32757"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32755"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32751"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32730"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32722"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32711"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32710"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32707"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32705"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32700"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32689"

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
		case lower("bugid32884")
		case lower("bugid32881")
		case lower("bugid32873")
		case lower("bugid32862")
		case lower("bugid32844")
		case lower("bugid32842")
		case lower("bugid32841")
		case lower("bugid32840")
		case lower("bugid32836")
		case lower("bugid32830")
		case lower("bugid32822")
		case lower("bugid32818")
		case lower("bugid32816")
		case lower("bugid32813")
		case lower("bugid32810")
		case lower("bugid32790")
		case lower("bugid32785")
		case lower("bugid32773")
		case lower("bugid32772")
		case lower("bugid32757")
		case lower("bugid32755")
		case lower("bugid32751")
		case lower("bugid32730")
		case lower("bugid32722")
		case lower("bugid32711")
		case lower("bugid32710")
		case lower("bugid32707")
		case lower("bugid32705")
		case lower("bugid32700")
		case lower("bugid32689")
	
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_bugtrack2014_1.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_apb_bugtrack2014_1.destroy
call super::destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_apb_bugtrack2014_1
integer x = 160
integer y = 96
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

