$PBExportHeader$w_datawindow_import.srw
forward
global type w_datawindow_import from w_base_case
end type
type cb_3 from commandbutton within w_datawindow_import
end type
type cb_2 from commandbutton within w_datawindow_import
end type
type dw_1 from datawindow within w_datawindow_import
end type
type cb_1 from commandbutton within w_datawindow_import
end type
type st_1 from statictext within w_datawindow_import
end type
end forward

global type w_datawindow_import from w_base_case
integer width = 2843
integer height = 1688
string title = "DataWindow Import Test"
cb_3 cb_3
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
st_1 st_1
end type
global w_datawindow_import w_datawindow_import

type variables

string 	is_result
end variables

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

ls_array[Upperbound(ls_array) + 1 ] = "ImportFile"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "ImportString"
ls_array[Upperbound(ls_array) + 1 ] = "ImportClipboard"

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
		case lower("ImportFile")					
			ls_file = "ImportFile.txt"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += wf_result_add(ls_item, " ImportFile.FileExists ", false)
					end if 
				else
					ls_result += wf_result_add(ls_item, " ImportFile.FileExists ", false)
				end if 
			end if	
			
			ll_tmp = dw_1.ImportFile( ls_file)
			If ll_tmp > 0 Then
				ls_result += wf_result_add(ls_item, "1. Rows = 8  ", not isnull(ll_tmp) and ll_tmp = 8 )
				
				ls_temp = ""
				If dw_1.RowCount () >= 4 Then ls_temp = String ( dw_1.GetItemString( 4,'quarter') )
				ls_result += wf_result_add(ls_item, "2. row 4 quarter = Q2 ", not isnull(ls_temp) and ls_temp = "Q2" )

				ls_temp = ""
				If dw_1.RowCount () >= 5 Then	ls_temp =  String ( dw_1.GetItemString( 5,'product') ) 
				ls_result += wf_result_add(ls_item, "3. row 5 product = Galactic ", not isnull(ls_temp) and ls_temp = "Galactic" )

				ll_tmp = 0 
				If dw_1.RowCount () >= 6 Then	ll_tmp = dw_1.GetItemNumber( 6,'units') 
				ls_result += wf_result_add(ls_item, "4. row 6 units = 15 ", not isnull(ll_tmp) and ll_tmp = 15 )
			else
				ls_result += wf_result_add(ls_item, "1. Rows = 8  ", false )
			End If
	
		//-1   No rows or startrow value supplied is greater than the number of rows in the file
		//-2   Empty file
		//-3   Invalid argument
		//-4   Invalid input
		//-5   Could not open the file
		//-6   Could not close the file
		//-7   Error reading the text
		//-8   Unsupported file name suffix (must be *.txt, *.csv, *.dbf or *.xml)
		//-10   Unsupported dBase file format (not version 2 or 3)
		//
		//-11   XML Parsing Error; XML parser libraries not found or XML not well formed
		//-12   XML Template does not exist or does not match the DataWindow
		//-13    Unsupported DataWindow style for import
		//-14    Error resolving DataWindow nesting
		//-15    File size exceeds limit

		case lower("ImportString")		
			dw_1.ReSet()
			
			dw_1.ImportString('Jones~tQ1~tCosmic~t5')
			dw_1.ImportString('Simpson~tQ1~tGalactic~t6')
			dw_1.ImportString('Perez~tQ1~tCosmic~t26')
			dw_1.ImportString('Simpson~tQ4~tCosmic~t60')
			
			ll_tmp = dw_1.RowCount () 
			IF ll_tmp > 0 Then
				ls_result += wf_result_add(ls_item, "1. data( 'Jones~tQ1~tCosmic~t5...' ) row = 4 ", not isnull(ll_tmp) and ll_tmp = 4 )
				
				ls_temp = ""
				If dw_1.RowCount () >= 2 Then	ls_temp =  String ( dw_1.GetItemString( 2,'quarter') )
				ls_result += wf_result_add(ls_item, "2. row 2 quarter = Q1 ", not isnull(ls_temp) and ls_temp = "Q1" )
				
				ls_temp = ""
				If dw_1.RowCount () >= 3 Then	ls_temp = String ( dw_1.GetItemString( 3,'product') ) 
				ls_result += wf_result_add(ls_item, "3. row 3 product = Cosmic ", not isnull(ls_temp) and ls_temp = "Cosmic" )
				
				ll_tmp = 0 
				If dw_1.RowCount () >= 4 Then	ll_tmp =  dw_1.GetItemNumber( 4,'units')
				ls_result += wf_result_add(ls_item, "4. row 4 units = 60 ", not isnull(ll_tmp) and ll_tmp = 60 )
			Else
				ls_result += wf_result_add(ls_item, "1. data( 'Jones~tQ1~tCosmic~t5...' ) row = 4 ", false )
			End If
		case lower("ImportClipboard")	
			ls_temp2 = 'Jones~tQ1~tCosmic~t5~r~n'
			ls_temp2 += 'Simpson~tQ6~tGalactic~t6~r~n'
			ls_temp2 += 'Perez~tQ1~tCosmicA~t26~r~n'
			ls_temp2 += 'Simpson~tQ4~tCosmic~t80'
			
			Clipboard(ls_temp2)	
			dw_1.reset()
			ll_tmp = dw_1.ImportClipboard()
			
			If ll_tmp > 0 Then
				ls_result += wf_result_add(ls_item, "1. Clipboard data row = 4 ", not isnull(ll_tmp) and ll_tmp = 4 )
				
				ls_temp = ""
				If dw_1.RowCount () >= 2 Then ls_temp =  String ( dw_1.GetItemString( 2,'quarter') )
				ls_result += wf_result_add(ls_item, "2. row 2 quarter = Q6 ", not isnull(ls_temp) and ls_temp = "Q6" )
				
				ls_temp = ""
				If dw_1.RowCount () >= 3 Then	ls_temp = String ( dw_1.GetItemString( 3,'product') ) 
				ls_result += wf_result_add(ls_item, "3. row 3 product = CosmicA ", not isnull(ls_temp) and ls_temp = "CosmicA" )
				
				ll_tmp = 0 
				If dw_1.RowCount () >= 4 Then	ll_tmp =  dw_1.GetItemNumber( 4,'units')
				ls_result += wf_result_add(ls_item, "4. row 4 units = 80 ", not isnull(ll_tmp) and ll_tmp = 80 )
			 else
				ls_result += wf_result_add(ls_item, "1. Clipboard data row = 4 ", false )
			End If
			
			//-1   No rows or startrow value supplied is greater than the number of rows in the string
			//-3   Invalid argument
			//-4   Invalid input
			//-11   XML Parsing Error; XML parser libraries not found or XML not well formed
			//-12   XML Template does not exist or does not match the DataWindow
			//-13    Unsupported DataWindow style for import
			//-14    Error resolving DataWindow nesting
			
			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_datawindow_import.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.st_1
end on

on w_datawindow_import.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.st_1)
end on

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator

if FileExists(ls_filepath+"ImportFile.txt") then
	FileDelete(ls_filepath+"ImportFile.txt")
end if
end event

type cb_3 from commandbutton within w_datawindow_import
integer x = 96
integer y = 536
integer width = 571
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ImportClipboard Test"
end type

event clicked;dw_1.ReSet()

String 	strtestvalue
Long 		ll_Return

strtestvalue = 'Jones~tQ1~tCosmic~t5~r~n'
strtestvalue += 'Simpson~tQ1~tGalactic~t6~r~n'
strtestvalue += 'Perez~tQ1~tCosmic~t26~r~n'
strtestvalue += 'Simpson~tQ4~tCosmic~t60'

Clipboard(strtestvalue)		
ll_Return = dw_1.ImportClipboard()

If ll_return > 0 Then
	is_result += "ImportClipboard( ) = " + "Success! Rows:" +  String ( ll_return ) +"~r~n"
	If dw_1.RowCount () >= 2 Then
		is_result += "dw_1.GetItemString( 2,'quarter') = " +  String ( dw_1.GetItemString( 2,'quarter') ) +"~r~n"
	End If
	If dw_1.RowCount () >= 3 Then
		is_result += "dw_1.GetItemString( 3,'product') = " +  String ( dw_1.GetItemString( 3,'product') ) +"~r~n"
	End If
	If dw_1.RowCount () >= 4 Then
		is_result += "dw_1.GetItemNumber( 4,'units') = " +  String ( dw_1.GetItemNumber( 4,'units') ) +"~r~n"
	End If
 else
	is_result += "ImportClipboard( ) = " + "Fail! Return:" + String ( ll_return ) +"~r~n"
End If

//-1   No rows or startrow value supplied is greater than the number of rows in the string
//-3   Invalid argument
//-4   Invalid input
//-11   XML Parsing Error; XML parser libraries not found or XML not well formed
//-12   XML Template does not exist or does not match the DataWindow
//-13    Unsupported DataWindow style for import
//-14    Error resolving DataWindow nesting


end event

type cb_2 from commandbutton within w_datawindow_import
integer x = 96
integer y = 404
integer width = 608
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ImportString Test"
end type

event clicked;
dw_1.ReSet()

dw_1.ImportString('Jones~tQ1~tCosmic~t5')
dw_1.ImportString('Simpson~tQ1~tGalactic~t6')
dw_1.ImportString('Perez~tQ1~tCosmic~t26')
dw_1.ImportString('Simpson~tQ4~tCosmic~t60')

IF dw_1.RowCount () > 0 Then
	is_result += "ImportString( 'Jones~tQ1~tCosmic~t5...' ) = " + "Success! Rows:" +  String ( dw_1.RowCount () ) +"~r~n"
	If dw_1.RowCount () >= 2 Then
		is_result += "dw_1.GetItemString( 2,'quarter') = " +  String ( dw_1.GetItemString( 2,'quarter') ) +"~r~n"
	End If
	If dw_1.RowCount () >= 3 Then
		is_result += "dw_1.GetItemString( 3,'product') = " +  String ( dw_1.GetItemString( 3,'product') ) +"~r~n"
	End If
	If dw_1.RowCount () >= 4 Then
		is_result += "dw_1.GetItemNumber( 4,'units') = " +  String ( dw_1.GetItemNumber( 4,'units') ) +"~r~n"
	End If
Else
	is_result += "ImportString( 'Jones~tQ1~tCosmic~t5...' ) = " + "Fail! " +"~r~n"
End If
end event

type dw_1 from datawindow within w_datawindow_import
integer x = 1326
integer y = 272
integer width = 1394
integer height = 852
integer taborder = 20
string title = "none"
string dataobject = "d_9k"
boolean livescroll = true
end type

type cb_1 from commandbutton within w_datawindow_import
integer x = 96
integer y = 272
integer width = 558
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ImportFile Test"
end type

event clicked;Long 	ll_return

IF  FileExists( 'ImportFile.txt') Then
	is_result += "FileExists( 'ImportFile.txt') = " + String ( "Found!" ) +"~r~n"

	ll_return = dw_1.ImportFile( 'ImportFile.txt')
	If ll_return > 0 Then
		is_result += "ImportFile( 'ImportFile.txt') = " + "Success! Rows:" +  String ( ll_return ) +"~r~n"
		If dw_1.RowCount () >= 4 Then
			is_result += "dw_1.GetItemString( 4,'quarter') = " +  String ( dw_1.GetItemString( 4,'quarter') ) +"~r~n"
		End If
		If dw_1.RowCount () >= 5 Then
			is_result += "dw_1.GetItemString( 5,'product') = " +  String ( dw_1.GetItemString( 5,'product') ) +"~r~n"
		End If
		If dw_1.RowCount () >= 6 Then
			is_result += "dw_1.GetItemNumber( 6,'units') = " +  String ( dw_1.GetItemNumber( 6,'units') ) +"~r~n"
		End If
	 else
		is_result += "ImportFile( 'ImportFile.txt') = " + "Fail! Return:" + String ( ll_return ) +"~r~n"
	End If
Else
	is_result += "FileExists( 'ImportFile.txt') = " + String ( "Not Found!" ) +"~r~n"
End If



//-1   No rows or startrow value supplied is greater than the number of rows in the file
//-2   Empty file
//-3   Invalid argument
//-4   Invalid input
//-5   Could not open the file
//-6   Could not close the file
//-7   Error reading the text
//-8   Unsupported file name suffix (must be *.txt, *.csv, *.dbf or *.xml)
//-10   Unsupported dBase file format (not version 2 or 3)
//
//-11   XML Parsing Error; XML parser libraries not found or XML not well formed
//-12   XML Template does not exist or does not match the DataWindow
//-13    Unsupported DataWindow style for import
//-14    Error resolving DataWindow nesting
//-15    File size exceeds limit


end event

type st_1 from statictext within w_datawindow_import
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
string text = "DataWindow Import Test"
boolean focusrectangle = false
end type

