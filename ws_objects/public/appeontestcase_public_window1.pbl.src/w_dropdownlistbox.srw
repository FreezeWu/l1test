$PBExportHeader$w_dropdownlistbox.srw
forward
global type w_dropdownlistbox from w_base_case
end type
type cb_3 from commandbutton within w_dropdownlistbox
end type
type cb_2 from commandbutton within w_dropdownlistbox
end type
type cb_1 from commandbutton within w_dropdownlistbox
end type
type ddlb_2 from dropdownlistbox within w_dropdownlistbox
end type
type ddlb_1 from dropdownlistbox within w_dropdownlistbox
end type
end forward

global type w_dropdownlistbox from w_base_case
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
ddlb_2 ddlb_2
ddlb_1 ddlb_1
end type
global w_dropdownlistbox w_dropdownlistbox

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine wf_initial ()
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

ls_array[Upperbound(ls_array) + 1 ] = "backcolor"			
ls_array[Upperbound(ls_array) + 1 ] = "Enabled"
ls_array[Upperbound(ls_array) + 1 ] = "FaceName"
ls_array[Upperbound(ls_array) + 1 ] = "Italic"
ls_array[Upperbound(ls_array) + 1 ] = "Item"
ls_array[Upperbound(ls_array) + 1 ] = "Sorted"
ls_array[Upperbound(ls_array) + 1 ] = "Tag"
ls_array[Upperbound(ls_array) + 1 ] = "Text"
ls_array[Upperbound(ls_array) + 1 ] = "TextColor"
ls_array[Upperbound(ls_array) + 1 ] = "TextSize"
ls_array[Upperbound(ls_array) + 1 ] = "Underline"
ls_array[Upperbound(ls_array) + 1 ] = "Visible"
ls_array[Upperbound(ls_array) + 1 ] = "Weight"
ls_array[Upperbound(ls_array) + 1 ] = "Width"
ls_array[Upperbound(ls_array) + 1 ] = "X"
ls_array[Upperbound(ls_array) + 1 ] = "Y"
ls_array[Upperbound(ls_array) + 1 ] = "AllowEdit"
ls_array[Upperbound(ls_array) + 1 ] = "Border"
ls_array[Upperbound(ls_array) + 1 ] = "BorderStyle"
ls_array[Upperbound(ls_array) + 1 ] = "Height"
ls_array[Upperbound(ls_array) + 1 ] = "HscrollBar"
ls_array[Upperbound(ls_array) + 1 ] = "Limit"
ls_array[Upperbound(ls_array) + 1 ] = "Pointer"
ls_array[Upperbound(ls_array) + 1 ] = "ShowList"                  
ls_array[Upperbound(ls_array) + 1 ] = "TabOrder"
ls_array[Upperbound(ls_array) + 1 ] = "VScrollBar"
ls_array[Upperbound(ls_array) + 1 ] = "fontcharset"
ls_array[Upperbound(ls_array) + 1 ] = "fontfamily"
ls_array[Upperbound(ls_array) + 1 ] = "FontPitch"
ls_array[Upperbound(ls_array) + 1 ] = "BringToTop"
ls_array[Upperbound(ls_array) + 1 ] = "Accelerator"
ls_array[Upperbound(ls_array) + 1 ] = "AutoHScroll"
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
	lbn_flag = false
	choose case lower(ls_item)

		case lower("backcolor")
			if rgb(255,0,0) = ddlb_1.backcolor and rgb(0,0,255) = ddlb_2.backcolor then
				ls_result += wf_result_add(ls_item, ": ddlb_1.backcolor = rgb(255,0,0) and ddlb_2.backcolor = rgb(0,0,255) ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.backcolor = rgb(255,0,0) and ddlb_2.backcolor = rgb(0,0,255) ", false)
			end if
			
			//set to 656
			ddlb_1.backcolor = 656
			if 656 = ddlb_1.backcolor then
				ls_result += wf_result_add(ls_item, ": ddlb_1.backcolor set to 656 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.backcolor set to 656 ", false)
			end if
			
			//set to 10000
			ddlb_1.backcolor = 10000
			if 10000 = ddlb_1.backcolor then
				ls_result += wf_result_add(ls_item, ": ddlb_1.backcolor set to 10000 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.backcolor set to 10000 ", false)
			end if
		
		case lower("Enabled")
			if TRUE = ddlb_1.Enabled and False = ddlb_2.Enabled then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Enabled = TRUE and ddlb_2.Enabled = false ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Enabled = TRUE and ddlb_2.Enabled = false ", false)
			end if
			
			//set to false
			ddlb_1.Enabled = false
			if false = ddlb_1.Enabled then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Enabled set to false ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Enabled set to false ", false)
			end if
			//set to true
			ddlb_1.Enabled = true
			if true = ddlb_1.Enabled then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Enabled set to true ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Enabled set to true ", false)
			end if
			
		case lower("FaceName")	
			if "Arial" = ddlb_1.FaceName and "Fixedsys" = ddlb_2.FaceName then
				ls_result += wf_result_add(ls_item, ": ddlb_1.FaceName = Arial and ddlb_2.FaceName = Fixedsys ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.FaceName = Arial and ddlb_2.FaceName = Fixedsys ", false)
			end if
			
			//set to Courier
			ddlb_1.FaceName = "Courier"
			if "Courier" = ddlb_1.FaceName then
				ls_result += wf_result_add(ls_item,": ddlb_1.FaceName set to Courier ", true)
			else
				ls_result += wf_result_add(ls_item,": ddlb_1.FaceName set to Courier ", false)
			end if
			
		case lower("Italic")
			if TRUE = ddlb_1.Italic and False = ddlb_2.Italic then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Italic = true and ddlb_2.Italic = false ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Italic = true and ddlb_2.Italic = false ", false)
			end if
			
			//set to false
			ddlb_1.Italic = false
			if false = ddlb_1.Italic then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Italic set to false ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Italic set to false ", false)
			end if
			
			//set to true
			ddlb_1.Italic = true
			if true = ddlb_1.Italic then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Italic set to true ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Italic set to true ", false)
			end if
			
		case lower("Item")	
			if "aaa1" = ddlb_1.Item[1] and "bbb1" = ddlb_2.Item[1] then
				ls_result += wf_result_add(ls_item, ": ddlb_1.item[1] = aaa1 and ddlb_2.item[1] = bbb1 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.item[1] = aaa1 and ddlb_2.item[1] = bbb1 ", false)
			end if
			
			//set to ccc
			ddlb_1.Item[1] = "ccc"
			if "ccc" = ddlb_1.Item[1] then
				ls_result += wf_result_add(ls_item, ": ddlb_1.item[1] set to ccc ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.item[1] set to ccc ", false)
			end if
			
		case lower("Sorted")	
			if TRUE = ddlb_1.Sorted and False = ddlb_2.Sorted then
				ls_result += wf_result_add(ls_item, ": ddlb_1.sorted = true and ddlb_2.Sorted = false ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.sorted = true and ddlb_2.Sorted = false ", false)
			end if
			
			//set to false
			ddlb_1.Sorted = false
			if false = ddlb_1.Sorted then
				ls_result += wf_result_add(ls_item, ": ddlb_1.sorted set to false ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.sorted set to false ", false)
			end if
			//set to true
			ddlb_1.Sorted = true
			if true = ddlb_1.Sorted then
				ls_result += wf_result_add(ls_item, ": ddlb_1.sorted set to true ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.sorted set to true ", false)
			end if
			
		case lower("Tag")
			if "1" = right(ddlb_1.Tag,1) and "2" = right(ddlb_2.Tag,1) then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Tag = 1 and ddlb_2.Tag = 2 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Tag = 1 and ddlb_2.Tag = 2 ", false)
			end if
			
			//set to 8
			ddlb_1.Tag = "8"
			if "8" = ddlb_1.Tag then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Tag set to 8 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Tag set to 8 ", false)
			end if
			
		case lower("Text")	
			if "" = ddlb_1.Text and "" = ddlb_2.Text then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Text = empty and ddlb_2.Text = empty ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Text = empty and ddlb_2.Text = empty ", false)
			end if
			
//			//set to novalid
//			ddlb_1.Text = "novalid"
//			
//			//set to aaa
			
		case lower("TextColor")
			if rgb(0,0,255) = ddlb_1.TextColor and rgb(255,0,0) = ddlb_2.TextColor then
				ls_result += wf_result_add(ls_item, ": ddlb_1.TextColor = rgb(0,0,255) and ddlb_2.TextColor = rgb(255,0,0) ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.TextColor = rgb(0,0,255) and ddlb_2.TextColor = rgb(255,0,0) ", false)
			end if
			
			//set to 100
			ddlb_1.TextColor = 100
			if 100 = ddlb_1.TextColor then
				ls_result += wf_result_add(ls_item, ": ddlb_1.TextColor set to 100 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.TextColor set to 100 ", false)
			end if
			
			//set to 876
			ddlb_1.TextColor = 876
			if 876 = ddlb_1.TextColor then
				ls_result += wf_result_add(ls_item, ": ddlb_1.TextColor set to 876 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.TextColor set to 876 ", false)
			end if
			
		case lower("TextSize")    //为什么设置正数，返回负数？
			if -10 = ddlb_1.TextSize and -12 = ddlb_2.TextSize then 
				ls_result += wf_result_add(ls_item, ": ddlb_1.TextSize = 10 and ddlb_2.TextSize = 12 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.TextSize = 10 and ddlb_2.TextSize = 12 ", false)
			end if
			
			//set to 14
			ddlb_1.TextSize = 14
			if 14 = ddlb_1.TextSize then
				ls_result += wf_result_add(ls_item, ": ddlb_1.TextSize set to 14 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.TextSize set to 14 ", false)
			end if
			
		case lower("Underline")	
			if TRUE = ddlb_1.Underline and False = ddlb_2.Underline then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Underline = true and ddlb_2.Underline = false ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Underline = true and ddlb_2.Underline = false ", false)
			end if
			
			//set to false
			ddlb_1.Underline = false
			if false = ddlb_1.Underline then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Underline set to false ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Underline set to false ", false)
			end if
			//set to true
			ddlb_1.Underline = true
			if true = ddlb_1.Underline then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Underline set to true ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Underline set to true ", false)
			end if
			
		case lower("Visible")
			if TRUE = ddlb_1.Visible and False = ddlb_2.Visible then
				ls_result += wf_result_add(ls_item, ": ddlb_1.visible = true and ddlb_2.visible = false ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.visible = true and ddlb_2.visible = false ", false)
			end if
			
			//set to false
			ddlb_1.Visible = false
			if false = ddlb_1.Visible then
				ls_result += wf_result_add(ls_item, ': ddlb_1.Visible set to false ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.Visible set to false ', false)
			end if
			//set to true
			ddlb_1.Visible = true
			if true = ddlb_1.Visible then
				ls_result += wf_result_add(ls_item, ': ddlb_1.Visible set to true ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.Visible set to true ', false)
			end if
	
		case lower("Weight")
			ls_result += wf_result_add(ls_item, ": ddlb_1.Weight = " + string(ddlb_1.Weight) + " ddlb_2.Weight = " + string(ddlb_2.Weight), true)
			
			//set to 3
			ddlb_1.Weight = 3
			ls_result += wf_result_add(ls_item, ": ddlb_1.Weight = " + string(ddlb_1.Weight), true)
			//set to 100
			ddlb_1.Weight = 100
			ls_result += wf_result_add(ls_item, ": ddlb_1.Weight = " + string(ddlb_1.Weight), true)
			
		case lower("Width")
			ls_result += wf_result_add(ls_item, ": ddlb_1.Width = " + string(ddlb_1.Width)+" ddlb_2.Width = " + string(ddlb_2.Width), true)

			
			//set to 32
			ddlb_1.Width = 32
			
			ls_result += wf_result_add(ls_item, ": ddlb_1.Width = " + string(ddlb_1.Width), true)
			//set to 200
			ddlb_1.Width = 200
			ls_result += wf_result_add(ls_item, ": ddlb_1.Width = " + string(ddlb_1.Width), true)
			
		case lower("X")
			ls_result += wf_result_add(ls_item, ': ddlb_1.X = '+string(ddlb_1.X)+' and ddlb_2.X = '+string(ddlb_2.X), true)
			
			//set to 10
			ddlb_1.X = 10
			ls_result += wf_result_add(ls_item, ": ddlb_1.X = " + string(ddlb_1.X), true)

			//set to 10000
			ddlb_1.X = 10000
			ls_result += wf_result_add(ls_item, ": ddlb_1.X = " + string(ddlb_1.X), true)

			//set to 119
			ddlb_1.X = 119
			ls_result += wf_result_add(ls_item, ": ddlb_1.X set to 119 ", true)

			
		case lower("Y")
			ls_result += wf_result_add(ls_item, ": ddlb_1.Y = " + string(ddlb_1.Y) + " ddlb_2.Y = " + string(ddlb_2.Y), true)
			
			//set to 10
			ddlb_1.Y = 10
			ls_result += wf_result_add(ls_item, ": ddlb_1.Y = " + string(ddlb_1.Y), true)
			//set to 10000
			ddlb_1.Y = 10000
			ls_result += wf_result_add(ls_item, ": ddlb_1.Y = " + string(ddlb_1.Y), true)
			//set to 110
			ddlb_1.Y = 110
			ls_result += wf_result_add(ls_item, ": ddlb_1.Y = " + string(ddlb_1.Y), true)
			
		case lower("AllowEdit")
			if TRUE = ddlb_1.AllowEdit and False = ddlb_2.AllowEdit then
				ls_result += wf_result_add(ls_item, ': ddlb_1.AllowEdit =  true and ddlb_2.AllowEdit =false ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.AllowEdit =  true and ddlb_2.AllowEdit =false ', false)
			end if

			//set to false
			ddlb_1.AllowEdit = false
			if false = ddlb_1.AllowEdit then
				ls_result += wf_result_add(ls_item, ': ddlb_1.AllowEdit set to false ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.AllowEdit set to false ', false)
			end if
			//set to true
			ddlb_1.AllowEdit = true
			if true = ddlb_1.AllowEdit then
				ls_result += wf_result_add(ls_item, ': ddlb_1.AllowEdit set to true ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.AllowEdit set to true ', false)
			end if
			
		case lower("Border")
			if TRUE = ddlb_1.Border and False = ddlb_2.Border then
				ls_result += wf_result_add(ls_item, ': ddlb_1.Border = true and ddlb_2.Border = false ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.Border = true and ddlb_2.Border = false ', false)
			end if
			
			//set to false
			ddlb_1.Border = false
			if false = ddlb_1.Border then
				ls_result += wf_result_add(ls_item, ': ddlb_1.Border set to false ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.Border set to false ', false)
			end if
			//set to true
			ddlb_1.Border = true
			if true = ddlb_1.Border then
				ls_result += wf_result_add(ls_item, ': ddlb_1.Border set to true ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.Border set to true ', false)
			end if
			
		case lower("BorderStyle")	
			if StyleRaised! = ddlb_1.BorderStyle and stylelowered! = ddlb_2.BorderStyle then
				ls_result += wf_result_add(ls_item, ': ddlb_1.BorderStyle = StyleRaised! and ddlb_2.BorderStyle =stylelowered! ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.BorderStyle = StyleRaised! and ddlb_2.BorderStyle =stylelowered! ', false)
			end if
			
			//set to StyleBox!
			ddlb_1.BorderStyle = StyleBox!
			if StyleBox! = ddlb_1.BorderStyle then
				ls_result += wf_result_add(ls_item, ": ddlb_1.BorderStyle set to StyleBox! ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.BorderStyle set to StyleBox! ", false)
			end if
			//set to StyleShadowBox!
			ddlb_1.BorderStyle = StyleShadowBox!
			if StyleShadowBox! = ddlb_1.BorderStyle then
				ls_result += wf_result_add(ls_item, ": ddlb_1.BorderStyle set to StyleShadowBox! ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.BorderStyle set to StyleShadowBox! ", false)
			end if
			
		case lower("Height")
			ls_result += wf_result_add(ls_item, ": ddlb_1.Height = " + string(ddlb_1.Height) + " ddlb_2.Height = " + string(ddlb_2.Height), true)
			
			//set to 10
			ddlb_1.Height = 10
			ls_result += wf_result_add(ls_item, ": ddlb_1.Height = " + string(ddlb_1.Height), true)
			//set to 1000
			ddlb_1.Height = 1000
			ls_result += wf_result_add(ls_item, ": ddlb_1.Height = " + string(ddlb_1.Height), true)
			
			
		case lower("HscrollBar")	
			if TRUE = ddlb_1.HscrollBar and False = ddlb_2.HscrollBar then
				ls_result += wf_result_add(ls_item, ': ddlb_1.HscrollBar = true and ddlb_2.HscrollBar = false ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.HscrollBar = true and ddlb_2.HscrollBar = false ', false)
			end if

			//set to false
			ddlb_1.HscrollBar = false
			if false = ddlb_1.HscrollBar then
				ls_result += wf_result_add(ls_item, ': ddlb_1.HscrollBar set to false ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.HscrollBar set to false ', false)
			end if
			//set to true
			ddlb_1.HscrollBar = true
			if true = ddlb_1.HscrollBar then
				ls_result += wf_result_add(ls_item, ': ddlb_1.HscrollBar set to true ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.HscrollBar set to true ', false)
			end if
			
		case lower("Limit")	
			if 5 = ddlb_1.Limit and 0 = ddlb_2.Limit then
				ls_result += wf_result_add(ls_item, ': ddlb_1.Limit = 5 and ddlb_2.Limit = 0 ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.Limit = 5 and ddlb_2.Limit = 0 ', false)
			end if
			
			//set to 60
			ddlb_1.Limit = 60
			if 60 = ddlb_1.Limit then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Limit set to 60 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Limit set to 60 ", false)
			end if
			//set to 165
			ddlb_1.Limit = 165
			if 165 = ddlb_1.Limit then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Limit set to 165 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Limit set to 165 ", false)
			end if
			//set to 5
			ddlb_1.Limit = 5
			if 5 = ddlb_1.Limit then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Limit set to 5 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Limit set to 5 ", false)
			end if
			
		case lower("Pointer")	
			if "HyperLink!" = ddlb_1.Pointer and "HourGlass!" = ddlb_2.Pointer then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer = 'HyperLink!' and ddlb_2.Pointer = 'HourGlass!' ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer = 'HyperLink!' and ddlb_2.Pointer = 'HourGlass!' ", false)
			end if
			
			//set to Arrow!
			ddlb_1.Pointer = 'Arrow!'
			if 'Arrow!' = ddlb_1.Pointer then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'Arrow!' ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'Arrow!' ", false)
			end if
			//set to Beam!
			ddlb_1.Pointer ='Beam!'
			if 'Beam!' = ddlb_1.Pointer then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'Beam!' ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'Beam!' ", false)
			end if
			//set to Cross!
			ddlb_1.Pointer = 'Cross!'
			if 'Cross!' = ddlb_1.Pointer then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'Cross!' ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'Cross!' ", false)
			end if
			//set to Size!
			ddlb_1.Pointer = 'Size!'
			if 'Size!' = ddlb_1.Pointer then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'Size!' ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'Size!' ", false)
			end if
			//set to SizeVWSE!
			ddlb_1.Pointer = 'SizeVWSE!'
			if 'SizeVWSE!' = ddlb_1.Pointer then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'SizeVWSE!' ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'SizeVWSE!' ", false)
			end if
			//set to SizeNWSE!
			ddlb_1.Pointer = 'SizeNWSE!'
			if 'SizeNWSE!' = ddlb_1.Pointer then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'SizeNWSE!' ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'SizeNWSE!' ", false)
			end if
			//set to SizeWE!
			ddlb_1.Pointer = 'SizeWE!'
			if 'SizeWE!' = ddlb_1.Pointer then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'SizeWE!' ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'SizeWE!' ", false)
			end if
			//set to UPArrow!
			ddlb_1.Pointer = 'UPArrow!'
			if 'UPArrow!' = ddlb_1.Pointer then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'UPArrow!' ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'UPArrow!' ", false)
			end if
			//set to SizeNS!
			ddlb_1.Pointer = 'SizeNS!'
			if 'SizeNS!' = ddlb_1.Pointer then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'SizeNS!' ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Pointer set to 'SizeNS!' ", false)
			end if
			
		
		case lower("TabOrder")
			if 10 = ddlb_1.TabOrder and 20 = ddlb_2.TabOrder then
				ls_result += wf_result_add(ls_item, ': ddlb_1.TabOrder = 10 and ddlb_2.TabOrder = 20 ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.TabOrder = 10 and ddlb_2.TabOrder = 20 ', false)
			end if
			
			//set to 2
			ddlb_1.TabOrder = 2
			if 2 = ddlb_1.TabOrder then
				ls_result += wf_result_add(ls_item, ": ddlb_1.TabOrder set to 2 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.TabOrder set to 2 ", false)
			end if
			//set to 100
			ddlb_1.TabOrder = 100
			if 100 = ddlb_1.TabOrder then
				ls_result += wf_result_add(ls_item, ": ddlb_1.TabOrder set to 100 ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.TabOrder set to 100 ", false)
			end if
			
		case lower("VScrollBar")
			if TRUE = ddlb_1.VScrollBar and False = ddlb_2.VScrollBar then
				ls_result += wf_result_add(ls_item, ': ddlb_1.VScrollBar = true and ddlb_2.VScrollBar = false ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.VScrollBar = true and ddlb_2.VScrollBar = false ', false)
			end if
			
			//set to false
			ddlb_1.VScrollBar = false
			if false = ddlb_1.VScrollBar then
				ls_result += wf_result_add(ls_item, ': ddlb_1.VScrollBar set to false ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.VScrollBar set to false ', false)
			end if
			//set to true
			ddlb_1.VScrollBar = true
			if true = ddlb_1.VScrollBar then
				ls_result += wf_result_add(ls_item, ': ddlb_1.VScrollBar set to true ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.VScrollBar set to true ', false)
			end if
			
		case lower("fontcharset")	
			if ansi! = ddlb_1.fontcharset and gb2312charset! = ddlb_2.fontcharset then
				ls_result += wf_result_add(ls_item, ': ddlb_1.fontcharset to = ansi! and ddlb_2.fontcharset to = gb2312charset! ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.fontcharset to = ansi! and ddlb_2.fontcharset to = gb2312charset! ', false)
			end if
			
			//set to ChineseBig5!
			ddlb_1.fontcharset = ChineseBig5!
			if ChineseBig5! = ddlb_1.fontcharset then
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontcharset set to ChineseBig5! ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontcharset set to ChineseBig5! ", false)
			end if
			//set to DefaultCharSet!
			ddlb_1.fontcharset = DefaultCharSet!
			if DefaultCharSet! = ddlb_1.fontcharset then
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontcharset set to DefaultCharSet! ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontcharset set to DefaultCharSet! ", false)
			end if
			//set to OEM!
			ddlb_1.fontcharset = OEM!
			if OEM! = ddlb_1.fontcharset then
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontcharset set to OEM! ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontcharset set to OEM! ", false)
			end if
			//set to ShiftJIS!
			ddlb_1.fontcharset = ShiftJIS!
			if ShiftJIS! = ddlb_1.fontcharset then
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontcharset set to ShiftJIS! ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontcharset set to ShiftJIS! ", false)
			end if
			//set to Symbol!
			ddlb_1.fontcharset = Symbol!
			if Symbol! = ddlb_1.fontcharset then
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontcharset set to Symbol! ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontcharset set to Symbol! ", false)
			end if
			//set to ANSI!
			ddlb_1.fontcharset = ANSI!
			if ANSI! = ddlb_1.fontcharset then
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontcharset set to ANSI! ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontcharset set to ANSI! ", false)
			end if
			
		case lower("fontfamily")
			if swiss! = ddlb_1.fontfamily and modern! = ddlb_2.fontfamily then
				ls_result += wf_result_add(ls_item, ': ddlb_1.fontfamily = swiss! and ddlb_2.fontfamily = modern! ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.fontfamily = swiss! and ddlb_2.fontfamily = modern! ', false)
			end if
			
		
			//set to Roman!
			ddlb_1.fontfamily = Roman!
			if Roman! = ddlb_1.fontfamily then
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontfamily set to Roman! ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontfamily set to Roman! ", false)
			end if
			//set to Script!
			ddlb_1.fontfamily = Script!
			if Script! = ddlb_1.fontfamily then
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontfamily set to Script! ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontfamily set to Script! ", false)
			end if
			//set to Decorative!
			ddlb_1.fontfamily = Decorative!
			if Decorative! = ddlb_1.fontfamily then
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontfamily set to Decorative! ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.fontfamily set to Decorative! ", false)
			end if
			
		case lower("FontPitch")	
			if variable! = ddlb_1.FontPitch and fixed! = ddlb_2.FontPitch then
				ls_result += wf_result_add(ls_item, ': ddlb_1.FontPitch = variable! and ddlb_2.FontPitch = fixed! ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.FontPitch = variable! and ddlb_2.FontPitch = fixed! ', false)
			end if
			
			//set to Default
			ddlb_1.FontPitch = Default!
			if Default! = ddlb_1.FontPitch then
				ls_result += wf_result_add(ls_item, ": ddlb_1.FontPitch set to Default! ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.FontPitch set to Default! ", false)
			end if
			
		case lower("BringToTop")	
			if TRUE = ddlb_1.BringToTop and False = ddlb_2.BringToTop then
				ls_result += wf_result_add(ls_item, ': ddlb_1.BringToTop = TRUE and ddlb_2.BringToTop = False ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.BringToTop = TRUE and ddlb_2.BringToTop = False ', false)
			end if

			//set to false
			ddlb_1.BringToTop = false
			if false = ddlb_1.BringToTop then
				ls_result += wf_result_add(ls_item, ': ddlb_1.BringToTop set to false ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.BringToTop set to false ', false)
			end if
			//set to true
			ddlb_1.BringToTop = true
			if true = ddlb_1.BringToTop then
				ls_result += wf_result_add(ls_item, ': ddlb_1.BringToTop set to true ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.BringToTop set to true ', false)
			end if
			
		case lower("Accelerator")	
			if 97 = ddlb_1.Accelerator  and 98 = ddlb_2.Accelerator then
				ls_result += wf_result_add(ls_item, ': ddlb_1.Accelerator = 97 and ddlb_2.Accelerator = 98 ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.Accelerator = 97 and ddlb_2.Accelerator = 98 ', false)
			end if
			
			//set to p
			ddlb_1.Accelerator = asc("p")
			if 112 = ddlb_1.Accelerator then
				ls_result += wf_result_add(ls_item, ": ddlb_1.Accelerator set to 'p' ", true)
			else
				ls_result += wf_result_add(ls_item, ": ddlb_1.Accelerator set to 'p' ", false)
			end if
			
		case lower("AutoHScroll")
			if FALSE = ddlb_1.AutoHScroll and TRUE = ddlb_2.AutoHScroll then
				ls_result += wf_result_add(ls_item, ': ddlb_1.AutoHScroll = TRUE and ddlb_2.AutoHScroll = False ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.AutoHScroll = TRUE and ddlb_2.AutoHScroll = False ', false)
			end if
			
			//set to false
			ddlb_1.AutoHScroll = false
			if false = ddlb_1.AutoHScroll then
				ls_result += wf_result_add(ls_item, ': ddlb_1.AutoHScroll set to false ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.AutoHScroll set to false ', false)
			end if
			//set to true
			ddlb_1.AutoHScroll = true
			if true = ddlb_1.AutoHScroll then
				ls_result += wf_result_add(ls_item, ': ddlb_1.AutoHScroll set to true ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.AutoHScroll set to true ', false)
			end if
			
		case lower("ShowList")
			if TRUE = ddlb_1.ShowList and FALSE = ddlb_2.ShowList then
				ls_result += wf_result_add(ls_item, ': ddlb_1.ShowList = TRUE and ddlb_2.ShowList = False ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.ShowList = TRUE and ddlb_2.ShowList = False ', false)
			end if

			//set to false
			ddlb_1.ShowList = false
			if false = ddlb_1.ShowList then
				ls_result += wf_result_add(ls_item, ': ddlb_1.ShowList set to false ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.ShowList set to false ', false)
			end if
			//set to true
			ddlb_1.ShowList = true
			if true = ddlb_1.ShowList then
				ls_result += wf_result_add(ls_item, ': ddlb_1.ShowList set to true ', true)
			else
				ls_result += wf_result_add(ls_item, ': ddlb_1.ShowList set to true ', false)
			end if
			
		case lower("")
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_tmp1,ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag, lbn_rtn
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "AddItem"		
ls_array[Upperbound(ls_array) + 1 ] = "ClassName"
ls_array[Upperbound(ls_array) + 1 ] = "Clear"
ls_array[Upperbound(ls_array) + 1 ] = "DeleteItem"
ls_array[Upperbound(ls_array) + 1 ] = "FindItem"
ls_array[Upperbound(ls_array) + 1 ] = "Reset"
ls_array[Upperbound(ls_array) + 1 ] = "Hide"
ls_array[Upperbound(ls_array) + 1 ] = "InsertItem"
ls_array[Upperbound(ls_array) + 1 ] = "Show"
ls_array[Upperbound(ls_array) + 1 ] = "Move"
ls_array[Upperbound(ls_array) + 1 ] = "TypeOf"
ls_array[Upperbound(ls_array) + 1 ] = "Resize"
ls_array[Upperbound(ls_array) + 1 ] = "SetFocus"
ls_array[Upperbound(ls_array) + 1 ] = "SelectItem"
ls_array[Upperbound(ls_array) + 1 ] = "Text"
ls_array[Upperbound(ls_array) + 1 ] = "TotalItem"
ls_array[Upperbound(ls_array) + 1 ] = "GetParent"
ls_array[Upperbound(ls_array) + 1 ] = "Position"
ls_array[Upperbound(ls_array) + 1 ] = "PostEvent"
ls_array[Upperbound(ls_array) + 1 ] = "TriggerEvent"
ls_array[Upperbound(ls_array) + 1 ] = "Copy"
ls_array[Upperbound(ls_array) + 1 ] = "Cut"
ls_array[Upperbound(ls_array) + 1 ] = "Paste"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedLength"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedStart"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedText"
ls_array[Upperbound(ls_array) + 1 ] = "ReplaceText"
ls_array[Upperbound(ls_array) + 1 ] = "SelectText"
ls_array[Upperbound(ls_array) + 1 ] = "SetPosition"
ls_array[Upperbound(ls_array) + 1 ] = "PointerX"
ls_array[Upperbound(ls_array) + 1 ] = "PointerY"
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
	lbn_flag = false
	choose case lower(ls_item)
//		case lower("testcasepoint_example1")	
			//			... your test case code...
			//ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
		case lower("AddItem")	
			//Returns the position of the new item
			ll_tmp = ddlb_1.TotalItems()
			li_rtn = ddlb_1.AddItem( "NewItem")
			ll_tmp1 = ddlb_1.TotalItems()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn > 0 and ll_tmp + 1 = ll_tmp1)
			wf_initial()
			
		case lower("ClassName")	
			ls_temp = ddlb_1.Classname()
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp) and ls_temp = "ddlb_1")
			
		case lower("Clear")	
			wf_initial()
			li_rtn = ddlb_1.clear()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 0)
			wf_initial()
		case lower("DeleteItem")	
			//Returns the number of items remaining in the list of values after the item is deleted
			ll_tmp = ddlb_1.TotalItems()
			li_rtn = ddlb_1.DeleteItem( 1 )
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn + 1 = ll_tmp)
			wf_initial()
			
		case lower("FindItem")
			li_rtn = ddlb_1.AddItem( "find")
			li_rtn = ddlb_1.FindItem("find",0)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn > 0)
			wf_initial()
			
		case lower("Reset")	
			li_rtn = ddlb_1.Reset()
			ll_tmp = ddlb_1.TotalItems()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1 and ll_tmp = 0)
			wf_initial()
		case lower("Hide")	
			li_rtn = ddlb_1.Hide()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
			//Hide then Show
			li_rtn = ddlb_1.Show()
			ls_result += wf_result_add(ls_item, " then Show ", not isnull(li_rtn) and li_rtn = 1)
		case lower("InsertItem")	
			//Returns the final position of the item
			li_rtn = ddlb_1.InsertItem( "insert", 2)
			ll_tmp = ddlb_1.FindItem("insert",0)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = ll_tmp)
			wf_initial()
			
		case lower("Show")
			li_rtn = ddlb_1.Show()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
		case lower("Move")	
			li_rtn = ddlb_1.Move(100,100)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
		case lower("TypeOf")	
			if dropdownlistbox! = ddlb_1.typeof() then
				ls_result += wf_result_add(ls_item, " ", true)
			else
				ls_result += wf_result_add(ls_item, " ", false)
			end if
		case lower("Resize")	
			li_rtn = ddlb_1.Resize(300,500)
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn = 1)
	
		case lower("SetFocus")	
			li_rtn = ddlb_1.SetFocus()
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn = 1)
			
		case lower("SelectItem")	
			//Returns the index number of the selected item
			//found
			li_rtn = ddlb_1.SelectItem("aaa3",1)
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn = 3)
			
			//no found
			li_rtn = ddlb_1.SelectItem("b",1)
			ls_result += wf_result_add(ls_item, " no found ",  not isnull(li_rtn) and li_rtn = 0)
			
			//null
			setnull(ls_temp)
			li_rtn = ddlb_1.SelectItem(ls_temp,1)
			ls_result += wf_result_add(ls_item, " null ", isnull(li_rtn))
			
		case lower("Text")	
			wf_initial()
			ls_temp = ddlb_1.Text(2)
			ls_result += wf_result_add(ls_item, " ",  not isnull(ls_temp) and ls_temp = "aaa2")
			
		case lower("TotalItems")	
			wf_initial()
			li_rtn = ddlb_1.TotalItems()
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn = 3)
			
		case lower("GetParent")	
			PowerObject lpo_parent
			lpo_parent = ddlb_1.GetParent()
			ls_temp = lpo_parent.ClassName()
			ls_result += wf_result_add(ls_item, " ",  not isnull(ls_temp) and ls_temp = "w_dropdownlistbox")
			
		case lower("Position")
			ddlb_1.SelectItem("aaa3",1)
			li_rtn = ddlb_1.position( )
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn > 0)
			
		case lower("PostEvent")	
			lbn_rtn = ddlb_1.PostEvent(DoubleClicked!)
			ls_result += wf_result_add(ls_item, " ",  not isnull(lbn_rtn) and lbn_rtn)
			 
		case lower("TriggerEvent")	
			is_log = ""
			ddlb_1.TriggerEvent(DoubleClicked!)
			ls_result += wf_result_add(ls_item, " ",  pos(lower(is_log), lower('doubleclicked')) > 0)
			
		case lower("Copy")	
			ddlb_1.allowedit=true
			ddlb_1.selecttext(1,len(ddlb_1.text))
			li_rtn = ddlb_1.copy()
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn = 4)
			
		case lower("Cut")	
			ddlb_1.allowedit=true
			ddlb_1.selecttext(1,len(ddlb_1.text))
			li_rtn = ddlb_1.cut()
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn = 4)
			
			
		case lower("Paste")	
			li_rtn = ddlb_1.paste()
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn = 4)
			
		case lower("SelectedLength")	
			wf_initial()
			ddlb_1.allowedit=true
			ddlb_1.selecttext(1,len(ddlb_1.text))
			li_rtn = ddlb_1.SelectedLength()
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn = 4)
			
		case lower("SelectedStart")	
			wf_initial()
			ddlb_1.allowedit=true
			ddlb_1.selecttext(1,len(ddlb_1.text))
			li_rtn =ddlb_1.SelectedStart()
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn = 1)
			
		case lower("SelectedText")	
			wf_initial()
			ddlb_1.allowedit=true
			ddlb_1.selectitem(1)
			ddlb_1.selecttext(1,len(ddlb_1.text))
			ls_temp = ddlb_1.SelectedText()
			ls_result += wf_result_add(ls_item, " ",  not isnull(ls_temp) and ls_temp = "aaa1")
			
		case lower("ReplaceText")	
			wf_initial()
			ddlb_1.selectitem(1)
			ddlb_1.selecttext(1,len(ddlb_1.text))
			li_rtn = ddlb_1.replacetext( "Replace")
			ll_tmp = ddlb_1.selecttext(1,li_rtn)
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn = 7 and ll_tmp = 7)
			
		case lower("SelectText")	
			wf_initial()
			ddlb_1.allowedit=true
			ddlb_1.selectitem(1)
			li_rtn = ddlb_1.selecttext(1,len(ddlb_1.text))
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn = 4)
			
		case lower("SetPosition")	
			//ToTop
			li_rtn = ddlb_1.SetPosition(ToTop!)
			ls_result += wf_result_add(ls_item, " ToTop ",  not isnull(li_rtn) and li_rtn = 1)
			
			//ToBottom
			li_rtn = ddlb_1.SetPosition(ToBottom!,cb_3)
			ls_result += wf_result_add(ls_item, " ToBottom ",  not isnull(li_rtn) and li_rtn = 1)
		case lower("PointerX")	
			li_rtn = ddlb_1.PointerX()
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn > 0)
		case lower("PointerY")	
			li_rtn = ddlb_1.PointerY()
			ls_result += wf_result_add(ls_item, " ",  not isnull(li_rtn) and li_rtn > 0)
		
		case lower("")	
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine wf_initial ();//
ddlb_1.Reset()
ddlb_2.Reset()
//ddlb_1.Item[1] = "aaa1"
//ddlb_1.Item[2] = "aaa2"
//ddlb_1.Item[3] = "aaa3"
//ddlb_2.Item[1] = "bbb1"
//ddlb_2.Item[2] = "bbb2"
//ddlb_2.Item[3] = "bbb3"

//2017/11/30 modify by wukaichen
//wrong way to reset ddlb
ddlb_1.addItem('aaa1')
ddlb_1.addItem('aaa2')
ddlb_1.addItem('aaa3')
ddlb_2.addItem('bbb1')
ddlb_2.addItem('bbb2')
ddlb_2.addItem('bbb3')

end subroutine

on w_dropdownlistbox.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.ddlb_2
this.Control[iCurrent+5]=this.ddlb_1
end on

on w_dropdownlistbox.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ddlb_2)
destroy(this.ddlb_1)
end on

type cb_3 from commandbutton within w_dropdownlistbox
integer x = 955
integer y = 272
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
boolean underline = true
string text = "none"
end type

type cb_2 from commandbutton within w_dropdownlistbox
integer x = 270
integer y = 908
integer width = 457
integer height = 112
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "function"
end type

event clicked;of_testcase_point_module1()
end event

type cb_1 from commandbutton within w_dropdownlistbox
integer x = 270
integer y = 776
integer width = 457
integer height = 112
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "property"
end type

event clicked;of_testcase_point_module()
end event

type ddlb_2 from dropdownlistbox within w_dropdownlistbox
string tag = "2"
boolean visible = false
integer x = 1696
integer y = 168
integer width = 686
integer height = 400
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Fixedsys"
string pointer = "HourGlass!"
long textcolor = 255
long backcolor = 16711680
boolean enabled = false
boolean autohscroll = true
boolean border = false
boolean sorted = false
string item[] = {"bbb1","bbb2","bbb3"}
integer accelerator = 98
borderstyle borderstyle = stylelowered!
end type

type ddlb_1 from dropdownlistbox within w_dropdownlistbox
string tag = "1"
integer x = 155
integer y = 192
integer width = 530
integer height = 352
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 255
boolean allowedit = true
boolean showlist = true
boolean hscrollbar = true
boolean vscrollbar = true
integer limit = 5
string item[] = {"aaa1","aaa2","aaa3"}
integer accelerator = 97
borderstyle borderstyle = styleraised!
end type

event doubleclicked;is_log += "doubleclicked triggered"

end event

