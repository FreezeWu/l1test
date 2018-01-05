$PBExportHeader$w_apb_mobile_bugtrack2013_1.srw
forward
global type w_apb_mobile_bugtrack2013_1 from w_base_case
end type
type dw_1 from datawindow within w_apb_mobile_bugtrack2013_1
end type
type em_5 from editmask within w_apb_mobile_bugtrack2013_1
end type
type em_4 from editmask within w_apb_mobile_bugtrack2013_1
end type
type em_3 from editmask within w_apb_mobile_bugtrack2013_1
end type
type em_2 from editmask within w_apb_mobile_bugtrack2013_1
end type
type em_1 from editmask within w_apb_mobile_bugtrack2013_1
end type
type sle_1 from singlelineedit within w_apb_mobile_bugtrack2013_1
end type
end forward

global type w_apb_mobile_bugtrack2013_1 from w_base_case
dw_1 dw_1
em_5 em_5
em_4 em_4
em_3 em_3
em_2 em_2
em_1 em_1
sle_1 sle_1
end type
global w_apb_mobile_bugtrack2013_1 w_apb_mobile_bugtrack2013_1

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
ls_array[Upperbound(ls_array) + 1 ] = "bugid30307"

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
			
		case lower("bugid30307")
			//The long type error in iOS
			long ll_res
			ll_res = 8454143
			sle_1.text = string(ll_res)
			
			if sle_1.text = '8454143' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "The long type error in iOS", lbn_flag)
			
			
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

ls_array[Upperbound(ls_array) + 1 ] = "bugid32106"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30296"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30178"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29809"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30064"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30066"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30077"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30010"


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
			
	 case lower("bugid32106")
	  	    // When edit a window,it is disappear.
			yield()
			is_type="closewindow"
			timer(1)
			gs_method = 'OpenSheet(w_woc101_sheet,w_mdi,1,Layered!)'
			li_rtn= OpenSheet(w_woc101_sheet,w_mdi,1,Layered!)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
	case lower("bugid30296")
		//double:data type calculate error
			Double			ldb_double
			ldb_double = 1.79769313486231E+308
			ls_temp = String(ldb_double)
			ls_result += wf_result_add(ls_item, "double转换为string类型,期望值：1.79769313486231E+308，实际值 "+ls_temp, not isnull(ls_temp) and ls_temp = '1.79769313486231E+308')
			
	case lower("bugid30178")	
		//string(double datatype ) show error
		    Real	lr_real
		    lr_real = 3.402822E+38
		    ls_temp = String(lr_real)
		    ls_result += wf_result_add(ls_item, "Real转换为string类型,期望值：3.402822E+38，实际值 "+ls_temp, not isnull(ls_temp) and ls_temp = '3.402822E+38')
	case lower("bugid29809")	
			ldc_data = 56789.43
			ls_temp = String(ldc_data)
           	ls_result += wf_result_add(ls_item, "dec转换为string类型,期望值： 56789.43，实际值 "+ls_temp, not isnull(ls_temp) and ls_temp = ' 56789.43')	
			
	case lower("bugid30064")	
		//set region and language,data error
		   em_2.text = '1895'
		   em_3.text = '1589.58'
		   ls_temp =  string (dec(em_2.text) +  dec(em_3.text))
		   ls_temp2 = string (dec(em_2.text)/ dec(em_3.text))	
		   ls_result += wf_result_add(ls_item, "set region and language,data error,期望值： 3484.58 and 1.1921388，实际值 "+ls_temp2, ls_temp2 ='1.1921388'  and ls_temp = '3484.58')	
			
	case lower("bugid30066")	
		//region and language:return values show error
		   em_2.text = '2319'
		   em_3.text = '1789.14'
		   em_4.text = string (dec(em_2.text) -  dec(em_3.text))
		   ls_temp = em_4.text
		   em_5.text = string (dec(em_2.text) * dec(em_3.text))
		   ls_temp2 = em_5.text
		   ls_result += wf_result_add(ls_item, "return values show error,期望值：529.86 and 4149015.66，实际值 "+ls_temp2, ls_temp ='529.86'  and ls_temp2 = '4149015.66')	
			
//		case lower("bugid30077")  
//还没想好怎么输入数据之后再关闭打印窗口
//			//Function PrintBitmap return value error
//			Long ll_job
//			ls_file = gs_cachedir +gs_dirseparator+ "save.bmp"
//			ll_job = PrintOpen()		
//			ll_tmp = PrintBitmap(ll_job,ls_file,50,100,0,0) 
//			PrintClose(ll_job)
//			ls_result += wf_result_add(ls_item, " ", not isnull(ll_tmp) and ll_tmp = 1)	  
	case lower("bugid33010")
			dw_1.dataobject ='d_t33010'
			li_rtn = GetNextModified(dw_1, dw_1.rowcount() + 1 , primary!) 
			ls_result += wf_result_add(ls_item, " +"+ls_temp, not isnull(li_rtn) and li_rtn = 0)
			
			
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_mobile_bugtrack2013_1.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.em_5=create em_5
this.em_4=create em_4
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.sle_1=create sle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.em_5
this.Control[iCurrent+3]=this.em_4
this.Control[iCurrent+4]=this.em_3
this.Control[iCurrent+5]=this.em_2
this.Control[iCurrent+6]=this.em_1
this.Control[iCurrent+7]=this.sle_1
end on

on w_apb_mobile_bugtrack2013_1.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.em_5)
destroy(this.em_4)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.sle_1)
end on

type dw_1 from datawindow within w_apb_mobile_bugtrack2013_1
integer x = 1691
integer y = 280
integer width = 686
integer height = 400
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_5 from editmask within w_apb_mobile_bugtrack2013_1
integer x = 992
integer y = 856
integer width = 224
integer height = 104
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
end type

type em_4 from editmask within w_apb_mobile_bugtrack2013_1
integer x = 1033
integer y = 712
integer width = 229
integer height = 84
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
end type

type em_3 from editmask within w_apb_mobile_bugtrack2013_1
integer x = 690
integer y = 820
integer width = 229
integer height = 84
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
end type

type em_2 from editmask within w_apb_mobile_bugtrack2013_1
integer x = 471
integer y = 652
integer width = 229
integer height = 84
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
end type

type em_1 from editmask within w_apb_mobile_bugtrack2013_1
integer x = 709
integer y = 676
integer width = 229
integer height = 84
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
end type

type sle_1 from singlelineedit within w_apb_mobile_bugtrack2013_1
integer x = 581
integer y = 392
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

