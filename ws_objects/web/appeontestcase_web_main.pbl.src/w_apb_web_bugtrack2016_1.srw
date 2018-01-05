$PBExportHeader$w_apb_web_bugtrack2016_1.srw
forward
global type w_apb_web_bugtrack2016_1 from w_base_case
end type
type tab_1 from tab within w_apb_web_bugtrack2016_1
end type
type tabpage_1 from userobject within tab_1
end type
type tabpage_1 from userobject within tab_1
end type
type tab_1 from tab within w_apb_web_bugtrack2016_1
tabpage_1 tabpage_1
end type
type em_3 from editmask within w_apb_web_bugtrack2016_1
end type
type em_2 from editmask within w_apb_web_bugtrack2016_1
end type
type em_1 from editmask within w_apb_web_bugtrack2016_1
end type
type dw_1 from datawindow within w_apb_web_bugtrack2016_1
end type
end forward

global type w_apb_web_bugtrack2016_1 from w_base_case
integer width = 3013
integer height = 1904
tab_1 tab_1
em_3 em_3
em_2 em_2
em_1 em_1
dw_1 dw_1
end type
global w_apb_web_bugtrack2016_1 w_apb_web_bugtrack2016_1

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
		//case lower("")			
			//Maximum script size exceeded. 		//2100			
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
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname,ls_retrun,ls_rtn1,ls_rtn2,ls_rtn3
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

ls_array[Upperbound(ls_array) + 1 ] =  "bugid34542"         //edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] =  "bugid34513"
ls_array[Upperbound(ls_array) + 1 ] =  "bugid34466"			
ls_array[Upperbound(ls_array) + 1 ] =  "bugid34465"
ls_array[Upperbound(ls_array) + 1 ] =  "bugid34468"
ls_array[Upperbound(ls_array) + 1 ] =  "bugid34375"
ls_array[Upperbound(ls_array) + 1 ] =  "bugid34347"
ls_array[Upperbound(ls_array) + 1 ] =  "bugid34309"
ls_array[Upperbound(ls_array) + 1 ] =  "bugid34263"

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
		case lower("bugid34542")
			//The resize function does not work
			this.resize(3333,2222)
			if this.width = 3333 and this.height = 2222 then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, " ", lbn_flag)
//		case lower("bugid34513")	
////			querymode handle date type as datetime type
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

		case lower("bugid34466")
			// datetime type not work well in ESQL when value is null on web
			setnull(ldt_datatime)
			select	c_id,c_time into :li_col,:ldt_datatime	from 	t_time where c_id= '100' ;
			if isnull(ldt_datatime) then
					lbn_flag = true
				else
					lbn_flag = false
				end if
			ls_result += wf_result_add(ls_item, " ",  lbn_flag )
			
		case lower("bugid34465")
			//FileReadEx: the third argument 'length' is not take effect on mobile device
			ls_file = "test.bmp"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += wf_result_add(ls_item, "create temp file", false)
					end if 
				else
					ls_result += wf_result_add(ls_item, "create temp file", false)
				end if 
			end if
			li_retrun = FileOpen(ls_fullname,         StreamMode!)
			ll_tmp = FileReadEx(li_retrun, Emp_Id_Pic, 500000)
			fileclose(ll_tmp)
			ls_result += wf_result_add(ls_item, " ", (not isnull(ll_tmp)) and ll_tmp = 500000)				

		case lower("bugid34468")	
			//Mod() for large numbers doesn't work
			ldc_data = Mod(310306922005, 97)
			ls_result += wf_result_add(ls_item, " ", (not isnull(ldc_data)) and ldc_data = 4)
			
		case lower("bugid34375")	
			
		case lower("bugid34347")
			//setdetailheight shuold affect one row in buffer, but not row display
			int li_rtn1,li_rtn2,li_rtn3,li_rtn4
			dw_1.dataobject = 'd_set34347'
			dw_1.setfilter("id='A'")
			dw_1.filter()
			li_rtn1 = dw_1.GetItemNumber ( 1, 'compute_1' )
			dw_1.setdetailheight(1, 1, 0)
			li_rtn2 = dw_1.GetItemNumber ( 1, 'compute_1' )
			dw_1.setfilter("id='B'")
			dw_1.filter()
			li_rtn3 = dw_1.GetItemNumber ( 1, 'compute_1' )
			dw_1.setdetailheight(1, 1, 0)
			li_rtn4 = dw_1.GetItemNumber ( 1, 'compute_1' )
			ls_result += wf_result_add(ls_item, " ", li_rtn1= 104 and li_rtn2 = 0 and li_rtn3 = 104 and li_rtn4 = 0)

		case lower("bugid34309")
			//setfilter does not recognize the escape keyword
			dw_1.dataobject = 'dw_filter34309'
			string ls_filter
			long li_rows,li_row
			ls_filter = 'sm*_'
			
			li_row = dw_1.insertRow( 0 )
			li_rows = dw_1.setItem( li_row, "column_01", "SM_" )
			
			li_row = dw_1.insertRow( 0 )
			li_rows = dw_1.setItem( li_row, "column_01", "WWW" )
			
			li_row = dw_1.insertRow( 0 )
			li_rows = dw_1.setItem( li_row, "column_01", "SM20" )
			
			li_row = dw_1.insertRow( 0 )
			li_rows = dw_1.setItem( li_row, "column_01", "SM_blah" )
			
			li_row = dw_1.insertRow( 0 )
			li_rows = dw_1.setItem( li_row, "column_01", "SM_13" )

			IF Len( ls_filter ) > 0 THEN
				ls_filter = "lower(column_01) like ~'%"+ ls_filter + "%~' escape ~'*~'"
			END IF // 1
			dw_1.setFilter( ls_filter )
			dw_1.Filter()
			ls_rtn1 = dw_1.GetItemString(1,'column_01')
			ls_rtn2 = dw_1.GetItemString(2,'column_01')	
			ls_rtn3 = dw_1.GetItemString(3,'column_01')
			ls_result += wf_result_add(ls_item, " ", (not isnull(ls_rtn2)) and ls_rtn1 = 'SM_' and ls_rtn2 = 'SM_blah' and ls_rtn3 = 'SM_13')

		case lower("bugid34263")	
			//set data with a structure array via dot notation not work
			dw_1.dataobject = 'd_main34263'
			LONG ll_idx, ll_max = 5, ll_row
			s_external_values lstra_values[]
			DataWindowChild ldwc_dddw
			dw_1.getChild ( "display", ldwc_dddw )
			
			FOR ll_idx = 1 TO ll_max
				ll_row = ldwc_dddw.insertRow ( 0 )
				lstra_values [ll_idx].value_1 = "Test " + string ( ll_idx )
			NEXT		
			dw_1.object.display.object.data = lstra_values
			ls_rtn1 = ldwc_dddw.GetItemString(1,'display')
			ls_rtn2 = ldwc_dddw.GetItemString(2,'display')
			ls_result += wf_result_add(ls_item, " ", (not isnull(ls_rtn1)) and ls_rtn1 = 'Test 1' and ls_rtn2 = 'Test 2')
			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_web_bugtrack2016_1.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.em_3
this.Control[iCurrent+3]=this.em_2
this.Control[iCurrent+4]=this.em_1
this.Control[iCurrent+5]=this.dw_1
end on

on w_apb_web_bugtrack2016_1.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_1)
end on

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator

if FileExists(ls_filepath+"test.bmp") then
	FileDelete(ls_filepath+"test.bmp")
end if

end event

type tab_1 from tab within w_apb_web_bugtrack2016_1
event create ( )
event destroy ( )
integer x = 87
integer y = 404
integer width = 457
integer height = 988
integer taborder = 30
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

type em_3 from editmask within w_apb_web_bugtrack2016_1
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

type em_2 from editmask within w_apb_web_bugtrack2016_1
integer x = 2075
integer y = 264
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

type em_1 from editmask within w_apb_web_bugtrack2016_1
integer x = 2075
integer y = 84
integer width = 402
integer height = 112
integer taborder = 10
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

type dw_1 from datawindow within w_apb_web_bugtrack2016_1
integer x = 919
integer y = 192
integer width = 686
integer height = 400
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

