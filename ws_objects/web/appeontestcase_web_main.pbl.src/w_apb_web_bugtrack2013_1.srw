$PBExportHeader$w_apb_web_bugtrack2013_1.srw
forward
global type w_apb_web_bugtrack2013_1 from w_base_case
end type
type mc_1 from monthcalendar within w_apb_web_bugtrack2013_1
end type
type dw_2 from datawindow within w_apb_web_bugtrack2013_1
end type
type mle_1 from multilineedit within w_apb_web_bugtrack2013_1
end type
type dw_1 from datawindow within w_apb_web_bugtrack2013_1
end type
end forward

global type w_apb_web_bugtrack2013_1 from w_base_case
mc_1 mc_1
dw_2 dw_2
mle_1 mle_1
dw_1 dw_1
end type
global w_apb_web_bugtrack2013_1 w_apb_web_bugtrack2013_1

type variables
Boolean ib_dwGROUPBY = True
Boolean ib_dwXMLexport = True
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public function string of_concat (string as_value[])
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

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null,ls_rtn,ls_modify
long			ll_bound, i , ll_tmp, ll_null, ll_position,ll_rtn
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
BLOB			lblob_target,lblob_1

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "bugid32494"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "bugid32168"		
ls_array[Upperbound(ls_array) + 1 ] = "bugid32023"
//ls_array[Upperbound(ls_array) + 1 ] = "bugid31878"    // Default is Text!, Appeon Help says importtype is not supported
ls_array[Upperbound(ls_array) + 1 ] = "bugid31747"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31584"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31491"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31429"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31405"
ls_array[Upperbound(ls_array) + 1 ] = "bugid31033"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30988"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30581"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30435"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33478"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33475"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33076"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33010"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33274"

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
		case lower("bugid32494")	
			//null! value of checkbox should be recognized as null value in DW
			dw_1.dataobject = 'd_tset32494'
			dw_1.setitem(1,'aaa','N')
			dw_1.setitem(1,'aaa','null!')
			ls_temp = dw_1.getitemstring( 1,1)
			ls_result += wf_result_add(ls_item, " ", isnull(ls_temp) )
			
		case lower("bugid32168")		
			//integer function always return -1 if the real value less than 0 on android
			li_rtn = integer('-12')
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = -12)
			
		case lower("bugid32023")	
			//saveas function of datastore object generate error file
			datastore lds
			lds = create datastore
			lds.dataobject = 'd_employee34557'
			lds.settransobject(sqlca)
			ll_tmp = lds.retrieve()
			if ll_tmp > 0 then
				ll_rtn = lds.saveas("pruebas.pdf", PDF!, false)
			end if
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_rtn) and ll_rtn = 1)
			
		case lower("bugid31878")	
			//datawindow.data.XML issue with group
			dw_1.Reset()
			dw_1.dataobject = 'd_managementoverzicht31878'
			dw_1.InsertRow(0)
			mle_1.Text = dw_1.Describe("datawindow.data.XML")
			string		ls_err, ls_dwsyntax, ls_dwdata
			ls_dwsyntax = dw_1.Describe("datawindow.syntax")
			ls_dwdata = mle_1.Text
			lds = CREATE Datastore
			ll_tmp = lds.CREATE(ls_dwsyntax, ls_err)
			If ib_dwXMLexport Then
				ll_tmp = lds.ImportString(XML!, ls_dwdata)
			Else
				ll_tmp = lds.ImportString(ls_dwdata)	
			End If
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_tmp) and ll_tmp > 0)
			
		case lower("bugid31747")	
			//create transaction object with create using cause error on mobile
			transaction 	tran_SQLCA
			tran_SQLCA = Create transaction	
			ls_fullname = "SNC"
			f_db_connect (tran_SQLCA, ls_fullname, '')	
			connect using tran_SQLCA;
			//if tran_SQLCA.sqlcode<>0 then
				
			select count(1) into :ll_tmp from test31747 using tran_SQLCA;		
			disconnect using tran_SQLCA;
			destroy tran_SQLCA;
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_tmp) and ll_tmp = 0)
			
		case lower("bugid31584")	
			//datawidnow crashes 64-bit IE
			dw_2.dataobject = 'd_time34675'
			dw_2.settransobject(sqlca)
			ll_rtn = dw_2.retrieve()
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_rtn) and ll_rtn > 0)
			
		case lower("bugid31491")		
		case lower("bugid31429")
			//getselecteddate function of month calendar always return -1 on web
			ll_rtn = mc_1.GetSelectedDate(ld_date)
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_rtn) and ll_rtn = 0)
		
		case lower("bugid31405")	
			//set column value with dot operateion when original value is null
			dw_1.dataobject = 'd_test31405'
			update test_31405 set testnumber = null;
			commit;
			dw_1.settransobject(sqlca)
			dw_1.retrieve()
			dw_1.object.testnumber[1]=100  
			dw_1.object.testnumber[1]=200
			dw_1.update()
			li_rtn = dw_1.getitemnumber(1, "testnumber", primary!, true)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 200)
		
		case lower("bugid31033")	
			//SetFullState error with muti-space column
			dw_1.dataobject ='d_t31033'
			dw_1.SetTransObject(sqlca)
			dw_1.Retrieve(25582)	
			ll_rtn = dw_1.SetItemStatus( 2, 0,Primary!, NotModified!)	
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_rtn) and ll_rtn = 1)
			
		case lower("bugid30988")	
			//Enabled property of button caontrol in datawindow cannot be set by using expression
			dw_1.dataobject ='d_test30988'	
			ls_temp = dw_1.modify('b_test.enabled = yes')	
			ls_result += wf_result_add(ls_item, " ",  ls_temp = '')
			
		case lower("bugid30581")	
			//saveasascii issue with large amount of data
			dw_1.dataobject ='d_test30581'
			ll_rtn = dw_1.saveasascii('\test.txt')
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_rtn) and ll_rtn = 1)
			
		case lower("bugid30435")	
			//The concatenation of String array tokens inside a function does not work if the function has a return code
			ls_temp = of_concat({"abc", "def", "ghi"})
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp) and ls_temp = 'abcdefghi')
			
		case lower("bugid33478")
			//assetpoint_function:Date to string is error
			ld_date = date(2017,11,3)
			ls_temp = string(date(ld_date),'yyyy-mm-dd')
			ls_result += wf_result_add(ls_item, " +"+ls_temp, not isnull(ls_temp) and ls_temp = '2017-11-03')
			
		case lower("bugid33475")
			//The Isdate function is error
			ld_date = date(today())
			if  isdate(string(ld_date)) = true then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, "", lbn_flag)
			
		case lower("bugid33076")
			dw_1.dataobject ='d_t33076'
			dec{2} ldc_value =0
			li_col = dw_1.insertrow(0)
			ll_tmp = Round(ldc_value, 0)
			li_rtn = dw_1.setitem(li_col, 'a', ll_tmp)
			ls_result += wf_result_add(ls_item, " +"+ls_temp, not isnull(li_rtn) and li_rtn = 1)
			
		case lower("bugid33010")
			dw_1.dataobject ='d_t33010'
			li_rtn = GetNextModified(dw_1, dw_1.rowcount() + 1 , primary!) 
			ls_result += wf_result_add(ls_item, " +"+ls_temp, not isnull(li_rtn) and li_rtn = 0)
			
	    case lower("bugid33274")
			datastore lds_test
			lds_test = create datastore
			lds_test.dataobject = 'd_t33274'
			lds_test.settransobject(sqlca)
			ls_modify = "destroy t_1 destroy t_2"
			ls_rtn = lds_test.modify( ls_modify)
			Destroy lds_test
			ls_result += wf_result_add(ls_item, " +"+ls_temp,  ls_rtn = '')

	//		Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public function string of_concat (string as_value[]);long	ll_index, ll_upper
string	ls_result

ls_result = ""

ll_upper = upperbound(as_value[])

for ll_index = 1 to ll_upper
	ls_result += as_value[ll_index]
next

return ls_result
end function

on w_apb_web_bugtrack2013_1.create
int iCurrent
call super::create
this.mc_1=create mc_1
this.dw_2=create dw_2
this.mle_1=create mle_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mc_1
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.mle_1
this.Control[iCurrent+4]=this.dw_1
end on

on w_apb_web_bugtrack2013_1.destroy
call super::destroy
destroy(this.mc_1)
destroy(this.dw_2)
destroy(this.mle_1)
destroy(this.dw_1)
end on

type mc_1 from monthcalendar within w_apb_web_bugtrack2013_1
integer x = 567
integer y = 720
integer width = 562
integer height = 552
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean todaysection = true
boolean todaycircle = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_apb_web_bugtrack2013_1
integer x = 407
integer y = 108
integer width = 709
integer height = 472
integer taborder = 20
string title = "none"
string dataobject = "d_test34592"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within w_apb_web_bugtrack2013_1
integer x = 1303
integer y = 640
integer width = 549
integer height = 476
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
end type

type dw_1 from datawindow within w_apb_web_bugtrack2013_1
integer x = 1527
integer y = 116
integer width = 686
integer height = 400
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

