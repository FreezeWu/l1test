$PBExportHeader$w_apb_bugtrack2017_1.srw
forward
global type w_apb_bugtrack2017_1 from w_base_case
end type
type em_3 from editmask within w_apb_bugtrack2017_1
end type
type em_2 from editmask within w_apb_bugtrack2017_1
end type
type em_1 from editmask within w_apb_bugtrack2017_1
end type
type sle_1 from singlelineedit within w_apb_bugtrack2017_1
end type
type dw_1 from datawindow within w_apb_bugtrack2017_1
end type
type tab_1 from tab within w_apb_bugtrack2017_1
end type
type tabpage_1 from userobject within tab_1
end type
type tabpage_1 from userobject within tab_1
end type
type tab_1 from tab within w_apb_bugtrack2017_1
tabpage_1 tabpage_1
end type
type cb_1 from commandbutton within w_apb_bugtrack2017_1
end type
end forward

global type w_apb_bugtrack2017_1 from w_base_case
em_3 em_3
em_2 em_2
em_1 em_1
sle_1 sle_1
dw_1 dw_1
tab_1 tab_1
cb_1 cb_1
end type
global w_apb_bugtrack2017_1 w_apb_bugtrack2017_1

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
ls_array[Upperbound(ls_array) + 1 ] = "bugid92625"
ls_array[Upperbound(ls_array) + 1 ] = "bugid40431"
ls_array[Upperbound(ls_array) + 1 ] = "bugid37598"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34601"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34600"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34599"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34597"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34596"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34595"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34594"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34592"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34589"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34585"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34584"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34580"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34579"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34578"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34577"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34575"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34574"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34573"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34571"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34568"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34567"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34564"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34562"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34557"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34556"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34555"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34554"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34542"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34468"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34441"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34339"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34273"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34249"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33998"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33996"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33356"

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
		case lower("bugid92625")
				ls_temp =  'mytest'
				this.title = ls_temp
				
				boolean lb_test
				
				if this.title = ls_temp then
					lb_test = true
				else
					lb_test = false
				end if
	
			ls_result += wf_result_add(ls_item, " this.title ", lb_test)
			
		case lower("bugid40431")
			
		case lower("bugid37598")
		case lower("bugid34601")
		case lower("bugid34600")
		case lower("bugid34599")
		case lower("bugid34597")
		case lower("bugid34596")
		case lower("bugid34595")
		case lower("bugid34594")
		case lower("bugid34592")
		case lower("bugid34589")
		case lower("bugid34585")
		case lower("bugid34584")
			//with the focus changing between SLE and datawindow row, data disappears in datawindow.
			dw_1.dataobject = 'd_test34584'
			dw_1.settransobject(SQLCA)
			dw_1.retrieve()
			dw_1.setitem(1,"Text", "First")
			sle_1.text = "Third"
			dw_1.setrow(2)
			dw_1.setitem(2,"Text", "Second")
			ls_temp = dw_1.getitemstring(1,"Text")
			if ls_temp = "First" then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, " Data disappears after focus changing ", lbn_flag)
			
			
		case lower("bugid34580")
		case lower("bugid34579")
		case lower("bugid34578")
		case lower("bugid34577")
		case lower("bugid34575")
		case lower("bugid34574")
		case lower("bugid34573")
		case lower("bugid34571")
		case lower("bugid34568")
		case lower("bugid34567")
		case lower("bugid34564")
		case lower("bugid34562")
		case lower("bugid34557")
		case lower("bugid34556")
		case lower("bugid34555")
		case lower("bugid34554")	
		case lower("bugid34542")
			//The resize function does not work
			this.resize(3333,2222)
			if this.width = 3333 and this.height = 2222 then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, " Resize function ", lbn_flag)
			
		case lower("bugid34468")
			
			//If the divisor is too big in Mod(Divisor, dividend) function, the return remainder is a wrong value. 
			ldc_data = Mod(310306922005, 97)
			if  ldc_data = 4 then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, " Mod function ", lbn_flag)
			
			case lower("bugid34441")
			
			//The button on the header of datawindow can move along with column. 
			dw_1.dataobject = 'd_null34441'
			ls_temp = dw_1.describe('b_1.x')
			dw_1.modify('catid.x=9')
			dw_1.modify('dmy_dept_name.x=814')
			dw_1.modify('dmy_script_name.x=320')
			ls_temp2 = dw_1.describe('b_1.x')
			
			if ls_temp <> ls_temp2  then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, " Button on the header of datawindow can move along with column ", lbn_flag)
			
			case lower("bugid34339")
			//The return value is larger than the original rowheight when the zoom is set lower then 100. 
				dw_1.dataobject = 'd_external_fieldheight'
				dw_1.settransobject(SQLCA)
				dw_1.retrieve()
				ls_temp = string( dw_1.describe ("evaluate('rowHeight()', 1)"))
				dw_1.object.datawindow.zoom = 10
				ls_temp2 = string( dw_1.describe ("evaluate('rowHeight()', 1)"))
				
				if ls_temp2 <= ls_temp then
					lbn_flag = true
				else
					lbn_flag = false
				end if
			ls_result += wf_result_add(ls_item, " Datawindow Zoom ", lbn_flag)
			
			case lower("bugid34273")
				//Getitemdatetime should receive correct date and time 
						
				dw_1.dataobject = 'd_dummy34273'
				dw_1.insertrow(1)
				dw_1.setItem ( 1, 'sf_datetime', datetime(today(), time("11:19")) )	
				ldt_datatime =  dw_1.getitemdatetime(1, 'sf_datetime')
				ls_temp = trim(string(ldt_datatime,'yyyy/mm/dd hh:mm:ss'))
				ls_temp2 = trim(string(today(),'yyyy/mm/dd')) + ' 11:19:00'
				
				if ls_temp = ls_temp2  then
					lbn_flag = true
				else
					lbn_flag = false
				end if
				ls_result += wf_result_add(ls_item, " Getitemdatetime receive correct date and time", lbn_flag)
			
			
		     case lower("bugid34249")
				//To check if setmask function really works 
						
				ld_date = date('2017 March 9')
					
				em_1.SetMask(DateMask!, 'dd/mm/yyyy')
				em_1.text =string( ld_date ,'dd/mm/yyyy')
				
				em_2.SetMask(DateMask!, 'mm/dd/yyyy')
				em_2.text =string( ld_date ,'mm/dd/yyyy')
				
				em_3.text =string( ld_date ,'mm/dd/yyyy')

				if em_1.text = "09/03/2017" and em_2.text = "03/09/2017" and  em_3.text = "03/09/2017"  then
					lbn_flag = true
				else
					lbn_flag = false
				end if
				ls_result += wf_result_add(ls_item, " Setmask function", lbn_flag)
				
			case lower("bugid33998")
				// The tricky editmask function in datawindow
				dw_1.dataobject = 'd_test33998'
				dw_1.settransobject(SQLCA)
				dw_1.retrieve()
				dw_1.setitem(1, "dd", 999999999999999.15)
				dw_1.setcolumn("name_1")
				ldc_data = dw_1.getitemdecimal(1,"dd")
				if ldc_data =  999999999999999.15  then
					lbn_flag = true
				else
					lbn_flag = false
				end if
				ls_result += wf_result_add(ls_item, " Editmask function in datawindow", lbn_flag)
								
			case lower("bugid33996")
				//The tab width cannot be adjusted properly according to the setting. 
				tab_1.width = 1000
				ll_tmp = tab_1.width
				
				if ll_tmp = 1000 then
					lbn_flag = true
				else
					lbn_flag = false
				end if
			ls_result += wf_result_add(ls_item, " Tab width adjustment ", lbn_flag)
			
			case lower("bugid33356")
				//Retrieve dropdowndatawindow when the querymode equals yes. 
				Datawindowchild l_state_child
				dw_1.dataobject = 'd_dept33356'
				dw_1.settransobject(SQLCA)
				dw_1.Modify("DataWindow.QueryMode=yes")
				li_rtn = dw_1.getchild("name", l_state_child)
				
				if li_rtn = 1 then
					lbn_flag = true
				else
					lbn_flag = false
				end if
			ls_result += wf_result_add(ls_item, " Retrieve dddatawindow when querymode= yes ", lbn_flag)
			
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
			//ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_bugtrack2017_1.create
int iCurrent
call super::create
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.sle_1=create sle_1
this.dw_1=create dw_1
this.tab_1=create tab_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_3
this.Control[iCurrent+2]=this.em_2
this.Control[iCurrent+3]=this.em_1
this.Control[iCurrent+4]=this.sle_1
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.tab_1
this.Control[iCurrent+7]=this.cb_1
end on

on w_apb_bugtrack2017_1.destroy
call super::destroy
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.sle_1)
destroy(this.dw_1)
destroy(this.tab_1)
destroy(this.cb_1)
end on

type em_3 from editmask within w_apb_bugtrack2017_1
integer x = 2075
integer y = 428
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = " "
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type em_2 from editmask within w_apb_bugtrack2017_1
integer x = 2075
integer y = 264
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type em_1 from editmask within w_apb_bugtrack2017_1
integer x = 2075
integer y = 84
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type sle_1 from singlelineedit within w_apb_bugtrack2017_1
integer x = 626
integer y = 220
integer width = 1102
integer height = 132
integer taborder = 20
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

type dw_1 from datawindow within w_apb_bugtrack2017_1
integer x = 617
integer y = 396
integer width = 1111
integer height = 976
integer taborder = 20
string title = "none"
string dataobject = "d_external_fieldheight"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within w_apb_bugtrack2017_1
integer x = 87
integer y = 404
integer width = 457
integer height = 988
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 124
integer width = 421
integer height = 848
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type cb_1 from commandbutton within w_apb_bugtrack2017_1
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

