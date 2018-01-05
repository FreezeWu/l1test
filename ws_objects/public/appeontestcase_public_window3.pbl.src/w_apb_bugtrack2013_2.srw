$PBExportHeader$w_apb_bugtrack2013_2.srw
forward
global type w_apb_bugtrack2013_2 from w_base_case
end type
end forward

global type w_apb_bugtrack2013_2 from w_base_case
end type
global w_apb_bugtrack2013_2 w_apb_bugtrack2013_2

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
public subroutine of_testcase_point_module4 ()
public subroutine of_testcase_point_module5 ()
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid30362"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30356"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30354"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30352"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30351"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30350"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30347"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30345"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30342"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30341"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30335"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30333"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30330"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30328"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30326"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30325"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30313"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30310"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30301"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30259"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30256"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30253"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30243"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30241"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30240"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30222"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30207"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30206"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30205"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30188"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30186"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30180"


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

		case lower("bugid30362")
		case lower("bugid30356")
		case lower("bugid30354")
		case lower("bugid30352")
		case lower("bugid30351")
		case lower("bugid30350")
		case lower("bugid30347")
		case lower("bugid30345")
		case lower("bugid30342")
		case lower("bugid30341")
		case lower("bugid30335")
		case lower("bugid30333")
		case lower("bugid30330")
		case lower("bugid30328")
		case lower("bugid30326")
		case lower("bugid30325")
		case lower("bugid30313")
		case lower("bugid30310")
		case lower("bugid30301")

		case lower("bugid30259")
		
		case lower("bugid30256")
		case lower("bugid30253")
		case lower("bugid30243")
		case lower("bugid30241")

		case lower("bugid30240")	
			
		case lower("bugid30222")
		case lower("bugid30207")
		case lower("bugid30206")
		case lower("bugid30205")
		case lower("bugid30188")
		case lower("bugid30186")
		case lower("bugid30180")

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
ls_array[Upperbound(ls_array) + 1 ] = "bugid30177"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30176"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30175"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30174"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30165"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30164"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30163"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30161"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30160"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30158"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30157"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30153"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30151"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30136"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30134"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30130"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30124"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30122"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30118"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30114"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30107"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30102"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30090"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30077"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30073"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30064"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30040"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30039"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30034"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30033"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30031"


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

		case lower("bugid30177")
		case lower("bugid30176")
		case lower("bugid30175")
		case lower("bugid30174")

		case lower("bugid30165")
			
		case lower("bugid30164")
		case lower("bugid30163")
		case lower("bugid30161")
		case lower("bugid30160")
		case lower("bugid30158")
		case lower("bugid30157")
		case lower("bugid30153")
		case lower("bugid30151")
		case lower("bugid30136")
		case lower("bugid30134")
		case lower("bugid30130")
		case lower("bugid30124")
		case lower("bugid30122")
		case lower("bugid30118")
		case lower("bugid30114")
		case lower("bugid30107")
		case lower("bugid30102")
		case lower("bugid30090")
		case lower("bugid30077")
		case lower("bugid30073")
		case lower("bugid30064")
		case lower("bugid30040")
		case lower("bugid30039")
		case lower("bugid30034")
		case lower("bugid30033")
		case lower("bugid30031")

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
ls_array[Upperbound(ls_array) + 1 ] = "bugid30029"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30028"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30027"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30024"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30023"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30019"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30017"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30013"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30006"

ls_array[Upperbound(ls_array) + 1 ] = "bugid30003"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29999"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29994"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29992"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29991"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29990"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29988"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29986"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29985"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29980"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29978"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29977"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29972"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29969"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29958"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29955"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29954"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29948"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29947"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29945"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29943"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29942"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29938"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29935"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29933"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29927"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29921"

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
		
		case lower("bugid30029")
		case lower("bugid30028")

		case lower("bugid30027")
		case lower("bugid30024")
			
		case lower("bugid30023")

		case lower("bugid30019")
			
		case lower("bugid30017")

		case lower("bugid30013")
		case lower("bugid30006")
		
		case lower("bugid30003")
		case lower("bugid29999")
		case lower("bugid29994")
		case lower("bugid29992")
		case lower("bugid29991")
		case lower("bugid29990")
		case lower("bugid29988")
		case lower("bugid29986")
		case lower("bugid29985")
		case lower("bugid29980")
		case lower("bugid29978")
		case lower("bugid29977")
		case lower("bugid29972")
		case lower("bugid29969")
		case lower("bugid29958")
		case lower("bugid29955")
		case lower("bugid29954")
		case lower("bugid29948")
		case lower("bugid29947")
		case lower("bugid29945")
		case lower("bugid29943")
		case lower("bugid29942")
		case lower("bugid29938")

		case lower("bugid29935")
		case lower("bugid29933")

		case lower("bugid29927")
		case lower("bugid29921")

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

ls_array[Upperbound(ls_array) + 1 ] = "bugid29920"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29918"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29913"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29911"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29909"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29906"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29904"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29902"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29898"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29893"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29889"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29888"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29887"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29881"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29869"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29867"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29855"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29854"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29853"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29850"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29845"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29840"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29839"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29838"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29837"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29828"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29827"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29825"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29820"					//两个案例
ls_array[Upperbound(ls_array) + 1 ] = "bugid29818"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29817"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29815"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29813"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29809"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29808"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29807"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29806"


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
		case lower("bugid29920")
		case lower("bugid29918")
		case lower("bugid29913")
		case lower("bugid29911")
		case lower("bugid29909")
		case lower("bugid29906")
		case lower("bugid29904")
		case lower("bugid29902")
		case lower("bugid29898")
		case lower("bugid29893")
		case lower("bugid29889")
		case lower("bugid29888")
			
		case lower("bugid29887")
				
		case lower("bugid29881")
		case lower("bugid29869")
			
		case lower("bugid29867")
			
		case lower("bugid29855")

		case lower("bugid29854")	
			
		case lower("bugid29853")

		case lower("bugid29850")
		case lower("bugid29845")			
		
			
		case lower("bugid29840")
		case lower("bugid29839")
		case lower("bugid29838")
		case lower("bugid29837")
		case lower("bugid29828")
		case lower("bugid29827")
		case lower("bugid29825")
		case lower("bugid29820")

		case lower("bugid29818")
		case lower("bugid29817")
			
		case lower("bugid29815")
		case lower("bugid29813")
		case lower("bugid29809")
		case lower("bugid29808")
		case lower("bugid29807")
		case lower("bugid29806")
		
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid29802"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29797"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29788"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29786"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29785"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29783"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29782"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29781"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29780"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29779"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29778"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29777"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29776"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29775"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29774"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29773"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29767"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29764"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29757"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29754"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29753"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29752"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29751"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29750"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29748"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29746"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29745"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29744"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29743"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29741"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29740"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29739"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29736"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29733"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29729"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29728"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29725"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29722"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29721"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29720"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29719"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29718"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29715"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29713"


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

		case lower("bugid29802")
		case lower("bugid29797")
		case lower("bugid29788")
		case lower("bugid29786")
		case lower("bugid29785")
		case lower("bugid29783")
		case lower("bugid29782")
		case lower("bugid29781")

		case lower("bugid29780")
		case lower("bugid29779")
		
		case lower("bugid29778")
		case lower("bugid29777")
		case lower("bugid29776")
		case lower("bugid29775")
	
		case lower("bugid29774")
		case lower("bugid29773")
			
		case lower("bugid29767")
		case lower("bugid29764")
		case lower("bugid29757")
		case lower("bugid29754")
		case lower("bugid29753")
		case lower("bugid29752")
	
		case lower("bugid29751")
		case lower("bugid29750")
		case lower("bugid29748")
					
		case lower("bugid29746")
		case lower("bugid29745")
		
		case lower("bugid29744")
		case lower("bugid29743")
		case lower("bugid29741")
					
		case lower("bugid29740")
		case lower("bugid29739")
		case lower("bugid29736")
		case lower("bugid29733")

		case lower("bugid29729")
		case lower("bugid29728")
		case lower("bugid29725")
		case lower("bugid29722")			

		case lower("bugid29721")
		case lower("bugid29720")
		case lower("bugid29719")
		case lower("bugid29718")
		case lower("bugid29715")
		case lower("bugid29713")
	
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid29712"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29711"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29697"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29694"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29693"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29691"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29690"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29687"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29686"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29685"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29680"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29677"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29672"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29671"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29669"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29667"

ls_array[Upperbound(ls_array) + 1 ] = "bugid29665"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29659"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29655"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29643"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29642"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29641"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29638"

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

		case lower("bugid29712")
		case lower("bugid29711")
		case lower("bugid29697")
		case lower("bugid29694")
		case lower("bugid29693")
		case lower("bugid29691")
		case lower("bugid29690")
		case lower("bugid29687")
		case lower("bugid29686")
		case lower("bugid29685")
		case lower("bugid29680")
		case lower("bugid29677")
		case lower("bugid29672")
		case lower("bugid29671")

		case lower("bugid29669")
		case lower("bugid29667")
		
		case lower("bugid29665")
		case lower("bugid29659")
		case lower("bugid29655")
		case lower("bugid29643")
		case lower("bugid29642")
		case lower("bugid29641")
		case lower("bugid29638")		
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_bugtrack2013_2.create
call super::create
end on

on w_apb_bugtrack2013_2.destroy
call super::destroy
end on

