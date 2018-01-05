$PBExportHeader$w_richtext_control.srw
forward
global type w_richtext_control from w_base_case
end type
type dw_1 from datawindow within w_richtext_control
end type
type cb_5 from commandbutton within w_richtext_control
end type
type cb_4 from commandbutton within w_richtext_control
end type
type cb_3 from commandbutton within w_richtext_control
end type
type cb_2 from commandbutton within w_richtext_control
end type
type cb_1 from commandbutton within w_richtext_control
end type
type rte_1 from richtextedit within w_richtext_control
end type
end forward

global type w_richtext_control from w_base_case
integer width = 3310
integer height = 1680
dw_1 dw_1
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
rte_1 rte_1
end type
global w_richtext_control w_richtext_control

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
string 		ls_array[], ls_item, ls_result, ls_temp,ls_rtn, ls_null, ls_temp2
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag, lbn_rtn
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
BorderStyle	lbs_rtn,lbs_val
AccessibleRole  lasbr_rtn
PowerObject		lpo_object
any					lany_object

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "Accelerator"			        //manual
ls_array[Upperbound(ls_array) + 1 ] = "AccessibleDescription"
ls_array[Upperbound(ls_array) + 1 ] = "AccessibleName"
ls_array[Upperbound(ls_array) + 1 ] = "AccessibleRole"
ls_array[Upperbound(ls_array) + 1 ] = "BackColor"
ls_array[Upperbound(ls_array) + 1 ] = "Border"
ls_array[Upperbound(ls_array) + 1 ] = "BorderStyle"
ls_array[Upperbound(ls_array) + 1 ] = "BottomMargin"
ls_array[Upperbound(ls_array) + 1 ] = "BringToTop"                 
ls_array[Upperbound(ls_array) + 1 ] = "ClassDefinition"
ls_array[Upperbound(ls_array) + 1 ] = "ControlCharsVisible"         
ls_array[Upperbound(ls_array) + 1 ] = "DisplayOnly"					
ls_array[Upperbound(ls_array) + 1 ] = "DocumentName"
ls_array[Upperbound(ls_array) + 1 ] = "DragAuto"					//manual
ls_array[Upperbound(ls_array) + 1 ] = "DragIcon"						
ls_array[Upperbound(ls_array) + 1 ] = "Enabled"
ls_array[Upperbound(ls_array) + 1 ] = "FaceName"
ls_array[Upperbound(ls_array) + 1 ] = "FontCharSet"
ls_array[Upperbound(ls_array) + 1 ] = "FontFamily"
ls_array[Upperbound(ls_array) + 1 ] = "FontPitch"
ls_array[Upperbound(ls_array) + 1 ] = "HeaderFooter"    	     //manual,couldn't modify when running
ls_array[Upperbound(ls_array) + 1 ] = "Height"
ls_array[Upperbound(ls_array) + 1 ] = "HScrollBar"
//ls_array[Upperbound(ls_array) + 1 ] = "ImeMode"							//Specifies the input method editor mode. This property is relevant only to applications running on a Japanese version of PowerBuilder.
ls_array[Upperbound(ls_array) + 1 ] = "InputFieldBackColor"
ls_array[Upperbound(ls_array) + 1 ] = "InputFieldsVisible"
ls_array[Upperbound(ls_array) + 1 ] = "InputFieldNamesVisible"
ls_array[Upperbound(ls_array) + 1 ] = "Italic"
ls_array[Upperbound(ls_array) + 1 ] = "LeftMargin"
ls_array[Upperbound(ls_array) + 1 ] = "Modified"
ls_array[Upperbound(ls_array) + 1 ] = "PaperHeight"
ls_array[Upperbound(ls_array) + 1 ] = "PaperOrientation"
ls_array[Upperbound(ls_array) + 1 ] = "PaperWidth"
ls_array[Upperbound(ls_array) + 1 ] = "PicturesAsFrame"
ls_array[Upperbound(ls_array) + 1 ] = "Pointer"
ls_array[Upperbound(ls_array) + 1 ] = "PopMenu"
ls_array[Upperbound(ls_array) + 1 ] = "Resizable"
ls_array[Upperbound(ls_array) + 1 ] = "RightMargin"
ls_array[Upperbound(ls_array) + 1 ] = "RulerBar"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedStartPos"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedTextLength"
ls_array[Upperbound(ls_array) + 1 ] = "StatusBar"
ls_array[Upperbound(ls_array) + 1 ] = "TabOrder"
ls_array[Upperbound(ls_array) + 1 ] = "Tag"
ls_array[Upperbound(ls_array) + 1 ] = "TextSize"
ls_array[Upperbound(ls_array) + 1 ] = "ToolBar"
ls_array[Upperbound(ls_array) + 1 ] = "TopMargin"
ls_array[Upperbound(ls_array) + 1 ] = "Underline"
ls_array[Upperbound(ls_array) + 1 ] = "Visible"
ls_array[Upperbound(ls_array) + 1 ] = "VScrollBar"
ls_array[Upperbound(ls_array) + 1 ] = "Weight"
ls_array[Upperbound(ls_array) + 1 ] = "Width"
ls_array[Upperbound(ls_array) + 1 ] = "WordWrap"
ls_array[Upperbound(ls_array) + 1 ] = "X"
ls_array[Upperbound(ls_array) + 1 ] = "Y"
ls_array[Upperbound(ls_array) + 1 ] = ""


ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	Yield ( )
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")	
	is_log = ''
	ls_temp = ''
	ls_temp2 = ''
	li_rtn = 0 
	ls_rtn = ''
	ll_tmp = 0
	lbn_flag = false
	choose case lower(ls_item)
		case lower("Accelerator")	
			li_rtn = rte_1.Accelerator
			ls_result += wf_result_add(ls_item, "1. get default", not isnull(li_rtn) and li_rtn = 0)
			
			//set Accelerator to "p"
			rte_1.Accelerator = asc('p')
			li_rtn = rte_1.Accelerator
			ls_result += wf_result_add(ls_item, "2. set ", not isnull(li_rtn) and li_rtn = 112)
			
			rte_1.Accelerator = asc('')
			li_rtn = rte_1.Accelerator
			ls_result += wf_result_add(ls_item, "3. reset empty ", not isnull(li_rtn) and li_rtn = 0)
			
		case lower("AccessibleDescription")	
			ls_rtn = rte_1.accessibledescription
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ls_rtn) and ls_rtn = "")
			
			ls_rtn =""
			ls_temp = "this is a description"
			rte_1.accessibledescription = ls_temp
			ls_rtn = rte_1.accessibledescription
			ls_result += wf_result_add(ls_item, "2. set example ", not isnull(ls_rtn) and ls_rtn = ls_temp)
			
			ls_temp = ""
			ls_rtn = ""
			rte_1.accessibledescription = ls_temp
			ls_rtn = rte_1.accessibledescription
			ls_result += wf_result_add(ls_item, "3. set empty", not isnull(ls_rtn) and ls_rtn = "")
		case lower("AccessibleName")	
			ls_rtn = rte_1.accessiblename
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ls_rtn) and ls_rtn = "")
			
			ls_rtn = ""
			ls_temp = "this is a name"
			rte_1.accessiblename = ls_temp
			ls_rtn = rte_1.accessiblename
			ls_result += wf_result_add(ls_item, "2. set name ", not isnull(ls_rtn) and ls_rtn = ls_temp)
			
			ls_temp = ""
			ls_rtn = ""
			rte_1.accessiblename = ls_temp
			ls_rtn = rte_1.accessiblename
			ls_result += wf_result_add(ls_item, "3. set empty ", not isnull(ls_rtn) and ls_rtn = ls_temp)
			
		case lower("AccessibleRole")	
			lasbr_rtn = rte_1.accessiblerole
			ls_result += wf_result_add(ls_item, " 1. get default ", not isnull(lasbr_rtn) and lasbr_rtn = DefaultRole!)
			
			rte_1.accessiblerole = animationrole!
			setnull(lasbr_rtn)
			lasbr_rtn = rte_1.accessiblerole 
			ls_result += wf_result_add(ls_item, " 2. set ", not isnull(lasbr_rtn) and lasbr_rtn = animationrole!)
			
			rte_1.accessiblerole = DefaultRole!
			setnull(lasbr_rtn)
			lasbr_rtn = rte_1.accessiblerole 
			ls_result += wf_result_add(ls_item, " 3. set default ", not isnull(lasbr_rtn) and lasbr_rtn = DefaultRole!)
			
		case lower("BackColor")	
			//get original backcolor
			ll_tmp = rte_1.backcolor
			ls_result += wf_result_add(ls_item, "1. get original ", not isnull(ll_tmp) and ll_tmp = 16777215)
			
			//set to -3
			rte_1.backcolor = -3
			ll_tmp = rte_1.backcolor
			ls_result += wf_result_add(ls_item, "2. set to -3 ", not isnull(ll_tmp) and ll_tmp = 16777215)
			
			//set to 10000
			rte_1.backcolor = 10000
			ll_tmp = rte_1.backcolor
			ls_result += wf_result_add(ls_item, "3. set to 10000 ", not isnull(ll_tmp) and ll_tmp = 10000)
			
			//set to 16777215
			rte_1.backcolor = 16777215
			ll_tmp = rte_1.backcolor
			ls_result += wf_result_add(ls_item, "4. set to 16777215 ", not isnull(ll_tmp) and ll_tmp = 16777215)
			
			//set to 16777217	
			rte_1.backcolor = 16777217
			ll_tmp = rte_1.backcolor
			ls_result += wf_result_add(ls_item, "5. set to 16777217 ", not isnull(ll_tmp) and ll_tmp = 16777217)
			
		case lower("Border")	
			//get original true
			lbn_rtn = rte_1.border
			ls_result += wf_result_add(ls_item, "1. get original true ", not isnull(lbn_rtn) and lbn_rtn = true)
			
			//set false
			rte_1.border = false
			lbn_rtn = rte_1.border
			ls_result += wf_result_add(ls_item, "2.  set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.border = true
			lbn_rtn = rte_1.border
			ls_result += wf_result_add(ls_item, "3. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
			
		case lower("BorderStyle")	
			//get original StyleLowerd!
			lbs_val = StyleLowered!
			lbs_rtn = rte_1.borderstyle
			ls_result += wf_result_add(ls_item, "1. get original StyleLowerd! ", not isnull(lbs_rtn) and lbs_rtn = lbs_val)
			
			//set to StyleBox!
			lbs_val = StyleBox!
			rte_1.borderstyle = lbs_val
			lbs_rtn = rte_1.borderstyle
			ls_result += wf_result_add(ls_item, "2. set to StyleBox! ", not isnull(lbs_rtn) and lbs_rtn = lbs_val)
			
			//set to styleRaised!
			lbs_val = styleRaised!
			rte_1.borderstyle = lbs_val
			lbs_rtn = rte_1.borderstyle
			ls_result += wf_result_add(ls_item, "3. set to styleRaised! ", not isnull(lbs_rtn) and lbs_rtn = lbs_val)
			
			//set to styleShadowBox!
			lbs_val = styleShadowBox!
			rte_1.borderstyle = lbs_val
			lbs_rtn = rte_1.borderstyle
			ls_result += wf_result_add(ls_item, "4. set to styleShadowBox! ", not isnull(lbs_rtn) and lbs_rtn = lbs_val)
			
			//set to StyleLowered!
			lbs_val = StyleLowered!
			rte_1.borderstyle = lbs_val
			lbs_rtn = rte_1.borderstyle
			ls_result += wf_result_add(ls_item, "5. set to StyleLowered! ", not isnull(lbs_rtn) and lbs_rtn = lbs_val)
			
		case lower("BottomMargin")	
			li_rtn =  rte_1.bottommargin
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(li_rtn) and li_rtn = 0)			
			
			//set to -100
			li_rtn = 0 
			rte_1.BottomMargin = -100
			li_rtn =  rte_1.bottommargin
			ls_result += wf_result_add(ls_item, "2. set to -100 ", not isnull(li_rtn) and li_rtn = -100)			
			
			//set to 500
			rte_1.BottomMargin = 500
			li_rtn =  rte_1.bottommargin
			ls_result += wf_result_add(ls_item, "3. set to 500 ", not isnull(li_rtn) and li_rtn = 500)
			
			//set to 950
			rte_1.BottomMargin = 950
			li_rtn =  rte_1.bottommargin
			ls_result += wf_result_add(ls_item, "4. set to 950 ", not isnull(li_rtn) and li_rtn = 950)
			
			//set to 0
			rte_1.BottomMargin = 0
			li_rtn =  rte_1.bottommargin
			ls_result += wf_result_add(ls_item, "5. set to 0 ", not isnull(li_rtn) and li_rtn = 0)
			
		case lower("BringToTop")	
			//get original false
			lbn_rtn = rte_1.BringToTop
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.BringToTop = true
			lbn_rtn = rte_1.BringToTop
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
						
			//set false
			rte_1.BringToTop = false
			lbn_rtn = rte_1.BringToTop
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("ClassDefinition")	
			Setnull(lpo_object )
			lpo_object = rte_1.ClassDefinition
			ls_result += wf_result_add(ls_item, " 1.get orginal ", isvalid(lpo_object ))			
			
		case lower("ControlCharsVisible")	
			//get original false
			lbn_rtn = rte_1.ControlCharsVisible
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.ControlCharsVisible = true
			lbn_rtn = rte_1.ControlCharsVisible
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
						
			//set false
			rte_1.ControlCharsVisible = false
			lbn_rtn = rte_1.ControlCharsVisible
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("DisplayOnly")	
			//get original false
			lbn_rtn = rte_1.DisplayOnly
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.DisplayOnly = true
			lbn_rtn = rte_1.DisplayOnly
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
						
			//set false
			rte_1.DisplayOnly = false
			lbn_rtn = rte_1.DisplayOnly
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("DocumentName")	
			ls_temp = rte_1.DocumentName
			ls_result += wf_result_add(ls_item, "1. get default ", isnull(ls_temp) or trim(ls_temp) = "")
			
			rte_1.DocumentName = "Report 1"
			ls_temp = rte_1.DocumentName
			ls_result += wf_result_add(ls_item, "2. set report ", not isnull(ls_temp) and ls_temp = "Report 1")
			
			rte_1.DocumentName = ""
			ls_temp = rte_1.DocumentName
			ls_result += wf_result_add(ls_item, "3. set default ", not isnull(ls_temp) and ls_temp = "")
		case lower("DragAuto")	
			//get original false
			lbn_rtn = rte_1.DragAuto
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.DragAuto = true
			lbn_rtn = rte_1.DragAuto
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
						
			//set false
			rte_1.DragAuto = false
			lbn_rtn = rte_1.DragAuto
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("DragIcon")	
			ls_temp = string(rte_1.dragicon )
			ls_result += wf_result_add(ls_item, " 1. get default ",  isnull(ls_temp) or ls_temp = "" )				
			
			rte_1.dragicon = "Question!"
			ls_temp = rte_1.dragicon
			ls_result += wf_result_add(ls_item, " 2. set Question ", not isnull(ls_temp) and ls_temp = "Question!" )				

			rte_1.dragicon = "error!"
			ls_temp = rte_1.dragicon
			ls_result += wf_result_add(ls_item, " 3. set error ", not isnull(ls_temp) and ls_temp = "error!" )		
			
			rte_1.dragicon = ".\pbex.ico!"
			ls_temp = rte_1.dragicon
			ls_result += wf_result_add(ls_item, " 4. set .\pbex.ico ", not isnull(ls_temp) and ls_temp = ".\pbex.ico!" )
			
			rte_1.dragicon = ""
			ls_temp = rte_1.dragicon
			ls_result += wf_result_add(ls_item, " 5. set default ", not isnull(ls_temp) and ls_temp = "" )
						
		case lower("Enabled")	
			//get original true
			lbn_rtn = rte_1.Enabled
			ls_result += wf_result_add(ls_item, "1. get original true ", not isnull(lbn_rtn) and lbn_rtn = true)
			
			//set false
			rte_1.Enabled = false
			lbn_rtn = rte_1.Enabled
			ls_result += wf_result_add(ls_item, "2. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
						
			//set true
			rte_1.Enabled = true
			lbn_rtn = rte_1.Enabled
			ls_result += wf_result_add(ls_item, "3. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
			
		case lower("FaceName")	
			ls_temp = rte_1.FaceName
			ls_result += wf_result_add(ls_item, " 1. Get default ", not isnull(ls_temp) and ls_temp = "Tahoma")
			
			rte_1.FaceName = "Arial"
			ls_temp = ""
			ls_temp = rte_1.FaceName
			ls_result += wf_result_add(ls_item, " 2. set Arial ", not isnull(ls_temp) and ls_temp = "Arial")
			
			rte_1.FaceName ="Courier"
			ls_temp = ""
			ls_temp = rte_1.FaceName
			ls_result += wf_result_add(ls_item, " 3. set Courier ", not isnull(ls_temp) and ls_temp = "Courier")		
			
			rte_1.FaceName ="Tahoma"
			ls_temp = ""
			ls_temp = rte_1.FaceName
			ls_result += wf_result_add(ls_item, " 4. set default ", not isnull(ls_temp) and ls_temp = "Tahoma")			
		case lower("FontCharSet")	
			lany_object = rte_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 1. get default ", not isnull(lany_object) and lany_object = ANSI!)
			
			setnull(lany_object)
			rte_1.FontCharSet = HEBREWCHARSET!
			lany_object = rte_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 2. Set  HEBREWCHARSET ", not isnull(lany_object) and lany_object = HEBREWCHARSET!)
			
			setnull(lany_object)
			rte_1.FontCharSet = ARABICCHARSET!
			lany_object = rte_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 3. Set  ARABICCHARSET ", not isnull(lany_object) and lany_object = ARABICCHARSET!)
			
			setnull(lany_object)
			rte_1.FontCharSet = GREEKCHARSET!
			lany_object = rte_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 4. Set  GREEKCHARSET ", not isnull(lany_object) and lany_object = GREEKCHARSET!)
			
			setnull(lany_object)
			rte_1.FontCharSet = TURKISHCHARSET!
			lany_object = rte_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 5. Set  TURKISHCHARSET ", not isnull(lany_object) and lany_object = TURKISHCHARSET!)
			
			setnull(lany_object)
			rte_1.FontCharSet = BALTICCHARSET!
			lany_object = rte_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 6. Set  BALTICCHARSET ", not isnull(lany_object) and lany_object = BALTICCHARSET!)	
			
			setnull(lany_object)
			rte_1.FontCharSet = THAICHARSET!
			lany_object = rte_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 7. Set  THAICHARSET ", not isnull(lany_object) and lany_object = THAICHARSET!)	
			
			setnull(lany_object)
			rte_1.FontCharSet = VIETNAMESECHARSET!
			lany_object = rte_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 8. Set  VIETNAMESECHARSET ", not isnull(lany_object) and lany_object = VIETNAMESECHARSET!)	
			
			setnull(lany_object)
			rte_1.FontCharSet = ANSI!
			lany_object = rte_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 9. Set  ANSI ", not isnull(lany_object) and lany_object = ANSI!)	
		case lower("FontFamily")	
			lany_object = rte_1.fontfamily
			ls_result += wf_result_add(ls_item, " 1. get default ", not isnull(lany_object) and lany_object = Swiss!)
		case lower("FontPitch")	
			lany_object = rte_1.fontpitch
			ls_result += wf_result_add(ls_item, " 1. get default ", not isnull(lany_object) and lany_object = Variable!)
		case lower("HeaderFooter")	
			//get original false
			lbn_rtn = rte_1.headerfooter
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//change
			rte_1.headerfooter = true
			lbn_rtn = rte_1.headerfooter
			ls_result += wf_result_add(ls_item, "2. couldn't change ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("Height")	
			ll_tmp =  rte_1.Height
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ll_tmp) and ll_tmp = 1316)	
			
			//set to -10 once
			rte_1.Height = -10
			ll_tmp = rte_1.Height
			ls_result += wf_result_add(ls_item, "2. set to -10 once ", not isnull(ll_tmp) and ll_tmp = 0)
			
			//set to -10 twice
			rte_1.Height = -10
			rte_1.Height = -10
			ll_tmp = rte_1.Height
			ls_result += wf_result_add(ls_item, "3. set to -10 twice ", not isnull(ll_tmp) and ll_tmp = -10)
			
			//set to 0
			rte_1.Height = 0
			ll_tmp = rte_1.Height
			ls_result += wf_result_add(ls_item, "4. set to 0 ", not isnull(ll_tmp) and ll_tmp = 0)
			
			//set to 32765
			rte_1.Height = 32765
			ll_tmp = rte_1.Height     //return 32764
			ls_result += wf_result_add(ls_item, "5. set to 32765 ", not isnull(ll_tmp) and ll_tmp = 32764 )  
			
			//set to 32767
			rte_1.Height = 32767
			ll_tmp = rte_1.Height     //return -32768
			ls_result += wf_result_add(ls_item, "6. set to 32767 ", not isnull(ll_tmp) and ll_tmp = -32768 ) 
			
			//set to 200
			rte_1.Height = 200
			ll_tmp = rte_1.Height     //return 200
			ls_result += wf_result_add(ls_item, "7. set to 200 ", not isnull(ll_tmp) and ll_tmp = 200 ) 
			
			rte_1.Height = 1316
			ll_tmp = rte_1.Height     //return 1316
			ls_result += wf_result_add(ls_item, "8. set to 1316 ", not isnull(ll_tmp) and ll_tmp = 1316 ) 

		case lower("HScrollBar")	
			//get original false
			lbn_rtn = rte_1.HScrollBar
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.HScrollBar = true
			lbn_rtn = rte_1.HScrollBar
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
			
			//set false
			rte_1.HScrollBar = false
			lbn_rtn = rte_1.HScrollBar
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("ImeMode")	
		//
		case lower("InputFieldBackColor")				
			//PB12.6有bug，先设置color再插入inputfield，界面颜色不生效，必须再改color才生效
//			rte_1.InputFieldInsert("FirstName")
//			rte_1.InputFieldInsert("LastName")
			ll_tmp =  rte_1.inputfieldbackcolor
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ll_tmp) and ll_tmp = 16777215)	
			
			//set 56665 
			rte_1.inputfieldbackcolor = 56665
			ll_tmp = rte_1.inputfieldbackcolor
			ls_result += wf_result_add(ls_item, "2. set 56665 ", not isnull(ll_tmp) and ll_tmp = 56665 )
			
			//set -3
			rte_1.inputfieldbackcolor = -3     
			ll_tmp = rte_1.inputfieldbackcolor     //return 0,black
			ls_result += wf_result_add(ls_item, "3. set -3 ", not isnull(ll_tmp) and ll_tmp = 0 )
			
			//set 0
			rte_1.inputfieldbackcolor = 0     
			ll_tmp = rte_1.inputfieldbackcolor     //return 0,black
			ls_result += wf_result_add(ls_item, "4. set 0 ", not isnull(ll_tmp) and ll_tmp = 0 )
		
			//set 255
			rte_1.inputfieldbackcolor = 255     
			ll_tmp = rte_1.inputfieldbackcolor     //return 255 ,red
			ls_result += wf_result_add(ls_item, "5. set 255 ", not isnull(ll_tmp) and ll_tmp = 255 )
			
			//set 16777216
			rte_1.inputfieldbackcolor = 16777216     
			ll_tmp = rte_1.inputfieldbackcolor     //return 0,black
			ls_result += wf_result_add(ls_item, "6. set 16777216 ", not isnull(ll_tmp) and ll_tmp = 0 )
			
			//set 16777215
			rte_1.inputfieldbackcolor = 16777215     
			ll_tmp = rte_1.inputfieldbackcolor     //return 16777215, white
			ls_result += wf_result_add(ls_item, "7. set 16777215 ", not isnull(ll_tmp) and ll_tmp = 16777215 )
		
		case lower("InputFieldNamesVisible")	
			//inputfieldsvisible must be true
			rte_1.inputfieldsvisible = true
			
			//get original false
			lbn_rtn = rte_1.InputFieldNamesVisible
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.InputFieldNamesVisible = true
			lbn_rtn = rte_1.InputFieldNamesVisible
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
			
			//set false
			rte_1.InputFieldNamesVisible = false
			lbn_rtn = rte_1.InputFieldNamesVisible
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)			
		case lower("InputFieldsVisible")	
			//get original false
			lbn_rtn = rte_1.InputFieldsVisible
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.InputFieldsVisible = true
			lbn_rtn = rte_1.InputFieldsVisible
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
			
			//set false
			rte_1.InputFieldsVisible = false
			lbn_rtn = rte_1.InputFieldsVisible
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("Italic")	
			//get original false
			lbn_rtn = rte_1.italic
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.italic = true
			lbn_rtn = rte_1.italic
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
			
			//set false
			rte_1.italic = false
			lbn_rtn = rte_1.italic
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("LeftMargin")	
			//
			ll_tmp =  rte_1.LeftMargin
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ll_tmp) and ll_tmp = 0)		
			
			rte_1.LeftMargin = -100
			ll_tmp =  rte_1.LeftMargin
			ls_result += wf_result_add(ls_item, "2. set to -100 ", not isnull(ll_tmp) and ll_tmp = -100)			
			
			//set to 500
			rte_1.LeftMargin = 500
			ll_tmp =  rte_1.LeftMargin
			ls_result += wf_result_add(ls_item, "3. set to 500 ", not isnull(ll_tmp) and ll_tmp = 500)
			
			//set to 950
			rte_1.LeftMargin = 950
			ll_tmp =  rte_1.LeftMargin
			ls_result += wf_result_add(ls_item, "4. set to 950 ", not isnull(ll_tmp) and ll_tmp = 950)
			
			//set to 0
			rte_1.LeftMargin = 0
			ll_tmp =  rte_1.LeftMargin
			ls_result += wf_result_add(ls_item, "5. set to 0 ", not isnull(ll_tmp) and ll_tmp = 0)
			
		case lower("Modified")	
			//get original true
			lbn_rtn = rte_1.Modified
			ls_result += wf_result_add(ls_item, " get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set false
			rte_1.Modified = true
			lbn_rtn = rte_1.Modified
			ls_result += wf_result_add(ls_item, " set true ", not isnull(lbn_rtn) and lbn_rtn = true)
						
			//set true
			rte_1.Modified = false
			lbn_rtn = rte_1.Modified
			ls_result += wf_result_add(ls_item, " set false ", not isnull(lbn_rtn) and lbn_rtn = false)
		case lower("PaperHeight")		
			ll_tmp =0 
			ll_tmp =  rte_1.paperheight
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ll_tmp) and ll_tmp = 27940)		
			
			rte_1.paperheight = -100
			ll_tmp =  rte_1.paperheight
			ls_result += wf_result_add(ls_item, "2. cannot set change ", not isnull(ll_tmp) and ll_tmp = 27940)		
			
		case lower("PaperOrientation")	
			setnull(lany_object)
			lany_object = rte_1.PaperOrientation
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(lany_object) and lany_object = PaperPortrait!)		
			
			setnull(lany_object)
			rte_1.PaperOrientation = PaperLandscape!
			lany_object = rte_1.PaperOrientation
			ls_result += wf_result_add(ls_item, "2. set PaperLandscape ", not isnull(lany_object) and lany_object = PaperLandscape!)		
			
			setnull(lany_object)
			rte_1.PaperOrientation = PaperPortrait!
			lany_object = rte_1.PaperOrientation
			ls_result += wf_result_add(ls_item, "3. set PaperPortrait ", not isnull(lany_object) and lany_object = PaperPortrait!)		
			
		case lower("PaperWidth")	
			ll_tmp = 0
			ll_tmp =  rte_1.paperwidth
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ll_tmp) and ll_tmp = 21590)		
			
			rte_1.paperwidth = -100
			ll_tmp =  rte_1.paperwidth
			ls_result += wf_result_add(ls_item, "2. cannot set change ", not isnull(ll_tmp) and ll_tmp = 21590)		
		case lower("PicturesAsFrame")	
			//get original false
			lbn_rtn = rte_1.PicturesAsFrame
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.PicturesAsFrame = true
			lbn_rtn = rte_1.PicturesAsFrame
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
						
			//set false
			rte_1.PicturesAsFrame = false
			lbn_rtn = rte_1.PicturesAsFrame
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("Pointer")	
			//get original
			ls_temp = "ARROW!"
			ls_rtn = rte_1.Pointer
			ls_result += wf_result_add(ls_item, "1. get original ", not isnull(ls_rtn) and ls_rtn = ls_temp)
			
			//set NOVALID
			ls_temp = 'NOVALID'
			rte_1.Pointer = ls_temp
			ls_rtn = rte_1.Pointer
			ls_result += wf_result_add(ls_item, "2. set NOVALID ", not isnull(ls_rtn) and ls_rtn = ls_temp)
						
			//set HYPERLINK!
			ls_temp = 'HYPERLINK!'
			rte_1.Pointer = ls_temp
			ls_rtn = rte_1.Pointer
			ls_result += wf_result_add(ls_item, "3. set HYPERLINK! ", not isnull(ls_rtn) and ls_rtn = ls_temp)
			
			//set ICON!
			ls_temp = 'ICON!'
			rte_1.Pointer = ls_temp
			ls_rtn = rte_1.Pointer
			ls_result += wf_result_add(ls_item, "4. set ICON! ", not isnull(ls_rtn) and ls_rtn = ls_temp)
			
			//set SIZE!
			ls_temp = 'SIZE!'
			rte_1.Pointer = ls_temp
			ls_rtn = rte_1.Pointer
			ls_result += wf_result_add(ls_item, "5. set SIZE! ", not isnull(ls_rtn) and ls_rtn = ls_temp)
			
			//set ARROW!
			ls_temp = 'ARROW!'
			rte_1.Pointer = ls_temp
			ls_rtn = rte_1.Pointer
			ls_result += wf_result_add(ls_item, "6. set ARROW! ", not isnull(ls_rtn) and ls_rtn = ls_temp)						
		case lower("PopMenu")	
			//get original false
			lbn_rtn = rte_1.PopMenu
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.PopMenu = true
			lbn_rtn = rte_1.PopMenu
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
						
			//set false
			rte_1.PopMenu = false
			lbn_rtn = rte_1.PopMenu
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("Resizable")	
			//get original false
			lbn_rtn = rte_1.Resizable
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.Resizable = true
			lbn_rtn = rte_1.Resizable
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)			
			
			//set false
			rte_1.Resizable = false
			lbn_rtn = rte_1.Resizable
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false) 
			
		case lower("RightMargin")				
			ll_tmp = 0
			ll_tmp =  rte_1.LeftMargin
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ll_tmp) and ll_tmp = 0)		
			
			//set to -100
			rte_1.RightMargin = -100
			ll_tmp =  rte_1.RightMargin
			ls_result += wf_result_add(ls_item, "2. set to -100 ", not isnull(ll_tmp) and ll_tmp = -100)			
			
			//set to 500
			rte_1.RightMargin = 500
			ll_tmp =  rte_1.RightMargin
			ls_result += wf_result_add(ls_item, "3. set to 500 ", not isnull(ll_tmp) and ll_tmp = 500)
			
			//set to 950
			rte_1.RightMargin = 950
			ll_tmp =  rte_1.RightMargin
			ls_result += wf_result_add(ls_item, "4. set to 950 ", not isnull(ll_tmp) and ll_tmp = 950)
			
			//set to 0
			rte_1.RightMargin = 0
			ll_tmp =  rte_1.RightMargin
			ls_result += wf_result_add(ls_item, "5. set to 0 ", not isnull(ll_tmp) and ll_tmp = 0)
			
		case lower("RulerBar")	
			//get original false
			lbn_rtn = rte_1.RulerBar
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.RulerBar = true
			lbn_rtn = rte_1.RulerBar
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
						
			//set false
			rte_1.RulerBar = false
			lbn_rtn = rte_1.RulerBar
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)

		case lower("SelectedStartPos")	
			ll_tmp = 0
			ll_tmp =  rte_1.selectedstartpos
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ll_tmp) and ll_tmp = 0)
			
			ls_temp2 ="About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			Clipboard(ls_temp2)
			ll_tmp = rte_1.paste( )
			
			rte_1.selecttextall( )
			ll_tmp = 0
			ll_tmp =  rte_1.selectedstartpos
			ls_result += wf_result_add(ls_item, "2. set ", not isnull(ll_tmp) and ll_tmp = 0)			
			
		case lower("SelectedTextLength")	
			ls_temp2 ="About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
 			ll_tmp = 0
			ll_tmp =  rte_1.selectedtextlength
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ll_tmp) and ll_tmp = len(ls_temp2))
						
			ls_temp2 ="About this Appeon for PowerBuilder Help:"			
			Clipboard(ls_temp2)
			ll_tmp = rte_1.paste( )
			
			rte_1.selecttextall( )
			ll_tmp = 0
			ll_tmp =  rte_1.selectedtextlength
			ls_result += wf_result_add(ls_item, "2. set ", not isnull(ll_tmp) and ll_tmp = len(ls_temp2))		
			
		case lower("StatusBar")	
			//get original false
			lbn_rtn = rte_1.StatusBar
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.StatusBar = true
			lbn_rtn = rte_1.StatusBar
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
						
			//set false
			rte_1.StatusBar = false
			lbn_rtn = rte_1.StatusBar
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("TabOrder")	
			li_rtn =  rte_1.TabOrder
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(li_rtn) and li_rtn = 10)	
			
			//set to -10
			rte_1.TabOrder = -10
			li_rtn = rte_1.TabOrder
			ls_result += wf_result_add(ls_item, "2. set to -10 ", not isnull(li_rtn) and li_rtn = -10)
			
			//set to 0
			rte_1.TabOrder = 0
			li_rtn = rte_1.TabOrder
			ls_result += wf_result_add(ls_item, "3. set to 0 ", not isnull(li_rtn) and li_rtn = 0)
			
			//set to 20
			rte_1.TabOrder = 20
			li_rtn = rte_1.TabOrder
			ls_result += wf_result_add(ls_item, "4. set to 20 ", not isnull(li_rtn) and li_rtn = 20)
			
			//set to 10
			rte_1.TabOrder = 10
			li_rtn = rte_1.TabOrder
			ls_result += wf_result_add(ls_item, "5. set to 10 ", not isnull(li_rtn) and li_rtn = 10)
		
		case lower("Tag")	
			ls_temp2= "1/1/1111/0.178/0.025/0.802/0.835/2624/1316/581/40/3273/1576/-12/"
			ls_temp = rte_1.Tag
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ls_temp) and ls_temp = ls_temp2)	

			rte_1.Tag = "set a tag"
			ls_temp = rte_1.Tag
			ls_result += wf_result_add(ls_item, "2. set tag ", not isnull(ls_temp) and ls_temp = "set a tag")
			
			rte_1.Tag = ls_temp2
			ls_temp = rte_1.Tag
			ls_result += wf_result_add(ls_item, "3. set tag to default ", not isnull(ls_temp) and ls_temp = ls_temp2)
						
		case lower("TextSize")	
			li_rtn = rte_1.textsize
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(li_rtn) and (li_rtn = 12 or li_rtn = -12))	
			
			rte_1.textsize = 72
			li_rtn = rte_1.textsize
			ls_result += wf_result_add(ls_item, "2. set to 72 ", not isnull(li_rtn) and li_rtn = 72)
			
			rte_1.textsize = 8
			li_rtn = rte_1.textsize
			ls_result += wf_result_add(ls_item, "3. set to 8 ", not isnull(li_rtn) and li_rtn = 8)

			rte_1.textsize = 12
			li_rtn = rte_1.textsize
			ls_result += wf_result_add(ls_item, "4. set to 12 ", not isnull(li_rtn) and li_rtn =12)			
		case lower("ToolBar")	
			//get original false
			lbn_rtn = rte_1.ToolBar
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.ToolBar = true
			lbn_rtn = rte_1.ToolBar
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
						
			//set false
			rte_1.ToolBar = false
			lbn_rtn = rte_1.ToolBar
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("TopMargin")	
			ll_tmp = 0
			ll_tmp =  rte_1.TopMargin
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ll_tmp) and ll_tmp = 0)		
			
			//set to -100
			rte_1.TopMargin = -100
			ll_tmp =  rte_1.TopMargin
			ls_result += wf_result_add(ls_item, "2. set to -100 ", not isnull(ll_tmp) and ll_tmp = -100)			
			
			//set to 500
			rte_1.TopMargin = 500
			ll_tmp =  rte_1.TopMargin
			ls_result += wf_result_add(ls_item, "3. set to 500 ", not isnull(ll_tmp) and ll_tmp = 500)
			
			//set to 950
			rte_1.TopMargin = 950
			ll_tmp =  rte_1.TopMargin
			ls_result += wf_result_add(ls_item, "4. set to 950 ", not isnull(ll_tmp) and ll_tmp = 950)
			
			//set to 0
			rte_1.TopMargin = 0
			ll_tmp =  rte_1.TopMargin
			ls_result += wf_result_add(ls_item, "5. set to 0 ", not isnull(ll_tmp) and ll_tmp = 0)
			
		case lower("Underline")	
			//get original false
			lbn_rtn = rte_1.underline
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.underline = true
			lbn_rtn = rte_1.underline
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
						
			//set false
			rte_1.underline = false
			lbn_rtn = rte_1.underline
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
		case lower("Visible")	
			//get original true
			lbn_rtn = rte_1.Visible
			ls_result += wf_result_add(ls_item, "1. get original true ", not isnull(lbn_rtn) and lbn_rtn = true)
			
			//set false
			rte_1.Visible = false
			lbn_rtn = rte_1.Visible
			ls_result += wf_result_add(ls_item, "2. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
						
			//set true
			rte_1.Visible = true
			lbn_rtn = rte_1.Visible
			ls_result += wf_result_add(ls_item, "3. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
			
		case lower("VScrollBar")	
			//get original false
			lbn_rtn = rte_1.VScrollBar
			ls_result += wf_result_add(ls_item, "1. get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.VScrollBar = true
			lbn_rtn = rte_1.VScrollBar
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(lbn_rtn) and lbn_rtn = true)
						
			//set false
			rte_1.VScrollBar = false
			lbn_rtn = rte_1.VScrollBar
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("Weight")	
			li_rtn =  rte_1.weight
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(li_rtn) and li_rtn = 400)		
			
			//set to 700
			rte_1.weight = 700
			li_rtn =  rte_1.weight
			ls_result += wf_result_add(ls_item, "2. set to 700 ", not isnull(li_rtn) and li_rtn = 700)		
			
			rte_1.weight = 400
			li_rtn =  rte_1.weight
			ls_result += wf_result_add(ls_item, "3. set to 0 ", not isnull(li_rtn) and li_rtn = 400)		
			
		case lower("Width")	
			li_rtn =  rte_1.Width
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(li_rtn) and li_rtn = 2624)		
			
			//set to -10 once
			rte_1.Width = -10
			li_rtn = rte_1.Width
			ls_result += wf_result_add(ls_item, "2. set to -10 once ", not isnull(li_rtn) and li_rtn = 0)
			
			//set to -10 twice
			rte_1.Width = -10
			rte_1.Width = -10
			li_rtn = rte_1.Width
			ls_result += wf_result_add(ls_item, "3. set to -10 twice ", not isnull(li_rtn) and li_rtn = -10)
			
			//set to 0
			rte_1.Width = 0
			li_rtn = rte_1.Width
			ls_result += wf_result_add(ls_item, "4. set to 0 ", not isnull(li_rtn) and li_rtn = 0)
			
			//set to 32765
			rte_1.Width = 32765
			li_rtn = rte_1.Width     //return 32764
			ls_result += wf_result_add(ls_item, "5. set to 32765 ", not isnull(li_rtn) and li_rtn = 32764 )  
			
			//set to 32767
			rte_1.Width = 32767
			li_rtn = rte_1.Width     //return -32768
			ls_result += wf_result_add(ls_item, "6. set to 32767 ", not isnull(li_rtn) and li_rtn = -32768 ) 
			
			//set to 2624
			rte_1.Width = 2624
			li_rtn = rte_1.Width     //return 2000
			ls_result += wf_result_add(ls_item, "7. set to 2624 ", not isnull(li_rtn) and li_rtn = 2624 )
			
		case lower("WordWrap")	
			//get original false
			lbn_rtn = rte_1.WordWrap
			ls_result += wf_result_add(ls_item, " get original false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
			//set true
			rte_1.WordWrap = true
			lbn_rtn = rte_1.WordWrap
			ls_result += wf_result_add(ls_item, " set true ", not isnull(lbn_rtn) and lbn_rtn = true)
						
			//set false
			rte_1.WordWrap = false
			lbn_rtn = rte_1.WordWrap
			ls_result += wf_result_add(ls_item, " set false ", not isnull(lbn_rtn) and lbn_rtn = false)
			
		case lower("X")	
			li_rtn =  rte_1.X
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(li_rtn) and li_rtn = 581)		
			
			//set to -100
			rte_1.X = -100
			li_rtn = rte_1.X
			ls_result += wf_result_add(ls_item, "2. set to -100 ", not isnull(li_rtn) and li_rtn = -100)
			
			//set to 500
			rte_1.X = 500
			li_rtn = rte_1.X
			ls_result += wf_result_add(ls_item, "3. set to 500 ", not isnull(li_rtn) and li_rtn = 500)
			
			//set to 32765
			rte_1.X = 32765
			li_rtn = rte_1.X     //return 32764
			ls_result += wf_result_add(ls_item, "4. set to 32765 ", not isnull(li_rtn) and li_rtn = 32764 )  
			
			//set to 32767
			rte_1.X = 32767
			li_rtn = rte_1.X     //return -32768
			ls_result += wf_result_add(ls_item, "5. set to 32767 ", not isnull(li_rtn) and li_rtn = -32768 )
			
			//set to 0
			rte_1.X = 0
			li_rtn = rte_1.X
			ls_result += wf_result_add(ls_item, "6. set to 0 ", not isnull(li_rtn) and li_rtn = 0)
			
			rte_1.X = 581
			li_rtn = rte_1.X
			ls_result += wf_result_add(ls_item, "7. set to 581 ", not isnull(li_rtn) and li_rtn = 581)
			
		case lower("Y")	
			li_rtn =  rte_1.Y
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(li_rtn) and li_rtn = 40)	
			
			//set to -100
			rte_1.Y = -100
			li_rtn = rte_1.Y
			ls_result += wf_result_add(ls_item, "2. set to -100 ", not isnull(li_rtn) and li_rtn = -100)
			
			//set to 500
			rte_1.Y = 500
			li_rtn = rte_1.Y
			ls_result += wf_result_add(ls_item, "3. set to 500 ", not isnull(li_rtn) and li_rtn = 500)
			
			//set to 32765
			rte_1.Y = 32765
			li_rtn = rte_1.Y     //return 32764
			ls_result += wf_result_add(ls_item, "4. set to 32765 ", not isnull(li_rtn) and li_rtn = 32764 )  
			
			//set to 32767
			rte_1.Y = 32767
			li_rtn = rte_1.Y     //return -32768
			ls_result += wf_result_add(ls_item, "5. set to 32767 ", not isnull(li_rtn) and li_rtn = -32768 )
			
			//set to 0
			rte_1.Y = 0
			li_rtn = rte_1.Y
			ls_result += wf_result_add(ls_item, "6. set to 0 ", not isnull(li_rtn) and li_rtn = 0)
		
			rte_1.Y = 40
			li_rtn = rte_1.Y
			ls_result += wf_result_add(ls_item, "7. set to 40 ", not isnull(li_rtn) and li_rtn = 40)
		case lower("")	
		
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

dragobject ldgo_source

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "Constructor"
ls_array[Upperbound(ls_array) + 1 ] = "Destructor"
ls_array[Upperbound(ls_array) + 1 ] = "DoubleClicked"
ls_array[Upperbound(ls_array) + 1 ] = "DragDrop"
ls_array[Upperbound(ls_array) + 1 ] = "DragEnter"
ls_array[Upperbound(ls_array) + 1 ] = "DragLeave"
ls_array[Upperbound(ls_array) + 1 ] = "DragWithin"
ls_array[Upperbound(ls_array) + 1 ] = "FileExists"
ls_array[Upperbound(ls_array) + 1 ] = "GetFocus"
ls_array[Upperbound(ls_array) + 1 ] = "Help"
ls_array[Upperbound(ls_array) + 1 ] = "InputFieldSelected"
ls_array[Upperbound(ls_array) + 1 ] = "Key"
ls_array[Upperbound(ls_array) + 1 ] = "LoseFocus"
ls_array[Upperbound(ls_array) + 1 ] = "Modified"
ls_array[Upperbound(ls_array) + 1 ] = "MouseDown"
ls_array[Upperbound(ls_array) + 1 ] = "MouseMove"
ls_array[Upperbound(ls_array) + 1 ] = "MouseUp"
ls_array[Upperbound(ls_array) + 1 ] = "Other"
ls_array[Upperbound(ls_array) + 1 ] = "PictureSelected"
ls_array[Upperbound(ls_array) + 1 ] = "RButtonDown"
ls_array[Upperbound(ls_array) + 1 ] = "RButtonUp"


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
		case lower("Constructor")
			rte_1.event constructor( )
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('Constructor event')) > 0)	
		case lower("Destructor")
			rte_1.event destructor( )
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('Destructor event')) > 0)	
		case lower("DoubleClicked")
			rte_1.event doubleclicked( )
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('DoubleClicked event')) > 0)	
		case lower("DragDrop")
			rte_1.event dragdrop( rte_1)
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('DragDrop event')) > 0)	
		case lower("DragEnter")
			rte_1.event dragenter( rte_1)
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('DragEnter event')) > 0)	
		case lower("DragLeave")
			rte_1.event dragleave( rte_1)
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('DragLeave event')) > 0)	
		case lower("DragWithin")
			rte_1.event dragwithin( rte_1)
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('DragWithin event')) > 0)	
		case lower("FileExists")
			rte_1.event fileexists( "richtext control file.pdf")
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('FileExists event')) > 0)	
		case lower("GetFocus")
			rte_1.event getfocus( )
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('GetFocus event')) > 0)	
		case lower("Help")
			rte_1.event help( 100, 100)
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('Help event')) > 0)	
		case lower("InputFieldSelected")
			rte_1.event inputfieldselected( "richtext control file.pdf")
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('InputFieldSelected event')) > 0)	
		case lower("Key")
			rte_1.event key( KeyF1!, 1)
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('Key event')) > 0)	
		case lower("LoseFocus")
			rte_1.event losefocus( )
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('LoseFocus event')) > 0)	
		case lower("Modified")
			rte_1.event modified( )
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('Modified event')) > 0)	
		case lower("MouseDown")
			rte_1.event mousedown( )
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('MouseDown event')) > 0)	
		case lower("MouseMove")
			rte_1.event mousemove( )
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('MouseMove event')) > 0)	
		case lower("MouseUp")
			rte_1.event mouseup( )
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('MouseUp event')) > 0)				
		case lower("Other")
			rte_1.event other( 61458, 0)
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('Other event')) > 0)				
		case lower("PictureSelected")
			rte_1.event pictureselected( )
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('PictureSelected event')) > 0)				
		case lower("RButtonDown")
			rte_1.event rbuttondown( )
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('RButtonDown event')) > 0)				
		case lower("RButtonUp")		
			rte_1.event rbuttonup( )
			ls_result += wf_result_add(ls_item, " event ", not isnull(is_log) and pos(lower(is_log), lower('RButtonUp event')) > 0)				
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

Band     						lb_band
datastore					lds_tmp
Datawindowchild			ldw_Child
Dragmodes  				ldm_mode
alignment 					lam_align
PowerObject				lpo_powerobject
ParagraphSetting   		lps_set
spacing 						l_spacing
location    					ll_location
FileType						lft_FileType

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_file ="PUB_BMP_BT_EMP.bmp"
ls_fullname = gs_cachedir+gs_dirseparator+ls_file
if not FileExists(ls_fullname)  then 
	if isvalid(w_controller) then 					
		w_controller.of_createfile(ls_fullname, sqlca)
		if not FileExists(ls_fullname)  then 
			ls_result += wf_result_add(ls_item, " PUB_BMP_BT_EMP.bmp FileExists ", false )
		end if 
	else
		ls_result += wf_result_add(ls_item, " PUB_BMP_BT_EMP.bmp FileExists ", false )
	end if 
end if 
			
//this.visible = true 			//for debug

ls_array[Upperbound(ls_array) + 1 ] = "CanUndo"
ls_array[Upperbound(ls_array) + 1 ] = "ClassName"
ls_array[Upperbound(ls_array) + 1 ] = "Clear"
ls_array[Upperbound(ls_array) + 1 ] = "ClearAll"
ls_array[Upperbound(ls_array) + 1 ] = "Copy"
ls_array[Upperbound(ls_array) + 1 ] = "CopyRTF"
ls_array[Upperbound(ls_array) + 1 ] = "Cut"
ls_array[Upperbound(ls_array) + 1 ] = "DataSource"
ls_array[Upperbound(ls_array) + 1 ] = "Drag"
ls_array[Upperbound(ls_array) + 1 ] = "Find"
ls_array[Upperbound(ls_array) + 1 ] = "FindNext"
ls_array[Upperbound(ls_array) + 1 ] = "GetAlignment"
ls_array[Upperbound(ls_array) + 1 ] = "GetContextService"
ls_array[Upperbound(ls_array) + 1 ] = "GetParagraphSetting"
ls_array[Upperbound(ls_array) + 1 ] = "GetParent"
ls_array[Upperbound(ls_array) + 1 ] = "GetSpacing"
ls_array[Upperbound(ls_array) + 1 ] = "GetTextColor"
ls_array[Upperbound(ls_array) + 1 ] = "GetTextStyle"
ls_array[Upperbound(ls_array) + 1 ] = "Hide"
ls_array[Upperbound(ls_array) + 1 ] = "InputFieldChangeData"
ls_array[Upperbound(ls_array) + 1 ] = "InputFieldCurrentName"
ls_array[Upperbound(ls_array) + 1 ] = "InputFieldDeleteCurrent"
ls_array[Upperbound(ls_array) + 1 ] = "InputFieldGetData"
ls_array[Upperbound(ls_array) + 1 ] = "InputFieldInsert"
ls_array[Upperbound(ls_array) + 1 ] = "InputFieldLocate"
ls_array[Upperbound(ls_array) + 1 ] = "InsertDocument"
ls_array[Upperbound(ls_array) + 1 ] = "InsertPicture"
ls_array[Upperbound(ls_array) + 1 ] = "IsPreview"

	
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
		case lower("CanUndo")
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'	
			rte_1.SelectTextAll (detail! )
			rte_1.Clear( )
			rte_1.SelectText(1,1,0,0,detail!)
			Clipboard(ls_temp2)
			rte_1.paste()
			
			rte_1.selecttext(1,5,2,10)
			ls_temp = rte_1.selectedtext( )
			rte_1.cut()			
			
			rte_1.UndoDepth = 5
			lbn_flag = rte_1.CanUndo()
			ls_result += wf_result_add(ls_item, "1. true ", not isnull(lbn_flag) and lbn_flag = true)		
			
			rte_1.selecttext(1,5,2,10)
			ls_temp = rte_1.selectedtext( )
			rte_1.cut()
			
			rte_1.UndoDepth = 1
			rte_1.Undo()
			lbn_flag = rte_1.CanUndo()
			ls_result += wf_result_add(ls_item, "2. no usefull with UndoDepth ", not isnull(lbn_flag) and lbn_flag = true)		//false 		// Obsolete property 			
		case lower("ClassName")
			ls_temp = rte_1.ClassName()
			ls_result += wf_result_add(ls_item, "1. get name ", not isnull(ls_temp) and ls_temp = "rte_1")
		case lower("Clear")
			rte_1.selecttext(7,5,8,10)
			ls_temp = rte_1.selectedtext( )
			ll_tmp = rte_1.Clear()
			ls_result += wf_result_add(ls_item, "1. text ", not isnull(ll_tmp) and ll_tmp = len(ls_temp))
									
			rte_1.SelectText(5,1,5,1,detail!)
			rte_1.InsertPicture(ls_fullname)			
			rte_1.SelectTextLine()
			ls_temp = rte_1.selectedtext( )
			ll_tmp = rte_1.Clear()
			ls_result += wf_result_add(ls_item, "2. picture ", not isnull(ll_tmp) and ll_tmp = len(ls_temp))
			
			rte_1.selecttext(1,1,1,1)
			rte_1.InsertPicture(ls_fullname)
			rte_1.selecttext(1,1,1,2)
			ls_temp = rte_1.selectedtext( )
			ll_tmp = rte_1.Clear()
			ls_result += wf_result_add(ls_item, "3. picture only ", not isnull(ll_tmp) and ll_tmp = len(ls_temp))
			
			rte_1.SelectTextAll (Detail! )
			rte_1.Clear( )
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			rte_1.SelectTextAll (Detail! )
			ls_temp = rte_1.selectedtext( )
			ll_tmp = rte_1.Clear()
			ls_result += wf_result_add(ls_item, "4. textall ", not isnull(ll_tmp) and ll_tmp > 0)
			
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'	
			rte_1.SelectText(1,1,0,0,detail!)
			Clipboard(ls_temp2)
			rte_1.paste()
			
			rte_1.SelectText(5,1,0,0)
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			rte_1.SelectTextLine()
			ls_temp = rte_1.selectedtext( )
			ll_tmp = rte_1.Clear()
			ls_result += wf_result_add(ls_item, "5. include InputField and text ", not isnull(ll_tmp) and ll_tmp >0 )		
			
			rte_1.SelectText(rte_1.LineCount(),1,0,0,detail!)
			rte_1.SelectText(rte_1.LineCount(),rte_1.LineLength() + 1,0,0,detail!)	
			ls_temp = rte_1.selectedtext( )
			ll_tmp = rte_1.Clear()
			ls_result += wf_result_add(ls_item, "6. no select text ", not isnull(ll_tmp) and ll_tmp = len(ls_temp))		
			
			rte_1.selecttext(1,1,1,1)
			rte_1.InsertPicture(ls_fullname)
			
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			rte_1.InputFieldChangeData ("ID", '005')
			rte_1.SelectTextLine()
			ls_temp = rte_1.selectedtext( )
			ll_tmp = rte_1.Clear()
			ls_result += wf_result_add(ls_item, "7. include inputfiled \ text \ picture", not isnull(ll_tmp) and ll_tmp = len(ls_temp))		
		case lower("ClearAll")
			rte_1.selecttext(1,1,1,1)
			ll_tmp = rte_1.clearall( )
			ls_result += wf_result_add(ls_item, "1. select 1 ", not isnull(ll_tmp) and ll_tmp > 0 )		
			
			ll_tmp  = 0 
			ll_tmp = rte_1.clearall( )
			ls_result += wf_result_add(ls_item, "2. again ", not isnull(ll_tmp) and ll_tmp = 0 )		
			
		case lower("Copy")
			//测试Copy函数，无选中内容		
			Clipboard("")
			li_rtn = rte_1.Copy()
			ls_temp =  Clipboard()
			ls_result += wf_result_add(ls_item, "1. no select ", not isnull(ll_tmp) and ll_tmp = 0 and not isnull(ls_temp) and ls_temp ="")		
			
			li_rtn = 0 
			ls_temp = ""
			rte_1.SelectTextAll (Detail! )
			rte_1.Clear( )
			Clipboard('appeonsdf@^#$*&^@#$*^@*#$^%^@*&&%^fgfghdf')
			rte_1.paste()
			rte_1.SelectText(1,10,1,20)
			li_rtn = rte_1.Copy()
			ls_temp = Clipboard()
			ls_result += wf_result_add(ls_item, "2. select text ", not isnull(li_rtn) and li_rtn = len(mid('appeonsdf@^#$*&^@#$*^@*#$^%^@*&&%^fgfghdf',10, 11)) )		
	
			//测试Copy函数，Copy内容含图片
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'	
			rte_1.SelectText(1,1,0,0,detail!)
			Clipboard(ls_temp2)
			rte_1.paste()
						
			rte_1.SelectText(5,1,0,0)
			rte_1.InsertPicture(ls_fullname)
			
			Clipboard("")
			li_rtn = 0 
			ls_temp = ""
			rte_1.SelectText(5,1,0,0)
			rte_1.SelectTextLine()
			
			ls_temp = rte_1.selectedtext( )
			li_rtn = rte_1.Copy()
			ls_temp = Clipboard()
			ls_result += wf_result_add(ls_item, "3. select pic ", not isnull(ll_tmp)  and not isnull(ls_temp) and li_rtn = len(ls_temp))		
			
			//测试Copy函数，Copy内容含InputField
			Clipboard("")
			li_rtn = 0 
			ls_temp = ""
			rte_1.SelectText(2,2,2,2)
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'IBM')
			rte_1.SelectText(2,2,2,12)
			li_rtn = rte_1.Copy()
			ls_temp = Clipboard()
			ls_result += wf_result_add(ls_item, "4. select inputfield ", not isnull(ll_tmp)  and not isnull(ls_temp) and li_rtn = len(ls_temp))		
			
			//rte_1.InputFieldsVisible = TRUE
			//rte_1.InputFieldNamesVisible = FALSE
			Clipboard("")
			li_rtn = 0 
			ls_temp = ""
			rte_1.InputFieldNamesVisible =true 
						
			rte_1.SelectText(2,2,2,12)
			li_rtn = rte_1.Copy()
			ls_temp = Clipboard()
			ls_result += wf_result_add(ls_item, "5. select inputfield name ", not isnull(ll_tmp)  and not isnull(ls_temp) and li_rtn = len(ls_temp) and pos(lower(ls_temp), "{name}") > 0 )		
			rte_1.InputFieldNamesVisible =false 
			
		case lower("CopyRTF")
			//测试CopyRTF函数，带第一个参数调用，第一个参数为NULL
			setnull(lbn_flag)
			ls_temp = rte_1.CopyRTF(lbn_flag)
			ls_result += wf_result_add(ls_item, "1.arg null ", isnull(ls_temp) )	
			
			//	测试CopyRTF函数，带两个参数调用，两个参数都为NULL
			setnull(lbn_flag)
			setnull(lb_band)
			ls_temp = ""
			ls_temp =rte_1.CopyRTF(lbn_flag,lb_band)
			ls_result += wf_result_add(ls_item, "2.arg null null ", isnull(ls_temp) )	
			
			//测试CopyRTF函数，带Selected参数调用，参数为true
			ls_temp = ""
			rte_1.SelectTextAll (Detail! )
			ls_temp = rte_1.CopyRTF(True)
			ls_result += wf_result_add(ls_item, "3.arg true ", not isnull(ls_temp)  and pos(ls_temp, "{\") > 0 )	

			rte_1.SelectText(1,1,1,1,Detail!)
			rte_1.PasteRTF(ls_temp)
			ls_temp2 = ls_temp
			
			//测试CopyRTF函数，带Selected参数调用，参数为false
			ls_temp = ""
//			rte_1.SelectTextAll (Detail! )
			ls_temp = rte_1.CopyRTF(false)
			ls_result += wf_result_add(ls_item, "4.arg false ", not isnull(ls_temp)  and pos(ls_temp, "{\") > 0 and len(ls_temp) < len(ls_temp2) * 2 )	
			
			//测试CopyRTF函数，带两个参数调用，Selected参数为false，band参数为Header!
			ls_temp = ""
			rte_1.ShowHeadFoot(True)	
			
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'	
			rte_1.SelectText(1,1,0,0,Header!)
			Clipboard(ls_temp2)
			rte_1.paste()
			
			rte_1.SelectText(5,1,0,0)
			rte_1.InsertPicture(ls_fullname)
			
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			rte_1.SelectText(5,1,5,91,Header! )
			
			ls_temp = rte_1.CopyRTF(False,Header!)
			ls_temp2 = 	ls_temp		
			ls_result += wf_result_add(ls_item, "5.arg false header ", not isnull(ls_temp)  and pos(ls_temp, "{\") > 0 ) 
						
			//测试CopyRTF函数，带两个参数调用，Selected参数为true，band参数为Header!
			ls_temp = ""
			rte_1.SelectText(5,1,5,91,Header! )
			ls_temp = rte_1.CopyRTF(True,Header!)
			ls_result += wf_result_add(ls_item, "6.arg true header ",not isnull(ls_temp)  and pos(ls_temp, "{\") > 0 and len(ls_temp) < len(ls_temp2) * 2 )	
			
			//测试CopyRTF函数，带两个参数调用，Selected参数为false，band参数为Footer!
//			rte_1.ShowHeadFoot(True)
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'	
			rte_1.SelectText(1,1,0,0,Footer!)
			Clipboard(ls_temp2)
			rte_1.paste()
			rte_1.SelectText(5,1,0,0)
			rte_1.InsertPicture(ls_fullname)
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			rte_1.SelectTextAll (Footer!)
						
			ls_temp = ""
			ls_temp = rte_1.CopyRTF(False,Footer!)
			ls_temp2 = 	ls_temp		
			ls_result += wf_result_add(ls_item, "7.arg False Footer ",  not isnull(ls_temp)  and pos(ls_temp, "{\") > 0 ) 
			
			//测试CopyRTF函数，带两个参数调用，Selected参数为true，band参数为Footer!
			ls_temp = ""
			rte_1.setfocus()
			rte_1.SelectText(5,10,5,91,Footer! )
			rte_1.InputFieldsVisible = true
			ls_temp = rte_1.CopyRTF(True,Footer!)
			ls_result += wf_result_add(ls_item, "8.arg True Footer ", not isnull(ls_temp)  and pos(ls_temp, "{\") > 0 and len(ls_temp) < len(ls_temp2) * 2 )	
			
		case lower("Cut")
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'	
			rte_1.SelectText(1,1,0,0,Detail!)
			Clipboard(ls_temp2)
			rte_1.paste()
			
			// 测试Cut函数，无选中内容
			Clipboard("")
			ll_tmp = rte_1.Cut()
			ls_temp = Clipboard()
			ls_result += wf_result_add(ls_item, "1. no selected ",  not isnull(ll_tmp)  and ll_tmp = 0 and not isnull(ls_temp) and ls_temp = ""  ) 
			
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('#$@#!$$#%^%&^&()&*$%')
			rte_1.Paste()
			
			Clipboard("")
			ll_tmp = 0
			rte_1.SelectText(1,1,1,20,Detail!)
			ll_tmp = rte_1.Cut()
			ls_temp = Clipboard()
			ls_result += wf_result_add(ls_item, "2. selected text ",  not isnull(ll_tmp)  and ll_tmp = 20 and not isnull(ls_temp) and ls_temp = "#$@#!$$#%^%&^&()&*$%"  ) 
			
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("About this Appeon for PowerBuilder Help")
			rte_1.paste()
						
			rte_1.InsertPicture(ls_file)	
			
			//Cut内容含图片
			Clipboard("")
			ll_tmp = 0
			rte_1.SelectText(1,10,1,40,Detail!)
			ll_tmp = rte_1.Cut()
			ls_temp = Clipboard()
			ls_result += wf_result_add(ls_item, "3. selected pic ",  not isnull(ll_tmp)  and not isnull(ls_temp) and len(ls_temp) =ll_tmp  ) 
			
			//Cut内容含InputField
			Clipboard("")
			ll_tmp = 0
			rte_1.SelectText(1,1,0,0,Detail!)
			Clipboard(ls_temp2)
			rte_1.paste()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			rte_1.SelectTextAll(Detail!)
			ll_tmp = rte_1.Cut()
			ls_temp = Clipboard()			
			ls_result += wf_result_add(ls_item, "4. selected InputField ",  not isnull(ll_tmp)  and not isnull(ls_temp) and len(ls_temp) =ll_tmp  ) 
						
			Clipboard("")
			ll_tmp = 0
			rte_1.InputFieldNamesVisible =true 
			rte_1.SelectText(1,1,0,0,Detail!)
			Clipboard(ls_temp2)
			rte_1.paste()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			rte_1.SelectTextAll(Detail!)
			ll_tmp = rte_1.Cut()
			ls_temp = Clipboard()
			ls_result += wf_result_add(ls_item, "5. selected InputField visible ",  not isnull(ll_tmp)  and not isnull(ls_temp) and pos(lower(ls_temp), "{name}") > 0 and len(ls_temp) =ll_tmp  ) 			
			rte_1.InputFieldNamesVisible =false
		case lower("DataSource")
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'	
			rte_1.SelectText(1,1,0,0,Detail!)
			Clipboard(ls_temp2)
			rte_1.paste()
			
			lds_tmp = create datastore
			lds_tmp.dataobject = dw_1.dataobject
			lds_tmp.settransobject(sqlca)
			lds_tmp.retrieve()
			
			setnull(lds_tmp)
			//modified by zhoujunwei at 2017-11-29 datasource crash
			if 1 <> 1 then
			//if string(gi_major)+string(gi_minor) <> "126" then 
				li_rtn = rte_1.DataSource(lds_tmp)							//crash in pb12.6
			end if 
			ls_result += wf_result_add(ls_item, "1.arg null ",  isnull(li_rtn) ) 
			
						
			dw_1.Reset()
			li_rtn = rte_1.DataSource(dw_1)
			ls_result += wf_result_add(ls_item, "2.arg empty ",  not isnull(li_rtn)  and li_rtn = 1 ) 
			
			rte_1.SelectText(3,1,3,1,Detail!)
			li_rtn = 0 
			dw_1.Retrieve()
//			rte_1.InputFieldsVisible = false
			li_rtn = rte_1.DataSource(dw_1)
			rte_1.InputFieldInsert('emp_id')
			ls_result += wf_result_add(ls_item, "3.arg useful ",  not isnull(li_rtn)  and li_rtn = 1 ) 
			
			li_rtn = 0 
			rte_1.InputFieldInsert('emp_id')
			li_rtn = rte_1.DataSource(dw_1)
			ls_result += wf_result_add(ls_item, "4.arg again ",  not isnull(li_rtn)  and li_rtn = 1 ) 
			
			//DataSource，有效调用后修改DS中数据的影响
			li_rtn = 0 
			rte_1.InputFieldInsert('emp_name')
			li_rtn = rte_1.DataSource(dw_1)
			dw_1.SetItem(1,'emp_name','appeon test')
			ls_result += wf_result_add(ls_item, "4.modify data ",  not isnull(li_rtn)  and li_rtn = 1 ) 
			
			// DataSource，有效调用后删除DS中数据的影响
			li_rtn = 0 
			rte_1.InputFieldInsert('emp_id')
			li_rtn = rte_1.DataSource(dw_1)
			dw_1.DeleteRow(1)
			ls_result += wf_result_add(ls_item, "5.delete data ",  not isnull(li_rtn)  and li_rtn = 1 ) 
			
			li_rtn = 0 
			rte_1.InputFieldInsert('emp_code')
			li_rtn = rte_1.DataSource(dw_1)
			dw_1.InsertRow(1)
			ls_result += wf_result_add(ls_item, "5.insert data ",  not isnull(li_rtn)  and li_rtn = 1 ) 
			
			//DataSource，有效调用后修改DS中数据，再刷新控件
			li_rtn = 0 
			rte_1.InputFieldInsert('emp_name')
			li_rtn = rte_1.DataSource(dw_1)
			dw_1.SetItem(1,'emp_name','appeon test')
			rte_1.ScrollNextRow()
			rte_1.ScrollPriorRow()
			ls_result += wf_result_add(ls_item, "6.refresh rte ",  not isnull(li_rtn)  and li_rtn = 1 ) 
			
			// DataSource，有效调用后删除DS中数据，再刷新控件
			li_rtn = 0 
			rte_1.InputFieldInsert('emp_id')
			li_rtn = rte_1.DataSource(dw_1)
			dw_1.DeleteRow(1)
			rte_1.ScrollNextRow()
			rte_1.ScrollPriorRow()
			ls_result += wf_result_add(ls_item, "7.refresh rte delete data ",  not isnull(li_rtn)  and li_rtn = 1 ) 
			
			// DataSource，有效调用后增加DS中数据，再刷新控件
			li_rtn = 0 
			rte_1.InputFieldInsert('emp_code')
			li_rtn = rte_1.DataSource(dw_1)
			dw_1.InsertRow(1)
			rte_1.ScrollPriorRow()
			ls_result += wf_result_add(ls_item, "8.refresh rte insert data ",  not isnull(li_rtn)  and li_rtn = 1 ) 
			
			// DataSource，重复插入与列名相同的InputField
			li_rtn = 0 
			li_rtn = rte_1.DataSource(dw_1)
			rte_1.InputFieldInsert('emp_id')
			rte_1.InputFieldInsert('emp_id')
			ls_result += wf_result_add(ls_item, "9.repeat data ",  not isnull(li_rtn)  and li_rtn = 1 ) 			
			
			// DataSource，Reset数据源
			li_rtn = 0 
			li_rtn = rte_1.DataSource(dw_1)
			rte_1.InputFieldInsert('dep_id')
			dw_1.reset()
			rte_1.ScrollNextPage()
			rte_1.ScrollNextRow()
			rte_1.ScrollPriorPage()
			rte_1.ScrollPriorRow()
			ls_result += wf_result_add(ls_item, "10.reset data ",  not isnull(li_rtn)  and li_rtn = 1 ) 			
			
			// DataSource，数据源是datasotre
//			if not isvalid(lds_tmp) then
//				lds_tmp = create datastore
//			end if 
			destroy lds_tmp
			lds_tmp = create datastore
			lds_tmp.dataobject = dw_1.dataobject
			lds_tmp.settransobject(sqlca)
			lds_tmp.retrieve()
			
			li_rtn = 0 
			li_rtn = rte_1.DataSource(lds_tmp)
			rte_1.InputFieldInsert('emp_id')
			ls_result += wf_result_add(ls_item, "11.datasotre data ",  not isnull(li_rtn)  and li_rtn = 1 ) 			
			
			if isvalid(lds_tmp) then destroy lds_tmp
			
			//DataSource，数据源是Datawindowchild
			li_rtn = 0 
			dw_1.GetChild('dep_id',ldw_Child)
			li_rtn = rte_1.DataSource(ldw_Child)
			rte_1.InputFieldInsert('dep_id')
 			ls_result += wf_result_add(ls_item, "12.datawindowchild data ",  not isnull(li_rtn)  and li_rtn = 1 ) 			
		case lower("Drag")
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.Drag(Begin!)
			ls_result += wf_result_add(ls_item, "1.Begin ",  not isnull(li_rtn)  and li_rtn = 1 and not isnull(is_log) and pos(lower(is_log), lower("Dragenter event")) > 0 ) 			//is_log
			
			li_rtn = 0 
			is_log = ""
			rte_1.SelectText(1,1,0,0,Detail!)
			rte_1.Drag(Begin!)
			li_rtn =rte_1.Drag(Cancel!)
			ls_result += wf_result_add(ls_item, "2.Cancel ",  not isnull(li_rtn)  and li_rtn = 1 and not isnull(is_log) and pos(lower(is_log), lower("Dragenter event")) > 0 ) 			//is_log
			
			li_rtn = 0 
			is_log = ""
			rte_1.SelectText(1,1,0,0,Detail!)
			rte_1.Drag(Begin!)
			li_rtn =rte_1.Drag(End!)
			ls_result += wf_result_add(ls_item, "3.End ",  not isnull(li_rtn)  and li_rtn = 1 and not isnull(is_log) and pos(lower(is_log), lower("Dragenter event")) > 0 ) 			//is_log
			
			//测试Drag(NULL)
			li_rtn = 0 
			is_log = ""
			rte_1.SelectText(1,1,0,0,Detail!)
			Setnull(ldm_mode)
			li_rtn = rte_1.Drag(ldm_mode)
			ls_result += wf_result_add(ls_item, "4.NULL ",  isnull(li_rtn)  and not isnull(is_log) and pos(lower(is_log), lower("Dragenter event")) = 0 ) 			//is_log
			
		case lower("Find")
			//测试Find函数,searchtext为NULL
			rte_1.SelectText(1,1,0,0,Detail!)
			Setnull(ls_temp)
			ll_tmp = rte_1.Find(ls_temp,TRUE, TRUE, FALSE, TRUE)
			ls_result += wf_result_add(ls_item, "1.searchtext null ",  isnull(ll_tmp)  ) 			
			
			//测试Find函数,forward为NULL
			rte_1.SelectText(1,1,0,0,Detail!)
			SetNull(lbn_flag)
			ls_temp = 'appeon'
			ll_tmp = rte_1.Find(ls_temp,lbn_flag, TRUE, FALSE, TRUE)
			ls_result += wf_result_add(ls_item, "2.forward null ",  isnull(ll_tmp)  ) 			
			
			//测试Find函数,insensitive为NULL
			rte_1.SelectText(1,1,0,0,Detail!)
			SetNull(lbn_flag)
			ls_temp = 'appeon'
			ll_tmp = rte_1.Find(ls_temp,True, lbn_flag, FALSE, TRUE)
			ls_result += wf_result_add(ls_item, "3.insensitive null ",  isnull(ll_tmp)  ) 		
			
			//测试Find函数,wholeword为NULL
			rte_1.SelectText(1,1,0,0,Detail!)
			SetNull(lbn_flag)
			ls_temp = 'appeon'
			ll_tmp = rte_1.Find(ls_temp,True, True, lbn_flag, TRUE)
			ls_result += wf_result_add(ls_item, "4.wholeword null ",  isnull(ll_tmp)  ) 		
			
			//测试Find函数,cursor为NULL
			rte_1.SelectText(1,1,0,0,Detail!)
			SetNull(lbn_flag)
			ls_temp = 'appeon'
			ll_tmp = rte_1.Find(ls_temp,True, True, False, lbn_flag)
			ls_result += wf_result_add(ls_item, "5.cursor null ",  isnull(ll_tmp)  ) 		
			
			// 测试Find函数,searchtext为含回车符的字符串，存在匹配的内容
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Detail!)
			Clipboard("Appeon for Power~r~n Builder")
			rte_1.paste()
			
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "Power~r~n "
			ll_tmp =rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "6.text exists ", not isnull(ll_tmp) and ll_tmp > 0 ) 		
			
			//测试Find函数,searchtext为含Tab符的字符串，存在匹配的内容
			rte_1.SelectText(2,1,2,0,Detail!)
			Clipboard("Appeon for Power~tBuilder")
			rte_1.paste()
			
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "Power~t"
			ll_tmp =rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "7.tab exists ", not isnull(ll_tmp) and ll_tmp > 0 ) 		
			
			// 测试Find函数,searchtext为含\符的字符串，存在匹配的内容
			rte_1.SelectText(2,1,2,0,Detail!)
			Clipboard("Appeon\for\PowerBuilder")
			rte_1.paste()
			
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "\for"
			ll_tmp = rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "8.[\] exists ", not isnull(ll_tmp) and ll_tmp > 0 ) 		
			
			//测试Find函数,searchtext为空字符串，存在匹配的内容
			rte_1.SelectText(2,1,2,0,Detail!)
			Clipboard("Appeon   for  PowerBuilder")
			rte_1.paste()
			
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "for  "
			ll_tmp = rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "9.[empty] exists ", not isnull(ll_tmp) and ll_tmp > 0 ) 		
			
			//测试Find函数,searchtext为任意字符串，但控件中内容不存在该字串匹配
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "h@#$sdfgs%^*&6s"
			ll_tmp = rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "10.[specify] exists ", not isnull(ll_tmp) and ll_tmp = 0 ) 		
			
			// 测试Find函数,searchtext为含多字节字符的字符串，存在匹配的内容
			rte_1.SelectText(2,1,2,0,Detail!)
			Clipboard("正阳软件是一家专门从事研发和营销企业级软件产品的公司")
			rte_1.paste()
			
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "软件产品"
			ll_tmp = rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "11.[multi_byte] exists ", not isnull(ll_tmp) and ll_tmp > 0 ) 		
			
			//测试Find函数,forward为true,cursor为true
			ls_temp = "Appeon"
			rte_1.SelectText(1,1,0,0,Detail!)
			ll_tmp = rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "12.cursor is ture forward true ", not isnull(ll_tmp) and ll_tmp > 0 ) 		
			
			//测试Find函数,forward为false,cursor为true
			rte_1.setfocus()
			rte_1.selectText(5,1,0,0)
			ls_temp = "Appeon"
			ll_tmp =  rte_1.Find(ls_temp,False, True, False, True)
			ls_result += wf_result_add(ls_item, "13.cursor is ture forward false ", not isnull(ll_tmp) and ll_tmp > 0 ) 		
			
			// 测试Find函数,forward为true,cursor为false
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "Appeon"
			ll_tmp =  rte_1.Find(ls_temp,True, True, False, False)
			ls_result += wf_result_add(ls_item, "14.cursor is false forward ture ", not isnull(ll_tmp) and ll_tmp > 0 ) 	
			
			//测试Find函数,forward为false,cursor为false
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "Appeon"
			ll_tmp = rte_1.Find(ls_temp,False, True, False, False)
			ls_result += wf_result_add(ls_item, "15.cursor is false forward false ", not isnull(ll_tmp) and ll_tmp = 0 ) 	
			
			//测试Find函数,Insensitive为true,不区分大小写查找
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("Appeon for PowerBuilder  appeon for powerbuilder")
			rte_1.paste()
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "appeon"
			ll_tmp = rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "16.Insensitive is true ", not isnull(ll_tmp) and ll_tmp > 0 ) 
			
			//测试Find函数,Insensitive为false,区分大小写查找
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "appeon"
			ll_tmp = rte_1.Find(ls_temp,True, False, False, True)
			ls_result += wf_result_add(ls_item, "17.Insensitive is false ", not isnull(ll_tmp) and ll_tmp > 0 ) 
			
			//测试Find函数,Wholeword为false,非单词匹配查找
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Detail!)
			Clipboard("Appeon for PowerBuilder %&^%dhj)(* appeon for powerbuilder")
			rte_1.paste()
			
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "%&^%dhj)(*"
			ll_tmp = rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "18. not a word ", not isnull(ll_tmp) and ll_tmp > 0 ) 
			
			//测试Find函数,Wholeword为true,单词匹配查找
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "dhj"
			ll_tmp = rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "19. a word ", not isnull(ll_tmp) and ll_tmp > 0 ) 
			
			//测试Find函数是否查找InputField值
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard("Appeon for PowerBuilder %&^%dhj)(* appeon for powerbuilder")
			rte_1.paste()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'Sybase')
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "Sybase"
			ll_tmp = rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "20. inputfield ", not isnull(ll_tmp) and ll_tmp > 0 ) 
			
			rte_1.InputFieldNamesVisible =true 
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = "Sybase"
			ll_tmp = rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "21. inputfield not display ", not isnull(ll_tmp) and ll_tmp = 0 ) 
			
			rte_1.InputFieldNamesVisible = false
			
			//测试Find函数在Header区查找
			rte_1.setfocus()
			rte_1.ShowHeadFoot(True)
			rte_1.SelectTextAll(Header!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Header!)
			Clipboard("Appeon for PowerBuilder %&^%Sybase)(* appeon for powerbuilder")
			rte_1.paste()
			
			rte_1.SelectText(1,1,0,0,Header!)
			ls_temp = "Sybase"
			ll_tmp = rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "22. in the Header ", not isnull(ll_tmp) and ll_tmp > 0 ) 
			
			//测试Find函数在Footer区查找
			rte_1.setfocus()
			rte_1.ShowHeadFoot(True)
			rte_1.SelectTextAll(Footer!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Footer!)
			Clipboard("Appeon for PowerBuilder %&^%Sybase)(* appeon for powerbuilder")
			rte_1.paste()
			rte_1.SelectText(1,1,0,0,Footer!)
			ls_temp = "Sybase"
			ll_tmp = rte_1.Find(ls_temp,True, True, False, True)
			ls_result += wf_result_add(ls_item, "23. in the Footer ", not isnull(ll_tmp) and ll_tmp > 0 ) 
			
		case lower("FindNext")
			//测试FindNext函数，存在下一个查找内容
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'
			rte_1.SelectText(1,1,0,0,Detail!)
			Clipboard(ls_temp2)
			rte_1.paste()
			
			rte_1.SelectText(1,1,0,0,Detail!)
			rte_1.Find('Appeon',True,True,False,True)
			ll_tmp = rte_1.FindNext()
			ls_result += wf_result_add(ls_item, "1. exists next word ", not isnull(ll_tmp) and ll_tmp > 0 ) 
			
			// 测试FindNext函数，不存在下一个查找内容
			rte_1.SelectText(1,1,0,0,Detail!)
			rte_1.Find('About',True,True,False,True)
			ll_tmp = rte_1.FindNext()
			ls_result += wf_result_add(ls_item, "2. not exists next word ", not isnull(ll_tmp) and ll_tmp = 0 ) 
			
		case lower("GetAlignment")
			// 测试GetAlignment函数，插入点段落对齐方式为center!
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help~r~tThis HTML help contains the HTML version of several Appeon 3.0 user documents')
			rte_1.Paste()
			rte_1.SelectText(1,1,1,50,Detail!)
			rte_1.SetAlignment(Center! )
			lam_align = rte_1.GetAlignment()
			ls_result += wf_result_add(ls_item, "1. Center ", not isnull(lam_align) and lam_align = Center! ) 
			
			//测试GetAlignment函数，插入点段落对齐方式为left!
			rte_1.SelectText(1,1,1,50,Detail!)
			rte_1.SetAlignment(Left! )
			setnull(lam_align)
			lam_align = rte_1.GetAlignment()
			ls_result += wf_result_add(ls_item, "2. Left ", not isnull(lam_align) and lam_align = Left! ) 
			
			//测试GetAlignment函数，插入点段落对齐方式为right!
			rte_1.SelectText(1,1,1,50,Detail!)
			rte_1.SetAlignment(Right! )
			setnull(lam_align)
			lam_align = rte_1.GetAlignment()
			ls_result += wf_result_add(ls_item, "3. Right ", not isnull(lam_align) and lam_align = Right! ) 
			
			//测试GetAlignment函数，插入点段落对齐方式为justify!
			rte_1.SelectText(1,1,1,50,Detail!)
			rte_1.SetAlignment(Justify! )
			setnull(lam_align)
			lam_align = rte_1.GetAlignment()
			ls_result += wf_result_add(ls_item, "4. Justify ", not isnull(lam_align) and lam_align = Justify! ) 
			
			//选中多个段落时插入点位于开始位置，测试GetAlignment函数
			rte_1.SelectTextAll(Detail!)
			rte_1.SelectText(1,1,1,3,Detail!)
			rte_1.SetAlignment(Left!)
			rte_1.SelectText(2,1,2,3,Detail!)
			rte_1.SetAlignment(Center!)
			
			rte_1.SelectText(1,1,2,10,Detail!)
			setnull(lam_align)
			lam_align = rte_1.GetAlignment()
			ls_result += wf_result_add(ls_item, "5. select more ", not isnull(lam_align) and lam_align = Center! ) 
			
			//选中多个段落时插入点位于结束位置，测试GetAlignment函数
			rte_1.SelectText(2,10,1,4,Detail!)
			setnull(lam_align)
			lam_align = rte_1.GetAlignment()
			ls_result += wf_result_add(ls_item, "6. otherwise select more ", not isnull(lam_align) and lam_align = Center! ) 
			
			//选中InputField后，测试GetAlignment函数			
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help~r~tThis HTML help contains the HTML version of several Appeon 3.0 user documents')
			rte_1.Paste()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			rte_1.SelectText(rte_1.LineCount(),1,0,0,Detail!)
			rte_1.SelectText(rte_1.LineCount(),rte_1.LineLength(),rte_1.LineCount(),rte_1.LineLength(),Detail!)	
			setnull(lam_align)
			lam_align = rte_1.GetAlignment()
			ls_result += wf_result_add(ls_item, "7. inputfield false ", not isnull(lam_align) and lam_align = Center! ) 
			
			rte_1.InputFieldNamesVisible =true 
			rte_1.SelectText(rte_1.LineCount(),1,0,0,Detail!)
			rte_1.SelectText(rte_1.LineCount(),rte_1.LineLength(),rte_1.LineCount(),rte_1.LineLength(),Detail!)	
			setnull(lam_align)
			lam_align = rte_1.GetAlignment()
			ls_result += wf_result_add(ls_item, "8. inputfield true ", not isnull(lam_align) and lam_align = Center! ) 
			rte_1.InputFieldNamesVisible =false
			
			//选中图片后，测试GetAlignment函数
			
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help~r~tThis HTML help contains the HTML version of several Appeon 3.0 user documents')
			rte_1.Paste()
			rte_1.InsertPicture(ls_file)	
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'appeon')
			rte_1.SelectText(rte_1.LineCount(),1,0,0,Detail!)
			rte_1.SelectText(rte_1.LineCount() - 1,1,rte_1.LineCount(),rte_1.LineLength(),Detail!)
			setnull(lam_align)
			lam_align = rte_1.GetAlignment()
			ls_result += wf_result_add(ls_item, "9. pic ", not isnull(lam_align) and lam_align = Center! ) 
			
		case lower("GetContextService")
			li_rtn = rte_1.GetContextService ( "ContextInformation", lpo_powerobject)
			ls_temp = ClassName(lpo_powerobject)
			ls_result += wf_result_add(ls_item, "1. ContextInformation ", not isnull(li_rtn) and li_rtn  = 1 and not isnull(ls_temp) and lower(ls_temp) =lower("ContextInformation") ) 
			
			li_rtn = 0 
			ls_temp = ""
			li_rtn = rte_1.GetContextService ( "Internet", lpo_powerobject)
			ls_temp = ClassName(lpo_powerobject)
			ls_result += wf_result_add(ls_item, "2. Internet ", not isnull(li_rtn) and li_rtn  = 1 and not isnull(ls_temp) and lower(ls_temp) ="inet" ) 
			
			li_rtn = 0 
			ls_temp = ""
			li_rtn = rte_1.GetContextService ( "ContextKeyword", lpo_powerobject)
			ls_temp = ClassName(lpo_powerobject)
			ls_result += wf_result_add(ls_item, "3. ContextKeyword ", not isnull(li_rtn) and li_rtn  = 1 and  not isnull(ls_temp) and lower(ls_temp) =lower("ContextKeyword" )) 
		case lower("GetParagraphSetting")
			//测试GetParagraphSetting函数，参数为NULL值
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help~r~tThis HTML help contains the HTML version of several Appeon 3.0 user documents')
			rte_1.Paste()
			
			SetNull(lps_set)
			ll_tmp = rte_1.GetParagraphSetting(lps_set)
			ls_result += wf_result_add(ls_item, "1. arg null ", isnull(ll_tmp) ) 
			
			//测试GetParagraphSetting函数，参数为Indent!值
			ll_tmp = 0 
			rte_1.SetParagraphSetting(Indent!, 250)
			rte_1.SelectText(1,1,0,0,Detail!)
			ll_tmp = rte_1.GetParagraphSetting(Indent!)
			ls_result += wf_result_add(ls_item, "2. Indent 250 ", not isnull(ll_tmp) and ll_tmp = 250 ) 
	
			//测试GetParagraphSetting函数，参数为LeftMargin!值
			ll_tmp = 0 
			rte_1.SetParagraphSetting(LeftMargin! , 150)
			rte_1.SelectText(1,1,0,0,Detail!)
			ll_tmp = rte_1.GetParagraphSetting(LeftMargin! )
			ls_result += wf_result_add(ls_item, "3. LeftMargin 150 ", not isnull(ll_tmp) and ll_tmp = 150 ) 
			
			//测试GetParagraphSetting函数，参数为RightMargin!值
			ll_tmp = 0 
			rte_1.SetParagraphSetting(RightMargin! , 350)
			rte_1.SelectText(1,1,0,0,Detail!)
			ll_tmp = rte_1.GetParagraphSetting(RightMargin! )
			ls_result += wf_result_add(ls_item, "4. RightMargin 350 ", not isnull(ll_tmp) and ll_tmp =350 ) 
			
			//选中多段内容时测试GetParagraphSetting函数，参数为任意有效值
			ll_tmp = 0 
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'
			Clipboard(ls_temp2)
			rte_1.Paste()
			
			rte_1.SelectTextAll(Detail!)
			rte_1.SelectText(1,1,0,0,Detail!)
			ll_tmp = rte_1.GetParagraphSetting(LeftMargin! )
			ls_result += wf_result_add(ls_item, "5. all ", not isnull(ll_tmp) and ll_tmp = 150 ) 
			
		case lower("GetParent")
			setnull(lpo_powerobject)
			lpo_powerobject = rte_1.Getparent()
			ls_temp = lpo_powerobject.ClassName() 
			ls_result += wf_result_add(ls_item, "1. classname ", not isnull(ls_temp) and ls_temp = "w_richtext_control") 
			
		case lower("GetSpacing")
			l_spacing = rte_1.GetSpacing()
			ls_result += wf_result_add(ls_item, "1. default ", not isnull(l_spacing) and l_spacing =spacing1!)
			
			//选中多个段落时插入点位于开始位置，测试Getspacing函数
			setnull(l_spacing)
			rte_1.SelectTextAll(Detail!)
			rte_1.SelectText(1,1,0,0,Detail!)
			l_spacing = rte_1.GetSpacing()
			ls_result += wf_result_add(ls_item, "2. begin ", not isnull(l_spacing) and l_spacing =spacing1!)
			
			//选中多个段落时插入点位于结束位置，测试Getspacing函数
			setnull(l_spacing)
			rte_1.SelectTextAll(Detail!)			
			rte_1.SelectText(10,39,10,39,Detail!)
			l_spacing = rte_1.GetSpacing()
			ls_result += wf_result_add(ls_item, "3. end ", not isnull(l_spacing) and l_spacing =spacing1!)
			
		case lower("GetTextColor")
			//GetTextColor，没有选中字符
			rte_1.SelectText(1,1,0,0,Detail!)
			ll_tmp = rte_1.GetTextColor()
			ls_result += wf_result_add(ls_item, "1. no select ", not isnull(ll_tmp) and ll_tmp = 0 ) 
			
			//GetTextColor，选中单个字符
			ll_tmp = 0 
			rte_1.SelectText(1,1,1,1,Detail!)
			ll_tmp = rte_1.GetTextColor()
			ls_result += wf_result_add(ls_item, "2. select a word ", not isnull(ll_tmp) and ll_tmp = 0 ) 
			
			ll_tmp = 0 
			li_rtn = rte_1.SetTextColor(rgb(255,255,0))				//Yellow	//后面两个0， 没有解析出来，所以结果错了
			ll_tmp = rte_1.GetTextColor()
			ls_result += wf_result_add(ls_item, "3. select a Yellow ", not isnull(ll_tmp) and ll_tmp =16776960 ) 
			
			//GetTextColor，选中多个字符，字符间颜色不同
			ll_tmp = 0 
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.')
			rte_1.Paste()
			rte_1.SelectText(1,1,1,5,Detail!)
			li_rtn = rte_1.SetTextColor(255)
			rte_1.SelectText(1,6,1,10,Detail!)
			li_rtn = rte_1.SetTextColor(370)
			rte_1.SelectText(1,1,1,10,Detail!)
			ll_tmp = rte_1.GetTextColor()
			ls_result += wf_result_add(ls_item, "4. select different word color ", not isnull(ll_tmp) and ll_tmp = 255 ) 
			
		case lower("GetTextStyle")
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.')
			rte_1.Paste()
			rte_1.SelectText(1,8,1,8,Detail!)
						
			lbn_flag = rte_1.GetTextStyle(Bold!)
			ls_result += wf_result_add(ls_item, "1. Bold ", not isnull(lbn_flag) and lbn_flag =false)
			
			lbn_flag = false
			lbn_flag = rte_1.GetTextStyle(Strikeout!)
			ls_result += wf_result_add(ls_item, "2. Strikeout ", not isnull(lbn_flag) and lbn_flag =false)
			
			lbn_flag = false			
			lbn_flag = rte_1.GetTextStyle(Subscript!)
			ls_result += wf_result_add(ls_item, "3. Subscript ", not isnull(lbn_flag) and lbn_flag =false)
			
			lbn_flag = false			
			lbn_flag = rte_1.GetTextStyle(Superscript!)
			ls_result += wf_result_add(ls_item, "4. Superscript ", not isnull(lbn_flag) and lbn_flag =false)
			
			lbn_flag = false
			lbn_flag = rte_1.GetTextStyle(Underlined!)
			ls_result += wf_result_add(ls_item, "5. Underlined ", not isnull(lbn_flag) and lbn_flag =true)
			
			lbn_flag = false
			lbn_flag = rte_1.GetTextStyle(Italic!)
			ls_result += wf_result_add(ls_item, "6. Italic ", not isnull(lbn_flag) and lbn_flag =false)
			
		case lower("Hide")
			li_rtn  = rte_1.Hide()
			ls_result += wf_result_add(ls_item, "1. set ", not isnull(li_rtn) and li_rtn = 1 ) 
			rte_1.Visible = true 
						
		case lower("InputFieldChangeData")
			//InputFieldChangeData,参数inputfieldname为NULL
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			
			SetNull(ls_temp)
			li_rtn = rte_1.InputFieldChangeData(ls_temp,'Appeon')
			ls_result += wf_result_add(ls_item, "1. null data ", isnull(li_rtn) ) 
			
			//InputFieldChangeData,参数inputfieldvalue为NULL
			SetNull(ls_temp)
			li_rtn = 0
			li_rtn = rte_1.InputFieldChangeData('Name',ls_temp)
			ls_result += wf_result_add(ls_item, "2. data null ", isnull(li_rtn) ) 
			
			// InputFieldChangeData,两个参数都有效，InputFieldNamesVisible为false
			li_rtn = 0
			li_rtn = rte_1.InputFieldChangeData('Name','Appeon')
			ls_result += wf_result_add(ls_item, "3. data ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//InputFieldChangeData,两个参数都有效，InputFieldNamesVisible为true
			li_rtn = 0
			rte_1.InputFieldNamesVisible = True
			li_rtn = rte_1.InputFieldChangeData('Name','AppeonTest')
			ls_result += wf_result_add(ls_item, "4. InputFieldNamesVisible test ", not isnull(li_rtn) and li_rtn = 1 ) 			
			rte_1.InputFieldNamesVisible = false
			
			// InputFieldChangeData,指定InputFieldName不存在
			li_rtn = 0
			li_rtn = rte_1.InputFieldChangeData('Salary','Appeon')
			ls_result += wf_result_add(ls_item, "5. not exists InputFieldName ", not isnull(li_rtn) and li_rtn = 1 ) 			
			
			//InputFieldChangeData,指定inputfieldvalue为Tab字符
			li_rtn = 0			
			li_rtn = rte_1.InputFieldChangeData('Name','~t')
			ls_result += wf_result_add(ls_item, "6. tab ", not isnull(li_rtn) and li_rtn = 1 ) 			
			
			// InputFieldChangeData,指定inputfieldvalue为回车换行字符
			li_rtn = 0
			li_rtn = rte_1.InputFieldChangeData('Name',' ~r~n ')
			ls_result += wf_result_add(ls_item, "7. enter line ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//InputFieldChangeData,控件中包含多个相同的参数所指定的InputFieldName
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'M')
			
			li_rtn = 0
			li_rtn =rte_1.InputFieldChangeData('Name','Appeon')
			ls_result += wf_result_add(ls_item, "8. multi InputFieldName ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//使用InputFieldChangeData修改数据不影响Datastore的共享数据
			li_rtn = 0
			lds_tmp = create datastore
			lds_tmp.dataobject = 'rtefunw04_d01_temp01'
			
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			
			rte_1.DataSource(lds_tmp)
			rte_1.InputFieldInsert('info_2')
			li_rtn = rte_1.InputFieldChangeData('info_2','IBM')			
			ls_result += wf_result_add(ls_item, "9. Datastore ", not isnull(li_rtn) and li_rtn = 1 ) 
			if isvalid(lds_tmp) then destroy lds_tmp
			
		case lower("InputFieldCurrentName")
			//InputFieldCurrentName,插入点在InputField上
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			rte_1.SelectText(2,2,0,0,Detail!)
			ls_temp = rte_1.InputFieldCurrentName()
			ls_result += wf_result_add(ls_item, "1. up ", not isnull(ls_temp) and ls_temp = "Id" ) 
			
			//InputFieldCurrentName,插入点不在InputField上
			ls_temp = ""
			rte_1.SelectText(1,5,0,0,Detail!)
			ls_temp = rte_1.InputFieldCurrentName()
			ls_result += wf_result_add(ls_item, "2. down ", not isnull(ls_temp) and ls_temp = "" ) 
			
		case lower("InputFieldDeleteCurrent")
			//InputFieldDeleteCurrent,插入点在InputField上
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			rte_1.InputFieldNamesVisible = True
			
			rte_1.SelectText(2,2,0,0,Detail!)
			li_rtn = rte_1.InputFieldDeleteCurrent()
			ls_result += wf_result_add(ls_item, "1. point in InputField ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			// InputFieldDeleteCurrent,插入点不在InputField上
			li_rtn = 0
			rte_1.SelectText(1,5,0,0,Detail!)
			li_rtn = rte_1.InputFieldDeleteCurrent()
			ls_result += wf_result_add(ls_item, "2. point not in InputField ", not isnull(li_rtn) and li_rtn = -1 ) 
			
			//InputFieldDeleteCurrent,当前InputField正处于编辑状态
			li_rtn = 0
			rte_1.SelectText(2,2,2,2,Detail!)
			li_rtn = rte_1.InputFieldDeleteCurrent()
			ls_result += wf_result_add(ls_item, "3. editting in InputField ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			// InputFieldDeleteCurrent,存在多个相同的InputField
			li_rtn = 0
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			Clipboard('IBM~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			Clipboard('Sun.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			//rte_1.InputFieldNamesVisible = True

			rte_1.SelectText(4,2,0,0,Detail!)
			li_rtn = rte_1.InputFieldDeleteCurrent()
			ls_result += wf_result_add(ls_item, "4. multi exists ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//删除有数据值的InputField后，再插入相同的InputField
			li_rtn = 0
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Id")
			rte_1.InputFieldChangeData ("Id", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Sex")
			rte_1.InputFieldChangeData ("Sex", 'M')
			rte_1.SelectText(2,3,0,0,Detail!)
			li_rtn = rte_1.InputFieldDeleteCurrent()
			rte_1.InputFieldInsert("Name")
			ls_result += wf_result_add(ls_item, "5. same InputField ", not isnull(li_rtn) and li_rtn = 1 ) 
			rte_1.InputFieldNamesVisible = false
			
		case lower("InputFieldGetData")
			// InputFieldGetData，参数为NULL
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0)
			Setnull(ls_temp2)
			ls_temp = rte_1.InputFieldGetData(ls_temp2)
			ls_result += wf_result_add(ls_item, "1. arg null ", isnull(ls_temp) ) 
			
			//InputFieldGetData，参数为不存在的InputField
			ls_temp = rte_1.InputFieldGetData("Id")
			ls_result += wf_result_add(ls_item, "2. not exists InputField ", not isnull(ls_temp) and ls_temp = "" ) 
			
			//InputFieldGetData，参数为没有数据的InputField
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("APPEON")
			rte_1.SelectText(1,1,0,0)
			ls_temp = rte_1.InputFieldGetData("APPEON")
			ls_result += wf_result_add(ls_item, "3. not data ", not isnull(ls_temp) and ls_temp = "??" ) 
			
			// InputFieldGetData，参数有数据的InputField
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0)
			ls_temp = rte_1.InputFieldGetData("Name")
			ls_result += wf_result_add(ls_item, "4. data ", not isnull(ls_temp) and ls_temp = "sybase" ) 
			
		case lower("InputFieldInsert")
			//InputFieldInsert，参数为NULL
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0)
			Setnull(ls_temp)
			li_rtn = rte_1.InputFieldInsert(ls_temp)
			ls_result += wf_result_add(ls_item, "1. arg null ", isnull(li_rtn) ) 
			
			//插入控件中不存在的InputField，InputFieldNamesVisible为false
			rte_1.SelectText(1,1,0,0)
			li_rtn = rte_1.InputFieldInsert('CHINA')
			ls_result += wf_result_add(ls_item, "2. not exists field ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//插入与控件中相同的InputField,InputFieldNamesVisible为false
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InputFieldInsert('Name')
			ls_result += wf_result_add(ls_item, "3. repeat inputfield ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			// 插入与控件中相同的InputField,InputFieldNamesVisible为true
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldNamesVisible = True
			rte_1.SelectText(1,1,0,0,Detail!)
			
			li_rtn = rte_1.InputFieldInsert('Name')
			ls_result += wf_result_add(ls_item, "4. repeat inputfield true ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//插入在Active状态InputField之前
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
//			rte_1.InputFieldNamesVisible = True
			li_rtn = rte_1.InputFieldInsert('Sex')
			ls_result += wf_result_add(ls_item, "5. after Active status inputfield true ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//高亮选中一部分控件内容，调用函数插入InputField
//			rte_1.InputFieldNamesVisible = True
			rte_1.SelectText(1,1,1,20,Detail!)
			li_rtn = rte_1.InputFieldInsert('SexTwo')			
			ls_result += wf_result_add(ls_item, "6. select inputfield true ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			rte_1.InputFieldNamesVisible = false
		case lower("InputFieldLocate")
			//InputFieldLocate，location参数为NULL，只带第一个参数
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,0,0,Detail!)
			
			SetNull(ll_location)
			ls_temp = rte_1.inputfieldlocate(ll_location)	
			ls_result += wf_result_add(ls_item, "1. arg1 null ", isnull(ls_temp) ) 
			
			//InputFieldLocate，location参数为NULL,带两个参数
			ls_temp = ""
			rte_1.SelectText(1,1,0,0,Detail!)
			SetNull(ll_location)
			ls_temp = rte_1.InputFieldLocate(ll_location,'Name')
			ls_result += wf_result_add(ls_item, "2. arg2 null ", isnull(ls_temp) ) 
			
			// InputFieldLocate，inputfieldname参数为NULL,带两个参数
			ls_temp = ""
			rte_1.SelectText(1,1,0,0,Detail!)
			SetNull(ls_temp2)
			ls_temp = rte_1.InputFieldLocate(First!,ls_temp2)
			ls_result += wf_result_add(ls_item, "3. arg2 First null ", isnull(ls_temp) ) 
			
			// InputFieldLocate，location参数为First!，只带第一个参数
			ls_temp = ""
			rte_1.SelectText(2,2,0,0,Detail!)
			ls_temp = rte_1.InputFieldLocate(First!)
			ls_result += wf_result_add(ls_item, "4. arg1 First ", not isnull(ls_temp) and ls_temp = "id" ) 
			
			//InputFieldLocate，location参数为Last!，只带第一个参数
			ls_temp = ""
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = rte_1.InputFieldLocate(Last!)
			ls_result += wf_result_add(ls_item, "5. arg1 Last ", not isnull(ls_temp) and ls_temp = "name" ) 
			
			//InputFieldLocate，location参数为Next!，只带第一个参数
			ls_temp = ""
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = rte_1.InputFieldLocate(Next!)
			ls_result += wf_result_add(ls_item, "6. arg1 Next ", not isnull(ls_temp) and ls_temp = "id" ) 
			
			//InputFieldLocate，location参数为Prior!，只带第一个参数
			ls_temp = ""
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(2,2,0,0,Detail!)
			ls_temp = rte_1.InputFieldLocate(Prior!)
			ls_result += wf_result_add(ls_item, "7. arg1 Prior ", not isnull(ls_temp) and ls_temp = "name" ) 
			
			// InputFieldLocate，只带一个参数，测试函数返回空字符串
			ls_temp = ""
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = rte_1.InputFieldLocate(Prior!)
			ls_result += wf_result_add(ls_item, "8. arg1 Prior return empty ", not isnull(ls_temp) and ls_temp = "" ) 
			
			// InputFieldLocate，location参数为First!，带两个参数
			ls_temp = ""
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = rte_1.InputFieldLocate(First!,'Name')
			ls_result += wf_result_add(ls_item, "9. arg2 First ", not isnull(ls_temp) and ls_temp = "name" ) 
			
			// InputFieldLocate，location参数为Last!，带两个参数
			ls_temp = ""
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = rte_1.InputFieldLocate(Last!,'Name')
			ls_result += wf_result_add(ls_item, "10. arg2 Last ", not isnull(ls_temp) and ls_temp = "name" ) 
			
			//InputFieldLocate，location参数为Next!，带两个参数
			ls_temp = ""
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'Appeon')
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp = rte_1.InputFieldLocate(Next!,'Name')
			ls_result += wf_result_add(ls_item, "11. arg2 Next ", not isnull(ls_temp) and ls_temp = "name" ) 
			
			//InputFieldLocate，location参数为Prior!，带两个参数
			ls_temp = ""
			rte_1.SelectText(2,3,0,0,Detail!)
			ls_temp = rte_1.InputFieldLocate(Prior!,'Name')
			ls_result += wf_result_add(ls_item, "12. arg2 Prior ", not isnull(ls_temp) and ls_temp = "" ) 
			
			//InputFieldLocate，带两个参数，测试函数返回空字符串
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help.~r~n ')
			rte_1.Paste()
			rte_1.InputFieldInsert("ID")
			rte_1.InputFieldChangeData ("ID", '001')
			rte_1.InputFieldInsert("Name")
			rte_1.InputFieldChangeData ("Name", 'sybase')
			rte_1.SelectText(1,1,1,1,Detail!)
			ls_temp = rte_1.InputFieldLocate(Prior!,'Name')
			ls_result += wf_result_add(ls_item, "13. arg2 return empty ", not isnull(ls_temp) and ls_temp = "" ) 
			
		case lower("InsertDocument")
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help~r~tThis HTML help contains the HTML version of several Appeon 3.0 user documents')
			rte_1.Paste()
			ls_file ="PUB_BMP_BT_EMP.bmp"
			rte_1.InsertPicture(ls_file)	
			
			//InsertDocument,只带两个参数，filename为NULL
			//Modified by zhoujunwei at 2017-11-29  insertdocument null参数崩溃
			SetNull(ls_temp2)
			//if string(gi_major)+string(gi_minor) <> "126" then 	
			if  1 <> 1 then
				li_rtn = rte_1.InsertDocument(ls_temp2,true)
				ls_result += wf_result_add(ls_item, "1. arg2 filename null ", isnull(li_rtn) ) 
			else
				//crash in  pb12.6
				ls_result += wf_result_add(ls_item, "1. arg2 filename null ", false ) 
			end if 
			
			// InsertDocument,只带两个参数，clearflag为NULL
			SetNull(lbn_flag)
			ls_temp2 = "w_rtefunw06_rtf01.rtf"
			ls_file = "w_rtefunw06_rtf01.rtf"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += wf_result_add(ls_item, " w_rtefunw06_rtf01.RTF FileExists ", false )
					end if 
				else
					ls_result += wf_result_add(ls_item, " w_rtefunw06_rtf01.RTF FileExists ", false )
				end if 
			end if 
			
			li_rtn = rte_1.InsertDocument(ls_temp2,lbn_flag)
			ls_result += wf_result_add(ls_item, "2. arg2 clearflag null ", isnull(li_rtn) ) 

			//  InsertDocument,带三个参数，filetype为NULL
			
			ls_temp2 = "w_rtefunw06_rtf01.rtf"
			SetNull(lft_FileType)
			li_rtn = rte_1.InsertDocument(ls_temp2,true,lft_FileType)
			ls_result += wf_result_add(ls_item, "3. arg3 filetype null ", isnull(li_rtn) ) 
			
			//ClearFlag=False时插入rtf格式的文件，文件中不包含Header/Footer内容
			ls_temp2 = "w_rtefunw06_rtf02_nohf.RTF"
			ls_file = "w_rtefunw06_rtf02_nohf.rtf"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += wf_result_add(ls_item, " w_rtefunw06_rtf02_nohf.RTF FileExists ", false )
					end if 
				else
					ls_result += wf_result_add(ls_item, " w_rtefunw06_rtf02_nohf.RTF FileExists ", false )
				end if 
			end if 
			
			rte_1.HeaderFooter = false
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,false,lft_FileType)
			ls_result += wf_result_add(ls_item, "4. arg3 ClearFlag is false, no headerfooter ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//ClearFlag=False时插入rtf格式的文件，文件中包含Header/Footer内容，HeaderFooter=false
			ls_temp2 = "w_rtefunw06_rtf01.rtf"
			rte_1.HeaderFooter = false
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,false,lft_FileType)
			ls_result += wf_result_add(ls_item, "5. arg3 ClearFlag is false, headerfooter is false ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//ClearFlag=False时插入rtf格式的文件到Detail区，文件中包含Header/Footer内容，HeaderFooter=true
			ls_temp2 = "w_rtefunw06_rtf01.rtf"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,false,lft_FileType)
			ls_result += wf_result_add(ls_item, "6. arg3 ClearFlag is false, headerfooter is true ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//ClearFlag=False时插入rtf格式的文件到Detail区，文件中包含Header/Footer内容，HeaderFooter=true
			ls_temp2 = "w_rtefunw06_rtf01.rtf"
			rte_1.HeaderFooter = true
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,false,lft_FileType)
			ls_result += wf_result_add(ls_item, "7. arg3 ClearFlag is false, headerfooter is true detail again ", not isnull(li_rtn) and li_rtn = 1 ) 

			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,0,0,Header!)
			
			//ClearFlag=False时插入rtf格式的文件到Header区，文件中包含Header/Footer内容，HeaderFooter=true
			ls_temp2 = "w_rtefunw06_rtf01.rtf"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Header!)
			li_rtn = rte_1.InsertDocument(ls_temp2,false,lft_FileType)
			ls_result += wf_result_add(ls_item, "8. arg3 ClearFlag is false, headerfooter is true Header ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//ClearFlag=False时插入rtf格式的文件到Footer区，文件中包含Header/Footer内容，HeaderFooter=true
			ls_temp2 = "w_rtefunw06_rtf01.rtf"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Footer!)
			li_rtn = rte_1.InsertDocument(ls_temp2,false,lft_FileType)
			ls_result += wf_result_add(ls_item, "9. arg3 ClearFlag is false, headerfooter is true Footer ", not isnull(li_rtn) and li_rtn = 1 ) 
						
			//ClearFlag=False时插入Txt格式的文件到Detail区，HeaderFooter=false
			ls_temp2 = "w_rtefunw06_txt01.txt"
			ls_file = "w_rtefunw06_txt01.txt"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += wf_result_add(ls_item, " w_rtefunw06_txt01.txt FileExists ", false )
					end if 
				else
					ls_result += wf_result_add(ls_item, " w_rtefunw06_txt01.txt FileExists ", false )
				end if 
			end if 
			
			rte_1.HeaderFooter = false
			lft_FileType = FileTypeText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,false,lft_FileType)
			ls_result += wf_result_add(ls_item, "10. arg3 ClearFlag is false, headerfooter is false  ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//ClearFlag=False时插入Txt格式的文件到Detail区，HeaderFooter=true
			ls_temp2 = "w_rtefunw06_txt01.txt"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lft_FileType = FileTypeText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,false,lft_FileType)
			ls_result += wf_result_add(ls_item, "11. arg3 ClearFlag is false, headerfooter is true txt ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			// ClearFlag=true时插入Txt格式的文件，HeaderFooter=false
			ls_temp2 = "w_rtefunw06_txt01.txt"
			rte_1.HeaderFooter = false
			lft_FileType = FileTypeText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,true,lft_FileType)
			ls_result += wf_result_add(ls_item, "12. arg3 ClearFlag is false, headerfooter is false txt ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//ClearFlag=true时插入Txt格式的文件，HeaderFooter=true，Header/footer区效果
			ls_temp2 = "w_rtefunw06_txt01.txt"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lft_FileType = FileTypeText!
			rte_1.SelectText(1,1,0,0,header!)
			li_rtn = rte_1.InsertDocument(ls_temp2,true,lft_FileType)
			ls_result += wf_result_add(ls_item, "13. arg3 ClearFlag is false, headerfooter is true txt header ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			// ClearFlag=true时插入Txt格式的文件，HeaderFooter=true，Detail区效果
			ls_temp2 = "w_rtefunw06_txt01.txt"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lft_FileType = FileTypeText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,true,lft_FileType)
			ls_result += wf_result_add(ls_item, "14. arg3 ClearFlag is true, headerfooter is true txt Detail ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			// ClearFlag=true时插入rtf格式的文件，HeaderFooter=true，Header/footer区效果
			ls_temp2 = "w_rtefunw06_rtf01.rtf"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Header!)
			li_rtn = rte_1.InsertDocument(ls_temp2,true,lft_FileType)
			ls_result += wf_result_add(ls_item, "15. arg3 ClearFlag is true, headerfooter is true rtf Header ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//ClearFlag=true时插入rtf格式的文件，HeaderFooter=true，Detail区效果
			ls_temp2 = "w_rtefunw06_rtf01.rtf"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,true,lft_FileType)
			ls_result += wf_result_add(ls_item, "16. arg3 ClearFlag is true, headerfooter is true rtf Detail ", not isnull(li_rtn) and li_rtn = 1 ) 

			//测试rtf文件中含有不支持的格式化表格
			ls_temp2 = "w_rtefunw06_rtfp17_table.rtf"
			ls_file = "w_rtefunw06_rtfp17_table.rtf"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += wf_result_add(ls_item, " w_rtefunw06_rtfp17_table.rtf FileExists ", false )
					end if 
				else
					ls_result += wf_result_add(ls_item, " w_rtefunw06_rtfp17_table.rtf FileExists ", false )
				end if 
			end if 
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,true,lft_FileType)
			ls_result += wf_result_add(ls_item, "17. arg3 ClearFlag is true, rtf table ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//测试rtf文件中含有不支持的绘图对象
			ls_temp2 = "w_rtefunw06_rtfp18_draw.rtf"
			ls_file = "w_rtefunw06_rtfp18_draw.rtf"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += wf_result_add(ls_item, " w_rtefunw06_rtfp18_draw.rtf FileExists ", false )
					end if 
				else
					ls_result += wf_result_add(ls_item, " w_rtefunw06_rtfp18_draw.rtf FileExists ", false )
				end if 
			end if 
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,true,lft_FileType)
			ls_result += wf_result_add(ls_item, "18. arg3 ClearFlag is true, rtf no support draw ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//测试rtf文件中含有不支持的双下划线
			ls_temp2 = "w_rtefunw06_rtfp19_douunline.rtf"
			ls_file = "w_rtefunw06_rtfp19_douunline.rtf"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += wf_result_add(ls_item, " w_rtefunw06_rtfp19_douunline.rtf FileExists ", false )
					end if 
				else
					ls_result += wf_result_add(ls_item, " w_rtefunw06_rtfp19_douunline.rtf FileExists ", false )
				end if 
			end if 
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,true,lft_FileType)
			ls_result += wf_result_add(ls_item, "19. arg3 ClearFlag is true, rtf no support douunline ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			// 测试指定的文件不存在
			ls_temp2 = "NoExists.rtf"
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,true,lft_FileType)
			ls_result += wf_result_add(ls_item, "20. arg3 ClearFlag is true, NoExists.rtf ", not isnull(li_rtn) and li_rtn = -1 ) 

			//测试指定的文件不为rtf文件，而FileType指定为FileTypeRichText!
			ls_temp2 = "w_rtefunw06_txt01.txt"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,true,lft_FileType)
			ls_result += wf_result_add(ls_item, "21. arg3 ClearFlag is true, rtf + txt ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			// 测试指定的文件为其他类型的文件，而FileType指定为FileTypeText!
			ls_temp2 = "w_rtefunw06_dat01.dat"
			ls_file = "w_rtefunw06_dat01.dat"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += wf_result_add(ls_item, " w_rtefunw06_dat01.dat FileExists ", false )
					end if 
				else
					ls_result += wf_result_add(ls_item, " w_rtefunw06_dat01.dat FileExists ", false )
				end if 
			end if 
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lft_FileType = FileTypeText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,true,lft_FileType)
			ls_result += wf_result_add(ls_item, "22. arg3 ClearFlag is true, dat type ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//测试选中一部分内容，有效调用函数插入文件内容到当前插入点
			ls_temp2 = "w_rtefunw06_rtf01.rtf"
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			lft_FileType = FileTypeRichText!
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = rte_1.InsertDocument(ls_temp2,false,lft_FileType)
			ls_result += wf_result_add(ls_item, "23. arg3 ClearFlag is false, rtf insert ", not isnull(li_rtn) and li_rtn = 1 ) 
			
		case lower("InsertPicture")			
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help~r~tThis HTML help contains the HTML version of several Appeon 3.0 user documents')
			rte_1.Paste()
			ls_file ="PUB_BMP_BT_EMP.bmp"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			li_rtn = rte_1.InsertPicture(ls_fullname)	

//			rte_1.HeaderFooter = false
//			rte_1.ShowHeadFoot(false)

			// InsertPicture,FileName为NULL	
			SetNull(ls_temp)
			li_rtn = 0
			li_rtn = rte_1.InsertPicture(ls_temp)
			ls_result += wf_result_add(ls_item, "1. arg null ", isnull(li_rtn)) 
			
			//InsertPicture,FileName为BMP文件，使用相对路径
			ls_temp = "PUB_BMP_APB.bmp"
			ls_file = "PUB_BMP_APB.bmp"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += wf_result_add(ls_item, " PUB_BMP_APB.bmp FileExists ", false )
					end if 
				else
					ls_result += wf_result_add(ls_item, " PUB_BMP_APB.bmp FileExists ", false )
				end if 
			end if 
			
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = 0
			li_rtn = rte_1.InsertPicture(ls_temp, 1)
			ls_result += wf_result_add(ls_item, "2. arg path ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//InsertPicture,FileName为BMP文件，使用绝对路径
			ls_file = "PUB_BMP_APB.bmp"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			rte_1.SelectText(1,1,0,0,Header!)
			li_rtn = 0
			li_rtn = rte_1.InsertPicture(ls_fullname, 1)
			ls_result += wf_result_add(ls_item, "3. arg fullpath ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//InsertPicture,插入时替换高亮选中内容
			rte_1.HeaderFooter = true
			rte_1.showHeadFoot(true)
			ls_file = "PUB_BMP_AJE.bmp"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			rte_1.SelectText(1,1,0,0,Footer!)
			li_rtn = 0
			li_rtn = rte_1.InsertPicture(ls_fullname, 1)
			ls_result += wf_result_add(ls_item, "4. arg Footer ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			// InsertPicture,连续插入多幅图片
			rte_1.SelectText(1,1,2,10,Detail!)
			ls_file = "PUB_BMP_AJE.bmp"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			li_rtn = 0
			li_rtn = rte_1.InsertPicture(ls_fullname, 1)
			ls_result += wf_result_add(ls_item, "4. arg Detail more pic1 ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			li_rtn = 0
			li_rtn = rte_1.InsertPicture(ls_fullname, 1)
			ls_result += wf_result_add(ls_item, "5. arg Detail more pic2 ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			li_rtn = 0
			li_rtn = rte_1.InsertPicture(ls_fullname, 1)
			ls_result += wf_result_add(ls_item, "6. arg Detail more pic3 ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//InsertPicture,已经存在一幅被单击选中的图片
			rte_1.SelectTextAll(Detail!)
			li_rtn = 0
			li_rtn = rte_1.InsertPicture(ls_fullname, 1)			
			ls_result += wf_result_add(ls_item, "7. select pic ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//png	start.png
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = 0
			ls_file = "start.png"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += wf_result_add(ls_item, " start.png FileExists ", false )
					end if 
				else
					ls_result += wf_result_add(ls_item, " start.png FileExists ", false )
				end if 
			end if 
			li_rtn = rte_1.InsertPicture(ls_fullname, 3)
			ls_result += wf_result_add(ls_item, "8. arg png ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//Bridge.jpg
			rte_1.SelectText(1,1,0,0,Detail!)
			li_rtn = 0
			ls_file = "Bridge.jpg"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += wf_result_add(ls_item, " Bridge.jpg FileExists ", false )
					end if 
				else
					ls_result += wf_result_add(ls_item, " Bridge.jpg FileExists ", false )
				end if 
			end if 
			li_rtn = rte_1.InsertPicture(ls_fullname, 4)
			ls_result += wf_result_add(ls_item, "9. arg jpg ", not isnull(li_rtn) and li_rtn = 1 ) 					
			
		case lower("IsPreview")
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			Clipboard('About this Appeon for PowerBuilder Help~r~tThis HTML help contains the HTML version of several Appeon 3.0 user documents')
			rte_1.Paste()
			
			// Ispreview,控件不处于Preview状态
			rte_1.Preview(false)
			lbn_flag = rte_1.IsPreview()
			ls_result += wf_result_add(ls_item, "1. Ispreview false ", not isnull(lbn_flag) and lbn_flag =false ) 
			
			//Ispreview,控件处于Preview状态
			rte_1.Preview(true)
			lbn_flag = rte_1.IsPreview()
			ls_result += wf_result_add(ls_item, "2. Ispreview true ", not isnull(lbn_flag) and lbn_flag =true ) 
			rte_1.Preview(false)			
			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module3 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname,ls_print
integer 		li_rtn, li_col, li_x, li_y
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data

datastore	lds_tmp
Band			lb_Band
long			ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar
TrigEvent 	ltr_Event

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_file ="PUB_BMP_BT_EMP.bmp"
ls_fullname = gs_cachedir+gs_dirseparator+ls_file
if not FileExists(ls_fullname)  then 
	if isvalid(w_controller) then 					
		w_controller.of_createfile(ls_fullname, sqlca)
		if not FileExists(ls_fullname)  then 
			ls_result += wf_result_add(ls_item, " PUB_BMP_BT_EMP.bmp FileExists ", false )
		end if 
	else
		ls_result += wf_result_add(ls_item, " PUB_BMP_BT_EMP.bmp FileExists ", false )
	end if 
end if 

this.visible = true 			//for debug

ls_array[Upperbound(ls_array) + 1 ] = "LineCount"
ls_array[Upperbound(ls_array) + 1 ] = "LineLength"
ls_array[Upperbound(ls_array) + 1 ] = "Move"
ls_array[Upperbound(ls_array) + 1 ] = "PageCount"
ls_array[Upperbound(ls_array) + 1 ] = "Paste"
ls_array[Upperbound(ls_array) + 1 ] = "PasteRTF"
ls_array[Upperbound(ls_array) + 1 ] = "PointerX"
ls_array[Upperbound(ls_array) + 1 ] = "PointerY"
ls_array[Upperbound(ls_array) + 1 ] = "Position"
ls_array[Upperbound(ls_array) + 1 ] = "PostEvent"
ls_array[Upperbound(ls_array) + 1 ] = "Preview"
//modified by zhoujunwei at 2017-11-29 通过配置文件读取是否执行richtext的打印功能
ls_print = lower(profilestring("testcase.ini","richtext","print",""))
if ls_print = 'true' then
	ls_array[Upperbound(ls_array) + 1 ] = "Print"
	ls_array[Upperbound(ls_array) + 1 ] = "PrintEx"
end if
ls_array[Upperbound(ls_array) + 1 ] = "ReplaceText"
ls_array[Upperbound(ls_array) + 1 ] = "Resize"
ls_array[Upperbound(ls_array) + 1 ] = "SaveDocument"
ls_array[Upperbound(ls_array) + 1 ] = "Scroll"
ls_array[Upperbound(ls_array) + 1 ] = "ScrollNextPage"
ls_array[Upperbound(ls_array) + 1 ] = "ScrollNextRow"
ls_array[Upperbound(ls_array) + 1 ] = "ScrollPriorPage"
ls_array[Upperbound(ls_array) + 1 ] = "ScrollPriorRow"
ls_array[Upperbound(ls_array) + 1 ] = "ScrollToRow"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedColumn"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedLength"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedLine"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedPage"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedStart"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedText"
ls_array[Upperbound(ls_array) + 1 ] = "SelectText"
ls_array[Upperbound(ls_array) + 1 ] = "SelectTextAll"
ls_array[Upperbound(ls_array) + 1 ] = "SelectTextLine"
ls_array[Upperbound(ls_array) + 1 ] = "SelectTextWord"
ls_array[Upperbound(ls_array) + 1 ] = "SetAlignment"
ls_array[Upperbound(ls_array) + 1 ] = "SetFocus"
ls_array[Upperbound(ls_array) + 1 ] = "SetParagraphSetting"
ls_array[Upperbound(ls_array) + 1 ] = "SetPosition"
ls_array[Upperbound(ls_array) + 1 ] = "SetRedraw"
ls_array[Upperbound(ls_array) + 1 ] = "SetSpacing"
ls_array[Upperbound(ls_array) + 1 ] = "SetTextColor"
ls_array[Upperbound(ls_array) + 1 ] = "SetTextStyle"
ls_array[Upperbound(ls_array) + 1 ] = "Show"
ls_array[Upperbound(ls_array) + 1 ] = "ShowHeadFoot"
ls_array[Upperbound(ls_array) + 1 ] = "TextLine"
ls_array[Upperbound(ls_array) + 1 ] = "TriggerEvent"
ls_array[Upperbound(ls_array) + 1 ] = "TypeOf"
ls_array[Upperbound(ls_array) + 1 ] = "Undo"


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
	is_type = ""
	lbn_flag = false
	choose case lower(ls_item)
		case lower("LineCount")
			rte_1.WordWrap = false 
			// LineCount,控件内容为空
			rte_1.SelectTextAll()
			rte_1.Clear()
			ll_tmp = rte_1.LineCount()
			ls_result += wf_result_add(ls_item, "1. empty ", not isnull(ll_tmp) and ll_tmp =1 ) 			
			
			//  LineCount,计算Detail区的行数
			rte_1.HeaderFooter=true
			rte_1.ShowHeadFoot(true)
			ClipBoard('About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.')
			rte_1.SelectText(1,1,0,0,Header!)
			rte_1.Paste()
			rte_1.SelectText(1,1,0,0,Footer!)
			rte_1.Paste()
			
			ll_tmp = 0 
			rte_1.SelectText(1,1,0,0,Detail!)
			ll_tmp = rte_1.LineCount()
			ls_result += wf_result_add(ls_item, "2. count ", not isnull(ll_tmp) and ll_tmp = 15 ) 			
			
			//LineCount,计算header区的行数
//			rte_1.HeaderFooter=true
//			rte_1.ShowHeadFoot(true)
			ClipBoard('About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.')
			rte_1.SelectText(1,1,0,0,Header!)
			rte_1.Paste()
			rte_1.SelectText(1,1,0,0,Footer!)
			rte_1.Paste()
			
			ll_tmp = 0 
			rte_1.SelectText(1,1,0,0,Header!)
			ll_tmp = rte_1.LineCount()
			ls_result += wf_result_add(ls_item, "3. Header ", not isnull(ll_tmp) and ll_tmp = 29 ) 		
			
			// LineCount,计算Footer区的行数
//			rte_1.HeaderFooter=true
//			rte_1.ShowHeadFoot(true)
			ClipBoard('About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.')
			rte_1.SelectText(1,1,0,0,Header!)
			rte_1.Paste()
			rte_1.SelectText(1,1,0,0,Footer!)
			rte_1.Paste()
			
			ll_tmp = 0 
			rte_1.SelectText(1,1,0,0,Footer!)
			ll_tmp = rte_1.LineCount()
			ls_result += wf_result_add(ls_item, "4. Footer ", not isnull(ll_tmp) and ll_tmp = 44 ) 	
			
			//LineCount,是否计算InputField长度
			rte_1.SelectText(100,1,100,1,Detail!)
			rte_1.InputFieldInsert('appeontest')
			rte_1.InputFieldChangeData('appeontest','About this Appeon for PowerBuilder Help')
			ll_tmp = 0 
			ll_tmp = rte_1.LineCount()
			ls_result += wf_result_add(ls_item, "5. InputField ", not isnull(ll_tmp) and ll_tmp = 44 ) 	
			
			//LineCount,是否计算图片的长度
			ls_file ="PUB_BMP_APB.bmp"		 
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += wf_result_add(ls_item, " PUB_BMP_APB.bmp FileExists ", false )
					end if 
				else
					ls_result += wf_result_add(ls_item, " PUB_BMP_APB.bmp FileExists ", false )
				end if 
			end if 	
			rte_1.InsertPicture(ls_fullname)			
			
			ll_tmp = 0 
			ll_tmp = rte_1.LineCount()
			ls_result += wf_result_add(ls_item, "6. pic ", not isnull(ll_tmp) and ll_tmp = 45 ) 	
			
			//LineCount,WordWrap=true
			rte_1.WordWrap = true
			ll_tmp = 0 
			ll_tmp = rte_1.LineCount()
			ls_result += wf_result_add(ls_item, "7. WordWrap is true ", not isnull(ll_tmp) and ll_tmp = 45 ) 	
			
			rte_1.WordWrap = false
			rte_1.ShowHeadFoot(false)
			rte_1.HeaderFooter=false
		case lower("LineLength")
			rte_1.SelectTextAll (detail! )
			rte_1.Clear( )
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'	
			rte_1.SelectText(1,1,0,0,detail!)
			Clipboard(ls_temp2)
			rte_1.paste()
			rte_1.SelectText(1,1,0,0)
			
			// Linelength,插入点在Detail区
			rte_1.SelectText(1,1,0,0,Detail!)
			ll_tmp = rte_1.LineLength()
			ls_result += wf_result_add(ls_item, "1.insert point in detail ", not isnull(ll_tmp) and ll_tmp = 68 ) 	
			
			// Linelength,插入点在Header区
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,0,0,Header!)
			ClipBoard("I'm chinese")
			rte_1.Paste()
			rte_1.SelectText(1,1,0,0,Footer!)
			rte_1.Paste()
			rte_1.SelectText(1,1,0,0,Header!)
			ll_tmp = 0 
			ll_tmp = rte_1.LineLength()
			ls_result += wf_result_add(ls_item, "2.insert point in Header ", not isnull(ll_tmp) and ll_tmp = 72 ) 	
			
			//Linelength,插入点在Footer区
//			rte_1.HeaderFooter = true
//			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,0,0,Header!)
			ClipBoard("I'm chinese")
			rte_1.Paste()
			rte_1.SelectText(1,1,0,0,Footer!)
			rte_1.Paste()
			
			rte_1.SelectText(1,1,0,0,Footer!)
			ll_tmp = 0 
			ll_tmp = rte_1.LineLength()
			ls_result += wf_result_add(ls_item, "3.insert point in Footer ", not isnull(ll_tmp) and ll_tmp = 65 ) 
			
			//Linelength,计算某行存在图片的Length
			ls_file ="PUB_BMP_BT_EMP.bmp"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			rte_1.InsertPicture(ls_fullname)			
			ll_tmp = 0 
			ll_tmp = rte_1.LineLength()
			ls_result += wf_result_add(ls_item, "4. picture in row ", not isnull(ll_tmp) and ll_tmp = 66 ) 
			
			//Linelength,WordWrap=true
			rte_1.WordWrap = true
			ll_tmp = 0 
			ll_tmp = rte_1.LineLength()
			ls_result += wf_result_add(ls_item, "5. WordWrap is true ", not isnull(ll_tmp) and ll_tmp = 66 ) 
			
			rte_1.WordWrap = false
			
			// Linelength,从前往后选择多行数据时，计算结束行的数据长度
			rte_1.SelectText(1,1,8,10,Detail!)
			ll_tmp = 0 
			ll_tmp = rte_1.LineLength()
			ls_result += wf_result_add(ls_item, "6. from first to end ", not isnull(ll_tmp) and ll_tmp = 66 ) 
			
			// Linelength,从后往前选择多行数据时，计算开始行的数据长度
			rte_1.SelectText(10,10,1,1,Detail!)
			ll_tmp = 0 
			ll_tmp = rte_1.LineLength()
			ls_result += wf_result_add(ls_item, "7. from end to first ", not isnull(ll_tmp) and ll_tmp = 66 ) 
						
			// Linelength,测试多字节字符的长度计算
			rte_1.SelectText(1,1,0,0,Detail!)
			ClipBoard('我是中国人,我爱我的祖国和人民')
			rte_1.Paste()
			ll_tmp = 0 
			ll_tmp = rte_1.LineLength()
			ls_result += wf_result_add(ls_item, "8. multi bit word ", not isnull(ll_tmp) and ll_tmp = 52 ) 
			
			// Linelength,测试是否计算InputField的长度
			rte_1.InputFieldInsert('appeontest')
			rte_1.InputFieldChangeData('appeontest','About this Appeon for PowerBuilder Help')
			ll_tmp = 0 
			ll_tmp = rte_1.LineLength()				
			ls_result += wf_result_add(ls_item, "9. InputField length ", not isnull(ll_tmp) and ll_tmp = 49 ) 
			
			rte_1.HeaderFooter = false
			rte_1.ShowHeadFoot(false)
		case lower("Move")
			rte_1.SelectTextAll (detail! )
			rte_1.Clear( )
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'				
			Clipboard(ls_temp2)
			rte_1.SelectText(1,1,0,0,detail!)
			rte_1.paste()
			
			ls_file ="PUB_BMP_BT_EMP.bmp"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			rte_1.InsertPicture(ls_fullname)		
			rte_1.SelectText(1,1,0,0,detail!)
			
			// Move，参数X指定为NULL			
			SetNull(li_x)
			li_y = 0 
			li_rtn = 0
			li_rtn = rte_1.Move(li_x,li_y)
			ls_result += wf_result_add(ls_item, "1. x null ", isnull(li_rtn) ) 
			
			// Move，参数Y指定为NULL
			li_X = 0
			li_rtn = 0 
			SetNull(li_Y)
			li_rtn = rte_1.Move(li_X,li_Y)
			ls_result += wf_result_add(ls_item, "2. y null ", isnull(li_rtn)  ) 
			
			//Move，参数X、Y指定为负数
			li_X = -100
			li_Y = -100
			li_rtn = 0 
			li_rtn = rte_1.Move(li_X,li_Y)
			ls_result += wf_result_add(ls_item, "3. negative number  ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			//Move，参数X、Y指定为正数
			li_X = 100
			li_Y = 100
			li_rtn =  0 
			li_rtn = rte_1.Move(li_X,li_Y)
			ls_result += wf_result_add(ls_item, "4. num  ", not isnull(li_rtn) and li_rtn = 1 ) 
			
		case lower("PageCount")
			//PageCount，控件中无内容
			rte_1.SelectTextAll()
			rte_1.Clear()
			//modified by zhoujunwei at 2017-11-29 pagecount崩溃
			//if string(gi_major)+string(gi_minor) <> "126" then 
			if 1<>1 then 
				li_rtn = rte_1.PageCount()							//crash in pb12.6
				ls_result += wf_result_add(ls_item, "1. no content ", not isnull(li_rtn) and li_rtn = 1 ) 
			else
//				li_rtn = rte_1.PageCount()
				ls_result += wf_result_add(ls_item, "1. no content ", false ) 
			end if 

			//PageCount，控件中只有一页内容
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'				
			Clipboard(ls_temp2)
			rte_1.paste()
			//rte_1.SelectText(1,1,0,0,detail!)						//这段代码连着这里用有问题
			
			li_rtn = 0 
			if 1 <>  1 then
			//if string(gi_major)+string(gi_minor) <> "126" then 
				li_rtn = rte_1.PageCount()
				ls_result += wf_result_add(ls_item, "2. one page content ", not isnull(li_rtn) and li_rtn = 1 ) 
			else
				ls_result += wf_result_add(ls_item, "2. one page content ", false) 				
			end if 
			
			//PageCount，控件中有多页内容
			rte_1.SelectTextAll()
			rte_1.Clear()
			//看不清的代码。。。。
			ls_Temp = 'Series1~tphqg~thume~r~nSeries2~tayln~tlfdx~r~nSeries3~tfirc~tvscx~r~nSeries4~tggbw~tkfnq~r~nSeries1~tduxw~tfnfo~r~nSeries2~tzvsr~ttkjp~r~nSeries3~trepg~tgxrp~r~nSeries4~tnrvy~tstmw~r~nSeries1~tcysy~tycqp~r~nSeries2~tevik~teffm~r~nSeries3~tznim~tkkas~r~nSeries4~tvwsr~tenzk~r~nSeries1~tycxf~txtls~r~nSeries2~tgyps~tfadp~r~nSeries3~tooef~txzbc~r~nSeries4~toeju~tvpva~r~nSeries1~tboyg~tpoey~r~nSeries2~tlfpb~tnplj~r~nSeries3~tvrvi~tpyam~r~nSeries4~tyehw~tqnqr~r~nSeries1~tqpmx~tujjl~r~nSeries2~toova~towux~r~nSeries3~twhms~tncbx~r~nSeries4~tcoks~tfzkv~r~nSeries1~tatxd~tknly~r~nSeries2~tjyhf~tixjs~r~nSeries3~twnkk~tufnu~r~nSeries4~txxzr~tzbmn~r~nSeries1~tmgqo~toket~r~nSeries2~tlyhn~tkoau~r~nSeries3~tgzqr~tcddi~r~nSeries4~tutei~tojwa~r~nSeries1~tyyzp~tvscm~r~nSeries2~tpsaj~tlfvg~r~nSeries3~tubfa~taovl~r~nSeries4~tzyln~ttrkd~r~nSeries1~tcpws~trtes~r~nSeries2~tjwhd~tizco~r~nSeries3~tbzcn~tfwlq~r~nSeries4~tijtv~tdwvx~r~nSeries1~thrcb~tldvg~r~nSeries2~tylwg~tbusb~r~nSeries3~tmbor~txtlh~r~nSeries4~tcsmp~txohg~r~nSeries1~tmgnk~teufd~r~nSeries2~txoto~tgbgx~r~nSeries3~tpeya~tnfet~r~nSeries4~tcuke~tpzsh~r~nSeries1~tklju~tggge~r~nSeries2~tkjdq~tzjen~r~nSeries3~tpevq~tgxie~r~nSeries4~tpjsr~tdzja~r~nSeries1~tzujl~tlchh~r~nSeries2~tbfqm~tkimw~r~nSeries3~tzobi~twybx~r~nSeries4~tduun~tfsks~r~nSeries1~trsrt~tekmq~r~nSeries2~tdcyz~tjeeu~r~nSeries3~thmsr~tqcoz~r~nSeries4~tijip~tfion~r~nSeries1~teedd~tpszr~r~nSeries2~tnavy~tmmta~r~nSeries3~ttbdz~tqsoe~r~nSeries4~tmuvn~tppps~r~nSeries1~tuacb~tazux~r~nSeries2~tmhec~tthle~r~nSeries3~tgrpu~tnkdm~r~nSeries4~tbppw~teqtg~r~nSeries1~tjopa~trmow~r~nSeries2~tzdqy~toxyt~r~nSeries3~tjbbh~tawdy~r~nSeries4~tdcpr~tjbxp~r~nSeries1~thooh~tpkwq~r~nSeries2~tyuhr~tqzhn~r~nSeries3~tbnfu~tvqnq~r~nSeries4~tqlrz~tjpxi~r~nSeries1~togvl~tiexd~r~nSeries2~tzuzo~tsrkr~r~nSeries3~tusvo~tjbrz~r~nSeries4~tmwzp~towkj~r~nSeries1~tilef~traam~r~nSeries2~tdigp~tnpuu~r~nSeries3~thgxp~tqnjw~r~nSeries4~tjmwa~txxmn~r~nSeries1~tsnhh~tlqqr~r~nSeries2~tzudl~ttfzo~r~nSeries3~ttcjt~tnzxu~r~nSeries4~tglsd~tsmzc~r~nSeries1~tnock~tvfaj~r~nSeries2~tfrmx~totho~r~nSeries3~twkbj~tzwuc~r~nSeries4~twljf~trimp~r~nSeries1~tmyhc~thzri~r~nSeries2~twkba~trxbg~r~nSeries3~tfcbc~teyhj~r~nSeries4~tugix~twtbv~r~nSeries1~ttreh~tbbcp~r~nSeries2~txifb~txvfb~r~nSeries3~tcgkc~tfqck~r~nSeries4~tcotz~tgkub~r~nSeries1~tmjrm~tbszt~r~nSeries2~tsshf~troef~r~nSeries3~twsjr~txjhg~r~nSeries4~tuzyu~tpzww~r~nSeries1~teiqu~trpix~r~nSeries2~tiqfl~tduuv~r~nSeries3~teoow~tqcud~r~nSeries4~thnef~tnjha~r~nSeries1~timuc~tzfsk~r~nSeries2~tuidu~tburi~r~nSeries3~tswtb~trecu~r~nSeries4~tykab~tfcvk~r~nSeries1~tdzez~ttoid~r~nSeries2~tukuh~tjzef~r~nSeries3~tczzz~tbfkq~r~nSeries4~tdpqz~tikfo~r~nSeries1~tbucd~ththx~r~nSeries2~tdjgk~tjelr~r~nSeries3~tlpax~tamce~r~nSeries4~trosw~titdp~r~nSeries1~ttpcc~tlifk~r~nSeries2~teljy~ttihr~r~nSeries3~tcqay~tbnef~r~nSeries4~txnxv~tgzed~r~nSeries1~tyyhn~tgycd~r~nSeries2~trudm~tphme~r~nSeries3~tckot~trwos~r~nSeries4~tpofg~thfoz~r~nSeries1~tqvlq~tfxww~r~nSeries2~tkmfx~tdyyg~r~nSeries3~tmdca~tszsg~r~nSeries4~tovso~tdkjg~r~nSeries1~thcwm~tbmxr~r~nSeries2~tmhuy~tfyqg~r~nSeries3~tajqk~tcklz~r~nSeries4~tnayx~tqkqo~r~nSeries1~tyzwm~tyubz~r~nSeries2~tazcp~tkhkt~r~nSeries3~tkydz~tivcu~r~nSeries4~typur~tfmbi~r~nSeries1~tsgek~tyrgz~r~nSeries2~tvxdh~tpoam~r~nSeries3~tvafy~trarx~r~nSeries4~tsvkh~ttqdi~r~nSeries1~thers~tigbh~r~nSeries2~tzjzu~tjxmm~r~nSeries3~tyspn~tarae~r~nSeries4~twkeg~tjccv~r~nSeries1~thhrj~tvbjt~r~nSeries2~tsqdj~tootg~r~nSeries3~tpknf~tpfyc~r~nSeries4~tgfie~towqr~r~nSeries1~twwwp~tzsqm~r~nSeries2~tetog~tepsp~r~nSeries3~txnvj~tiupa~r~nSeries4~tlyyn~tmkmn~r~nSeries1~tuvkl~thsec~r~nSeries2~tdwra~tcgfm~r~nSeries3~tzkgi~tpdfo~r~nSeries4~tdkjm~tjqwi~r~nSeries1~tqpuo~tqhim~r~nSeries2~tvfvu~tzwyv~r~nSeries3~tijgf~tullk~r~nSeries4~tjduh~tsjaf~r~nSeries1~tbtlk~tmfqr~r~nSeries2~tmyjf~tjnhh~r~nSeries3~tssqc~ttydt~r~nSeries4~teamd~tcjbp~r~nSeries1~trhtn~tegyi~r~nSeries2~twxgc~tjwlg~r~nSeries3~trsme~taear~r~nSeries4~twtvj~tsjba~r~nSeries1~toioj~tlwhy~r~nSeries2~tpnvr~tuiho~r~nSeries3~tswki~tfygt~r~nSeries4~tydha~tcwyh~r~nSeries1~tsgew~tzmtg~r~nSeries2~tonzl~ttjhg~r~nSeries3~tauhn~tihre~r~nSeries4~tqgjf~twkjs~r~nSeries1~tmtpj~thaef~r~nSeries2~tqzaa~tuldr~r~nSeries3~tchjc~tcdyr~r~nSeries4~tfvvr~tivuy~r~nSeries1~teegf~tivdr~r~nSeries2~tcygu~trqdr~r~nSeries3~tedak~tubnf~r~nSeries4~tgupr~toqyl~r~nSeries1~tobcw~tqxkz~r~nSeries2~tmaus~tjgmh~r~nSeries3~tcmhg~tdnmp~r~nSeries4~thnqk~tamhu~r~nSeries1~trktr~tffac~r~nSeries2~tlvgr~tzkkl~r~nSeries3~tdacl~tlteo~r~nSeries4~tjomo~tnxrq~r~nSeries1~tyjzg~tinrn~r~nSeries2~tnzwa~tcxxa~r~nSeries3~tedrw~tudxz~r~nSeries4~trfus~tewjt~r~nSeries1~tboxv~tynfh~r~nSeries2~tkstc~tenau~r~nSeries3~tmndd~txfdm~r~nSeries4~tvzca~tutdc~r~nSeries1~tckxa~taydz~r~nSeries2~tsxtt~tobbg~r~nSeries3~tqngv~tvpjg~r~nSeries4~tojog~tlmkx~r~nSeries1~tgbfc~tpypc~r~nSeries2~tkqch~tbddz~r~nSeries3~twrxb~tzmqr~r~nSeries4~tlxvo~tbtwh~r~nSeries1~txgin~tfgfr~r~nSeries2~tcclm~tznmj~r~nSeries3~tugww~tbsqf~r~nSeries4~tcihu~tbsjo~r~nSeries1~tllms~tqsgh~r~nSeries2~tmcph~telso~r~nSeries3~ttflb~tgsfn~r~nSeries4~tpcuz~tsrup~r~nSeries1~tchyn~tvzhc~r~nSeries2~tpqug~triwn~r~nSeries3~tiqxd~tfjpw~r~nSeries4~tpxfb~tlkpn~r~nSeries1~tpeel~tfjmt~r~nSeries2~tkuqp~tzomw~r~nSeries3~tnlmb~tupmk~r~nSeries4~ttlpt~tndmp~r~nSeries1~tdsyd~tsgvf~r~nSeries2~tpene~tmwbo~r~nSeries3~trifs~tuqhc~r~nSeries4~teskm~tkhss~r~nSeries1~tmvno~tnwaf~r~nSeries2~txwhg~tbiba~r~nSeries3~tbvqo~tpqfo~r~nSeries4~tvius~tsqfq~r~nSeries1~tweht~txdzu~r~nSeries2~tjtln~ttxmr~r~nSeries3~tjxxw~ttlgg~r~nSeries4~tkytb~tioly~r~nSeries1~tdnil~tqado~r~nSeries2~tjskk~tvfxa~r~nSeries3~thhjm~tbocl~r~nSeries4~tjari~tntdw~r~nSeries1~tcldv~tdxro~r~nSeries2~tpbyj~tzwyy~r~nSeries3~tojuo~tthwm~r~nSeries4~tlvrg~tlfzd~r~nSeries1~tzdbt~tubxu~r~nSeries2~toffv~tncrs~r~nSeries3~twsaz~tnmoi~r~nSeries4~tjoiv~tvgob~r~nSeries1~tqpnc~tkwvn~r~nSeries2~thkeb~tmtdh~r~nSeries3~tvygk~tjisu~r~nSeries4~txhat~tmuud~r~nSeries1~tqbhm~tknhf~r~nSeries2~txaxq~txkjl~r~nSeries3~tzzqt~tsjfa~r~nSeries4~teedf~tuujk~r~nSeries1~tolxj~toqkd~r~nSeries2~tvfep~tvlhv~r~nSeries3~thrwt~tfduk~r~nSeries4~txffj~tpssw~r~nSeries1~tyxli~tjjhe~r~nSeries2~tvryx~tozba~r~nSeries3~tfpfm~towgr~r~nSeries4~tgonu~tatdq~r~nSeries1~tlahy~tggyl~r~nSeries2~tjddj~thmlt~r~nSeries3~tedzl~todsr~r~nSeries4~tkeut~tgtnk~r~nSeries1~tntar~tjkpx~r~nSeries2~tinov~tgzdt~r~nSeries3~thunw~tooxv~r~nSeries4~tjjmp~tsvkn~r~nSeries1~thkwj~topmm~r~nSeries2~tlebk~tsucv~r~nSeries3~tzqly~tqnwc~r~nSeries4~tmbvb~thrml~r~nSeries1~towpj~tbwyv~r~nSeries2~twtgt~toqnm~r~nSeries3~ticxa~tpzar~r~nSeries4~tknnx~ttuuf~r~nSeries1~tarzr~tosdq~r~nSeries2~twsmt~tcjgh~r~nSeries3~tecqu~tdosr~r~nSeries4~ttjxy~taayk~r~nSeries1~tqrxy~tcrxu~r~nSeries2~twjxn~tpqjn~r~nSeries3~tbkcp~tdmok~r~nSeries4~talxa~tpemv~r~nSeries1~tbqlz~tsvxz~r~nSeries2~tkuta~tppwg~r~nSeries3~tzpdp~tyzkz~r~nSeries4~tcvbn~ttcvf~r~nSeries1~txsxp~tjaox~r~nSeries2~ttfhv~txxyt~r~nSeries3~tgokr~tcxae~r~nSeries4~ttauq~tgndm~r~nSeries1~tphwz~tyiay~r~nSeries2~tabjr~tqgep~r~nSeries3~tpxyj~tstty~r~nSeries4~tzuvl~tdvyb~r~nSeries1~tsuxk~tbmfz~r~nSeries2~tvrtn~tovid~r~nSeries3~tznpg~thozv~r~nSeries4~tafms~tnsnq~r~nSeries1~tivmv~tubcw~r~nSeries2~ttfsr~tqtmk~r~nSeries3~tnepb~thowe~r~nSeries4~tjazh~tkwcm~r~nSeries1~tmtpi~txxxl~r~nSeries2~tzqys~txtww~r~nSeries3~ttaid~tyaxy~r~nSeries4~tqlep~trxib~r~nSeries1~texxy~tfvsd~r~nSeries2~tdygt~thcuy~r~nSeries3~tyfwp~tjsfy~r~nSeries4~tbglg~tzmbi~r~nSeries1~tntat~ttnho~r~nSeries2~tdton~tpyzw~r~nSeries3~totkg~tngup~r~nSeries4~thpkx~teato~r~nSeries1~twzab~tsdnv~r~nSeries2~tqhkf~tcmof~r~nSeries3~tisfr~tfqgv~r~nSeries4~tpmvo~trpjf~r~nSeries1~tzslz~tmpjj~r~nSeries2~tnehr~tykxj~r~nSeries3~tzubu~taccl~r~nSeries4~tfkcy~tzobg~r~nSeries1~thtuo~txraj~r~nSeries2~tvpre~tcwgx~r~nSeries3~txpsw~tcgmm~r~nSeries4~tvede~twdmf~r~nSeries1~tnqwc~tuqds~r~nSeries2~tcili~tqeci~r~nSeries3~thlui~tlgmf~r~nSeries4~tcswt~twkkx~r~nSeries1~tlcbh~tqkvc~r~nSeries2~tswje~tbkrj~r~nSeries3~tlpgf~tgrat~r~nSeries4~tzbsg~tuvzi~r~nSeries1~tfnhy~txwjs~r~nSeries2~tjavw~tauxp~r~nSeries3~tanna~tmxjd~r~nSeries4~tvzuh~tnacz~r~nSeries1~tyhep~twzol~r~nSeries2~thusl~trkvw~r~nSeries3~tpnvg~tzmii~r~nSeries4~tzwud~twdfz~r~nSeries1~tlktb~tqdxg~r~nSeries2~tyyiu~tdsjv~r~nSeries3~tezkm~tesbj~r~nSeries4~tlkye~trtah~r~nSeries1~tnexh~tuqmj~r~nSeries2~ticbm~tusqd~r~nSeries3~tklas~tolwj~r~nSeries4~txptx~txeum~r~nSeries1~tzfwy~tucpa~r~nSeries2~tbqse~tffun~r~nSeries3~tqpkf~tnnbe~r~nSeries4~tcbbc~tjpdy~r~nSeries1~tjlib~titll~r~nSeries2~tplxe~tlrdk~r~nSeries3~texdt~tquvp~r~nSeries4~tttey~thtlq~r~nSeries1~tlbbb~tvoqo~r~nSeries2~tzkyn~tayyr~r~nSeries3~tbaqm~tyjhz~r~nSeries4~txnds~tiyfs~r~nSeries1~texwb~tioew~r~nSeries2~tqvqr~ttcdl~r~nSeries3~tpqmv~tjifv~r~nSeries4~tgymk~tgotz~r~nSeries1~tjmnz~tqtmr~r~nSeries2~tpnde~tvnmt~r~nSeries3~thjit~tsspa~r~nSeries4~tqnjr~tdoyj~r~n '
			ClipBoard(ls_Temp)
			rte_1.Paste()
			li_rtn = 0 
			
			//modified by zhoujunwei at 2017-11-29 pagecount崩溃
			if 1 <> 1 then
			//if string(gi_major)+string(gi_minor) <> "126" then 
				li_rtn = rte_1.PageCount()
				ls_result += wf_result_add(ls_item, "3. more pages content ", not isnull(li_rtn) and li_rtn > 0 ) 
			else
				ls_result += wf_result_add(ls_item, "3. more pages content ", false) 
			end if 
			
			//PageCount，控件与DataStore共享数据，DataStore中有多页数据，每行数据不超过一页
			rte_1.SelectTextAll()
			rte_1.Clear()
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'				
			Clipboard(ls_temp2)
//			rte_1.SelectText(1,1,0,0,detail!)
			rte_1.paste()
			
			ls_file ="PUB_BMP_BT_EMP.bmp"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			rte_1.InsertPicture(ls_fullname)	
			rte_1.SelectText(1,1,0,0,detail!)
						
			lds_tmp = create datastore
			lds_tmp.dataobject = "rtdwfuncne_d03_grid"
			lds_tmp.settransobject(sqlca)
			lds_tmp.retrieve()
			
			rte_1.InputFieldInsert("emp_id")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("dep_id")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("emp_code")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("emp_name")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("emp_sex")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("emp_born")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("emp_age")
			rte_1.ReplaceText(" ~r~n ")
			rte_1.InputFieldInsert("emp_salary")
			rte_1.ReplaceText(" ~r~n ")
			
			rte_1.DataSource(lds_tmp)
			li_rtn = 0 
			li_rtn = rte_1.PageCount()
			ls_result += wf_result_add(ls_item, "4. DataStore content ", not isnull(li_rtn) and li_rtn = 1 ) 
			
			destroy lds_tmp
			
		case lower("Paste")
			//Paste，剪贴板中的数据为空
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp2 = ""
			ClipBoard(ls_temp2)
			ll_tmp = rte_1.Paste()
			ls_result += wf_result_add(ls_item, "1. empty ", not isnull(ll_tmp) and ll_tmp = 0 ) 
			
			// Paste，将剪贴板中的数据粘帖到Detail区
			ll_tmp = 0 
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_temp2 ='Series1~tzjqn~taqpo~r~nSeries2~thygj~tsjta~r~nSeries3~tkzrs~tosyq~r~nSeries4~thquh~tkjcj~r~nSeries1~tyugt~tedog~r~nSeries2~tfurk~txiyq~r~nSeries3~tufot~tiajm~r~nSeries4~twhyi~tlthm~r~nSeries1~toevl~twlrx~r~nSeries2~tpwpz~thsvb~r~nSeries3~tfzvt~tvhwy~r~nSeries4~tcfzn~tmaom~r~nSeries1~tafsy~tvyrq~r~nSeries2~tpizt~teuox~r~nSeries3~tgthf~txsmx~r~nSeries4~tjrwp~tsurs~r~nSeries1~tgwth~thilg~r~nSeries2~tdhzf~tzaxa~r~nSeries3~tdtkl~thyhq~r~nSeries4~tzfdi~tmsru~r~n ' 
			ClipBoard(ls_temp2 )
			ll_tmp = rte_1.Paste()
			ls_result += wf_result_add(ls_item, "2. detail ", not isnull(ll_tmp) and ll_tmp <= len(ls_temp2) and ll_tmp > 0 ) 
			
			// Paste，将剪贴板中的数据粘帖到Header区
			ll_tmp = 0 
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectTextAll(Header!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Header!)
			ls_temp2 ='Series1~tzjqn~taqpo~r~nSeries2~thygj~tsjta~r~nSeries3~tkzrs~tosyq~r~nSeries4~thquh~tkjcj~r~nSeries1~tyugt~tedog~r~nSeries2~tfurk~txiyq~r~nSeries3~tufot~tiajm~r~nSeries4~twhyi~tlthm~r~nSeries1~toevl~twlrx~r~nSeries2~tpwpz~thsvb~r~nSeries3~tfzvt~tvhwy~r~nSeries4~tcfzn~tmaom~r~nSeries1~tafsy~tvyrq~r~nSeries2~tpizt~teuox~r~nSeries3~tgthf~txsmx~r~nSeries4~tjrwp~tsurs~r~nSeries1~tgwth~thilg~r~nSeries2~tdhzf~tzaxa~r~nSeries3~tdtkl~thyhq~r~nSeries4~tzfdi~tmsru~r~n '
			ClipBoard(ls_temp2 )
			ll_tmp = rte_1.Paste()
			ls_result += wf_result_add(ls_item, "3. Header ", not isnull(ll_tmp) and ll_tmp <= len(ls_temp2) and ll_tmp > 0 ) 
			
			//Paste，将剪贴板中的数据粘帖到Footer区
			ll_tmp = 0 
//			rte_1.HeaderFooter = true
//			rte_1.ShowHeadFoot(true)
			rte_1.SelectTextAll(Footer!)
			rte_1.Clear()
			rte_1.SelectText(1,1,0,0,Footer!)
			ls_temp2 ='Series1~tzjqn~taqpo~r~nSeries2~thygj~tsjta~r~nSeries3~tkzrs~tosyq~r~nSeries4~thquh~tkjcj~r~nSeries1~tyugt~tedog~r~nSeries2~tfurk~txiyq~r~nSeries3~tufot~tiajm~r~nSeries4~twhyi~tlthm~r~nSeries1~toevl~twlrx~r~nSeries2~tpwpz~thsvb~r~nSeries3~tfzvt~tvhwy~r~nSeries4~tcfzn~tmaom~r~nSeries1~tafsy~tvyrq~r~nSeries2~tpizt~teuox~r~nSeries3~tgthf~txsmx~r~nSeries4~tjrwp~tsurs~r~nSeries1~tgwth~thilg~r~nSeries2~tdhzf~tzaxa~r~nSeries3~tdtkl~thyhq~r~nSeries4~tzfdi~tmsru~r~n ' 
			ClipBoard(ls_temp2)
			ll_tmp = rte_1.Paste()
			ls_result += wf_result_add(ls_item, "4. Footer ", not isnull(ll_tmp) and ll_tmp <= len(ls_temp2) and ll_tmp > 0 ) 
			
			rte_1.ShowHeadFoot(false)
			rte_1.HeaderFooter=false
			
			//Paste，粘帖时是否替换被选中的内容
			ll_tmp = 0 
			rte_1.SelectTextAll(Detail!)
			ls_temp2 ='Series1~teecx~tkqkr~r~nSeries2~tudlm~tzgdt~r~nSeries3~tnhmi~tvnnk~r~nSeries4~tclga~trygy~r~nSeries1~tdqdh~tltrs~r~nSeries2~tthid~tzyqa~r~nSeries3~tzfno~tvktq~r~nSeries4~tcotc~thcol~r~nSeries1~tinei~tytym~r~nSeries2~trjsc~tyoei~r~nSeries3~tvdyh~tphlj~r~nSeries4~tzhez~tohmi~r~nSeries1~turcp~tblvw~r~nSeries2~taaji~tqugt~r~nSeries3~taoqm~temjl~r~nSeries4~thgox~tprur~r~nSeries1~ttymk~tktdb~r~nSeries2~tnoxw~tttge~r~nSeries3~teqim~tlhcz~r~nSeries4~ttcty~tphme~r~n ' 
			ClipBoard(ls_temp2 )
			ll_tmp = rte_1.Paste()
			ls_result += wf_result_add(ls_item, "5. select replace ", not isnull(ll_tmp) and ll_tmp <= len(ls_temp2) and ll_tmp > 0 ) 
			
			//Paste，是否能粘帖RichText格式的内容
			ll_tmp = 0 
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ls_temp2 ="{\rtf1\ansi\ansicpg1252\uc2 \deff0\deflang1033\deflangfe1033{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman;}{\f17\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}\'cb\'ce\'cc\'e5{\*\falt SimSun};}~r~n{\f28\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}@\'cb\'ce\'cc\'e5;}{\f29\froman\fcharset238\fprq2 Times New Roman CE;}{\f30\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f32\froman\fcharset161\fprq2 Times New Roman Greek;}~r~n{\f33\froman\fcharset162\fprq2 Times New Roman Tur;}{\f34\froman\fcharset177\fprq2 Times New Roman (Hebrew);}{\f35\froman\fcharset178\fprq2 Times New Roman (Arabic);}{\f36\froman\fcharset186\fprq2 Times New Roman Baltic;}~r~n{\f167\fnil\fcharset0\fprq2 SimSun Western{\*\falt SimSun};}{\f255\fnil\fcharset0\fprq2 @\'cb\'ce\'cc\'e5 Western;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;~r~n\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{~r~n\ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \fs22\cf1\lang1033\langfe2052\loch\f17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 \snext0 Normal;}{\*\cs10 \additive Default Paragraph Font;}}{\info~r~n{\title Tjokdrelkdfaslk;sdf}{\author appeon}{\operator appeon}{\creatim\yr2005\mo6\dy25\hr10\min28}{\revtim\yr2005\mo6\dy25\hr10\min29}{\version1}{\edmins1}{\nofpages1}{\nofwords0}{\nofchars0}{\*\company appeon}{\nofcharsws0}{\vern8269}}~r~n\paperw12240\paperh15840\margl1800\margr1800\margt1440\margb1440\gutter0 \widowctrl\ftnbj\aenddoc\noxlattoyen\expshrtn\noultrlspc\dntblnsbdb\nospaceforul\formshade\horzdoc\dgmargin\dghspace180\dgvspace180\dghorigin1800\dgvorigin1440\dghshow1\dgvshow1~r~n\jexpand\viewkind1\viewscale100\pgbrdrhead\pgbrdrfoot\splytwnine\ftnlytwnine\htmautsp\nolnhtadjtbl\useltbaln\alntblind\lytcalctblwd\lyttblrtgr\lnbrkrule \fet0\sectd \linex0\endnhere\sectlinegrid360\sectdefaultcl {\*\pnseclvl1~r~n\pnucrm\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta \hich )}}~r~n{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}~r~n{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}\pard\plain \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 ~r~n\fs22\cf1\lang1033\langfe2052\loch\af17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 {\hich\af17\dbch\af17\loch\f17 T\hich\af17\dbch\af17\loch\f17 jokdrelkdfaslk;\hich\af17\dbch\af17\loch\f17 sdf~r~n\par }}" 
			ClipBoard(ls_temp2 )
			ll_tmp = rte_1.Paste()
			ls_result += wf_result_add(ls_item, "6. rtf format ", not isnull(ll_tmp) and ll_tmp <= len(ls_temp2) and ll_tmp > 0 ) 
			
		case lower("PasteRTF")
			rte_1.SelectTextAll (detail! )
			rte_1.Clear( )
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'				
			Clipboard(ls_temp2)
			rte_1.SelectText(1,1,0,0,detail!)
			rte_1.paste()
			
			ls_file ="PUB_BMP_BT_EMP.bmp"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			rte_1.InsertPicture(ls_fullname)		
			rte_1.SelectText(1,1,0,0,detail!)
			
			//PasteRTF，richtextstring为NULL
			SetNull(ls_temp2)
			ll_tmp = rte_1.PasteRTF(ls_temp2)
			ls_result += wf_result_add(ls_item, "1. null ", isnull(ll_tmp) ) 
			
			//PasteRTF，band为NULL
			ls_temp2 = ""
			ll_tmp = 0
			SetNull(lb_Band)
			ll_tmp = rte_1.PasteRTF(ls_temp2,lb_Band)
			ls_result += wf_result_add(ls_item, "2. band null ", isnull(ll_tmp) ) 
			
			//PasteRTF，richtextstring为空字符串
			ls_temp2 = ""
			ll_tmp = 0
			ll_tmp = rte_1.PasteRTF(ls_temp2)
			ls_result += wf_result_add(ls_item, "3. empty string ", not isnull(ll_tmp) and ll_tmp = -1 ) 
			
			//PasteRTF，richtextstring为非RichText格式的字符串
			ll_tmp = 0
			ls_temp2 = 'I am a student'
			ll_tmp = rte_1.PasteRTF(ls_temp2)
			ls_result += wf_result_add(ls_item, "4. string ", not isnull(ll_tmp) and ll_tmp = -1 ) 
			
			//PasteRTF，richtextstring为包含图片以及RichText格式的字符串
			ll_tmp = 0
			ls_temp2 = "{\rtf1\ansi\ansicpg1252\uc2 \deff17\deflang1033\deflangfe1033{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman;}{\f17\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}\'cb\'ce\'cc\'e5{\*\falt SimSun};}~r~n{\f28\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}@\'cb\'ce\'cc\'e5;}{\f32\froman\fcharset238\fprq2 Times New Roman CE;}{\f33\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f35\froman\fcharset161\fprq2 Times New Roman Greek;}~r~n{\f36\froman\fcharset162\fprq2 Times New Roman Tur;}{\f37\froman\fcharset177\fprq2 Times New Roman (Hebrew);}{\f38\froman\fcharset178\fprq2 Times New Roman (Arabic);}{\f39\froman\fcharset186\fprq2 Times New Roman Baltic;}~r~n{\f170\fnil\fcharset0\fprq2 SimSun Western{\*\falt SimSun};}{\f258\fnil\fcharset0\fprq2 @\'cb\'ce\'cc\'e5 Western;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;~r~n\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{~r~n\ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \fs22\cf1\lang1033\langfe2052\loch\f17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 \snext0 Normal;}{\*\cs10 \additive Default Paragraph Font;}}{\info~r~n{\title Tjokdrelkdfaslk;sdf}{\author appeon}{\operator appeon}{\creatim\yr2005\mo6\dy25\hr10\min28}{\revtim\yr2005\mo6\dy27\hr9\min28}{\version8}{\edmins2}{\nofpages1}{\nofwords0}{\nofchars0}{\*\company appeon}{\nofcharsws0}{\vern8269}}~r~n\paperw12240\paperh15840\margl1800\margr1800\margt1440\margb1440\gutter0 \widowctrl\ftnbj\aenddoc\noxlattoyen\expshrtn\noultrlspc\dntblnsbdb\nospaceforul\hyphcaps0\formshade\horzdoc\dgmargin\dghspace180\dgvspace180\dghorigin1800\dgvorigin1440\dghshow1~r~n\dgvshow1\jexpand\viewkind1\viewscale100\pgbrdrhead\pgbrdrfoot\splytwnine\ftnlytwnine\htmautsp\nolnhtadjtbl\useltbaln\alntblind\lytcalctblwd\lyttblrtgr\lnbrkrule \fet0\sectd \linex0\endnhere\sectlinegrid360\sectdefaultcl {\*\pnseclvl1~r~n\pnucrm\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta \hich )}}~r~n{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}~r~n{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}\pard\plain \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 ~r~n\fs22\cf1\lang1033\langfe2052\loch\af17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 {\hich\af17\dbch\af17\loch\f17 How are you?~r~n\par \hich\af17\dbch\af17\loch\f17 Thank you!~r~n\par \hich\af17\dbch\af17\loch\f17 Not at all.~r~n\par ~r~n\par {\*\shppict{\pict{\*\picprop\shplid1025{\sp{\sn shapeType}{\sv 75}}{\sp{\sn fFlipH}{\sv 0}}{\sp{\sn fFlipV}{\sv 0}}{\sp{\sn pibName}{\sv Aster2.bmp}}{\sp{\sn pibFlags}{\sv 2}}{\sp{\sn fLine}{\sv 0}}{\sp{\sn fLayoutInCell}{\sv 1}}}~r~n\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0\picw3761\pich4329\picwgoal2132\pichgoal2454\pngblip\bliptag-972157684{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n89504e470d0a1a0a0000000d4948445200000097000000a70100000000349ef3790000000467414d410000b18e7cfb5193000000097048597300000faf00000f~r~n120187cff298000003654944415448c7bd963b8e9c4010866b444048eac03247c13703c981431fc147311b39f411dcd25e0047db927197abfeaa6eba61b41a69~r~na51d6917f8fac14f3d9bf8faa32b4a0f327e90bd65ed5bd8a3dff1cefa7e5e59ba5dd946d385ad345c342fd49fe725a2ee3c6f27a2f3bc7b2c0a9b8fb5b34921~r~n13f357e7a5a9617f94eda3de066176a32c0e0d5b67615bdfb065d2b55dc36896f79a41325321e4125767fb0d78999de9cb628f49eb54b16d000b63c5e441d7ea~r~n50d94f17916d51986e2e0c023323fb834067b8779e35630df91ec16ca57bc31ffa2e67d040a629db546f314f0737f307be89fc1b9de1db95e9cba2f992b22f55~r~n94f917f2521e107673793659764960f87437f2e4310479c6821a52d93a16a6ee248dbf652a2c761e93164660e22cc4aea938feaf62aafd56c59fac09c2625731~r~nd93b88592c749c8906cd8f3054312e0f9bac37793e4f1645caf29cc9e63b6579ce448407d4c12c0c5d5ece0f89ce2ecbcb6c61962dfb26df9e987b4e4333ef99~r~nf91bf3d8b017e6dfcc3fda1cac7f84bd8edf8e388d96f4c9842c488e60c96c752369249146a825c388117101b12701fca6137a631d7b1cd803c903a2c7e285f4~r~n427a11bb595cc58a8d5e370216913e50ef6cc122d2a095f916e3543132867d687236213ffc9eb02d0dc8ad15f7a3b30e8c1a76d3cba7cc6c3e7d96bf0f763b64~r~na6f33e66766fadb1be7987691a2b2d59f3dc68bef76db04bd7da006383db6aadd8e439bd994d536d7bf707e352f94dd9629eb51eb0c2977a4141c348309f6f16~r~n2f01235127482db6c6e1bd47df7764cfd79c51aff5b717fc6fe3f9193def7bc39eb05f9b1f92475f38f5a77cd3dc6af24d53ec9c979abce7fc952c4de73c17f5~r~nfbb91e0435fea96eac2398d597a30e6de73a84909fb2c052d7d4a6a9aa6bb9fee5552ecf58553b756ff8a8aab1a5ee9a187279c6b6a3662f53aee3476d27d476~r~n62b716b93cef0ba557eca55798b5c8e5f9590002c9e53983407279b96f0dce74d0190492c9cbbd317a6f4c75bff41e8aabb3e40d0df3432e5b33d896fbb432ef~r~ndd787fd5e3711618f972165826be9c19f0dd99a93bc9ed93999d41cc8e9931f22396f3cbe07eb89c7356cd2deba585059d17c7866d73395f1516a10f41ec3665~r~nfe77e4a09f05ea9ca9cf70af9ef5ec2cd0323ece8e075bcab9f36056375ab695d75667dbb25d55377edd61fcaeec3faf80fed4d45e068e0000000049454e44ae426082}}{\nonshppict{\pict\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0~r~n\picw3761\pich4329\picwgoal2132\pichgoal2454\wmetafile8\bliptag-972157684\blipupi99{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n010009000003d00600000000ac06000000000400000003010800050000000b0200000000050000000c02a700970005000000070104000000ac060000430f2000~r~ncc000000a700970000000000a7009700000000002800000097000000a700000001000100000000000c0d0000af0f0000120f0000020000000200000000000000~r~nffffff00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nffffffffffcffffffffffffffffffefffffffffffffffffffe03fffffffffffffffffefffffffffffffffffff0007ffffffffffffffffeffffffffffffffffff~r~ne0001ffffffffffffffffeffffffffffffffffff80000ffffffffffffffffeffffffffffffffffff000003fffffffffffffffefffffffffffffffffc000001ff~r~nfffffffffffffefffffffffffffffffc000000fffffffffffffffefffffffffffffffff80000007ffffffffffffffefffffffffffffffff00000007fffffffff~r~nfffffeffffff7ffffffffff00000003ffffffffffdfffefffffe3fffffffffe00000001ffffffffff8fffefffff81fffffffffe00000001ffffffffff07ffefc~r~nfff00fffffffffe00000001fffffffffe03ffefcfff007ffffffffe00000001fffffffffc01ffef8fff803ffffffffe00000000fffffffff803ffef0fffc01ff~r~nffffffc00000000fffffffff007ffef0fffe00ffffffffc00000000ffffffffe00fffee0ffff007fffffffc00000000ffffffffc03fffee0ffff803fffffffc0~r~n0000000ffffffff807fffee0ffffc01fffffffc00000000ffffffff00ffffee0ffffe00fffffffc00000000fffffffe01ffffee0fffff007ffffffc00000000f~r~nffffffc03ffffec0fffff803ffffffe00000000fffffff007ffffec0fffffc01ffffffe00000001ffffffe00fffffec0fffffe00ffffffe00000001ffffffc01~r~nfffffec0ffffff803fffffe00000001ffffff803fffffec0ffffffc01ffffff00000003ffffff007fffffec0ffffffe00ffffff00000003fffffe00ffffffec0~r~nfffffff007fffff80000007fffffc01ffffffee0fffffff803fffff80000007fffff803ffffffee0fffffffc01fffffc000000ffffff007ffffffee0fffffffe~r~n00fffffc000000fffffe00fffffffee0ffffffff007ffffe000000fffffc01fffffffef0ffffffff803ffffe000001fffff803fffffffef0ffffffffc01fffff~r~n000003fffff007fffffffef8ffffffffe00fffff000003ffffe00ffffffffe00fffffffff007ffff800007ffffc01ffffffffe00fffffffff803ffffc0000fff~r~nff803ffffffffe00fffffffffc01ffffc0000fffff00fffffffffe00fffffffffe00ffffe0001ffffe01fffffffffe00ffffffffff007fffe0003ffffc03ffff~r~nfffffe00ffffffffff803ffff0003ffff007fffffffffe00ffffffffffc01ffff8007fffe00ffffffffffe00ffffffffffe00ffff8007fffc01ffffffffffe00~r~nfffffffffff007fffc00ffff803ffffffffffe00fffffffffff803fffe00ffff007ffffffffffe00fffffffffffc01fffe01fffe00fffffffffffe00ffffffff~r~nfffe00ffff01fffc01fffffffffffe00ffffffffffff007fff03fffc03fffffffffffe00ffffffffffff80ffff83fffe07fffffffffffe00ffffffffffffc1ff~r~nff87ffff0ffffffffffffe00ffffffffffffe3ffffc7ffff9ffffffffffffe00fffffffffffff7ffffffffffbffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00ffff803fffffffffff87fffffffffff007fffe00fffc0003fffffffff0003fffffffff00007ffe00fff00000ffffffffe0001ffffffff800~r~n001ffe00ffc000001fffffff800007ffffffe0000007fe00ff80000007ffffff000003ffffffc0000003fe00ff00000001fffffe000001ffffff00000001fe00~r~nfe000000007ffffc000000fffffc00000001fe00fc000000003ffff8000000fffff000000000fe00fc000000000ffff80000007fffc0000000007e00f8000000~r~n0003fff00000003fff00000000007e00f00000000000fff00000003ffc00000000003e00f000000000007fe00000003ff000000000003e00f000000000001fe0~r~n0000001fc000000000003e00e0000000000007e00000001f0000000000001e00e0000000000001e00000001e0000000000001e00c0000000000000e00000001c~r~n0000000000000e00c000000000000040000000180000000000000e00e0000000000001e00000001e0000000000001e00e0000000000003e00000001f00000000~r~n00001e00e000000000000fe00000001fc000000000001e00f000000000003fe00000003ff000000000003e00f00000000000fff00000003ffc00000000003e00~r~nf00000000001fff00000003fff00000000007e00f80000000007fff80000007fff80000000007e00fc000000001ffff80000007fffe000000000fe00fc000000~r~n007ffffc000000fffff800000001fe00fe00000000fffffe000001fffffc00000001fe00ff00000003fffffe000001ffffff00000003fe00ff0000000fffffff~r~n000007ffffffc0000007fe00ffc000003fffffffc0001ffffffff000000ffe00ffe00000fffffffff0003ffffffffe00003ffe00fff80007fffffffffe03ffff~r~nffffff8000fffe00ffffc1fffffffffffffffffffffffffc3ffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffff7ffffdfffffbfffffff~r~nfffffe00ffffffffffffe3ffff8fffff1ffffffffffffe00ffffffffffffc1ffff07fffe0ffffffffffffe00ffffffffffff80ffff03fffc07fffffffffffe00~r~nffffffffffff007ffe03fff803fffffffffffe00fffffffffffe00fffe01fffc01fffffffffffe00fffffffffffc01fffc01fffe00fffffffffffe00ffffffff~r~nfff803fffc00ffff007ffffffffffe00fffffffffff007fff800ffff803ffffffffffe00ffffffffffe00ffff0007fffc01ffffffffffe00ffffffffffc01fff~r~nf0003fffe00ffffffffffe00ffffffffff803fffe0003ffff007fffffffffe00ffffffffff007fffe0001ffff803fffffffffe00fffffffffe00ffffc0001fff~r~nfc01fffffffffe00fffffffffc01ffffc0000ffffe00fffffffffe00fffffffff803ffff800007ffff007ffffffffe00fffffffff007ffff000007ffff803fff~r~nfffffe00ffffffffe00fffff000003ffffc01ffffffffe00ffffffffc03ffffe000003fffff00ffffffffe00ffffffff807ffffe000001fffff807fffffffe00~r~nffffffff00fffffc000001fffffc03fffffffe00fffffffe01fffffc000000fffffe01fffffffe00fffffffc03fffff8000000ffffff00fffffffe00fffffff8~r~n07fffff00000007fffff807ffffffe00fffffff00ffffff00000007fffffc03ffffffe00ffffffe01ffffff00000003fffffe01ffffffe00ffffffc03fffffe0~r~n0000003ffffff00ffffffe00ffffff807fffffe00000003ffffff807fffffe00ffffff00ffffffe00000001ffffffc03fffffe00fffffe01ffffffc00000001f~r~nfffffe01fffffe00fffffc03ffffffc00000001fffffff00fffffe00fffff807ffffffc00000001fffffff807ffffe00fffff00fffffffc00000001fffffffc0~r~n3ffffe00ffffe01fffffffc00000000fffffffe01ffffe00ffffc03fffffffc00000000ffffffff00ffffe00ffff807fffffffc00000000ffffffff807fffe00~r~nffff00ffffffffc00000001ffffffffc01fffe00fffe01ffffffffe00000001ffffffffe00fffe00fffc03ffffffffe00000001fffffffff007ffe00fff007ff~r~nffffffe00000001fffffffff803ffe00fff80fffffffffe00000001fffffffffc07ffe00fffc1fffffffffe00000001fffffffffe0fffe00fffe3ffffffffff0~r~n0000003ffffffffff1fffe00ffff7ffffffffff00000003ffffffffffbfffe00fffffffffffffff80000007ffffffffffffffe00fffffffffffffffc000000ff~r~nfffffffffffffe00fffffffffffffffc000000fffffffffffffffe00fffffffffffffffe000003fffffffffffffffe00ffffffffffffffff800007ffffffffff~r~nfffffe00ffffffffffffffffc0000ffffffffffffffffe00fffffffffffffffff0003ffffffffffffffffe00fffffffffffffffffe01fffffffffffffffffe00~r~nffffffffffffffffffc7fffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nfffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffff~r~nfffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffffffffffff~r~nfffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe0005000000070101000000030000000000}}~r~n\par }}"
			ll_tmp = rte_1.PasteRTF(ls_temp2)
			ls_result += wf_result_add(ls_item, "5. rtf format contant ", not isnull(ll_tmp) and ll_tmp > 0 ) 
			
			//PasteRTF，band为Detail!
			ll_tmp = 0
			rte_1.InputFieldInsert("appeonfiled")
			ls_temp2 = "{\rtf1\ansi\ansicpg1252\uc2 \deff17\deflang1033\deflangfe1033{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman;}{\f17\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}\'cb\'ce\'cc\'e5{\*\falt SimSun};}~r~n{\f28\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}@\'cb\'ce\'cc\'e5;}{\f32\froman\fcharset238\fprq2 Times New Roman CE;}{\f33\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f35\froman\fcharset161\fprq2 Times New Roman Greek;}~r~n{\f36\froman\fcharset162\fprq2 Times New Roman Tur;}{\f37\froman\fcharset177\fprq2 Times New Roman (Hebrew);}{\f38\froman\fcharset178\fprq2 Times New Roman (Arabic);}{\f39\froman\fcharset186\fprq2 Times New Roman Baltic;}~r~n{\f170\fnil\fcharset0\fprq2 SimSun Western{\*\falt SimSun};}{\f258\fnil\fcharset0\fprq2 @\'cb\'ce\'cc\'e5 Western;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;~r~n\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{~r~n\ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \fs22\cf1\lang1033\langfe2052\loch\f17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 \snext0 Normal;}{\*\cs10 \additive Default Paragraph Font;}}{\info~r~n{\title Tjokdrelkdfaslk;sdf}{\author appeon}{\operator appeon}{\creatim\yr2005\mo6\dy25\hr10\min28}{\revtim\yr2005\mo6\dy27\hr9\min28}{\version8}{\edmins2}{\nofpages1}{\nofwords0}{\nofchars0}{\*\company appeon}{\nofcharsws0}{\vern8269}}~r~n\paperw12240\paperh15840\margl1800\margr1800\margt1440\margb1440\gutter0 \widowctrl\ftnbj\aenddoc\noxlattoyen\expshrtn\noultrlspc\dntblnsbdb\nospaceforul\hyphcaps0\formshade\horzdoc\dgmargin\dghspace180\dgvspace180\dghorigin1800\dgvorigin1440\dghshow1~r~n\dgvshow1\jexpand\viewkind1\viewscale100\pgbrdrhead\pgbrdrfoot\splytwnine\ftnlytwnine\htmautsp\nolnhtadjtbl\useltbaln\alntblind\lytcalctblwd\lyttblrtgr\lnbrkrule \fet0\sectd \linex0\endnhere\sectlinegrid360\sectdefaultcl {\*\pnseclvl1~r~n\pnucrm\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta \hich )}}~r~n{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}~r~n{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}\pard\plain \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 ~r~n\fs22\cf1\lang1033\langfe2052\loch\af17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 {\hich\af17\dbch\af17\loch\f17 How are you?~r~n\par \hich\af17\dbch\af17\loch\f17 Thank you!~r~n\par \hich\af17\dbch\af17\loch\f17 Not at all.~r~n\par ~r~n\par {\*\shppict{\pict{\*\picprop\shplid1025{\sp{\sn shapeType}{\sv 75}}{\sp{\sn fFlipH}{\sv 0}}{\sp{\sn fFlipV}{\sv 0}}{\sp{\sn pibName}{\sv Aster2.bmp}}{\sp{\sn pibFlags}{\sv 2}}{\sp{\sn fLine}{\sv 0}}{\sp{\sn fLayoutInCell}{\sv 1}}}~r~n\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0\picw3761\pich4329\picwgoal2132\pichgoal2454\pngblip\bliptag-972157684{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n89504e470d0a1a0a0000000d4948445200000097000000a70100000000349ef3790000000467414d410000b18e7cfb5193000000097048597300000faf00000f~r~n120187cff298000003654944415448c7bd963b8e9c4010866b444048eac03247c13703c981431fc147311b39f411dcd25e0047db927197abfeaa6eba61b41a69~r~na51d6917f8fac14f3d9bf8faa32b4a0f327e90bd65ed5bd8a3dff1cefa7e5e59ba5dd946d385ad345c342fd49fe725a2ee3c6f27a2f3bc7b2c0a9b8fb5b34921~r~n13f357e7a5a9617f94eda3de066176a32c0e0d5b67615bdfb065d2b55dc36896f79a41325321e4125767fb0d78999de9cb628f49eb54b16d000b63c5e441d7ea~r~n50d94f17916d51986e2e0c023323fb834067b8779e35630df91ec16ca57bc31ffa2e67d040a629db546f314f0737f307be89fc1b9de1db95e9cba2f992b22f55~r~n94f917f2521e107673793659764960f87437f2e4310479c6821a52d93a16a6ee248dbf652a2c761e93164660e22cc4aea938feaf62aafd56c59fac09c2625731~r~nd93b88592c749c8906cd8f3054312e0f9bac37793e4f1645caf29cc9e63b6579ce448407d4c12c0c5d5ece0f89ce2ecbcb6c61962dfb26df9e987b4e4333ef99~r~nf91bf3d8b017e6dfcc3fda1cac7f84bd8edf8e388d96f4c9842c488e60c96c752369249146a825c388117101b12701fca6137a631d7b1cd803c903a2c7e285f4~r~n427a11bb595cc58a8d5e370216913e50ef6cc122d2a095f916e3543132867d687236213ffc9eb02d0dc8ad15f7a3b30e8c1a76d3cba7cc6c3e7d96bf0f763b64~r~na6f33e66766fadb1be7987691a2b2d59f3dc68bef76db04bd7da006383db6aadd8e439bd994d536d7bf707e352f94dd9629eb51eb0c2977a4141c348309f6f16~r~n2f01235127482db6c6e1bd47df7764cfd79c51aff5b717fc6fe3f9193def7bc39eb05f9b1f92475f38f5a77cd3dc6af24d53ec9c979abce7fc952c4de73c17f5~r~nfbb91e0435fea96eac2398d597a30e6de73a84909fb2c052d7d4a6a9aa6bb9fee5552ecf58553b756ff8a8aab1a5ee9a187279c6b6a3662f53aee3476d27d476~r~n62b716b93cef0ba557eca55798b5c8e5f9590002c9e53983407279b96f0dce74d0190492c9cbbd317a6f4c75bff41e8aabb3e40d0df3432e5b33d896fbb432ef~r~ndd787fd5e3711618f972165826be9c19f0dd99a93bc9ed93999d41cc8e9931f22396f3cbe07eb89c7356cd2deba585059d17c7866d73395f1516a10f41ec3665~r~nfe77e4a09f05ea9ca9cf70af9ef5ec2cd0323ece8e075bcab9f36056375ab695d75667dbb25d55377edd61fcaeec3faf80fed4d45e068e0000000049454e44ae426082}}{\nonshppict{\pict\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0~r~n\picw3761\pich4329\picwgoal2132\pichgoal2454\wmetafile8\bliptag-972157684\blipupi99{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n010009000003d00600000000ac06000000000400000003010800050000000b0200000000050000000c02a700970005000000070104000000ac060000430f2000~r~ncc000000a700970000000000a7009700000000002800000097000000a700000001000100000000000c0d0000af0f0000120f0000020000000200000000000000~r~nffffff00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nffffffffffcffffffffffffffffffefffffffffffffffffffe03fffffffffffffffffefffffffffffffffffff0007ffffffffffffffffeffffffffffffffffff~r~ne0001ffffffffffffffffeffffffffffffffffff80000ffffffffffffffffeffffffffffffffffff000003fffffffffffffffefffffffffffffffffc000001ff~r~nfffffffffffffefffffffffffffffffc000000fffffffffffffffefffffffffffffffff80000007ffffffffffffffefffffffffffffffff00000007fffffffff~r~nfffffeffffff7ffffffffff00000003ffffffffffdfffefffffe3fffffffffe00000001ffffffffff8fffefffff81fffffffffe00000001ffffffffff07ffefc~r~nfff00fffffffffe00000001fffffffffe03ffefcfff007ffffffffe00000001fffffffffc01ffef8fff803ffffffffe00000000fffffffff803ffef0fffc01ff~r~nffffffc00000000fffffffff007ffef0fffe00ffffffffc00000000ffffffffe00fffee0ffff007fffffffc00000000ffffffffc03fffee0ffff803fffffffc0~r~n0000000ffffffff807fffee0ffffc01fffffffc00000000ffffffff00ffffee0ffffe00fffffffc00000000fffffffe01ffffee0fffff007ffffffc00000000f~r~nffffffc03ffffec0fffff803ffffffe00000000fffffff007ffffec0fffffc01ffffffe00000001ffffffe00fffffec0fffffe00ffffffe00000001ffffffc01~r~nfffffec0ffffff803fffffe00000001ffffff803fffffec0ffffffc01ffffff00000003ffffff007fffffec0ffffffe00ffffff00000003fffffe00ffffffec0~r~nfffffff007fffff80000007fffffc01ffffffee0fffffff803fffff80000007fffff803ffffffee0fffffffc01fffffc000000ffffff007ffffffee0fffffffe~r~n00fffffc000000fffffe00fffffffee0ffffffff007ffffe000000fffffc01fffffffef0ffffffff803ffffe000001fffff803fffffffef0ffffffffc01fffff~r~n000003fffff007fffffffef8ffffffffe00fffff000003ffffe00ffffffffe00fffffffff007ffff800007ffffc01ffffffffe00fffffffff803ffffc0000fff~r~nff803ffffffffe00fffffffffc01ffffc0000fffff00fffffffffe00fffffffffe00ffffe0001ffffe01fffffffffe00ffffffffff007fffe0003ffffc03ffff~r~nfffffe00ffffffffff803ffff0003ffff007fffffffffe00ffffffffffc01ffff8007fffe00ffffffffffe00ffffffffffe00ffff8007fffc01ffffffffffe00~r~nfffffffffff007fffc00ffff803ffffffffffe00fffffffffff803fffe00ffff007ffffffffffe00fffffffffffc01fffe01fffe00fffffffffffe00ffffffff~r~nfffe00ffff01fffc01fffffffffffe00ffffffffffff007fff03fffc03fffffffffffe00ffffffffffff80ffff83fffe07fffffffffffe00ffffffffffffc1ff~r~nff87ffff0ffffffffffffe00ffffffffffffe3ffffc7ffff9ffffffffffffe00fffffffffffff7ffffffffffbffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00ffff803fffffffffff87fffffffffff007fffe00fffc0003fffffffff0003fffffffff00007ffe00fff00000ffffffffe0001ffffffff800~r~n001ffe00ffc000001fffffff800007ffffffe0000007fe00ff80000007ffffff000003ffffffc0000003fe00ff00000001fffffe000001ffffff00000001fe00~r~nfe000000007ffffc000000fffffc00000001fe00fc000000003ffff8000000fffff000000000fe00fc000000000ffff80000007fffc0000000007e00f8000000~r~n0003fff00000003fff00000000007e00f00000000000fff00000003ffc00000000003e00f000000000007fe00000003ff000000000003e00f000000000001fe0~r~n0000001fc000000000003e00e0000000000007e00000001f0000000000001e00e0000000000001e00000001e0000000000001e00c0000000000000e00000001c~r~n0000000000000e00c000000000000040000000180000000000000e00e0000000000001e00000001e0000000000001e00e0000000000003e00000001f00000000~r~n00001e00e000000000000fe00000001fc000000000001e00f000000000003fe00000003ff000000000003e00f00000000000fff00000003ffc00000000003e00~r~nf00000000001fff00000003fff00000000007e00f80000000007fff80000007fff80000000007e00fc000000001ffff80000007fffe000000000fe00fc000000~r~n007ffffc000000fffff800000001fe00fe00000000fffffe000001fffffc00000001fe00ff00000003fffffe000001ffffff00000003fe00ff0000000fffffff~r~n000007ffffffc0000007fe00ffc000003fffffffc0001ffffffff000000ffe00ffe00000fffffffff0003ffffffffe00003ffe00fff80007fffffffffe03ffff~r~nffffff8000fffe00ffffc1fffffffffffffffffffffffffc3ffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffff7ffffdfffffbfffffff~r~nfffffe00ffffffffffffe3ffff8fffff1ffffffffffffe00ffffffffffffc1ffff07fffe0ffffffffffffe00ffffffffffff80ffff03fffc07fffffffffffe00~r~nffffffffffff007ffe03fff803fffffffffffe00fffffffffffe00fffe01fffc01fffffffffffe00fffffffffffc01fffc01fffe00fffffffffffe00ffffffff~r~nfff803fffc00ffff007ffffffffffe00fffffffffff007fff800ffff803ffffffffffe00ffffffffffe00ffff0007fffc01ffffffffffe00ffffffffffc01fff~r~nf0003fffe00ffffffffffe00ffffffffff803fffe0003ffff007fffffffffe00ffffffffff007fffe0001ffff803fffffffffe00fffffffffe00ffffc0001fff~r~nfc01fffffffffe00fffffffffc01ffffc0000ffffe00fffffffffe00fffffffff803ffff800007ffff007ffffffffe00fffffffff007ffff000007ffff803fff~r~nfffffe00ffffffffe00fffff000003ffffc01ffffffffe00ffffffffc03ffffe000003fffff00ffffffffe00ffffffff807ffffe000001fffff807fffffffe00~r~nffffffff00fffffc000001fffffc03fffffffe00fffffffe01fffffc000000fffffe01fffffffe00fffffffc03fffff8000000ffffff00fffffffe00fffffff8~r~n07fffff00000007fffff807ffffffe00fffffff00ffffff00000007fffffc03ffffffe00ffffffe01ffffff00000003fffffe01ffffffe00ffffffc03fffffe0~r~n0000003ffffff00ffffffe00ffffff807fffffe00000003ffffff807fffffe00ffffff00ffffffe00000001ffffffc03fffffe00fffffe01ffffffc00000001f~r~nfffffe01fffffe00fffffc03ffffffc00000001fffffff00fffffe00fffff807ffffffc00000001fffffff807ffffe00fffff00fffffffc00000001fffffffc0~r~n3ffffe00ffffe01fffffffc00000000fffffffe01ffffe00ffffc03fffffffc00000000ffffffff00ffffe00ffff807fffffffc00000000ffffffff807fffe00~r~nffff00ffffffffc00000001ffffffffc01fffe00fffe01ffffffffe00000001ffffffffe00fffe00fffc03ffffffffe00000001fffffffff007ffe00fff007ff~r~nffffffe00000001fffffffff803ffe00fff80fffffffffe00000001fffffffffc07ffe00fffc1fffffffffe00000001fffffffffe0fffe00fffe3ffffffffff0~r~n0000003ffffffffff1fffe00ffff7ffffffffff00000003ffffffffffbfffe00fffffffffffffff80000007ffffffffffffffe00fffffffffffffffc000000ff~r~nfffffffffffffe00fffffffffffffffc000000fffffffffffffffe00fffffffffffffffe000003fffffffffffffffe00ffffffffffffffff800007ffffffffff~r~nfffffe00ffffffffffffffffc0000ffffffffffffffffe00fffffffffffffffff0003ffffffffffffffffe00fffffffffffffffffe01fffffffffffffffffe00~r~nffffffffffffffffffc7fffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nfffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffff~r~nfffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffffffffffff~r~nfffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe0005000000070101000000030000000000}}~r~n\par }}"
			ll_tmp = rte_1.PasteRTF(ls_temp2,Detail!)
			ls_result += wf_result_add(ls_item, "6. Detail ", not isnull(ll_tmp) and ll_tmp > 0) 
			
			//PasteRTF，band为Header!
			ll_tmp = 0
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,0,0,Header!)
			ls_temp2 = "{\rtf1\ansi\ansicpg1252\uc2 \deff17\deflang1033\deflangfe1033{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman;}{\f17\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}\'cb\'ce\'cc\'e5{\*\falt SimSun};}~r~n{\f28\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}@\'cb\'ce\'cc\'e5;}{\f32\froman\fcharset238\fprq2 Times New Roman CE;}{\f33\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f35\froman\fcharset161\fprq2 Times New Roman Greek;}~r~n{\f36\froman\fcharset162\fprq2 Times New Roman Tur;}{\f37\froman\fcharset177\fprq2 Times New Roman (Hebrew);}{\f38\froman\fcharset178\fprq2 Times New Roman (Arabic);}{\f39\froman\fcharset186\fprq2 Times New Roman Baltic;}~r~n{\f170\fnil\fcharset0\fprq2 SimSun Western{\*\falt SimSun};}{\f258\fnil\fcharset0\fprq2 @\'cb\'ce\'cc\'e5 Western;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;~r~n\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{~r~n\ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \fs22\cf1\lang1033\langfe2052\loch\f17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 \snext0 Normal;}{\*\cs10 \additive Default Paragraph Font;}}{\info~r~n{\title Tjokdrelkdfaslk;sdf}{\author appeon}{\operator appeon}{\creatim\yr2005\mo6\dy25\hr10\min28}{\revtim\yr2005\mo6\dy27\hr9\min28}{\version8}{\edmins2}{\nofpages1}{\nofwords0}{\nofchars0}{\*\company appeon}{\nofcharsws0}{\vern8269}}~r~n\paperw12240\paperh15840\margl1800\margr1800\margt1440\margb1440\gutter0 \widowctrl\ftnbj\aenddoc\noxlattoyen\expshrtn\noultrlspc\dntblnsbdb\nospaceforul\hyphcaps0\formshade\horzdoc\dgmargin\dghspace180\dgvspace180\dghorigin1800\dgvorigin1440\dghshow1~r~n\dgvshow1\jexpand\viewkind1\viewscale100\pgbrdrhead\pgbrdrfoot\splytwnine\ftnlytwnine\htmautsp\nolnhtadjtbl\useltbaln\alntblind\lytcalctblwd\lyttblrtgr\lnbrkrule \fet0\sectd \linex0\endnhere\sectlinegrid360\sectdefaultcl {\*\pnseclvl1~r~n\pnucrm\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta \hich )}}~r~n{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}~r~n{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}\pard\plain \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 ~r~n\fs22\cf1\lang1033\langfe2052\loch\af17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 {\hich\af17\dbch\af17\loch\f17 How are you?~r~n\par \hich\af17\dbch\af17\loch\f17 Thank you!~r~n\par \hich\af17\dbch\af17\loch\f17 Not at all.~r~n\par ~r~n\par {\*\shppict{\pict{\*\picprop\shplid1025{\sp{\sn shapeType}{\sv 75}}{\sp{\sn fFlipH}{\sv 0}}{\sp{\sn fFlipV}{\sv 0}}{\sp{\sn pibName}{\sv Aster2.bmp}}{\sp{\sn pibFlags}{\sv 2}}{\sp{\sn fLine}{\sv 0}}{\sp{\sn fLayoutInCell}{\sv 1}}}~r~n\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0\picw3761\pich4329\picwgoal2132\pichgoal2454\pngblip\bliptag-972157684{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n89504e470d0a1a0a0000000d4948445200000097000000a70100000000349ef3790000000467414d410000b18e7cfb5193000000097048597300000faf00000f~r~n120187cff298000003654944415448c7bd963b8e9c4010866b444048eac03247c13703c981431fc147311b39f411dcd25e0047db927197abfeaa6eba61b41a69~r~na51d6917f8fac14f3d9bf8faa32b4a0f327e90bd65ed5bd8a3dff1cefa7e5e59ba5dd946d385ad345c342fd49fe725a2ee3c6f27a2f3bc7b2c0a9b8fb5b34921~r~n13f357e7a5a9617f94eda3de066176a32c0e0d5b67615bdfb065d2b55dc36896f79a41325321e4125767fb0d78999de9cb628f49eb54b16d000b63c5e441d7ea~r~n50d94f17916d51986e2e0c023323fb834067b8779e35630df91ec16ca57bc31ffa2e67d040a629db546f314f0737f307be89fc1b9de1db95e9cba2f992b22f55~r~n94f917f2521e107673793659764960f87437f2e4310479c6821a52d93a16a6ee248dbf652a2c761e93164660e22cc4aea938feaf62aafd56c59fac09c2625731~r~nd93b88592c749c8906cd8f3054312e0f9bac37793e4f1645caf29cc9e63b6579ce448407d4c12c0c5d5ece0f89ce2ecbcb6c61962dfb26df9e987b4e4333ef99~r~nf91bf3d8b017e6dfcc3fda1cac7f84bd8edf8e388d96f4c9842c488e60c96c752369249146a825c388117101b12701fca6137a631d7b1cd803c903a2c7e285f4~r~n427a11bb595cc58a8d5e370216913e50ef6cc122d2a095f916e3543132867d687236213ffc9eb02d0dc8ad15f7a3b30e8c1a76d3cba7cc6c3e7d96bf0f763b64~r~na6f33e66766fadb1be7987691a2b2d59f3dc68bef76db04bd7da006383db6aadd8e439bd994d536d7bf707e352f94dd9629eb51eb0c2977a4141c348309f6f16~r~n2f01235127482db6c6e1bd47df7764cfd79c51aff5b717fc6fe3f9193def7bc39eb05f9b1f92475f38f5a77cd3dc6af24d53ec9c979abce7fc952c4de73c17f5~r~nfbb91e0435fea96eac2398d597a30e6de73a84909fb2c052d7d4a6a9aa6bb9fee5552ecf58553b756ff8a8aab1a5ee9a187279c6b6a3662f53aee3476d27d476~r~n62b716b93cef0ba557eca55798b5c8e5f9590002c9e53983407279b96f0dce74d0190492c9cbbd317a6f4c75bff41e8aabb3e40d0df3432e5b33d896fbb432ef~r~ndd787fd5e3711618f972165826be9c19f0dd99a93bc9ed93999d41cc8e9931f22396f3cbe07eb89c7356cd2deba585059d17c7866d73395f1516a10f41ec3665~r~nfe77e4a09f05ea9ca9cf70af9ef5ec2cd0323ece8e075bcab9f36056375ab695d75667dbb25d55377edd61fcaeec3faf80fed4d45e068e0000000049454e44ae426082}}{\nonshppict{\pict\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0~r~n\picw3761\pich4329\picwgoal2132\pichgoal2454\wmetafile8\bliptag-972157684\blipupi99{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n010009000003d00600000000ac06000000000400000003010800050000000b0200000000050000000c02a700970005000000070104000000ac060000430f2000~r~ncc000000a700970000000000a7009700000000002800000097000000a700000001000100000000000c0d0000af0f0000120f0000020000000200000000000000~r~nffffff00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nffffffffffcffffffffffffffffffefffffffffffffffffffe03fffffffffffffffffefffffffffffffffffff0007ffffffffffffffffeffffffffffffffffff~r~ne0001ffffffffffffffffeffffffffffffffffff80000ffffffffffffffffeffffffffffffffffff000003fffffffffffffffefffffffffffffffffc000001ff~r~nfffffffffffffefffffffffffffffffc000000fffffffffffffffefffffffffffffffff80000007ffffffffffffffefffffffffffffffff00000007fffffffff~r~nfffffeffffff7ffffffffff00000003ffffffffffdfffefffffe3fffffffffe00000001ffffffffff8fffefffff81fffffffffe00000001ffffffffff07ffefc~r~nfff00fffffffffe00000001fffffffffe03ffefcfff007ffffffffe00000001fffffffffc01ffef8fff803ffffffffe00000000fffffffff803ffef0fffc01ff~r~nffffffc00000000fffffffff007ffef0fffe00ffffffffc00000000ffffffffe00fffee0ffff007fffffffc00000000ffffffffc03fffee0ffff803fffffffc0~r~n0000000ffffffff807fffee0ffffc01fffffffc00000000ffffffff00ffffee0ffffe00fffffffc00000000fffffffe01ffffee0fffff007ffffffc00000000f~r~nffffffc03ffffec0fffff803ffffffe00000000fffffff007ffffec0fffffc01ffffffe00000001ffffffe00fffffec0fffffe00ffffffe00000001ffffffc01~r~nfffffec0ffffff803fffffe00000001ffffff803fffffec0ffffffc01ffffff00000003ffffff007fffffec0ffffffe00ffffff00000003fffffe00ffffffec0~r~nfffffff007fffff80000007fffffc01ffffffee0fffffff803fffff80000007fffff803ffffffee0fffffffc01fffffc000000ffffff007ffffffee0fffffffe~r~n00fffffc000000fffffe00fffffffee0ffffffff007ffffe000000fffffc01fffffffef0ffffffff803ffffe000001fffff803fffffffef0ffffffffc01fffff~r~n000003fffff007fffffffef8ffffffffe00fffff000003ffffe00ffffffffe00fffffffff007ffff800007ffffc01ffffffffe00fffffffff803ffffc0000fff~r~nff803ffffffffe00fffffffffc01ffffc0000fffff00fffffffffe00fffffffffe00ffffe0001ffffe01fffffffffe00ffffffffff007fffe0003ffffc03ffff~r~nfffffe00ffffffffff803ffff0003ffff007fffffffffe00ffffffffffc01ffff8007fffe00ffffffffffe00ffffffffffe00ffff8007fffc01ffffffffffe00~r~nfffffffffff007fffc00ffff803ffffffffffe00fffffffffff803fffe00ffff007ffffffffffe00fffffffffffc01fffe01fffe00fffffffffffe00ffffffff~r~nfffe00ffff01fffc01fffffffffffe00ffffffffffff007fff03fffc03fffffffffffe00ffffffffffff80ffff83fffe07fffffffffffe00ffffffffffffc1ff~r~nff87ffff0ffffffffffffe00ffffffffffffe3ffffc7ffff9ffffffffffffe00fffffffffffff7ffffffffffbffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00ffff803fffffffffff87fffffffffff007fffe00fffc0003fffffffff0003fffffffff00007ffe00fff00000ffffffffe0001ffffffff800~r~n001ffe00ffc000001fffffff800007ffffffe0000007fe00ff80000007ffffff000003ffffffc0000003fe00ff00000001fffffe000001ffffff00000001fe00~r~nfe000000007ffffc000000fffffc00000001fe00fc000000003ffff8000000fffff000000000fe00fc000000000ffff80000007fffc0000000007e00f8000000~r~n0003fff00000003fff00000000007e00f00000000000fff00000003ffc00000000003e00f000000000007fe00000003ff000000000003e00f000000000001fe0~r~n0000001fc000000000003e00e0000000000007e00000001f0000000000001e00e0000000000001e00000001e0000000000001e00c0000000000000e00000001c~r~n0000000000000e00c000000000000040000000180000000000000e00e0000000000001e00000001e0000000000001e00e0000000000003e00000001f00000000~r~n00001e00e000000000000fe00000001fc000000000001e00f000000000003fe00000003ff000000000003e00f00000000000fff00000003ffc00000000003e00~r~nf00000000001fff00000003fff00000000007e00f80000000007fff80000007fff80000000007e00fc000000001ffff80000007fffe000000000fe00fc000000~r~n007ffffc000000fffff800000001fe00fe00000000fffffe000001fffffc00000001fe00ff00000003fffffe000001ffffff00000003fe00ff0000000fffffff~r~n000007ffffffc0000007fe00ffc000003fffffffc0001ffffffff000000ffe00ffe00000fffffffff0003ffffffffe00003ffe00fff80007fffffffffe03ffff~r~nffffff8000fffe00ffffc1fffffffffffffffffffffffffc3ffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffff7ffffdfffffbfffffff~r~nfffffe00ffffffffffffe3ffff8fffff1ffffffffffffe00ffffffffffffc1ffff07fffe0ffffffffffffe00ffffffffffff80ffff03fffc07fffffffffffe00~r~nffffffffffff007ffe03fff803fffffffffffe00fffffffffffe00fffe01fffc01fffffffffffe00fffffffffffc01fffc01fffe00fffffffffffe00ffffffff~r~nfff803fffc00ffff007ffffffffffe00fffffffffff007fff800ffff803ffffffffffe00ffffffffffe00ffff0007fffc01ffffffffffe00ffffffffffc01fff~r~nf0003fffe00ffffffffffe00ffffffffff803fffe0003ffff007fffffffffe00ffffffffff007fffe0001ffff803fffffffffe00fffffffffe00ffffc0001fff~r~nfc01fffffffffe00fffffffffc01ffffc0000ffffe00fffffffffe00fffffffff803ffff800007ffff007ffffffffe00fffffffff007ffff000007ffff803fff~r~nfffffe00ffffffffe00fffff000003ffffc01ffffffffe00ffffffffc03ffffe000003fffff00ffffffffe00ffffffff807ffffe000001fffff807fffffffe00~r~nffffffff00fffffc000001fffffc03fffffffe00fffffffe01fffffc000000fffffe01fffffffe00fffffffc03fffff8000000ffffff00fffffffe00fffffff8~r~n07fffff00000007fffff807ffffffe00fffffff00ffffff00000007fffffc03ffffffe00ffffffe01ffffff00000003fffffe01ffffffe00ffffffc03fffffe0~r~n0000003ffffff00ffffffe00ffffff807fffffe00000003ffffff807fffffe00ffffff00ffffffe00000001ffffffc03fffffe00fffffe01ffffffc00000001f~r~nfffffe01fffffe00fffffc03ffffffc00000001fffffff00fffffe00fffff807ffffffc00000001fffffff807ffffe00fffff00fffffffc00000001fffffffc0~r~n3ffffe00ffffe01fffffffc00000000fffffffe01ffffe00ffffc03fffffffc00000000ffffffff00ffffe00ffff807fffffffc00000000ffffffff807fffe00~r~nffff00ffffffffc00000001ffffffffc01fffe00fffe01ffffffffe00000001ffffffffe00fffe00fffc03ffffffffe00000001fffffffff007ffe00fff007ff~r~nffffffe00000001fffffffff803ffe00fff80fffffffffe00000001fffffffffc07ffe00fffc1fffffffffe00000001fffffffffe0fffe00fffe3ffffffffff0~r~n0000003ffffffffff1fffe00ffff7ffffffffff00000003ffffffffffbfffe00fffffffffffffff80000007ffffffffffffffe00fffffffffffffffc000000ff~r~nfffffffffffffe00fffffffffffffffc000000fffffffffffffffe00fffffffffffffffe000003fffffffffffffffe00ffffffffffffffff800007ffffffffff~r~nfffffe00ffffffffffffffffc0000ffffffffffffffffe00fffffffffffffffff0003ffffffffffffffffe00fffffffffffffffffe01fffffffffffffffffe00~r~nffffffffffffffffffc7fffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nfffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffff~r~nfffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffffffffffff~r~nfffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe0005000000070101000000030000000000}}~r~n\par }}"
			ll_tmp = rte_1.PasteRTF(ls_temp2,Header!)
			ls_result += wf_result_add(ls_item, "7. Header ", not isnull(ll_tmp) and ll_tmp > 0 ) 
			
			//PasteRTF，band为Footer!
			ll_tmp = 0
//			rte_1.HeaderFooter = true
//			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,0,0,Footer!)
			ls_temp2 = "{\rtf1\ansi\ansicpg1252\uc2 \deff17\deflang1033\deflangfe1033{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose 02020603050405020304}Times New Roman;}{\f17\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}\'cb\'ce\'cc\'e5{\*\falt SimSun};}~r~n{\f28\fnil\fcharset134\fprq2{\*\panose 02010600030101010101}@\'cb\'ce\'cc\'e5;}{\f32\froman\fcharset238\fprq2 Times New Roman CE;}{\f33\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f35\froman\fcharset161\fprq2 Times New Roman Greek;}~r~n{\f36\froman\fcharset162\fprq2 Times New Roman Tur;}{\f37\froman\fcharset177\fprq2 Times New Roman (Hebrew);}{\f38\froman\fcharset178\fprq2 Times New Roman (Arabic);}{\f39\froman\fcharset186\fprq2 Times New Roman Baltic;}~r~n{\f170\fnil\fcharset0\fprq2 SimSun Western{\*\falt SimSun};}{\f258\fnil\fcharset0\fprq2 @\'cb\'ce\'cc\'e5 Western;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;~r~n\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{~r~n\ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 \fs22\cf1\lang1033\langfe2052\loch\f17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 \snext0 Normal;}{\*\cs10 \additive Default Paragraph Font;}}{\info~r~n{\title Tjokdrelkdfaslk;sdf}{\author appeon}{\operator appeon}{\creatim\yr2005\mo6\dy25\hr10\min28}{\revtim\yr2005\mo6\dy27\hr9\min28}{\version8}{\edmins2}{\nofpages1}{\nofwords0}{\nofchars0}{\*\company appeon}{\nofcharsws0}{\vern8269}}~r~n\paperw12240\paperh15840\margl1800\margr1800\margt1440\margb1440\gutter0 \widowctrl\ftnbj\aenddoc\noxlattoyen\expshrtn\noultrlspc\dntblnsbdb\nospaceforul\hyphcaps0\formshade\horzdoc\dgmargin\dghspace180\dgvspace180\dghorigin1800\dgvorigin1440\dghshow1~r~n\dgvshow1\jexpand\viewkind1\viewscale100\pgbrdrhead\pgbrdrfoot\splytwnine\ftnlytwnine\htmautsp\nolnhtadjtbl\useltbaln\alntblind\lytcalctblwd\lyttblrtgr\lnbrkrule \fet0\sectd \linex0\endnhere\sectlinegrid360\sectdefaultcl {\*\pnseclvl1~r~n\pnucrm\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta \hich .}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta \hich )}}~r~n{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}~r~n{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb \hich (}{\pntxta \hich )}}\pard\plain \ql \li0\ri0\widctlpar\aspalpha\aspnum\faauto\adjustright\rin0\lin0\itap0 ~r~n\fs22\cf1\lang1033\langfe2052\loch\af17\hich\af17\dbch\af17\cgrid\langnp1033\langfenp2052 {\hich\af17\dbch\af17\loch\f17 How are you?~r~n\par \hich\af17\dbch\af17\loch\f17 Thank you!~r~n\par \hich\af17\dbch\af17\loch\f17 Not at all.~r~n\par ~r~n\par {\*\shppict{\pict{\*\picprop\shplid1025{\sp{\sn shapeType}{\sv 75}}{\sp{\sn fFlipH}{\sv 0}}{\sp{\sn fFlipV}{\sv 0}}{\sp{\sn pibName}{\sv Aster2.bmp}}{\sp{\sn pibFlags}{\sv 2}}{\sp{\sn fLine}{\sv 0}}{\sp{\sn fLayoutInCell}{\sv 1}}}~r~n\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0\picw3761\pich4329\picwgoal2132\pichgoal2454\pngblip\bliptag-972157684{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n89504e470d0a1a0a0000000d4948445200000097000000a70100000000349ef3790000000467414d410000b18e7cfb5193000000097048597300000faf00000f~r~n120187cff298000003654944415448c7bd963b8e9c4010866b444048eac03247c13703c981431fc147311b39f411dcd25e0047db927197abfeaa6eba61b41a69~r~na51d6917f8fac14f3d9bf8faa32b4a0f327e90bd65ed5bd8a3dff1cefa7e5e59ba5dd946d385ad345c342fd49fe725a2ee3c6f27a2f3bc7b2c0a9b8fb5b34921~r~n13f357e7a5a9617f94eda3de066176a32c0e0d5b67615bdfb065d2b55dc36896f79a41325321e4125767fb0d78999de9cb628f49eb54b16d000b63c5e441d7ea~r~n50d94f17916d51986e2e0c023323fb834067b8779e35630df91ec16ca57bc31ffa2e67d040a629db546f314f0737f307be89fc1b9de1db95e9cba2f992b22f55~r~n94f917f2521e107673793659764960f87437f2e4310479c6821a52d93a16a6ee248dbf652a2c761e93164660e22cc4aea938feaf62aafd56c59fac09c2625731~r~nd93b88592c749c8906cd8f3054312e0f9bac37793e4f1645caf29cc9e63b6579ce448407d4c12c0c5d5ece0f89ce2ecbcb6c61962dfb26df9e987b4e4333ef99~r~nf91bf3d8b017e6dfcc3fda1cac7f84bd8edf8e388d96f4c9842c488e60c96c752369249146a825c388117101b12701fca6137a631d7b1cd803c903a2c7e285f4~r~n427a11bb595cc58a8d5e370216913e50ef6cc122d2a095f916e3543132867d687236213ffc9eb02d0dc8ad15f7a3b30e8c1a76d3cba7cc6c3e7d96bf0f763b64~r~na6f33e66766fadb1be7987691a2b2d59f3dc68bef76db04bd7da006383db6aadd8e439bd994d536d7bf707e352f94dd9629eb51eb0c2977a4141c348309f6f16~r~n2f01235127482db6c6e1bd47df7764cfd79c51aff5b717fc6fe3f9193def7bc39eb05f9b1f92475f38f5a77cd3dc6af24d53ec9c979abce7fc952c4de73c17f5~r~nfbb91e0435fea96eac2398d597a30e6de73a84909fb2c052d7d4a6a9aa6bb9fee5552ecf58553b756ff8a8aab1a5ee9a187279c6b6a3662f53aee3476d27d476~r~n62b716b93cef0ba557eca55798b5c8e5f9590002c9e53983407279b96f0dce74d0190492c9cbbd317a6f4c75bff41e8aabb3e40d0df3432e5b33d896fbb432ef~r~ndd787fd5e3711618f972165826be9c19f0dd99a93bc9ed93999d41cc8e9931f22396f3cbe07eb89c7356cd2deba585059d17c7866d73395f1516a10f41ec3665~r~nfe77e4a09f05ea9ca9cf70af9ef5ec2cd0323ece8e075bcab9f36056375ab695d75667dbb25d55377edd61fcaeec3faf80fed4d45e068e0000000049454e44ae426082}}{\nonshppict{\pict\picscalex100\picscaley100\piccropl0\piccropr0\piccropt0\piccropb0~r~n\picw3761\pich4329\picwgoal2132\pichgoal2454\wmetafile8\bliptag-972157684\blipupi99{\*\blipuid c60e0d0cd1e59ba88f607006cc1bd509}~r~n010009000003d00600000000ac06000000000400000003010800050000000b0200000000050000000c02a700970005000000070104000000ac060000430f2000~r~ncc000000a700970000000000a7009700000000002800000097000000a700000001000100000000000c0d0000af0f0000120f0000020000000200000000000000~r~nffffff00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nffffffffffcffffffffffffffffffefffffffffffffffffffe03fffffffffffffffffefffffffffffffffffff0007ffffffffffffffffeffffffffffffffffff~r~ne0001ffffffffffffffffeffffffffffffffffff80000ffffffffffffffffeffffffffffffffffff000003fffffffffffffffefffffffffffffffffc000001ff~r~nfffffffffffffefffffffffffffffffc000000fffffffffffffffefffffffffffffffff80000007ffffffffffffffefffffffffffffffff00000007fffffffff~r~nfffffeffffff7ffffffffff00000003ffffffffffdfffefffffe3fffffffffe00000001ffffffffff8fffefffff81fffffffffe00000001ffffffffff07ffefc~r~nfff00fffffffffe00000001fffffffffe03ffefcfff007ffffffffe00000001fffffffffc01ffef8fff803ffffffffe00000000fffffffff803ffef0fffc01ff~r~nffffffc00000000fffffffff007ffef0fffe00ffffffffc00000000ffffffffe00fffee0ffff007fffffffc00000000ffffffffc03fffee0ffff803fffffffc0~r~n0000000ffffffff807fffee0ffffc01fffffffc00000000ffffffff00ffffee0ffffe00fffffffc00000000fffffffe01ffffee0fffff007ffffffc00000000f~r~nffffffc03ffffec0fffff803ffffffe00000000fffffff007ffffec0fffffc01ffffffe00000001ffffffe00fffffec0fffffe00ffffffe00000001ffffffc01~r~nfffffec0ffffff803fffffe00000001ffffff803fffffec0ffffffc01ffffff00000003ffffff007fffffec0ffffffe00ffffff00000003fffffe00ffffffec0~r~nfffffff007fffff80000007fffffc01ffffffee0fffffff803fffff80000007fffff803ffffffee0fffffffc01fffffc000000ffffff007ffffffee0fffffffe~r~n00fffffc000000fffffe00fffffffee0ffffffff007ffffe000000fffffc01fffffffef0ffffffff803ffffe000001fffff803fffffffef0ffffffffc01fffff~r~n000003fffff007fffffffef8ffffffffe00fffff000003ffffe00ffffffffe00fffffffff007ffff800007ffffc01ffffffffe00fffffffff803ffffc0000fff~r~nff803ffffffffe00fffffffffc01ffffc0000fffff00fffffffffe00fffffffffe00ffffe0001ffffe01fffffffffe00ffffffffff007fffe0003ffffc03ffff~r~nfffffe00ffffffffff803ffff0003ffff007fffffffffe00ffffffffffc01ffff8007fffe00ffffffffffe00ffffffffffe00ffff8007fffc01ffffffffffe00~r~nfffffffffff007fffc00ffff803ffffffffffe00fffffffffff803fffe00ffff007ffffffffffe00fffffffffffc01fffe01fffe00fffffffffffe00ffffffff~r~nfffe00ffff01fffc01fffffffffffe00ffffffffffff007fff03fffc03fffffffffffe00ffffffffffff80ffff83fffe07fffffffffffe00ffffffffffffc1ff~r~nff87ffff0ffffffffffffe00ffffffffffffe3ffffc7ffff9ffffffffffffe00fffffffffffff7ffffffffffbffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00ffff803fffffffffff87fffffffffff007fffe00fffc0003fffffffff0003fffffffff00007ffe00fff00000ffffffffe0001ffffffff800~r~n001ffe00ffc000001fffffff800007ffffffe0000007fe00ff80000007ffffff000003ffffffc0000003fe00ff00000001fffffe000001ffffff00000001fe00~r~nfe000000007ffffc000000fffffc00000001fe00fc000000003ffff8000000fffff000000000fe00fc000000000ffff80000007fffc0000000007e00f8000000~r~n0003fff00000003fff00000000007e00f00000000000fff00000003ffc00000000003e00f000000000007fe00000003ff000000000003e00f000000000001fe0~r~n0000001fc000000000003e00e0000000000007e00000001f0000000000001e00e0000000000001e00000001e0000000000001e00c0000000000000e00000001c~r~n0000000000000e00c000000000000040000000180000000000000e00e0000000000001e00000001e0000000000001e00e0000000000003e00000001f00000000~r~n00001e00e000000000000fe00000001fc000000000001e00f000000000003fe00000003ff000000000003e00f00000000000fff00000003ffc00000000003e00~r~nf00000000001fff00000003fff00000000007e00f80000000007fff80000007fff80000000007e00fc000000001ffff80000007fffe000000000fe00fc000000~r~n007ffffc000000fffff800000001fe00fe00000000fffffe000001fffffc00000001fe00ff00000003fffffe000001ffffff00000003fe00ff0000000fffffff~r~n000007ffffffc0000007fe00ffc000003fffffffc0001ffffffff000000ffe00ffe00000fffffffff0003ffffffffe00003ffe00fff80007fffffffffe03ffff~r~nffffff8000fffe00ffffc1fffffffffffffffffffffffffc3ffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffff7ffffdfffffbfffffff~r~nfffffe00ffffffffffffe3ffff8fffff1ffffffffffffe00ffffffffffffc1ffff07fffe0ffffffffffffe00ffffffffffff80ffff03fffc07fffffffffffe00~r~nffffffffffff007ffe03fff803fffffffffffe00fffffffffffe00fffe01fffc01fffffffffffe00fffffffffffc01fffc01fffe00fffffffffffe00ffffffff~r~nfff803fffc00ffff007ffffffffffe00fffffffffff007fff800ffff803ffffffffffe00ffffffffffe00ffff0007fffc01ffffffffffe00ffffffffffc01fff~r~nf0003fffe00ffffffffffe00ffffffffff803fffe0003ffff007fffffffffe00ffffffffff007fffe0001ffff803fffffffffe00fffffffffe00ffffc0001fff~r~nfc01fffffffffe00fffffffffc01ffffc0000ffffe00fffffffffe00fffffffff803ffff800007ffff007ffffffffe00fffffffff007ffff000007ffff803fff~r~nfffffe00ffffffffe00fffff000003ffffc01ffffffffe00ffffffffc03ffffe000003fffff00ffffffffe00ffffffff807ffffe000001fffff807fffffffe00~r~nffffffff00fffffc000001fffffc03fffffffe00fffffffe01fffffc000000fffffe01fffffffe00fffffffc03fffff8000000ffffff00fffffffe00fffffff8~r~n07fffff00000007fffff807ffffffe00fffffff00ffffff00000007fffffc03ffffffe00ffffffe01ffffff00000003fffffe01ffffffe00ffffffc03fffffe0~r~n0000003ffffff00ffffffe00ffffff807fffffe00000003ffffff807fffffe00ffffff00ffffffe00000001ffffffc03fffffe00fffffe01ffffffc00000001f~r~nfffffe01fffffe00fffffc03ffffffc00000001fffffff00fffffe00fffff807ffffffc00000001fffffff807ffffe00fffff00fffffffc00000001fffffffc0~r~n3ffffe00ffffe01fffffffc00000000fffffffe01ffffe00ffffc03fffffffc00000000ffffffff00ffffe00ffff807fffffffc00000000ffffffff807fffe00~r~nffff00ffffffffc00000001ffffffffc01fffe00fffe01ffffffffe00000001ffffffffe00fffe00fffc03ffffffffe00000001fffffffff007ffe00fff007ff~r~nffffffe00000001fffffffff803ffe00fff80fffffffffe00000001fffffffffc07ffe00fffc1fffffffffe00000001fffffffffe0fffe00fffe3ffffffffff0~r~n0000003ffffffffff1fffe00ffff7ffffffffff00000003ffffffffffbfffe00fffffffffffffff80000007ffffffffffffffe00fffffffffffffffc000000ff~r~nfffffffffffffe00fffffffffffffffc000000fffffffffffffffe00fffffffffffffffe000003fffffffffffffffe00ffffffffffffffff800007ffffffffff~r~nfffffe00ffffffffffffffffc0000ffffffffffffffffe00fffffffffffffffff0003ffffffffffffffffe00fffffffffffffffffe01fffffffffffffffffe00~r~nffffffffffffffffffc7fffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffff~r~nfffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffff~r~nfffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffff~r~nfffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00ffffffffffffffffffffffffffffffff~r~nfffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00~r~nfffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe00fffffffffffffffffffffffffffffffffffffe0005000000070101000000030000000000}}~r~n\par }}"
			ll_tmp = rte_1.PasteRTF(ls_temp2,Footer!)
			ls_result += wf_result_add(ls_item, "8. Footer ", not isnull(ll_tmp) and ll_tmp > 0 ) 
			
			rte_1.ShowHeadFoot(false)
			rte_1.HeaderFooter=false			
		case lower("PointerX")
			rte_1.SelectTextAll (detail! )
			rte_1.Clear( )
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'				
			Clipboard(ls_temp2)
			rte_1.SelectText(1,1,0,0,detail!)
			rte_1.paste()
			
			ls_file ="PUB_BMP_BT_EMP.bmp"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			rte_1.InsertPicture(ls_fullname)		
			rte_1.SelectText(1,1,0,0,detail!)
			
			li_rtn = rte_1.PointerX()
			ls_result += wf_result_add(ls_item, "1. init ", not isnull(li_rtn) and li_rtn >= 0 ) 			
		case lower("PointerY")
			li_rtn = rte_1.PointerX()
			ls_result += wf_result_add(ls_item, "1. init ", not isnull(li_rtn) and li_rtn >= 0 ) 			
			
		case lower("Position")
//			rte_1.InputFieldsVisible = true
			rte_1.InputFieldNamesVisible = True
			rte_1.SelectTextAll (detail! )
			rte_1.Clear( )
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'				
			Clipboard(ls_temp2)
			rte_1.SelectText(1,1,0,0,detail!)
			rte_1.paste()
						
			//Position,带两个参数，插入点在Detail区，没有高亮选中内容，插入点所处行前面有InputField
			rte_1.SelectText(1,1,0,0,Detail!)
			rte_1.InputFieldInsert("AppeonField")
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar)
			ls_result += wf_result_add(ls_item, "1. two arg detail inputfield ", not isnull(lb_Band) and not isnull(ll_FromLine) and not isnull(ll_FromChar) and ll_FromLine = 1 and ll_FromChar = 14 and lb_Band = detail!) 			
			
			//Position,带两个参数，插入点在Detail区，没有高亮选中内容，插入点所处行前面有图片
			ll_FromLine = 0 
			ll_FromChar = 0
			rte_1.SelectTextAll (detail! )
			rte_1.Clear( )
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'				
			Clipboard(ls_temp2)
			rte_1.SelectText(1,1,0,0,detail!)
			rte_1.paste()
			
			rte_1.SelectText(1,1,0,0,detail!)
			rte_1.InsertPicture(ls_fullname)	
			rte_1.SelectText(1,1,0,0,detail!)
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar)
			ls_result += wf_result_add(ls_item, "2. two arg detail no inputfield ", not isnull(lb_Band) and not isnull(ll_FromLine) and not isnull(ll_FromChar) and ll_FromLine = 1 and ll_FromChar = 1 and lb_Band = detail!) 			
			
			// Position,带两个参数，插入点在Header区，从后往前高亮选中多行内容
			ll_FromLine = 0 
			ll_FromChar = 0
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectTextAll (detail! )
			rte_1.Clear( )
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'				
			Clipboard(ls_temp2)
			rte_1.SelectText(1,1,0,0,detail!)
			rte_1.paste()
			
			rte_1.SelectText(10,1,1,1,Header!)
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar)
			ls_result += wf_result_add(ls_item, "3. two arg Header ", not isnull(lb_Band) and not isnull(ll_FromLine) and not isnull(ll_FromChar) and ll_FromLine = 10 and ll_FromChar = 1 and lb_Band = Header!) 			
			
			//Position,带两个参数，插入点在Footer区，从前往后高亮选中多行内容
			ll_FromLine = 0 
			ll_FromChar = 0
//			rte_1.HeaderFooter = true
//			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,10,1,Footer!)
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar)
			ls_result += wf_result_add(ls_item, "4. two arg Footer ", not isnull(lb_Band) and not isnull(ll_FromLine) and not isnull(ll_FromChar) and ll_FromLine = 1 and ll_FromChar = 1 and lb_Band = Footer!) 			
			
			//Position,带四个参数，插入点在Detail区，没有高亮选中内容，插入点所处行前面有InputField
			ll_FromLine = 0 
			ll_FromChar = 0
			ll_ToLine = 0 
			ll_ToChar = 0
			rte_1.SelectText(1,1,0,0,Detail!)
			rte_1.InputFieldInsert("LanSu")
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar)
			ls_result += wf_result_add(ls_item, "5. four arg Detail inputfield ", not isnull(lb_Band) and not isnull(ll_FromLine) and not isnull(ll_FromChar) and ll_FromLine = 1 and ll_FromChar = 8 &
													and lb_Band = Detail! and not isnull(ll_ToLine) and not isnull(ll_ToChar) and ll_ToLine = 0 and ll_ToChar = 0) 			
			
			// Position,带四个参数，插入点在Detail区，没有高亮选中内容，插入点所处行前面有图片
			ll_FromLine = 0 
			ll_FromChar = 0
			ll_ToLine = 0 
			ll_ToChar = 0
			rte_1.SelectTextAll (detail! )
			rte_1.Clear( )
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'				
			Clipboard(ls_temp2)
			rte_1.SelectText(1,1,0,0,detail!)
			rte_1.paste()
			
			rte_1.SelectText(1,1,0,0,detail!)
			rte_1.InsertPicture(ls_fullname)	
			rte_1.SelectText(1,1,0,0,detail!)
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar)
			ls_result += wf_result_add(ls_item, "6. four arg Detail pic ", not isnull(lb_Band) and not isnull(ll_FromLine) and not isnull(ll_FromChar) and ll_FromLine = 1 and ll_FromChar = 1 &
													and lb_Band = Detail! and not isnull(ll_ToLine) and not isnull(ll_ToChar) and ll_ToLine = 0 and ll_ToChar = 0) 			
			
			// Position,带四个参数，插入点在Header区，从后往前高亮选中多行内容
			ll_FromLine = 0 
			ll_FromChar = 0
			ll_ToLine = 0 
			ll_ToChar = 0
//			rte_1.HeaderFooter = true
//			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,2,3,header!)
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar)
			ls_result += wf_result_add(ls_item, "7. four arg header ", not isnull(lb_Band) and not isnull(ll_FromLine) and not isnull(ll_FromChar) and ll_FromLine = 1 and ll_FromChar = 1 &
													and lb_Band = header! and not isnull(ll_ToLine) and not isnull(ll_ToChar) and ll_ToLine = 2 and ll_ToChar = 3) 			
			// Position,带四个参数，插入点在Footer区，从前往后高亮选中多行内容
			ll_FromLine = 0 
			ll_FromChar = 0
			ll_ToLine = 0 
			ll_ToChar = 0
//			rte_1.HeaderFooter = true
//			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,10,1,Footer!)
			lb_Band = rte_1.Position(ll_FromLine,ll_FromChar,ll_ToLine,ll_ToChar)
			ls_result += wf_result_add(ls_item, "8. four arg Footer ", not isnull(lb_Band) and not isnull(ll_FromLine) and not isnull(ll_FromChar) and ll_FromLine = 1 and ll_FromChar = 1 &
													and lb_Band = Footer! and not isnull(ll_ToLine) and not isnull(ll_ToChar) and ll_ToLine = 10 and ll_ToChar = 1) 			
			
			rte_1.ShowHeadFoot(false)
			rte_1.HeaderFooter=false
			
			rte_1.InputFieldNamesVisible = false
		case lower("PostEvent")
			//PostEvent,参数event为NULL值
			SetNull(ltr_Event)
			lbn_flag = rte_1.PostEvent(ltr_Event)
			ls_result += wf_result_add(ls_item, "1. arg null ", isnull(lbn_flag) ) 			
			
			//PostEvent,参数使用枚举值
			lbn_flag =false
			ltr_Event = RbuttonDown!
			lbn_flag = rte_1.PostEvent(ltr_Event)
			ls_result += wf_result_add(ls_item, "2. arg RbuttonDown enumerate ", not isnull(lbn_flag) and lbn_flag = true ) 	
			
			//PostEvent,参数使用字符串
			lbn_flag =false
			lbn_flag = rte_1.PostEvent('RbuttonDown')
			ls_result += wf_result_add(ls_item, "3. arg RbuttonDown string ", not isnull(lbn_flag) and lbn_flag = true ) 	
			
			//PostEvent,参数使用无效事件名
			lbn_flag =false
			lbn_flag = rte_1.PostEvent('NoValid')
			ls_result += wf_result_add(ls_item, "4. arg NoValid string ", not isnull(lbn_flag) and lbn_flag = false) 				
		case lower("Preview")
			//Preview,参数为NULL
			SetNull(lbn_flag)
			li_rtn = rte_1.Preview(lbn_flag)
			ls_result += wf_result_add(ls_item, "1. arg null ", isnull(li_rtn) ) 			
			
			//Preview,参数为true,数据内容只有一页
			li_rtn = 0 
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t921~tlrzj~r~nSeries2~t600~txiog~r~nSeries3~t784~tliex~r~nSeries4~t569~tzuzo~r~nSeries1~t949~trkru~r~nSeries2~t333~tvojb~r~nSeries3~t527~tzmwz~r~nSeries4~t333~towkj~r~nSeries1~t556~tlefr~r~nSeries2~t744~tamdi~r~nSeries3~t372~tpnpu~r~nSeries4~t851~thgxp~r~nSeries1~t353~tnjwj~r~nSeries2~t402~twaxx~r~nSeries3~t977~tnsnh~r~nSeries4~t624~tlqqr~r~nSeries1~t324~tudlt~r~nSeries2~t399~tzotc~r~nSeries3~t572~ttnzx~r~nSeries4~t458~tglsd~r~nSeries1~t867~tmzcn~r~nSeries2~t860~tckvf~r~nSeries3~t658~tjfrm~r~nSeries4~t560~totho~r~nSeries1~t547~tkbjz~r~nSeries2~t695~tucwl~r~nSeries3~t368~tfrim~r~nSeries4~t331~tmyhc~r~nSeries1~t781~tzriw~r~nSeries2~t752~tbarx~r~nSeries3~t549~tgfcb~r~nSeries4~t572~teyhj~r~nSeries1~t402~tgixw~r~nSeries2~t621~tbvtr~r~nSeries3~t684~thbbc~r~nSeries4~t813~txifb~r~nSeries1~t978~tvfbc~r~nSeries2~t426~tkcfq~r~nSeries3~t812~tkcot~r~nSeries4~t525~tgkub~r~n ')
			rte_1.Paste()
			lbn_flag = true 
			li_rtn = rte_1.Preview(lbn_flag)
			ls_result += wf_result_add(ls_item, "2. arg true one page ", not isnull(li_rtn) and li_rtn = 1 ) 			
			
			//Preview,参数为true,数据内容有多页
			li_rtn = 0 
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t490~tknfp~r~nSeries2~t843~tycgf~r~nSeries3~t631~teowq~r~nSeries4~t667~twwwp~r~nSeries1~t373~tsqme~r~nSeries2~t515~togep~r~nSeries3~t485~tpxnv~r~nSeries4~t352~tiupa~r~nSeries1~t678~tyynm~r~nSeries2~t604~tmnuv~r~nSeries3~t806~tlhse~r~nSeries4~t344~tdwra~r~nSeries1~t755~tgfmz~r~nSeries2~t792~tgipd~r~nSeries3~t357~todkj~r~nSeries4~t610~tjqwi~r~nSeries1~t407~tpuoq~r~nSeries2~t813~timvf~r~nSeries3~t727~tuzwy~r~nSeries4~t560~tijgf~r~nSeries1~t985~tllkj~r~nSeries2~t812~tuhsj~r~nSeries3~t395~tfbtl~r~nSeries4~t738~tmfqr~r~nSeries1~t977~tyjfj~r~nSeries2~t939~thhss~r~nSeries3~t943~tctyd~r~nSeries4~t858~teamd~r~nSeries1~t767~tjbpr~r~nSeries2~t772~ttneg~r~nSeries3~t442~tiwxg~r~nSeries4~t582~tjwlg~r~nSeries1~t847~tsmea~r~nSeries2~t418~tarwt~r~nSeries3~t446~tjsjb~r~nSeries4~t618~toioj~r~nSeries1~t426~twhyp~r~nSeries2~t808~tvrui~r~nSeries3~t422~toswk~r~nSeries4~t350~tfygt~r~nSeries1~t482~tdhac~r~nSeries2~t618~tyhsg~r~nSeries3~t599~twzmt~r~nSeries4~t498~tonzl~r~nSeries1~t584~tjhga~r~nSeries2~t805~thnih~r~nSeries3~t749~teqgj~r~nSeries4~t312~twkjs~r~nSeries1~t836~ttpjh~r~nSeries2~t931~tefqz~r~nSeries3~t458~tauld~r~nSeries4~t603~tchjc~r~nSeries1~t892~tdyrf~r~nSeries2~t464~tvriv~r~nSeries3~t807~tyeeg~r~nSeries4~t944~tivdr~r~nSeries1~t606~tygur~r~nSeries2~t694~tdred~r~nSeries3~t476~tkubn~r~nSeries4~t320~tgupr~r~nSeries1~t697~tqylo~r~nSeries2~t804~tcwqx~r~nSeries3~t689~tzmau~r~nSeries4~t694~tjgmh~r~nSeries1~t482~tmhgd~r~nSeries2~t318~tmphn~r~nSeries3~t586~tkamh~r~nSeries4~t823~trktr~r~nSeries1~t547~tfacl~r~nSeries2~t870~tgrzk~r~nSeries3~t864~tldac~r~nSeries4~t448~tlteo~r~nSeries1~t343~tomon~r~nSeries2~t880~trqyj~r~nSeries3~t347~tginr~r~nSeries4~t301~tnzwa~r~nSeries1~t536~txxae~r~nSeries2~t431~trwud~r~nSeries3~t561~tzrfu~r~nSeries4~t348~tewjt~r~n ')
			rte_1.Paste()
			lbn_flag = true 
			li_rtn = rte_1.Preview(lbn_flag)
			ls_result += wf_result_add(ls_item, "3. arg true multi pages ", not isnull(li_rtn) and li_rtn = 1 ) 			
			
			// Preview,参数为false
			li_rtn = 0 
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t921~tlrzj~r~nSeries2~t600~txiog~r~nSeries3~t784~tliex~r~nSeries4~t569~tzuzo~r~nSeries1~t949~trkru~r~nSeries2~t333~tvojb~r~nSeries3~t527~tzmwz~r~nSeries4~t333~towkj~r~nSeries1~t556~tlefr~r~nSeries2~t744~tamdi~r~nSeries3~t372~tpnpu~r~nSeries4~t851~thgxp~r~nSeries1~t353~tnjwj~r~nSeries2~t402~twaxx~r~nSeries3~t977~tnsnh~r~nSeries4~t624~tlqqr~r~nSeries1~t324~tudlt~r~nSeries2~t399~tzotc~r~nSeries3~t572~ttnzx~r~nSeries4~t458~tglsd~r~nSeries1~t867~tmzcn~r~nSeries2~t860~tckvf~r~nSeries3~t658~tjfrm~r~nSeries4~t560~totho~r~nSeries1~t547~tkbjz~r~nSeries2~t695~tucwl~r~nSeries3~t368~tfrim~r~nSeries4~t331~tmyhc~r~nSeries1~t781~tzriw~r~nSeries2~t752~tbarx~r~nSeries3~t549~tgfcb~r~nSeries4~t572~teyhj~r~nSeries1~t402~tgixw~r~nSeries2~t621~tbvtr~r~nSeries3~t684~thbbc~r~nSeries4~t813~txifb~r~nSeries1~t978~tvfbc~r~nSeries2~t426~tkcfq~r~nSeries3~t812~tkcot~r~nSeries4~t525~tgkub~r~n ')
			rte_1.Paste()
			lbn_flag = false 
			li_rtn = rte_1.Preview(lbn_flag)
			ls_result += wf_result_add(ls_item, "4. arg false ", not isnull(li_rtn) and li_rtn = 1 ) 
		case lower("Print")
			is_type = "Print Timer"
			yield()
			timer(1)
			
			//Print,参数copies为NULL
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t490~tknfp~r~nSeries2~t843~tycgf~r~nSeries3~t631~teowq~r~nSeries4~t667~twwwp~r~nSeries1~t373~tsqme~r~nSeries2~t515~togep~r~nSeries3~t485~tpxnv~r~nSeries4~t352~tiupa~r~nSeries1~t678~tyynm~r~nSeries2~t604~tmnuv~r~nSeries3~t806~tlhse~r~nSeries4~t344~tdwra~r~nSeries1~t755~tgfmz~r~nSeries2~t792~tgipd~r~nSeries3~t357~todkj~r~nSeries4~t610~tjqwi~r~nSeries1~t407~tpuoq~r~nSeries2~t813~timvf~r~nSeries3~t727~tuzwy~r~nSeries4~t560~tijgf~r~nSeries1~t985~tllkj~r~nSeries2~t812~tuhsj~r~nSeries3~t395~tfbtl~r~nSeries4~t738~tmfqr~r~nSeries1~t977~tyjfj~r~nSeries2~t939~thhss~r~nSeries3~t943~tctyd~r~nSeries4~t858~teamd~r~nSeries1~t767~tjbpr~r~nSeries2~t772~ttneg~r~nSeries3~t442~tiwxg~r~nSeries4~t582~tjwlg~r~nSeries1~t847~tsmea~r~nSeries2~t418~tarwt~r~nSeries3~t446~tjsjb~r~nSeries4~t618~toioj~r~nSeries1~t426~twhyp~r~nSeries2~t808~tvrui~r~nSeries3~t422~toswk~r~nSeries4~t350~tfygt~r~nSeries1~t482~tdhac~r~nSeries2~t618~tyhsg~r~nSeries3~t599~twzmt~r~nSeries4~t498~tonzl~r~nSeries1~t584~tjhga~r~nSeries2~t805~thnih~r~nSeries3~t749~teqgj~r~nSeries4~t312~twkjs~r~nSeries1~t836~ttpjh~r~nSeries2~t931~tefqz~r~nSeries3~t458~tauld~r~nSeries4~t603~tchjc~r~nSeries1~t892~tdyrf~r~nSeries2~t464~tvriv~r~nSeries3~t807~tyeeg~r~nSeries4~t944~tivdr~r~nSeries1~t606~tygur~r~nSeries2~t694~tdred~r~nSeries3~t476~tkubn~r~nSeries4~t320~tgupr~r~nSeries1~t697~tqylo~r~nSeries2~t804~tcwqx~r~nSeries3~t689~tzmau~r~nSeries4~t694~tjgmh~r~nSeries1~t482~tmhgd~r~nSeries2~t318~tmphn~r~nSeries3~t586~tkamh~r~nSeries4~t823~trktr~r~nSeries1~t547~tfacl~r~nSeries2~t870~tgrzk~r~nSeries3~t864~tldac~r~nSeries4~t448~tlteo~r~nSeries1~t343~tomon~r~nSeries2~t880~trqyj~r~nSeries3~t347~tginr~r~nSeries4~t301~tnzwa~r~nSeries1~t536~txxae~r~nSeries2~t431~trwud~r~nSeries3~t561~tzrfu~r~nSeries4~t348~tewjt~r~n ')
			rte_1.Paste()
			SetNull(li_col)
			li_rtn = rte_1.Print(li_col,'',true,true)
			ls_result += wf_result_add(ls_item, "1. arg copies null ", isnull(li_rtn) ) 
	
			//Print,参数pagerange为NULL
			li_rtn = 0 
			SetNull(ls_temp2)
			//modified by zhoujunwei document 为null时 print crash
			if 1 <> 1 then
				li_rtn = rte_1.Print(1,ls_temp2,true,true)
				ls_result += wf_result_add(ls_item, "2. arg pagerange null ", not isnull(li_rtn) and li_rtn = 1 ) 
			end if
	
			// Print,参数collate为NULL
			li_rtn = 0 
			SetNull(lbn_flag)
			li_rtn = rte_1.Print(1,'',lbn_flag,true)
			ls_result += wf_result_add(ls_item, "3. arg collate null ", not isnull(li_rtn) and li_rtn = 1 ) 

			// Print,参数canceldialog为NULL
			li_rtn = 0 
			SetNull(lbn_flag)
			li_rtn = rte_1.Print(1,'',true,lbn_flag)
			ls_result += wf_result_add(ls_item, "4. arg canceldialog null ", not isnull(li_rtn) and li_rtn = 1 ) 

			//Print,copies=2,Pagerange="1-3",collate=false,Canceldialog=false
			li_rtn = 0 
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t452~tnbec~r~nSeries2~t845~tbcjp~r~nSeries3~t514~tyjli~r~nSeries4~t436~titll~r~nSeries1~t756~tlxel~r~nSeries2~t431~tdkex~r~nSeries3~t941~ttquv~r~nSeries4~t853~tttey~r~nSeries1~t632~ttlql~r~nSeries2~t711~tbbvo~r~nSeries3~t608~tozky~r~nSeries4~t358~tayyr~r~nSeries1~t303~taqmy~r~nSeries2~t581~thzxn~r~nSeries3~t749~tsiyf~r~nSeries4~t542~texwb~r~nSeries1~t433~toewq~r~nSeries2~t696~tqrtc~r~nSeries3~t344~tlpqm~r~nSeries4~t416~tjifv~r~nSeries1~t728~tymkg~r~nSeries2~t869~ttzjm~r~nSeries3~t749~tzqtm~r~nSeries4~t707~tpnde~r~nSeries1~t808~tnmth~r~nSeries2~t963~titss~r~nSeries3~t619~taqnj~r~nSeries4~t892~tdoyj~r~nSeries1~t491~tpyat~r~nSeries2~t320~tleyq~r~nSeries3~t771~tvkpa~r~nSeries4~t541~tsvbm~r~nSeries1~t593~txrll~r~nSeries2~t336~tvfed~r~nSeries3~t608~tjiga~r~nSeries4~t379~tyxjv~r~nSeries1~t500~tqvrb~r~nSeries2~t537~tcuig~r~nSeries3~t746~tipyh~r~nSeries4~t565~tbxip~r~nSeries1~t990~tzncw~r~nSeries2~t636~trbli~r~nSeries3~t929~tizxo~r~nSeries4~t742~tptqq~r~nSeries1~t815~teaaf~r~nSeries2~t324~teqio~r~nSeries3~t888~tpyfa~r~nSeries4~t414~tuqmv~r~nSeries1~t975~txkmn~r~nSeries2~t375~tmsya~r~nSeries3~t822~tptlz~r~nSeries4~t876~tnotl~r~nSeries1~t310~tlwuh~r~nSeries2~t744~tfqjr~r~nSeries3~t798~twbwh~r~nSeries4~t368~tqhzk~r~nSeries1~t861~tdkcr~r~nSeries2~t974~tvbei~r~nSeries3~t593~tipvf~r~nSeries4~t740~tpzhy~r~nSeries1~t336~tjabt~r~nSeries2~t562~twwtb~r~nSeries3~t648~tdogk~r~nSeries4~t657~tmhib~r~nSeries1~t635~txrnx~r~nSeries2~t955~txrzl~r~nSeries3~t501~ttbqe~r~nSeries4~t358~tkrqo~r~nSeries1~t495~terna~r~nSeries2~t384~tlqyj~r~nSeries3~t592~tqoub~r~nSeries4~t515~tjseb~r~nSeries1~t511~tlwnk~r~nSeries2~t515~tvloi~r~nSeries3~t689~tzfpi~r~nSeries4~t978~twycz~r~nSeries1~t492~twzzv~r~nSeries2~t881~twxot~r~nSeries3~t356~tkudk~r~nSeries4~t593~tedup~r~nSeries1~t429~tczlh~r~nSeries2~t950~tuskd~r~nSeries3~t735~tevdc~r~nSeries4~t704~tlbkl~r~nSeries1~t430~tjmpf~r~nSeries2~t900~tcyqt~r~nSeries3~t675~tcvvv~r~nSeries4~t374~trffv~r~nSeries1~t587~tekkq~r~nSeries2~t760~tcupr~r~nSeries3~t419~tjaut~r~nSeries4~t699~tuvcz~r~nSeries1~t692~ticth~r~nSeries2~t917~txsxc~r~nSeries3~t569~tprgd~r~nSeries4~t559~twxfa~r~nSeries1~t707~tgayr~r~nSeries2~t473~teicu~r~nSeries3~t812~tdiam~r~nSeries4~t945~ttkbx~r~nSeries1~t425~ttdir~r~nSeries2~t745~txgvz~r~nSeries3~t673~tmeyr~r~nSeries4~t611~tvfic~r~nSeries1~t699~tqniv~r~nSeries2~t630~tjzau~r~nSeries3~t784~tfdft~r~nSeries4~t451~tmops~r~nSeries1~t381~tgpug~r~nSeries2~t845~ttuhl~r~nSeries3~t817~tvspi~r~nSeries4~t914~tazrs~r~nSeries1~t592~tfszw~r~nSeries2~t952~tbqmu~r~nSeries3~t498~twmxc~r~nSeries4~t502~tbhum~r~nSeries1~t995~tgjqm~r~nSeries2~t877~tnkyr~r~nSeries3~t330~tnsjv~r~nSeries4~t980~tzxss~r~nSeries1~t616~txnjo~r~nSeries2~t566~tuyjn~r~nSeries3~t872~tuwrs~r~nSeries4~t608~txwqy~r~nSeries1~t794~txcsz~r~nSeries2~t946~toklw~r~nSeries3~t649~tdrlt~r~nSeries4~t870~tscie~r~nSeries1~t409~tpiwl~r~nSeries2~t628~tqige~r~nSeries3~t353~tjsqh~r~nSeries4~t310~tjlrg~r~nSeries1~t927~tmwan~r~nSeries2~t462~txrfn~r~nSeries3~t696~takzt~r~nSeries4~t917~tjhxa~r~nSeries1~t429~tnfqj~r~nSeries2~t309~txioh~r~nSeries3~t825~tjqrj~r~nSeries4~t350~thymd~r~nSeries1~t542~tvwge~r~nSeries2~t760~thjes~r~nSeries3~t826~thtiz~r~nSeries4~t666~tojlj~r~nSeries1~t613~tpmox~r~nSeries2~t941~tyuyo~r~nSeries3~t838~tqjkz~r~nSeries4~t755~tvjgk~r~nSeries1~t930~txkew~r~nSeries2~t414~tzhbj~r~nSeries3~t971~tuths~r~nSeries4~t483~toefj~r~nSeries1~t869~twwye~r~nSeries2~t381~tzluh~r~nSeries3~t756~tgabb~r~nSeries4~t906~tqrhc~r~nSeries1~t324~ttxmj~r~nSeries2~t590~tcaxx~r~nSeries3~t683~tufah~r~nSeries4~t593~tyayz~r~nSeries1~t899~thuhj~r~nSeries2~t980~tjsvo~r~nSeries3~t526~thtyd~r~nSeries4~t370~tpbsz~r~nSeries1~t628~tsbzi~r~nSeries2~t857~trvgq~r~nSeries3~t922~tlunw~r~nSeries4~t943~tcpir~r~nSeries1~t847~tfcbt~r~nSeries2~t563~teplk~r~nSeries3~t732~twfkh~r~nSeries4~t525~touoy~r~nSeries1~t963~trwmq~r~nSeries2~t485~tjahy~r~nSeries3~t550~tmfev~r~nSeries4~t867~tdcom~r~nSeries1~t872~tyhgd~r~nSeries2~t356~tlxuk~r~nSeries3~t314~tyzcp~r~nSeries4~t605~tskwg~r~nSeries1~t828~tulsu~r~nSeries2~t836~tkbse~r~nSeries3~t870~tjeis~r~nSeries4~t647~tsgce~r~nSeries1~t738~twapq~r~nSeries2~t836~tvlwi~r~nSeries3~t928~trovj~r~nSeries4~t853~tdzxx~r~nSeries1~t783~thqls~r~nSeries2~t675~tzihm~r~nSeries3~t334~tzrio~r~nSeries4~t997~trqet~r~nSeries1~t899~tzfbl~r~nSeries2~t669~tjiem~r~nSeries3~t748~tfzbh~r~nSeries4~t822~tfnwy~r~nSeries1~t508~tmxxg~r~nSeries2~t993~tpylr~r~nSeries3~t782~txglm~r~nSeries4~t865~tbiyl~r~nSeries1~t634~thcwh~r~nSeries2~t402~tsyoy~r~nSeries3~t897~tgmgo~r~nSeries4~t530~tprza~r~nSeries1~t471~tqmom~r~nSeries2~t588~tyhga~r~nSeries3~t893~tiupj~r~nSeries4~t916~tbzxt~r~nSeries1~t339~ttopo~r~nSeries2~t841~tmitn~r~nSeries3~t958~twtoe~r~nSeries4~t647~tonxw~r~nSeries1~t656~tghut~r~nSeries2~t507~tfklg~r~nSeries3~t616~tlrnu~r~nSeries4~t415~tkmsy~r~nSeries1~t830~tcpui~r~nSeries2~t904~tahqa~r~nSeries3~t617~tmsck~r~nSeries4~t834~taalk~r~nSeries1~t439~tcsnx~r~nSeries2~t302~tcovt~r~nSeries3~t700~tkrxa~r~nSeries4~t330~tzadj~r~nSeries1~t331~twxqm~r~nSeries2~t861~tdhld~r~nSeries3~t744~ttxsk~r~nSeries4~t724~txtez~r~nSeries1~t402~tjsqt~r~nSeries2~t996~tbccf~r~nSeries3~t800~tmwhb~r~nSeries4~t836~tssii~r~nSeries1~t402~tvijs~r~nSeries2~t521~txiic~r~nSeries3~t967~tahmk~r~nSeries4~t861~tywtt~r~nSeries1~t440~tzppk~r~nSeries2~t615~tlbmj~r~nSeries3~t882~thtpu~r~nSeries4~t371~tiebp~r~nSeries1~t784~tbmue~r~nSeries2~t460~tyrhl~r~nSeries3~t712~thxwg~r~nSeries4~t326~tprwv~r~nSeries1~t652~tshzy~r~nSeries2~t796~tvqye~r~nSeries3~t311~tztoz~r~nSeries4~t634~tabna~r~nSeries1~t704~thrrb~r~nSeries2~t540~tdndo~r~nSeries3~t928~txeui~r~nSeries4~t576~tzioi~r~nSeries1~t435~tozxq~r~nSeries2~t325~tihwa~r~nSeries3~t826~troqr~r~nSeries4~t325~tqwcv~r~nSeries1~t527~txzip~r~nSeries2~t560~tdiis~r~nSeries3~t878~tqnzo~r~nSeries4~t419~tcwva~r~n ')
			rte_1.Paste()
//			if string(gi_major)+string(gi_minor) <> "126" then 
              //modified by zhoujunwei print crash at 2017-11-29
			if 1 <> 1 then
				li_rtn = rte_1.Print(2,'1-3',false,false)
				ls_result += wf_result_add(ls_item, "5. arg 2, 1-3, false, false ", not isnull(li_rtn) and li_rtn = 1 ) 			//crash in pb12.6	
//			else
//				ls_result += wf_result_add(ls_item, "5. arg 2, 1-3, false, false ", false ) 				
			end if 
			
			//Print,copies=2,Pagerange="1,2-4",collate=true,Canceldialog=false
			li_rtn = 0 
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t452~tnbec~r~nSeries2~t845~tbcjp~r~nSeries3~t514~tyjli~r~nSeries4~t436~titll~r~nSeries1~t756~tlxel~r~nSeries2~t431~tdkex~r~nSeries3~t941~ttquv~r~nSeries4~t853~tttey~r~nSeries1~t632~ttlql~r~nSeries2~t711~tbbvo~r~nSeries3~t608~tozky~r~nSeries4~t358~tayyr~r~nSeries1~t303~taqmy~r~nSeries2~t581~thzxn~r~nSeries3~t749~tsiyf~r~nSeries4~t542~texwb~r~nSeries1~t433~toewq~r~nSeries2~t696~tqrtc~r~nSeries3~t344~tlpqm~r~nSeries4~t416~tjifv~r~nSeries1~t728~tymkg~r~nSeries2~t869~ttzjm~r~nSeries3~t749~tzqtm~r~nSeries4~t707~tpnde~r~nSeries1~t808~tnmth~r~nSeries2~t963~titss~r~nSeries3~t619~taqnj~r~nSeries4~t892~tdoyj~r~nSeries1~t491~tpyat~r~nSeries2~t320~tleyq~r~nSeries3~t771~tvkpa~r~nSeries4~t541~tsvbm~r~nSeries1~t593~txrll~r~nSeries2~t336~tvfed~r~nSeries3~t608~tjiga~r~nSeries4~t379~tyxjv~r~nSeries1~t500~tqvrb~r~nSeries2~t537~tcuig~r~nSeries3~t746~tipyh~r~nSeries4~t565~tbxip~r~nSeries1~t990~tzncw~r~nSeries2~t636~trbli~r~nSeries3~t929~tizxo~r~nSeries4~t742~tptqq~r~nSeries1~t815~teaaf~r~nSeries2~t324~teqio~r~nSeries3~t888~tpyfa~r~nSeries4~t414~tuqmv~r~nSeries1~t975~txkmn~r~nSeries2~t375~tmsya~r~nSeries3~t822~tptlz~r~nSeries4~t876~tnotl~r~nSeries1~t310~tlwuh~r~nSeries2~t744~tfqjr~r~nSeries3~t798~twbwh~r~nSeries4~t368~tqhzk~r~nSeries1~t861~tdkcr~r~nSeries2~t974~tvbei~r~nSeries3~t593~tipvf~r~nSeries4~t740~tpzhy~r~nSeries1~t336~tjabt~r~nSeries2~t562~twwtb~r~nSeries3~t648~tdogk~r~nSeries4~t657~tmhib~r~nSeries1~t635~txrnx~r~nSeries2~t955~txrzl~r~nSeries3~t501~ttbqe~r~nSeries4~t358~tkrqo~r~nSeries1~t495~terna~r~nSeries2~t384~tlqyj~r~nSeries3~t592~tqoub~r~nSeries4~t515~tjseb~r~nSeries1~t511~tlwnk~r~nSeries2~t515~tvloi~r~nSeries3~t689~tzfpi~r~nSeries4~t978~twycz~r~nSeries1~t492~twzzv~r~nSeries2~t881~twxot~r~nSeries3~t356~tkudk~r~nSeries4~t593~tedup~r~nSeries1~t429~tczlh~r~nSeries2~t950~tuskd~r~nSeries3~t735~tevdc~r~nSeries4~t704~tlbkl~r~nSeries1~t430~tjmpf~r~nSeries2~t900~tcyqt~r~nSeries3~t675~tcvvv~r~nSeries4~t374~trffv~r~nSeries1~t587~tekkq~r~nSeries2~t760~tcupr~r~nSeries3~t419~tjaut~r~nSeries4~t699~tuvcz~r~nSeries1~t692~ticth~r~nSeries2~t917~txsxc~r~nSeries3~t569~tprgd~r~nSeries4~t559~twxfa~r~nSeries1~t707~tgayr~r~nSeries2~t473~teicu~r~nSeries3~t812~tdiam~r~nSeries4~t945~ttkbx~r~nSeries1~t425~ttdir~r~nSeries2~t745~txgvz~r~nSeries3~t673~tmeyr~r~nSeries4~t611~tvfic~r~nSeries1~t699~tqniv~r~nSeries2~t630~tjzau~r~nSeries3~t784~tfdft~r~nSeries4~t451~tmops~r~nSeries1~t381~tgpug~r~nSeries2~t845~ttuhl~r~nSeries3~t817~tvspi~r~nSeries4~t914~tazrs~r~nSeries1~t592~tfszw~r~nSeries2~t952~tbqmu~r~nSeries3~t498~twmxc~r~nSeries4~t502~tbhum~r~nSeries1~t995~tgjqm~r~nSeries2~t877~tnkyr~r~nSeries3~t330~tnsjv~r~nSeries4~t980~tzxss~r~nSeries1~t616~txnjo~r~nSeries2~t566~tuyjn~r~nSeries3~t872~tuwrs~r~nSeries4~t608~txwqy~r~nSeries1~t794~txcsz~r~nSeries2~t946~toklw~r~nSeries3~t649~tdrlt~r~nSeries4~t870~tscie~r~nSeries1~t409~tpiwl~r~nSeries2~t628~tqige~r~nSeries3~t353~tjsqh~r~nSeries4~t310~tjlrg~r~nSeries1~t927~tmwan~r~nSeries2~t462~txrfn~r~nSeries3~t696~takzt~r~nSeries4~t917~tjhxa~r~nSeries1~t429~tnfqj~r~nSeries2~t309~txioh~r~nSeries3~t825~tjqrj~r~nSeries4~t350~thymd~r~nSeries1~t542~tvwge~r~nSeries2~t760~thjes~r~nSeries3~t826~thtiz~r~nSeries4~t666~tojlj~r~nSeries1~t613~tpmox~r~nSeries2~t941~tyuyo~r~nSeries3~t838~tqjkz~r~nSeries4~t755~tvjgk~r~nSeries1~t930~txkew~r~nSeries2~t414~tzhbj~r~nSeries3~t971~tuths~r~nSeries4~t483~toefj~r~nSeries1~t869~twwye~r~nSeries2~t381~tzluh~r~nSeries3~t756~tgabb~r~nSeries4~t906~tqrhc~r~nSeries1~t324~ttxmj~r~nSeries2~t590~tcaxx~r~nSeries3~t683~tufah~r~nSeries4~t593~tyayz~r~nSeries1~t899~thuhj~r~nSeries2~t980~tjsvo~r~nSeries3~t526~thtyd~r~nSeries4~t370~tpbsz~r~nSeries1~t628~tsbzi~r~nSeries2~t857~trvgq~r~nSeries3~t922~tlunw~r~nSeries4~t943~tcpir~r~nSeries1~t847~tfcbt~r~nSeries2~t563~teplk~r~nSeries3~t732~twfkh~r~nSeries4~t525~touoy~r~nSeries1~t963~trwmq~r~nSeries2~t485~tjahy~r~nSeries3~t550~tmfev~r~nSeries4~t867~tdcom~r~nSeries1~t872~tyhgd~r~nSeries2~t356~tlxuk~r~nSeries3~t314~tyzcp~r~nSeries4~t605~tskwg~r~nSeries1~t828~tulsu~r~nSeries2~t836~tkbse~r~nSeries3~t870~tjeis~r~nSeries4~t647~tsgce~r~nSeries1~t738~twapq~r~nSeries2~t836~tvlwi~r~nSeries3~t928~trovj~r~nSeries4~t853~tdzxx~r~nSeries1~t783~thqls~r~nSeries2~t675~tzihm~r~nSeries3~t334~tzrio~r~nSeries4~t997~trqet~r~nSeries1~t899~tzfbl~r~nSeries2~t669~tjiem~r~nSeries3~t748~tfzbh~r~nSeries4~t822~tfnwy~r~nSeries1~t508~tmxxg~r~nSeries2~t993~tpylr~r~nSeries3~t782~txglm~r~nSeries4~t865~tbiyl~r~nSeries1~t634~thcwh~r~nSeries2~t402~tsyoy~r~nSeries3~t897~tgmgo~r~nSeries4~t530~tprza~r~nSeries1~t471~tqmom~r~nSeries2~t588~tyhga~r~nSeries3~t893~tiupj~r~nSeries4~t916~tbzxt~r~nSeries1~t339~ttopo~r~nSeries2~t841~tmitn~r~nSeries3~t958~twtoe~r~nSeries4~t647~tonxw~r~nSeries1~t656~tghut~r~nSeries2~t507~tfklg~r~nSeries3~t616~tlrnu~r~nSeries4~t415~tkmsy~r~nSeries1~t830~tcpui~r~nSeries2~t904~tahqa~r~nSeries3~t617~tmsck~r~nSeries4~t834~taalk~r~nSeries1~t439~tcsnx~r~nSeries2~t302~tcovt~r~nSeries3~t700~tkrxa~r~nSeries4~t330~tzadj~r~nSeries1~t331~twxqm~r~nSeries2~t861~tdhld~r~nSeries3~t744~ttxsk~r~nSeries4~t724~txtez~r~nSeries1~t402~tjsqt~r~nSeries2~t996~tbccf~r~nSeries3~t800~tmwhb~r~nSeries4~t836~tssii~r~nSeries1~t402~tvijs~r~nSeries2~t521~txiic~r~nSeries3~t967~tahmk~r~nSeries4~t861~tywtt~r~nSeries1~t440~tzppk~r~nSeries2~t615~tlbmj~r~nSeries3~t882~thtpu~r~nSeries4~t371~tiebp~r~nSeries1~t784~tbmue~r~nSeries2~t460~tyrhl~r~nSeries3~t712~thxwg~r~nSeries4~t326~tprwv~r~nSeries1~t652~tshzy~r~nSeries2~t796~tvqye~r~nSeries3~t311~tztoz~r~nSeries4~t634~tabna~r~nSeries1~t704~thrrb~r~nSeries2~t540~tdndo~r~nSeries3~t928~txeui~r~nSeries4~t576~tzioi~r~nSeries1~t435~tozxq~r~nSeries2~t325~tihwa~r~nSeries3~t826~troqr~r~nSeries4~t325~tqwcv~r~nSeries1~t527~txzip~r~nSeries2~t560~tdiis~r~nSeries3~t878~tqnzo~r~nSeries4~t419~tcwva~r~n ')
			rte_1.Paste()
			li_rtn = rte_1.Print(2,'1,2-4',true,false)
			ls_result += wf_result_add(ls_item, "6. arg 2, 2-4, true, false ", not isnull(li_rtn) and li_rtn = 1 )
			
			// Print,copies=2,Pagerange="",collate=false,Canceldialog=true
			li_rtn = 0 
			rte_1.SelectTextAll(Detail!)
			rte_1.Clear()
			ClipBoard('Series1~t452~tnbec~r~nSeries2~t845~tbcjp~r~nSeries3~t514~tyjli~r~nSeries4~t436~titll~r~nSeries1~t756~tlxel~r~nSeries2~t431~tdkex~r~nSeries3~t941~ttquv~r~nSeries4~t853~tttey~r~nSeries1~t632~ttlql~r~nSeries2~t711~tbbvo~r~nSeries3~t608~tozky~r~nSeries4~t358~tayyr~r~nSeries1~t303~taqmy~r~nSeries2~t581~thzxn~r~nSeries3~t749~tsiyf~r~nSeries4~t542~texwb~r~nSeries1~t433~toewq~r~nSeries2~t696~tqrtc~r~nSeries3~t344~tlpqm~r~nSeries4~t416~tjifv~r~nSeries1~t728~tymkg~r~nSeries2~t869~ttzjm~r~nSeries3~t749~tzqtm~r~nSeries4~t707~tpnde~r~nSeries1~t808~tnmth~r~nSeries2~t963~titss~r~nSeries3~t619~taqnj~r~nSeries4~t892~tdoyj~r~nSeries1~t491~tpyat~r~nSeries2~t320~tleyq~r~nSeries3~t771~tvkpa~r~nSeries4~t541~tsvbm~r~nSeries1~t593~txrll~r~nSeries2~t336~tvfed~r~nSeries3~t608~tjiga~r~nSeries4~t379~tyxjv~r~nSeries1~t500~tqvrb~r~nSeries2~t537~tcuig~r~nSeries3~t746~tipyh~r~nSeries4~t565~tbxip~r~nSeries1~t990~tzncw~r~nSeries2~t636~trbli~r~nSeries3~t929~tizxo~r~nSeries4~t742~tptqq~r~nSeries1~t815~teaaf~r~nSeries2~t324~teqio~r~nSeries3~t888~tpyfa~r~nSeries4~t414~tuqmv~r~nSeries1~t975~txkmn~r~nSeries2~t375~tmsya~r~nSeries3~t822~tptlz~r~nSeries4~t876~tnotl~r~nSeries1~t310~tlwuh~r~nSeries2~t744~tfqjr~r~nSeries3~t798~twbwh~r~nSeries4~t368~tqhzk~r~nSeries1~t861~tdkcr~r~nSeries2~t974~tvbei~r~nSeries3~t593~tipvf~r~nSeries4~t740~tpzhy~r~nSeries1~t336~tjabt~r~nSeries2~t562~twwtb~r~nSeries3~t648~tdogk~r~nSeries4~t657~tmhib~r~nSeries1~t635~txrnx~r~nSeries2~t955~txrzl~r~nSeries3~t501~ttbqe~r~nSeries4~t358~tkrqo~r~nSeries1~t495~terna~r~nSeries2~t384~tlqyj~r~nSeries3~t592~tqoub~r~nSeries4~t515~tjseb~r~nSeries1~t511~tlwnk~r~nSeries2~t515~tvloi~r~nSeries3~t689~tzfpi~r~nSeries4~t978~twycz~r~nSeries1~t492~twzzv~r~nSeries2~t881~twxot~r~nSeries3~t356~tkudk~r~nSeries4~t593~tedup~r~nSeries1~t429~tczlh~r~nSeries2~t950~tuskd~r~nSeries3~t735~tevdc~r~nSeries4~t704~tlbkl~r~nSeries1~t430~tjmpf~r~nSeries2~t900~tcyqt~r~nSeries3~t675~tcvvv~r~nSeries4~t374~trffv~r~nSeries1~t587~tekkq~r~nSeries2~t760~tcupr~r~nSeries3~t419~tjaut~r~nSeries4~t699~tuvcz~r~nSeries1~t692~ticth~r~nSeries2~t917~txsxc~r~nSeries3~t569~tprgd~r~nSeries4~t559~twxfa~r~nSeries1~t707~tgayr~r~nSeries2~t473~teicu~r~nSeries3~t812~tdiam~r~nSeries4~t945~ttkbx~r~nSeries1~t425~ttdir~r~nSeries2~t745~txgvz~r~nSeries3~t673~tmeyr~r~nSeries4~t611~tvfic~r~nSeries1~t699~tqniv~r~nSeries2~t630~tjzau~r~nSeries3~t784~tfdft~r~nSeries4~t451~tmops~r~nSeries1~t381~tgpug~r~nSeries2~t845~ttuhl~r~nSeries3~t817~tvspi~r~nSeries4~t914~tazrs~r~nSeries1~t592~tfszw~r~nSeries2~t952~tbqmu~r~nSeries3~t498~twmxc~r~nSeries4~t502~tbhum~r~nSeries1~t995~tgjqm~r~nSeries2~t877~tnkyr~r~nSeries3~t330~tnsjv~r~nSeries4~t980~tzxss~r~nSeries1~t616~txnjo~r~nSeries2~t566~tuyjn~r~nSeries3~t872~tuwrs~r~nSeries4~t608~txwqy~r~nSeries1~t794~txcsz~r~nSeries2~t946~toklw~r~nSeries3~t649~tdrlt~r~nSeries4~t870~tscie~r~nSeries1~t409~tpiwl~r~nSeries2~t628~tqige~r~nSeries3~t353~tjsqh~r~nSeries4~t310~tjlrg~r~nSeries1~t927~tmwan~r~nSeries2~t462~txrfn~r~nSeries3~t696~takzt~r~nSeries4~t917~tjhxa~r~nSeries1~t429~tnfqj~r~nSeries2~t309~txioh~r~nSeries3~t825~tjqrj~r~nSeries4~t350~thymd~r~nSeries1~t542~tvwge~r~nSeries2~t760~thjes~r~nSeries3~t826~thtiz~r~nSeries4~t666~tojlj~r~nSeries1~t613~tpmox~r~nSeries2~t941~tyuyo~r~nSeries3~t838~tqjkz~r~nSeries4~t755~tvjgk~r~nSeries1~t930~txkew~r~nSeries2~t414~tzhbj~r~nSeries3~t971~tuths~r~nSeries4~t483~toefj~r~nSeries1~t869~twwye~r~nSeries2~t381~tzluh~r~nSeries3~t756~tgabb~r~nSeries4~t906~tqrhc~r~nSeries1~t324~ttxmj~r~nSeries2~t590~tcaxx~r~nSeries3~t683~tufah~r~nSeries4~t593~tyayz~r~nSeries1~t899~thuhj~r~nSeries2~t980~tjsvo~r~nSeries3~t526~thtyd~r~nSeries4~t370~tpbsz~r~nSeries1~t628~tsbzi~r~nSeries2~t857~trvgq~r~nSeries3~t922~tlunw~r~nSeries4~t943~tcpir~r~nSeries1~t847~tfcbt~r~nSeries2~t563~teplk~r~nSeries3~t732~twfkh~r~nSeries4~t525~touoy~r~nSeries1~t963~trwmq~r~nSeries2~t485~tjahy~r~nSeries3~t550~tmfev~r~nSeries4~t867~tdcom~r~nSeries1~t872~tyhgd~r~nSeries2~t356~tlxuk~r~nSeries3~t314~tyzcp~r~nSeries4~t605~tskwg~r~nSeries1~t828~tulsu~r~nSeries2~t836~tkbse~r~nSeries3~t870~tjeis~r~nSeries4~t647~tsgce~r~nSeries1~t738~twapq~r~nSeries2~t836~tvlwi~r~nSeries3~t928~trovj~r~nSeries4~t853~tdzxx~r~nSeries1~t783~thqls~r~nSeries2~t675~tzihm~r~nSeries3~t334~tzrio~r~nSeries4~t997~trqet~r~nSeries1~t899~tzfbl~r~nSeries2~t669~tjiem~r~nSeries3~t748~tfzbh~r~nSeries4~t822~tfnwy~r~nSeries1~t508~tmxxg~r~nSeries2~t993~tpylr~r~nSeries3~t782~txglm~r~nSeries4~t865~tbiyl~r~nSeries1~t634~thcwh~r~nSeries2~t402~tsyoy~r~nSeries3~t897~tgmgo~r~nSeries4~t530~tprza~r~nSeries1~t471~tqmom~r~nSeries2~t588~tyhga~r~nSeries3~t893~tiupj~r~nSeries4~t916~tbzxt~r~nSeries1~t339~ttopo~r~nSeries2~t841~tmitn~r~nSeries3~t958~twtoe~r~nSeries4~t647~tonxw~r~nSeries1~t656~tghut~r~nSeries2~t507~tfklg~r~nSeries3~t616~tlrnu~r~nSeries4~t415~tkmsy~r~nSeries1~t830~tcpui~r~nSeries2~t904~tahqa~r~nSeries3~t617~tmsck~r~nSeries4~t834~taalk~r~nSeries1~t439~tcsnx~r~nSeries2~t302~tcovt~r~nSeries3~t700~tkrxa~r~nSeries4~t330~tzadj~r~nSeries1~t331~twxqm~r~nSeries2~t861~tdhld~r~nSeries3~t744~ttxsk~r~nSeries4~t724~txtez~r~nSeries1~t402~tjsqt~r~nSeries2~t996~tbccf~r~nSeries3~t800~tmwhb~r~nSeries4~t836~tssii~r~nSeries1~t402~tvijs~r~nSeries2~t521~txiic~r~nSeries3~t967~tahmk~r~nSeries4~t861~tywtt~r~nSeries1~t440~tzppk~r~nSeries2~t615~tlbmj~r~nSeries3~t882~thtpu~r~nSeries4~t371~tiebp~r~nSeries1~t784~tbmue~r~nSeries2~t460~tyrhl~r~nSeries3~t712~thxwg~r~nSeries4~t326~tprwv~r~nSeries1~t652~tshzy~r~nSeries2~t796~tvqye~r~nSeries3~t311~tztoz~r~nSeries4~t634~tabna~r~nSeries1~t704~thrrb~r~nSeries2~t540~tdndo~r~nSeries3~t928~txeui~r~nSeries4~t576~tzioi~r~nSeries1~t435~tozxq~r~nSeries2~t325~tihwa~r~nSeries3~t826~troqr~r~nSeries4~t325~tqwcv~r~nSeries1~t527~txzip~r~nSeries2~t560~tdiis~r~nSeries3~t878~tqnzo~r~nSeries4~t419~tcwva~r~n ')
			rte_1.Paste()
			li_rtn = rte_1.Print(2,'',false,true)
			ls_result += wf_result_add(ls_item, "7. arg 2, empty, false, true ", not isnull(li_rtn) and li_rtn = 1 )
			
			//Print,控件与DataStore共享数据
			li_rtn = 0 
			if not isvalid(lds_tmp) then
				lds_tmp = create datastore
				lds_tmp.dataobject = "rtdwfuncne_d03_grid"
			end if 
			lds_tmp.settransobject(sqlca)
			lds_tmp.retrieve()
			rte_1.DataSource(lds_tmp)
			li_rtn = rte_1.Print(1,'',false,true)
			ls_result += wf_result_add(ls_item, "8. share datastore data ", not isnull(li_rtn) and li_rtn = 1 )
			
		case lower("PrintEx")
			is_type = "Print Timer"
			yield()
			timer(1)
			
			setnull(lbn_flag)
			li_rtn = rte_1.PrintEx(lbn_flag)
			ls_result += wf_result_add(ls_item, "1. null ", isnull(li_rtn) )
			
			li_rtn = 0 
			li_rtn = rte_1.PrintEx(true)
			ls_result += wf_result_add(ls_item, "2. true ", not isnull(li_rtn) and li_rtn = 1 )
			
			li_rtn = 0 
			li_rtn = rte_1.PrintEx(false)
			ls_result += wf_result_add(ls_item, "3. false ", not isnull(li_rtn) and li_rtn = 1 )
			
		case lower("ReplaceText")
			//ReplaceText,参数为NULL
			SetNull(ls_temp)
			ll_tmp = rte_1.ReplaceText(ls_temp)
			ls_result += wf_result_add(ls_item, "1. null ", isnull(ll_tmp) )
			
			//ReplaceText,没有选中数据内容
			ll_tmp = 0 
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_Temp = "NoSelected"
			ll_tmp = rte_1.ReplaceText(ls_Temp)
			ls_result += wf_result_add(ls_item, "2. no Selected ", not isnull(ll_tmp) and ll_tmp = len(ls_Temp) )
			
			// ReplaceText,替换选中数据内容含图片及InputField
			ll_tmp = 0
			rte_1.InputFieldInsert('Appeonfield')
			rte_1.SelectTextAll()
			ls_Temp = "Replace all text and picture"
			ll_tmp = rte_1.ReplaceText(ls_Temp)
			ls_result += wf_result_add(ls_item, "3. Selected ", not isnull(ll_tmp) and ll_tmp = len(ls_Temp) )
			
			//ReplaceText,参数为特殊字符
			ll_tmp = 0
			rte_1.SelectText(1,1,0,0,Detail!)
			ls_Temp = "Include ~t Tab key and ~r~n Enter key"
			ll_tmp = rte_1.ReplaceText(ls_Temp)
			ls_result += wf_result_add(ls_item, "4. special character ", not isnull(ll_tmp) and ll_tmp = len(ls_Temp) )
			
			//ReplaceText,在Header区替换
			ll_tmp = 0
			rte_1.HeaderFooter = true
			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,10,0,Header!)
			ls_Temp = "Series1~t757~ttgrg~r~nSeries2~t478~tfnyy~r~nSeries3~t834~tkwwq~r~n "
			ll_tmp = rte_1.ReplaceText(ls_Temp)
			ls_result += wf_result_add(ls_item, "5. Header ", not isnull(ll_tmp) and ll_tmp = len(ls_Temp) )
			
			// ReplaceText,在Footer区替换
//			rte_1.HeaderFooter = true
//			rte_1.ShowHeadFoot(true)
			rte_1.SelectText(1,1,10,0,Footer!)
			ls_Temp = "Series1~t757~ttgrg~r~nSeries2~t478~tfnyy~r~nSeries3~t834~tkwwq~r~n "
			ll_tmp = rte_1.ReplaceText(ls_Temp)
			ls_result += wf_result_add(ls_item, "6. Footer ", not isnull(ll_tmp) and ll_tmp = len(ls_Temp) )
			
			rte_1.ShowHeadFoot(false)
			rte_1.HeaderFooter=false			
		case lower("Resize")
			rte_1.SelectTextAll (detail! )
			rte_1.Clear( )
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'
			rte_1.SelectText(1,1,0,0,detail!)
			Clipboard(ls_temp2)
			rte_1.paste()
			rte_1.SelectText(1,1,0,0)
			
			//Resize，width为NULL
			li_rtn = 0
			SetNull(ll_tmp)
			li_rtn = rte_1.Resize(ll_tmp,1316)
			ls_result += wf_result_add(ls_item, "1. width null ", isnull(li_rtn) )
			
			//Resize，Height为NULL
			li_rtn = 0
			SetNull(ll_tmp)
			li_rtn = rte_1.Resize(2624,ll_tmp)
			ls_result += wf_result_add(ls_item, "2. Height null ", isnull(li_rtn) )
			
			//Resize，参数值都有效
			li_rtn = 0
			li_rtn = rte_1.Resize(2900,1600)
			ls_result += wf_result_add(ls_item, "3. all valid ", not isnull(li_rtn) and li_rtn = 1 and rte_1.width = 2900 and rte_1.height = 1600  )
			
			//Resize
			li_rtn = 0
			li_rtn = rte_1.Resize(2624,1316)
			ls_result += wf_result_add(ls_item, "4. come back ", not isnull(li_rtn) and li_rtn = 1 )
			
		case lower("SaveDocument")
			
		case lower("Scroll")
		case lower("ScrollNextPage")
		case lower("ScrollNextRow")
		case lower("ScrollPriorPage")
		case lower("ScrollPriorRow")
		case lower("ScrollToRow")
		case lower("SelectedColumn")
		case lower("SelectedLength")
		case lower("SelectedLine")
		case lower("SelectedPage")
		case lower("SelectedStart")
		case lower("SelectedText")
		case lower("SelectText")
		case lower("SelectTextAll")
		case lower("SelectTextLine")
		case lower("SelectTextWord")
		case lower("SetAlignment")
		case lower("SetFocus")
		case lower("SetParagraphSetting")
		case lower("SetPosition")
		case lower("SetRedraw")
		case lower("SetSpacing")
		case lower("SetTextColor")
		case lower("SetTextStyle")
		case lower("Show")
		case lower("ShowHeadFoot")
		case lower("TextLine")
		case lower("TriggerEvent")
		case lower("TypeOf")
		case lower("Undo")		
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_richtext_control.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_5
this.Control[iCurrent+3]=this.cb_4
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.rte_1
end on

on w_richtext_control.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.rte_1)
end on

event ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"PUB_BMP_BT_EMP.bmp") then
	FileDelete(ls_filepath+"PUB_BMP_BT_EMP.bmp")
end if
 
ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"w_rtefunw06_rtf01.rtf") then
	FileDelete(ls_filepath+"w_rtefunw06_rtf01.rtf")
end if
 
ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"w_rtefunw06_rtf02_nohf.rtf") then
	FileDelete(ls_filepath+"w_rtefunw06_rtf02_nohf.rtf")
end if

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"w_rtefunw06_rtfp19_douunline.rtf") then
	FileDelete(ls_filepath+"w_rtefunw06_rtfp19_douunline.rtf")
end if

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"w_rtefunw06_rtfp18_draw.rtf") then
	FileDelete(ls_filepath+"w_rtefunw06_rtfp18_draw.rtf")
end if

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"w_rtefunw06_rtfp17_table.rtf") then
	FileDelete(ls_filepath+"w_rtefunw06_rtfp17_table.rtf")
end if

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"w_rtefunw06_txt01.txt") then
	FileDelete(ls_filepath+"w_rtefunw06_txt01.txt")
end if

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"w_rtefunw06_dat01.dat") then
	FileDelete(ls_filepath+"w_rtefunw06_dat01.dat")
end if

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"PUB_BMP_AJE.bmp") then
	FileDelete(ls_filepath+"PUB_BMP_AJE.bmp")
end if

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"PUB_BMP_APB.bmp") then
	FileDelete(ls_filepath+"PUB_BMP_APB.bmp")
end if

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"start.png") then
	FileDelete(ls_filepath+"start.png")
end if

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"Bridge.jpg") then
	FileDelete(ls_filepath+"Bridge.jpg")
end if

end event

event ue_init_data;call super::ue_init_data;rte_1.x  = 581
rte_1.y = 40
rte_1.width = 2624
rte_1.height = 1316
end event

event timer;call super::timer;if lower(is_type) = lower("Print Timer") then 
	wf_closepopwindow( "Save the file as", 'Cancel')
	wf_closepopwindow( "Save Print Output As", 'Cancel')			//for win10 print machine
	wf_closepopwindow( "Print to File", 'Cancel')
	wf_closepopwindow( "Print", 'Cancel')
end if 
end event

type dw_1 from datawindow within w_richtext_control
integer x = 96
integer y = 1048
integer width = 411
integer height = 248
integer taborder = 70
string title = "none"
string dataobject = "rtdwfuncne_d03_grid"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type cb_5 from commandbutton within w_richtext_control
integer x = 73
integer y = 700
integer width = 457
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "document"
end type

event clicked;//DocumentName
end event

type cb_4 from commandbutton within w_richtext_control
integer x = 73
integer y = 548
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "inputfield"
end type

event clicked;//ls_array[Upperbound(ls_array) + 1 ] = "InputFieldBackColor"
//ls_array[Upperbound(ls_array) + 1 ] = "InputFieldNamesVisible"
//ls_array[Upperbound(ls_array) + 1 ] = "InputFieldsVisible"
end event

type cb_3 from commandbutton within w_richtext_control
integer x = 73
integer y = 396
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "function"
end type

type cb_2 from commandbutton within w_richtext_control
integer x = 73
integer y = 244
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "event"
end type

type cb_1 from commandbutton within w_richtext_control
integer x = 73
integer y = 92
integer width = 457
integer height = 132
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

type rte_1 from richtextedit within w_richtext_control
integer x = 581
integer y = 40
integer width = 2601
integer height = 1480
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean border = false
borderstyle borderstyle = stylelowered!
boolean resizable = true
end type

event constructor;is_log += " Constructor event is trigger."
end event

event destructor;is_log += " Destructor event is trigger."
end event

event doubleclicked;is_log += " Doubleclicked event is trigger."
end event

event dragdrop;is_log += " Dragdrop event is trigger."
end event

event dragenter;is_log += " Dragenter event is trigger."
end event

event dragleave;is_log += " Dragleave event is trigger."
end event

event dragwithin;is_log += " Dragwithin event is trigger."
end event

event getfocus;is_log += " Getfocus event is trigger."
end event

event fileexists;is_log += " Fileexists event is trigger. fileexists = "+string(filename)
end event

event help;is_log += " Help event is trigger. xpos= "+string(xpos)+" ypos="+string(ypos)
end event

event inputfieldselected;is_log += " Inputfieldselected event is trigger. fieldname= "+string(fieldname)
end event

event key;is_log += " Key event is trigger. key ="+string(key) +" keyflags = "+string(keyflags)
end event

event losefocus;is_log += " Losefocus event is trigger."
end event

event modified;is_log += " Modified event is trigger."
end event

event mousedown;is_log += " Mousedown event is trigger."
end event

event mousemove;is_log += " Mousemove event is trigger."
end event

event mouseup;is_log += " Mouseup event is trigger."
end event

event other;is_log += " Other event is trigger."
end event

event pictureselected;is_log += " Pictureselected event is trigger."
end event

event rbuttondown;is_log += " Rbuttondown event is trigger."
end event

event rbuttonup;is_log += " Rbuttonup event is trigger."
end event

