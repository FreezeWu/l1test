$PBExportHeader$w_xml.srw
forward
global type w_xml from w_base_case
end type
type cb_3 from commandbutton within w_xml
end type
type mle_1 from multilineedit within w_xml
end type
type dw_3 from datawindow within w_xml
end type
type tv_1 from treeview within w_xml
end type
type cb_2 from commandbutton within w_xml
end type
type dw_1 from datawindow within w_xml
end type
type cb_1 from commandbutton within w_xml
end type
type st_1 from statictext within w_xml
end type
end forward

global type w_xml from w_base_case
integer width = 3177
integer height = 2120
string title = "XML Test"
cb_3 cb_3
mle_1 mle_1
dw_3 dw_3
tv_1 tv_1
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
st_1 st_1
end type
global w_xml w_xml

type variables
//string is_result
//Boolean 		ib_Retrieve, ib_Other, ib_Printpage
end variables

forward prototypes
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
end prototypes

public subroutine of_testcase_point_module2 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname,ls_syntax
integer 		li_rtn, li_col,li_result
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
datastore 	ids_test


is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "GetXML"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = ""

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
	choose case lower(ls_item)
		case lower("GetXML")	
			//			... your test case code...			
			

			if not isvalid(ids_test) then
				ids_test = create datastore
			end if
				
			ls_syntax =  dw_3.describe("datawindow.syntax")			
			ids_test.dataobject = 'd1_dyn_ada_finished_primcare_list'			
			li_result = ids_test.create(ls_syntax)			
			
			ids_test.insertrow(0)
			ls_temp = ids_test.describe("datawindow.data.xml")
			ls_temp2 =	'<?xml version="1.0" encoding="UTF-16LE" standalone="no"?>~n~n'+&
							'<ROWSET><ROW rownum="1"><primary_care_ada_id></primary_care_ada_id><facility_id></facility_id><completed_ind></completed_ind><completed_date></completed_date><started_date></started_date><entered_by_fac></entered_by_fac></ROW></ROWSET>~n'
			ls_result += wf_result_add(ls_item, " SyntaxFromDW Insert ", not isnull(ls_temp) and ls_temp = ls_temp2 )			
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

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

ls_array[Upperbound(ls_array) + 1 ] = "XMLParseFile"			//edit you test case point name
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
		case lower("XMLParseFile")	
			ls_file =   "testxml.xml"		 	
			ls_fullname = gs_cachedir+ gs_dirseparator + ls_file
			
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" downfile "+ " testxml.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" downfile "+ " testxml. FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			ll_tmp = XMLParseFile(ls_fullname)
			If ll_tmp = 0 Then
				ls_result += wf_result_add(ls_item, "1. Parse File:testxml.xml ", true)
				
				dw_1.ImportFile(ls_fullname)
				If dw_1.RowCount () > 0 Then
					ls_result += wf_result_add(ls_item, "2. RowCount ", dw_1.RowCount () > 0 and dw_1.RowCount () = 73)
					
					ls_temp  = String ( dw_1.GetItemString (1,'department_dept_name' ) )
					ls_result += wf_result_add(ls_item, "3. DW First Row DepartMent Name ", not isnull(ls_temp) and ls_temp = "Finance11")
					
					ls_temp = ""
					ls_temp = String ( dw_1.GetItemString (2,'employee_emp_fname' ) )
					ls_result += wf_result_add(ls_item, "4. DW Secend Row First Name ", not isnull(ls_temp) and ls_temp = "Jo Ann              ")
					
					ls_temp = ""
					ls_temp = String ( dw_1.GetItemNumber (dw_1.RowCount(),'employee_emp_id' ) )
					ls_result += wf_result_add(ls_item, "5. DW Last Row ID ", not isnull(ls_temp) and ls_temp = "1658")
													
				else
					ls_result += wf_result_add(ls_item, "2. RowCount <= 0 ", false )
				end if 
			else
				ls_result += wf_result_add(ls_item, "1. Parse File:testxml.xml ", false)
			end if 
			 
			//	ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position, ll_item
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data

LongLong 	ll_item_count
PBDOM_Builder pbdom_bldr
pbdom_document pbdom_doc
PBDOM_OBJECT pbdom_obj_array[]
treeviewitem 	ltree_1

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "PBDOM"			//edit you test case point name
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
		case lower("PBDOM")	
			ls_file =   "testxml.xml"		 	
			ls_fullname = gs_cachedir+ gs_dirseparator + ls_file
			
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" downfile "+ " testxml.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" downfile "+ " testxml. FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			ll_tmp = XMLParseFile(ls_fullname)
			if ll_tmp = 0 then 
				// Delete all items in tree
				ll_item = tv_1.finditem(RootTreeItem!, 0)
				do while ll_item <> -1
					tv_1.deleteitem(ll_item)
					ll_item = tv_1.finditem(RootTreeItem!, 0)
				loop
				//PBDOM parse
				pbdom_bldr = Create PBDOM_Builder
				pbdom_doc = pbdom_bldr.BuildFromFile(ls_fullname)
				pbdom_doc.GetContent(ref pbdom_obj_array)
				//parent.title = pbdom_doc.GetRootElement().getname()
				//put in tree
				f_put_xml_into_tree(pbdom_doc.GetRootElement(), 0, tv_1,ll_item_count) //use recursion to put in tree
								
				ls_result += wf_result_add(ls_item, "1. Item Count ", not isnull(ll_item_count) and ll_item_count = 511)
								
				//Item: 4
				ll_tmp = tv_1.GetItem ( 4, ltree_1 )
				ls_temp = String ( ltree_1.Label )
				ls_result += wf_result_add(ls_item, "2. Item 4 ", not isnull(ll_tmp) and ll_tmp = 1 and not isnull(ls_temp) and  (ls_temp = "employee_emp_lname: Jordan              " ) )
				
				//Item: 18
				ll_tmp = tv_1.GetItem ( 18, ltree_1 )
				ls_temp = ""
				ls_temp = String ( ltree_1.Label )
				ls_result += wf_result_add(ls_item, "3. Item 18 ", not isnull(ll_tmp) and ll_tmp = 1 and not isnull(ls_temp) and  (ls_temp = "employee_emp_lname: Coleman             " ) )
				
				//Item: 33
				ll_tmp = tv_1.GetItem ( 33, ltree_1 )
				ls_temp = ""
				ls_temp = String ( ltree_1.Label )
				ls_result += wf_result_add(ls_item, "4. Item 33 ", not isnull(ll_tmp) and ll_tmp = 1 and not isnull(ls_temp) and  (ls_temp = "employee_emp_fname: Kristen             " ) )
				
				//Item: 38
				ll_tmp = tv_1.GetItem ( 38, ltree_1 )
				ls_temp = ""
				ls_temp = String ( ltree_1.Label )
				ls_result += wf_result_add(ls_item, "5. Item 38 ", not isnull(ll_tmp) and ll_tmp = 1 and not isnull(ls_temp) and  (ls_temp = "employee_emp_id: 1293" ) )
				
			end if 

		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_xml.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.mle_1=create mle_1
this.dw_3=create dw_3
this.tv_1=create tv_1
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.mle_1
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.tv_1
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.dw_1
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.st_1
end on

on w_xml.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.mle_1)
destroy(this.dw_3)
destroy(this.tv_1)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.st_1)
end on

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"testxml.xml") then
	FileDelete(ls_filepath+"testxml.xml")
end if
end event

type cb_3 from commandbutton within w_xml
integer x = 96
integer y = 560
integer width = 965
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "XML_GetXML_SyntaxFromDW_Insert"
end type

event clicked;of_testcase_point_module2()

end event

type mle_1 from multilineedit within w_xml
integer x = 1915
integer y = 1360
integer width = 992
integer height = 384
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_3 from datawindow within w_xml
integer x = 1307
integer y = 1352
integer width = 512
integer height = 364
integer taborder = 30
string title = "none"
string dataobject = "d1_dyn_ada_finished_primcare_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tv_1 from treeview within w_xml
integer x = 1303
integer y = 636
integer width = 1504
integer height = 688
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

type cb_2 from commandbutton within w_xml
integer x = 96
integer y = 420
integer width = 635
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "XML_PBDOM_TreeView"
end type

event clicked;of_testcase_point_module1()
end event

type dw_1 from datawindow within w_xml
integer x = 1321
integer y = 96
integer width = 1422
integer height = 496
integer taborder = 20
string title = "none"
string dataobject = "d_dwstyle_grid1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_xml
integer x = 96
integer y = 272
integer width = 585
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "XML_DW_ImportFile"
end type

event clicked;of_testcase_point_module()
end event

type st_1 from statictext within w_xml
integer x = 361
integer y = 108
integer width = 910
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "XML Test"
boolean focusrectangle = false
end type

