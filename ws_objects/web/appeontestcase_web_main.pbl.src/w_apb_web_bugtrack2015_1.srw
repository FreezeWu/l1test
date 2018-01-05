$PBExportHeader$w_apb_web_bugtrack2015_1.srw
forward
global type w_apb_web_bugtrack2015_1 from w_base_case
end type
type sle_1 from singlelineedit within w_apb_web_bugtrack2015_1
end type
type ddlb_1 from n_ddlb within w_apb_web_bugtrack2015_1
end type
type dw_1 from datawindow within w_apb_web_bugtrack2015_1
end type
end forward

global type w_apb_web_bugtrack2015_1 from w_base_case
sle_1 sle_1
ddlb_1 ddlb_1
dw_1 dw_1
end type
global w_apb_web_bugtrack2015_1 w_apb_web_bugtrack2015_1

forward prototypes
public subroutine of_testcase_point_module ()
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
ls_array[Upperbound(ls_array) + 1 ] = "bugid34223"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34170"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34161"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34126"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34105"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34070"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33942"

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
			
			
		case lower("bugid34234")
			//geturl not work when URL contain charactor '@'
			n_ir_geturldata my_ir_geturldata
			inet iinet_base
			string ls_url
			my_ir_geturldata = create n_ir_geturldata
			iinet_base = create inet
			ls_url = 'http://192.0.1.74/aem?to=test.test@test.fr'
			li_rtn = iinet_base.geturl(ls_url,my_ir_geturldata)
			if li_rtn = 1  then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			destroy my_ir_geturldata
			destroy iinet_base
			ls_result += wf_result_add(ls_item, "geturl not work when URL contain charactor '@' ", lbn_flag)
			
		case lower("bugid34232")
			//autoinstance object in structure array is not work
			nvo_indextest nvo_test
			nvo_test = create nvo_indextest
			nvo_test.create_autoinstance( )
			if gs_output = 'valid'  then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			destroy nvo_test
			ls_result += wf_result_add(ls_item, "autoinstance object in structure array is not work ", lbn_flag)
			
		case lower("bugid34223")
			//datawidnow: expression 'string(1234.2, '')' of computed field cause IE crash
			dw_1.dataobject = 'd_test34223'
			li_rtn = 0
			li_rtn = dw_1.retrieve()
			if li_rtn = -1  then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, "datawidnow: expression 'string(1234.2, '')' of computed field cause IE crash", lbn_flag)
		
		case lower("bugid34170")
			//Slash symbol('\') is deleted when is getting selected data of single column
			string ls_warecodeArr[],ls_res
			long ll_count,ll_ele
			dw_1.dataobject = 'd_test34170'
			dw_1.insertRow( 0 )
			dw_1.setitem(1,1,'0\k\\k\\\k')
			dw_1.insertRow( 0 )
			dw_1.setitem(2,1,'0\k\\k\\\k')
			dw_1.selectRow( 0, True )
			ls_warecodeArr[] = dw_1.Object.ware_code.Primary.Current.Selected
			ll_count = upperBound( ls_wareCodeArr[] )
			IF isNull( ll_count ) THEN ll_count = 0
			FOR ll_ele = 1 TO ll_count
				IF Len(  ls_wareCodeArr[ ll_ele ] ) > 0 THEN 
					IF Len( ls_res ) > 0 THEN ls_res += "~r~n"
					ls_res += ls_wareCodeArr[ ll_ele ]
				END IF 
			NEXT
						
			if ls_res = '0\k\\k\\\k~r~n0\k\\k\\\k'  then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, "Slash symbol('\') is deleted when is getting selected data of single column", lbn_flag)
			
		case lower("bugid34161")
			//column header of grid DW redraw error when zoom out(factor 1) and then zoom in(factor 99)
			string ls_columnname
			dw_1.dataobject = 'd_test34161'
			dw_1.insertRow( 0 )
			dw_1.setcolumn('id')
			dw_1.Object.DataWindow.Zoom = 1
			dw_1.Object.DataWindow.Zoom = 99
			ls_columnname = dw_1.getcolumnname()
			if ls_columnname = 'id' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, "column header of grid DW redraw error when zoom out(factor 1) and then zoom in(factor 99)", lbn_flag)
		
		case lower("bugid34126")
			//modify ddlb preporty caused datastore object been destoryed
			n_ddlb my_ddlb
			my_ddlb = create n_ddlb
			if gs_output = 'valid' then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			destroy n_ddlb
			ls_result += wf_result_add(ls_item, "modify ddlb preporty caused datastore object been destoryed", lbn_flag)
			
		case lower("bugid34105")
			//setfiter datetime column cause browser crash when length of expression over 32768
			integer li_temp
			string ls_filter
			datetime ldt_filter
			dw_1.dataobject = 'd_test34105'
			FOR li_temp = 1 TO 1560
				IF Len( ls_filter ) > 0 THEN ls_filter = ls_filter + ", "
				ldt_filter = dateTime( Today(), Now() )
				ls_filter = ls_filter +  String( ldt_filter, "YYYY-MM-DD HH:MM:SS" )
			NEXT
			ls_filter = "column_01 in (" + ls_filter + ")"
			li_rtn = dw_1.setFilter( ls_filter )
			if li_rtn = 1  then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, "setfiter datetime column cause browser crash when length of expression over 32768", lbn_flag)
			
		case lower("bugid34070")
			//Clipboard: paste error text when current input language of keyboard is not same as Clipboard text
			Clipboard( "Привет" )
			sle_1.paste()
			Clipboard( "落地成盒" )
			sle_1.paste()
			if sle_1.text = 'Привет落地成盒'  then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, "Clipboard: paste error text when current input language of keyboard is not same as Clipboard text", lbn_flag)
		
		case lower("bugid33942")
			//saveas htmltable with crosstab datawindow which over three header cause IE crash
			dw_1.dataobject = 'd_test33942'
			ls_file = gs_cachedir+ gs_dirseparator + "33942.htm"
			li_rtn = dw_1.saveas( '33942.htm',HTMLTABLE!,false, EncodingANSI!)
			if li_rtn = 1  then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, "saveas htmltable with crosstab datawindow which over three header cause IE crash", lbn_flag)
			
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_web_bugtrack2015_1.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.ddlb_1=create ddlb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.ddlb_1
this.Control[iCurrent+3]=this.dw_1
end on

on w_apb_web_bugtrack2015_1.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.ddlb_1)
destroy(this.dw_1)
end on

type sle_1 from singlelineedit within w_apb_web_bugtrack2015_1
integer x = 1522
integer y = 128
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type ddlb_1 from n_ddlb within w_apb_web_bugtrack2015_1
integer x = 896
integer y = 76
integer taborder = 20
end type

type dw_1 from datawindow within w_apb_web_bugtrack2015_1
integer x = 96
integer y = 48
integer width = 558
integer height = 492
integer taborder = 10
string title = "none"
string dataobject = "d_test34170"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

