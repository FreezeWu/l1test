$PBExportHeader$w_apb_mobile_bugtrack2017_1.srw
forward
global type w_apb_mobile_bugtrack2017_1 from w_base_case
end type
type sle_1 from singlelineedit within w_apb_mobile_bugtrack2017_1
end type
type dw_2 from datawindow within w_apb_mobile_bugtrack2017_1
end type
type mle_1 from multilineedit within w_apb_mobile_bugtrack2017_1
end type
type dw_1 from datawindow within w_apb_mobile_bugtrack2017_1
end type
end forward

global type w_apb_mobile_bugtrack2017_1 from w_base_case
sle_1 sle_1
dw_2 dw_2
mle_1 mle_1
dw_1 dw_1
end type
global w_apb_mobile_bugtrack2017_1 w_apb_mobile_bugtrack2017_1

type variables
integer ii_ret
end variables

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
ls_array[Upperbound(ls_array) + 1 ] = "bugid34706"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34672"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34667"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34611"

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
		case lower("bugid34706")
			//Upper replace ascii 223 with 'SS'
			string ls_chac1 = char(223)
			string ls_chac2 = char(228)
			string ls_chac3 = char(246)
			string ls_chac4 = char(252)
			string ls_upchac1, ls_upchac2, ls_upchac3, ls_upchac4
			ls_upchac1 = upper(ls_chac1)
			ls_upchac2 = upper(ls_chac2)
			ls_upchac3 = upper(ls_chac3)
			ls_upchac4 = upper(ls_chac4)
			
			if ls_upchac1= 'ß' and ls_upchac2 = 'Ä' and ls_upchac3 = 'Ö' and ls_upchac4 = 'Ü' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, " Upper replace ascii 223 with 'SS' ", lbn_flag)
			
		case lower("bugid34672")
			//switch Datawindow focus may cause input data lost
			int li_num
			dw_2.dataobject = 'd_time34675'
			dw_2.settransobject(sqlca)
			dw_2.retrieve()
			dw_2.setitem(1,'c_id',8)
			sle_1.text = "TEST"
			li_num = dw_2.getitemnumber(1,1)
			
			if li_num = 8 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, " Switch Datawindow focus will not cause input data lost ", lbn_flag)
			
		case lower("bugid34667")
			//upper/lower destroys string bigger than 1023 character on Android cause error
			string ls_exp = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida"
			string ls_upexp
			long ll_len
			mle_1.text = ls_exp
			ls_upexp = upper(ls_exp)
			mle_1.text = upper (ls_exp + "1" )
			ll_len = len(mle_1.text)
			
			if ll_len = 1024 and mle_1.text = (ls_upexp + "1") then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, " upper/lower destroys string bigger than 1023 character ", lbn_flag)
		
		case lower("bugid34611")
			//scrolltorow does not work on mobile
			long ll_row1,ll_row2
			dw_2.dataobject = 'd_cust34632'
			dw_2.settransobject(sqlca)
			dw_2.retrieve()
			ll_row1 = dw_2.getrow()
			dw_2.scrolltorow(10)
			ll_row2 = dw_2.getrow()
			
			if ll_row1 = 1 and ll_row2 = 10 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "scrolltorow does not work on mobile", lbn_flag)
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

ls_array[Upperbound(ls_array) + 1 ] = "bugid34557"			//edit you test case point name
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
		case lower("bugid34557")
			ls_file =  gs_cachedir+ gs_dirseparator + "test.pdf"
			dw_1.dataobject = 'd_employee34557'
			dw_1.settransobject(SQLCA)
			dw_1.retrieve()
			ll_tmp = dw_1.saveas(ls_file, PDF!, false)
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_tmp) and ll_tmp = 1)
		
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_mobile_bugtrack2017_1.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.dw_2=create dw_2
this.mle_1=create mle_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.mle_1
this.Control[iCurrent+4]=this.dw_1
end on

on w_apb_mobile_bugtrack2017_1.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.dw_2)
destroy(this.mle_1)
destroy(this.dw_1)
end on

type sle_1 from singlelineedit within w_apb_mobile_bugtrack2017_1
integer x = 69
integer y = 688
integer width = 1102
integer height = 132
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_apb_mobile_bugtrack2017_1
integer x = 1737
integer y = 104
integer width = 343
integer height = 324
integer taborder = 30
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.AcceptText()
ii_ret = this.GetItemNumber(1,1)



end event

type mle_1 from multilineedit within w_apb_mobile_bugtrack2017_1
integer x = 1239
integer y = 96
integer width = 361
integer height = 332
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_apb_mobile_bugtrack2017_1
integer x = 128
integer y = 72
integer width = 686
integer height = 400
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

