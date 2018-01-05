$PBExportHeader$w_apb_bugtrack2013_1.srw
forward
global type w_apb_bugtrack2013_1 from w_base_case
end type
end forward

global type w_apb_bugtrack2013_1 from w_base_case
end type
global w_apb_bugtrack2013_1 w_apb_bugtrack2013_1

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
public subroutine of_testcase_point_module4 ()
public subroutine of_testcase_point_module5 ()
public subroutine of_testcase_point_module6 ()
public subroutine of_testcase_point_module7 ()
public subroutine of_testcase_point_module8 ()
public subroutine of_testcase_point_module9 ()
public subroutine of_testcase_point_module10 ()
public subroutine of_testcase_point_module11 ()
public subroutine of_testcase_point_module12 ()
public subroutine of_testcase_point_module13 ()
public subroutine of_testcase_point_module14 ()
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid32684"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32679"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32675"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32671"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32667"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32664"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32659"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32655"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32633"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32632"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32628"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32625"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32618"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32617"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32616"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32614"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32612"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32611"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32610"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32608"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32607"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32600"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32599"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32598"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32595"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32588"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32583"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32577"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32575"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32574"


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
		case lower("bugid32684")
		case lower("bugid32679")
		case lower("bugid32675")
		case lower("bugid32671")
		case lower("bugid32667")
		case lower("bugid32664")
		case lower("bugid32659")
		case lower("bugid32655")
		case lower("bugid32633")
		case lower("bugid32632")
		case lower("bugid32628")
		case lower("bugid32625")
		case lower("bugid32618")
		case lower("bugid32617")
		case lower("bugid32616")
		case lower("bugid32614")
		case lower("bugid32612")
		case lower("bugid32611")
		case lower("bugid32610")
		case lower("bugid32608")
		case lower("bugid32607")
		case lower("bugid32600")
		case lower("bugid32599")
		case lower("bugid32598")
		case lower("bugid32595")
		case lower("bugid32588")
		case lower("bugid32583")
		case lower("bugid32577")
		case lower("bugid32575")
		case lower("bugid32574")

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
ls_array[Upperbound(ls_array) + 1 ] = "bugid32570"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32568"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32564"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32563"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32562"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32560"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32556"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32552"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32548"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32532"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32531"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32530"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32522"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32515"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32499"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32494"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32481"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32463"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32457"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32447"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32435"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32429"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32428"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32427"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32425"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32419"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32414"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32411"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32406"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32395"

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

		case lower("bugid32570")
		case lower("bugid32568")
		case lower("bugid32564")
		case lower("bugid32563")
		case lower("bugid32562")
		case lower("bugid32560")
		case lower("bugid32556")
		case lower("bugid32552")
		case lower("bugid32548")
		case lower("bugid32532")
		case lower("bugid32531")
		case lower("bugid32530")
		case lower("bugid32522")
		case lower("bugid32515")
		case lower("bugid32499")
		case lower("bugid32494")
		case lower("bugid32481")
		case lower("bugid32463")
		case lower("bugid32457")
		case lower("bugid32447")
		case lower("bugid32435")
		case lower("bugid32429")
		case lower("bugid32428")
		case lower("bugid32427")
		case lower("bugid32425")
		case lower("bugid32419")
		case lower("bugid32414")
		case lower("bugid32411")
		case lower("bugid32406")
		case lower("bugid32395")
		
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid32378"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32377"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32375"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32374"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32373"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32372"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32365"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32359"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32358"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32357"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32353"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32350"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32336"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32333"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32329"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32328"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32322"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32321"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32310"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32292"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32282"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32279"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32277"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32276"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32273"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32267"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32266"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32263"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32261"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32259"


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
		case lower("bugid32378")
		case lower("bugid32377")
		case lower("bugid32375")
		case lower("bugid32374")
		case lower("bugid32373")
		case lower("bugid32372")
		case lower("bugid32365")
		case lower("bugid32359")
		case lower("bugid32358")
		case lower("bugid32357")
		case lower("bugid32353")
		case lower("bugid32350")
		case lower("bugid32336")
		case lower("bugid32333")
		case lower("bugid32329")
		case lower("bugid32328")
		case lower("bugid32322")
		case lower("bugid32321")
		case lower("bugid32310")
		case lower("bugid32292")
		case lower("bugid32282")
		case lower("bugid32279")
		case lower("bugid32277")
		case lower("bugid32276")
		case lower("bugid32273")
		case lower("bugid32267")
		case lower("bugid32266")
		case lower("bugid32263")
		case lower("bugid32261")
		case lower("bugid32259")			
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid32254"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32253"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32252"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32250"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32248"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32247"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32246"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32239"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32236"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32235"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32232"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32217"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32212"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32207"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32203"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32201"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32200"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32199"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32198"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32197"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32193"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32192"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32191"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32190"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32186"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32184"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32179"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32169"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32166"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32165"


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
		case lower("bugid32254")
		case lower("bugid32253")
		case lower("bugid32252")
		case lower("bugid32250")
		case lower("bugid32248")
		case lower("bugid32247")
		case lower("bugid32246")
		case lower("bugid32239")
		case lower("bugid32236")
		case lower("bugid32235")
		case lower("bugid32232")
		case lower("bugid32217")
		case lower("bugid32212")
		case lower("bugid32207")
		case lower("bugid32203")
		case lower("bugid32201")
		case lower("bugid32200")
		case lower("bugid32199")
		case lower("bugid32198")
		case lower("bugid32197")
		case lower("bugid32193")
		case lower("bugid32192")
		case lower("bugid32191")
		case lower("bugid32190")
		case lower("bugid32186")
		case lower("bugid32184")
		case lower("bugid32179")
		case lower("bugid32169")
		case lower("bugid32166")
		case lower("bugid32165")		
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid32153"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32152"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32148"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32147"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32143"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32142"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32141"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32140"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32139"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32137"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32136"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32135"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32134"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32133"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32132"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32131"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32130"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32129"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32128"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32127"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32118"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32117"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32110"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32107"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32103"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32077"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32071"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32067"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32063"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32060"

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
		case lower("bugid32153")
		case lower("bugid32152")
		case lower("bugid32148")
		case lower("bugid32147")
		case lower("bugid32143")
		case lower("bugid32142")
		case lower("bugid32141")
		case lower("bugid32140")
		case lower("bugid32139")
		case lower("bugid32137")
		case lower("bugid32136")
		case lower("bugid32135")
		case lower("bugid32134")
		case lower("bugid32133")
		case lower("bugid32132")
		case lower("bugid32131")
		case lower("bugid32130")
		case lower("bugid32129")
		case lower("bugid32128")
		case lower("bugid32127")
		case lower("bugid32118")
		case lower("bugid32117")
		case lower("bugid32110")
		case lower("bugid32107")
		case lower("bugid32103")
		case lower("bugid32077")
		case lower("bugid32071")
		case lower("bugid32067")
		case lower("bugid32063")
		case lower("bugid32060")		
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid32059"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32057"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32048"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32043"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32042"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32022"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32020"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32019"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32009"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32008"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32006"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32005"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32003"
ls_array[Upperbound(ls_array) + 1 ] = "bugid32002"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31984"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31979"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31977"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31956"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31954"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31953"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31952"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31951"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31947"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31940"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31937"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31935"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31934"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31930"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31925"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31921"

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
		case lower("bugid32059")
		case lower("bugid32057")
		case lower("bugid32048")
		case lower("bugid32043")
		case lower("bugid32042")
		case lower("bugid32022")
		case lower("bugid32020")
		case lower("bugid32019")
		case lower("bugid32009")
		case lower("bugid32008")
		case lower("bugid32006")
		case lower("bugid32005")
		case lower("bugid32003")
		case lower("bugid32002")
		case lower("bugid31984")
		case lower("bugid31979")
		case lower("bugid31977")
		case lower("bugid31956")
		case lower("bugid31954")
		case lower("bugid31953")
		case lower("bugid31952")
		case lower("bugid31951")
		case lower("bugid31947")
		case lower("bugid31940")
		case lower("bugid31937")
		case lower("bugid31935")
		case lower("bugid31934")
		case lower("bugid31930")
		case lower("bugid31925")
		case lower("bugid31921")
		
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid31920"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31909"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31903"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31898"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31880"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31878"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31865"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31863"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31861"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31852"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31849"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31848"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31845"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31836"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31835"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31834"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31833"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31830"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31827"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31826"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31818"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31817"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31803"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31793"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31791"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31789"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31778"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31777"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31776"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31768"


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
		case lower("bugid31920")
		case lower("bugid31909")
		case lower("bugid31903")
		case lower("bugid31898")
		case lower("bugid31880")
		case lower("bugid31878")
		case lower("bugid31865")
		case lower("bugid31863")
		case lower("bugid31861")
		case lower("bugid31852")
		case lower("bugid31849")
		case lower("bugid31848")
		case lower("bugid31845")
		case lower("bugid31836")
		case lower("bugid31835")
		case lower("bugid31834")
		case lower("bugid31833")
		case lower("bugid31830")
		case lower("bugid31827")
		case lower("bugid31826")
		case lower("bugid31818")
		case lower("bugid31817")
		case lower("bugid31803")
		case lower("bugid31793")
		case lower("bugid31791")
		case lower("bugid31789")
		case lower("bugid31778")
		case lower("bugid31777")
		case lower("bugid31776")
		case lower("bugid31768")
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid31763"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31761"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31753"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31752"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31747"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31741"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31724"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31712"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31707"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31706"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31705"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31704"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31703"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31700"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31696"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31683"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31680"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31678"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31670"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31669"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31668"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31665"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31658"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31654"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31653"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31651"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31648"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31647"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31646"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31643"


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
		case lower("bugid31763")
		case lower("bugid31761")
		case lower("bugid31753")
		case lower("bugid31752")
		case lower("bugid31747")
		case lower("bugid31741")
		case lower("bugid31724")
		case lower("bugid31712")
		case lower("bugid31707")
		case lower("bugid31706")
		case lower("bugid31705")
		case lower("bugid31704")
		case lower("bugid31703")
		case lower("bugid31700")
		case lower("bugid31696")
		case lower("bugid31683")
		case lower("bugid31680")
		case lower("bugid31678")
		case lower("bugid31670")
		case lower("bugid31669")
		case lower("bugid31668")
		case lower("bugid31665")
		case lower("bugid31658")
		case lower("bugid31654")
		case lower("bugid31653")
		case lower("bugid31651")
		case lower("bugid31648")
		case lower("bugid31647")
		case lower("bugid31646")
		case lower("bugid31643")
	
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module8 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

ls_array[Upperbound(ls_array) + 1 ] = "bugid31642"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31641"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31640"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31639"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31638"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31637"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31635"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31634"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31633"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31632"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31631"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31630"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31629"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31627"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31626"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31622"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31617"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31616"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31615"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31614"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31610"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31608"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31605"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31603"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31596"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31594"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31593"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31592"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31591"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31590"


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
		case lower("bugid31642")
		case lower("bugid31641")
		case lower("bugid31640")
		case lower("bugid31639")
		case lower("bugid31638")
		case lower("bugid31637")
		case lower("bugid31635")
		case lower("bugid31634")
		case lower("bugid31633")
		case lower("bugid31632")
		case lower("bugid31631")
		case lower("bugid31630")
		case lower("bugid31629")
		case lower("bugid31627")
		case lower("bugid31626")
		case lower("bugid31622")
		case lower("bugid31617")
		case lower("bugid31616")
		case lower("bugid31615")
		case lower("bugid31614")
		case lower("bugid31610")
		case lower("bugid31608")
		case lower("bugid31605")
		case lower("bugid31603")
		case lower("bugid31596")
		case lower("bugid31594")
		case lower("bugid31593")
		case lower("bugid31592")
		case lower("bugid31591")
		case lower("bugid31590")		
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module9 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

ls_array[Upperbound(ls_array) + 1 ] = "bugid31589"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31587"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31584"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31582"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31580"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31577"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31572"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31569"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31568"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31565"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31564"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31563"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31562"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31556"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31547"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31546"					//31546_1 		两个案例
ls_array[Upperbound(ls_array) + 1 ] = "bugid31542"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31541"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31540"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31536"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31533"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31529"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31528"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31527"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31525"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31515"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31512"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31511"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31502"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31496"


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
		case lower("bugid31589")
		case lower("bugid31587")
		case lower("bugid31584")
		case lower("bugid31582")
		case lower("bugid31580")
		case lower("bugid31577")
		case lower("bugid31572")
		case lower("bugid31569")
		case lower("bugid31568")
		case lower("bugid31565")
		case lower("bugid31564")
		case lower("bugid31563")
		case lower("bugid31562")
		case lower("bugid31556")
		case lower("bugid31547")
		case lower("bugid31546")
		case lower("bugid31542")
		case lower("bugid31541")
		case lower("bugid31540")
		case lower("bugid31536")
		case lower("bugid31533")
		case lower("bugid31529")
		case lower("bugid31528")
		case lower("bugid31527")
		case lower("bugid31525")
		case lower("bugid31515")
		case lower("bugid31512")
		case lower("bugid31511")
		case lower("bugid31502")
		case lower("bugid31496")
		
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module10 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

ls_array[Upperbound(ls_array) + 1 ] = "bugid31491"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31483"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31462"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31460"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31458"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31453"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31448"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31446"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31430"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31429"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31418"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31416"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31405"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31399"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31396"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31388"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31386"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31385"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31377"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31375"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31372"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31371"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31366"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31361"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31356"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31348"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31345"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31334"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31328"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31327"

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
		case lower("bugid31491")
		case lower("bugid31483")
		case lower("bugid31462")
		case lower("bugid31460")
		case lower("bugid31458")
		case lower("bugid31453")
		case lower("bugid31448")
		case lower("bugid31446")
		case lower("bugid31430")
		case lower("bugid31429")
		case lower("bugid31418")
		case lower("bugid31416")
		case lower("bugid31405")
		case lower("bugid31399")
		case lower("bugid31396")
		case lower("bugid31388")
		case lower("bugid31386")
		case lower("bugid31385")
		case lower("bugid31377")
		case lower("bugid31375")
		case lower("bugid31372")
		case lower("bugid31371")
		case lower("bugid31366")
		case lower("bugid31361")
		case lower("bugid31356")
		case lower("bugid31348")
		case lower("bugid31345")
		case lower("bugid31334")
		case lower("bugid31328")
		case lower("bugid31327")

			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module11 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid31325"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31321"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31311"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31297"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31295"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31294"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31290"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31251"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31231"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31227"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31224"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31216"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31212"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31211"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31208"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31205"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31204"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31202"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31199"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31192"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31188"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31173"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31172"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31170"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31163"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31158"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31157"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31156"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31145"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31137"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31136"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31135"

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

		case lower("bugid31325")
		case lower("bugid31321")
		case lower("bugid31311")
		case lower("bugid31297")
		case lower("bugid31295")
		case lower("bugid31294")
		case lower("bugid31290")
		case lower("bugid31251")
		case lower("bugid31231")
		case lower("bugid31227")
		case lower("bugid31224")
		case lower("bugid31216")
		case lower("bugid31212")
		case lower("bugid31211")
		case lower("bugid31208")
		case lower("bugid31205")
		case lower("bugid31204")
		case lower("bugid31202")
		case lower("bugid31199")
		case lower("bugid31192")
		case lower("bugid31188")
		case lower("bugid31173")
		case lower("bugid31172")
		case lower("bugid31170")
		case lower("bugid31163")
		case lower("bugid31158")
		case lower("bugid31157")
		case lower("bugid31156")
		case lower("bugid31145")
		case lower("bugid31137")
		case lower("bugid31136")
		case lower("bugid31135")
			


			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module12 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid31134"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31133"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31121"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31117"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31114"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31113"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31103"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31099"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31095"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31094"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31087"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31077"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31075"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31062"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31033"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31026"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31023"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31016"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31012"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31009"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31007"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30993"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30988"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30942"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30936"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30928"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30884"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30873"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30866"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30862"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30861"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30860"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30857"		//--

ls_array[Upperbound(ls_array) + 1 ] = "bugid30849"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30843"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30842"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30841"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30838"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30837"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30836"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30835"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30831"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30828"

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
		case lower("bugid31134")
		case lower("bugid31133")
		case lower("bugid31121")
		case lower("bugid31117")
		case lower("bugid31114")
		case lower("bugid31113")
		case lower("bugid31103")
		case lower("bugid31099")
		case lower("bugid31095")
		case lower("bugid31094")
		case lower("bugid31087")
		case lower("bugid31077")
		case lower("bugid31075")
		case lower("bugid31062")
		case lower("bugid31033")
		case lower("bugid31026")
		case lower("bugid31023")
		case lower("bugid31016")
		case lower("bugid31012")
		case lower("bugid31009")
		case lower("bugid31007")
		case lower("bugid30993")
		case lower("bugid30988")
		case lower("bugid30942")
		case lower("bugid30936")
		case lower("bugid30928")
		case lower("bugid30884")
			
		case lower("bugid30873")
		case lower("bugid30866")
		case lower("bugid30862")
		case lower("bugid30861")
		case lower("bugid30860")

		case lower("bugid30857")
			
		case lower("bugid30849")
		case lower("bugid30843")
		case lower("bugid30842")
		
		case lower("bugid30841")
		
		case lower("bugid30838")
		case lower("bugid30837")
		case lower("bugid30836")
		case lower("bugid30835")
				
		case lower("bugid30831")
		case lower("bugid30828")
		
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module13 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid30827"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30798"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30795"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30787"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30785"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30770"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30758"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30732"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30730"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30728"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30727"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30709"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30703"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30701"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30687"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30684"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30682"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30668"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30657"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30654"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30652"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30648"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30646"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30644"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30640"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30639"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30634"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30633"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30623"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30621"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30619"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30617"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30615"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30614"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30612"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30606"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30604"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30600"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30581"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30570"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30557"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30542"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30541"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30532"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30531"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30518"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30517"


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

		case lower("bugid30827")
		case lower("bugid30798")
		case lower("bugid30795")
		case lower("bugid30787")
		case lower("bugid30785")
		case lower("bugid30770")
		case lower("bugid30758")
		case lower("bugid30732")
		case lower("bugid30730")
		case lower("bugid30728")
		case lower("bugid30727")
		
		case lower("bugid30709")
		case lower("bugid30703")
		case lower("bugid30701")
		case lower("bugid30687")
		case lower("bugid30684")
		case lower("bugid30682")	

		case lower("bugid30668")

		case lower("bugid30657")
		case lower("bugid30654")
			
		case lower("bugid30652")
	
		case lower("bugid30648")
		case lower("bugid30646")
		case lower("bugid30644")
			
		case lower("bugid30640")
		case lower("bugid30639")
		case lower("bugid30634")
		case lower("bugid30633")
			
		case lower("bugid30623")
		case lower("bugid30621")
		case lower("bugid30619")
		case lower("bugid30617")
		case lower("bugid30615")
		case lower("bugid30614")
			
		case lower("bugid30612")
		case lower("bugid30606")
		case lower("bugid30604")
		case lower("bugid30600")
		case lower("bugid30581")
		case lower("bugid30570")
		case lower("bugid30557")
		case lower("bugid30542")
		case lower("bugid30541")
		case lower("bugid30532")
		case lower("bugid30531")
		case lower("bugid30518")
		case lower("bugid30517")
		
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module14 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid30514"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30509"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30505"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30504"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30503"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30500"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30499"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30497"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30486"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30477"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30474"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30471"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30465"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30449"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30448"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30444"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30442"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30437"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30436"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30435"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30432"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30431"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30430"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30428"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30426"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30424"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30423"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30420"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30417"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30412"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30409"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30388"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30365"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30364"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30363"


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
		case lower("bugid30514")
		case lower("bugid30509")

		case lower("bugid30505")
		case lower("bugid30504")
		case lower("bugid30503")
			
		case lower("bugid30500")
		case lower("bugid30499")
		case lower("bugid30497")
		case lower("bugid30486")
		case lower("bugid30477")
		case lower("bugid30474")
		case lower("bugid30471")
		case lower("bugid30465")
		case lower("bugid30449")
		case lower("bugid30448")
		case lower("bugid30444")
		case lower("bugid30442")
		case lower("bugid30437")
		case lower("bugid30436")
		case lower("bugid30435")
		case lower("bugid30432")
		case lower("bugid30431")
		case lower("bugid30430")
		case lower("bugid30428")
		case lower("bugid30426")

		case lower("bugid30424")
		case lower("bugid30423")
			
		case lower("bugid30420")
		case lower("bugid30417")
		case lower("bugid30412")
		case lower("bugid30409")
		case lower("bugid30388")
		case lower("bugid30365")
		case lower("bugid30364")
		case lower("bugid30363")
		
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_bugtrack2013_1.create
call super::create
end on

on w_apb_bugtrack2013_1.destroy
call super::destroy
end on

