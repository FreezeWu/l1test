$PBExportHeader$w_pb_menu.srw
forward
global type w_pb_menu from w_base_case
end type
type cb_1 from commandbutton within w_pb_menu
end type
type dw_1 from datawindow within w_pb_menu
end type
end forward

global type w_pb_menu from w_base_case
integer width = 5280
integer height = 3040
string title = "PB_Menu"
string menuname = "m_munu_main"
cb_1 cb_1
dw_1 dw_1
end type
global w_pb_menu w_pb_menu

type variables



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
string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null,ls_temp3
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname,ls_MenuType
integer 		li_rtn, li_col,li_count
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data

m_property01   lm_Menu
MenuItemType 	lm_MenuType

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

//ls_array[Upperbound(ls_array) + 1 ] = "testcasepoint_example1"			//edit you test case point name
//ls_array[Upperbound(ls_array) + 1 ] = ""
//   Cascade properties
  ls_array[Upperbound(ls_array) + 1 ] = "Checked"
//  ls_array[Upperbound(ls_array) + 1 ] = "Columns"                          
//  ls_array[Upperbound(ls_array) + 1 ] = "CurrentItem"
  ls_array[Upperbound(ls_array) + 1 ] = "Default"
//  ls_array[Upperbound(ls_array) + 1 ] = "DropDown"
//  ls_array[Upperbound(ls_array) + 1 ] = "Enable"
  ls_array[Upperbound(ls_array) + 1 ] = "Item[]"
  ls_array[Upperbound(ls_array) + 1 ] = "MenuItemType"
  ls_array[Upperbound(ls_array) + 1 ] = "MicroHelp"
  ls_array[Upperbound(ls_array) + 1 ] = "parentwindow"
  ls_array[Upperbound(ls_array) + 1 ] = "ShiftToRight"
  ls_array[Upperbound(ls_array) + 1 ] = "Shortcut"
  ls_array[Upperbound(ls_array) + 1 ] = "Tag"
  ls_array[Upperbound(ls_array) + 1 ] = "Text "
  ls_array[Upperbound(ls_array) + 1 ] = "ToolbaritemDown"
  ls_array[Upperbound(ls_array) + 1 ] = "ToolbarItemDownName"
  ls_array[Upperbound(ls_array) + 1 ] = "ToolbarItemBarIndex"
  ls_array[Upperbound(ls_array) + 1 ] = "ToolbarItemName"
  ls_array[Upperbound(ls_array) + 1 ] = "ToolbarItemOrder"
  ls_array[Upperbound(ls_array) + 1 ] = "ToolbarItemSpace"
  ls_array[Upperbound(ls_array) + 1 ] = "ToolbarItemText "
  ls_array[Upperbound(ls_array) + 1 ] = "ToolbarItemVisible "
  ls_array[Upperbound(ls_array) + 1 ] = "Visible"
  
  // Cascade  functions
  ls_array[Upperbound(ls_array) + 1 ] = "Check"
  ls_array[Upperbound(ls_array) + 1 ] = "ClassName"
  ls_array[Upperbound(ls_array) + 1 ] = "Disable"
  ls_array[Upperbound(ls_array) + 1 ] = "Enabled"
  ls_array[Upperbound(ls_array) + 1 ] = "Getparent"
  ls_array[Upperbound(ls_array) + 1 ] = "Hide"
  ls_array[Upperbound(ls_array) + 1 ] = "PopMenu"
  ls_array[Upperbound(ls_array) + 1 ] = "PostEvent"
  ls_array[Upperbound(ls_array) + 1 ] = "Show"
  ls_array[Upperbound(ls_array) + 1 ] = "TriggerEvent"
  ls_array[Upperbound(ls_array) + 1 ] = "TypeOf"
  ls_array[Upperbound(ls_array) + 1 ] = "Uncheck"


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
			//Maximum script size exceeded. 		//2100
			
     //		case lower("testcasepoint_example1")	
			//			... your test case code...
			//	ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("Checked")
			lm_Menu = Create m_property01
//			this.ChangeMenu(m_property01)
			
			//获取原始值

			ls_temp=string(lm_Menu.m_0.Checked)
			ls_result += wf_result_add(ls_item, "1.property initialize value is: ", not isnull(ls_temp) and ls_temp = "false")
			
			//change checked from false to true
			lm_Menu.m_0.checked=true
			ls_temp=string(lm_Menu.m_0.Checked)
			ls_result += wf_result_add(ls_item, "2.property setting value is: ", not isnull(ls_temp) and ls_temp = "true")
			
			//change checked from true  to false 
			lm_Menu.m_0.checked=false
			ls_temp=string(lm_Menu.m_0.Checked)
			ls_result += wf_result_add(ls_item, "3.property setting value is: ", not isnull(ls_temp) and ls_temp = "false")
			
			if isvalid(lm_Menu) then destroy  lm_Menu
			
//		case lower("Columns")
//			
//			lm_Menu = Create m_property01
//			
//			//获取初始值
//			ls_temp=string(lm_Menu.m_0.columns)
//			ls_result+=wf_result_add(ls_item,"1.property initialize value is:",not isnull(ls_temp) and ls_temp="1")
////			
//			// set Columns property value to negative
//			
//			lm_Menu.m_0.columns=-1
//			ls_temp=string(lm_Menu.m_0.columns)
//			ls_result+=wf_result_add(ls_item,"2.property setting value is:",not isnull(ls_temp) and ls_temp="-1")
//
//			destroy  lm_Menu
			
			
//		case lower("CurrentItem")
//			this.ChangeMenu(m_property01)
//			if not isvalid(lm_Menu) then lm_Menu = Create m_property01
		
			//获取初始值
//			ls_temp=string(lm_Menu.m_0.CurrentItem )		
//			ls_result+=wf_result_add(ls_item,"1.property initialize value is:",not isnull(ls_temp) and ls_temp="m_menua")
//			if isvalid(lm_Menu) then		destroy lm_Menu
					
		case lower("Default")
			lm_Menu = Create m_property01
			
			//获取初始值
			ls_temp=string(lm_Menu.m_0.Default)
			ls_result+=wf_result_add(ls_item,"1.property initialize value is:",not isnull(ls_temp) and ls_temp="false")
			
			//change Default from false to true
			
			lm_Menu.m_0.default=true
			ls_temp=string(lm_Menu.m_0.default)
			ls_result+=wf_result_add(ls_item,"2.property setting value is:",not isnull(ls_temp) and ls_temp="true")
			
			if isvalid(lm_Menu) then destroy  lm_Menu
		
//		case lower("DropDown")
//			lm_Menu = Create m_property01
//			
//			获取初始值
//			ls_temp=string(lm_Menu.m_0.DropDown)
//			ls_result+=wf_result_add(ls_item,"1.property initialize value is:",not isnull(ls_temp) and ls_temp="true")
//			
//			 setting property value
//			lm_Menu.m_0.DropDown=false
//			ls_temp=string(lm_Menu.m_0.DropDown)
//			ls_result+=wf_result_add(ls_item,"2.property setting value is:",not isnull(ls_temp) and ls_temp="false")
//			
//			if isvalid(lm_Menu) then destroy  lm_Menu
			
			
//		case lower("Enable")
//			lm_Menu = Create m_property01
//			
//			//获取初始值
//			ls_temp=string(lm_Menu.m_0.Enable)
//			ls_result+=wf_result_add(ls_item,"1.property initialize value is:",not isnull(ls_temp) and ls_temp="true")
//			
//			// setting property value
//			lm_Menu.m_0.Enable=false
//			ls_temp=string(lm_Menu.m_0.Enable)
//			ls_result+=wf_result_add(ls_item,"2.property setting value is:",not isnull(ls_temp) and ls_temp="false")
//			
//			if isvalid(lm_Menu) then destroy  lm_Menu
			
		case lower("Item[]")
			lm_Menu = Create m_property01
			//获取初始值
			li_Count = UpperBound(lm_Menu.m_0.Item[])
			ls_result+=wf_result_add(ls_item,"1.property initialize value is:",not isnull(li_count) and li_count>0)
			
			//改变Item[] menu 属性值
			lm_Menu.m_0.item[1].Default=true
			ls_temp=string(lm_Menu.m_0.item[1].Default)
			ls_result+=wf_result_add(ls_item,"2.property setting value is:",not isnull(ls_temp) and ls_temp="true")
			
			if isvalid(lm_Menu) then destroy  lm_Menu
		
		case lower( "MenuItemType")
			lm_Menu = Create m_property01
			//获取初始值
			 lm_MenuType=lm_Menu.m_0.MenuItemType
			choose case lm_MenuType
	              case MenuItemTypeAbout!
		              ls_temp = "MenuItemTypeAbout"  
	              case MenuItemTypeExit!
		              ls_temp = "MenuItemTypeExit"
	              case MenuItemTypeNormal!
		              ls_temp = "MenuItemTypeNormal"
              end choose
//			ls_result+=wf_result_add(ls_item,	"1.property initialize value is:",not isnull(ls_temp)  and lower(ls_temp)=lower("MenuItemTypeNormal!"))
			ls_result+=wf_result_add(ls_item,	"1.property initialize value is:",not isnull(ls_temp)  and ls_temp="MenuItemTypeNormal")
				
			
			//设置属性值为MenuItemTypeExit!		
			lm_Menu.m_0.MenuItemType=MenuItemTypeExit!
			if lm_Menu.m_0.MenuItemType=MenuItemTypeExit! then
				ls_temp2 = "MenuItemTypeExit!"
			else 
				ls_temp2  = "no MenuItemTypeExit!"
			end if
//			ls_result+=wf_result_add(ls_item,	"2.property setting value is:",not isnull(ls_temp)  and lower(ls_temp)=lower("MenuItemTypeExit!"))
			ls_result+=wf_result_add(ls_item,	"2.property setting value is:",not isnull(ls_temp2)  and lower(ls_temp2)=lower("MenuItemTypeExit!"))
			
			if isvalid(lm_Menu) then destroy  lm_Menu	  
			
		case lower("MicroHelp")	
			lm_Menu = Create m_property01
			//获取属性值
			ls_temp=lm_Menu.m_0.microhelp
			ls_result+=wf_result_add(ls_item,	"1.property initialize value is:",not isnull(ls_temp) and ls_temp="The first menu item")
			
			//设置属性值
			lm_Menu.m_0.microhelp="changed"
			ls_temp=lm_Menu.m_0.microhelp
			ls_result+=wf_result_add(ls_item,	"2.property setting value is:",not isnull(ls_temp)  and ls_temp="changed")
			
			if isvalid(lm_Menu) then destroy  lm_Menu	  
			
		case lower("parentwindow")	
			this.changemenu(m_munu_main)
			//获取属性值
			ls_temp=string(m_munu_main.m_winmenu.parentwindow.title)
			ls_result+=wf_result_add(ls_item,	"1.property initialize value is:",not isnull(ls_temp) and ls_temp="PB_Menu")
			
		case lower("ShiftToRight")	
			lm_Menu = Create m_property01
			//获取初始值
			ls_temp=string(lm_Menu.m_0.ShiftToRight)
			ls_result+=wf_result_add(ls_item,	"1.property initialize value is:",not isnull(ls_temp) and ls_temp="false")
			
			//设置属性值
			lm_Menu.m_0.ShiftToRight=true
			ls_temp = string(lm_Menu.m_0.ShiftToRight)
			ls_result+=wf_result_add(ls_item,	"2.property setting value is:",not isnull(ls_temp)  and ls_temp="true")
			
			if isvalid(lm_Menu) then destroy  lm_Menu	  		
			
		case lower("Shortcut")	
			lm_Menu = Create m_property01
			//获取属性值
			ls_temp=string(lm_Menu.m_0.item[1].Shortcut)
			ls_result+=wf_result_add(ls_item,	"1.property initialize value is:",not isnull(ls_temp) and ls_temp="321")
			if isvalid(lm_Menu) then destroy  lm_Menu	
			
		case lower("Tag")	
			lm_Menu = Create m_property01
			//获取属性值
			ls_temp=lm_Menu.m_0.tag
			ls_result+=wf_result_add(ls_item,	"1.property initialize value is:",not isnull(ls_temp) and ls_temp="CasCade1 Tag")
			
			//设置属性值
			lm_Menu.m_0.tag="changed"
			ls_temp=lm_Menu.m_0.tag
			ls_result+=wf_result_add(ls_item,	"2.property setting value is:",not isnull(ls_temp)  and ls_temp="changed")
			
			if isvalid(lm_Menu) then destroy  lm_Menu
			
		case lower("Text ")
			lm_Menu = Create m_property01
			//获取属性值
			ls_temp=lm_Menu.m_0.text
			ls_result+=wf_result_add(ls_item,	"1.property initialize value is:",not isnull(ls_temp) and ls_temp="CasCade1")
			
			//设置属性值为''
			lm_Menu.m_0.text=''
			ls_temp=lm_Menu.m_0.text
			ls_result+=wf_result_add(ls_item,	"2.property setting value is:",not isnull(ls_temp)  and ls_temp='')
			
			//设置属性值为含&的英文字符
			lm_Menu.m_0.text="&changed"
			ls_temp=lm_Menu.m_0.text
			ls_result+=wf_result_add(ls_item,	"3.property setting value is:",not isnull(ls_temp)  and ls_temp="&changed")
			
			//设置属性值为含&的中文字符
			lm_Menu.m_0.text="&级联菜单一"
			ls_temp=lm_Menu.m_0.text
			ls_result+=wf_result_add(ls_item,	"4.property setting value is:",not isnull(ls_temp)  and ls_temp="&级联菜单一")
			
			//设置属性值为含&&的英文字符
			lm_Menu.m_0.text="&&changed"
			ls_temp=lm_Menu.m_0.text
			ls_result+=wf_result_add(ls_item,	"5.property setting value is:",not isnull(ls_temp)  and ls_temp="&&changed")
			
			//设置属性值为_
			lm_Menu.m_0.text='-'
			ls_temp=lm_Menu.m_0.text
			ls_result+=wf_result_add(ls_item,	"6.property setting value is:",not isnull(ls_temp)  and ls_temp='-')
			
			if isvalid(lm_Menu) then destroy  lm_Menu					
			
		case lower("ToolbaritemDown")
			lm_Menu = Create m_property01
			//获取属性初始值			
			ls_temp=string(lm_Menu.m_0.ToolbaritemDown)
			ls_result+=wf_result_add(ls_item,	"1.property initialize value is:",not isnull(ls_temp) and ls_temp="false")
			
			//设置属性值
			lm_Menu.m_0.ToolbaritemDown=true
			ls_temp=string(lm_Menu.m_0.ToolbaritemDown)
			ls_result+=wf_result_add(ls_item,	"2.property setting value is:",not isnull(ls_temp)  and ls_temp="true")
			
			if isvalid(lm_Menu) then destroy  lm_Menu			
			
		case lower("ToolbarItemDownName")
			lm_Menu = Create m_property01
			//获取属性初始值
			ls_temp=lm_Menu.m_0.toolbaritemdownname
			ls_result+=wf_result_add(ls_item,	"1.property initialize value is:",not isnull(ls_temp) and ls_temp="Application!")
			
			//获取属性设置值
			lm_Menu.m_0.toolbaritemdownname="Custom030!"
			ls_temp=lm_Menu.m_0.toolbaritemdownname
			ls_result+=wf_result_add(ls_item,	"2.property setting value is:",not isnull(ls_temp)  and ls_temp="Custom030!")
			
			if isvalid(lm_Menu) then destroy  lm_Menu		
			
		case lower("ToolbarItemBarIndex")
			lm_Menu = Create m_property01
			//获取初始值
			li_rtn=lm_Menu.m_0.toolbaritembarindex
			ls_result+=wf_result_add(ls_item,	"1.property initialize value is:",not isnull(li_rtn) and li_rtn=1)
			
			//设置属性值为负
			lm_Menu.m_0.toolbaritembarindex= -1
			li_rtn=lm_Menu.m_0.toolbaritembarindex
//			ls_result+=wf_result_add(ls_item,	"2.property setting value is:",not isnull(li_rtn) and li_rtn=0)
			ls_result+=wf_result_add(ls_item,	"2.property setting value is:",not isnull(li_rtn) and li_rtn < 0)
			
			//设置属性值为0
			lm_Menu.m_0.toolbaritembarindex= 0
			li_rtn=lm_Menu.m_0.toolbaritembarindex
			ls_result+=wf_result_add(ls_item,	"3.property setting value is:",not isnull(li_rtn) and li_rtn=0)
			
			//设置属性值为整数（<16）
			lm_Menu.m_0.toolbaritembarindex= 7
			li_rtn=lm_Menu.m_0.toolbaritembarindex
			ls_result+=wf_result_add(ls_item,	"4.property setting value is:",not isnull(li_rtn) and li_rtn=7)
			
			//设置属性值为整数（>16）
			lm_Menu.m_0.toolbaritembarindex= 24
			li_rtn=lm_Menu.m_0.toolbaritembarindex
//			ls_result+=wf_result_add(ls_item,	"5.property setting value is:",not isnull(li_rtn) and li_rtn=15)
			ls_result+=wf_result_add(ls_item,	"5.property setting value is:",not isnull(li_rtn) and li_rtn > 0)
			
			if isvalid(lm_Menu) then destroy  lm_Menu				
			
	    case lower("ToolbarItemName")
			lm_Menu = Create m_property01
			
			//获取初始值
			ls_temp=lm_Menu.m_0.toolbaritemname
			ls_result+=wf_result_add(ls_item,"1.property initialize value is:",not isnull(ls_temp) and ls_temp="AppIcon!")
			
			//获取属性设置值
			lm_Menu.m_0.toolbaritemname="Custom026!"
			ls_temp=lm_Menu.m_0.toolbaritemname
			ls_result+=wf_result_add(ls_item,"2.property setting value is:",not isnull(ls_temp) and ls_temp="Custom026!")
			
			if isvalid(lm_Menu) then destroy  lm_Menu			
			
	    case lower("ToolbarItemOrder")
			lm_Menu = Create m_property01
			//获取初始值
			li_rtn=lm_Menu.m_1.toolbaritemorder
			ls_result+=wf_result_add(ls_item,"1.property initialize value is:",not isnull(li_rtn) and li_rtn = 0)
			
			//设置属性值为负数
			lm_Menu.m_1.toolbaritemorder= -1
			li_rtn=lm_Menu.m_1.toolbaritemorder
			ls_result+=wf_result_add(ls_item,"2.property setting value is:",not isnull(li_rtn) and li_rtn < 0)
			
			//设置属性值为正数
			lm_Menu.m_1.toolbaritemorder= 2
			li_rtn=lm_Menu.m_1.toolbaritemorder
			ls_result+=wf_result_add(ls_item,"3.property setting value is:",not isnull(li_rtn) and li_rtn > 0)
			
			if isvalid(lm_Menu) then destroy  lm_Menu			
			
	    case lower("ToolbarItemSpace")
			lm_Menu = Create m_property01
			//获取属性初始值
			li_rtn=lm_Menu.m_1.ToolbarItemSpace
			ls_result+=wf_result_add(ls_item,"1.property initialize value is:",not isnull(li_rtn) and li_rtn = 0)
			
			//设置属性值为负数
		     lm_Menu.m_1.ToolbarItemSpace= -1
			li_rtn=lm_Menu.m_1.ToolbarItemSpace
			ls_result+=wf_result_add(ls_item,"2.property setting value is:",not isnull(li_rtn) and li_rtn < 0)
			
			//设置属性值为正数
			lm_Menu.m_1.ToolbarItemSpace=4
			li_rtn=lm_Menu.m_1.ToolbarItemSpace
			ls_result+=wf_result_add(ls_item,"3.property setting value is:",not isnull(li_rtn) and li_rtn > 0)
			
			//设置属性值为正数
			lm_Menu.m_1.ToolbarItemSpace=160
			li_rtn=lm_Menu.m_1.ToolbarItemSpace
			ls_result+=wf_result_add(ls_item,"4.property setting value is:",not isnull(li_rtn) and li_rtn > 0)
			
			if isvalid(lm_Menu) then destroy  lm_Menu	
					
	    case lower("ToolbarItemText")
			lm_Menu = Create m_property01
			
			//获取属性初始值
			ls_temp=lm_Menu.toolbaritemtext
			ls_result+=wf_result_add(ls_item,"1.property initialize value is:",not isnull(ls_temp) and ls_temp="Cascade1")
			
			//设置属性值
			lm_Menu.toolbaritemtext="Cascade1Tips"
			ls_temp=lm_Menu.toolbaritemtext
			ls_result+=wf_result_add(ls_item,"2.property setting value is:",not isnull(ls_temp) and ls_temp="Cascade1Tips")
			
			//设置子菜单的属性值(include ,)
			lm_Menu.m_0.item[1].toolbaritemtext= 'MenuA,MenuA ToolTip1' 
			ls_temp=lm_Menu.m_0.item[1].toolbaritemtext
			ls_result+=wf_result_add(ls_item,"3.property setting value is:",not isnull(ls_temp) and ls_temp='MenuA,MenuA ToolTip1' )
			
			//设置子菜单的属性值(include &)
			lm_Menu.m_0.item[2].toolbaritemtext= '&MenuB' 
			ls_temp=lm_Menu.m_0.item[2].toolbaritemtext
			ls_result+=wf_result_add(ls_item,"4.property setting value is:",not isnull(ls_temp) and ls_temp='&MenuB'  )
			
			if isvalid(lm_Menu) then destroy  lm_Menu			
			
	    case lower("ToolbarItemVisible")
			lm_Menu = Create m_property01
			
			//获取属性初始值
			ls_temp=string(lm_Menu.m_0.ToolbarItemVisible)
			ls_result+=wf_result_add(ls_item,"1.property initialize value is:",not isnull(ls_temp) and ls_temp="true")
			
			//设置属性值
			lm_Menu.m_0.ToolbarItemVisible=false
			ls_temp=string(lm_Menu.m_0.ToolbarItemVisible)
			ls_result+=wf_result_add(ls_item,"2.property setting value is:",not isnull(ls_temp) and ls_temp="false")
			
			if isvalid(lm_Menu) then destroy  lm_Menu		
				
 		case lower("Visible")
			lm_Menu = Create m_property01
			
			//获取属性初始值
			ls_temp=string(lm_Menu.m_0.Visible)
			ls_result+=wf_result_add(ls_item,"1.property initialize value is:",not isnull(ls_temp) and ls_temp="true")
			
			//设置属性值
			lm_Menu.m_0.Visible=false
			ls_temp=string(lm_Menu.m_0.Visible)
			ls_result+=wf_result_add(ls_item,"2.property setting value is:",not isnull(ls_temp) and ls_temp="false")
			
			if isvalid(lm_Menu) then destroy  lm_Menu		
			
			

                    //function
//		case lower()	
//		case lower()	
//		case lower()	
//		case lower()	
//		case lower()	
//		case lower()	
//		case lower()	
//		case lower()	
//		case lower()	
//		case lower()
//		case lower()	
//		case lower()	
		
			
	end choose 
next 



is_resultlog += ls_result
end subroutine

on w_pb_menu.create
int iCurrent
call super::create
if this.MenuName = "m_munu_main" then this.MenuID = create m_munu_main
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_1
end on

on w_pb_menu.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_1 from commandbutton within w_pb_menu
integer x = 1454
integer y = 1788
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Run"
end type

event clicked;of_testcase_point_module()
end event

type dw_1 from datawindow within w_pb_menu
integer x = 210
integer y = 108
integer width = 3438
integer height = 1652
integer taborder = 10
string title = "none"
string dataobject = "dw_menulist"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

