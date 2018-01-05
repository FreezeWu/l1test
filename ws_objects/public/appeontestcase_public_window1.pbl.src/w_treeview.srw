$PBExportHeader$w_treeview.srw
forward
global type w_treeview from w_base_case
end type
type cb_1 from commandbutton within w_treeview
end type
type cbx_2 from checkbox within w_treeview
end type
type cbx_1 from checkbox within w_treeview
end type
type cb_5 from commandbutton within w_treeview
end type
type cb_4 from commandbutton within w_treeview
end type
type tv_test from treeview within w_treeview
end type
end forward

global type w_treeview from w_base_case
cb_1 cb_1
cbx_2 cbx_2
cbx_1 cbx_1
cb_5 cb_5
cb_4 cb_4
tv_test tv_test
end type
global w_treeview w_treeview

type variables
integer ii_index
end variables

forward prototypes
public subroutine wf_reset ()
public subroutine wf_initial ()
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine wf_tvitem ()
end prototypes

public subroutine wf_reset ();//
long tvi_hdl = 0,li_count
tv_test.Visible = TRUE
tv_test.Enabled = TRUE
DO UNTIL tv_test.FindItem(RootTreeItem!, 0) = -1
   tv_test.DeleteItem(tvi_hdl)
LOOP


tv_test.TextSize = -10	
tv_test.TextColor = Rgb(0,0,0)
tv_test.BackColor = Rgb(255,255,255)
tv_test.Italic = FALSE
tv_test.FaceName = "Arial"
tv_test.border = true
tv_test.checkboxes = false
tv_test.deleteitems = false
tv_test.editlabels = false
tv_test.hasbuttons = true
tv_test.haslines = true
tv_test.tag = ""
tv_test.Weight = 400
tv_test.borderstyle=StyleLowered!
tv_test.UnderLine = FALSE
//tv_test.X=110
//tv_test.Y=64
//tv_test.Width=1143
//tv_test.Height=320
tv_test.LinesATroot=true


tv_test.BringToTop=true
tv_test.FontCharSet=ansi!
tv_test.FontFamily=swiss!
tv_test.FontPitch=variable!
tv_test.HideSelection=False


tv_test.picturename[1] = "BrowseClasses!"
tv_test.picturename[2] = "Browse!"
tv_test.picturename[3] = "BrowseObject!"
tv_test.picturename[4] = "CreateRuntime!"
tv_test.picturename[5] = "Continue!"
tv_test.picturename[6] = "Start!"

tv_test.statepicturename[1] = "BrowseClasses!"
tv_test.statepicturename[2] = "Browse!"
tv_test.statepicturename[3] = "BrowseObject!"
tv_test.statepicturename[4] = "CreateRuntime!"
tv_test.statepicturename[5] = "Continue!"
tv_test.statepicturename[6] = "Start!"

tv_test.deletepictures()
tv_test.addpicture("BrowseClasses!")
tv_test.addpicture("Browse!")
tv_test.addpicture("BrowseObject!")
tv_test.addpicture("CreateRuntime!")
tv_test.addpicture("Continue!")
tv_test.addpicture("Start!")

tv_test.DeleteStatePictures()
tv_test.addStatePicture("BrowseClasses!")
tv_test.addStatePicture("Browse!")
tv_test.addStatePicture("BrowseObject!")
tv_test.addStatePicture("CreateRuntime!")
tv_test.addStatePicture("Continue!")
tv_test.addStatePicture("Start!")

//li_count=tv_test.InsertItemLast(0,'Web Library',1)
//tv_test.InsertItemLast(li_count,'Controls',2)
//tv_test.InsertItemLast(li_count,'Global Function',3)
//tv_test.InsertItemLast(0,'Appeon Server',2)
//tv_test.InsertItemLast(0,'Appeon Developer',3)
//tv_test.InsertItemLast(0,'Appeon AEM',4)
treeviewitem tv_item


//tv_test.InsertItemLast(0,'Web Library',1)
//tv_test.InsertItemLast(1,'Controls',2)
//tv_test.InsertItemLast(1,'Global Function',3)
//tv_test.InsertItemLast(0,'Appeon Server',4)
//tv_test.InsertItemLast(0,'Appeon Developer',5)
//tv_test.InsertItemLast(0,'Appeon AEM',6)
tv_item.pictureindex = 1
tv_item.selectedpictureindex = 1
tv_item.label = 'Web Library'
tv_item.statepictureindex = 1
li_count = tv_test.InsertItemLast(0,tv_item)

tv_item.pictureindex = 2
tv_item.selectedpictureindex = 2
tv_item.label = 'Controls'
tv_item.statepictureindex = 2
tv_test.InsertItemLast(li_count,tv_item)

tv_item.pictureindex = 3
tv_item.selectedpictureindex = 3
tv_item.label = 'Global Function'
tv_item.statepictureindex = 3
tv_test.InsertItemLast(li_count,tv_item)

tv_item.pictureindex = 4
tv_item.selectedpictureindex = 4
tv_item.label = 'Appeon Server'
tv_item.statepictureindex = 4
tv_test.InsertItemLast(0,tv_item)

tv_item.pictureindex = 5
tv_item.selectedpictureindex = 5
tv_item.label = 'Appeon Developer'
tv_item.statepictureindex = 5
tv_test.InsertItemLast(0,tv_item)

tv_item.pictureindex = 6
tv_item.selectedpictureindex = 6
tv_item.label = 'Appeon AEM'
tv_item.statepictureindex = 6
li_count = tv_test.InsertItemLast(0,tv_item)
tv_test.expanditem(1)


tv_test.expanditem(li_count)
ii_index = li_count







end subroutine

public subroutine wf_initial ();//
treeviewitem  ltrv_1,ltrv_2
long ll_handle,ll_parent
string ls_output
boolean lb_child
ll_handle = tv_test.finditem(currenttreeitem!,0)

if ll_handle = 0 then return 
tv_test.getitem(ll_handle,ltrv_1)
ltrv_1.expandedonce = false
ltrv_1.expanded = false
if ltrv_1.children = true then
	lb_child = true
end if
ltrv_1.children = false
tv_test.collapseitem( ll_handle)
tv_test.setitem( ll_handle, ltrv_1)

if cbx_2.checked and lb_child then
	ltrv_1.children = true
	tv_test.setitem( ll_handle, ltrv_1)
end if



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
string 		ls_file, ls_fullname, ls_data
integer 		li_rtn, li_col
boolean		lbn_flag ,lbn_rtn
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
ls_array[Upperbound(ls_array) + 1 ] = "BackColor"
ls_array[Upperbound(ls_array) + 1 ] = "Border"
ls_array[Upperbound(ls_array) + 1 ] = "BorderStyle"
ls_array[Upperbound(ls_array) + 1 ] = "DeleteItems"
ls_array[Upperbound(ls_array) + 1 ] = "Enabled"
ls_array[Upperbound(ls_array) + 1 ] = "FaceName"
ls_array[Upperbound(ls_array) + 1 ] = "HasButtons"
ls_array[Upperbound(ls_array) + 1 ] = "HasLines"
ls_array[Upperbound(ls_array) + 1 ] = "Height"
ls_array[Upperbound(ls_array) + 1 ] = "Width"
ls_array[Upperbound(ls_array) + 1 ] = "Italic"
ls_array[Upperbound(ls_array) + 1 ] = "LinesAtRoot"
ls_array[Upperbound(ls_array) + 1 ] = "Tag"
ls_array[Upperbound(ls_array) + 1 ] = "TextColor"
ls_array[Upperbound(ls_array) + 1 ] = "TextSize"
ls_array[Upperbound(ls_array) + 1 ] = "Underline"
ls_array[Upperbound(ls_array) + 1 ] = "Visible"
ls_array[Upperbound(ls_array) + 1 ] = "Weight"
ls_array[Upperbound(ls_array) + 1 ] = "Width"
ls_array[Upperbound(ls_array) + 1 ] = "X"
ls_array[Upperbound(ls_array) + 1 ] = "Y"
ls_array[Upperbound(ls_array) + 1 ] = "BringToTop"
ls_array[Upperbound(ls_array) + 1 ] = "CheckBoxes"
ls_array[Upperbound(ls_array) + 1 ] = "EditLabels"
ls_array[Upperbound(ls_array) + 1 ] = "SortType"
ls_array[Upperbound(ls_array) + 1 ] = "StatePictureHeight"
ls_array[Upperbound(ls_array) + 1 ] = "PictureName[]"
ls_array[Upperbound(ls_array) + 1 ] = "StatePictureName[]"
ls_array[Upperbound(ls_array) + 1 ] = "StatePictureWidth"
ls_array[Upperbound(ls_array) + 1 ] = "TabOrder"
ls_array[Upperbound(ls_array) + 1 ] = "ToolTips"
ls_array[Upperbound(ls_array) + 1 ] = "TrackSelect"
ls_array[Upperbound(ls_array) + 1 ] = "FullRowSelect"
ls_array[Upperbound(ls_array) + 1 ] = "Pointer"
ls_array[Upperbound(ls_array) + 1 ] = "FontCharSet"
ls_array[Upperbound(ls_array) + 1 ] = "FontFamily"
ls_array[Upperbound(ls_array) + 1 ] = "FontPitch"
ls_array[Upperbound(ls_array) + 1 ] = "HideSelection"
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
			//	ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
		case lower("BackColor")
			//set to -3
			tv_test.BackColor= -3
			if -3 = tv_test.BackColor then
				ls_result += wf_result_add(ls_item, " set to -3 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to -3 ", false)
			end if
			
			//set to 0
			tv_test.BackColor= 0
			if 0 = tv_test.BackColor then
				ls_result += wf_result_add(ls_item, " set to 0 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to 0 ", false)
			end if
			//set to 256
			tv_test.BackColor= 256
			if 256 = tv_test.BackColor then
				ls_result += wf_result_add(ls_item, " set to 256 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to 256 ", false)
			end if
			//set to 1024
			tv_test.BackColor= 1024
			if 1024 = tv_test.BackColor then
				ls_result += wf_result_add(ls_item, " set to 1024 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to 1024 ", false)
			end if
			//set to 16777215
			tv_test.BackColor= 16777215
			if 16777215 = tv_test.BackColor then
				ls_result += wf_result_add(ls_item, " set to 16777215 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to 16777215 ", false)
			end if

		case lower("Border")	
			//get original true
			lbn_rtn = tv_test.Border
			ls_result += wf_result_add(ls_item, " get original true ", lbn_rtn)
			
			//set to false
			tv_test.Border = false
			lbn_rtn = tv_test.Border
			ls_result += wf_result_add(ls_item, " set to false ", not lbn_rtn)
			
			//set to true
			tv_test.Border = true
			lbn_rtn = tv_test.Border
			ls_result += wf_result_add(ls_item, " set to true ", lbn_rtn)
			
		case lower("BorderStyle")
			//get original StyleLowered!
			if StyleLowered! = tv_test.BorderStyle then
				ls_result += wf_result_add(ls_item, " get original StyleLowered! ", true)
			else
				ls_result += wf_result_add(ls_item, " get original StyleLowered! ", false)
			end if
			//set to StyleRaised!
			tv_test.BorderStyle= StyleRaised!
			if StyleRaised! = tv_test.BorderStyle then
				ls_result += wf_result_add(ls_item, " set to StyleRaised! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to StyleRaised! ", false)
			end if
			//set to StyleBox!
			tv_test.BorderStyle= StyleBox!
			if StyleBox! = tv_test.BorderStyle then
				ls_result += wf_result_add(ls_item, " set to StyleBox! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to StyleBox! ", false)
			end if
			//set to StyleShadowBox!
			tv_test.BorderStyle= StyleShadowBox!
			if StyleShadowBox! = tv_test.BorderStyle then
				ls_result += wf_result_add(ls_item, " set to  StyleShadowBox! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to  StyleShadowBox! ", false)
			end if
			//set to StyleLowered!
			tv_test.BorderStyle= StyleLowered!
			if StyleLowered! = tv_test.BorderStyle then
				ls_result += wf_result_add(ls_item, " set to StyleLowered! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to StyleLowered! ", false)
			end if
			
		case lower("DeleteItems")
			//get original false
			lbn_rtn = tv_test.DeleteItems
			ls_result += wf_result_add(ls_item, " get original true ", not lbn_rtn)
			
			//set to true
			tv_test.DeleteItems = true
			lbn_rtn = tv_test.DeleteItems
			ls_result += wf_result_add(ls_item, " set to false ", lbn_rtn)
			
			//set to false
			tv_test.DeleteItems = false
			lbn_rtn = tv_test.DeleteItems
			ls_result += wf_result_add(ls_item, " set to true ", not lbn_rtn)
			
		case lower("Enabled")
			//get original true
			lbn_rtn = tv_test.Enabled
			ls_result += wf_result_add(ls_item, " get original true ", lbn_rtn)
			
			//set to false
			tv_test.Enabled = false
			lbn_rtn = tv_test.Enabled
			ls_result += wf_result_add(ls_item, " set to false ", not lbn_rtn)
			
			//set to true
			tv_test.Enabled = true
			lbn_rtn = tv_test.Enabled
			ls_result += wf_result_add(ls_item, " set to true ", lbn_rtn)
			
		case lower("FaceName")
			//get original Arial
			
			if "Arial" = tv_test.FaceName then
				ls_result += wf_result_add(ls_item, " get original Arial ", true)
			else
				ls_result += wf_result_add(ls_item, " get original Arial ", false)
			end if
			
			//set to Courier
			tv_test.FaceName= "Courier"
			if "Courier" = tv_test.FaceName then
				ls_result += wf_result_add(ls_item, " set to Courier ", true)
			else
				ls_result += wf_result_add(ls_item, " set to Courier ", false)
			end if
			//set to Fixedsys
			tv_test.FaceName= "Fixedsys"
			if "Fixedsys" = tv_test.FaceName then
				ls_result += wf_result_add(ls_item, " set to Fixedsys ", true)
			else
				ls_result += wf_result_add(ls_item, " set to Fixedsys ", false)
			end if
			//set to Arial
			tv_test.FaceName= "Arial"
			if "Arial" = tv_test.FaceName then
				ls_result += wf_result_add(ls_item, " set to Arial ", true)
			else
				ls_result += wf_result_add(ls_item, " set to Arial ", false)
			end if
			
		case lower("HasButtons")	
			//get original true
			lbn_rtn = tv_test.HasButtons
			ls_result += wf_result_add(ls_item, " get original true ", lbn_rtn)
			
			//set to false
			tv_test.HasButtons = false
			lbn_rtn = tv_test.HasButtons
			ls_result += wf_result_add(ls_item, " set to false ", not lbn_rtn)
			
			//set to true
			tv_test.HasButtons = true
			lbn_rtn = tv_test.HasButtons
			ls_result += wf_result_add(ls_item, " set to true ", lbn_rtn)
			
		case lower("HasLines")
			//get original true
			lbn_rtn = tv_test.HasLines
			ls_result += wf_result_add(ls_item, " get original true ", lbn_rtn)
			
			//set to false
			tv_test.HasLines = false
			lbn_rtn = tv_test.HasLines
			ls_result += wf_result_add(ls_item, " set to false ", not lbn_rtn)
			
			//set to true
			tv_test.HasLines = true
			lbn_rtn = tv_test.HasLines
			ls_result += wf_result_add(ls_item, " set to true ", lbn_rtn)
			
		case lower("Height")
			//get original 768
			ls_result += wf_result_add(ls_item, 'tv_test.Height = ' + string(tv_test.Height), true)

			//set to 100
			tv_test.Height = 100
			ls_result += wf_result_add(ls_item, 'set to 100, tv_test.Height = ' + string(tv_test.Height), true)
			//set to 2000
			tv_test.Height = 2000
			ls_result += wf_result_add(ls_item, 'set to 2000 tv_test.Height = ' + string(tv_test.Height), true)
			//set to 768
			tv_test.Height = 768
			ls_result += wf_result_add(ls_item,'set to 768 tv_test.Height = ' + string(tv_test.Height), true)
			
		case lower("Width")
			//get original 1225
			ls_result += wf_result_add(ls_item, 'tv_test.Width = ' + string(tv_test.Width), true)
			//set to 100
			tv_test.Width = 100
			ls_result += wf_result_add(ls_item, 'set to 100, tv_test.Width = ' + string(tv_test.Width), true)
			//set to 20000
			tv_test.Width = 20000
			ls_result += wf_result_add(ls_item, 'set to 20000, tv_test.Width = ' + string(tv_test.Width), true)
			
			//set to 1225
			tv_test.Width = 1225
			ls_result += wf_result_add(ls_item, 'set to 1225, tv_test.Width = ' + string(tv_test.Width), true)
			
		case lower("Italic")
			//get original false
			lbn_rtn = tv_test.Italic
			ls_result += wf_result_add(ls_item, " get original true ", not lbn_rtn)
			
			//set to true
			tv_test.Italic = true
			lbn_rtn = tv_test.Italic
			ls_result += wf_result_add(ls_item, " set to false ", lbn_rtn)
			
			//set to false
			tv_test.Italic = false
			lbn_rtn = tv_test.Italic
			ls_result += wf_result_add(ls_item, " set to true ", not lbn_rtn)
			
		case lower("LinesAtRoot")
			//get original true
			lbn_rtn = tv_test.LinesAtRoot
			ls_result += wf_result_add(ls_item, " get original true ", lbn_rtn)
			
			//set to false
			tv_test.LinesAtRoot = false
			lbn_rtn = tv_test.LinesAtRoot
			ls_result += wf_result_add(ls_item, " set to false ", not lbn_rtn)
			
			//set to true
			tv_test.LinesAtRoot = true
			lbn_rtn = tv_test.LinesAtRoot
			ls_result += wf_result_add(ls_item, " set to true ", lbn_rtn)
			
		case lower("Tag")	
			//set to BCDEF
			tv_test.Tag= "BCDEF"
			if "BCDEF" = tv_test.Tag then
				ls_result += wf_result_add(ls_item, " set to BCDEF ", true)
			else
				ls_result += wf_result_add(ls_item, " set to BCDEF ", false)
			end if
			
		case lower("TextColor")
			//set to -3
			tv_test.TextColor = -3
			if -3 = tv_test.TextColor then
				ls_result += wf_result_add(ls_item, " set to -3 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to -3 ", false)
			end if
			//set to 0
			tv_test.TextColor = 0
			if 0 = tv_test.TextColor then
				ls_result += wf_result_add(ls_item, " set to 0 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to 0 ", false)
			end if
			//set to 256
			tv_test.TextColor = 256
			if 256 = tv_test.TextColor then
				ls_result += wf_result_add(ls_item, " set to 256 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to 256 ", false)
			end if
			//set to 1024
			tv_test.TextColor = 1024
			if 1024 = tv_test.TextColor then
				ls_result += wf_result_add(ls_item, " set to 1024 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to 1024 ", false)
			end if
			//set to 16777215
			tv_test.TextColor = 16777215
			if 16777215 = tv_test.TextColor then
				ls_result += wf_result_add(ls_item, " set to 16777215 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to 16777215 ", false)
			end if
			
		case lower("TextSize")
			//get original 10
			ls_result += wf_result_add(ls_item, "tv_test.TextSize = "+string(tv_test.TextSize), true)
			
			//set to 0
			tv_test.TextSize = 0
			ls_result += wf_result_add(ls_item, " set to 0, tv_test.TextSize = "+ string(tv_test.TextSize), true)
			//set to 4
			tv_test.TextSize = 4
			ls_result += wf_result_add(ls_item, " set to 4, tv_test.TextSize = "+string(tv_test.TextSize), true)
			//set to 22
			tv_test.TextSize = 22
			ls_result += wf_result_add(ls_item, " set to 22, tv_test.TextSize = "+ string(tv_test.TextSize), true)
			//set to 70
			tv_test.TextSize = 70
			ls_result += wf_result_add(ls_item, " set to 70, tv_test.TextSize = "+string(tv_test.TextSize), true)
			
		case lower("Underline")
			//get original false
			lbn_rtn = tv_test.Underline
			ls_result += wf_result_add(ls_item, " get original true ", not lbn_rtn)
			
			//set to true
			tv_test.Underline = true
			lbn_rtn = tv_test.Underline
			ls_result += wf_result_add(ls_item, " set to false ", lbn_rtn)
			
			//set to false
			tv_test.Underline = false
			lbn_rtn = tv_test.Underline
			ls_result += wf_result_add(ls_item, " set to true ", not lbn_rtn)
			
		case lower("Visible")
			//get original true
			lbn_rtn = tv_test.Visible
			ls_result += wf_result_add(ls_item, " get original true ", lbn_rtn)
			
			//set to false
			tv_test.Visible = false
			lbn_rtn = tv_test.Visible
			ls_result += wf_result_add(ls_item, " set to false ", not lbn_rtn)
			
			//set to true
			tv_test.Visible = true
			lbn_rtn = tv_test.Visible
			ls_result += wf_result_add(ls_item, " set to true ", lbn_rtn)
			
		case lower("Weight")
			//set to 400
			tv_test.Weight = 400
			ls_result += wf_result_add(ls_item, " set to 400,tv_test.Weight = " + string(tv_test.Weight), true)
			//set to 700
			ls_result += wf_result_add(ls_item, " set to 700,tv_test.Weight = " + string(tv_test.Weight), true)
			
		case lower("X")
			//get original 32
			ls_result += wf_result_add(ls_item, " tv_test.X =  "+string(tv_test.X), true)
			//set to 0
			tv_test.X = 0
			ls_result += wf_result_add(ls_item, " set to 0 ,tv_test.X =  "+string(tv_test.X), true)
			//set to 128
			tv_test.X = 128
			ls_result += wf_result_add(ls_item, " set to 128 ,tv_test.X =  "+string(tv_test.X), true)
			//set to 10000
			tv_test.X = 10000
			ls_result += wf_result_add(ls_item, " set to 10000 ,tv_test.X =  "+string(tv_test.X), true)
			//set to 32
			tv_test.X = 32
			ls_result += wf_result_add(ls_item, " set to 32 ,tv_test.X =  "+string(tv_test.X), true)
			
		case lower("Y")	
			//get original 8
			ls_result += wf_result_add(ls_item, " tv_test.Y =  "+string(tv_test.y), true)
			//set to 0
			tv_test.Y = 0
			ls_result += wf_result_add(ls_item, " set to 0 ,tv_test.Y =  "+string(tv_test.Y), true)
			//set to 128
			tv_test.Y = 128
			ls_result += wf_result_add(ls_item, " set to 128 ,tv_test.Y =  "+string(tv_test.Y), true)
			//set to 10000
			tv_test.Y = 10000
			ls_result += wf_result_add(ls_item, " set to 10000 ,tv_test.Y =  "+string(tv_test.Y), true)
			//set to 8
			tv_test.Y = 8
			ls_result += wf_result_add(ls_item, " set to 32 ,tv_test.Y =  "+string(tv_test.Y), true)
			
		case lower("BringToTop")
			//get original false
			lbn_rtn = tv_test.BringToTop
			ls_result += wf_result_add(ls_item, " get original true ", not lbn_rtn)
			
			//set to true
			tv_test.BringToTop = true
			lbn_rtn = tv_test.BringToTop
			ls_result += wf_result_add(ls_item, " set to false ", lbn_rtn)
			
			//set to false
			tv_test.BringToTop = false
			lbn_rtn = tv_test.BringToTop
			ls_result += wf_result_add(ls_item, " set to true ", not lbn_rtn)
			
			
		case lower("CheckBoxes")
			//get original false
			lbn_rtn = tv_test.CheckBoxes
			ls_result += wf_result_add(ls_item, " get original true ", not lbn_rtn)
			
			//set to true
			tv_test.CheckBoxes = true
			lbn_rtn = tv_test.CheckBoxes
			ls_result += wf_result_add(ls_item, " set to false ", lbn_rtn)
			
			//set to false
			tv_test.CheckBoxes = false
			lbn_rtn = tv_test.CheckBoxes
			ls_result += wf_result_add(ls_item, " set to true ", not lbn_rtn)
			
		case lower("EditLabels")
			//get original false
			lbn_rtn = tv_test.EditLabels
			ls_result += wf_result_add(ls_item, " get original true ", not lbn_rtn)
			
			//set to true
			tv_test.EditLabels = true
			lbn_rtn = tv_test.EditLabels
			ls_result += wf_result_add(ls_item, " set to false ", lbn_rtn)
			
			//set to false
			tv_test.EditLabels = false
			lbn_rtn = tv_test.EditLabels
			ls_result += wf_result_add(ls_item, " set to true ", not lbn_rtn)
			
		case lower("SortType")
			//set to Ascending!
			tv_test.SortType= Ascending!
			if Ascending! = tv_test.SortType then
				ls_result += wf_result_add(ls_item, " set to Ascending! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to Ascending! ", false)
			end if
			//set to Ascending!
			tv_test.SortType= Ascending!
			if Ascending! = tv_test.SortType then
				ls_result += wf_result_add(ls_item, " set to Ascending! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to Ascending! ", false)
			end if
			//set to Descending!
			tv_test.SortType= Descending!
			if Descending! = tv_test.SortType then
				ls_result += wf_result_add(ls_item, " set to Descending! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to Descending! ", false)
			end if
			//set to UserDefinedSort!
			tv_test.SortType= UserDefinedSort!
			if UserDefinedSort! = tv_test.SortType then
				ls_result += wf_result_add(ls_item, " set to UserDefinedSort! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to UserDefinedSort! ", false)
			end if
			
			//set to Unsorted!
			tv_test.SortType= Unsorted!
			if Unsorted! = tv_test.SortType then
				ls_result += wf_result_add(ls_item, " set to Unsorted! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to Unsorted! ", false)
			end if

		case lower("StatePictureHeight")
			tv_test.StatePictureHeight = 76
			if 76 = tv_test.StatePictureHeight then
				ls_result += wf_result_add(ls_item, " set to 76 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to 76 ", false)
			end if
		case lower("PictureName[]")
			//set to save.bmp
			tv_test.PictureName[1] = "save.bmp"
			if "save.bmp" = tv_test.PictureName[1] then
				ls_result += wf_result_add(ls_item, " set to save.bmp ", true)
			else
				ls_result += wf_result_add(ls_item, " set to save.bmp ", false)
			end if
			
		case lower("StatePictureName[]")
			//set to save.bmp
			tv_test.StatePictureName[1] = "save.bmp"
			if "save.bmp" = tv_test.StatePictureName[1] then
				ls_result += wf_result_add(ls_item, " set to save.bmp ", true)
			else
				ls_result += wf_result_add(ls_item, " set to save.bmp ", false)
			end if
			
		case lower("StatePictureWidth")
			tv_test.StatePictureWidth = 76
			if 76 = tv_test.StatePictureWidth then
				ls_result += wf_result_add(ls_item, " set to 76 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to 76 ", false)
			end if
		case lower("TabOrder")
			//set to -1
			tv_test.TabOrder = -1
			if -1 = tv_test.TabOrder then
				ls_result += wf_result_add(ls_item, " set to -1 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to -1 ", false)
			end if
			//set to 0
			tv_test.TabOrder = 0
			if 0 = tv_test.TabOrder then
				ls_result += wf_result_add(ls_item, " set to 0 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to 0 ", false)
			end if
			//set to 80
			tv_test.TabOrder = 80
			if 80 = tv_test.TabOrder then
				ls_result += wf_result_add(ls_item, " set to 80 ", true)
			else
				ls_result += wf_result_add(ls_item, " set to 80 ", false)
			end if
			
		case lower("ToolTips")
			//set to true
			tv_test.ToolTips = true
			lbn_rtn = tv_test.ToolTips
			ls_result += wf_result_add(ls_item, " set to true ", lbn_rtn)
			//set to false
			tv_test.ToolTips = false
			lbn_rtn = tv_test.ToolTips
			ls_result += wf_result_add(ls_item, " set to false ", not lbn_rtn)
			
		case lower("TrackSelect")
			//set to true
			tv_test.TrackSelect = true
			lbn_rtn = tv_test.TrackSelect
			ls_result += wf_result_add(ls_item, " set to true ", lbn_rtn)
			//set to false
			tv_test.TrackSelect = false
			lbn_rtn = tv_test.TrackSelect
			ls_result += wf_result_add(ls_item, " set to false ", not lbn_rtn)
		
		case lower("FullRowSelect")
			//get original false
			lbn_rtn = tv_test.FullRowSelect
			ls_result += wf_result_add(ls_item, " get original true ", not lbn_rtn)
			
			//set to true
			tv_test.FullRowSelect = true
			lbn_rtn = tv_test.FullRowSelect
			ls_result += wf_result_add(ls_item, " set to false ", lbn_rtn)
			
			//set to false
			tv_test.FullRowSelect = false
			lbn_rtn = tv_test.FullRowSelect
			ls_result += wf_result_add(ls_item, " set to true ", not lbn_rtn)
			
		case lower("Pointer")
			//get original AppStarting!
			if "AppStarting!" = tv_test.Pointer then
				ls_result += wf_result_add(ls_item, " get original AppStarting! ", true)
			else
				ls_result += wf_result_add(ls_item, " get original AppStarting! ", false)
			end if
			//set to Arrow!
			tv_test.Pointer = "Arrow"
			if "Arrow" = tv_test.Pointer then
				ls_result += wf_result_add(ls_item, " set to Arrow! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to Arrow! ", false)
			end if
			//set to Beam!
			tv_test.Pointer = "Beam"
			if "Beam" = tv_test.Pointer then
				ls_result += wf_result_add(ls_item, " set to Beam! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to Beam! ", false)
			end if
			//set to Cross!
			tv_test.Pointer = "Cross"
			if "Cross" = tv_test.Pointer then
				ls_result += wf_result_add(ls_item, " set to Cross! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to Cross! ", false)
			end if
			//set to HourGlass!
			tv_test.Pointer = "HourGlass"
			if "HourGlass" = tv_test.Pointer then
				ls_result += wf_result_add(ls_item, " set to HourGlass! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to HourGlass! ", false)
			end if
			//set to HyperLink!
			tv_test.Pointer = "HyperLink"
			if "HyperLink" = tv_test.Pointer then
				ls_result += wf_result_add(ls_item, " set to HyperLink! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to HyperLink! ", false)
			end if
			//set to Size!
			tv_test.Pointer = "Size"
			if "Size" = tv_test.Pointer then
				ls_result += wf_result_add(ls_item, " set to Size! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to Size! ", false)
			end if
			//set to SizeNESW!
			tv_test.Pointer = "SizeNESW"
			if "SizeNESW" = tv_test.Pointer then
				ls_result += wf_result_add(ls_item, " set to SizeNESW! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to SizeNESW! ", false)
			end if
			//set to SizeWE!
			tv_test.Pointer = "SizeWE"
			if "SizeWE" = tv_test.Pointer then
				ls_result += wf_result_add(ls_item, " set to SizeWE! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to SizeWE! ", false)
			end if
			//set to UPArrow!
			tv_test.Pointer = "UPArrow"
			if "UPArrow" = tv_test.Pointer then
				ls_result += wf_result_add(ls_item, " set to UPArrow! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to UPArrow! ", false)
			end if
			//set to SizeNS!
			tv_test.Pointer = "SizeNS"
			if "SizeNS" = tv_test.Pointer then
				ls_result += wf_result_add(ls_item, " set to SizeNS! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to SizeNS! ", false)
			end if
			
		case lower("FontCharSet")
			//get original ANSI!
			tv_test.FontCharSet = ANSI!
			if ANSI! = tv_test.FontCharSet then
				ls_result += wf_result_add(ls_item, " get original ANSI! ", true)
			else
				ls_result += wf_result_add(ls_item, " get original ANSI! ", false)
			end if
			//set to ChineseBig5!
			tv_test.FontCharSet = ChineseBig5!
			if ChineseBig5! = tv_test.FontCharSet then
				ls_result += wf_result_add(ls_item, " set to ChineseBig5! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to ChineseBig5! ", false)
			end if
			
		case lower("FontFamily")
			//get original swiss!
			tv_test.FontFamily = swiss!
			if swiss! = tv_test.FontFamily then
				ls_result += wf_result_add(ls_item, " get original swiss! ", true)
			else
				ls_result += wf_result_add(ls_item, " get original swiss! ", false)
			end if
			//set to AnyFont!
			tv_test.FontFamily = AnyFont!
			if AnyFont! = tv_test.FontFamily then
				ls_result += wf_result_add(ls_item, " set to AnyFont! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to AnyFont! ", false)
			end if
			
		case lower("FontPitch")
			//get original variable!
			tv_test.FontPitch = variable!
			if variable! = tv_test.FontPitch then
				ls_result += wf_result_add(ls_item, " get original variable! ", true)
			else
				ls_result += wf_result_add(ls_item, " get original variable! ", false)
			end if
			//set to Fixed!
			tv_test.FontPitch = Fixed!
			if Fixed! = tv_test.FontPitch then
				ls_result += wf_result_add(ls_item, " set to Fixed! ", true)
			else
				ls_result += wf_result_add(ls_item, " set to Fixed! ", false)
			end if
			
		case lower("HideSelection")
			//get original false
			lbn_rtn = tv_test.HideSelection
			ls_result += wf_result_add(ls_item, " get original true ", not lbn_rtn)
			
			//set to true
			tv_test.HideSelection = true
			lbn_rtn = tv_test.HideSelection
			ls_result += wf_result_add(ls_item, " set to false ", lbn_rtn)
			
			//set to false
			tv_test.HideSelection = false
			lbn_rtn = tv_test.HideSelection
			ls_result += wf_result_add(ls_item, " set to true ", not lbn_rtn)
		
			
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
boolean		lbn_flag ,lbn_rtn
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
ls_array[Upperbound(ls_array) + 1 ] = "AddPicture"
ls_array[Upperbound(ls_array) + 1 ] = "AddStatePicture"
ls_array[Upperbound(ls_array) + 1 ] = "ClassName"
ls_array[Upperbound(ls_array) + 1 ] = "CollapseItem"
ls_array[Upperbound(ls_array) + 1 ] = "DeleteItem"
ls_array[Upperbound(ls_array) + 1 ] = "DeletePicture"
ls_array[Upperbound(ls_array) + 1 ] = "DeleteStatePicture"
ls_array[Upperbound(ls_array) + 1 ] = "EditLabel"
ls_array[Upperbound(ls_array) + 1 ] = "ExpandAll"
ls_array[Upperbound(ls_array) + 1 ] = "ExpandItem"
ls_array[Upperbound(ls_array) + 1 ] = "FindItem"
ls_array[Upperbound(ls_array) + 1 ] = "GetItem"
ls_array[Upperbound(ls_array) + 1 ] = "GetParent"
ls_array[Upperbound(ls_array) + 1 ] = "Hide"
ls_array[Upperbound(ls_array) + 1 ] = "InsertItem"
ls_array[Upperbound(ls_array) + 1 ] = "InsertItemFirst"
ls_array[Upperbound(ls_array) + 1 ] = "InsertItemLast"
ls_array[Upperbound(ls_array) + 1 ] = "Move"
ls_array[Upperbound(ls_array) + 1 ] = "PostEvent"
ls_array[Upperbound(ls_array) + 1 ] = "Resize"
ls_array[Upperbound(ls_array) + 1 ] = "SelectItem"
ls_array[Upperbound(ls_array) + 1 ] = "SetOverlayPicture"
ls_array[Upperbound(ls_array) + 1 ] = "SetPosition"
ls_array[Upperbound(ls_array) + 1 ] = "Show"
ls_array[Upperbound(ls_array) + 1 ] = "TriggerEvent"
ls_array[Upperbound(ls_array) + 1 ] = "TypeOf"
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
		case lower("AddPicture")		
			wf_reset()
			li_rtn = tv_test.AddPicture("Blob!")
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 7)
			
		case lower("AddStatePicture")
			li_rtn = tv_test.AddStatePicture("Blob!")
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 7)
			
		case lower("ClassName")
			ls_temp = tv_test.ClassName()
			
			
		case lower("CollapseItem")
			ll_tmp = tv_test.finditem(roottreeitem!,0)
			li_rtn =tv_test.CollapseItem(ll_tmp)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("DeleteItem")	//return 1
			tv_test.ExpandAll( 1 )
			ll_tmp = tv_test.FindItem(RootTreeItem!,0)
			//ll_tmp = tv_test.FindItem( NextTreeItem!, 0)
			li_rtn = tv_test.DeleteItem( ll_tmp)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("DeletePicture")  	//return 1
			li_rtn = tv_test.DeletePicture(7)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("DeleteStatePicture")  //1
			li_rtn = tv_test.DeleteStatePicture(7)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			 
		case lower("EditLabel")   //1
			tv_test.EditLabels = true
			li_rtn = tv_test.EditLabel( ii_index)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("ExpandAll")    //1
			li_rtn = tv_test.ExpandAll( ii_index)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
		case lower("ExpandItem")    //1
			wf_reset()
			//tv_test.CollapseItem(0)
			ll_tmp = tv_test.finditem(roottreeitem!,0)
			li_rtn = tv_test.ExpandItem( ll_tmp)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("FindItem")   //handle
			wf_reset()
			li_rtn = tv_test.FindItem(RootTreeItem!,0)
			ls_result += wf_result_add(ls_item, " RootTreeItem ", not isnull(li_rtn) and li_rtn > 0)
			li_rtn = tv_test.FindItem(NextTreeItem!,li_rtn)
			ls_result += wf_result_add(ls_item, " NextTreeItem ", not isnull(li_rtn) and li_rtn > 0)
			li_rtn = tv_test.FindItem(PreviousTreeItem!,li_rtn)
			ls_result += wf_result_add(ls_item, " PreviousTreeItem ", not isnull(li_rtn) and li_rtn > 0)
			li_rtn = tv_test.FindItem(ChildTreeItem!,li_rtn)
			ls_result += wf_result_add(ls_item, " ChildTreeItem ", not isnull(li_rtn) and li_rtn > 0)
			li_rtn = tv_test.FindItem(ParentTreeItem!,li_rtn)
			ls_result += wf_result_add(ls_item, " ParentTreeItem ", not isnull(li_rtn) and li_rtn > 0)
			li_rtn = tv_test.FindItem(FirstVisibleTreeItem!,0)
			ls_result += wf_result_add(ls_item, " FirstVisibleTreeItem ", not isnull(li_rtn) and li_rtn > 0)
			li_rtn = tv_test.FindItem(NextVisibleTreeItem!,li_rtn)
			ls_result += wf_result_add(ls_item, " NextVisibleTreeItem ", not isnull(li_rtn) and li_rtn > 0)
			li_rtn = tv_test.FindItem(PreviousVisibleTreeItem!,li_rtn)
			ls_result += wf_result_add(ls_item, " PreviousVisibleTreeItem ", not isnull(li_rtn) and li_rtn > 0)
			li_rtn = tv_test.FindItem(CurrentTreeItem!,0)
			ls_result += wf_result_add(ls_item, " CurrentTreeItem ", not isnull(li_rtn) and li_rtn = -1)
			ll_tmp = tv_test.FindItem(RootTreeItem!,0)
			tv_test.setdrophighlight(ll_tmp)
			li_rtn = tv_test.FindItem(DropHighlightTreeItem!,ll_tmp)
			ls_result += wf_result_add(ls_item, " DropHighlightTreeItem ", not isnull(li_rtn) and li_rtn > 0)
			
			
		case lower("GetItem")         //1
			//tv_test.DeleteItem(0)
			integer li_count
			treeviewitem tv_item
			tv_item.pictureindex = 1
			tv_item.selectedpictureindex = 1
			tv_item.label = 'test treeviewitem'
			tv_item.statepictureindex = 1
			ll_tmp = tv_test.FindItem(RootTreeItem!,0)
			tv_test.setitem(ll_tmp, tv_item)
			li_rtn = tv_test.getitem(ll_tmp, tv_item)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
			
		case lower("GetParent")	    //PowerObject. Returns a reference to the parent of objectname. 
			PowerObject lpo_parent
			lpo_parent = tv_test.GetParent()
			ls_temp = lpo_parent.classname()
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp) and ls_temp = "w_treeview")
			
		case lower("Hide")        //1
			li_rtn = tv_test.Hide( )
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("InsertItem")      //handle
			wf_reset()
			//TreeView control when only the label and picture index need to be specified
			integer li_parent,li_leaf
			ll_tmp = tv_test.FindItem(RootTreeItem!,0)
			li_leaf= tv_test.FindItem(NextTreeItem! , ll_tmp)
			li_parent = ll_tmp
			li_rtn = tv_test.InsertItem( li_parent, li_leaf, "InsertItem", 1)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn > 0)
			
			
			//TreeView control when more than the label and picture index need to be specified
			treeviewitem tv_item1
			tv_item.pictureindex = 1
			tv_item.selectedpictureindex = 1
			tv_item.label = 'InsertTreeViewItem'
			tv_item.statepictureindex = 1
			li_rtn = tv_test.InsertItem( li_parent, li_leaf, tv_item1)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn > 0)
			
		case lower("InsertItemFirst")      //handle
			wf_reset()
			li_rtn = tv_test.InsertItemFirst(1,'InsertItemFirst',6)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn > 0)
			
		case lower("InsertItemLast")	    //handle
			li_rtn = tv_test.InsertItemLast(1,'InsertItemLast',2)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn > 0)
			
		case lower("Move")         //1
			li_rtn = tv_test.Move( 100, 200)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("PostEvent")       //true
			is_log = ""
			lbn_rtn = tv_test.PostEvent( "ue_tree")
			ls_result += wf_result_add(ls_item, " ", lbn_rtn)
			
		case lower("Resize")       //1
			li_rtn = tv_test.resize( 100, 100)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("SelectItem")	        //1 
			wf_reset()
			li_rtn = tv_test.SelectItem(ii_index)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("SetOverlayPicture")       //1  
			li_rtn = tv_test.SetOverlayPicture(1, 1)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("SetPosition")      //1
			li_rtn = tv_test.SetPosition( ToTop!,cb_1)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("Show")      //1
			li_rtn = tv_test.show()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("TriggerEvent")       //1
			is_log = ""
			tv_test.Triggerevent( "ue_tree")
			ls_result += wf_result_add(ls_item, " ", pos(is_log,"ue_tree") >0 )
			
		case lower("TypeOf")    //Object enumerated datatype. Returns the type of objectname. If objectname is null, TypeOf returns null.
			object lo_type
			lo_type = tv_test.TypeOf( )
			ls_result += wf_result_add(ls_item, " ", not isnull(lo_type) and lo_type = TreeView!)
			
		case lower("")
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine wf_tvitem ();
end subroutine

event of_testcase_point_module1;string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
ls_array[Upperbound(ls_array) + 1 ] = "AddPicture"
ls_array[Upperbound(ls_array) + 1 ] = "AddStatePicture"
ls_array[Upperbound(ls_array) + 1 ] = "ClassName"
ls_array[Upperbound(ls_array) + 1 ] = "CollapseItem"
ls_array[Upperbound(ls_array) + 1 ] = "DeleteItem"
ls_array[Upperbound(ls_array) + 1 ] = "DeletePicture"
ls_array[Upperbound(ls_array) + 1 ] = "DeleteStatePicture"
ls_array[Upperbound(ls_array) + 1 ] = "EditLabel"
ls_array[Upperbound(ls_array) + 1 ] = "ExpandAll"
ls_array[Upperbound(ls_array) + 1 ] = "ExpandItem"
ls_array[Upperbound(ls_array) + 1 ] = "FindItem"
ls_array[Upperbound(ls_array) + 1 ] = "GetItem"
ls_array[Upperbound(ls_array) + 1 ] = "GetParent"
ls_array[Upperbound(ls_array) + 1 ] = "Hide"
ls_array[Upperbound(ls_array) + 1 ] = "InsertItem"
ls_array[Upperbound(ls_array) + 1 ] = "InsertItemFirst"
ls_array[Upperbound(ls_array) + 1 ] = "InsertItemLast"
ls_array[Upperbound(ls_array) + 1 ] = "Move"
ls_array[Upperbound(ls_array) + 1 ] = "PostEvent"
ls_array[Upperbound(ls_array) + 1 ] = "Resize"
ls_array[Upperbound(ls_array) + 1 ] = "SelectItem"
ls_array[Upperbound(ls_array) + 1 ] = "SetOverlayPicture"
ls_array[Upperbound(ls_array) + 1 ] = "SetPosition"
ls_array[Upperbound(ls_array) + 1 ] = "Show"
ls_array[Upperbound(ls_array) + 1 ] = "TriggerEvent"
ls_array[Upperbound(ls_array) + 1 ] = "TypeOf"
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
		case lower("AddPicture")		
			wf_reset()
			tv_test.AddPicture("Blob!")
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 7)
			
		case lower("AddStatePicture")
			tv_test.AddStatePicture("Blob!")
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 7)
			
		case lower("ClassName")
			tv_test.ClassName()
			
		case lower("CollapseItem")
			tv_test.CollapseItem(ii_index)
		case lower("DeleteItem")	
			tv_test.ExpandAll( 0 )
			tv_test.FindItem(RootTreeItem!,0)
			ll_tmp = tv_test.FindItem( NextTreeItem!, 0)
			li_rtn = tv_test.DeleteItem( ll_tmp)
			
		case lower("DeletePicture")
			tv_test.DeletePicture(7)
			
		case lower("DeleteStatePicture")
			tv_test.DeleteStatePicture(7)
			
		case lower("EditLabel")
			tv_test.EditLabels = true
			tv_test.EditLabel( ii_index)
			
		case lower("ExpandAll")
			tv_test.ExpandAll( ii_index)
			
		case lower("ExpandItem")
			tv_test.CollapseItem(0)
			tv_test.ExpandItem( ii_index)
			
		case lower("FindItem")
			wf_reset()
			tv_test.FindItem(RootTreeItem!,0)
			tv_test.FindItem(NextTreeItem!,0)
			tv_test.FindItem(PreviousTreeItem!,0)
			tv_test.FindItem(ParentTreeItem!,0)
			tv_test.FindItem(ChildTreeItem!,0)
			tv_test.FindItem(FirstVisibleTreeItem!,0)
			tv_test.FindItem(NextVisibleTreeItem!,0)
			tv_test.FindItem(PreviousVisibleTreeItem!,0)
			tv_test.FindItem(CurrentTreeItem!,0)
			tv_test.FindItem(DropHighlightTreeItem!,0)
			
			
		case lower("GetItem")
			treeviewitem ltv_tvi
			
			tv_test.SetItem( ii_index, ltv_tvi)
			
		case lower("GetParent")	
			tv_test.GetParent( )
			
		case lower("Hide")
			tv_test.Hide()
			
		case lower("InsertItem")
		case lower("InsertItemFirst")
		case lower("InsertItemLast")			
		case lower("Move")
		case lower("PostEvent")
		case lower("Resize")
		case lower("SelectItem")			
		case lower("SetOverlayPicture")
		case lower("SetPosition")
		case lower("Show")
		case lower("TriggerEvent")
		case lower("TypeOf")
		case lower("")
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end event

on w_treeview.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.cb_5=create cb_5
this.cb_4=create cb_4
this.tv_test=create tv_test
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cbx_2
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.cb_5
this.Control[iCurrent+5]=this.cb_4
this.Control[iCurrent+6]=this.tv_test
end on

on w_treeview.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.tv_test)
end on

type cb_1 from commandbutton within w_treeview
integer x = 1550
integer y = 312
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

type cbx_2 from checkbox within w_treeview
integer x = 201
integer y = 1012
integer width = 457
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "child"
end type

type cbx_1 from checkbox within w_treeview
integer x = 201
integer y = 896
integer width = 457
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ing"
end type

type cb_5 from commandbutton within w_treeview
integer x = 786
integer y = 1016
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "initial"
end type

event clicked;wf_initial()
end event

type cb_4 from commandbutton within w_treeview
integer x = 791
integer y = 872
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "wf_reset"
end type

event clicked;wf_reset()
end event

type tv_test from treeview within w_treeview
event ue_tree ( )
integer x = 23
integer y = 8
integer width = 1225
integer height = 768
integer taborder = 10
string dragicon = "Application5!"
boolean dragauto = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "AppStarting!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
boolean disabledragdrop = false
boolean hideselection = false
string picturename[] = {"AlignHCenter!","Browse!","BrowseObject!","CreateRuntime!","Continue!","Start!"}
long picturemaskcolor = 536870912
string statepicturename[] = {"BrowseClasses!","Browse!","BrowseObject!","CreateRuntime!","Continue!","Start!"}
long statepicturemaskcolor = 536870912
end type

event ue_tree();is_log +="the ue_tree event is triggered~r~n"
end event

