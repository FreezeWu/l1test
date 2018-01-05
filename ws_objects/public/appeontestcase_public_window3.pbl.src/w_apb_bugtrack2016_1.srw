$PBExportHeader$w_apb_bugtrack2016_1.srw
forward
global type w_apb_bugtrack2016_1 from w_base_case
end type
type cb_1 from commandbutton within w_apb_bugtrack2016_1
end type
end forward

global type w_apb_bugtrack2016_1 from w_base_case
cb_1 cb_1
end type
global w_apb_bugtrack2016_1 w_apb_bugtrack2016_1

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
ls_array[Upperbound(ls_array) + 1 ] = "bugid34552"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34549"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34547"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34545"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34542"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34540"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34538"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34522"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34520"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34515"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34513"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34503"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34497"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34493"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34487"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34476"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34473"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34472"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34470"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34466"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34465"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34462"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34460"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34455"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34453"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34452"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34451"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34449"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34448"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34442"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34441"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34434"

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
		case lower("bugid34552")
			 
		case lower("bugid34549")
		case lower("bugid34547")
		case lower("bugid34545")
		case lower("bugid34542")
		case lower("bugid34540")
		case lower("bugid34538")
		case lower("bugid34522")
		case lower("bugid34520")
		case lower("bugid34515")
		case lower("bugid34513")
		case lower("bugid34503")
		case lower("bugid34497")
		case lower("bugid34493")
		case lower("bugid34487")
		case lower("bugid34476")
		case lower("bugid34473")
		case lower("bugid34472")
		case lower("bugid34470")		
		case lower("bugid34466")
		case lower("bugid34465")
		case lower("bugid34462")
		case lower("bugid34460")
		case lower("bugid34455")
		case lower("bugid34453")
		case lower("bugid34452")
		case lower("bugid34451")
		case lower("bugid34449")
		case lower("bugid34448")
		case lower("bugid34442")
		case lower("bugid34441")
		case lower("bugid34434")
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid34433"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34430"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34427"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34414"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34412"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34408"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34405"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34403"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34400"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34399"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34394"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34392"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34390"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34383"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34382"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34381"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34380"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34378"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34377"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34376"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34375"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34373"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34369"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34368"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34367"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34366"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34357"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34355"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34349"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34347"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34341"


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
		case lower("bugid34433")	
			
		case lower("bugid34430")
		case lower("bugid34427")
		case lower("bugid34414")
		case lower("bugid34412")
		case lower("bugid34408")
		case lower("bugid34405")
		case lower("bugid34403")
		case lower("bugid34400")
		case lower("bugid34399")
		case lower("bugid34394")
		case lower("bugid34392")
		case lower("bugid34390")
		case lower("bugid34383")
		case lower("bugid34382")
		case lower("bugid34381")
		case lower("bugid34380")
		case lower("bugid34378")
		case lower("bugid34377")
		case lower("bugid34376")
		case lower("bugid34375")
		case lower("bugid34373")
		case lower("bugid34369")
		case lower("bugid34368")
		case lower("bugid34367")
		case lower("bugid34366")
		case lower("bugid34357")
		case lower("bugid34355")
		case lower("bugid34349")
		case lower("bugid34347")
		case lower("bugid34341")	
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid34339"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34338"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34337"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34336"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34328"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34325"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34322"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34321"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34319"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34318"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34317"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34316"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34315"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34314"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34313"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34311"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34310"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34309"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34308"						
ls_array[Upperbound(ls_array) + 1 ] = "bugid34307"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34305"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34302"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34301"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34300"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34299"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34298"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34296"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34292"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34289"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34288"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34283"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34282"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34281"

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
		case lower("bugid34339")
			
		case lower("bugid34338")
		case lower("bugid34337")
		case lower("bugid34336")
		case lower("bugid34328")
		case lower("bugid34325")
		case lower("bugid34322")
		case lower("bugid34321")
		case lower("bugid34319")
		case lower("bugid34318")
		case lower("bugid34317")
		case lower("bugid34316")
		case lower("bugid34315")
		case lower("bugid34314")
		case lower("bugid34313")
		case lower("bugid34311")
		case lower("bugid34310")
		case lower("bugid34309")
		case lower("bugid34308")
		case lower("bugid34307")
		case lower("bugid34305")
		case lower("bugid34302")
		case lower("bugid34301")
		case lower("bugid34300")
		case lower("bugid34299")
		case lower("bugid34298")
		case lower("bugid34296")
		case lower("bugid34292")
		case lower("bugid34289")
		case lower("bugid34288")
		case lower("bugid34283")
		case lower("bugid34282")
		case lower("bugid34281")		
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid34275"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34272"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34271"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34267"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34266"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34265"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34263"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34260"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34259"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34258"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34255"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34251"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34250"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34249"

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
		case lower("bugid34275")
			
		case lower("bugid34272")
		case lower("bugid34271")
		case lower("bugid34267")
		case lower("bugid34266")
		case lower("bugid34265")
		case lower("bugid34263")
		case lower("bugid34260")
		case lower("bugid34259")
		case lower("bugid34258")
		case lower("bugid34255")
		case lower("bugid34251")
		case lower("bugid34250")
		case lower("bugid34249")		
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_bugtrack2016_1.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_apb_bugtrack2016_1.destroy
call super::destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_apb_bugtrack2016_1
integer x = 82
integer y = 60
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute"
end type

