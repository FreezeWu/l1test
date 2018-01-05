$PBExportHeader$w_datawindow_style_richtext.srw
forward
global type w_datawindow_style_richtext from w_base_case
end type
type cb_8 from commandbutton within w_datawindow_style_richtext
end type
type cb_7 from commandbutton within w_datawindow_style_richtext
end type
type cb_6 from commandbutton within w_datawindow_style_richtext
end type
type dw_2 from datawindow within w_datawindow_style_richtext
end type
type cb_5 from commandbutton within w_datawindow_style_richtext
end type
type rte_1 from richtextedit within w_datawindow_style_richtext
end type
type cb_4 from commandbutton within w_datawindow_style_richtext
end type
type cb_3 from commandbutton within w_datawindow_style_richtext
end type
type cb_2 from commandbutton within w_datawindow_style_richtext
end type
type cb_1 from commandbutton within w_datawindow_style_richtext
end type
type dw_1 from datawindow within w_datawindow_style_richtext
end type
end forward

global type w_datawindow_style_richtext from w_base_case
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
dw_2 dw_2
cb_5 cb_5
rte_1 rte_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_datawindow_style_richtext w_datawindow_style_richtext

type prototypes

end prototypes

type variables
long 		il_job

end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module7 ()
public subroutine of_testcase_point_module6 ()
public subroutine of_testcase_point_module5 ()
public subroutine of_testcase_point_module4 ()
public subroutine of_testcase_point_module3 ()
end prototypes

public subroutine of_testcase_point_module ();dw_1.dataobject= 'd_richtext_datawindow1'
dw_1.settransobject( sqlca)

dw_1.retrieve( )

string ls_array[], ls_item, ls_result, ls_temp, ls_default_dataobject
long	ll_bound, i , ll_tmp
boolean		lbn_return

ls_result = ''
ll_bound =0 
//RichText.property DataWindow object property
ls_array[Upperbound(ls_array) + 1 ] = "Backcolor"
ls_array[Upperbound(ls_array) + 1 ] = "ControlCharsVisible"			//ControlChars Visible
ls_array[Upperbound(ls_array) + 1 ] = "DisplayOnly"
ls_array[Upperbound(ls_array) + 1 ] = "HeaderFooter"
ls_array[Upperbound(ls_array) + 1 ] = "InputFieldBackColor"
ls_array[Upperbound(ls_array) + 1 ] = "InputFieldNamesVisible"
ls_array[Upperbound(ls_array) + 1 ] = "InputFieldsVisible"
//ls_array[Upperbound(ls_array) + 1 ] = "PictureFrame"		//(obsolete)
ls_array[Upperbound(ls_array) + 1 ] = "PopMenu"
ls_array[Upperbound(ls_array) + 1 ] = "ReadOnly"
//ls_array[Upperbound(ls_array) + 1 ] = "ReturnsVisible"		//(obsolete)
ls_array[Upperbound(ls_array) + 1 ] = "RulerBar"
//ls_array[Upperbound(ls_array) + 1 ] = "SpacesVisible"			//(obsolete)
//ls_array[Upperbound(ls_array) + 1 ] = "TabBar"				//(obsolete)
//ls_array[Upperbound(ls_array) + 1 ] = "TabsVisible"			//Obsolete property. This property is replaced by the ControlCharsVisible property.	
ls_array[Upperbound(ls_array) + 1 ] = "ToolBar"
ls_array[Upperbound(ls_array) + 1 ] = "WordWrap"			//different return value with TE and TX
ls_array[Upperbound(ls_array) + 1 ] = "Height"
ls_array[Upperbound(ls_array) + 1 ] = "width"
ls_array[Upperbound(ls_array) + 1 ] = "HSplitScroll"
//ls_array[Upperbound(ls_array) + 1 ] = "Icon"					//crush the PB runtime when set the icon value is empty.
ls_array[Upperbound(ls_array) + 1 ] = "RightToLeft"
ls_array[Upperbound(ls_array) + 1 ] = "X"
ls_array[Upperbound(ls_array) + 1 ] = "Y"
ls_array[Upperbound(ls_array) + 1 ] = "Print.Documentname"
ls_array[Upperbound(ls_array) + 1 ] = "Print.Orientation"
ls_array[Upperbound(ls_array) + 1 ] = "Print.Margin.left"
ls_array[Upperbound(ls_array) + 1 ] = "Print.Margin.right"
ls_array[Upperbound(ls_array) + 1 ] = "Print.Margin.top"
ls_array[Upperbound(ls_array) + 1 ] = "Print.Margin.bottom"
ls_array[Upperbound(ls_array) + 1 ] = "Print.Paper.source"
ls_array[Upperbound(ls_array) + 1 ] = "Print.Paper.size"
ls_array[Upperbound(ls_array) + 1 ] = "Print.Prompt"
ls_array[Upperbound(ls_array) + 1 ] = ""


 
ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	ls_item = ls_array[i]
	lbn_return = false
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")
	choose case lower(ls_item)
		case lower('Backcolor')
			//获取原始值
			ls_temp = dw_1.describe( "DataWindow.RichText.Backcolor")
			if not isnull(ls_temp) and ls_temp = '16777215'	then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//动态设置BackColor为-3， 无效值
			ls_temp = dw_1.Modify( "DataWindow.RichText.Backcolor="+"-3")
			ls_temp = dw_1.describe( "DataWindow.RichText.Backcolor")
			if not isnull(ls_temp) and ls_temp = '16777215'	then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//非正常值，正数
			ls_temp = dw_1.Modify( "DataWindow.RichText.Backcolor="+"10000")
			ls_temp = dw_1.describe( "DataWindow.RichText.Backcolor")
			if not isnull(ls_temp) and ls_temp = '10000'	then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//正常值
			ls_temp = dw_1.Modify( "DataWindow.RichText.Backcolor="+"16777215")
			ls_temp = dw_1.describe( "DataWindow.RichText.Backcolor")
			if not isnull(ls_temp) and ls_temp = '16777215'	then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get normal = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get normal = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//超出范围
			ls_temp = dw_1.Modify( "DataWindow.RichText.Backcolor="+"16777216")
			ls_temp = dw_1.describe( "DataWindow.RichText.Backcolor")
			if not isnull(ls_temp) and (ls_temp = '16777215' or ls_temp = '0')	then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("ControlCharsVisible")	
			//获取原始值 false
			ls_temp = dw_1.describe( "DataWindow.RichText.ControlCharsVisible")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为true
			ls_temp = dw_1.Modify( "DataWindow.RichText.ControlCharsVisible="+"yes")
			ls_temp = dw_1.describe( "DataWindow.RichText.ControlCharsVisible")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为false
			ls_temp = dw_1.Modify( "DataWindow.RichText.ControlCharsVisible="+"no")
			ls_temp = dw_1.describe( "DataWindow.RichText.ControlCharsVisible")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("DisplayOnly")			
			//获取原始值 false
			ls_temp = dw_1.describe( "DataWindow.RichText.DisplayOnly")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为true
			ls_temp = dw_1.Modify( "DataWindow.RichText.DisplayOnly="+"yes")
			ls_temp = dw_1.describe( "DataWindow.RichText.DisplayOnly")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为false
			ls_temp = dw_1.Modify( "DataWindow.RichText.DisplayOnly="+"no")
			ls_temp = dw_1.describe( "DataWindow.RichText.DisplayOnly")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("HeaderFooter")				
			ls_default_dataobject = dw_1.dataobject
			//获取原始值 true
			ls_temp = dw_1.describe( "DataWindow.RichText.HeaderFooter")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//固定修改为false
			dw_1.dataobject= 'd_richtext_datawindow_nodefault'
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )
			ls_temp = dw_1.describe( "DataWindow.RichText.HeaderFooter")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 	
			
			dw_1.dataobject= ls_default_dataobject
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )
	case lower("InputFieldBackColor")							
			//获取原始值
			ls_temp = dw_1.describe( "DataWindow.RichText.InputFieldBackColor")
			if not isnull(ls_temp) and ls_temp = '16777215'	then		//1073741824
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//动态设置BackColor为-3， 无效值
			ls_temp = dw_1.Modify( "DataWindow.RichText.InputFieldBackColor="+"-3")
			ls_temp = dw_1.describe( "DataWindow.RichText.InputFieldBackColor")
			if not isnull(ls_temp) and ls_temp = '16777215'	then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//非正常值，正数
			ls_temp = dw_1.Modify( "DataWindow.RichText.InputFieldBackColor="+"10000")
			ls_temp = dw_1.describe( "DataWindow.RichText.InputFieldBackColor")
			if not isnull(ls_temp) and ls_temp = '10000'	then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//正常值
			ls_temp = dw_1.Modify( "DataWindow.RichText.InputFieldBackColor="+"16777215")
			ls_temp = dw_1.describe( "DataWindow.RichText.InputFieldBackColor")
			if not isnull(ls_temp) and ls_temp = '16777215'	then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get normal = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get normal = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//超出范围
			ls_temp = dw_1.Modify( "DataWindow.RichText.InputFieldBackColor="+"16777216")
			ls_temp = dw_1.describe( "DataWindow.RichText.InputFieldBackColor")
			if not isnull(ls_temp) and (ls_temp = '16777215' or ls_temp = '0')	then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 	
		case lower("InputFieldNamesVisible")				
			// InputFields Visible  must be set true
			//获取原始值 no
			ls_temp = dw_1.describe( "DataWindow.RichText.InputFieldNamesVisible")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "DataWindow.RichText.InputFieldNamesVisible="+"yes")
			ls_temp = dw_1.describe( "DataWindow.RichText.InputFieldNamesVisible")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "DataWindow.RichText.InputFieldNamesVisible="+"no")
			ls_temp = dw_1.describe( "DataWindow.RichText.InputFieldNamesVisible")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("InputFieldsVisible")						
			//获取原始值 yes
			ls_temp = dw_1.describe( "DataWindow.RichText.InputFieldsVisible")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "DataWindow.RichText.InputFieldsVisible="+"no")
			ls_temp = dw_1.describe( "DataWindow.RichText.InputFieldsVisible")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "DataWindow.RichText.InputFieldsVisible="+"yes")
			ls_temp = dw_1.describe( "DataWindow.RichText.InputFieldsVisible")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("PictureFrame")		//obsolete
			//获取原始值 no
			ls_temp = dw_1.describe( "DataWindow.RichText.PictureFrame")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "DataWindow.RichText.PictureFrame="+"yes")
			ls_temp = dw_1.describe( "DataWindow.RichText.PictureFrame")		//fail, ls_temp = 'no'
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "DataWindow.RichText.PictureFrame="+"no")
			ls_temp = dw_1.describe( "DataWindow.RichText.PictureFrame")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("PopMenu")						
			//获取原始值 yes
			ls_temp = dw_1.describe( "DataWindow.RichText.PopMenu")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "DataWindow.RichText.PopMenu="+"no")
			ls_temp = dw_1.describe( "DataWindow.RichText.PopMenu")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "DataWindow.RichText.PopMenu="+"yes")
			ls_temp = dw_1.describe( "DataWindow.RichText.PopMenu")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("ReadOnly")					
			//获取原始值 no
			ls_temp = dw_1.describe( "DataWindow.RichText.ReadOnly")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "DataWindow.RichText.ReadOnly="+"yes")
			ls_temp = dw_1.describe( "DataWindow.RichText.ReadOnly")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "DataWindow.RichText.ReadOnly="+"no")
			ls_temp = dw_1.describe( "DataWindow.RichText.ReadOnly")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("RulerBar")						
			//获取原始值 yes
			ls_temp = dw_1.describe( "DataWindow.RichText.RulerBar")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "DataWindow.RichText.RulerBar="+"no")
			ls_temp = dw_1.describe( "DataWindow.RichText.RulerBar")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "DataWindow.RichText.RulerBar="+"yes")
			ls_temp = dw_1.describe( "DataWindow.RichText.RulerBar")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("SpacesVisible")		
			//Obsolete property //This property is replaced by the ControlCharsVisible property.
			ls_temp = dw_1.Modify( "DataWindow.RichText.ControlCharsVisible="+"yes")
			//获取原始值 yes
			ls_temp = dw_1.describe( "DataWindow.RichText.SpacesVisible")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is no. Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is no. Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "DataWindow.RichText.SpacesVisible="+"yes")
			ls_temp = dw_1.describe( "DataWindow.RichText.SpacesVisible")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result += " "+is_testcasename+" "+ls_item+" property "+" is yes. Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is yes. Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "DataWindow.RichText.SpacesVisible="+"no")
			ls_temp = dw_1.describe( "DataWindow.RichText.SpacesVisible")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result += " "+is_testcasename+" "+ls_item+" property "+" is no. Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item+" property "+" is no. Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("TabBar")		//obsolete		
			ls_temp = dw_1.Modify( "DataWindow.RichText.ControlCharsVisible="+"yes")
			ls_temp = dw_1.Modify( "DataWindow.RichText.PopMenu="+"yes")
			ls_temp = dw_1.Modify( "DataWindow.RichText.ToolBar="+"yes")
			ls_temp = dw_1.Modify( "DataWindow.RichText.RulerBar="+"yes")
			
			//获取原始值 yes
			ls_temp = dw_1.describe( "DataWindow.RichText.TabBar")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is yes. Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is yes. Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "DataWindow.RichText.TabBar="+"no")
			ls_temp = dw_1.describe( "DataWindow.RichText.TabBar")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result += " "+is_testcasename+" "+ls_item+" property "+" is no. Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is no. Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "DataWindow.RichText.TabBar="+"yes")
			ls_temp = dw_1.describe( "DataWindow.RichText.TabBar")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result += " "+is_testcasename+" "+ls_item+" property "+" is yes. Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item+" property "+" is yes. Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("TabsVisible")				//Obsolete property /
			//Obsolete property //This property is replaced by the ControlCharsVisible property.
//			ls_temp = dw_1.Modify( "DataWindow.RichText.ControlCharsVisible="+"yes")
			//获取原始值 no
			ls_temp = dw_1.describe( "DataWindow.RichText.TabsVisible")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is no. Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is no. Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 

			//动态修改为yes
			ls_temp = dw_1.Modify( "DataWindow.RichText.TabsVisible="+"yes")
			ls_temp = dw_1.describe( "DataWindow.RichText.TabsVisible")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is yes. Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is yes. Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "DataWindow.RichText.TabsVisible="+"no")
			ls_temp = dw_1.describe( "DataWindow.RichText.TabsVisible")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is no. Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is no. Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("ToolBar")		
			//获取原始值 yes
			ls_temp = dw_1.describe( "DataWindow.RichText.ToolBar")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "DataWindow.RichText.ToolBar="+"no")
			ls_temp = dw_1.describe( "DataWindow.RichText.ToolBar")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "DataWindow.RichText.ToolBar="+"yes")
			ls_temp = dw_1.describe( "DataWindow.RichText.ToolBar")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("WordWrap")					
			//获取原始值 yes
			ls_temp = dw_1.describe( "DataWindow.RichText.WordWrap")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "DataWindow.RichText.WordWrap="+"yes")
			ls_temp = dw_1.describe( "DataWindow.RichText.WordWrap")
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "DataWindow.RichText.WordWrap="+"no")
			ls_temp = dw_1.describe( "DataWindow.RichText.WordWrap")
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Height")					
			//default 		Height	1144
			ll_tmp = dw_1.Height 
			if not isnull(ll_tmp ) and ll_tmp  = 1144 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.Height = 176
			ll_tmp = dw_1.Height 
			if not isnull(ll_tmp ) and ll_tmp  = 176 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" set 176 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" set 176 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.Height = 2000
			ll_tmp = dw_1.Height 
			if not isnull(ll_tmp ) and ll_tmp  = 2000 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" set 2000 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" set 2000 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.Height = 1144
			ll_tmp = dw_1.Height 
			if not isnull(ll_tmp ) and ll_tmp  = 1144 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" set 1144 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" set 1144 = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("width")		
			//default 		width	1751
			ll_tmp = dw_1.width 
			if not isnull(ll_tmp ) and ll_tmp  = 1751 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.width = 176
			ll_tmp = dw_1.width 
			if ll_tmp  > 171 and ll_tmp < 181 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" set 176, real value = "+string(ll_tmp)+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" set 176, real value = "+string(ll_tmp)+String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.width = 2000
			ll_tmp = dw_1.width 
			if ll_tmp  > 1995 and ll_tmp < 2005 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" set 2000, real value = "+string(ll_tmp)+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" set 2000, real value = "+string(ll_tmp)+String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.width = 1751
			ll_tmp = dw_1.width 
			if not isnull(ll_tmp ) and ll_tmp  = 1751 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" set 1751 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+" set 1751 = "+String ( "Fail!" ) +"~r~n"
			end if 		
		case lower("HSplitScroll")			
			//获取原始值 false
			lbn_return = dw_1.hsplitscroll
			if lbn_return = false then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为true
			lbn_return = true
			lbn_return = dw_1.hsplitscroll
			if lbn_return = true then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set true = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set true = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为false
			lbn_return = false
			lbn_return = dw_1.hsplitscroll
			if lbn_return = false then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set false = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set false = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Icon")						
			ls_temp = string(dw_1.Icon )
			if isnull(ls_temp) or ls_temp = "" then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.Icon = "Question!"
			if dw_1.Icon = "Question!"  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set Question = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set Question = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.Icon = "error!"
			if dw_1.Icon = "error!"  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set error = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set error = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.Icon = ""								//bug		// the PB runtime will crash when use it code.
			if dw_1.Icon = ""  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set  = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set  = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("RightToLeft")
			//获取原始值 false
			lbn_return = dw_1.righttoleft
			if lbn_return = false then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为true
			lbn_return = true
			lbn_return = dw_1.righttoleft
			if lbn_return = true then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set true = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set true = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为false
			lbn_return = false
			lbn_return = dw_1.righttoleft
			if lbn_return = false then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set false = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set false = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("X")		
			//default 		width	951
			ll_tmp = dw_1.X 
			if not isnull(ll_tmp ) and ll_tmp  = 951 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.X = 120
			ll_tmp = dw_1.X 
			if ll_tmp  > 115 and ll_tmp < 125 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set 120, real value = "+string(ll_tmp)+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set 120, real value = "+string(ll_tmp)+ String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.X = 2000
			ll_tmp = dw_1.X 
			if ll_tmp  > 1995 and ll_tmp < 2005  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set 2000, real value = "+string(ll_tmp)+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set 2000, real value = "+string(ll_tmp)+ String ( "Fail!" ) +"~r~n"
			end if 	
			
			dw_1.X = 951
			ll_tmp = dw_1.X 
			if not isnull(ll_tmp ) and ll_tmp  = 951 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set 951 = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set 951 = "+ String ( "Fail!" ) +"~r~n"
			end if 	
		case lower("Y")						
			//default 		width	32
			ll_tmp = dw_1.Y 
			if not isnull(ll_tmp ) and ll_tmp  = 32 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.Y = 5
			ll_tmp = dw_1.Y 
			if ll_tmp  > 1 and ll_tmp < 10 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set 5, real value = "+string(ll_tmp)+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set 5, real value = "+string(ll_tmp)+ String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.Y = 2000
			ll_tmp = dw_1.Y 
			if ll_tmp  > 1995 and ll_tmp <2005 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set 2000, real value = "+string(ll_tmp)+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set 2000, real value = "+string(ll_tmp)+ String ( "Fail!" ) +"~r~n"
			end if 	
			
			dw_1.Y = 32
			ll_tmp = dw_1.Y 
			if not isnull(ll_tmp ) and ll_tmp  = 32 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set 32 = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set 32 = "+ String ( "Fail!" ) +"~r~n"
			end if 	
		case lower("Print.Documentname")
			//获取原始值
			ls_temp = dw_1.describe( "Datawindow.Print.Documentname")
			ls_result += wf_result_add(ls_item, "1. Get Original ", not isnull(ls_temp) and ls_temp = "")
						
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Documentname=~""+"DwRichtextPrint name"+"~" ")
			ls_temp = dw_1.describe( "Datawindow.Print.Documentname")
			ls_result += wf_result_add(ls_item, "2. Set name ", not isnull(ls_temp) and ls_temp = "DwRichtextPrint name")
			
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Documentname='' ")
			ls_temp = dw_1.describe( "Datawindow.Print.Documentname")
			ls_result += wf_result_add(ls_item, "3. Set Original ", not isnull(ls_temp) and ls_temp = "")
		case lower("Print.Orientation")
			//获取原始值	
			ls_temp = dw_1.describe( "Datawindow.Print.Orientation")
			ls_result += wf_result_add(ls_item, "1. Get Original ", not isnull(ls_temp) and ls_temp = "0")
						
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Orientation=1")
			ls_temp = dw_1.describe( "Datawindow.Print.Orientation")
			ls_result += wf_result_add(ls_item, "2. Set  ", not isnull(ls_temp) and ls_temp = "1")
			
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Orientation=0")
			ls_temp = dw_1.describe( "Datawindow.Print.Orientation")
			ls_result += wf_result_add(ls_item, "3. Set Original ", not isnull(ls_temp) and ls_temp = "0")
		case lower("Print.Margin.left")
			//获取原始值
			ls_temp = dw_1.describe( "Datawindow.Print.Margin.left")
			ls_result += wf_result_add(ls_item, "1. Get Original ", not isnull(ls_temp) and ls_temp = "250")
						
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Margin.left=1200")
			ls_temp = dw_1.describe( "Datawindow.Print.Margin.left")
			ls_result += wf_result_add(ls_item, "2. Set  ", not isnull(ls_temp) and ls_temp = "1200")
			
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Margin.left=250")
			ls_temp = dw_1.describe( "Datawindow.Print.Margin.left")
			ls_result += wf_result_add(ls_item, "3. Set Original ", not isnull(ls_temp) and ls_temp = "250")			
		case lower("Print.Margin.right")
			//获取原始值
			ls_temp = dw_1.describe( "Datawindow.Print.Margin.right")
			ls_result += wf_result_add(ls_item, "1. Get Original ", not isnull(ls_temp) and ls_temp = "250")
						
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Margin.right=2000")
			ls_temp = dw_1.describe( "Datawindow.Print.Margin.right")
			ls_result += wf_result_add(ls_item, "2. Set  ", not isnull(ls_temp) and ls_temp = "2000")
			
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Margin.right=250")
			ls_temp = dw_1.describe( "Datawindow.Print.Margin.right")
			ls_result += wf_result_add(ls_item, "3. Set Original ", not isnull(ls_temp) and ls_temp = "250")	
		case lower("Print.Margin.top")
			//获取原始值
			ls_temp = dw_1.describe( "Datawindow.Print.Margin.top")
			ls_result += wf_result_add(ls_item, "1. Get Original ", not isnull(ls_temp) and ls_temp = "250")
						
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Margin.top=4500")
			ls_temp = dw_1.describe( "Datawindow.Print.Margin.top")
			ls_result += wf_result_add(ls_item, "2. Set  ", not isnull(ls_temp) and ls_temp = "4500")
			
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Margin.top=250")
			ls_temp = dw_1.describe( "Datawindow.Print.Margin.top")
			ls_result += wf_result_add(ls_item, "3. Set Original ", not isnull(ls_temp) and ls_temp = "250")				
		case lower("Print.Margin.bottom")
			//获取原始值
			ls_temp = dw_1.describe( "Datawindow.Print.Margin.bottom")
			ls_result += wf_result_add(ls_item, "1. Get Original ", not isnull(ls_temp) and ls_temp = "250")
						
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Margin.bottom=5600")
			ls_temp = dw_1.describe( "Datawindow.Print.Margin.bottom")
			ls_result += wf_result_add(ls_item, "2. Set  ", not isnull(ls_temp) and ls_temp = "5600")
			
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Margin.bottom=250")
			ls_temp = dw_1.describe( "Datawindow.Print.Margin.bottom")
			ls_result += wf_result_add(ls_item, "3. Set Original ", not isnull(ls_temp) and ls_temp = "250")				
		case lower("Print.Paper.source")
			//获取原始值
			ls_temp = dw_1.describe( "Datawindow.Print.paper.source")
			ls_result += wf_result_add(ls_item, "1. Get Original ", not isnull(ls_temp) and ls_temp = "0")
						
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.paper.source=15")
			ls_temp = dw_1.describe( "Datawindow.Print.paper.source")
			ls_result += wf_result_add(ls_item, "2. Set  ", not isnull(ls_temp) and ls_temp = "15")
			
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.paper.source=0")
			ls_temp = dw_1.describe( "Datawindow.Print.paper.source")
			ls_result += wf_result_add(ls_item, "3. Set Original ", not isnull(ls_temp) and ls_temp = "0")		
		case lower("Print.Paper.size")
			//获取原始值
			ls_temp = dw_1.describe( "Datawindow.Print.paper.size")
			ls_result += wf_result_add(ls_item, "1. Get Original ", not isnull(ls_temp) and ls_temp = "0")
						
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.paper.size=9")
			ls_temp = dw_1.describe( "Datawindow.Print.paper.size")
			ls_result += wf_result_add(ls_item, "2. Set A4 ", not isnull(ls_temp) and ls_temp = "9")
			
			ls_temp = dw_1.Modify( "Datawindow.Print.paper.size=8")
			ls_temp = dw_1.describe( "Datawindow.Print.paper.size")
			ls_result += wf_result_add(ls_item, "3. Set A3 ", not isnull(ls_temp) and ls_temp = "8")
			
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.paper.size=0")
			ls_temp = dw_1.describe( "Datawindow.Print.paper.size")
			ls_result += wf_result_add(ls_item, "4. Set Original ", not isnull(ls_temp) and ls_temp = "0")					
		case lower("Print.Prompt")	
			//获取原始值
			ls_temp = dw_1.describe( "Datawindow.Print.Prompt")
			ls_result += wf_result_add(ls_item, "1. Get Original ", not isnull(ls_temp) and ls_temp = "no")
						
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Prompt=yes")
			ls_temp = dw_1.describe( "Datawindow.Print.Prompt")
			ls_result += wf_result_add(ls_item, "2. Set  ", not isnull(ls_temp) and ls_temp = "yes")
			
			//动态修改
			ls_temp = dw_1.Modify( "Datawindow.Print.Prompt=no")
			ls_temp = dw_1.describe( "Datawindow.Print.Prompt")
			ls_result += wf_result_add(ls_item, "3. Set Original ", not isnull(ls_temp) and ls_temp = "no")				
	end choose 
next 

//gf_returnresult(ls_result)
is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module1 ();dw_1.dataobject= 'd_richtext_datawindow1'
dw_1.settransobject( sqlca)

dw_1.retrieve( )

string ls_array[], ls_item, ls_result, ls_temp, ls_default_dataobject
long	ll_bound, i , ll_tmp

//ls_china   = "正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，其申请的多项发明专利，解决了互联网软件的局限性，这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。"
//ls_english = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'			

is_log = ''
ls_result = ''
ll_bound =0 
//RichText.property DataWindow object event
ls_array[Upperbound(ls_array) + 1 ] = "RichTextCurrentStyleChanged"		//button 4 test again
ls_array[Upperbound(ls_array) + 1 ] = "RichTextLoseFocus"					//button 4 test again
ls_array[Upperbound(ls_array) + 1 ] = "RichTextLimitError"						//button 4 test again
ls_array[Upperbound(ls_array) + 1 ] = "buttonclicked"			
ls_array[Upperbound(ls_array) + 1 ] = "error"										//
ls_array[Upperbound(ls_array) + 1 ] = "Resize"
ls_array[Upperbound(ls_array) + 1 ] = "ScrollHorizontal"						
ls_array[Upperbound(ls_array) + 1 ] = "ScrollVertical"
ls_array[Upperbound(ls_array) + 1 ] = "WSError"

 
 
ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	ls_item = ls_array[i]
	is_log = ''
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")
	choose case lower(ls_item)
		case lower('RichTextCurrentStyleChanged')
			dw_1.event richtextcurrentstylechanged( dw_1.getrow(),  dw_1.object.names)
			if not isnull(is_log) and pos(lower(is_log), lower('RichTextCurrentStyleChanged')) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if 	
		case lower('RichTextLoseFocus')
			dw_1.event richtextlosefocus( dw_1.getrow() ,dw_1.Object.names )
			if not isnull(is_log) and pos(lower(is_log), lower('richtextlosefocus')) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if 	
		case lower('RichTextLimitError')
			//trigger for default
			dw_1.event richtextlimiterror(dw_1.getrow() , dw_1.Object.names , '')
			if not isnull(is_log) and pos(lower(is_log), lower('richtextlimiterror')) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if 	
		case lower('buttonclicked')	
			dw_1.event buttonclicked( dw_1.getrow() , 0, dw_1.Object.names)
			if not isnull(is_log)  and pos(lower(is_log), lower('buttonclicked')) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("error")
			exceptionaction			action
			any						returnvalue
			dw_1.event error( 1001, "test case", "richtext datawindow", "richtext", "event error",1, action,returnvalue)
			if not isnull(is_log)  and pos(lower(is_log), lower( "error: errornumber :1001 errortext=test case")) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("Resize")	
			dw_1.event resize( 1, 10, 10)			
			if not isnull(is_log)  and pos(lower(is_log), lower('resize: sizetype:1 newwidth=10 newheight:10')) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if
			
			is_log = ""
			dw_1.event resize( 2, 2715, 1636)
			if not isnull(is_log)  and pos(lower(is_log), lower('resize: sizetype:2 newwidth=2715 newheight:1636')) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if
			
			is_log = ""
			dw_1.event resize( 0, 1751, 1144)
 			if not isnull(is_log)  and pos(lower(is_log), lower('resize: sizetype:0 newwidth=1751 newheight:1144')) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("ScrollHorizontal")	
			dw_1.event scrollhorizontal( 100, 1)
			if not isnull(is_log)  and pos(lower(is_log), lower('scrollhorizontal: scrollpos:100 pane=1')) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("ScrollVertical")				
			dw_1.event scrollvertical( 200)
			if not isnull(is_log)  and pos(lower(is_log), lower('scrollvertical: scrollpos:200')) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("WSError")	
			dw_1.event wserror( "Update", 3, "Primary", "WSDL file", "invoked_webservice","exception message")
			if not isnull(is_log)  and pos(lower(is_log), lower('wserror: rownum :3 errormessage=exception message')) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" event "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if
	end choose 
next 

//gf_returnresult(ls_result)
is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module2 ();dw_1.dataobject= 'd_richtext_datawindow1'
dw_1.settransobject( sqlca)

dw_1.retrieve( )

string ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_default_dataobject, ls_null
long	ll_bound, i , ll_tmp, ll_null, ll_position
long 	ll_startline, ll_startchar, ll_endline, ll_endchar
string ls_path, ls_file, ls_fullname
integer li_rtn
Band			lb_Band
FileType 		lft_type
boolean		lbn_flag

string ls_china,ls_english


ls_china   = "正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，其申请的多项发明专利，解决了互联网软件的局限性，这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。"
ls_english = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'			
is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

//RichText.property DataWindow object event
ls_array[Upperbound(ls_array) + 1 ] = "clearall"
ls_array[Upperbound(ls_array) + 1 ] = "Paste"
ls_array[Upperbound(ls_array) + 1 ] = "Cut"
ls_array[Upperbound(ls_array) + 1 ] = "copy"
ls_array[Upperbound(ls_array) + 1 ] = "PasteRTF"			//?   crumble		//
ls_array[Upperbound(ls_array) + 1 ] = "copyrtf"				//APB 在IE下调试崩溃  	
ls_array[Upperbound(ls_array) + 1 ] = "SelectTextAll"
ls_array[Upperbound(ls_array) + 1 ] = "SelectText"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedText"
ls_array[Upperbound(ls_array) + 1 ] = "SelectTextLine"
ls_array[Upperbound(ls_array) + 1 ] = "SelectTextWord"

ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	Yield ( )
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")
	is_log = ''
	ls_temp = ''
	choose case lower(ls_item)
		case lower('clearall')
			ll_tmp = dw_1.clearall( )
			if not isnull(ll_tmp) and ll_tmp > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ll_tmp = dw_1.clearall( )
			if not isnull(ll_tmp) and ll_tmp = 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".empty = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".empty = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower('Paste')
			Clipboard('')
			ll_tmp = dw_1.paste( )
			if not isnull(ll_tmp) and ll_tmp = 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".empty = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".empty = "+String ( "Fail!" ) +"~r~n"
			end if 

			ls_temp2 ="About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			Clipboard(ls_temp2)
			ll_tmp = dw_1.paste( )
			if not isnull(ll_tmp) and ll_tmp > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 			
			
			//paste detail 
			ll_tmp = dw_1.clearall( )
			ll_tmp = dw_1.SelectText(1,1,0,0,Detail!)		
			ls_temp2 ="About this Appeon for PowerBuilder Help: ~r~nThis HTML help contains the HTML version of several Appeon 3.0 user documents: ~r~nWorking with Appeon Developer is the HTML version of the Appeon Developer User Guide; ~r~nAppeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; ~r~nAppeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			Clipboard(ls_temp2)
			ll_tmp = dw_1.paste( )
			Clipboard('')			
			dw_1.SelectTextAll( Detail!)			
			dw_1.copy( )
			ls_temp = Clipboard()
			if not isnull(ll_tmp) and ll_tmp > 0 and  not isnull(ls_temp) and ls_temp = ls_temp2 then     
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Detail = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Detail  = "+String ( "Fail!" ) +"~r~n"
			end if 
			//paste header
			ll_tmp = dw_1.clearall( )
			ll_tmp = dw_1.SelectText(1,1,0,0,Header!)		
			ls_temp2 ="About this Appeon for PowerBuilder Help: ~r~nThis HTML help contains the HTML version of several Appeon 3.0 user documents: ~r~nWorking with Appeon Developer is the HTML version of the Appeon Developer User Guide; ~r~nAppeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; ~r~nAppeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			Clipboard(ls_temp2)
			ll_tmp = dw_1.paste( )
			Clipboard('')			
			dw_1.SelectTextAll( Header!)			
			dw_1.copy( )
			ls_temp = Clipboard()
			if not isnull(ll_tmp) and ll_tmp > 0 and  not isnull(ls_temp) and ls_temp = ls_temp2 then     
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Header = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Header  = "+String ( "Fail!" ) +"~r~n"
			end if 
			//paste footer
			ll_tmp = dw_1.clearall( )
			ll_tmp = dw_1.SelectText(1,1,0,0,Footer!)		
			ls_temp2 ="About this Appeon for PowerBuilder Help: ~r~nThis HTML help contains the HTML version of several Appeon 3.0 user documents: ~r~nWorking with Appeon Developer is the HTML version of the Appeon Developer User Guide; ~r~nAppeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; ~r~nAppeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			Clipboard(ls_temp2)
			ll_tmp = dw_1.paste( )
			Clipboard('')			
			dw_1.SelectTextAll( Footer!)			
			dw_1.copy( )
			ls_temp = Clipboard()
			if not isnull(ll_tmp) and ll_tmp > 0 and  not isnull(ls_temp) and ls_temp = ls_temp2 then     
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Footer = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Footer  = "+String ( "Fail!" ) +"~r~n"
			end if 
			
		case lower('Cut')
			dw_1.clear()
			dw_1.dataobject= 'd_richtext_datawindow1'
			dw_1.settransobject( sqlca)
			dw_1.reset( )
			dw_1.retrieve( )
//			Clipboard('')
//			ll_tmp = dw_1.paste( )
			ll_tmp = dw_1.cut( )
			if not isnull(ll_tmp) and ll_tmp = 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".empty = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".empty = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp2 = "About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon."
			ll_tmp = dw_1.clearall( )
			Clipboard(ls_temp2)
			ll_tmp = dw_1.paste( )			
			ll_tmp = dw_1.SelectTextAll( )			
			ll_tmp = dw_1.cut( )
			ls_temp = Clipboard()
	 		if not isnull(ls_temp) and ls_temp = ls_temp2 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			//paste detail 
			ll_tmp = dw_1.SelectTextAll(Detail!)
			ll_tmp = dw_1.clear( )
			ll_tmp = dw_1.SelectText(1,1,0,0,Detail!)		
			ls_temp2 ="About this Appeon for PowerBuilder Help: ~r~nThis HTML help contains the HTML version of several Appeon 3.0 user documents: ~r~nWorking with Appeon Developer is the HTML version of the Appeon Developer User Guide; ~r~nAppeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; ~r~nAppeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			Clipboard(ls_temp2)
			ll_tmp = dw_1.paste( )
			Clipboard('')			
			ll_tmp = dw_1.SelectTextAll( Detail!)			
			ll_tmp = dw_1.cut( )
			ls_temp = Clipboard()
			if not isnull(ll_tmp) and ll_tmp > 0 and  not isnull(ls_temp) and ls_temp = ls_temp2 then     
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Detail = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Detail  = "+String ( "Fail!" ) +"~r~n"
			end if 				
			//paste header
			ll_tmp = dw_1.SelectTextAll(Header!)
			ll_tmp = dw_1.clear( )
			ll_tmp = dw_1.SelectText(1,1,0,0,Header!)		
			ls_temp2 ="About this Appeon for PowerBuilder Help: ~r~nThis HTML help contains the HTML version of several Appeon 3.0 user documents: ~r~nWorking with Appeon Developer is the HTML version of the Appeon Developer User Guide; ~r~nAppeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; ~r~nAppeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			Clipboard(ls_temp2)
			ll_tmp = dw_1.paste( )
			Clipboard('')			
			dw_1.SelectTextAll( Header!)			
			ll_tmp = dw_1.cut( )
			ls_temp = Clipboard()
			if not isnull(ll_tmp) and ll_tmp > 0 and  not isnull(ls_temp) and ls_temp = ls_temp2 then     
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Header = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Header  = "+String ( "Fail!" ) +"~r~n"
			end if 
			//paste footer
			ll_tmp = dw_1.SelectTextAll(Footer!)
			ll_tmp = dw_1.clear( )
			ll_tmp = dw_1.SelectText(1,1,0,0,Footer!)		
			ls_temp2 ="About this Appeon for PowerBuilder Help: ~r~nThis HTML help contains the HTML version of several Appeon 3.0 user documents: ~r~nWorking with Appeon Developer is the HTML version of the Appeon Developer User Guide; ~r~nAppeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; ~r~nAppeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			Clipboard(ls_temp2)
			ll_tmp = dw_1.paste( )
			Clipboard('')			
			dw_1.SelectTextAll( Footer!)			
			ll_tmp = dw_1.cut( )
			ls_temp = Clipboard()
			if not isnull(ll_tmp) and ll_tmp > 0 and  not isnull(ls_temp) and ls_temp = ls_temp2 then     
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Footer = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Footer  = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower('copy')
			Clipboard('')
			ll_tmp = dw_1.clearall( )
			ll_tmp = dw_1.copy( )
			ls_temp = Clipboard()
			if not isnull(ll_tmp) and ll_tmp = 0 and ls_temp = ''  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".empty = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".empty = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp2 = "正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，其申请的多项发明专利，解决了互联网软件的局限性，这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。"
			ll_tmp = dw_1.SelectTextAll( )	
			Clipboard(ls_temp2)
			ll_tmp = dw_1.paste( )	
			Clipboard('')
			ll_tmp = dw_1.SelectTextAll( )			
			ll_tmp = dw_1.copy( )
			ls_temp = Clipboard()
			if not isnull(ls_temp) and ls_temp = ls_temp2 and not isnull(ll_tmp) and ll_tmp > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 			
						
			Clipboard('')			
			ll_tmp = dw_1.SelectText(1,1,0,0,Detail!)		
			ls_temp2 = 'appeon@^#$*&^@#$*^@*#$^%^@*&&%^abcde软件'
			Clipboard(ls_temp2)
			ll_tmp = dw_1.paste( )				
			Clipboard('')			
			ll_tmp = dw_1.SelectText(1,7,1,38,Detail!)		
			ll_tmp = dw_1.copy( )
			ls_temp = Clipboard()
			if not isnull(ll_tmp) and   ll_tmp > 0 and not isnull(ls_temp) and ls_temp ='@^#$*&^@#$*^@*#$^%^@*&&%^abcde软件'   then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " special character = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " special character = "+String ( "Fail!" ) +"~r~n"
			end if 		
 
		case lower('PasteRTF')
			dw_1.clear()
			dw_1.dataobject= 'd_richtext_datawindow1'
			dw_1.settransobject( sqlca)
			dw_1.reset( )
			dw_1.retrieve( )
			//PasteRTF，richtextstring为NULL
			ll_tmp = dw_1.PasteRTF(ls_null)
			if   isnull(ll_tmp)   then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".null = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".null = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp2 = '正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，其申请的多项发明专利，解决了互联网软件的局限性，这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。'
			setnull(lb_Band)
			ll_tmp = dw_1.PasteRTF(ls_temp2,lb_Band)
			if   isnull(ll_tmp)   then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".null2 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".null2 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			//empty string
			ls_temp2= ''	
			Clipboard(ls_temp2)
			ll_tmp = dw_1.SelectText( 1,1,0,0)
			ll_tmp = dw_1.PasteRTF(ls_temp2)
			if not isnull(ll_tmp) and ll_tmp < 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".empty = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".empty = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp2 = 'I am a student'
			Clipboard('')
			ll_tmp = dw_1.SelectText( 1,1,0,0)
			ll_tmp = dw_1.PasteRTF(ls_temp2)
			if not isnull(ll_tmp) and ll_tmp < 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".empty = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".empty = "+String ( "Fail!" ) +"~r~n"
			end if 
						
			dw_1.selecttextall( )
			ls_temp2 =dw_1.copyrtf()
			clipboard(ls_temp2)
			//ll_tmp = dw_1.SelectText( 1,1,0,0)
			ll_tmp = dw_1.PasteRTF(ls_temp2)
			if not isnull(ll_tmp) and ll_tmp > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".normal0 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".normal0 = "+String ( "Fail!" ) +"~r~n"
			end if 

//			ls_temp2 = dw_1.describe("DataWindow.Detail.Text")				//该测试点崩溃
//			ll_tmp = dw_1.SelectText(1,1,0,0,Detail!)		
			ll_tmp = dw_1.PasteRTF(ls_temp2, Detail!)
			if not isnull(ll_tmp) and ll_tmp > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Detail = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Detail = "+String ( "Fail!" ) +"~r~n"
			end if 
				
//			ls_temp2 = dw_1.describe("DataWindow.Detail.Text")				//该测试点崩溃
//			ll_tmp = dw_1.SelectText(1,1,0,0,Header!)	
			ll_tmp = dw_1.PasteRTF(ls_temp2, Header!)
			if not isnull(ll_tmp) and ll_tmp > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Header = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Header = "+String ( "Fail!" ) +"~r~n"
			end if 
			
//			ls_temp2 = dw_1.describe("DataWindow.Detail.Text")				//该测试点崩溃
//			ll_tmp = dw_1.SelectText(1,1,0,0,Footer!)		
			ll_tmp = dw_1.PasteRTF(ls_temp2, Footer!)
			if not isnull(ll_tmp) and ll_tmp > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Footer = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".Footer = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower('copyrtf')			
			//reset
			dw_1.clear()
			dw_1.dataobject= 'd_richtext_datawindow1'
			dw_1.settransobject( sqlca)
			dw_1.reset( )
			dw_1.retrieve( )
			
			dw_1.selecttextall( )
			ls_temp =dw_1.copyrtf()
			if not isnull(ls_temp) and ls_temp <> '' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".copyrtf = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".copyrtf = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			ls_temp2 =dw_1.copyrtf(true)
			if not isnull(ls_temp) and not isnull(ls_temp2) and ls_temp <> '' and ls_temp = ls_temp2 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".copyrtf(true) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".copyrtf(true) = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			ls_temp =dw_1.copyrtf(false)
			if not isnull(ls_temp) and ls_temp <> '' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".copyrtf(false) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".copyrtf(false) = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			ls_temp =dw_1.copyrtf(false,Detail!)
			if not isnull(ls_temp) and ls_temp <> '' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".copyrtf(false,Detail!) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".copyrtf(false,Detail!)= "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			ls_temp =dw_1.copyrtf(false,Header!)
			if not isnull(ls_temp) and ls_temp <> '' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".copyrtf(false,Header!) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".copyrtf(false,Header!) = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			ls_temp =dw_1.copyrtf(false,Footer!)
			if not isnull(ls_temp) and ls_temp <> '' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".copyrtf(false,Footer!) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ ".copyrtf(false,Footer!) = "+String ( "Fail!" ) +"~r~n"
			end if 	
		case lower('SelectTextAll')			
			//reset
			dw_1.clear()
			dw_1.dataobject= 'd_richtext_datawindow1'
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )
			
			Clipboard('')
			ll_tmp = dw_1.SelectTextAll( )
			if not isnull(ll_tmp) and ll_tmp > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			Clipboard('')
			ll_tmp = dw_1.SelectTextAll(Detail! )
			if not isnull(ll_tmp) and ll_tmp > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail = "+String ( "Fail!" ) +"~r~n"
			end if
			
			Clipboard('')
			ll_tmp = dw_1.SelectTextAll(Header! )
			if not isnull(ll_tmp) and ll_tmp > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header = "+String ( "Fail!" ) +"~r~n"
			end if
			
			Clipboard('')
			ll_tmp = dw_1.SelectTextAll(Footer! )
			if not isnull(ll_tmp) and ll_tmp > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Footer = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Footer = "+String ( "Fail!" ) +"~r~n"
			end if
			
			Clipboard('')
			ll_tmp = dw_1.clearall( )
			ll_tmp = dw_1.SelectTextAll( )
			if not isnull(ll_tmp) and ll_tmp = 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
			
			Clipboard('')
			ll_tmp = dw_1.SelectTextAll(Detail! )
			if not isnull(ll_tmp) and ll_tmp = 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no Detail = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no Detail = "+String ( "Fail!" ) +"~r~n"
			end if
			
			Clipboard('')
			ll_tmp = dw_1.SelectTextAll(Header! )
			if not isnull(ll_tmp) and ll_tmp = 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no Header = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no Header = "+String ( "Fail!" ) +"~r~n"
			end if
			
			Clipboard('')
			ll_tmp = dw_1.SelectTextAll(Footer! )
			if not isnull(ll_tmp) and ll_tmp = 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no Footer = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no Footer = "+String ( "Fail!" ) +"~r~n"
			end if
						
		case lower('SelectText')		
			//reset
			dw_1.clear()
			dw_1.dataobject= 'd_richtext_datawindow1'
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )
			
			ll_tmp = dw_1.clearall( )
			ls_temp2 = "About this Appeon for PowerBuilder Help: ~r~nThis HTML help contains the HTML version of several Appeon 3.0 user documents: ~r~nWorking with Appeon Developer is the HTML version of the Appeon Developer User Guide; ~r~nAppeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; ~r~nAppeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon."
			Clipboard(ls_temp2)		
			dw_1.paste( )
			Clipboard('')
			ll_tmp = dw_1.SelectText( 2,6,2,14)
			dw_1.copy( )
			ls_temp = Clipboard()
			if not isnull(ls_temp) and  ls_temp = "HTML help" then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " normal = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " normal = "+String ( "Fail!" ) +"~r~n"
			end if 		
			
			//SelectText，fromline=NULL
			Clipboard('')			
			ls_temp = ''
			ll_tmp = dw_1.SelectText( ll_null,6,2,14)
			if isnull(ll_tmp)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " fromline =NULL = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " fromline =NULL = "+String ( "Fail!" ) +"~r~n"
			end if
						
			//SelectText，fromchar=NULL
			Clipboard('')			
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 2,ll_null,2,14)
	 		if isnull(ll_tmp)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " fromchar =NULL = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " fromchar =NULL = "+String ( "Fail!" ) +"~r~n"
			end if
			
			//SelectText，toline=NULL
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 2,6,ll_null,14)
		 	if isnull(ll_tmp)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " toline =NULL = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " toline =NULL = "+String ( "Fail!" ) +"~r~n"
			end if
			
			//SelectText，tochar=NULL
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 2,6,2,ll_null)
			if isnull(ll_tmp)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " tochar =NULL = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " tochar =NULL = "+String ( "Fail!" ) +"~r~n"
			end if
			
			//SelectText，band=NULL
			setnull(lb_Band)
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 2,6,2,14,lb_Band)
			if isnull(ll_tmp)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " band =NULL = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " band =NULL = "+String ( "Fail!" ) +"~r~n"
			end if
									
			//SelectText，定位插入点，Toline、tochar指定为0,其他参数有效，带4个参数调用函数
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 2,6,0,0)
			//To specify an insertion point, set toline and tochar to 0.
			Clipboard('mark,')
			dw_1.paste( )
			Clipboard('')
			ll_tmp = dw_1.SelectText( 2,6,2,14)
			dw_1.copy( )
			ls_temp = Clipboard()
			if not isnull(ls_temp) and  ls_temp = "mark,HTML" then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " 0.0 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " 0.0 = "+String ( "Fail!" ) +"~r~n"
			end if 				
			
			//SelectText，从前往后选择多行数据
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 2,1, 3,73)				//91
			dw_1.copy( )
			ls_temp = Clipboard()
			//line1 : About this Appeon for PowerBuilder Help: ~r~n
			ls_temp2 = "This mark,HTML help contains the HTML version of several Appeon 3.0 user documents: ~r~nWorking with Appeon Developer is the HTML version of the Appeon Developer"			//	" User Guide; ~r~n"
			if not isnull(ls_temp) and  ls_temp = ls_temp2 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " fromtomultirow = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " fromtomultirow = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			//SelectText，从后往前选择多行数据
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 3,1, 2,20)			//84+2 = 86 
			dw_1.copy( )
			ls_temp = Clipboard()
			//line1 : About this Appeon for PowerBuilder Help: ~r~n
			ls_temp2 = " contains the HTML version of several Appeon 3.0 user documents: ~r~nW"
			if not isnull(ls_temp) and  ls_temp = ls_temp2 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " tofrommultirow = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " tofrommultirow = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			//SelectText，在一行内选择，tochar列位置超出了当前列的范围
			// If toline and tochar are before fromline and fromchar, then the insertion point is at the beginning of the selection
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 2,11, 2,999)			//84+2 = 86 
			dw_1.copy( )
			ls_temp = Clipboard()
			ls_temp2 = "HTML help contains the HTML version of several Appeon 3.0 user documents: ~r~n"
			if not isnull(ls_temp) and  ls_temp = ls_temp2 then 			//TE AND TX control have difference values.
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " onerow_overtochar = "+String ( "Success!" ) +"~r~n"
			else
				if not isnull(ls_temp) and  ls_temp+"~r~n" = ls_temp2 then
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " onerow_overtochar = (difference values: lost enter sympol [-r-n]) = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " onerow_overtochar = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			//SelectText，选择多行，tochar列位置超出了当前列的范围
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 2,11, 3,999)			//91
			dw_1.copy( )
			ls_temp = Clipboard()
			ls_temp2 = "HTML help contains the HTML version of several Appeon 3.0 user documents: ~r~nWorking with Appeon Developer is the HTML version of the Appeon Developer User Guide; ~r~n"
			if not isnull(ls_temp) and  ls_temp = ls_temp2 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " multirow_overtochar = "+String ( "Success!" ) +"~r~n"
			else
				if not isnull(ls_temp) and  ls_temp+"~r~n" = ls_temp2 then
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " multirow_overtochar = (difference values: lost enter sympol [-r-n]) = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " multirow_overtochar = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			//SelectText，4个参数为无效值
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( ll_null,ll_null, ll_null,ll_null)			//91
			if isnull(ll_tmp)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " four arguments null = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " four arguments null = "+String ( "Fail!" ) +"~r~n"
			end if 
						
			//reset
			dw_1.clear()
			dw_1.dataobject= 'd_richtext_datawindow1'
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )			
			//SelectText，band为Detail!			
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 1,1, 2,999, Detail!)			//91
			dw_1.copy( )
			ls_temp = Clipboard()
			ls_temp2= "Names: richtexttest1~r~nNumbers: 10~r~n"
			if not isnull(ll_tmp) and ll_tmp > 0 and not isnull(ls_temp) and ls_temp = ls_temp2  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail = "+String ( "Success!" ) +"~r~n"
			else
				if not isnull(ll_tmp) and ll_tmp > 0 and not isnull(ls_temp) and ls_temp+"~r~n" = ls_temp2 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail = (difference values: lost enter sympol [-r-n]) = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			//SelectText，band为Header!
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 1,1, 2,999, Header!)			//91
			dw_1.copy( )
			ls_temp = Clipboard()
			ls_temp2= "richtexttest1~r~nPage 1 of 2"
			if not isnull(ll_tmp) and ll_tmp > 0 and not isnull(ls_temp) and ls_temp = ls_temp2  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			//SelectText，band为Footer!
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 1,1, 2,999, Footer!)			//91
			dw_1.copy( )
			ls_temp = Clipboard()
			ls_temp2= "Page 1 of 2"
			if not isnull(ll_tmp) and ll_tmp > 0 and not isnull(ls_temp) and ls_temp = ls_temp2  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Footer = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Footer = "+String ( "Fail!" ) +"~r~n"
			end if 
			
		case lower('SelectedText')			
			//reset
			dw_1.clear()
			dw_1.dataobject= 'd_richtext_datawindow1'
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )
			
			Clipboard('')
			ls_temp = ''
			ls_temp =dw_1.selectedtext( )
			if not isnull(ls_temp) and  ls_temp = "" then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " empty = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " empty = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 1,1, 2,999, Header!)			//91
			ls_temp = dw_1.selectedtext( )			//91
			//TX and TE  difference result 
			if not isnull(ls_temp) and  ls_temp = "richtexttest1~nPage 1 of 2" then 	
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header english = "+String ( "Success!" ) +"~r~n"
			else
				if not isnull(ls_temp) and ls_temp = "richtexttest1"+char(13)+char(10)+"Page 1 of 2" then
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header english = (difference values: lost line breaks sympol [-n]) = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header english = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			Clipboard('')
			ll_tmp = dw_1.SelectText( 2,999, 0,0, Header!)			
			ls_temp   = "~r~n正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，其申请的多项发明专利，解决了互联网软件的局限性，这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。"
			Clipboard(ls_temp)
			dw_1.paste( )
			ll_tmp = dw_1.SelectText( 3,1, 3,26, Header!)		
			ls_temp = ''
			Clipboard('')
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and  ls_temp = "正阳软件是一家专门从事研发和营销企业级软件产品的公司" then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header chinese = "+String ( "Success!" ) +"~r~n"
			else
				if not isnull(ls_temp) and ls_temp =char(13)+char(10)+"正阳软件是一家专门从事研发和营销企业级软件产品的公司" then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header chinese = (difference values: not equal enter sympol [-r-n]) = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header chinese = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			//Detail
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 1,1, 1,20, Detail!)			//91
			ls_temp = dw_1.selectedtext( )			//91
			if not isnull(ls_temp) and  ls_temp = "Names: richtexttest1" then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail english = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail english = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			Clipboard('')
			ll_tmp = dw_1.SelectText( 5,999, 0,0, Detail!)			
			ls_temp   = "~r~n正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。~r~n正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，~r~n其申请的多项发明专利，解决了互联网软件的局限性，~r~n这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。~r~n"
			Clipboard(ls_temp)
			dw_1.paste( )
			ll_tmp = dw_1.SelectText( 6,1, 6,26, Detail!)		
			ls_temp = ''
			Clipboard('')
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and  ls_temp = "正阳软件是一家专门从事研发和营销企业级软件产品的公司" then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail chinese = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail chinese = "+String ( "Fail!" ) +"~r~n"
			end if 
			//Footer
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 1,1, 1,11, Footer!)			//91
			ls_temp = dw_1.selectedtext( )			//91
			if not isnull(ls_temp) and  ls_temp = "Page 1 of 2" then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Footer english = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Footer english = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			Clipboard('')
			ll_tmp = dw_1.SelectText( 1,999, 0,0, Footer!)			
			ls_temp   = "~r~n正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，其申请的多项发明专利，解决了互联网软件的局限性，这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。"
			Clipboard(ls_temp)
			dw_1.paste( )
			ll_tmp = dw_1.SelectText( 2,1, 2,26, Footer!)		
			ls_temp = ''
			Clipboard('')
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and  ls_temp = "正阳软件是一家专门从事研发和营销企业级软件产品的公司" then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Footer chinese = "+String ( "Success!" ) +"~r~n"
			else
				if not isnull(ls_temp) and ls_temp =char(13)+char(10)+"正阳软件是一家专门从事研发和营销企业级软件产品的公司" then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Footer chinese = (difference values: not equal enter sympol [-r-n]) = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Footer chinese = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			//select picture
			ls_path =gs_cachedir
			ls_file = "rtdwfuncspw03_rtf03_table.rtf"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf03_table.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf03_table.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
						
			Clipboard('')
			ll_tmp = dw_1.SelectText( 10,1, 0,0, Detail!)			
 			li_rtn = dw_1.InsertDocument(ls_fullname,  true, FileTypeRichText!)
			ls_temp = ""
			Clipboard('')
		 	ll_tmp = dw_1.SelectText( 10,1, dw_1.linecount( ),999, Detail!)			
			ls_temp = dw_1.SelectedText( )
			dw_1.copy( )
			if not isnull(ll_tmp) and ll_tmp > 0 and not isnull(ls_temp) and  ls_temp <> "" then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " selected picture = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " selected picture = "+String ( "Fail!" ) +"~r~n"
			end if 
		
		case lower('SelectTextLine')	
			dw_1.dbcancel( )
			dw_1.reset( )		
			dw_1.clear()				//import  it
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectTextLine()
			if not isnull(ll_tmp) and ll_tmp = 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " empty = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " empty = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			//InputField column
			dw_1.clear()
			dw_1.dataobject= 'd_richtext_datawindow1'
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 1,1, 1,999, Detail!)			//91
			ls_temp = dw_1.selectedtext( )			//91
			ll_tmp = dw_1.SelectTextLine()
			if not isnull(ls_temp) and  ls_temp = "Names: richtexttest1~n" and not isnull(ll_tmp) and ll_tmp  +1 = len(ls_temp)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " column = "+String ( "Success!" ) +"~r~n"
			else
				if not isnull(ls_temp) and  ls_temp = "Names: richtexttest1" and not isnull(ll_tmp) and ll_tmp = len(ls_temp)  then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " column = (difference values: lose line breaks sympol [-n]) = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " column = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			//picture
			ls_path = gs_cachedir			
			ls_file = "rtdwfuncspw03_rtf03_table.rtf"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf03_table.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf03_table.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
						
			Clipboard('')
			ll_tmp = dw_1.SelectText( 10,1, 0,0, Detail!)			
 			li_rtn = dw_1.InsertDocument(ls_fullname,  true, FileTypeRichText!)
			ls_temp = ""
			Clipboard('')
			ll_tmp = dw_1.SelectText( 17,1,17,9999, Detail!)							//picture row.
			ls_temp = dw_1.SelectedText( )
			ll_tmp = dw_1.SelectTextLine()
			dw_1.copy( )
			if not isnull(ll_tmp) and ll_tmp > 0 and not isnull(ls_temp) and ll_tmp  = len(ls_temp) + 1  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " selected picture = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " selected picture = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			//chinese 
			ls_temp2   = "正阳软件是一家专门从事研发和营销企业级软件产品的公司，~r~n成立于美国硅谷，2001年12月在深圳建立研发中心。~r~n正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，~r~n其申请的多项发明专利，解决了互联网软件的局限性，~r~n这些技术发明对企业开发与应用互联网软件产生深远的影响，~r~n也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。~r~n"
			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 1,1, 0,0, Header!)			
			Clipboard(ls_temp2)
			dw_1.paste( )

			Clipboard('')
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 3,1, 3,9999, Header!)			
			ls_temp = dw_1.SelectedText( )				// must be in the from SelectTextLine() 
			ll_tmp = dw_1.SelectTextLine()
			if not isnull(ll_tmp) and ll_tmp > 0 and not isnull(ls_temp) and ll_tmp  +1 = len(ls_temp)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " chinese = "+String ( "Success!" ) +"~r~n"
			else
				if not isnull(ll_tmp) and ll_tmp > 0 and not isnull(ls_temp) and ll_tmp = len(ls_temp)  then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " chinese = (difference values: lost enter sympol [-r-n]) = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " chinese = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
		case lower('SelectTextWord')
			Clipboard('')
			ls_temp = ''
			dw_1.SelectText(1,1, 0,0, Detail!)			
			//TE AND TX control have difference values.
			// when the ls_temp2 have a line length more than 90 size , then the line will type to the next line .
			// but not same type line in the PB 12.6.
			ls_temp2 = "rte_1.SelectTextWord() This example, selects the. word at! the insertion@ point. ~r~nIf there# is no word, it increments$ the" + &
						" position 15% until it^ finds a word. ~r~nIt checks& when it* reaches the( end of a line) and wraps to- the next+ line as| ~r~nit looks< for a word. If this> script" + &
						" is assigned? to a command~ button ~r~nand the button is~n clicked~r repeatedly, you step through the text word by word:"
			Clipboard(ls_temp2)
			dw_1.paste( )
			dw_1.SelectText(1,1, 1,36, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = ',' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [,] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [,] = "+String ( "Fail!" ) +"~r~n"
				end if 	
				Clipboard('')
				ls_temp  = ''
				dw_1.SelectText(1,28, 1,28, Detail!)	
				ls_temp = dw_1.SelectedText( )
				ls_temp = ''
				ll_tmp = dw_1.selecttextword( )
				dw_1.copy( )
				ls_temp = Clipboard()
				if not isnull(ll_tmp) and ll_tmp > 0 and  not isnull(ls_temp) and ls_temp = 'example' and len(ls_temp) = ll_tmp then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " normal word = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " normal word = "+String ( "Fail!" ) +"~r~n"
				end if 	
				
			end if 
 			
			 //.
			dw_1.SelectText(1,1, 1,49, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '.' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [.] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [.] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//!
			dw_1.SelectText(1,1, 1,58, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '!' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [!] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [!] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//@
			dw_1.SelectText(1,1, 1,73, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '@' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [@] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [@] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//#
			dw_1.SelectText(2,1, 2,9, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '#' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [#] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [#] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//$
			dw_1.SelectText(2,1, 2,36, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '$' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [$] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [$] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//%
			dw_1.SelectText(2,1, 2,53, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '%' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [%] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [%] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//^
			dw_1.SelectText(2,1, 2,63, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '^' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [^] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [^] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//&
			dw_1.SelectText(3,1, 3,10, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '&' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [&] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [&] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//*
			dw_1.SelectText(3,1, 3,19, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '*' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [*] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [*] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//(
			dw_1.SelectText(3,1, 3,32, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '(' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [(] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [(] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//)
			dw_1.SelectText(3,1, 3,47, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = ')' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [)] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [)] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//-
			dw_1.SelectText(3,1, 3,61, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '-' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [-] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [-] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//+
			dw_1.SelectText(3,1,3,71, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '+' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [+] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [+] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//|
			dw_1.SelectText(3,1, 3, 80, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '|' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [|] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [|] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//<
			dw_1.SelectText(4,1, 4,9, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '<' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [<] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [<] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//>
			dw_1.SelectText(4,1, 4,30, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '>' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [>] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [>] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//?
			dw_1.SelectText(4,1, 4,50, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '?' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [?] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [?] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//space
			dw_1.SelectText(4,1, 4,53, Detail!)	
			ls_temp = dw_1.SelectedText( )
			ll_tmp = dw_1.selecttextword( )
			dw_1.SelectText(4,53, 4,54, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = ' ' and len(ls_temp) > 0 then 
//				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [space] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [space] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 
			
			//~n
			dw_1.SelectText(5,1, 5,18, Detail!)	
			ls_temp = dw_1.SelectedText( )
			if not isnull(ls_temp) and right(ls_temp, 1) = '~n' and len(ls_temp) > 2  then 
				ll_tmp = dw_1.selecttextword( )
				if not isnull(ll_tmp) and ll_tmp = - 1 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [enter] = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " [enter] = "+String ( "Fail!" ) +"~r~n"
				end if 	
			end if 			
					
			//Maximum script size exceeded. 		//2100
	end choose 
next 

//gf_returnresult(ls_result)
is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module7 ();dw_2.dataobject= 'd_richtextdw_composite01'			//not same
dw_2.settransobject( sqlca)
dw_2.retrieve( )

string ls_array[], ls_item, ls_result, ls_temp, ls_default_dataobject, ls_temp2
long	ll_bound, i , ll_tmp, ll_find
string 	ls_path, ls_file, ls_fullname, ls_null
integer 	li_rtn
//ls_china   = "正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，其申请的多项发明专利，解决了互联网软件的局限性，这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。"
//ls_english = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'			

is_log = ''
ls_result = ''
ll_bound =0 
//RichText.property DataWindow object event
ls_array[Upperbound(ls_array) + 1 ] = "compositeReport"
ls_array[Upperbound(ls_array) + 1 ] = "DWCompute"	 
//ls_array[Upperbound(ls_array) + 1 ] = ""

 
ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")
	is_log = ''
	choose case lower(ls_item)
		case lower("compositeReport")							//该测试点 发现bug 
			is_type = "Composite Print Timer"
			timer(1)
			is_log = ""		
			ls_file = "rcdw_compositeReport_save_pdf1.pdf"													
			ls_path = gs_cachedir
			ls_fullname = ls_path+gs_dirseparator+ls_file
			li_rtn = dw_2.saveas(ls_fullname,PDF!, false)
			if not isnull(li_rtn) and li_rtn = 1 and  FileExists(ls_fullname)  then
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " PDF false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " PDF false = "+String ( "Fail!" ) +"~r~n"
			end if 
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)
		case lower('DWCompute')					
			//		【窗口对象】
			//		Compute A: visible="1" lineremove=no multiline=yes width.autosize=yes width="10000" alignment="1"
			//		Compute B:lineremove=yes multiline=yes width.autosize=no width="5000" alignment="0"
			//		Compute C:multiline=yes width.autosize=no width="5000" alignment="0"
			//		Compute D:visible="0" lineremove=no multiline=yes width.autosize=yes width="0" alignment="0"	
			dw_1.reset( )
			dw_1.clear()															//import  it
			dw_1.dataobject= 'd_w_rtdwocpefcw01_compute'
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )
			
			//	1.取Alignment静态属性			0 – (Default) Left 			1 – Right			2 – Center				3 – Justified
			ls_temp = ''
			ls_temp = dw_1.object.expression_2.alignment
			IF not isnull(ls_temp) and ls_temp = '0' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Alignment default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Alignment default = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ''
			ls_temp = dw_1.describe("expression_3.alignment")
			IF not isnull(ls_temp) and ls_temp = '1' then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Alignment Right = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Alignment Right = "+String ( "Fail!" ) +"~r~n"
			end if 			
			
//			测试动态设置multiline属性对Dw Compute的影响
//			1.获取Compute multiline静态属性
//			2.设置Compute multiline属性
			ls_temp = ''
			ls_temp = dw_1.object.expression_1.multiline
			IF not isnull(ls_temp) and ls_temp = 'no' then 					//modify  , this porperty default value always is no  in the PB 12.6.
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " MultiLine default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " MultiLine default = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ''
			ls_temp = dw_1.describe("expression_11.MultiLine")	
			IF not isnull(ls_temp) and ls_temp = 'no' then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " MultiLine opposite = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " MultiLine opposite = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.modify('expression_1.multiline=~'no~'')			
			ls_temp = ''
			ls_temp = dw_1.object.expression_1.MultiLine			
			IF not isnull(ls_temp) and ls_temp = 'no' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " MultiLine default changed = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " MultiLine default changed = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.object.expression_11.multiline = true
			ls_temp = ''
			ls_temp = dw_1.describe("expression_11.MultiLine")
			IF not isnull(ls_temp) and ls_temp = 'yes' then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " MultiLine opposite changed = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " MultiLine opposite changed = "+String ( "Fail!" ) +"~r~n"
			end if 

			//测试动态设置width属性对Dw Compute的影响
			//1.获取Compute width静态属性
			//2.设置Compute width属性
			//DW_Control.Modify("<Compute>.Width='<the width of the object in the units specified for the DataWindow>'")
			ls_temp = ''
			ls_temp = dw_1.object.expression_1.Width
			IF not isnull(ls_temp) and ls_temp = '2000' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width default set = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width default set = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ''
			ls_temp = dw_1.describe("expression_3.Width")
			IF not isnull(ls_temp) and ls_temp = '0' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width default = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.modify("expression_1.Width='3000'")
			ls_temp = ''
			ls_temp = dw_1.object.expression_1.Width			
			IF not isnull(ls_temp) and ls_temp = '3000' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width default set changed = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width default set changed = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.object.expression_3.Width = 5000
			ls_temp = ''
			ls_temp = dw_1.describe("expression_3.Width")
			IF not isnull(ls_temp) and ls_temp = '5000' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width default changed = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width default changed = "+String ( "Fail!" ) +"~r~n"
			end if 

//			测试动态设置width.autosize属性对Dw Compute的影响
//			1.获取width.autosize静态属性
//			2.设置width.autosize属性
//			DW_Control.Modify("<Compute>.Width.AutoSize='<0 - False, 1 - True>'")
			ls_temp = ''
			ls_temp = dw_1.object.expression_1.width.autosize
			IF not isnull(ls_temp) and ls_temp = '1' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width AutoSize default  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width AutoSize default = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ''
			ls_temp = dw_1.describe("expression_3.width.autosize")	
			IF not isnull(ls_temp) and ls_temp = '0' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width AutoSize default false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width AutoSize default false = "+String ( "Fail!" ) +"~r~n"
			end if 
						
			ls_temp2 = dw_1.modify("expression_1.width.autosize='0'")
			ls_temp = ''
			ls_temp = dw_1.object.expression_1.width.autosize
			IF not isnull(ls_temp) and ls_temp = '0' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width AutoSize changed false  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width AutoSize changed false = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp2 = dw_1.modify("expression_3.width.autosize='1'")
			ls_temp = ''
			ls_temp = dw_1.describe("expression_3.width.autosize")
			IF not isnull(ls_temp) and ls_temp = '1' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width AutoSize changed true  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width AutoSize changed true = "+String ( "Fail!" ) +"~r~n"
			end if
			ls_temp2 = dw_1.modify("expression_1.width='3000'") 
			ls_temp = ''
			ls_temp = dw_1.object.expression_1.Width
			IF not isnull(ls_temp) and ls_temp = '3000' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width AutoSize Set 1= "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width AutoSize Set 1= "+String ( "Fail!" ) +"~r~n"
			end if
			
			dw_1.object.expression_3.width = 5000
			ls_temp = ''
			ls_temp = dw_1.describe("expression_3.Width")			
			IF not isnull(ls_temp) and ls_temp = '5000' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width AutoSize Set 2= "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Width AutoSize Set 2= "+String ( "Fail!" ) +"~r~n"
			end if
			
//			测试动态设置Lineremove属性对Dw Compute的影响
//			1.获取Lineremove静态属性
//			2.设置Lineremove属性
//			3.Setitem field为空后，提示用户查看UI效果
//			DW_Control.Modify("<Compute>.LineRemove=<Yes or No>")
			ls_temp = ''
			ls_temp = dw_1.object.expression_1.LineRemove
			IF not isnull(ls_temp) and ls_temp = 'no' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " LineRemove 1. default no = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " LineRemove 1. default no = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ls_temp = ''
			ls_temp = dw_1.describe("expression_2.LineRemove")
			IF not isnull(ls_temp) and ls_temp = 'no' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " LineRemove 2. default no = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " LineRemove 2. default no = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ls_temp2 = dw_1.modify('expression_1.LineRemove=yes')
			ls_temp = dw_1.object.expression_1.LineRemove			
			IF not isnull(ls_temp) and ls_temp = 'yes' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " LineRemove 3. changed yes = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " LineRemove 3. changed yes = "+String ( "Fail!" ) +"~r~n"
			end if
			
			dw_1.object.expression_2.LineRemove = false			
			ls_temp = dw_1.describe("expression_2.LineRemove")
			IF not isnull(ls_temp) and ls_temp = 'no' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " LineRemove 4. changed no = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " LineRemove 4. changed no = "+String ( "Fail!" ) +"~r~n"
			end if
			
//			测试动态设置expression属性对Dw Compute的影响
//			1.获取expression静态属性
//			2.设置expression属性
//			DW_Control.Modify("<Compute>.expression='values'")
			ls_temp = ''
			ls_temp = dw_1.object.expression_2.expression
			IF not isnull(ls_temp) and trim(lower(ls_temp)) = trim(lower('emp_name')) then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " expression default 2 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " expression default 2 = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ls_temp = ''
			ls_temp = dw_1.describe("expression_4.expression")
			IF not isnull(ls_temp) and lower(ls_temp) = lower("if( emp_sex = 'M','Men','Women')") then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " expression default 4 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " expression default 4 = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ls_temp2 = dw_1.modify("expression_2.expression='pageCount()'")
			ls_temp = ''
			ls_temp = dw_1.object.expression_2.expression			
			IF not isnull(ls_temp) and lower(ls_temp) = lower("pageCount()") then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " expression changed 2 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " expression changed 2 = "+String ( "Fail!" ) +"~r~n"
			end if
			
			dw_1.object.expression_4.expression = 'CurrentRow()'
			ls_temp = ''
			ls_temp = dw_1.describe("expression_4.expression")
			IF not isnull(ls_temp) and lower(ls_temp) = lower("CurrentRow()") then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " expression changed 4 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " expression changed 4 = "+String ( "Fail!" ) +"~r~n"
			end if
			
//			测试动态设置Visiable属性对Dw Compute的影响
//			1.获取Visible静态属性
			ls_temp = ''
			ls_temp = dw_1.object.expression_1.Visible
			IF not isnull(ls_temp) and ls_temp = '1' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Visible default true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Visible default true = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ''
			ls_temp = dw_1.describe("expression_10.Visible")
			IF not isnull(ls_temp) and ls_temp = '0' then
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Visible default false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Visible default false = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp2 = dw_1.modify('expression_10.Visible=true')			
			ls_temp = ''
			ls_temp = dw_1.describe("expression_10.Visible")
			IF not isnull(ls_temp) and ls_temp = '1' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Visible changed true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Visible changed true = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp2 = dw_1.modify('expression_1.Visible=false')
			ls_temp = ''
			ls_temp = dw_1.describe("expression_1.Visible")
			IF not isnull(ls_temp) and ls_temp = '0' then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Visible changed false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Visible changed false = "+String ( "Fail!" ) +"~r~n"
			end if 

			//测试动态设置Format属性对Dw Compute的影响
			//1.获取Format静态属性
			//2.动态设置Compute的Format属性.
			//DW_Control .Modify("<ComputedFieldname>.Format='<constant string containing display format (i.e., [general]) for col (can also be an expression)>'")			
			ls_temp = ''
			ls_temp = dw_1.object.dwdate.Format
			IF not isnull(ls_temp) and lower(ls_temp) = lower("yyyy-mm-dd") then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Format default date = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Format default date = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ls_temp = ''
			ls_temp = dw_1.describe("expression_2.Format")
			IF not isnull(ls_temp) and lower(ls_temp) = lower("[general]") then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Format default expression_2 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Format default expression_2 = "+String ( "Fail!" ) +"~r~n"
			end if
			
			
			ls_temp2 = dw_1.modify('dwdate.Format=~'yyyy-mm-dd hh:mm:ss~'')
			ls_temp = ''
			ls_temp = dw_1.describe("dwdate.Format")
			IF not isnull(ls_temp) and lower(ls_temp) = lower("yyyy-mm-dd hh:mm:ss") then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Format changed date = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Format changed date = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ls_temp2 = dw_1.modify("expression_2.Format='(@@@)@@@@@'")			
			ls_temp = ''
			ls_temp = dw_1.describe("expression_2.Format")
			IF not isnull(ls_temp) and lower(ls_temp) = lower("(@@@)@@@@@") then 
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Format changed expression_2 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" other function " + " Format changed expression_2 = "+String ( "Fail!" ) +"~r~n"
			end if
			
	end choose 
next 

//gf_returnresult(ls_result)
is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module6 ();//dw_1.dataobject= 'd_datawindow_richtext_column'			//not same				// change it 
dw_1.dataobject= 'd_datawindow_richtext_column_freeform'			 //new 
dw_1.settransobject( sqlca)

//	Columns that you format with the RichText edit style require considerably more storage space than columns with plain text edit styles. 
//	Therefore you should set a minimum of 1 KB for the column width. Otherwise, 
//	you can use the RichText edit style with columns that have large text datatypes.

dw_1.retrieve( )

string ls_array[], ls_item, ls_result, ls_temp, ls_default_dataobject, ls_temp2, ls_file, ls_fullname, ls_array2[7]
long	ll_bound, i , ll_tmp, ll_find, ll_row, ll_express, ll_express2, ll_tmp2, ll_bound2
integer		li_rtn, li_rtn2 
boolean		lbn_flag 
Alignment 		l_align

//ls_china   = "正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，其申请的多项发明专利，解决了互联网软件的局限性，这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。"
//ls_english = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'			

is_log = ''
ls_result = ''
ll_bound =0 
//RichText.property DataWindow object event
ls_array[Upperbound(ls_array) + 1 ] = "Style RichtextEditStyle"
ls_array[Upperbound(ls_array) + 1 ] = "Style AutoSelect"
ls_array[Upperbound(ls_array) + 1 ] = "Style DisplayOnly"
ls_array[Upperbound(ls_array) + 1 ] = "Style FocusRectangle"
ls_array[Upperbound(ls_array) + 1 ] = "Style Limit"										//?		Limit  bug //
ls_array[Upperbound(ls_array) + 1 ] = "Style NilIsNull"
ls_array[Upperbound(ls_array) + 1 ] = "Style Required"
ls_array[Upperbound(ls_array) + 1 ] = "Style VScrollBar"
//ls_array[Upperbound(ls_array) + 1 ] = ""

ls_array[Upperbound(ls_array) + 1 ] = "Style RichTextCurrentStyleChanged"
ls_array[Upperbound(ls_array) + 1 ] = "Style RichTextLoseFocus"
ls_array[Upperbound(ls_array) + 1 ] = "Style RichTextLimitError"						
ls_array[Upperbound(ls_array) + 1 ] = "Style StyleItemchaned"
ls_array[Upperbound(ls_array) + 1 ] = "Style Compute Richtextfile"
ls_array[Upperbound(ls_array) + 1 ] = "Style Update"
ls_array[Upperbound(ls_array) + 1 ] = "Style Dberror"

ls_array[Upperbound(ls_array) + 1 ] = "Style Data Retrieve and Update"		//datawindow type of update, retrieve, 
ls_array[Upperbound(ls_array) + 1 ] = "Style RichTextColor"
ls_array[Upperbound(ls_array) + 1 ] = "Style RichTextAlign"
ls_array[Upperbound(ls_array) + 1 ] = "Style RichTextFaceName"
ls_array[Upperbound(ls_array) + 1 ] = "Style RichTextSize"
ls_array[Upperbound(ls_array) + 1 ] = "Style RichTextStyle"

//ls_array[Upperbound(ls_array) + 1 ] = "PositionHExpression"

ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")
	is_log = ''
	ls_temp = ''
	li_rtn = 0 
	ls_temp2 = ''
	ll_tmp = 0
	lbn_flag = false
	choose case lower(ls_item)
		case lower("Style RichtextEditStyle")	
			//取非richedit column 判断
			ls_temp = ""
			ls_temp = dw_1.describe( "emp_name.Edit.AutoSelect ")
			ls_temp2 = ""
			ls_temp2 = dw_1.describe( "emp_name.RichEdit.AutoSelect ")
			if not isnull(ls_temp)  and (ls_temp = "no" or ls_temp = "yes" ) and ( isnull(ls_temp2) or ls_temp2 = '' or ls_temp2 = '!' or ls_temp2 = '?' ) then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+". Get not Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+". Get not Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//取richedit column 判断
			ls_temp = ""
			ls_temp = dw_1.describe( "emp_remark.Edit.AutoSelect ")
			ls_temp2 = ""
			ls_temp2 = dw_1.describe( "emp_remark.RichEdit.AutoSelect ")			
			if not isnull(ls_temp2)  and (ls_temp2 = "no" or ls_temp2 = "yes" ) and ( isnull(ls_temp) or ls_temp = '' or ls_temp = '!' or ls_temp = '?' ) then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+". Get yes Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+". Get yes Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Style AutoSelect")
			//获取原始值 no
			ls_temp = ""
			ls_temp = dw_1.describe( "emp_remark.RichEdit.AutoSelect ")			
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.AutoSelect ="+"yes")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.AutoSelect ")			
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.AutoSelect ="+"no")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.AutoSelect ")			
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Style DisplayOnly"	)
			//获取原始值 no
			ls_temp = ""
			ls_temp = dw_1.describe( "emp_remark.RichEdit.DisplayOnly ")			
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.DisplayOnly ="+"yes")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.DisplayOnly ")			
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.DisplayOnly ="+"no")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.DisplayOnly ")			
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Style FocusRectangle")			
			//获取原始值 no
			ls_temp = ""
			ls_temp = dw_1.describe( "emp_remark.RichEdit.FocusRectangle ")			
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.FocusRectangle ="+"yes")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.FocusRectangle ")			
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.FocusRectangle ="+"no")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.FocusRectangle ")			
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Style Limit")	
			//获取原始值 no
			ls_temp = ""
			ls_temp = dw_1.describe( "emp_remark.RichEdit.Limit")			
			if not isnull(ls_temp)  and ls_temp = "0" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//动态修改为-5																		//该测试点 发现bug
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.Limit ="+"-5")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.Limit ")			
			if not isnull(ls_temp)  and ls_temp = "-5" then				//need to modify as the PB IDE envrionment
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Set negative = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Set negative = "+ String ( "Fail!" ) +"~r~n"
			end if 

			//动态修改为max																	//该测试点 发现bug
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.Limit ="+"32768")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.Limit ")			
			if not isnull(ls_temp)  and ls_temp = "-32768" then			//32766 not 32767		//need to modify as the PB IDE envrionment
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Set Max = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Set Max = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//动态修改为normal
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.Limit ="+"255")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.Limit ")			
			if not isnull(ls_temp)  and ls_temp = "255" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Set normal = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Set normal = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.Limit ="+"0")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.Limit ")			
			if not isnull(ls_temp)  and ls_temp = "0" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Set default = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Set default = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Style NilIsNull")			
			//获取原始值 no
			ls_temp = ""
			ls_temp = dw_1.describe( "emp_remark.RichEdit.NilIsNull ")			
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.NilIsNull ="+"yes")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.NilIsNull ")			
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.NilIsNull ="+"no")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.NilIsNull ")			
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Style Required")	
			//获取原始值 no
			ls_temp = ""
			ls_temp = dw_1.describe( "emp_remark.RichEdit.Required ")			
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为yes
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.Required ="+"yes")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.Required ")			
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为no
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.Required ="+"no")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.Required ")			
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if
			
		case lower("Style VScrollBar")
			//获取原始值 yes			//modify 
			ls_temp = ""
			ls_temp = dw_1.describe( "emp_remark.RichEdit.VScrollBar ")			
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为 no
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.VScrollBar ="+"no")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.VScrollBar ")			
			if not isnull(ls_temp)  and ls_temp = "no" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". set no = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". set no = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为 yes
			ls_temp = dw_1.Modify( "emp_remark.RichEdit.VScrollBar ="+"yes")
			ls_temp = dw_1.describe( "emp_remark.RichEdit.VScrollBar ")			
			if not isnull(ls_temp)  and ls_temp = "yes" then
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". set yes = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" is "+ls_temp+". set yes = "+ String ( "Fail!" ) +"~r~n"
			end if
		case lower('Style RichTextCurrentStyleChanged')
			dw_1.event richtextcurrentstylechanged( dw_1.getrow(),  dw_1.object.emp_remark)
			if not isnull(is_log) and pos(lower(is_log), lower( "richtextcurrentstylechanged")) > 0 then 
				ls_result += " "+is_testcasename+" "+ls_item+" column.RichEdit "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item+" column.RichEdit "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ''
			dw_1.setfocus( )
			dw_1.SetColumn('emp_remark')			//auto trigger it.
			if not isnull(is_log) and pos(lower(is_log), lower( "richtextcurrentstylechanged")) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" auto trigger: "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" auto trigger: "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if 	
		case lower('Style RichTextLoseFocus')
			dw_1.event richtextlosefocus( dw_1.getrow() ,dw_1.Object.emp_remark )
			if not isnull(is_log) and pos(lower(is_log), lower( "RichTextLoseFocus")) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if 
			
//			is_log = ''
			dw_1.setfocus( )
			dw_1.SetColumn('emp_remark')		//auto trigger RichTextCurrentStyleChanged.
			is_log = ''
			dw_1.SetColumn('emp_remark')		//auto trigger RichTextLoseFocus frist and then auto trigger RichTextCurrentStyleChanged second.
			if not isnull(is_log) and pos(lower(is_log), lower( "RichTextLoseFocus")) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" auto trigger: "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" auto trigger: "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if 	
		case lower('Style RichTextLimitError')
			//trigger for default
			ls_temp = "About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents"			
			ls_temp += ls_temp
			ls_temp += ls_temp
			dw_1.event richtextlimiterror( dw_1.getrow(), dw_1.object.emp_remark, ls_temp)
			if not isnull(is_log) and pos(lower(is_log), lower( "RichTextLimitError")) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" auto trigger: "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+" auto trigger: "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if 	
		case lower('Style Itemchaned')
			ls_temp = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'			
			dw_1.event itemchanged(dw_1.getrow( ) , dw_1.object.emp_remark , ls_temp)
			if not isnull(is_log) and pos(lower(is_log), lower( "itemchaned")) > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+is_log + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" column.RichEdit "+is_log + " = "+String ( "Fail!" ) +"~r~n"
			end if 
			
		case lower('Style Compute Richtextfile')
			ls_temp = this.dw_1.describe("compute_richtextfile.expression")
			ls_result += wf_result_add(ls_item,"1. get expression ", not isnull(ls_temp) and trim(ls_temp) ="richtextfile('')")
				
			ls_file = "origin.rtf"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " origin.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " origin.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			ls_temp = ""
			ls_temp = this.dw_1.Modify("compute_richtextfile.expression='richtextfile(~"origin.rtf~")'")
			ls_result += wf_result_add(ls_item,"2. modify expression ", not isnull(ls_temp) and trim(ls_temp) ="")
			
			ls_temp = ""
			ls_temp =dw_1.getitemstring(1, "compute_richtextfile")
			ls_result += wf_result_add(ls_item,"3. get rtf file name ", not isnull(ls_temp) and trim(ls_temp) ="origin.rtf")
			
		case lower('Style Update')
			ll_find = dw_1.find( "emp_id=1 and dep_id=1 and emp_code='001' ", 1,dw_1.rowcount( ) )
			if ll_find > 0 then 
				is_log = ''
				
				ls_temp = ""
				ls_temp =dw_1.getitemstring(ll_find, "compute_richtext")
				ls_result += wf_result_add(ls_item,"1. get default expression richtext value ", not isnull(ls_temp) and trim(ls_temp) = "中国人" )
				
//				ls_temp2 = "正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，其申请的多项发明专利，解决了互联网软件的局限性，这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。"			
//				ls_temp += ls_temp
//				ls_temp += ls_temp
				//pb 12.6 格式
				ls_temp2 = "{\rtf1\ansi\ansicpg936\uc1\deff0{\fonttbl  {\f0\fnil\fcharset134\fprq2 \'cb\'ce\'cc\'e5;}  {\f1\fswiss\fcharset134\fprq2 Tahoma;}  {\f2\fscript\fcharset0\fprq2 Rage Italic;}  {\f3\froman\fcharset2\fprq2 Symbol;}}  {\colortbl;\red0\green0\blue0;\red255\green255\blue255;}  {\stylesheet{\s0\itap0\nowidctlpar\f0\fs24 [Normal];}{\*\cs10\additive Default Paragraph Font;}}  {\*\generator TX_RTF32 15.0.530.503;}  \deftab1134\paperw12240\paperh15840\margl0\margt0\margr0\margb0\widowctrl\formshade\sectd  \headery720\footery720\pgwsxn5865\pghsxn15840\marglsxn0\margtsxn0\margrsxn0\margbsxn0\pard\itap0\nowidctlpar\plain\f1\fs20 ADC  \par\plain\f2\fs96 new }"
				dw_1.setitem(ll_find, "emp_remark", ls_temp2)
				dw_1.accepttext( )	
				ll_tmp = dw_1.update( )													 
				ls_result += wf_result_add(ls_item, "2. column.RichEdit rft format ", not isnull(is_log)  and not pos(lower(is_log), lower( "dberror")) > 0 and not isnull(ll_tmp) and ll_tmp = 1)						
				
				ls_temp = ""
				ls_temp =dw_1.getitemstring(ll_find, "compute_richtext")
				ls_result += wf_result_add(ls_item,"3. get expression richtext value ", not isnull(ls_temp) and ls_temp = ls_temp2 )
			end if 
		case lower('Style Dberror')	
			dw_1.event dberror( -1, " database error "," no update ", primary! , 1)			
			ls_result += wf_result_add(ls_item, " column.RichEdit ", not isnull(is_log)  and pos(lower(is_log), lower( "dberror")) > 0)
			
//		case lower("PositionHExpression")
//			ll_row = dw_1.getrow()
//			ls_temp2 = dw_1.getitemstring( ll_row,"fcustno")
////			ll_express = long(dw_1.object.emp_remark[ll_row].width)
////			ls_temp = dw_1.modify( "emp_remark.width='"+string(ll_express)+"~tif( fcustno ='"+ls_temp2+"', "+string(ll_tmp * 2)+", "+string(ll_tmp)+")' ")
////			ll_express2 = long(dw_1.object.emp_remark[ll_row].width)
//			ll_express = integer(dw_1.describe( "emp_remark.protect"))
//			ls_temp = dw_1.modify( "fcustno.protect=~""+string(ll_express)+"~tif(  3 > 2 , 1, 0)~" ")
//			ll_express2 = integer(dw_1.describe( "emp_remark.protect"))
//			
//			ll_express = long(dw_1.object.emp_remark[ll_row].object.width)
		case lower('Style Data Retrieve and Update')
			is_type = ""
			//pb 12.6 格式
			ls_temp2 = "{\rtf1\ansi\ansicpg936\uc1\deff0{\fonttbl  {\f0\fnil\fcharset134\fprq2 \'cb\'ce\'cc\'e5;}  {\f1\fswiss\fcharset134\fprq2 Tahoma;}  {\f2\fscript\fcharset0\fprq2 Rage Italic;}  {\f3\froman\fcharset2\fprq2 Symbol;}}  {\colortbl;\red0\green0\blue0;\red255\green255\blue255;}  {\stylesheet{\s0\itap0\nowidctlpar\f0\fs24 [Normal];}{\*\cs10\additive Default Paragraph Font;}}  {\*\generator TX_RTF32 15.0.530.503;}  \deftab1134\paperw12240\paperh15840\margl0\margt0\margr0\margb0\widowctrl\formshade\sectd  \headery720\footery720\pgwsxn5865\pghsxn15840\marglsxn0\margtsxn0\margrsxn0\margbsxn0\pard\itap0\nowidctlpar\plain\f1\fs20 ADC  \par\plain\f2\fs96 new }"
			ll_bound2 =  7 
			ls_array2 = {'freeform','grid','group','label','nup','tabular','treeview'}
			for ll_tmp2 = 1 to ll_bound2		
				ll_tmp = 0 
				dw_1.dbcancel( )
				dw_1.reset( )
				dw_1.dataobject = 'dw_richtext_dw_style_'+ls_array2[ll_tmp2]
				dw_1.settransobject( sqlca)
				ll_tmp = dw_1.retrieve( )
				ls_result += wf_result_add(ls_item, " retrieve "+ls_array2[ll_tmp2]+" ", not isnull(ll_tmp)  and ll_tmp  > 0)
				
				if dw_1.dataobject = 'dw_richtext_dw_style_label' then continue 				//this datawindow type is display for print only.
				ll_find = dw_1.find( " emp_id="+string(ll_tmp2), 1,dw_1.rowcount( ) )		//+" and emp_code='00"+"+string(ll_tmp2)+"+"' "
				if ll_find > 0 then 
					is_log = ''		
					ll_tmp = 0 
					dw_1.setitem(ll_find, "emp_remark", ls_temp2)
					dw_1.accepttext( )	
					ll_tmp = dw_1.update( )													 
					ls_result += wf_result_add(ls_item, " update "+ls_array2[ll_tmp2]+" ", not isnull(is_log)  and not pos(lower(is_log), lower( "dberror")) > 0 and not isnull(ll_tmp) and ll_tmp = 1)		
				end if 
			next 	
			
		case lower("Style RichTextColor")
			li_rtn = dw_1.GetRichTextColor(ll_tmp)
			ls_result += wf_result_add(ls_item,"1. GetRichTextColor default ", not isnull(li_rtn) and li_rtn = 0 and ll_tmp <> 0 )
			
			li_rtn = 0 
			ll_tmp2 = 0
			ll_tmp = RGB(0, 255, 0)
			li_rtn = dw_1.SetRichTextColor(ll_tmp)
			dw_1.GetRichTextColor(ll_tmp2)
			ls_result += wf_result_add(ls_item,"2. SetRichTextColor ", not isnull(li_rtn) and li_rtn = 0 and not isnull(ll_tmp2) and ll_tmp2 = ll_tmp )

			
			li_rtn = 0 
			ll_tmp = 33554432 
			li_rtn = dw_1.SetRichTextColor(ll_tmp)
			ls_result += wf_result_add(ls_item,"3. SetRichTextColor default ", not isnull(li_rtn) and li_rtn = 0 )

			
			li_rtn = 0 
			ll_tmp = 0 
			li_rtn = dw_1.GetRichTextColor(ll_tmp)
			ls_result += wf_result_add(ls_item,"4. GetRichTextColor ", not isnull(li_rtn) and li_rtn = 0 and not isnull(ll_tmp) and ll_tmp = 33554432)

			
		case lower("Style RichTextAlign")
			setnull(l_align)
			li_rtn = dw_1.GetRichTextAlign(l_align)
						
			l_align = Right!
			ll_tmp = dw_1.SetRichTextAlign(l_align)

		case lower("Style RichTextFaceName")
			li_rtn = dw_1.GetRichTextFaceName(ls_temp)
			
			li_rtn = 0 
			li_rtn = dw_1.SetRichTextFaceName("Arial")
			
		case lower("Style RichTextSize")
			li_rtn2 = 0 
			li_rtn = dw_1.GetRichTextSize(li_rtn2)
			
			li_rtn = dw_1.SetRichTextSize(16)
			
		case lower("Style RichTextStyle")
			li_rtn = dw_1.GetRichTextStyle(bold!, lbn_flag)
			
			li_rtn = 0 
			li_rtn = dw_1.SetRichTextStyle(true, false, false,  false)
			
	end choose 
next 

//gf_returnresult(ls_result)
is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module5 ();dw_1.dataobject= 'd_rtdwcw01_nup'
dw_1.settransobject( sqlca)

//dw_1.retrieve( )

string ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_default_dataobject, ls_null
long	ll_bound, i , ll_tmp, ll_null, ll_position
long 	ll_startline, ll_startchar, ll_endline, ll_endchar
string ls_path, ls_file, ls_fullname
integer li_rtn, li_col
Band			lb_Band
FileType 		lft_type
boolean		lbn_flag 
DWItemStatus  ldws_status, ldws_status2
datastore 	lds_data
DataWindowChild ldw_rtf,ldw_child


//ls_china   = "正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，其申请的多项发明专利，解决了互联网软件的局限性，这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。"
//ls_english = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'			
is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

//RichText.property DataWindow object event
ls_array[Upperbound(ls_array) + 1 ] = "GetChild"
ls_array[Upperbound(ls_array) + 1 ] = "GetChildretrieve"
ls_array[Upperbound(ls_array) + 1 ] = "GetChildData"						
ls_array[Upperbound(ls_array) + 1 ] = ""


ls_path = gs_cachedir
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
	is_type= ''
	choose case lower(ls_item)
		case lower("GetChild")	
			//		    测试Dwc UI的显示
			//1.在N-up Dw中放置两DropdownDW:一个默认属性的RichtextDw和一个
			//richtext.pictureframe、returnsvisible、rulerbar、spacesvisible、tabbar、tabsvisible、toolbar属性为True的RichtextDw.
			//2.Insertrow(0)		
			//
			dw_1.reset( )
			dw_1.insertrow(0)
			li_rtn = dw_1.getchild('emp_id_1', ldw_child)
			ldw_child.settransobject( sqlca)		
			if not isnull(li_rtn) and li_rtn = 1 and ldw_child.rowcount() > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default autoretrieve = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default autoretrieve = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			li_rtn  = 0
			li_rtn = dw_1.GetChild('dep_id_1', ldw_rtf)
			ldw_rtf.settransobject( sqlca)
			if not isnull(li_rtn) and li_rtn = 1 and ldw_rtf.rowcount() = 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default no autoretrieve = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default no autoretrieve = "+String ( "Fail!" ) +"~r~n"
			end if 									
		case lower("GetChildretrieve")	
		//	    Dwc dddw.autoretrieve=no及yes,主Dw Retrieve
		//		1.在N-up Dw中放置两DropdownDW,Autoretrieve属性分别为True及False.
		//		2.Retrieve.
		//
		//		1.具有Autoretrieve的Dwc具有显示值，但Dwc中没有数据。
		//		2.没有Autoretrieve的Dwc没有显示值
			
			dw_1.reset()
			dw_1.retrieve( )			
			li_rtn = dw_1.getchild('emp_id_1', ldw_child)
			ldw_child.settransobject( sqlca)		
			if not isnull(li_rtn) and li_rtn = 1 and ldw_child.rowcount() > 0  then 				
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " autoretrieve = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " autoretrieve = "+String ( "Fail!" ) +"~r~n"
			end if 
						
			is_type = ''
			
			li_rtn  = 0
			li_rtn = dw_1.GetChild('dep_id_1', ldw_rtf)
			ldw_rtf.settransobject( sqlca)
			if not isnull(li_rtn) and li_rtn = 1 and ldw_rtf.rowcount() = 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no autoretrieve = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no autoretrieve = "+String ( "Fail!" ) +"~r~n"
			end if 		
			
			ldw_rtf.retrieve( )
			if ldw_rtf.rowcount() > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " manual autoretrieve = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " manual autoretrieve = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
		case lower("GetChildData")						
			dw_1.reset()
			dw_1.retrieve( )			
			li_rtn = dw_1.getchild('emp_id_1', ldw_child)
			ldw_child.settransobject( sqlca)		
			
			ll_tmp = dw_1.getitemnumber(dw_1.getrow( ) , "emp_id")
//			li_rtn = ldw_child.scrolltorow( ldw_child.rowcount())												//bug, This is will crush the PB .		//bug 1155
//			ls_temp  = string(ldw_child.getitemnumber( ldw_child.rowcount( ) , "emp_id") )
//			
//			dw_1.accepttext( )
//			ls_temp2  = string(dw_1.getitemnumber(dw_1.getrow( ) , "emp_id") )
			if not isnull(li_rtn) and li_rtn = 1 and ldw_child.rowcount() > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " scrolltorow = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " scrolltorow = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = dw_1.GetChild('dep_id_1', ldw_rtf)
			ldw_rtf.settransobject( sqlca)
//		 	ldw_rtf.retrieve( )
			li_rtn = ldw_child.sharedata( ldw_rtf ) 
			if not isnull(li_rtn) and li_rtn = 1 and ldw_rtf.rowcount() > 0 and ldw_child.rowcount( ) > 0  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " sharedata = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " sharedata = "+String ( "Fail!" ) +"~r~n"
			end if
			
//			//child print																			// bug  when close the print window, then the PB will be crumb.
//			is_type = "Child Print Timer"
//			timer(1)
//			ldw_child.print( )
			
		case lower("")					
			
		case lower("")				
			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

//gf_returnresult(ls_result)
is_resultlog += ls_result


end subroutine

public subroutine of_testcase_point_module4 ();dw_1.dataobject= 'rtdwfuncne_d01_ascii'
dw_1.settransobject( sqlca)

dw_1.retrieve( )

string ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_default_dataobject, ls_null
long	ll_bound, i , ll_tmp, ll_null, ll_position
long 	ll_startline, ll_startchar, ll_endline, ll_endchar
string ls_path, ls_file, ls_fullname
integer li_rtn, li_col
Band			lb_Band
FileType 		lft_type
boolean		lbn_flag 
DWItemStatus  ldws_status, ldws_status2
datastore 	lds_data
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
any			ly_any
window		lw_win
Object		lpo_object
blob 			lblb_cookie

//ls_china   = "正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，其申请的多项发明专利，解决了互联网软件的局限性，这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。"
//ls_english = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'			
is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

//RichText.property DataWindow object event
ls_array[Upperbound(ls_array) + 1 ] = "AcceptText"
ls_array[Upperbound(ls_array) + 1 ] = "ClassName"
ls_array[Upperbound(ls_array) + 1 ] = "ClearValues"
ls_array[Upperbound(ls_array) + 1 ] = "Clipboard"
ls_array[Upperbound(ls_array) + 1 ] = "Create"
ls_array[Upperbound(ls_array) + 1 ] = "DeletedCount"
ls_array[Upperbound(ls_array) + 1 ] = "DeleteRow"
ls_array[Upperbound(ls_array) + 1 ] = "Describe"
ls_array[Upperbound(ls_array) + 1 ] = "Drag"
ls_array[Upperbound(ls_array) + 1 ] = "FilteredCount"
ls_array[Upperbound(ls_array) + 1 ] = "FindGroupChange"
ls_array[Upperbound(ls_array) + 1 ] = "FindRequired"
ls_array[Upperbound(ls_array) + 1 ] = "GetBorderStyle"
ls_array[Upperbound(ls_array) + 1 ] = "GetRow"
ls_array[Upperbound(ls_array) + 1 ] = "GetRowFromRowId"
ls_array[Upperbound(ls_array) + 1 ] = "GetRowIdFromRow"
ls_array[Upperbound(ls_array) + 1 ] = "GetSQLSelect"
ls_array[Upperbound(ls_array) + 1 ] = "GetValidate"
ls_array[Upperbound(ls_array) + 1 ] = "GetValue"
ls_array[Upperbound(ls_array) + 1 ] = "GroupCalc"
ls_array[Upperbound(ls_array) + 1 ] = "Hide"
ls_array[Upperbound(ls_array) + 1 ] = "ImportClipboard"
ls_array[Upperbound(ls_array) + 1 ] = "ImportString"
ls_array[Upperbound(ls_array) + 1 ] = "ImportFile"
ls_array[Upperbound(ls_array) + 1 ] = "ModifiedCount"
ls_array[Upperbound(ls_array) + 1 ] = "Modify"
ls_array[Upperbound(ls_array) + 1 ] = "Move"
ls_array[Upperbound(ls_array) + 1 ] = "ReplaceText"
ls_array[Upperbound(ls_array) + 1 ] = "ResetUpdate"
ls_array[Upperbound(ls_array) + 1 ] = "Resize"
ls_array[Upperbound(ls_array) + 1 ] = "RowCount"
ls_array[Upperbound(ls_array) + 1 ] = "RowsCopy"
ls_array[Upperbound(ls_array) + 1 ] = "RowsDiscard"
ls_array[Upperbound(ls_array) + 1 ] = "RowsMove"

ls_array[Upperbound(ls_array) + 1 ] = "SaveAsAscii"
ls_array[Upperbound(ls_array) + 1 ] = "SetBorderStyle"
ls_array[Upperbound(ls_array) + 1 ] = "SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "Filter"
ls_array[Upperbound(ls_array) + 1 ] = "SetFormat"
ls_array[Upperbound(ls_array) + 1 ] = "SetItem"
ls_array[Upperbound(ls_array) + 1 ] = "SetItemStatus"
ls_array[Upperbound(ls_array) + 1 ] = "SetRowFocusIndicator"
ls_array[Upperbound(ls_array) + 1 ] = "SetSort"
ls_array[Upperbound(ls_array) + 1 ] = "Sort"
ls_array[Upperbound(ls_array) + 1 ] = "SetSQLSelect"
ls_array[Upperbound(ls_array) + 1 ] = "SetTabOrder"
ls_array[Upperbound(ls_array) + 1 ] = "SetValidate"
ls_array[Upperbound(ls_array) + 1 ] = "SetValue"
ls_array[Upperbound(ls_array) + 1 ] = "ShareDataOff"
ls_array[Upperbound(ls_array) + 1 ] = "Update"
ls_array[Upperbound(ls_array) + 1 ] = "GetBandAtPointer"
//ls_array[Upperbound(ls_array) + 1 ] = "GetClickedColumn"							//manual, Cann't AUTO execute.
ls_array[Upperbound(ls_array) + 1 ] = "GetClickedRow"									
//ls_array[Upperbound(ls_array) + 1 ] = "DataCount"										//only for Graphs

ls_array[Upperbound(ls_array) + 1 ] = "GetFormat"
//ls_array[Upperbound(ls_array) + 1 ] = "GetItemDate"									//no this column type in the SQL Database. // In PowerBuilder, use the GetItemDateTime method instead.
ls_array[Upperbound(ls_array) + 1 ] = "GetItemDateTime"
ls_array[Upperbound(ls_array) + 1 ] = "GetItemDecimal"
ls_array[Upperbound(ls_array) + 1 ] = "GetItemNumber"
ls_array[Upperbound(ls_array) + 1 ] = "GetItemString"
ls_array[Upperbound(ls_array) + 1 ] = "GetItemTime"
ls_array[Upperbound(ls_array) + 1 ] = "GetNextModified"
ls_array[Upperbound(ls_array) + 1 ] = "GetParent"
//ls_array[Upperbound(ls_array) + 1 ] = "GetSQLPreview"								//Obsolete method 
//ls_array[Upperbound(ls_array) + 1 ] = "GetStateStatus"								//bug 		//crash, error	//Obsolete method , This technique is no longer supported.
//ls_array[Upperbound(ls_array) + 1 ] = "GetUpdateStatus"							//Obsolete method 
ls_array[Upperbound(ls_array) + 1 ] = "PointerX"

ls_array[Upperbound(ls_array) + 1 ] = "PointerY"
//ls_array[Upperbound(ls_array) + 1 ] = "PostEvent"
ls_array[Upperbound(ls_array) + 1 ] = "ReselectRow"									//bug			///////////////??????????????????????
//ls_array[Upperbound(ls_array) + 1 ] = "ResetDataColors"								//Graphs in DataWindows
ls_array[Upperbound(ls_array) + 1 ] = "ResetTransObject"								//ResetTransObject is almost never used 
ls_array[Upperbound(ls_array) + 1 ] = "Retrieve"
ls_array[Upperbound(ls_array) + 1 ] = "ScrollToRow"
//ls_array[Upperbound(ls_array) + 1 ] = "SetChanges"									//This method is used primarily in distributed applications.
//ls_array[Upperbound(ls_array) + 1 ] = "SetPosition"									//manual 	//Bring it to the front or not .
//ls_array[Upperbound(ls_array) + 1 ] = "SetRedraw"
ls_array[Upperbound(ls_array) + 1 ] = "SetSQLPreview"									// When to call SetSQLPreview, Call this method only in the script for the SQLPreview event.					
ls_array[Upperbound(ls_array) + 1 ] = "SetTransObject"
ls_array[Upperbound(ls_array) + 1 ] = "Show"												//manual	
ls_array[Upperbound(ls_array) + 1 ] = "TriggerEvent"
ls_array[Upperbound(ls_array) + 1 ] = "TypeOf"
ls_array[Upperbound(ls_array) + 1 ] = "PrintCancel"
ls_array[Upperbound(ls_array) + 1 ] = "Scroll"
ls_array[Upperbound(ls_array) + 1 ] = "SetWSObject"	
ls_array[Upperbound(ls_array) + 1 ] = ""


ls_path = gs_cachedir
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
	choose case lower(ls_item)
		case lower("AcceptText")	
			dw_1.setcolumn(4)
			dw_1.settext('appeon')
			li_rtn = dw_1.AcceptText()
			if not isnull(li_rtn) and li_rtn = 1  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("ClassName")	
			ls_temp = dw_1.ClassName()
			if not isnull(ls_temp) and ls_temp ="dw_1"  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 		
		case lower("ClearValues")	
//			Return Values
//			Returns 1 if it succeeds and –1 if an error occurs. The return value is usually not used.
			li_rtn = dw_1.ClearValues(4)
			if not isnull(li_rtn) and li_rtn = 1  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Clipboard")	
			li_rtn = dw_1.Clipboard("gr_1")
			if not isnull(li_rtn) and li_rtn = 1  then
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Create")	
			ls_temp = dw_1.object.datawindow.syntax
			dw_1.dataobject="RTDWFUNCNE_d03_grid"
			li_rtn = dw_1.Create(ls_temp,ls_temp2)
			dw_1.SetTransObject(sqlca)
			dw_1.Retrieve()
			if not isnull(li_rtn) and li_rtn=1 and Len(ls_temp2) = 0 and dw_1.rowcount( ) > 0 then
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if			
		case lower("DeletedCount")
			dw_1.reset( )
			dw_1.dataobject="RTDWFUNCNE_d01_ascii"
			dw_1.settransobject( sqlca)
			dw_1.retrieve( )
			
			dw_1.deleterow(4)
			dw_1.deleterow(5)
			dw_1.deleterow(1)
			ll_tmp = dw_1.DeletedCount()
			if not isnull(ll_tmp) and ll_tmp = 3  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("DeleteRow")
			li_rtn = dw_1.DeleteRow(1)
			if not isnull(li_rtn) and li_rtn = 1  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Describe")
			dw_1.reset( )
			dw_1.dbcancel( )
			dw_1.dataobject="RTDWFUNCNE_d01_ascii"
			dw_1.settransobject( sqlca)
			dw_1.retrieve( )
			
			ls_temp = dw_1.Describe("Datawindow.richtext.HeaderFooter")
			if not isnull(ls_temp) and ls_temp = "yes"  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Drag")
			li_rtn = dw_1.Drag(begin!)					//后面直接接 dw_1.reset( ) and dw_1.retrieve( ) 等， PB 崩溃		(lost the end! drag.)
			if not isnull(li_rtn) and li_rtn = 1  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " begin = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " begin = "+String ( "Fail!" ) +"~r~n"
			end if 
			li_rtn = dw_1.Drag(End!)	
			if not isnull(li_rtn) and li_rtn = 1  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " End = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " End = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("FilteredCount")
			dw_1.setfilter("emp_id>4")
			dw_1.filter()
			ll_tmp = dw_1.FilteredCount()
			if not isnull(ll_tmp) and ll_tmp = 4  then 			 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("FindGroupChange")
			ll_tmp = dw_1.findgroupchange( 1,1)
			if not isnull(ll_tmp) and ll_tmp = 0  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("FindRequired")
			ll_startline = 0 
			ll_startchar = 0
			li_col = 0 
			lbn_flag =false
			dw_1.Modify("emp_name.edit.Required=yes")
			dw_1.insertrow(0)		
			li_rtn = dw_1.FindRequired(Primary!,ll_startline,li_col,ls_temp,lbn_flag)
			if not isnull(li_rtn) and li_rtn = 1 and ll_startline = 7 and li_col = 4 and ls_temp = 'emp_name' and lbn_flag = false  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("GetBorderStyle")
			border B2
			B2 = dw_1.GetBorderStyle(4)
			IF isnull(B2) THEN			//and B2 = NoBorder! 		//函数执行失败，返回null
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("GetRow")
			dw_1.setrow(7)
		 	ll_tmp = dw_1.GetRow()
			if not isnull(ll_tmp) and ll_tmp = 7  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("GetRowFromRowId")
			ll_tmp=dw_1.GetRowIDFromRow(4)
		   	dw_1.deleterow(3)
			ll_position = dw_1.GetRowFromRowId(ll_tmp)
			if not isnull(ll_position) and ll_position = 3  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("GetRowIdFromRow")
			ll_tmp=dw_1.GetRowIDFromRow(4)
			if not isnull(ll_tmp) and ll_tmp = 9 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("GetSQLSelect")
			ls_temp = dw_1.GetSQLSelect()
			if not isnull(ls_temp) and left(ls_temp,len("  SELECT PUB_T_RICHTEXTEDIT")) = "  SELECT PUB_T_RICHTEXTEDIT" then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("GetValidate")
			dw_1.object.emp_name.Validation='"emp_name<>~'Appeon~'"'
			ls_temp = dw_1.GetValidate(4)
			if not isnull(ls_temp) and ls_temp ="emp_name<>~'Appeon~'" then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("GetValue")
			ls_temp = dw_1.GetValue(4,1)										//函数执行失败，返回空字符串
			if not isnull(ls_temp) and ls_temp ="" then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 	
		case lower("GroupCalc")
			dw_1.dbcancel( )
			dw_1.reset( )
			dw_1.clear( )
			dw_1.dataobject="RTDWFUNCNE_d01_ascii"
			dw_1.settransobject( sqlca)
			dw_1.retrieve( )
			li_rtn = dw_1.GroupCalc()						//函数执行失败，返回-1
			if not isnull(li_rtn) and li_rtn = -1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Hide")
			li_rtn = dw_1.Hide()
			if not isnull(li_rtn) and li_rtn =1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("ImportClipboard")
			clipboard("")
			ls_temp2 ="101~t1~t101~temp101~tW~t1978-11-02 18:20:25~t27~t5500.50~t中国人~r~n"+&
					 "102~t1~t102~temp102~tM~t1979-12-11 21:30:25~t26~t6500.45~t中国人~r~n"+&
					 "103~t1~t103~temp103~tW~t1978-04-05 01:32:45~t27~t7050.31~t外国人~r~n"+&
					 "104~t1~t104~temp104~tM~t1977-06-12 03:50:00~t28~t4500.00~t美国人~r~n"+&
					 "105~t1~t105~temp105~tW~t1978-09-08 00:00:00~t27~t5000.12~t外星人~r~n"
			clipboard(ls_temp2)		 
			ll_tmp = dw_1.ImportClipboard()
			if not isnull(ll_tmp) and ll_tmp =5 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("ImportString")
			clipboard("")
			ls_temp2 ="101~t1~t101~temp101~tW~t1978-11-02 18:20:25~t27~t5500.50~t中国人~r~n"+&
					 "102~t1~t102~temp102~tM~t1979-12-11 21:30:25~t26~t6500.45~t中国人~r~n"+&
					 "103~t1~t103~temp103~tW~t1978-04-05 01:32:45~t27~t7050.31~t外国人~r~n"+&
					 "104~t1~t104~temp104~tM~t1977-06-12 03:50:00~t28~t4500.00~t美国人~r~n"+&
					 "105~t1~t105~temp105~tW~t1978-09-08 00:00:00~t27~t5000.12~t外星人~r~n"
			ll_tmp = dw_1.ImportString(ls_temp2)					
			if not isnull(ll_tmp) and ll_tmp =5 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("ImportFile")							// bug
			ls_temp2 ="101~t1~t101~temp101~tW~t1978-11-02 18:20:25~t27~t5500.50~t中国人~r~n"+&
					 "102~t1~t102~temp102~tM~t1979-12-11 21:30:25~t26~t6500.45~t中国人~r~n"+&
					 "103~t1~t103~temp103~tW~t1978-04-05 01:32:45~t27~t7050.31~t外国人~r~n"+&
					 "104~t1~t104~temp104~tM~t1977-06-12 03:50:00~t28~t4500.00~t美国人~r~n"+&
					 "105~t1~t105~temp105~tW~t1978-09-08 00:00:00~t27~t5000.12~t外星人~r~n"
			clipboard("")
			
			ls_file = "RTDWFUNCNEW02P04.txt"			 			
			ls_fullname = ls_path + gs_dirseparator+ls_file	
			if fileexists(ls_fullname) then filedelete(ls_fullname)				//add 
			if isvalid(w_controller) then 					
				w_controller.wf_writefile(lower(ls_fullname),blob(ls_temp2,EncodingUTF8!))		//		EncodingUTF16LE!		//EncodingUTF8!
				if not FileExists(ls_fullname)  then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " RTDWFUNCNEW02P04.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " RTDWFUNCNEW02P04.FileExists = "+String ( "Fail!" ) +"~r~n"
			end if 
				
			ll_tmp = dw_1.ImportFile(lower(ls_fullname))
			if not isnull(ll_tmp) and ll_tmp > 0 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function china "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function china "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 			
//			if fileexists(ls_fullname) then filedelete(ls_fullname)
			ls_temp2 ="101~t1~t101~temp101~tW~t1978-11-02 18:20:25~t27~t5500.50~tchina~r~n"+&
						 "102~t1~t102~temp102~tM~t1979-12-11 21:30:25~t26~t6500.45~tchina~r~n"+&
						 "103~t1~t103~temp103~tW~t1978-04-05 01:32:45~t27~t7050.31~tother~r~n"+&
						 "104~t1~t104~temp104~tM~t1977-06-12 03:50:00~t28~t4500.00~tamerica~r~n"+&
						 "105~t1~t105~temp105~tW~t1978-09-08 00:00:00~t27~t5000.12~tother~r~n"
			clipboard("")
			
			ls_file = "RTDWFUNCNEW02P04.txt"			 			
			ls_fullname = ls_path + gs_dirseparator+ls_file	
			if fileexists(ls_fullname) then filedelete(ls_fullname)				//add 
			if isvalid(w_controller) then 					
				w_controller.wf_writefile(lower(ls_fullname),blob(ls_temp2,EncodingANSI!))		
				if not FileExists(ls_fullname)  then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ "2. RTDWFUNCNEW02P04.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ "2. RTDWFUNCNEW02P04.FileExists = "+String ( "Fail!" ) +"~r~n"
			end if 
				
			ll_tmp = dw_1.ImportFile(lower(ls_fullname))
			if not isnull(ll_tmp) and ll_tmp > 0 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function english "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function english "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("ModifiedCount")
			dw_1.dbcancel( )
			dw_1.reset( )
			dw_1.clear( )
			dw_1.dataobject="RTDWFUNCNE_d01_ascii"
			dw_1.settransobject( sqlca)
			dw_1.retrieve( )
			
			dw_1.setitem(1,1,200)
			dw_1.setitem(5,4,'appeon')
			ll_tmp = dw_1.ModifiedCount()
			if not isnull(ll_tmp) and ll_tmp =2 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Modify")
			//修改属性值
			ls_temp = dw_1.Modify("datawindow.richtext.ToolBar=yes")
			if not isnull(ls_temp) and ls_temp ="" then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " ToolBar = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " ToolBar = "+String ( "Fail!" ) +"~r~n"
			end if 
			//动态创建Column
			ls_temp = ""
			ls_temp2 = 'Create column(name=copy_emp_name id=4 band=Detail x="1000" y="1000" width="500" height="100" visible="1" lineremove=no multiline=no width.autosize=yes alignment="0" tabsequence=100 format="[general]" )'
			ls_temp = dw_1.Modify(ls_temp2)
			if not isnull(ls_temp) and ls_temp ="" then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Create Column = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Create Column = "+String ( "Fail!" ) +"~r~n"
			end if 
			//动态创建Compute
			ls_temp2 = 'Create compute(name=copy_compute_detail band=Detail x="500" y="500" width="500" height="500" visible="1" lineremove=no multiline=no width.autosize=yes alignment="0" format="[general]" expression="~~~"Detail:~~~"+year( emp_born )" )'
			ls_temp = dw_1.Modify(ls_temp2)
			if not isnull(ls_temp) and ls_temp ="" then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Create compute = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Create compute = "+String ( "Fail!" ) +"~r~n"
			end if 
			//动态创建BitMap
			ls_file =  'PUB_BMP_APB.bmp'
			ls_fullname = ls_path +gs_dirseparator+ 'PUB_BMP_APB.bmp'
			ls_temp2 = 'Create bitmap(name=p_picture band=Detail x="300" y="300" height="300" width="300" filename="'+ls_file+'" invert="0")'
			ls_temp = dw_1.Modify(ls_temp2)
			if fileexists(ls_fullname) then filedelete(ls_fullname)
			
			if not isnull(ls_temp) and ls_temp ="" then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Create BitMap = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Create BitMap = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			//动态创建Button
			ls_temp2 = 'Create button(band=detail text="none"filename=""action="0" border="1" color="33554432" x="411" y="72" height="92" width="320" vtextalign="0" htextalign="0"  name=b_1 visible="1"  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" )'
			ls_temp = dw_1.Modify(ls_temp2)
			if not isnull(ls_temp) and ls_temp ="" then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Create Button = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Create Button = "+String ( "Fail!" ) +"~r~n"
			end if 			
			
//			//动态销毁Column对象												//bug 
//			ls_temp2 ="destroy column emp_name"
//			ls_temp = dw_1.Modify(ls_temp2)
//			if not isnull(ls_temp) and ls_temp ="" then 			
//				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " destroy column = "+String ( "Success!" ) +"~r~n"
//			else
//				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " destroy column = "+String ( "Fail!" ) +"~r~n"
//			end if
		case lower("Move")
			li_rtn = dw_1.Move(200,200)
			if not isnull(li_rtn) and li_rtn = 1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("ReplaceText")
			dw_1.dbcancel( )
			dw_1.reset( )
			dw_1.clear( )
			dw_1.dataobject="RTDWFUNCNE_d01_ascii"
			dw_1.settransobject( sqlca)
			dw_1.retrieve( )
			
			//替换含图片的被选中内容
			dw_1.selecttext(10,25,10,40)
			ll_tmp = dw_1.ReplaceText("appeon")
			if not isnull(ll_tmp) and ll_tmp = 6 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " picture = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " picture = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			//替换含Inputfield的被选中内容
			ll_tmp = 0
			dw_1.selecttext(10,5,10,20)
			ll_tmp = dw_1.ReplaceText("appeon")
			if not isnull(ll_tmp) and ll_tmp = 6 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " contain Inputfield = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " contain Inputfield = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			//没有选中内容
			ll_tmp = 0
			dw_1.selecttext(3,5,0,0)
			dw_1.post setfocus()
			ll_tmp = dw_1.ReplaceText("appeon")
			if not isnull(ll_tmp) and ll_tmp = 6 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " empty = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " empty = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			//参数为双字节字符
			ll_tmp = 0
			dw_1.selecttext(3,5,0,0)
			dw_1.post setfocus()
			ll_tmp = dw_1.ReplaceText("正阳软件")
			if not isnull(ll_tmp) and ll_tmp = 4 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " double bytes = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " double bytes = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			//焦点在Inputfield上
			ll_tmp = 0
			dw_1.setcolumn(4)
			dw_1.post setfocus()
			ll_tmp = dw_1.ReplaceText("appeon")
			if not isnull(ll_tmp) and ll_tmp = 6 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " focus Inputfield = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " focus Inputfield = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("ResetUpdate")
			dw_1.dbcancel( )
			dw_1.reset( )
			dw_1.clear( )
			dw_1.dataobject="RTDWFUNCNE_d01_ascii"
			dw_1.settransobject( sqlca)
			dw_1.retrieve( )
			
			dw_1.setitem(1,4,'appeon')
			dw_1.setitem(2,4,'sybase')
						
			dw_1.update(true,false)
			li_rtn = dw_1.ResetUpdate()
			if not isnull(li_rtn) and li_rtn = 1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " update = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " update = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			rollback using sqlca;
			ldws_status = dw_1.getitemstatus(1,4,primary!)
			ldws_status2 = dw_1.getitemstatus(2,4,primary!)
			if not isnull(ldws_status) and ldws_status = NotModified! and not isnull(ldws_status) and ldws_status = NotModified! then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " status = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " status = "+String ( "Fail!" ) +"~r~n"
			end if 				
		case lower("Resize")
			//1、函数执行成功，返回1
			//2、dw大小被调整
			li_rtn = dw_1.Resize(2000,1500)
			if not isnull(li_rtn) and li_rtn = 1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 	
		case lower("RowCount")			
			dw_1.deleterow(1)
			dw_1.deleterow(1)
			dw_1.deleterow(1)
			ll_tmp = dw_1.RowCount()
			if not isnull(ll_tmp) and ll_tmp = 7 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 				
		case lower("RowsCopy")
			li_rtn = dw_1.RowsCopy(5,8,primary!,dw_1,1,primary!)
			if not isnull(li_rtn) and li_rtn = 1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("RowsDiscard")
			li_rtn = dw_1.RowsDiscard(1,5,primary!)
			if not isnull(li_rtn) and li_rtn = 1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("RowsMove")
			li_rtn = dw_1.RowsMove(1,5,primary!,dw_1,1,delete!)
			if not isnull(li_rtn) and li_rtn = 1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("SaveAsAscii")														//bug , after save, the file donot have any content.
			dw_1.dbcancel( )
			dw_1.reset( )
			dw_1.clear( )
			dw_1.dataobject="RTDWFUNCNE_d01_ascii"
			dw_1.settransobject( sqlca)
			dw_1.retrieve( )
			
			ll_tmp = dw_1.SaveAsAscii("RTDWFUNCNEW03P01.txt")
			if not isnull(ll_tmp) and ll_tmp = 1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
			ll_tmp = 0 
			ll_tmp = FileLength64 ( "RTDWFUNCNEW03P01.txt" )
			if not isnull(ll_tmp) and ll_tmp = 1 then
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " FileLength64 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " FileLength64 = "+String ( "Fail!" ) +"~r~n"
			end if	
			if fileexists( "RTDWFUNCNEW03P01.txt") then filedelete( "RTDWFUNCNEW03P01.txt")			
		case lower("SetBorderStyle") 																	//bug 					 
			li_rtn = dw_1.SetBorderStyle(4,Raised!)
			if not isnull(li_rtn) and li_rtn = 1 then
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("SetFilter")		
			li_rtn = dw_1.SetFilter("emp_id>4")
			ll_tmp = dw_1.Filter()
			if not isnull(li_rtn) and li_rtn = 1 and not isnull(ll_tmp) and ll_tmp > 0 and dw_1.rowcount() > 0 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("Filter")	
			ll_position = dw_1.rowcount()
			dw_1.SetFilter("")
			ll_tmp = dw_1.Filter()
			if not isnull(ll_tmp) and ll_tmp = 1 and dw_1.rowcount() > ll_position then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if			
		case lower("SetFormat")				
			li_rtn = dw_1.SetFormat(6,'yyyy-m-d')
			ls_temp = dw_1.GetFormat(6)
			if not isnull(li_rtn) and li_rtn = 1 and not isnull(ls_temp) and ls_temp = 'yyyy-m-d' then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("SetItem")	
			li_rtn = dw_1.SetItem(1,4,'Appeon')
			ls_temp =  dw_1.getitemstring(1,4)  
			if not isnull(li_rtn) and li_rtn = 1 and not isnull(ls_temp) and ls_temp = 'Appeon' then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("SetItemStatus")		
			li_rtn = dw_1.SetItemStatus(1,0,PriMary!,NewModified!)
			ldws_status = dw_1.GetItemStatus(1,0,PriMary!)
			if not isnull(li_rtn) and li_rtn = 1 and not isnull(ldws_status) and ldws_status = NewModified! then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("SetRowFocusIndicator")		
			li_rtn = dw_1.SetRowFocusIndicator(Hand!)
			if not isnull(li_rtn) and li_rtn = 1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("SetSort")			
			li_rtn = dw_1.SetSort("emp_id desc")
			dw_1.Sort()
			if not isnull(li_rtn) and li_rtn = 1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("Sort")		
			dw_1.SetSort("emp_id desc")
			li_rtn = dw_1.Sort()
			if not isnull(li_rtn) and li_rtn = 1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("SetSQLSelect")		
			 ls_temp2 = "SELECT  PUB_T_RICHTEXTEDIT.emp_id ,"+&
           						"PUB_T_RICHTEXTEDIT.dep_id ,"+&
          						"PUB_T_RICHTEXTEDIT.emp_code ,"+&
           						"PUB_T_RICHTEXTEDIT.emp_name ,"+&
           						"PUB_T_RICHTEXTEDIT.emp_sex ,"+&
									"PUB_T_RICHTEXTEDIT.emp_born ,"+&
									"PUB_T_RICHTEXTEDIT.emp_age ,"+&
									"PUB_T_RICHTEXTEDIT.emp_salary ,"+&
									"PUB_T_RICHTEXTEDIT.emp_remark "+&   
								  "FROM PUB_T_RICHTEXTEDIT      "+&
								  "WHERE ( PUB_T_RICHTEXTEDIT.emp_id >= 10 and PUB_T_RICHTEXTEDIT.emp_id <= 20 )"
			li_rtn = dw_1.SetSQLSelect(ls_temp2)	
			dw_1.retrieve( )
			if not isnull(li_rtn) and li_rtn = 1 and dw_1.rowcount( ) = 11 and dw_1.getitemnumber(1, "emp_id") >= 10  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("SetTabOrder")		
			li_rtn = dw_1.SetTabOrder(4,25)
			ls_temp = dw_1.Describe("#4.tabsequence")
			if not isnull(li_rtn) and li_rtn = 1 and not isnull(ls_temp) and ls_temp = '25'  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("SetValidate")		
			li_rtn = dw_1.SetValidate(4,"isNumber(GetText())")
			if not isnull(li_rtn) and li_rtn = 1  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("SetValue")		
			li_rtn = dw_1.SetValue(4,1,"appeon")		//期望函数执行失败，始终返回-1
			if not isnull(li_rtn) and li_rtn = -1  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("ShareDataOff")		
			dw_1.dbcancel( )
			dw_1.reset( )
			dw_1.clear( )
			dw_1.dataobject="RTDWFUNCNE_d01_ascii"
			dw_1.settransobject( sqlca)
			dw_1.retrieve( )
			
			lds_data = create datastore
			lds_data.dataobject = "rtdwfuncne_d03_grid"
			li_rtn = dw_1.sharedata(lds_data)
			ll_tmp = lds_data.rowcount() 
			dw_1.ShareDataOff()
 			if not isnull(li_rtn) and li_rtn = 1 and not isnull(ll_tmp) and ll_tmp = dw_1.rowcount() and lds_data.rowcount() = 0 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
			destroy lds_data
			
		case lower("Update")					
			ll_tmp = dw_1.rowcount()
			ll_position = dw_1.insertrow(0)					//insert
			dw_1.setitem(1,4,"appeon")							//update
			dw_1.setitem(ll_position,1,100)
			dw_1.setitem(ll_position,2,2)
			dw_1.setitem(ll_position,4,'sybase')
			dw_1.deleterow(3)									//delete
			li_rtn = dw_1.Update()		
			if not isnull(li_rtn) and li_rtn = 1 and dw_1.getitemString(1,4) = "appeon" and ll_tmp =  dw_1.rowcount() then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " = "+String ( "Fail!" ) +"~r~n"
			end if
			
			if li_rtn=1 then 
				commit using sqlca;
			else
				rollback using sqlca;
			end if		
			
			//data recover
			sqlca.autocommit = true
			declare mypro procedure for pub_t_richtextedit_recover using sqlca;
			execute mypro ;
			sqlca.autocommit = false
			
		case lower("GetBandAtPointer")	
			//当前区在Detail区
			dw_1.showheadfoot(false)
			dw_1.SetRow(5)
			ls_temp = dw_1.GetBandAtPointer()
			if not isnull(ls_temp) and ls_temp = "detail	5" then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ls_temp = ""
			dw_1.showheadfoot(true)
			dw_1.SetRow(5)			
			dw_1.selecttext(2,2,0,0,header!)
			ls_temp = dw_1.GetBandAtPointer()
			if not isnull(ls_temp) and ls_temp = "header	5" then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " header = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " header = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ls_temp = ""
			dw_1.showheadfoot(true)
			dw_1.SetRow(5)
			dw_1.selecttext(2,2,0,0,footer!)
			ls_temp = dw_1.GetBandAtPointer()
			if not isnull(ls_temp) and ls_temp = "footer	5" then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " footer = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " footer = "+String ( "Fail!" ) +"~r~n"
			end if
			
			dw_1.showheadfoot(false)
//		case lower("GetClickedColumn")			
//			dw_1.SetRow(1)
//			dw_1.scrolltorow( 1)
//			dw_1.event clicked(120, 200, 1,dw_1.object.emp_id)
//			dw_1.SetColumn(1)
//			ll_tmp = dw_1.getclickedcolumn( )
//			if not isnull(ll_tmp) and ll_tmp = 1 then 			
//				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
//			else
//				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
//			end if
		case lower("GetClickedRow")	
			dw_1.SetRow(7)
			ll_tmp = dw_1.getclickedrow( )
			if not isnull(ll_tmp) and ll_tmp = 7 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("GetFormat")			
			ls_temp = dw_1.GetFormat("emp_born")			
			if not isnull(ls_temp) and ls_temp = 'yyyy-mm-dd' then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ls_temp = ""
			li_rtn = dw_1.SetFormat(6,'yyyy-m-d')
			ls_temp = dw_1.GetFormat(6)
			if not isnull(ls_temp) and ls_temp = 'yyyy-m-d' then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " set = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " set = "+String ( "Fail!" ) +"~r~n"
			end if
//		case lower("GetItemDate")			
		case lower("GetItemDateTime")		
			setnull(ldt_datatime)
			ldt_datatime = dw_1.getitemdatetime( dw_1.getrow(), "emp_born")
			ll_tmp = year(date(ldt_datatime))
			if not isnull(ldt_datatime) and ll_tmp > 1900 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("GetItemDecimal")					
			setnull(ldc_data)
			ldc_data = dw_1.getitemdecimal( dw_1.getrow(), "emp_salary")
			if not isnull(ldc_data) and ldc_data > 0 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("GetItemNumber")							
			ll_tmp = dw_1.getitemnumber( dw_1.getrow(), "emp_age")
			if not isnull(ll_tmp) and ll_tmp > 0 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("GetItemString")					
			ls_temp = dw_1.GetItemString( dw_1.getrow(), "emp_name")
			if not isnull(ls_temp) and len(ls_temp) > 0 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("GetItemTime")	
			setnull(lt_time)
			lt_time = dw_1.getitemtime( dw_1.getrow(), "EXP_BORN_time")
			if not isnull(lt_time) and hour(lt_time) > 0 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("GetNextModified")		
			ls_temp = dw_1.GetItemString( 2, "emp_name")
			dw_1.setitem( 2,"emp_name", ls_temp)
			dw_1.accepttext( )
			ll_tmp = dw_1.GetNextModified(0, Primary!)
			if not isnull(ll_tmp) and ll_tmp  = 2  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if			
		case lower("GetParent")				
			setnull(lw_win)
			lw_win = dw_1.getparent( )
			if not isnull(lw_win) and isvalid(lw_win) and lw_win.classname( ) = 'w_datawindow_style_richtext' then
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("GetSQLPreview")	
			dw_1.dbcancel( )
			dw_1.reset( )
			dw_1.clear( )
			dw_1.dataobject="rtdwfuncne_d01_ascii"
			dw_1.settransobject( sqlca)
			dw_1.retrieve( )
//			ls_temp= dw_1.GetSqlpreview( ) //only use it in the SqlPreview event.
			
			if not isnull(is_log) and pos(lower(is_log), lower("sqlpreview event")) > 0 and pos(lower(is_log), lower("sqlsyntax=GetSqlPreview() is true")) > 0  then		//"sqlsyntax=GetSqlPreview() is true" not exists
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if						
		case lower("GetStateStatus")		
			ll_tmp =  dw_1.GetStateStatus(lblb_cookie)
			if not isnull(ll_tmp) and ll_tmp  = 1  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if	
		case lower("GetUpdateStatus")		
			dw_1.setitem(2, "emp_age",'emp_age')
			dw_1.accepttext( )
			dw_1.update()
 			
			if not isnull(is_log) and pos(lower(is_log), lower("sqlpreview event")) > 0 and pos(lower(is_log), lower("sqlsyntax=() is true")) > 0  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if						
		case lower("PointerX")								
			ll_tmp = dw_1.pointerx( )
			if not isnull(ll_tmp) and ll_tmp  > 0  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if	
		case lower("PointerY")			
			ll_tmp = dw_1.pointery( )		
			if not isnull(ll_tmp) and ll_tmp  > 0  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if	
		case lower("ReselectRow")													//bug
//			Return Values
//			Returns 1 if it is successful and –1 if the row cannot be reselected (for example, the DataWindow object cannot be updated or 
//				the row was deleted by another user). 
//
//			If any argument's value is null, in PowerBuilder and JavaScript the method returns null.
			dw_1.reset( )
			dw_1.dataobject= 'rtdwfuncne_d01_ascii'
			dw_1.settransobject( sqlca)
			dw_1.retrieve( )
			ls_temp = dw_1.GetItemString( 2, "emp_name")
			dw_1.setitem( 2,"emp_name", "sybase002")				//emp002
			dw_1.accepttext( )
			
			ll_tmp = dw_1.ReselectRow(2)
			ls_temp = dw_1.GetItemString( 2, "emp_name")
			if not isnull(ll_tmp) and ll_tmp  = 1 and not isnull(ls_temp) and ls_temp = 'emp002' then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if	
//		case lower("ResetDataColors")								
		case lower("ResetTransObject")			
			dw_1.reset( )
			ll_tmp = dw_1.ResetTransObject()
			dw_1.SetTransObject(sqlca)
			dw_1.retrieve( )
			
			if not isnull(ll_tmp) and ll_tmp  = 1 and dw_1.rowcount() > 0   then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if	
		case lower("Retrieve")	
			dw_1.reset( )
			dw_1.dataobject= 'rtdwfuncne_d01_ascii'
			dw_1.settransobject( sqlca)
			ll_tmp = dw_1.retrieve( )
			if not isnull(ll_tmp) and ll_tmp= dw_1.rowcount() and ll_tmp  > 0  then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if	
		case lower("ScrollToRow")		
			ll_tmp = dw_1.scrolltorow( 6)
			if not isnull(ll_tmp) and ll_tmp= 1  and not isnull(is_log)  and pos(lower(is_log), lower('rowfocuschaned')) > 0 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if	
//		case lower("SetChanges")					
//		case lower("SetPosition")		
		case lower("SetSQLPreview")				
			//When to call SetSQLPreview Call this method only in the script for the SQLPreview event.
			ls_temp = dw_1.GetItemString( 2, "emp_name")
			dw_1.setitem( 2,"emp_name", "SetSQLPreview002")				//emp002	default // SetSQLPreview003 use replace
			dw_1.accepttext( )			
			dw_1.update( )
			
			ls_temp = dw_1.GetItemString( 2, "emp_name")
			if not isnull(is_log) and pos(lower(is_log), lower("sqlpreview event")) > 0 and not isnull(ls_temp) and lower(ls_temp) = lower('SetSQLPreview002' ) then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			dw_1.reset( )			
			dw_1.SetTransObject(sqlca)
			dw_1.retrieve( )
			ls_temp = dw_1.GetItemString( 2, "emp_name")
			if not isnull(ls_temp) and lower(ls_temp) = lower('SetSQLPreview003' ) then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " new data = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " new data = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			//data recover
			sqlca.autocommit = true
			declare mypro1 procedure for pub_t_richtextedit_recover using sqlca;
			execute mypro1 ;
			sqlca.autocommit = false
			
		case lower("SetTransObject")	
			dw_1.reset( )
			dw_1.dataobject= 'rtdwfuncne_d01_ascii'
			li_rtn =	dw_1.settransobject( sqlca)
			dw_1.retrieve( )			
			if not isnull(li_rtn) and li_rtn = 1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if	
		case lower("Show")	
			li_rtn = dw_1.hide()
			sleep(3)
			dw_1.show( )
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if				
		case lower("TriggerEvent")	
			li_rtn = dw_1.triggerevent( Clicked!, 0, 0) 
			if not isnull(li_rtn) and li_rtn = 1 and pos(lower(is_log), lower('Clicked')) > 0 then
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if	
		case lower("TypeOf")		
			setnull(lpo_object)
			lpo_object = dw_1.typeof( )
			if not isnull(lpo_object) and lpo_object = datawindow! then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("PrintCancel")			
			if FileExists("PrintCancelTest1.xps") then filedelete("PrintCancelTest1.xps")
			if FileExists("PrintCancelTest1.oxps") then filedelete("PrintCancelTest1.oxps")
			is_type = "PrintCancel"
			yield()
			timer(1)

			il_job = PrintOpen("Test The Richtext Datawindow Print",false)
			PrintDataWindow ( il_job, dw_1 )
			li_rtn = PrintCancel(il_job)
			if not isnull(il_job) and il_job > 0 then PrintClose(il_job)
			if not isnull(is_log) and pos(lower(is_log), lower('printstart:')) > 0 and not isnull(li_rtn) and li_rtn = 1 and &
				not FileExists("PrintCancelTest1.xps") and not FileExists("PrintCancelTest1.oxps") then
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " job = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " job = "+String ( "Fail!" ) +"~r~n"
			end if	
			
//			//printsend
//			is_type = "PrintCancel2"
//			li_rtn = 0 
//			is_log = ""		
//			if FileExists("PrintCancelTest1.xps") then
//				FileDelete("PrintCancelTest1.xps")
//			end if
//			yield()
//			
//			li_rtn = dw_1.Print(true, false)
//////			li_rtn = dw_1.PrintCancel()			// move to printstart event.
//			if not isnull(is_log) and pos(lower(is_log), lower('printstart:')) > 0 and pos(lower(is_log), lower('PrintCancel=1')) > 0 and &
//				not FileExists("PrintCancelTest1.xps")  then
//				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " job = "+String ( "Success!" ) +"~r~n"
//			else
//				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " job = "+String ( "Fail!" ) +"~r~n"
//			end if				
		case lower("Scroll")	
//			Return Values
//			Scroll returns the line number of the first visible line in dwcontrol if it succeeds. Scroll returns –1 if an error occurs. 
//			If any argument's value is null, Scroll returns null.
			dw_1.setrow(1)
			dw_1.scrolltorow(1)
						
			ll_tmp = dw_1.Scroll(-4)											//This is will lose
			if not isnull(ll_tmp) and ll_tmp = -1 then 						//This is will lose
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " lose = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " lose = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			ll_tmp = 0
			ll_tmp = dw_1.Scroll(4)
			//if not isnull(ll_tmp) and ll_tmp = 1 then 	
			if not isnull(ll_tmp) and ll_tmp = -1 then
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " get down = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " get down = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			ll_tmp = 0
			ll_tmp = dw_1.Scroll(-4)
			//if not isnull(ll_tmp) and ll_tmp = 1 then
			if not isnull(ll_tmp) and ll_tmp = -1 then
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " get up = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " get up = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			ll_tmp = 0
			setnull(li_rtn)
			ll_tmp = dw_1.Scroll(li_rtn)
			if  isnull(ll_tmp) then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " null = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " null = "+String ( "Fail!" ) +"~r~n"
			end if	
			
		case lower("SetWSObject")
			int ii_return
			wsconnection ws_1
			ws_1 = create wsconnection
			ws_1.username = "johndoe"
			ws_1.password = "mypassword"
			ws_1.endpoint = "myendpoint"
			ws_1.authenticationmode = "basic"
			ws_1.usewindowsintegratedauthentication = true
			li_rtn = dw_1.setwsobject (ws_1)
			if not isnull(li_rtn) and li_rtn = 1 then 			
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " set = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " set = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			destroy ws_1
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

//gf_returnresult(ls_result)
is_resultlog += ls_result


end subroutine

public subroutine of_testcase_point_module3 ();dw_1.dataobject= 'd_richtext_datawindow1'
dw_1.settransobject( sqlca)

dw_1.retrieve( )

string ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_default_dataobject, ls_null
long	ll_bound, i , ll_tmp, ll_null, ll_position
long 	ll_startline, ll_startchar, ll_endline, ll_endchar
string ls_path, ls_file, ls_fullname
integer li_rtn
Band			lb_Band
FileType 		lft_type
boolean		lbn_flag 


//ls_china   = "正阳软件是一家专门从事研发和营销企业级软件产品的公司，成立于美国硅谷，2001年12月在深圳建立研发中心。正阳软件在企业应用级软件的结构性变革中，一直占据技术上的领先地位，其申请的多项发明专利，解决了互联网软件的局限性，这些技术发明对企业开发与应用互联网软件产生深远的影响，也使正阳软件成为全球最早确认并解决了网络浏览器在访问企业软件方面局限性的公司。"
//ls_english = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'			
is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

//RichText.property DataWindow object event
ls_array[Upperbound(ls_array) + 1 ] = "InsertDocument"			 
ls_array[Upperbound(ls_array) + 1 ] = "FindNext"			 
ls_array[Upperbound(ls_array) + 1 ] = "Position"		
ls_array[Upperbound(ls_array) + 1 ] = "ScrollNextPage"	
ls_array[Upperbound(ls_array) + 1 ] = "ScrollPriorPage"	
ls_array[Upperbound(ls_array) + 1 ] = "ShowHeadFoot"	
ls_array[Upperbound(ls_array) + 1 ] = "Print"	
ls_array[Upperbound(ls_array) + 1 ] = "Saveas"				//?		save pdf bug //
ls_array[Upperbound(ls_array) + 1 ] = "DataSource"	

ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	Yield ( )
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")
	is_log = ''
	ls_temp = ''
	choose case lower(ls_item)
		case lower('InsertDocument')			
			ls_path = gs_cachedir			
			//filename is null
			setnull(ls_fullname)
			li_rtn = dw_1.InsertDocument(ls_fullname,  true, FileTypeRichText!)
			if  isnull(li_rtn) then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " filename is null = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " filename is null = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			//clearflag is null
			setnull(lbn_flag)
			ls_file = "rtdwfuncspw03_rtf03_table.rtf"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			li_rtn = dw_1.InsertDocument(ls_fullname,  lbn_flag, FileTypeRichText!)
			if isnull(li_rtn) then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " clearflag is null = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " clearflag is null = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			//FILETYPE is null
			SetNull(lft_type)
			ls_file = "rtdwfuncspw03_rtf03_table.rtf"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			li_rtn = dw_1.InsertDocument(ls_fullname,  true, lft_type)
			if isnull(li_rtn) then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " FILETYPE is null = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " FILETYPE is null = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			ls_file = "rtdwfuncspw03_rtf03_table.rtf"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf03_table.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf03_table.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = dw_1.InsertDocument(ls_fullname,  true, FileTypeRichText!)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtf.clearflag=true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtf.clearflag=true = "+String ( "Fail!" ) +"~r~n"
			end if 	
	
			ls_file ="rtdwfuncspw03_rtf04_drawcontrol.rtf"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf04_drawcontrol.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf04_drawcontrol. FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = dw_1.InsertDocument(ls_fullname,  false, FileTypeRichText!)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtf.clearflag=false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtf.clearflag=false = "+String ( "Fail!" ) +"~r~n"
			end if 		
			
			ls_file = "rtdwfuncspw03_txt01_rtdw.txt"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_txt01_rtdw.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_txt01_rtdw.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = dw_1.InsertDocument(ls_fullname,  false, FileTypeText!)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " txt.clearflag=false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " txt.clearflag=false = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			li_rtn = dw_1.InsertDocument(ls_fullname,  true, FileTypeText!)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " txt.clearflag=true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " txt.clearflag=true = "+String ( "Fail!" ) +"~r~n"
			end if 	
						
//			FileTypeHTML! 			//	HTM or HTML
			ls_file = "rtdwfuncspw01html_drawcontrol.html"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw01html_drawcontrol.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw01html_drawcontrol.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = dw_1.InsertDocument(ls_fullname,  false, FileTypeHTML!)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " html.clearflag=false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " html.clearflag=false = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			li_rtn = dw_1.InsertDocument(ls_fullname,  true, FileTypeHTML!)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " html.clearflag=true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " html.clearflag=true = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			//doc 
			ls_file = "PUB_DOC_APPEON.doc"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " PUB_DOC_APPEON.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " PUB_DOC_APPEON.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = dw_1.InsertDocument(ls_fullname,  false, FileTypeDoc!)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " doc.clearflag=false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " doc.clearflag=false = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			li_rtn = dw_1.InsertDocument(ls_fullname,  true, FileTypeDoc!)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " doc.clearflag=true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " doc.clearflag=true = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			//upgrade ...
			li_rtn = 0
			ls_file ="rtdwfun_rtf05_pb8_sample1.rtf"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfun_rtf05_pb8_sample1.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfun_rtf05_pb8_sample1. FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = dw_1.InsertDocument(ls_fullname,  false, FileTypeRichText!)
			ls_result += wf_result_add(ls_item, " function upgrade pb8 ", not isnull(li_rtn) and li_rtn = 1)	
			
			li_rtn = 0
			ls_file ="rtdwfun_rtf05_pb9_sample1.rtf"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfun_rtf05_pb9_sample1.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfun_rtf05_pb9_sample1. FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = dw_1.InsertDocument(ls_fullname,  false, FileTypeRichText!)
			ls_result += wf_result_add(ls_item, " function upgrade pb9 ", not isnull(li_rtn) and li_rtn = 1)	
			
			li_rtn = 0
			ls_file ="rtdwfun_rtf05_pb10_sample1.rtf"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfun_rtf05_pb10_sample1.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfun_rtf05_pb10_sample1. FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = dw_1.InsertDocument(ls_fullname,  false, FileTypeRichText!)
			ls_result += wf_result_add(ls_item, " function upgrade pb10 ", not isnull(li_rtn) and li_rtn = 1)	
			
			li_rtn = 0
			ls_file ="rtdwfun_rtf05_pb115_sample1.rtf"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfun_rtf05_pb115_sample1.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfun_rtf05_pb115_sample1. FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = dw_1.InsertDocument(ls_fullname,  false, FileTypeRichText!)
			ls_result += wf_result_add(ls_item, " function upgrade pb115 ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower('FindNext')		
			Clipboard('')
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'			
			dw_1.SelectText(1,1,0,0, Detail!)	
			Clipboard(ls_temp2)
			dw_1.paste( )
			dw_1.SelectText(1,1, 1,999, Detail!)	
			li_rtn = dw_1.Find('Appeon',True,True,False,True)
			if not isnull(li_rtn) and li_rtn = len('Appeon') then 				
				dw_1.SelectText(1,40, 1,999, Detail!)	
				li_rtn = dw_1.findnext( )
				if not isnull(li_rtn) and li_rtn = len('Appeon') then 				
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " exists = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " exists = "+String ( "Fail!" ) +"~r~n"
				end if 				
			end if 
			
			//not exists
			dw_1.SelectText(1,1,0,0, Detail!)	
			li_rtn = dw_1.Find('PowerBuilder Help' ,True,True,False,True)
			if not isnull(li_rtn) and li_rtn = len('PowerBuilder Help') then 				
				dw_1.SelectText(1,40, 1,40, Detail!)	
				li_rtn = dw_1.findnext( )
				if not isnull(li_rtn) and li_rtn = 0 then 				
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " not exists = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " not exists = "+String ( "Fail!" ) +"~r~n"
				end if 				
			end if 

		case lower('Position')		
			//SelectText 选择内容的位置，直接使用position获取不正确的问题略过。
			//Passing values to SelectText
			//Because values obtained with Position provide more information that simply a selection range, 
			// you cannot pass the values directly to SelectText. 
			dw_1.reset( )
			dw_1.clear()				//import  it
			dw_1.dataobject= 'd_richtext_datawindow1'
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )
			
//			ls_temp = ''
//			dw_1.selecttext( 1, 1, 2,999, Detail!)
//			ls_temp = dw_1.selectedtext( )		//Names: richtexttest1
//Numbers: 10
//			
//			dw_1.selecttext( 1, 1, 2,999, Header!)
//			ls_temp = dw_1.selectedtext( )				//richtexttest1
//Page 1 of 2
//			
//			dw_1.selecttext( 1, 1, 2,999, Footer!)
//			ls_temp = dw_1.selectedtext( )		//Page 1 of 2

			//1. POSITION,带两个参数，插入点在DETAIL区，没有高亮选中内容，插入点所处行前面有INPUTFIELD
			//default two args 
			ls_temp = ''
			Clipboard('')
			lb_Band = dw_1.position( ll_startline, ll_startchar)
			if not isnull(lb_Band) and lb_Band = Detail! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 1  and &
				ll_startchar = 1 then 				
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default two args = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default two args = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			//default four args 
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 			
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)
			if not isnull(lb_Band) and lb_Band = Detail! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 1  and  &
				ll_startchar = 1 and not isnull(ll_endline) and not isnull(ll_endchar) and ll_endline = 0 and ll_endchar = 0 then 				
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default four args = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " default four args = "+String ( "Fail!" ) +"~r~n"
			end if 
						
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 				
			dw_1.selecttext( 1, 999, 1,999, Detail!)
			lb_Band = dw_1.position( ll_startline, ll_startchar)
			if not isnull(lb_Band) and lb_Band = Detail! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 1 and &
				ll_startchar = Len("Names: richtexttest1") + 1   then 				
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " InputField two args = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " InputField two args = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			ll_endline = 0 
			ll_endchar = 0 
			dw_1.selecttext( 1, 999, 1,999, Detail!)
			dw_1.selectedtext()
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)
			if not isnull(lb_Band) and lb_Band = Detail! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 1 and & 
				ll_startchar = Len("Names: richtexttest1") + 1 and not isnull(ll_endline) and not isnull(ll_endchar) and & 
				ll_endline = 0 and ll_endchar = 0   then 				
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " InputField four args = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " InputField four args = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			ll_endline = 0 
			ll_endchar = 0 
			dw_1.selecttext( 1, 1, 2,12, Detail!)
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)
			if not isnull(lb_Band) and lb_Band = Detail! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 2 and ll_startchar = 12 &
				and not isnull(ll_endline) and not isnull(ll_endchar) and ll_endline = 3 and ll_endchar = 1  then 				
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			ll_endline = 0 
			ll_endchar = 0 
			dw_1.selecttext( 2, 12, 1,1, Detail!)
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)
			//略过这个bug，参考 //Passing values to SelectText 注释
//			if not isnull(lb_Band) and lb_Band = Detail! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 1 and ll_startchar = 1  &
//				and not isnull(ll_endline) and not isnull(ll_endchar) and ll_endline = 2 and ll_endchar =12   then 				
			if not isnull(lb_Band) and lb_Band = Detail! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 2 and ll_startchar = 12 &
				and not isnull(ll_endline) and not isnull(ll_endchar) and ll_endline = 1 and ll_endchar =1   then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail inverse = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Detail inverse = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			//picture
			ls_path = gs_cachedir			
			ls_file = "rtdwfuncspw03_rtf03_table.rtf"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf03_table.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf03_table.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
						
			Clipboard('')
			ll_tmp = dw_1.SelectText( 5,1, 0,0, Detail!)			
 			li_rtn = dw_1.InsertDocument(ls_fullname,  true, FileTypeRichText!)
			ls_temp = ""
			Clipboard('')
		 	ll_tmp = dw_1.SelectText( 17,1, 17,3, Detail!)			//"the " + picture
//			ls_temp = dw_1.SelectedText( )
//			dw_1.copy( )		
			
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			ll_endline = 0 
			ll_endchar = 0 
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)			
			if not isnull(lb_Band) and lb_Band = Detail! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 17  and  &
				ll_startchar = 1 and not isnull(ll_endline) and not isnull(ll_endchar) and ll_endline = 17 and ll_endchar = 3 then 				
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no select picture = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no select picture= "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			ll_tmp = dw_1.SelectText( 17,1, 17,10, Detail!)			//"the " + picture+"Power"
			//dw_1.SelectTextall()
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			ll_endline = 0 
			ll_endchar = 0 
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)
			//略过这个bug，参考 //Passing values to SelectText 注释
//			if not isnull(lb_Band) and lb_Band = Detail! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 14  and  &
//				ll_startchar = 1 and not isnull(ll_endline) and not isnull(ll_endchar) and ll_endline = 14 and ll_endchar = 5 then 		
			if lb_Band = Detail! and ll_startline = 17  and  &
				ll_startchar = 1 and ll_endline = 17 and ll_endchar = 10  then 		
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " select picture = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " select picture= "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			dw_1.reset( )
			dw_1.clear()				//import  it
			dw_1.dataobject= 'd_richtext_datawindow1'
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )

			ls_temp = ''
			ll_tmp = dw_1.SelectText( 2,2, 2,2, Header!)	
						
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			lb_Band = dw_1.position( ll_startline, ll_startchar)
			if not isnull(lb_Band) and lb_Band = Header! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 2 and  &
				ll_startchar = 2  then 				
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " two arg Header = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " two arg Header = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
//			dw_1.showheadfoot( true, true)			//import it 
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 1,1, 2,11, Header!)	
//			ls_temp = dw_1.SelectedText( )
//			dw_1.copy( )		
						
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			ll_endline = 0 
			ll_endchar = 0 
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)
			if not isnull(lb_Band) and lb_Band = Header! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 1 and  &
				ll_startchar = 1 and not isnull(ll_endline) and not isnull(ll_endchar) and ll_endline = 2 and ll_endchar = 11 then 				
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 2,11, 1,1, Header!)	
//			ls_temp = dw_1.SelectedText( )
//			dw_1.copy( )		
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			ll_endline = 0 
			ll_endchar = 0 
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)
			//略过这个bug，参考 //Passing values to SelectText 注释
//			if not isnull(lb_Band) and lb_Band = Header! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 1  and  &
//				ll_startchar = 1 and not isnull(ll_endline) and not isnull(ll_endchar) and ll_endline = 2 and ll_endchar = 11 then 	
			if not isnull(lb_Band) and lb_Band = Header! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 2 and  &
				ll_startchar = 11 and not isnull(ll_endline) and not isnull(ll_endchar) and ll_endline = 1 and ll_endchar = 1 then 	
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header inverse = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Header inverse = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
//			dw_1.showheadfoot( true, false)			//import it 			
			ls_temp = ''
			ll_tmp = dw_1.SelectTextAll(Footer!)
			dw_1.copy( )	
			ls_temp = Clipboard()

			ls_temp = ''
			ll_tmp = dw_1.SelectText( 1,3, 1,3, Footer!)			 
			ls_temp = dw_1.selectedtext( )		 
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			lb_Band = dw_1.position( ll_startline, ll_startchar )
			if not isnull(lb_Band) and lb_Band = Footer! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 1  and  &
				ll_startchar = 3  then 				
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " two arg Footer = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " two arg Footer = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			ls_temp = ''
			ll_tmp = dw_1.SelectText( 1,1, 2,999, Footer!)			 
			ls_temp = dw_1.selectedtext( )		 
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			ll_endline = 0 
			ll_endchar = 0 
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)
			if not isnull(lb_Band) and lb_Band = Footer! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 1  and  &
				ll_startchar = 1 and not isnull(ll_endline) and not isnull(ll_endchar) and ll_endline = 1 and ll_endchar = 11 then 				
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Footer = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Footer = "+String ( "Fail!" ) +"~r~n"
			end if 	

			ll_tmp = dw_1.SelectText( 2,999, 1,1, Footer!)			 
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			ll_endline = 0 
			ll_endchar = 0 
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)
			//略过这个bug，参考 //Passing values to SelectText 注释
//			if not isnull(lb_Band) and lb_Band = Footer! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 1  and  &
//				ll_startchar = 1 and not isnull(ll_endline) and not isnull(ll_endchar) and ll_endline = 1 and ll_endchar = 11 then 		
			if not isnull(lb_Band) and lb_Band = Footer! and not isnull(ll_startline) and not isnull(ll_startchar) and ll_startline = 1  and  &
				ll_startchar = 11 and not isnull(ll_endline) and not isnull(ll_endchar) and ll_endline = 1 and ll_endchar = 1 then 	
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Footer inverse = "+String ( "Success!" ) +"~r~n"
			else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " Footer inverse = "+String ( "Fail!" ) +"~r~n"
			end if 	
		case lower('ScrollNextPage')	
			dw_1.reset( )
			dw_1.clear()															//import  it
			dw_1.dataobject= 'd_richtext_datawindow_nodefault'
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )
//			HeaderFooter property 

			li_rtn = dw_1.ScrollNextPage() 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " one page = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " one page = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.selecttextall( Detail!)
			//picture		
			ls_path = gs_cachedir			
			ls_file = "rtdwfuncspw03_rtf05_dbul.rtf"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf05_dbul.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf05_dbul.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			dw_1.vscrollbar = true 
			li_rtn = dw_1.InsertDocument(ls_fullname,  false, FileTypeRichText!)
			li_rtn = dw_1.scrollnextpage( )
			li_rtn = dw_1.scrollnextpage( )			
//			ls_temp = ""
//			ls_temp = dw_1.Describe("DataWindow.VerticalScrollPosition")				//It donot return the correct value.
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " multi page = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " multi page = "+String ( "Fail!" ) +"~r~n"
			end if 

			// multiple instances of the document
			dw_1.reset( )
			dw_1.clear()															//import  it
			dw_1.dataobject= 'd_richtext_datawindow1'
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )
			
			ll_startline = 0
			ls_temp2 = ''
			dw_1.selecttext(1,1,1, 99)
			ls_temp2 = dw_1.selectedtext( )
			
			ll_tmp = Long(dw_1.Object.DataWindow.FirstRowOnPage)
		 	ll_startline = long(dw_1.Describe("Evaluate('pageabs()', "+string(ll_tmp)+")"))
			 
			li_rtn = 0  
			li_rtn = dw_1.ScrollNextPage() 
			ll_endline = 0 
			ls_temp = ''
			dw_1.selecttext(1,1,1, 99)
			ls_temp = dw_1.selectedtext( )
			
			ll_tmp = Long(dw_1.Object.DataWindow.FirstRowOnPage)
		 	ll_endline = long(dw_1.Describe("Evaluate('pageabs()', "+string(ll_tmp)+")"))
			 
			if not isnull(li_rtn) and li_rtn = 2 and not isnull(ls_temp) and not isnull(ls_temp2)  and ls_temp2 = "Names: richtexttest1~n"  and & 
				ls_temp = "Names: richtexttest2~n" and not isnull(ll_startline) and  not isnull(ll_endline) and ll_startline = 1 and ll_endline = 2 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " multiple instances = "+String ( "Success!" ) +"~r~n"
			else
				if not isnull(li_rtn) and li_rtn = 2 and not isnull(ls_temp) and not isnull(ls_temp2)  and ls_temp2 = "Names: richtexttest1"  and & 
					ls_temp = "Names: richtexttest2" and not isnull(ll_startline) and  not isnull(ll_endline) and ll_startline = 1 and ll_endline = 2 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " multiple instances = (difference values: lost line breaks sympol [-n]) = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " multiple instances = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
		case lower('ScrollPriorPage')	
			dw_1.reset( )
			dw_1.clear()															//import  it
			dw_1.dataobject= 'd_richtext_datawindow_nodefault'
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )

			li_rtn = dw_1.ScrollPriorPage() 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " one page = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " one page = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			dw_1.selecttextall( Detail!)
			//picture		
			ls_path = gs_cachedir			
			ls_file = "rtdwfuncspw03_rtf05_dbul.rtf"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf05_dbul.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " rtdwfuncspw03_rtf05_dbul.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			dw_1.vscrollbar = true 
			li_rtn = dw_1.InsertDocument(ls_fullname,  false, FileTypeRichText!)
			li_rtn = dw_1.scrollnextpage( )
			li_rtn = dw_1.scrollnextpage( )

			li_rtn = dw_1.ScrollPriorPage( )			
//			ls_temp = ""
//			ls_temp = dw_1.Describe("DataWindow.VerticalScrollPosition")				//It donot return the correct value.
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " multi page = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " multi page = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			// multiple instances of the document
			dw_1.reset( )
			dw_1.clear()															//import  it
			dw_1.dataobject= 'd_richtext_datawindow1'
			dw_1.settransobject( sqlca)			
			dw_1.retrieve( )
			 
			li_rtn = 0  
			li_rtn = dw_1.ScrollNextPage() 
			ll_endline = 0 
			ls_temp = ''
			dw_1.selecttext(1,1,1, 99)
			ls_temp = dw_1.selectedtext( )
			
			ll_tmp = Long(dw_1.Object.DataWindow.FirstRowOnPage)
		 	ll_endline = long(dw_1.Describe("Evaluate('pageabs()', "+string(ll_tmp)+")"))
			 
			li_rtn = 0  
			li_rtn = dw_1.ScrollPriorPage() 
			ll_startline = 0
			ls_temp2 = ''
			dw_1.selecttext(1,1,1, 99)
			ls_temp2 = dw_1.selectedtext( )
			 
			ll_tmp = Long(dw_1.Object.DataWindow.FirstRowOnPage)
		 	ll_startline = long(dw_1.Describe("Evaluate('pageabs()', "+string(ll_tmp)+")"))
			 
			if not isnull(li_rtn) and li_rtn = 1 and not isnull(ls_temp) and not isnull(ls_temp2)  and ls_temp2 = "Names: richtexttest1~n"  and & 
				ls_temp = "Names: richtexttest2~n" and not isnull(ll_startline) and  not isnull(ll_endline) and ll_startline = 1 and ll_endline = 2 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " multiple instances = "+String ( "Success!" ) +"~r~n"
			else
				if not isnull(li_rtn) and li_rtn = 1 and not isnull(ls_temp) and not isnull(ls_temp2)  and ls_temp2 = "Names: richtexttest1"  and & 
				ls_temp = "Names: richtexttest2" and not isnull(ll_startline) and  not isnull(ll_endline) and ll_startline = 1 and ll_endline = 2 then 
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " multiple instances = (difference values: lost line breaks sympol [-n]) = "+String ( "Success!" ) +"~r~n"
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " multiple instances = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
		case lower('ShowHeadFoot')	
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			ll_endline = 0 
			ll_endchar = 0 

			li_rtn = 0 
			li_rtn = dw_1.ShowHeadFoot(true)
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)			
			if li_rtn = 1 and lb_Band =  Header! and &
				ll_startline = 1 and ll_startchar  = 1  and ll_endline = 0 and ll_endchar = 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " one arg true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " one arg true = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			ll_endline = 0 
			ll_endchar = 0 
			
			li_rtn =0 
			li_rtn = dw_1.ShowHeadFoot(false)
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)			
			if not isnull(li_rtn) and li_rtn = 1 and not isnull(lb_Band) and lb_Band =  Detail! and &
				ll_startline = 1 and ll_startchar  = 20  and ll_endline = 5 and ll_endchar = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " one arg false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " one arg false = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			ll_endline = 0 
			ll_endchar = 0 
			
			li_rtn = 0
			li_rtn = dw_1.ShowHeadFoot(true, true)			
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)			
			if li_rtn = 1 and lb_Band =  Header! and &
				ll_startline = 1 and ll_startchar  = 1  and ll_endline = 0 and ll_endchar = 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " two args true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " two args true = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			setnull(lb_Band)
			ll_startline = 0 
			ll_startchar = 0 	
			ll_endline = 0 
			ll_endchar = 0 
			
			li_rtn = 0
			li_rtn = dw_1.ShowHeadFoot(true, false)	
			lb_Band = dw_1.position( ll_startline, ll_startchar, ll_endline, ll_endchar)			
			if li_rtn = 1 and lb_Band =  Footer! and &
				ll_startline = 1 and ll_startchar  = 1  and ll_endline = 0 and ll_endchar = 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " two args no same = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " two args no same = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower('Print')	
			yield()
			is_type = "Print Timer"
			timer(1)
			is_log = ""			
			li_rtn = dw_1.print( )
			if li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no arg = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no arg = "+String ( "Fail!" ) +"~r~n"
			end if 

			is_log = ""			
			li_rtn = dw_1.Print(false)
			if li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " false arg = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " false arg = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""			
			li_rtn = dw_1.Print(true)
			if li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " true arg = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " true arg = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""			
			li_rtn = dw_1.Print(true, false)
			if li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " true arg false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " true arg false = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""			
			li_rtn = dw_1.Print(false, true)
			if li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " false arg true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " false arg true = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""			
			li_rtn = dw_1.Print(true, true)
			if li_rtn = 1 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " true arg true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " true arg true = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower('Saves')										
//			根据saveas的数据类型分别不同格式下是否能正常保存相关数据。      Saveas分类有（ PDF, Excel12(*.xlsb) with headers )
			yield()
			timer(1)
			is_type = "Saveas Timer"
			li_rtn = dw_1.saveas()
			if not isnull(li_rtn) and (li_rtn = -1) and not isnull(is_log) and pos(is_log, 'Cancel')  > 0 then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no arg = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " no arg = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_type = "no"
			ls_path = gs_cachedir		
			
			ls_file = "rcdw_save_pdf1.pdf"													//该测试点 发现bug
			ls_fullname = ls_path+gs_dirseparator+ls_file
			li_rtn = dw_1.saveas(ls_fullname,PDF!, false)
			if not isnull(li_rtn) and li_rtn = 1 and  FileExists(ls_fullname)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " PDF false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " PDF false = "+String ( "Fail!" ) +"~r~n"
			end if 
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			
			ls_file = "rcdw_save_pdf0.pdf"													//该测试点 发现bug
			ls_fullname = ls_path+gs_dirseparator+ls_file
			li_rtn = dw_1.saveas(ls_fullname,PDF!, true)
			if not isnull(li_rtn) and li_rtn = 1 and  FileExists(ls_fullname)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " PDF true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " PDF true = "+String ( "Fail!" ) +"~r~n"
			end if 
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			
			ls_file = "rcdw_save_xlsx1.xlsx"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			li_rtn = dw_1.saveas(ls_fullname,XLSX!, false)
			if not isnull(li_rtn) and li_rtn = 1 and  FileExists(ls_fullname)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " XLSX false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " XLSX false = "+String ( "Fail!" ) +"~r~n"
			end if 
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			
			ls_file = "rcdw_save_xlsx0.xlsx"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			li_rtn = dw_1.saveas(ls_fullname,XLSX!, true)
			if not isnull(li_rtn) and li_rtn = 1 and  FileExists(ls_fullname)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " XLSX true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " XLSX true = "+String ( "Fail!" ) +"~r~n"
			end if 
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			
			ls_file = "rcdw_save_xlsb1.xlsb"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			li_rtn = dw_1.saveas(ls_fullname,XLSB!, false)
			if not isnull(li_rtn) and li_rtn = 1 and  FileExists(ls_fullname)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " XLSB false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " XLSB false = "+String ( "Fail!" ) +"~r~n"
			end if 
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			
			ls_file = "rcdw_save_xlsb0.xlsb"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			li_rtn = dw_1.saveas(ls_fullname,XLSB!, true)
			if not isnull(li_rtn) and li_rtn = 1 and  FileExists(ls_fullname)  then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " XLSB true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " XLSB true = "+String ( "Fail!" ) +"~r~n"
			end if 
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			
		case lower('DataSource')	
			rte_1.clearall( )			
			rte_1.inputfieldnamesvisible = false 			
			rte_1.datasource( dw_1)			
			
			ls_temp = ""
			rte_1.inputfieldinsert("names")			
			ls_temp = rte_1.inputfieldgetdata("names")
			if not isnull(ls_temp) and ls_temp = dw_1.getitemString( dw_1.getrow(), "names") then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " columntype string = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " columntype string = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ""
			rte_1.inputfieldinsert("numbers")			
			ls_temp = rte_1.inputfieldgetdata("numbers")
			if not isnull(ls_temp) and ls_temp = string(dw_1.getitemNumber( dw_1.getrow(), "numbers")) then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " columntype number = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " columntype number = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ""
			rte_1.inputfieldinsert("decimalnum")			
			ls_temp = rte_1.inputfieldgetdata("decimalnum")
			if not isnull(ls_temp) and ls_temp = string(dw_1.getitemDecimal( dw_1.getrow(), "decimalnum")) then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " columntype decimal = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " columntype decimal = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ""
			rte_1.inputfieldinsert("otherdates")			
			ls_temp = rte_1.inputfieldgetdata("otherdates")
			if not isnull(ls_temp) and ls_temp = String(dw_1.getitemDatetime( dw_1.getrow(), "otherdates")) then 
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " columntype datetime = "+String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " columntype datetime = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

//gf_returnresult(ls_result)
is_resultlog += ls_result

end subroutine

on w_datawindow_style_richtext.create
int iCurrent
call super::create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.dw_2=create dw_2
this.cb_5=create cb_5
this.rte_1=create rte_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_8
this.Control[iCurrent+2]=this.cb_7
this.Control[iCurrent+3]=this.cb_6
this.Control[iCurrent+4]=this.dw_2
this.Control[iCurrent+5]=this.cb_5
this.Control[iCurrent+6]=this.rte_1
this.Control[iCurrent+7]=this.cb_4
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.dw_1
end on

on w_datawindow_style_richtext.destroy
call super::destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.dw_2)
destroy(this.cb_5)
destroy(this.rte_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event timer;call super::timer;
if lower(is_type) = lower("Print Timer") then 
	wf_closepopwindow( "Save the file as", 'Cancel')
	wf_closepopwindow( "Save Print Output As", 'Cancel')			//for win10 print machine
	wf_closepopwindow( "Print to File", 'Cancel')
	wf_closepopwindow( "Print", 'Cancel')
elseif lower(is_type) = lower("Saveas Timer") then 
	wf_closepopwindow( "Save the file as", 'Cancel')
	wf_closepopwindow( "Save Print Output As", 'Cancel')			//for win10 print machine
elseif lower(is_type) = lower("Child Print Timer") then 
	wf_closepopwindow( "Save the file as", 'Cancel')
	wf_closepopwindow( "Save Print Output As", 'Cancel')			//for win10 print machine
elseif lower(is_type) = lower("PrintCancel") then 
	wf_closepopwindow( "Save the file as", 'Save')
	wf_closepopwindow( "Print to File", 'OK')
	wf_closepopwindow( "Save Print Output As", 'Save')			//for win10 print machine
end if 
end event

event resize;call super::resize;dw_1.x = 951
dw_1.y = 32
dw_1.width = 1751
dw_1.height = 1144

end event

event ue_preopen;call super::ue_preopen;dw_1.x = 951
dw_1.y = 32
dw_1.width = 1751
dw_1.height = 1144

end event

event ue_init_data;call super::ue_init_data;//data recover
sqlca.autocommit = true
declare initpro procedure for pub_t_richtextedit_recover using sqlca;
execute initpro ;
sqlca.autocommit = false
end event

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"PUB_BMP_BT_EMP.bmp") then
	FileDelete(ls_filepath+"PUB_BMP_BT_EMP.bmp")
end if

if FileExists(ls_filepath+"rtdwfuncspw03_rtf03_table.rtf") then
	FileDelete(ls_filepath+"rtdwfuncspw03_rtf03_table.rtf")
end if

if FileExists(ls_filepath+"rtdwfuncspw03_rtf04_drawcontrol.rtf") then
	FileDelete(ls_filepath+"rtdwfuncspw03_rtf04_drawcontrol.rtf")
end if

if FileExists(ls_filepath+"PUB_DOC_APPEON.doc") then
	FileDelete(ls_filepath+"PUB_DOC_APPEON.doc")
end if
 
if FileExists(ls_filepath+"rtdwfuncspw03_txt01_rtdw.txt") then
	FileDelete(ls_filepath+"rtdwfuncspw03_txt01_rtdw.txt")
end if
  
if FileExists(ls_filepath+"rtdwfuncspw01html_drawcontrol.html") then
	FileDelete(ls_filepath+"rtdwfuncspw01html_drawcontrol.html")
end if 
 
if FileExists(ls_filepath+"rtdwfuncspw03_rtf05_dbul.rtf") then
	FileDelete(ls_filepath+"rtdwfuncspw03_rtf05_dbul.rtf")
end if

if FileExists(ls_filepath+"PrintCancelTest1.xps") then
	FileDelete(ls_filepath+"PrintCancelTest1.xps")
end if

//win10 
if FileExists(ls_filepath+"PrintCancelTest1.oxps") then
	FileDelete(ls_filepath+"PrintCancelTest1.oxps")
end if

if FileExists(ls_filepath+"RTDWFUNCNEW02P04.txt") then
	FileDelete(ls_filepath+"RTDWFUNCNEW02P04.txt")
end if

if FileExists(ls_filepath+"rtdwfun_rtf05_pb8_sample1.rtf") then
	FileDelete(ls_filepath+"rtdwfun_rtf05_pb8_sample1.rtf")
end if
if FileExists(ls_filepath+"rtdwfun_rtf05_pb9_sample1.rtf") then
	FileDelete(ls_filepath+"rtdwfun_rtf05_pb9_sample1.rtf")
end if
if FileExists(ls_filepath+"rtdwfun_rtf05_pb10_sample1.rtf") then
	FileDelete(ls_filepath+"rtdwfun_rtf05_pb10_sample1.rtf")
end if

if FileExists(ls_filepath+"rtdwfun_rtf05_pb115_sample1.rtf") then
	FileDelete(ls_filepath+"rtdwfun_rtf05_pb115_sample1.rtf")
end if

if FileExists(ls_filepath+"origin.rtf") then
	FileDelete(ls_filepath+"origin.rtf")
end if

end event

type cb_8 from commandbutton within w_datawindow_style_richtext
integer x = 46
integer y = 764
integer width = 864
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute richtext function4"
end type

event clicked;of_testcase_point_module5()
end event

type cb_7 from commandbutton within w_datawindow_style_richtext
integer x = 46
integer y = 620
integer width = 864
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute richtext function3"
end type

event clicked;of_testcase_point_module4()
end event

type cb_6 from commandbutton within w_datawindow_style_richtext
integer x = 46
integer y = 476
integer width = 864
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute richtext function2"
end type

event clicked;of_testcase_point_module3()
end event

type dw_2 from datawindow within w_datawindow_style_richtext
integer x = 146
integer y = 1204
integer width = 722
integer height = 408
integer taborder = 50
string title = "none"
string dataobject = "d_richtextdw_composite01"
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within w_datawindow_style_richtext
integer x = 46
integer y = 1052
integer width = 864
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute Other RichText"
end type

event clicked;of_testcase_point_module7()
end event

type rte_1 from richtextedit within w_datawindow_style_richtext
integer x = 951
integer y = 852
integer width = 1728
integer height = 768
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
boolean init_tabsvisible = true
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_headerfooter = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_datawindow_style_richtext
integer x = 46
integer y = 908
integer width = 864
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute column richedit "
end type

event clicked;of_testcase_point_module6()
end event

type cb_3 from commandbutton within w_datawindow_style_richtext
integer x = 46
integer y = 332
integer width = 864
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute richtext function"
end type

event clicked;of_testcase_point_module2()

end event

type cb_2 from commandbutton within w_datawindow_style_richtext
integer x = 46
integer y = 188
integer width = 864
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute richtext event"
end type

event clicked;of_testcase_point_module1()
end event

type cb_1 from commandbutton within w_datawindow_style_richtext
integer x = 46
integer y = 44
integer width = 864
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute richtext property"
end type

event clicked;of_testcase_point_module()
end event

type dw_1 from datawindow within w_datawindow_style_richtext
integer x = 951
integer y = 32
integer width = 1751
integer height = 1144
integer taborder = 10
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event richtextcurrentstylechanged; 

is_log += "richtextcurrentstylechanged: row :"+string(row)+" dwo.name="+string(dwo.name)

return 0 
end event

event richtextlimiterror; 
is_log += "richtextlimiterror: row :"+string(row)+" dwo.name="+string(dwo.name) 

return 0 
end event

event buttonclicked;is_log += "buttonclicked: row :"+string(row)+" dwo.name="+string(dwo.name)+" actionreturncode:"+string(actionreturncode)
end event

event buttonclicking;is_log += "buttonclicking: row :"+string(row)+" dwo.name="+string(dwo.name) 
end event

event clicked;string 	ls_name 

if isnull( dwo) then 
	ls_name  = ''
else
	ls_name = dwo.name
end if 
is_log += " clicked: row :"+string(row)+" dwo.name="+string(ls_name) +" xpos:"+string(xpos)+" ypos: "+string(ypos)

end event

event rowfocuschanged;is_log += "rowfocuschaned event is trigger. row="+string(currentrow)


return 0 

end event

event richtextlosefocus;is_log += "richtextlosefocus: row :"+string(row)+" dwo.name="+string(dwo.name)

return 0 
end event

event constructor; 
is_log += "Constructor event is trigger."

 
end event

event dberror;is_log += "dberror event is trigger. sqldbcode="+string(sqldbcode) 

return 1
end event

event error;is_log += "error: errornumber :"+string(errornumber)+" errortext="+string(errortext)+" errorobject="+errorobject+" errorscript=" +errorscript



end event

event itemerror;is_log += "itemerror: row :"+string(row)+" dwo.name="+string(dwo.name)+" data:"+data 
end event

event wserror;is_log += "wserror: rownum :"+string(rownum)+" errormessage="+string(errormessage)+" operation:"+operation +" buffername="+buffername
end event

event destructor;is_log += "Destructor event is trigger."
end event

event itemchanged; 
is_log += "itemchaned event is trigger. row="+string(row)+" dwo.name="+string(dwo.name) 

 
end event

event itemfocuschanged;is_log += "itemfocuschaned event is trigger. row="+string(row)+" dwo.name="+string(dwo.name) 
end event

event sqlpreview;string 	ls_temp, ls_temp2, ls_temp3
n_string		ln_string

ls_temp = sqlsyntax
//ls_temp = this.GetSqlpreview( )

ls_temp2 = "UPDATE PUB_T_RICHTEXTEDIT SET emp_name = 'SetSQLPreview002' WHERE emp_id = 2 AND dep_id = 1"
ls_temp3 = "UPDATE PUB_T_RICHTEXTEDIT SET emp_name = 'SetSQLPreview003' WHERE emp_id = 2 AND dep_id = 1"
if pos(lower(ls_temp), lower(ls_temp2))  > 0 then 
	ln_string = create n_string
	ls_temp = ln_string.of_globalreplace(lower(ls_temp), lower(ls_temp2), ls_temp3)
	destroy ln_string
 	
	this.setsqlpreview(ls_temp ) 	
end if 

is_log += " sqlpreview event is trigger. row="+string(row) + " sqlpreviewtype="+string(sqltype) 


end event

event printstart;//
integer	 	li_rtn
is_log += "printstart: pagesmax:"+string(pagesmax) 
 
end event

event resize;is_log += " resize: sizetype:"+string(sizetype)+" newwidth="+string(newwidth) +" newheight:"+string(newheight)
end event

event scrollhorizontal;is_log += "scrollhorizontal: scrollpos:"+string(scrollpos)+" pane="+string(pane)
end event

event scrollvertical;is_log += "scrollvertical: scrollpos:"+string(scrollpos) 
end event

event updatestart;is_log += " updatestart: trigger. "
end event

event retrieverow;is_log += "retrieverow event was trigger. row="+string(row)

end event

