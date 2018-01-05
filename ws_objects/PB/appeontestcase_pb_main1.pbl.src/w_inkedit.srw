$PBExportHeader$w_inkedit.srw
forward
global type w_inkedit from w_base_case
end type
type dw_1 from datawindow within w_inkedit
end type
type cb_4 from commandbutton within w_inkedit
end type
type cb_3 from commandbutton within w_inkedit
end type
type cb_2 from commandbutton within w_inkedit
end type
type ie_1 from inkedit within w_inkedit
end type
type cb_1 from commandbutton within w_inkedit
end type
type st_1 from statictext within w_inkedit
end type
end forward

global type w_inkedit from w_base_case
dw_1 dw_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
ie_1 ie_1
cb_1 cb_1
st_1 st_1
end type
global w_inkedit w_inkedit

type variables

end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
end prototypes

public subroutine of_testcase_point_module ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
accessiblerole		asr_other
any					lany_object
PowerObject		lpo_object
InkEditStatus 		lies_status


is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "AccessibleDescription"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "AccessibleName"
ls_array[Upperbound(ls_array) + 1 ] = "AccessibleRole"
ls_array[Upperbound(ls_array) + 1 ] = "Alignment"
ls_array[Upperbound(ls_array) + 1 ] = "BackColor"
ls_array[Upperbound(ls_array) + 1 ] = "Border"
ls_array[Upperbound(ls_array) + 1 ] = "BorderStyle"
ls_array[Upperbound(ls_array) + 1 ] = "BringToTop"
ls_array[Upperbound(ls_array) + 1 ] = "ClassDefinition"
ls_array[Upperbound(ls_array) + 1 ] = "DisplayOnly"
ls_array[Upperbound(ls_array) + 1 ] = "DragAuto"
ls_array[Upperbound(ls_array) + 1 ] = "DragIcon"
ls_array[Upperbound(ls_array) + 1 ] = "Enabled"
ls_array[Upperbound(ls_array) + 1 ] = "FaceName"
ls_array[Upperbound(ls_array) + 1 ] = "Factoid"
ls_array[Upperbound(ls_array) + 1 ] = "FontCharSet"
ls_array[Upperbound(ls_array) + 1 ] = "FontFamily"
ls_array[Upperbound(ls_array) + 1 ] = "FontPitch"
ls_array[Upperbound(ls_array) + 1 ] = "Height"
ls_array[Upperbound(ls_array) + 1 ] = "HScrollBar"
ls_array[Upperbound(ls_array) + 1 ] = "IgnorePressure"
ls_array[Upperbound(ls_array) + 1 ] = "InkAntiAliased"
ls_array[Upperbound(ls_array) + 1 ] = "InkColor"
ls_array[Upperbound(ls_array) + 1 ] = "InkHeight"
ls_array[Upperbound(ls_array) + 1 ] = "InkMode"
ls_array[Upperbound(ls_array) + 1 ] = "InkTransparency"
ls_array[Upperbound(ls_array) + 1 ] = "InkWidth"
ls_array[Upperbound(ls_array) + 1 ] = "InsertAsText"
ls_array[Upperbound(ls_array) + 1 ] = "Italic"
ls_array[Upperbound(ls_array) + 1 ] = "Limit"
ls_array[Upperbound(ls_array) + 1 ] = "Modified"							//bug , PB help 中未标明不能访问，调试中又有该属性值。但是实际代码调用会导致PB崩溃 
ls_array[Upperbound(ls_array) + 1 ] = "PenTip"
ls_array[Upperbound(ls_array) + 1 ] = "Pointer"
ls_array[Upperbound(ls_array) + 1 ] = "RecognitionTimer"
ls_array[Upperbound(ls_array) + 1 ] = "RightToLeft"
ls_array[Upperbound(ls_array) + 1 ] = "Status"
ls_array[Upperbound(ls_array) + 1 ] = "TabOrder"
ls_array[Upperbound(ls_array) + 1 ] = "Tag"
ls_array[Upperbound(ls_array) + 1 ] = "Text"
ls_array[Upperbound(ls_array) + 1 ] = "TextColor"
ls_array[Upperbound(ls_array) + 1 ] = "TextSize"
ls_array[Upperbound(ls_array) + 1 ] = "Underline"
ls_array[Upperbound(ls_array) + 1 ] = "UseMouseForInput"
ls_array[Upperbound(ls_array) + 1 ] = "Visible"
ls_array[Upperbound(ls_array) + 1 ] = "VScrollBar"
ls_array[Upperbound(ls_array) + 1 ] = "Weight"
ls_array[Upperbound(ls_array) + 1 ] = "Width"
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
	li_rtn = 0 
	ls_temp2 = ''
	ll_tmp = 0
	lbn_flag = false
	setnull(lpo_object)
	setnull(lany_object)
	choose case lower(ls_item)
		case lower("AccessibleDescription")	
			ls_temp = ie_1.Accessibledescription
			ls_result += wf_result_add(ls_item, " 1.default ", not isnull(ls_temp) and ls_temp = "")
			
			ie_1.Accessibledescription = "Deletes selected text"
			ls_temp = ""
			ls_temp = ie_1.Accessibledescription
			ls_result += wf_result_add(ls_item, " 2.set ", not isnull(ls_temp) and ls_temp = "Deletes selected text")
			
			ie_1.Accessibledescription =""
			ls_temp = ""
			ls_temp = ie_1.Accessibledescription
			ls_result += wf_result_add(ls_item, " 3.set default", not isnull(ls_temp) and ls_temp = "")			
		case lower("AccessibleName")
			ls_temp = ie_1.AccessibleName
			ls_result += wf_result_add(ls_item, " 1.default ", not isnull(ls_temp) and ls_temp = "")
			
			ie_1.AccessibleName = "Deletes"
			ls_temp = ""
			ls_temp = ie_1.AccessibleName
			ls_result += wf_result_add(ls_item, " 2.set ", not isnull(ls_temp) and ls_temp = "Deletes")
			
			ie_1.AccessibleName =""
			ls_temp = ""
			ls_temp = ie_1.AccessibleName
			ls_result += wf_result_add(ls_item, " 3.set default", not isnull(ls_temp) and ls_temp = "")		
		case lower("AccessibleRole")
			asr_other = ie_1.accessiblerole
			ls_result += wf_result_add(ls_item, " 1.default ", not isnull(asr_other) and asr_other = DefaultRole!)
			
			ie_1.accessiblerole = animationrole!
			setnull(asr_other)
			asr_other = ie_1.accessiblerole 
			ls_result += wf_result_add(ls_item, " 2.set ", not isnull(asr_other) and asr_other = animationrole!)
			
			ie_1.accessiblerole = DefaultRole!
			setnull(asr_other)
			asr_other = ie_1.accessiblerole 
			ls_result += wf_result_add(ls_item, " 3.set default ", not isnull(asr_other) and asr_other = DefaultRole!)			
		case lower("Alignment")
			lany_object = ie_1.alignment
			ls_result += wf_result_add(ls_item, " 1.default ", not isnull(lany_object) and lany_object = Left!)
			
			setnull(lany_object)
			ie_1.alignment = Center!
			lany_object = ie_1.alignment
			ls_result += wf_result_add(ls_item, " 2.Set  Center ", not isnull(lany_object) and lany_object = Center!)

//no such alignment
//			setnull(lany_object)	
//			ie_1.alignment = Justify!
//			lany_object = ie_1.alignment
//			ls_result += wf_result_add(ls_item, " 3.Set  Justify ", not isnull(lany_object) and lany_object = Justify!)
			
			setnull(lany_object)
			ie_1.alignment = Right!
			lany_object = ie_1.alignment
			ls_result += wf_result_add(ls_item, " 3.Set  Right ", not isnull(lany_object) and lany_object = Right!)
			
			setnull(lany_object)
			ie_1.alignment = Left!
			lany_object = ie_1.alignment
			ls_result += wf_result_add(ls_item, " 4.Set  Left ", not isnull(lany_object) and lany_object = Left!)			
		case lower("BackColor")
			//获取原始值
			ll_tmp = ie_1.backcolor 			
			ls_result += wf_result_add(ls_item, " 1.orginal ", not isnull(ll_tmp) and ll_tmp = 1073741824)			
			
			//动态设置BackColor为-3， 无效值
			ll_tmp = 0 
			ie_1.backcolor = -3
			ll_tmp = ie_1.backcolor
			ls_result += wf_result_add(ls_item, " 2.set -3 ", not isnull(ll_tmp) and (ll_tmp = 1073741824 or ll_tmp = -3 ))			
			
			//非正常值，正数
			ll_tmp = 0 
			ie_1.backcolor = 10000
			ll_tmp = ie_1.backcolor 		
			ls_result += wf_result_add(ls_item, " 3.set 10000 ", not isnull(ll_tmp) and ll_tmp = 10000)	
			
			//正常值
			ll_tmp = 0 
			ie_1.backcolor = 16777215
			ll_tmp = ie_1.backcolor 		
			ls_result += wf_result_add(ls_item, " 4.set 16777215 ", not isnull(ll_tmp) and ll_tmp = 16777215)	
			
			//超出范围
			ll_tmp = 0 
			ie_1.backcolor = 16777216
			ll_tmp = ie_1.backcolor
			ls_result += wf_result_add(ls_item, " 5.set 16777216 ", not isnull(ll_tmp) and ll_tmp = 16777216)			
		case lower("Border")
			lbn_flag = ie_1.border
			ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(lbn_flag) and lbn_flag = true)			
			
			setnull(lbn_flag) 
			ie_1.border = false
			lbn_flag = ie_1.border
			ls_result += wf_result_add(ls_item, " 2.set false ", not isnull(lbn_flag) and lbn_flag = false)			
			
			setnull(lbn_flag) 
			ie_1.border = true
			lbn_flag = ie_1.border
			ls_result += wf_result_add(ls_item, " 3.set true ", not isnull(lbn_flag) and lbn_flag = true)									
		case lower("BorderStyle")
			lany_object = ie_1.BorderStyle
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(lany_object) and lany_object = StyleLowered!)
			
			setnull(lany_object)
			ie_1.BorderStyle = StyleBox!
			lany_object = ie_1.BorderStyle
			ls_result += wf_result_add(ls_item, " 2.Set  StyleBox ", not isnull(lany_object) and lany_object = StyleBox!)
			
			setnull(lany_object)
			ie_1.BorderStyle = StyleShadowBox!
			lany_object = ie_1.BorderStyle
			ls_result += wf_result_add(ls_item, " 3.Set  StyleShadowBox ", not isnull(lany_object) and lany_object = StyleShadowBox!)
			
			setnull(lany_object)
			ie_1.BorderStyle = StyleRaised!
			lany_object = ie_1.BorderStyle
			ls_result += wf_result_add(ls_item, " 4.Set  StyleRaised ", not isnull(lany_object) and lany_object = StyleRaised!)
			
			setnull(lany_object)
			ie_1.BorderStyle = StyleLowered!
			lany_object = ie_1.BorderStyle
			ls_result += wf_result_add(ls_item, " 5.Set  StyleLowered ", not isnull(lany_object) and lany_object = StyleLowered!)		
		case lower("BringToTop")
			lbn_flag = ie_1.BringToTop
			ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(lbn_flag) and lbn_flag = false)			
			
			setnull(lbn_flag) 
			ie_1.BringToTop = true
			lbn_flag = ie_1.BringToTop
			ls_result += wf_result_add(ls_item, " 2.set true ", not isnull(lbn_flag) and lbn_flag = true)		
			
			setnull(lbn_flag) 
			ie_1.BringToTop = false
			lbn_flag = ie_1.bringtotop
			ls_result += wf_result_add(ls_item, " 3.set false ", not isnull(lbn_flag) and lbn_flag = false)			
		case lower("ClassDefinition")
			Setnull(lpo_object )
			lpo_object = ie_1.ClassDefinition
			ls_result += wf_result_add(ls_item, " 1.get orginal ", isvalid(lpo_object ))			
//			lpo_object.datatypeof	 = 'inkedit'		
//			lpo_object.libraryname= 'd:\....\....'	//			current library path
//			lpo_object.name= 'w_inkedit`ie_1'		
		case lower("DisplayOnly")
			lbn_flag = ie_1.DisplayOnly
			ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(lbn_flag) and lbn_flag = false)			
			
			setnull(lbn_flag) 
			ie_1.DisplayOnly = true
			lbn_flag = ie_1.DisplayOnly
			ls_result += wf_result_add(ls_item, " 2.set true ", not isnull(lbn_flag) and lbn_flag = true)		
			
			setnull(lbn_flag) 
			ie_1.DisplayOnly = false
			lbn_flag = ie_1.DisplayOnly
			ls_result += wf_result_add(ls_item, " 3.set false ", not isnull(lbn_flag) and lbn_flag = false)	
		case lower("DragAuto")
			lbn_flag = ie_1.DragAuto
			ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(lbn_flag) and lbn_flag = false)			
			
			setnull(lbn_flag) 
			ie_1.DragAuto = true
			lbn_flag = ie_1.DragAuto
			ls_result += wf_result_add(ls_item, " 2.set true ", not isnull(lbn_flag) and lbn_flag = true)		
			
			setnull(lbn_flag) 
			ie_1.DragAuto = false
			lbn_flag = ie_1.DragAuto
			ls_result += wf_result_add(ls_item, " 3.set false ", not isnull(lbn_flag) and lbn_flag = false)				
		case lower("DragIcon")
			ls_temp = string(ie_1.dragicon )
			ls_result += wf_result_add(ls_item, " 1.get default ",  isnull(ls_temp) or ls_temp = "" )				
			
			ie_1.dragicon = "Question!"
			ls_temp = ie_1.dragicon
			ls_result += wf_result_add(ls_item, " 2.set Question ", not isnull(ls_temp) and ls_temp = "Question!" )				

			ie_1.dragicon = "error!"
			ls_temp = ie_1.dragicon
			ls_result += wf_result_add(ls_item, " 3.set error ", not isnull(ls_temp) and ls_temp = "error!" )		
			
			ie_1.dragicon = ".\pbex.ico!"
			ls_temp = ie_1.dragicon
			ls_result += wf_result_add(ls_item, " 4.set .\pbex.ico ", not isnull(ls_temp) and ls_temp = ".\pbex.ico!" )
			
			ie_1.dragicon = ""
			ls_temp = ie_1.dragicon
			ls_result += wf_result_add(ls_item, " 5.set default ", not isnull(ls_temp) and ls_temp = "" )
		case lower("Enabled")
			lbn_flag = ie_1.Enabled
			ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(lbn_flag) and lbn_flag = true)			
			
			setnull(lbn_flag) 
			ie_1.Enabled = false
			lbn_flag = ie_1.Enabled
			ls_result += wf_result_add(ls_item, " 2.set false ", not isnull(lbn_flag) and lbn_flag = false)			
			
			setnull(lbn_flag) 
			ie_1.Enabled = true
			lbn_flag = ie_1.Enabled
			ls_result += wf_result_add(ls_item, " 3.set true ", not isnull(lbn_flag) and lbn_flag = true)		
		case lower("FaceName")
			ls_temp = ie_1.FaceName
			ls_result += wf_result_add(ls_item, " 1.Get default ", not isnull(ls_temp) and ls_temp = "Tahoma")
			
			ie_1.FaceName = "Arial"
			ls_temp = ""
			ls_temp = ie_1.FaceName
			ls_result += wf_result_add(ls_item, " 2.set Arial ", not isnull(ls_temp) and ls_temp = "Arial")
			
			ie_1.FaceName ="Courier"
			ls_temp = ""
			ls_temp = ie_1.FaceName
			ls_result += wf_result_add(ls_item, " 3.set Courier ", not isnull(ls_temp) and ls_temp = "Courier")		
			
			ie_1.FaceName ="Tahoma"
			ls_temp = ""
			ls_temp = ie_1.FaceName
			ls_result += wf_result_add(ls_item, " 4.set default ", not isnull(ls_temp) and ls_temp = "Tahoma")		
		case lower("Factoid")
			ls_temp = ie_1.Factoid
			ls_result += wf_result_add(ls_item, " 1.Get default ", not isnull(ls_temp) and ls_temp = "")
			
			ie_1.Factoid = "WEB"
			ls_temp = ""
			ls_temp = ie_1.Factoid
			ls_result += wf_result_add(ls_item, " 2.set WEB ", not isnull(ls_temp) and ls_temp = "WEB")
			
			ie_1.Factoid ="DEFAULT"
			ls_temp = ""
			ls_temp = ie_1.Factoid
			ls_result += wf_result_add(ls_item, " 3.set DEFAULT ", not isnull(ls_temp) and ls_temp = "DEFAULT")		
			
			ie_1.Factoid =""
			ls_temp = ""
			ls_temp = ie_1.Factoid
			ls_result += wf_result_add(ls_item, " 4.set orignal ", not isnull(ls_temp) and ls_temp = "")					
		case lower("FontCharSet")
			lany_object = ie_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(lany_object) and lany_object = ANSI!)
			
			setnull(lany_object)
			ie_1.FontCharSet = HEBREWCHARSET!
			lany_object = ie_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 2.Set  HEBREWCHARSET ", not isnull(lany_object) and lany_object = HEBREWCHARSET!)
			
			setnull(lany_object)
			ie_1.FontCharSet = ARABICCHARSET!
			lany_object = ie_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 3.Set  ARABICCHARSET ", not isnull(lany_object) and lany_object = ARABICCHARSET!)
			
			setnull(lany_object)
			ie_1.FontCharSet = GREEKCHARSET!
			lany_object = ie_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 4.Set  GREEKCHARSET ", not isnull(lany_object) and lany_object = GREEKCHARSET!)
			
			setnull(lany_object)
			ie_1.FontCharSet = TURKISHCHARSET!
			lany_object = ie_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 5.Set  TURKISHCHARSET ", not isnull(lany_object) and lany_object = TURKISHCHARSET!)
			
			setnull(lany_object)
			ie_1.FontCharSet = BALTICCHARSET!
			lany_object = ie_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 6.Set  BALTICCHARSET ", not isnull(lany_object) and lany_object = BALTICCHARSET!)	
			
			setnull(lany_object)
			ie_1.FontCharSet = THAICHARSET!
			lany_object = ie_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 7.Set  THAICHARSET ", not isnull(lany_object) and lany_object = THAICHARSET!)	
			
			setnull(lany_object)
			ie_1.FontCharSet = VIETNAMESECHARSET!
			lany_object = ie_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 8.Set  VIETNAMESECHARSET ", not isnull(lany_object) and lany_object = VIETNAMESECHARSET!)	
			
			setnull(lany_object)
			ie_1.FontCharSet = ANSI!
			lany_object = ie_1.FontCharSet
			ls_result += wf_result_add(ls_item, " 9.Set  ANSI ", not isnull(lany_object) and lany_object = ANSI!)	
		case lower("FontFamily")
			lany_object = ie_1.fontfamily
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(lany_object) and lany_object = Swiss!)
			
			setnull(lany_object)
			ie_1.fontfamily = AnyFont!
			lany_object = ie_1.fontfamily
			ls_result += wf_result_add(ls_item, " 2.Set  AnyFont ", not isnull(lany_object) and lany_object = AnyFont!)
			
			setnull(lany_object)
			ie_1.fontfamily = Decorative!
			lany_object = ie_1.fontfamily
			ls_result += wf_result_add(ls_item, " 3.Set  Decorative ", not isnull(lany_object) and lany_object = Decorative!)
			
			setnull(lany_object)
			ie_1.fontfamily = Modern!
			lany_object = ie_1.fontfamily
			ls_result += wf_result_add(ls_item, " 4.Set  Modern ", not isnull(lany_object) and lany_object = Modern!)
			
			setnull(lany_object)
			ie_1.fontfamily = Roman!
			lany_object = ie_1.fontfamily
			ls_result += wf_result_add(ls_item, " 5.Set  Roman ", not isnull(lany_object) and lany_object = Roman!)
			
			setnull(lany_object)
			ie_1.fontfamily = Script!
			lany_object = ie_1.fontfamily
			ls_result += wf_result_add(ls_item, " 6.Set  Script ", not isnull(lany_object) and lany_object = Script!)
			
			setnull(lany_object)
			ie_1.fontfamily = Swiss!
			lany_object = ie_1.fontfamily
			ls_result += wf_result_add(ls_item, " 7.Set  Swiss ", not isnull(lany_object) and lany_object = Swiss!)			
		case lower("FontPitch")
			lany_object = ie_1.fontpitch
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(lany_object) and lany_object = Variable!)
			
			setnull(lany_object)
			ie_1.fontpitch = Fixed!
			lany_object = ie_1.fontpitch
			ls_result += wf_result_add(ls_item, " 2.Set  Fixed ", not isnull(lany_object) and lany_object = Fixed!)
			
			setnull(lany_object)
			ie_1.fontpitch = Default!
			lany_object = ie_1.fontpitch
			ls_result += wf_result_add(ls_item, " 3.Set  Default ", not isnull(lany_object) and lany_object = Default!)
			
			setnull(lany_object)
			ie_1.fontpitch = Variable!
			lany_object = ie_1.fontpitch
			ls_result += wf_result_add(ls_item, " 4.Set  Variable ", not isnull(lany_object) and lany_object = Variable!)
		case lower("Height")
			ll_tmp = ie_1.Height 
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(ll_tmp ) and ll_tmp  = 1432)					
			
			ll_tmp = 0 
			ie_1.Height = 176
			ll_tmp = ie_1.Height 
			ls_result += wf_result_add(ls_item, " 2.set 176 ", not isnull(ll_tmp ) and ll_tmp  = 176)		
			
			ll_tmp = 0 
			ie_1.Height = 2000
			ll_tmp = ie_1.Height 
			ls_result += wf_result_add(ls_item, " 3.set 2000 ", not isnull(ll_tmp ) and ll_tmp  = 2000)		 
			
			ll_tmp = 0 
			ie_1.Height = 1432
			ll_tmp = ie_1.Height 
			ls_result += wf_result_add(ls_item, " 4.set default ", not isnull(ll_tmp ) and ll_tmp  = 1432)		
		case lower("HScrollBar")
			lbn_flag = ie_1.HScrollBar
			ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(lbn_flag) and lbn_flag = false)			
			
			setnull(lbn_flag) 
			ie_1.HScrollBar = true
			lbn_flag = ie_1.HScrollBar
			ls_result += wf_result_add(ls_item, " 2.set true ", not isnull(lbn_flag) and lbn_flag = true)	
			
			setnull(lbn_flag) 
			ie_1.HScrollBar = false
			lbn_flag = ie_1.HScrollBar
			ls_result += wf_result_add(ls_item, " 3.set false ", not isnull(lbn_flag) and lbn_flag = false)			
		case lower("IgnorePressure")
			lbn_flag = ie_1.IgnorePressure
			ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(lbn_flag) and lbn_flag = false)			
			
			setnull(lbn_flag) 
			ie_1.IgnorePressure = true
			lbn_flag = ie_1.IgnorePressure
			ls_result += wf_result_add(ls_item, " 2.set true ", not isnull(lbn_flag) and lbn_flag = true)	
			
			setnull(lbn_flag) 
			ie_1.IgnorePressure = false
			lbn_flag = ie_1.IgnorePressure
			ls_result += wf_result_add(ls_item, " 3.set false ", not isnull(lbn_flag) and lbn_flag = false)	
		case lower("InkAntiAliased")
			lbn_flag = ie_1.InkAntiAliased
			ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(lbn_flag) and lbn_flag = true)			
			
			setnull(lbn_flag) 
			ie_1.InkAntiAliased = false
			lbn_flag = ie_1.InkAntiAliased
			ls_result += wf_result_add(ls_item, " 2.set false ", not isnull(lbn_flag) and lbn_flag = false)
			
			setnull(lbn_flag) 
			ie_1.InkAntiAliased = true
			lbn_flag = ie_1.InkAntiAliased
			ls_result += wf_result_add(ls_item, " 3.set true ", not isnull(lbn_flag) and lbn_flag = true)	
		case lower("InkColor")
			//获取原始值
			ll_tmp = ie_1.InkColor 			
			ls_result += wf_result_add(ls_item, " 1.orginal ", not isnull(ll_tmp) and ll_tmp = 0)			
			
			//动态设置BackColor为-3， 无效值
			ll_tmp = 0 
			ie_1.InkColor = -3
			ll_tmp = ie_1.InkColor 		
			ls_result += wf_result_add(ls_item, " 2.set -3 ", not isnull(ll_tmp) and (ll_tmp = 1073741824 or ll_tmp = -3 ))			
			
			//非正常值，正数
			ll_tmp = 0 
			ie_1.InkColor = 10000
			ll_tmp = ie_1.InkColor 		
			ls_result += wf_result_add(ls_item, " 3.set 10000 ", not isnull(ll_tmp) and ll_tmp = 10000)	
			
			//正常值
			ll_tmp = 0 
			ie_1.InkColor = 16777215
			ll_tmp = ie_1.InkColor 		
			ls_result += wf_result_add(ls_item, " 4.set 16777215 ", not isnull(ll_tmp) and ll_tmp = 16777215)	
			
			//超出范围
			ll_tmp = 0 
			ie_1.InkColor = 16777216
			ll_tmp = ie_1.InkColor 		
			ls_result += wf_result_add(ls_item, " 5.set 16777216 ", not isnull(ll_tmp) and ll_tmp = 16777216)			
		case lower("InkHeight")
			ll_tmp = ie_1.InkHeight 
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(ll_tmp ) and ll_tmp  = 1)					
			
			ll_tmp = 0 
			ie_1.InkHeight = 15
			ll_tmp = ie_1.InkHeight 
			ls_result += wf_result_add(ls_item, " 2.set 15 ", not isnull(ll_tmp ) and ll_tmp  = 15)		
			
			ll_tmp = 0 
			ie_1.InkHeight = 2
			ll_tmp = ie_1.InkHeight 
			ls_result += wf_result_add(ls_item, " 3.set 2 ", not isnull(ll_tmp ) and ll_tmp  = 2)		 
			
			ll_tmp = 0 
			ie_1.InkHeight = 1
			ll_tmp = ie_1.InkHeight 
			ls_result += wf_result_add(ls_item, " 4.set default ", not isnull(ll_tmp ) and ll_tmp  = 1	)			
		case lower("InkMode")
			lany_object = ie_1.InkMode
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(lany_object) and lany_object = CollectInk!)
			
			setnull(lany_object)
			ie_1.InkMode = CollectInkAndGestures!
			lany_object = ie_1.InkMode
			ls_result += wf_result_add(ls_item, " 2.Set  CollectInkAndGestures ", not isnull(lany_object) and lany_object = CollectInkAndGestures!)
			
			setnull(lany_object)
			ie_1.InkMode = InkDisabled!
			lany_object = ie_1.InkMode
			ls_result += wf_result_add(ls_item, " 3.Set  InkDisabled ", not isnull(lany_object) and lany_object = InkDisabled!)
			
			setnull(lany_object)
			ie_1.InkMode = CollectInk!
			lany_object = ie_1.InkMode
			ls_result += wf_result_add(ls_item, " 4.Set  CollectInk ", not isnull(lany_object) and lany_object = CollectInk!)
		case lower("InkTransparency")
			//获取原始值
			ll_tmp = ie_1.InkTransparency 			
			ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(ll_tmp) and ll_tmp = 0)			
			
			//正常值
			ll_tmp = 0 
			ie_1.InkTransparency = 123
			ll_tmp = ie_1.InkTransparency 		
			ls_result += wf_result_add(ls_item, " 2.set 123 ", not isnull(ll_tmp) and ll_tmp = 123)	
			
			//动态设置BackColor为-3， 无效值
			ll_tmp = 0 
			ie_1.InkTransparency = -3
			ll_tmp = ie_1.InkTransparency 		
			ls_result += wf_result_add(ls_item, " 3.set -3 ", not isnull(ll_tmp) and (ll_tmp = -3 ))			
						
			//超出范围
			ll_tmp = 0 
			ie_1.InkTransparency = 256
			ll_tmp = ie_1.InkTransparency 		
			ls_result += wf_result_add(ls_item, " 4.set 256 ", not isnull(ll_tmp) and ll_tmp = 256)		
			
			//set default
			ll_tmp = 0 
			ie_1.InkTransparency = 0
			ll_tmp = ie_1.InkTransparency 		
			ls_result += wf_result_add(ls_item, " 5.set default ", not isnull(ll_tmp) and ll_tmp = 0)					
		case lower("InkWidth")
			ll_tmp = ie_1.InkWidth 
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(ll_tmp ) and ll_tmp  = 53)					
			
			ll_tmp = 0 
			ie_1.InkWidth = -3
			ll_tmp = ie_1.InkWidth 
			ls_result += wf_result_add(ls_item, " 2.set -3 ", not isnull(ll_tmp ) and ll_tmp  = -3)		
			
			ll_tmp = 0 
			ie_1.InkWidth = 26
			ll_tmp = ie_1.InkWidth 
			ls_result += wf_result_add(ls_item, " 3.set 26 ", not isnull(ll_tmp ) and ll_tmp  = 26)		 
			
			ll_tmp = 0 
			ie_1.InkWidth = 0
			ll_tmp = ie_1.InkWidth 
			ls_result += wf_result_add(ls_item, " 4.set 0 ", not isnull(ll_tmp ) and ll_tmp  = 0)		 
			
			ll_tmp = 0 
			ie_1.InkWidth = 600
			ll_tmp = ie_1.InkWidth 
			ls_result += wf_result_add(ls_item, " 5.set 600 ", not isnull(ll_tmp ) and ll_tmp  = 600	)		
			
			ll_tmp = 0 
			ie_1.InkWidth = 53
			ll_tmp = ie_1.InkWidth 
			ls_result += wf_result_add(ls_item, " 6.set default ", not isnull(ll_tmp ) and ll_tmp  = 53	)				
		case lower("InsertAsText")
			lbn_flag = ie_1.InsertAsText
			ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(lbn_flag) and lbn_flag = true)			
			
			setnull(lbn_flag) 
			ie_1.InsertAsText = false
			lbn_flag = ie_1.InsertAsText
			ls_result += wf_result_add(ls_item, " 2.set false ", not isnull(lbn_flag) and lbn_flag = false)
			
			setnull(lbn_flag) 
			ie_1.InsertAsText = true
			lbn_flag = ie_1.InsertAsText
			ls_result += wf_result_add(ls_item, " 3.set true ", not isnull(lbn_flag) and lbn_flag = true)	
		case lower("Italic")
			lbn_flag = ie_1.Italic
			ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(lbn_flag) and lbn_flag = false)			
			
			setnull(lbn_flag) 
			ie_1.Italic = true
			lbn_flag = ie_1.Italic
			ls_result += wf_result_add(ls_item, " 2.set true ", not isnull(lbn_flag) and lbn_flag = true)	
			
			setnull(lbn_flag) 
			ie_1.Italic = false
			lbn_flag = ie_1.Italic
			ls_result += wf_result_add(ls_item, " 3.set false ", not isnull(lbn_flag) and lbn_flag = false)	
		case lower("Limit")
			ll_tmp = ie_1.Limit 
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(ll_tmp ) and ll_tmp  = 0)					
						
			ll_tmp = 0 
			ie_1.Limit = 600
			ll_tmp = ie_1.Limit 
			ls_result += wf_result_add(ls_item, " 2.set 600 ", not isnull(ll_tmp ) and ll_tmp  = 600)		 
						
			ll_tmp = 0 
			ie_1.Limit = -3
			ll_tmp = ie_1.Limit 
			ls_result += wf_result_add(ls_item, " 3.set -3 ", not isnull(ll_tmp ) and ll_tmp  = -3)		
			
			ll_tmp = 0 
			ie_1.Limit = 32767	
			ll_tmp = ie_1.Limit 
			ls_result += wf_result_add(ls_item, " 4.set 32767 ", not isnull(ll_tmp ) and ll_tmp  = 32767)		 
			
			ll_tmp = 0 
			ie_1.Limit = 32768
			ll_tmp = ie_1.Limit 
			ls_result += wf_result_add(ls_item, " 5.set 32768 ", not isnull(ll_tmp ) and ll_tmp  = -32768	)		
			
			ll_tmp = 0 
			ie_1.Limit = 0
			ll_tmp = ie_1.Limit 
			ls_result += wf_result_add(ls_item, " 6.set default ", not isnull(ll_tmp ) and ll_tmp  = 0	)				
		case lower("Modified")
////			//When the first change is made to a newly opened or saved control, PowerBuilder sets the Modified property to true and triggers the Modified event.
////			ie_1.text = "other onew "
////			ie_1.text = "none"
////			try 
//				lbn_flag = ie_1.modified
//				ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(lbn_flag) and lbn_flag = true)			
//				
//				setnull(lbn_flag) 
//				ie_1.Modified = false
//				lbn_flag = ie_1.Modified
//				ls_result += wf_result_add(ls_item, " 2.set false ", not isnull(lbn_flag) and lbn_flag = false)
//				
//				setnull(lbn_flag) 
//				ie_1.Modified = true
//				lbn_flag = ie_1.Modified
//				ls_result += wf_result_add(ls_item, " 3.set true ", not isnull(lbn_flag) and lbn_flag = true)				
////			catch (exception e)
////
////			Finally
////
////			END TRY
		case lower("PenTip")
			lany_object = ie_1.pentip
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(lany_object) and lany_object = PenTipBall!)
			
			setnull(lany_object)
			ie_1.pentip = PenTipRectangle!
			lany_object = ie_1.pentip
			ls_result += wf_result_add(ls_item, " 2.Set  PenTipRectangle ", not isnull(lany_object) and lany_object = PenTipRectangle!)
			
			setnull(lany_object)
			ie_1.pentip = PenTipBall!
			lany_object = ie_1.pentip
			ls_result += wf_result_add(ls_item, " 3.Set  PenTipBall ", not isnull(lany_object) and lany_object = PenTipBall!)
		case lower("Pointer")
			ls_temp = ie_1.pointer
			ls_result += wf_result_add(ls_item, " 1.Get default ", not isnull(ls_temp) and ls_temp = "")
			
			ie_1.pointer = "HourGlass!"
			ls_temp = ""
			ls_temp = ie_1.pointer
			ls_result += wf_result_add(ls_item, " 2.set HourGlass! ", not isnull(ls_temp) and ls_temp = "HourGlass!")
			
			ie_1.pointer ="Arrow!"
			ls_temp = ""
			ls_temp = ie_1.pointer
			ls_result += wf_result_add(ls_item, " 3.set Arrow! ", not isnull(ls_temp) and ls_temp = "Arrow!")		
			
			ie_1.pointer =""
			ls_temp = ""
			ls_temp = ie_1.pointer
			ls_result += wf_result_add(ls_item, " 4.set orignal ", not isnull(ls_temp) and ls_temp = "")					
		case lower("RecognitionTimer")
			ll_tmp = ie_1.recognitiontimer 
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(ll_tmp ) and ll_tmp  = 2000)					
			
			ll_tmp = 0 
			ie_1.recognitiontimer = 6000
			ll_tmp = ie_1.recognitiontimer 
			ls_result += wf_result_add(ls_item, " 2.set 6000 ", not isnull(ll_tmp ) and ll_tmp  = 6000)		
			
			ll_tmp = 0 
			ie_1.recognitiontimer = -500
			ll_tmp = ie_1.recognitiontimer 
			ls_result += wf_result_add(ls_item, " 3.set -500 ", not isnull(ll_tmp ) and ll_tmp  = -500)		 
			
			ll_tmp = 0 
			ie_1.recognitiontimer = 2000
			ll_tmp = ie_1.recognitiontimer 
			ls_result += wf_result_add(ls_item, " 4.set orignal ", not isnull(ll_tmp ) and ll_tmp  = 2000)		 			
		case lower("RightToLeft")
			lbn_flag = ie_1.righttoleft
			ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(lbn_flag) and lbn_flag = false)			
					
			setnull(lbn_flag) 
			ie_1.righttoleft = true
			lbn_flag = ie_1.righttoleft
			ls_result += wf_result_add(ls_item, " 2.set true ", not isnull(lbn_flag) and lbn_flag = true)	
			
			setnull(lbn_flag) 
			ie_1.righttoleft = false
			lbn_flag = ie_1.righttoleft
			ls_result += wf_result_add(ls_item, " 3.set false ", not isnull(lbn_flag) and lbn_flag = false)
		case lower("Status")		//A read-only property 
			lies_status = ie_1.status
			ls_result += wf_result_add(ls_item, " 1.default ", not isnull(lies_status) and lies_status = InkEditIdle!)
			
		case lower("TabOrder")			//default set 20
			ll_tmp = ie_1.taborder 
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(ll_tmp ) and ll_tmp  = 20)					
						
			ll_tmp = 0 
			ie_1.taborder = 100
			ll_tmp = ie_1.taborder 
			ls_result += wf_result_add(ls_item, " 2.set 100 ", not isnull(ll_tmp ) and ll_tmp  = 100)		 
						
			ll_tmp = 0 
			ie_1.taborder = -50
			ll_tmp = ie_1.taborder 
			ls_result += wf_result_add(ls_item, " 3.set -50 ", not isnull(ll_tmp ) and ll_tmp  = -50)		
			
			ll_tmp = 0 
			ie_1.taborder = 20	
			ll_tmp = ie_1.taborder 
			ls_result += wf_result_add(ls_item, " 4.set 20 ", not isnull(ll_tmp ) and ll_tmp  = 20)		 			
		case lower("Tag")
			ls_temp = ie_1.tag
			ls_result += wf_result_add(ls_item, " 1.default ", not isnull(ls_temp) and ls_temp = "")
			
			ie_1.tag = "Deletes selected text"
			ls_temp = ""
			ls_temp = ie_1.tag
			ls_result += wf_result_add(ls_item, " 2.set tag ", not isnull(ls_temp) and ls_temp = "Deletes selected text")
			
			ie_1.tag =""
			ls_temp = ""
			ls_temp = ie_1.tag
			ls_result += wf_result_add(ls_item, " 3.set default ", not isnull(ls_temp) and ls_temp = "")		
		case lower("Text")
			ls_temp = ie_1.text
			ls_result += wf_result_add(ls_item, " 1.default ", not isnull(ls_temp) and ls_temp = "none")
			
			ie_1.text = "Deletes selected text"
			ls_temp = ""
			ls_temp = ie_1.text
			ls_result += wf_result_add(ls_item, " 2.set text ", not isnull(ls_temp) and ls_temp = "Deletes selected text")
			
			ie_1.text ="none"
			ls_temp = ""
			ls_temp = ie_1.text
			ls_result += wf_result_add(ls_item, " 3.set default ", not isnull(ls_temp) and ls_temp = "none")		
		case lower("TextColor")
			//获取原始值
			ll_tmp = ie_1.TextColor 			
			ls_result += wf_result_add(ls_item, " 1.orginal ", not isnull(ll_tmp) and ll_tmp = 0)			
			
			//动态设置BackColor为-3， 无效值
			ll_tmp = 0 
			ie_1.TextColor = -3
			ll_tmp = ie_1.TextColor 		
			ls_result += wf_result_add(ls_item, " 2.set -3 ", not isnull(ll_tmp) and (ll_tmp = -3 ))			
			
			//非正常值，正数
			ll_tmp = 0 
			ie_1.TextColor = 10000
			ll_tmp = ie_1.TextColor 		
			ls_result += wf_result_add(ls_item, " 3.set 10000 ", not isnull(ll_tmp) and ll_tmp = 10000)	
			
			//正常值
			ll_tmp = 0 
			ie_1.TextColor = 16777215
			ll_tmp = ie_1.TextColor 		
			ls_result += wf_result_add(ls_item, " 4.set 16777215 ", not isnull(ll_tmp) and ll_tmp = 16777215)	
			
			//超出范围
			ll_tmp = 0 
			ie_1.TextColor = 16777216
			ll_tmp = ie_1.TextColor 		
			ls_result += wf_result_add(ls_item, " 5.set 16777216 ", not isnull(ll_tmp) and ll_tmp = 16777216)		
			
			//set default 
			ll_tmp = 0 
			ie_1.TextColor = 0
			ll_tmp = ie_1.TextColor 		
			ls_result += wf_result_add(ls_item, " 6.set default ", not isnull(ll_tmp) and (ll_tmp = 0 ))	
		case lower("TextSize")
			//获取原始值
			ll_tmp = ie_1.TextSize 			
			ls_result += wf_result_add(ls_item, " 1.orginal textsize = 12", not isnull(ll_tmp) and ll_tmp = -12)			
			
			//动态设置BackColor为-3， 无效值
			ll_tmp = 0 
			ie_1.TextSize = -3
			ll_tmp = ie_1.TextSize 		
			ls_result += wf_result_add(ls_item, " 2.set -3 ", not isnull(ll_tmp) and (ll_tmp = -3 ))			

			//正常值
			ll_tmp = 0 
			ie_1.TextSize = 36
			ll_tmp = ie_1.TextSize 		
			ls_result += wf_result_add(ls_item, " 3.set 36 ", not isnull(ll_tmp) and ll_tmp = 36)	
			
			//边界值
			ll_tmp = 0 
			ie_1.TextSize = 72
			ll_tmp = ie_1.TextSize 		
			ls_result += wf_result_add(ls_item, " 4.set 72 ", not isnull(ll_tmp) and ll_tmp = 72)	
			
			//超出范围
			ll_tmp = 0 
			ie_1.TextSize = 90
			ll_tmp = ie_1.TextSize 		
			ls_result += wf_result_add(ls_item, " 5.set 90 ", not isnull(ll_tmp) and ll_tmp = 90)		
			
			//set default 
			ll_tmp = 0 
			ie_1.TextSize = -12
			ll_tmp = ie_1.TextSize 		
			ls_result += wf_result_add(ls_item, " 6.set default ", not isnull(ll_tmp) and (ll_tmp = -12 ))	
		case lower("Underline")
			lbn_flag = ie_1.Underline
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(lbn_flag) and lbn_flag = false)			
					
			setnull(lbn_flag) 
			ie_1.Underline = true
			lbn_flag = ie_1.Underline
			ls_result += wf_result_add(ls_item, " 2.set true ", not isnull(lbn_flag) and lbn_flag = true)	
			
			setnull(lbn_flag) 
			ie_1.righttoleft = false
			lbn_flag = ie_1.righttoleft
			ls_result += wf_result_add(ls_item, " 3.set default ", not isnull(lbn_flag) and lbn_flag = false)
		case lower("UseMouseForInput")
			lbn_flag = ie_1.usemouseforinput
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(lbn_flag) and lbn_flag = false)			
					
			setnull(lbn_flag) 
			ie_1.usemouseforinput = true
			lbn_flag = ie_1.usemouseforinput
			ls_result += wf_result_add(ls_item, " 2.set true ", not isnull(lbn_flag) and lbn_flag = true)	
			
			setnull(lbn_flag) 
			ie_1.usemouseforinput = false
			lbn_flag = ie_1.usemouseforinput
			ls_result += wf_result_add(ls_item, " 3.set default ", not isnull(lbn_flag) and lbn_flag = false)
		case lower("Visible")
			lbn_flag = ie_1.Visible
			ls_result += wf_result_add(ls_item, " 1.get orginal ", not isnull(lbn_flag) and lbn_flag = true)			
			
			setnull(lbn_flag) 
			ie_1.Visible = false
			lbn_flag = ie_1.Visible
			ls_result += wf_result_add(ls_item, " 2.set false ", not isnull(lbn_flag) and lbn_flag = false)			
			
			setnull(lbn_flag) 
			ie_1.Visible = true
			lbn_flag = ie_1.Visible
			ls_result += wf_result_add(ls_item, " 3.set true ", not isnull(lbn_flag) and lbn_flag = true)	
		case lower("VScrollBar")
			lbn_flag = ie_1.vscrollbar
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(lbn_flag) and lbn_flag = false)			
					
			setnull(lbn_flag) 
			ie_1.vscrollbar = true
			lbn_flag = ie_1.vscrollbar
			ls_result += wf_result_add(ls_item, " 2.set true ", not isnull(lbn_flag) and lbn_flag = true)	
			
			setnull(lbn_flag) 
			ie_1.vscrollbar = false
			lbn_flag = ie_1.vscrollbar
			ls_result += wf_result_add(ls_item, " 3.set default ", not isnull(lbn_flag) and lbn_flag = false)
		case lower("Weight")
			ll_tmp = ie_1.weight 
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(ll_tmp ) and ll_tmp  = 400)					
						
			ll_tmp = 0 
			ie_1.weight = 700
			ll_tmp = ie_1.weight 
			ls_result += wf_result_add(ls_item, " 2.set 700 for bold ", not isnull(ll_tmp ) and ll_tmp  = 700)		 
						
			ll_tmp = 0 
			ie_1.weight = -200
			ll_tmp = ie_1.weight 
			ls_result += wf_result_add(ls_item, " 3.set -200 ", not isnull(ll_tmp ) and ll_tmp  = -200)		
			
			ll_tmp = 0 
			ie_1.weight = 1000	
			ll_tmp = ie_1.weight 
			ls_result += wf_result_add(ls_item, " 4.set 1000 ", not isnull(ll_tmp ) and ll_tmp  = 1000)		
			
			ll_tmp = 0 
			ie_1.weight = 400	
			ll_tmp = ie_1.weight 
			ls_result += wf_result_add(ls_item, " 5.set default ", not isnull(ll_tmp ) and ll_tmp  = 400)		
		case lower("Width")
			ll_tmp = ie_1.Width 
			ls_result += wf_result_add(ls_item, " 1.get default 1897, real value = " + string(ll_tmp), not isnull(ll_tmp ) and ll_tmp  = 1897)					
			
			ll_tmp = 0 
			ie_1.Width = 56
			ll_tmp = ie_1.Width 
			ls_result += wf_result_add(ls_item, " 2.set 56, real value = " + string(ll_tmp), not isnull(ll_tmp ) and ll_tmp  > 51 and ll_tmp < 61)		
			
			ll_tmp = 0 
			ie_1.Width = 2000
			ll_tmp = ie_1.Width 
			ls_result += wf_result_add(ls_item, " 3.set 2000, real value = " + string(ll_tmp), not isnull(ll_tmp ) and ll_tmp  > 1995 and ll_tmp < 2005)		 
			
			ll_tmp = 0 
			ie_1.Width = 1897
			ll_tmp = ie_1.Width 
			ls_result += wf_result_add(ls_item, " 4.set default 1897, real value = " + string(ll_tmp), not isnull(ll_tmp ) and ll_tmp  = 1897)
		case lower("X")
			ll_tmp = ie_1.X 
			ls_result += wf_result_add(ls_item, " 1.get default 759, real value = " + string(ll_tmp),not isnull(ll_tmp ) and ll_tmp  = 759 )
			
			ie_1.X = 1024
			ll_tmp = ie_1.X 
			ls_result += wf_result_add(ls_item, " 2.set 1024, real value = " + string(ll_tmp),not isnull(ll_tmp ) and ll_tmp  = 1024 )		
			
			ie_1.X = 56
			ll_tmp = ie_1.X 
			ls_result += wf_result_add(ls_item, " 3.set 56, real value = " + string(ll_tmp),not isnull(ll_tmp ) and ll_tmp  > 51 and ll_tmp < 61 )		
			
			ie_1.X = 759
			ll_tmp = ie_1.X 
			ls_result += wf_result_add(ls_item, " 4.set default 759, real value = " + string(ll_tmp),not isnull(ll_tmp ) and ll_tmp  = 759 )		
		case lower("Y")
			ll_tmp = ie_1.Y 
			ls_result += wf_result_add(ls_item, " 1.get default 40, real value = " + string(ll_tmp),not isnull(ll_tmp ) and ll_tmp  = 40 )
			
			ie_1.Y = 1024
			ll_tmp = ie_1.Y 
			ls_result += wf_result_add(ls_item, " 2.set 1024, real value = " + string(ll_tmp),not isnull(ll_tmp ) and ll_tmp  = 1024 )		
			
			ie_1.Y = 5
			ll_tmp = ie_1.Y 
			ls_result += wf_result_add(ls_item, " 3.set 5, real value = " + string(ll_tmp),not isnull(ll_tmp ) and ll_tmp  > 0 and ll_tmp < 10 )		
			
			ie_1.Y = 40
			ll_tmp = ie_1.Y 
			ls_result += wf_result_add(ls_item, " 4.set default 40, real value = " + string(ll_tmp),not isnull(ll_tmp ) and ll_tmp  = 40 )	
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
ContextKeyword lcx_key

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

//ls_english = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'			
ls_array[Upperbound(ls_array) + 1 ] = "ClassName"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "Clear"
ls_array[Upperbound(ls_array) + 1 ] = "Copy"
ls_array[Upperbound(ls_array) + 1 ] = "Cut"
ls_array[Upperbound(ls_array) + 1 ] = "Drag"
ls_array[Upperbound(ls_array) + 1 ] = "GetContextService"
ls_array[Upperbound(ls_array) + 1 ] = "GetParent"
ls_array[Upperbound(ls_array) + 1 ] = "Hide"
ls_array[Upperbound(ls_array) + 1 ] = "Move"
ls_array[Upperbound(ls_array) + 1 ] = "Paste"						//bug 
ls_array[Upperbound(ls_array) + 1 ] = "PointerX"
ls_array[Upperbound(ls_array) + 1 ] = "PointerY"
ls_array[Upperbound(ls_array) + 1 ] = "Position"
ls_array[Upperbound(ls_array) + 1 ] = "PostEvent"
ls_array[Upperbound(ls_array) + 1 ] = "Print"
ls_array[Upperbound(ls_array) + 1 ] = "Resize"
ls_array[Upperbound(ls_array) + 1 ] = "RecognizeText"
ls_array[Upperbound(ls_array) + 1 ] = "ReplaceText"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedLength"
ls_array[Upperbound(ls_array) + 1 ] = "SelectedText"
ls_array[Upperbound(ls_array) + 1 ] = "SelectText"
ls_array[Upperbound(ls_array) + 1 ] = "SetFocus"
ls_array[Upperbound(ls_array) + 1 ] = "SetPosition"
ls_array[Upperbound(ls_array) + 1 ] = "SetRedraw"
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
	is_type = ""
	lbn_flag = false
	ll_tmp = 0
	choose case lower(ls_item)
		case lower("ClassName")	
			ls_temp = ie_1.classname( )	
			ls_result += wf_result_add(ls_item, "1. ie_1  ", ls_temp = "ie_1")
		case lower("Clear")
			is_type = 'msgbox'
			timer(1)
			ie_1.selecttext( 1, 2)
			li_rtn = ie_1.clear( )
			messagebox('info',ie_1.text)		//不加messagebox时ls_temp会取到clear前的值，原因不明，以下加的messagebox同理
			ls_temp = ie_1.text
			ls_result += wf_result_add(ls_item, "1. delete selected  ", li_rtn =1 and ls_temp = "ne" )
			
			setnull(li_rtn )
			ls_temp = ""
			li_rtn = ie_1.clear( )
			ls_temp = ie_1.text
			ls_result += wf_result_add(ls_item, "2. delete no selected  ", li_rtn =1 and ls_temp = "ne")			
			
			setnull(li_rtn )
			ls_temp = ""
			ie_1.selecttext( 1, 2 )
			li_rtn = ie_1.clear( )
			messagebox('info',ie_1.text)
			ls_temp = ie_1.text
			ls_result += wf_result_add(ls_item, "3. delete all  ",  li_rtn =1 and ls_temp = "")				
			
			ie_1.text = "none"
		case lower("Copy")
			Clipboard('')
			ie_1.text = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'				
			ie_1.selecttext( 7, 11)
			li_rtn = ie_1.copy( )
			ls_temp = Clipboard()
			ls_result += wf_result_add(ls_item, "1. selected this Appeon ", not isnull(li_rtn) and li_rtn =1 and not isnull(ls_temp) and ls_temp = "this Appeon" )
			
			Clipboard('')
			ie_1.selecttext( 16, 0)
			setnull(li_rtn)
			ls_temp = ""
			li_rtn = ie_1.copy( )
			ls_temp = Clipboard()
			ls_result += wf_result_add(ls_item, "2. selected nothing ", not isnull(li_rtn) and li_rtn =1 and not isnull(ls_temp) and ls_temp = "" )			
			
			Clipboard('')
			setnull(li_rtn)
			ls_temp = ""
			ie_1.text = 'appeon@^#$*&^@#$*^@*#$^%^@*&&%^abcde软件'
			ie_1.selecttext( 1, 39)
			li_rtn = ie_1.copy( )
			ls_temp = Clipboard()
			ls_result += wf_result_add(ls_item, "3. selected special ", not isnull(li_rtn) and li_rtn =1 and not isnull(ls_temp) and ls_temp = 'appeon@^#$*&^@#$*^@*#$^%^@*&&%^abcde软件' )	
			
		case lower("Cut")
			ls_temp2 = 'About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon.'				
			Clipboard('')			
			ie_1.text = ls_temp2
			ll_tmp = ie_1.cut( )
			ls_temp = Clipboard()
			ls_result += wf_result_add(ls_item, "1. selected empty ", not isnull(ll_tmp) and ll_tmp =1 and not isnull(ls_temp) and ls_temp = "" )			

			Clipboard('')
			setnull(li_rtn)
			is_type = 'msgbox'
			timer(1)
			ls_temp = ""
			ie_1.selecttext( 42, 40)
			ll_tmp = ie_1.cut( )
			messagebox('info',ie_1.text)
			ls_temp = Clipboard()			
			ls_result += wf_result_add(ls_item, "2. selected 40 ", ll_tmp =1 and  ls_temp = "This HTML help contains the HTML version" and ie_1.text <> ls_temp2 )			
		case lower("Drag")
			try 
				li_rtn = ie_1.drag( begin!)
				ls_result += wf_result_add(ls_item, "1. begin  ", not isnull(li_rtn) and li_rtn =1 )			

				sleep(2)
				li_rtn = 0 
				li_rtn = ie_1.drag( end!)
				ls_result += wf_result_add(ls_item, "2. end  ", not isnull(li_rtn) )			 //and li_rtn =1 
				
				li_rtn = ie_1.drag( begin!)			
				sleep(2)
				li_rtn = 0 
				li_rtn = ie_1.drag( cancel!)
				ls_result += wf_result_add(ls_item, "3. cancel  ", not isnull(li_rtn) )		//and li_rtn =1 	 
			catch (exception e)
				ls_result += wf_result_add(ls_item, " function "+ " exception e.err"+e.getMessage() , false)			 
			end try
		case lower("GetContextService")
			li_rtn = ie_1.GetContextService("Keyword", lcx_key)
			ls_temp =lcx_key.classname( )
			ls_result += wf_result_add(ls_item, "1. Keyword ", not isnull(li_rtn) and li_rtn =1 and not isnull(ls_temp) and ls_temp = "contextkeyword" )			
			
			li_rtn = 0 
			ls_temp = ""
			li_rtn = ie_1.GetContextService("ContextKeyword", lcx_key)
			ls_temp =lcx_key.classname( )
			ls_result += wf_result_add(ls_item, "2. ContextKeyword ", not isnull(li_rtn) and li_rtn =1 and not isnull(ls_temp) and ls_temp = "contextkeyword" )						
		case lower("GetParent")
			ls_temp = ie_1.getparent( ).classname( )
			ls_result += wf_result_add(ls_item, "1. classname ", not isnull(ls_temp) and ls_temp = "w_inkedit" )				
		case lower("Hide")
			li_rtn = ie_1.hide()
			sleep(2)
			ie_1.show( )
			ls_result += wf_result_add(ls_item, "1. return ",  not isnull(li_rtn) and li_rtn = 1 )				
		case lower("Move")
			//default x=759, y =40 
			li_rtn = ie_1.move(200, 5)
			ls_result += wf_result_add(ls_item, "1. set smaller ",  not isnull(li_rtn) and li_rtn = 1 )			
			
			li_rtn = 0
			li_rtn = ie_1.move(1200, 200)
			ls_result += wf_result_add(ls_item, "2. set bigger ",  not isnull(li_rtn) and li_rtn = 1 )			
			
			li_rtn = 0
			li_rtn = ie_1.move(759, 40)
			ls_result += wf_result_add(ls_item, "3. set normal ",  not isnull(li_rtn) and li_rtn = 1 )			 
		case lower("Paste")		
//			Return Values
//			Returns the number of characters that were pasted into the edit control for dwcontrol. 
//			If nothing has been cut or copied (the clipboard is empty), Paste does not change the contents of the edit control and returns 0. 
//			If the clipboard contains nontext data (for example, a bitmap or OLE object) and the control cannot accept that data, 
//			Paste does not change the contents and returns 0.
//			If dwcontrol is null, in PowerBuilder and JavaScript the method returns null.
			ie_1.text ="none"
			setnull(ls_temp2)
			Clipboard(ls_temp2)
			ll_tmp = ie_1.paste( )		//bug, always return 1
			ls_result += wf_result_add(ls_item, "1. Clipboard null ",  ll_tmp = 0 )	
			
						
			// bug 	//after paste null  the ie_1.text value is wrong. 
			ie_1.text ="none"
			setnull(ll_tmp)		
			ls_temp2 ="About this Appeon for PowerBuilder Help:" 
			Clipboard(ls_temp2)
			ll_tmp = ie_1.paste( )
			ls_result += wf_result_add(ls_item, "2. all ",  ll_tmp > 0 and ie_1.text = ls_temp2+"none"  )				
			//
			ie_1.text ="none"
			ls_temp2 = ""
			Clipboard(ls_temp2)
			ll_tmp = ie_1.paste( )
			ls_result += wf_result_add(ls_item, "3. Clipboard empty ",  ll_tmp = 0 )		
			
			
			setnull(ll_tmp)		
			ls_temp2 ="About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			Clipboard(ls_temp2)
			ll_tmp = ie_1.paste( )
			ls_result += wf_result_add(ls_item, "4. Clipboard text ",  ll_tmp > 0 and ie_1.text = ls_temp2+"none"  )		
			
			
			setnull(ll_tmp)		
			ls_temp = ""
			ie_1.selecttext( 11, 1)
			ls_temp2 = " in "
			Clipboard(ls_temp2)
			ll_tmp = ie_1.paste( )
			ie_1.selecttext( 7, 31)
			li_rtn = ie_1.copy( )
			ls_temp = Clipboard()
			ls_result += wf_result_add(ls_item, "5. special position ",  ll_tmp > 0 and ls_temp = "this in Appeon for PowerBuilder")
			
		case lower("PointerX")
			li_rtn = ie_1.pointerx( )
			ls_result += wf_result_add(ls_item, "1. get default ",  not isnull(li_rtn) and li_rtn > 0)
		case lower("PointerY")
			li_rtn = ie_1.pointery( )
			ls_result += wf_result_add(ls_item, "1. get default ",  not isnull(li_rtn) and li_rtn > 0)			
		case lower("Position")
			ie_1.selecttext( 1, 1)
			ll_tmp = ie_1.position( )
			ls_result += wf_result_add(ls_item, "1. get first ",  not isnull(ll_tmp) and ll_tmp = 1)			
			
			ll_tmp  = 0
			ie_1.selecttext( 6, 1)
			ll_tmp = ie_1.position( )
			ls_result += wf_result_add(ls_item, "2. get mid ",  not isnull(ll_tmp) and ll_tmp = 6)						
			
			ll_position = 0
			ll_position = len(ie_1.text)
			ie_1.selecttext( ll_position, 1)
			ll_tmp = ie_1.position( )
			ls_result += wf_result_add(ls_item, "3. get end ",  not isnull(ll_tmp) and ll_tmp = ll_position)									
		case lower("PostEvent")
			lbn_flag = ie_1.postevent( constructor!)
			Yield ( )
			ls_result += wf_result_add(ls_item, "1. constructor ", lbn_flag = true and pos(lower(is_log), "constructor()") > 0)			
			
			is_log = ""
			lbn_flag = false
			lbn_flag = ie_1.postevent( 'stroke')
			Yield ( )
			ls_result += wf_result_add(ls_item, "2. stroke ", lbn_flag = true and pos(lower(is_log), "stroke()") > 0)			
			
			is_log = ""
			lbn_flag = false
			lbn_flag = ie_1.postevent( 'getfocus')
			Yield ( )
			ls_result += wf_result_add(ls_item, "3. getfocus ", lbn_flag = true and pos(lower(is_log), "getfocus()") > 0)						
			
			is_log = ""
			lbn_flag = false
			lbn_flag = ie_1.postevent( losefocus!)
			Yield ( )
			ls_result += wf_result_add(ls_item, "4. losefocus ", lbn_flag = true and pos(lower(is_log), "losefocus()") > 0)						
			
			is_log = ""
			lbn_flag = false	
			lbn_flag = ie_1.postevent( modified!)			
			Yield ( )
			ls_result += wf_result_add(ls_item, "5. modified ", lbn_flag = true and pos(lower(is_log), "modified()") > 0)						
			
			is_log = ""
			lbn_flag = false
			lbn_flag = ie_1.postevent( rbuttondown!)
			Yield ( )
			ls_result += wf_result_add(ls_item, "6. rbuttondown ", lbn_flag = true and pos(lower(is_log), "rbuttondown()") > 0)									
		case lower("Print")
			is_type = "PrintCancel"
			yield()
			timer(1)

			ll_tmp = PrintOpen("Test inkedit Print",false)
			li_rtn = ie_1.print( ll_tmp,500, 1000)	
			if not isnull(ll_tmp) and ll_tmp > 0 then PrintClose(ll_tmp)
			ls_result += wf_result_add(ls_item, "1. job ", li_rtn =1 and FileExists(gs_cachedir+gs_dirseparator+"PrintCancelTest1.xps"))		
			
			is_type = ""
			
			if FileExists(gs_cachedir+gs_dirseparator+"PrintCancelTest1.xps") then FileDelete(gs_cachedir+gs_dirseparator+"PrintCancelTest1.xps")					//add 
			if FileExists(gs_cachedir+gs_dirseparator+"PrintCancelTest1.oxps") then FileDelete(gs_cachedir+gs_dirseparator+"PrintCancelTest1.oxps")		
			yield()
			setnull(ll_tmp)
			ll_tmp = PrintOpen("Test inkedit Print",false)
			li_rtn = ie_1.print( ll_tmp, 120, 150, this.width / 2  ,   this.height / 2 )
			if not isnull(ll_tmp) and ll_tmp > 0 then PrintClose(ll_tmp)
			ls_result += wf_result_add(ls_item, "2. job four ", li_rtn =1 and FileExists(gs_cachedir+gs_dirseparator+"PrintCancelTest1.xps"))		
			
			is_type = ""			
		case lower("Resize")
			//default 		1897		1432
			li_rtn = ie_1.resize(48,20)
			ls_result += wf_result_add(ls_item, "1.function set small ", not isnull(li_rtn) and li_rtn = 1)		
			
			li_rtn = 0 
			li_rtn = ie_1.resize(2200,1600)
			ls_result += wf_result_add(ls_item, "2.function set big ", not isnull(li_rtn) and li_rtn = 1)		
			
			li_rtn = 0 
			li_rtn = ie_1.resize(5,5)
			ls_result += wf_result_add(ls_item, "3.function set smaller ", not isnull(li_rtn) and li_rtn = 1)		
			
			li_rtn = 0 
			li_rtn = ie_1.resize(1897,1432)
			ls_result += wf_result_add(ls_item, "4.function set default ", not isnull(li_rtn) and li_rtn = 1)		
		case lower("RecognizeText")
			li_rtn = ie_1.recognizetext( )
			ls_result += wf_result_add(ls_item, "1.function get ", not isnull(li_rtn) and li_rtn = 1)		
		case lower("ReplaceText")
			//For InkEdit, returns 1 for success and -1 if an error occurs. 
			is_type = 'msgbox'
			timer(1)
			ls_temp2 ="About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			ie_1.text = ls_temp2
			ll_tmp = ie_1.ReplaceText(" 60 Days ")
			messagebox('info',ie_1.text)
			ls_result += wf_result_add(ls_item, "1. no select ", ll_tmp =1 and ie_1.text =" 60 Days " + ls_temp2)
			
			ll_tmp = 0 
			ie_1.selecttext(1, 9)
			ll_tmp = ie_1.ReplaceText(" 3 Months ")
			messagebox('info',ie_1.text)
			ls_result += wf_result_add(ls_item, "2. select frist ", ll_tmp =1 and ie_1.text =" 3 Months " + ls_temp2)
						
			ll_tmp = 0 
			ie_1.selecttext(57, 4)
			ll_tmp = ie_1.ReplaceText("IE")
			messagebox('info',ie_1.text)
			ls_temp2 =" 3 Months About this Appeon for PowerBuilder Help: This IE help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			ls_result += wf_result_add(ls_item, "3. select mid ", ll_tmp =1 and ie_1.text = ls_temp2)
			
			ll_tmp = 0 
			ie_1.selecttext(101, 1)
			ll_tmp = ie_1.ReplaceText(" the ")
			messagebox('info',ie_1.text)
			ls_temp2 =" 3 Months About this Appeon for PowerBuilder Help: This IE help contains the HTML version of several the Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 			
			ls_result += wf_result_add(ls_item, "4. select nothing ", ll_tmp =1 and ie_1.text = ls_temp2)
		case lower("SelectedLength")
//			Return Values
//			Returns the length of the selected text in dwcontrol. If no text is selected, SelectedLength returns 0. If an error occurs, it returns –1. 
			ls_temp2 ="About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			ie_1.text = ls_temp2
			li_rtn = ie_1.selectedlength( )
			ls_result += wf_result_add(ls_item, "1. no select ", not isnull(li_rtn) and li_rtn =0 )
			
			setnull(li_rtn)
			ie_1.selecttext(1, 17)
			li_rtn = ie_1.selectedlength( )
			ls_result += wf_result_add(ls_item, "2. select frist ", not isnull(li_rtn) and li_rtn =17 )
			
			setnull(li_rtn)
			ie_1.selecttext(57, 4)
			li_rtn = ie_1.selectedlength( )
			ls_result += wf_result_add(ls_item, "3. select mid ", not isnull(li_rtn) and li_rtn =4 )
			
			setnull(li_rtn)
			ie_1.selecttext(101, 1)
			li_rtn = ie_1.selectedlength( )
			ls_result += wf_result_add(ls_item, "4. select one ", not isnull(li_rtn) and li_rtn =1 )			
		case lower("SelectedText")
//			Return Values
//			Returns the selected text in dwcontrol. If there is no selected text or if an error occurs, SelectedText returns the empty string (""). 
			ls_temp2 ="About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			ie_1.text = ls_temp2
			ls_temp = ie_1.SelectedText()
			ls_result += wf_result_add(ls_item, "1. no select ", not isnull(ls_temp) and ls_temp = "")
						
			ls_temp = ""
			ie_1.selecttext(1, 17)
			ls_temp = ie_1.SelectedText()
			ls_result += wf_result_add(ls_item, "2. select frist ", not isnull(ls_temp) and ls_temp = "About this Appeon")
			
			ls_temp = ""
			ie_1.selecttext(47, 4)
			ls_temp = ie_1.SelectedText()
			ls_result += wf_result_add(ls_item, "3. select mid ", not isnull(ls_temp) and ls_temp = "HTML")
			
			ls_temp = ""
			ie_1.selecttext(100, 1)
			ls_temp = ie_1.SelectedText()
			ls_result += wf_result_add(ls_item, "4. select space ", not isnull(ls_temp) and ls_temp = " ")
			
			ls_temp = ""
			ie_1.selecttext(1, len(ls_temp2))
			ls_temp = ie_1.SelectedText()
			ls_result += wf_result_add(ls_item, "5. select all ", not isnull(ls_temp) and ls_temp =ls_temp2)			
		case lower("SelectText")
			setnull(ll_tmp)
			ls_temp2 ="About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and for Pure-JavaScript are the HTML version of the Appeon Supported Features Guide for Appeon Xcelerator deployment and for Pure-JavaScript; Appeon-compliant Framework Reference is the HTML version of the Using the PowerBuilder Foundation Class with Appeon." 
			ie_1.text = ls_temp2
			ll_tmp = ie_1.SelectText(len(ie_1.text) , 0)
			ls_result += wf_result_add(ls_item, "1. no select ", not isnull(ll_tmp) and ll_tmp = 0)
			
			setnull(ll_tmp)
			ll_tmp = ie_1.SelectText(1, len(ie_1.text))
			ls_result += wf_result_add(ls_item, "2. select all ", not isnull(ll_tmp) and ll_tmp = len(ls_temp2) )
			
			setnull(ll_tmp)
			ll_tmp = ie_1.SelectText(2, 3)
			ls_result += wf_result_add(ls_item, "3. select 3 ", not isnull(ll_tmp) and ll_tmp = 3 )
			
			setnull(ll_tmp)
			ll_tmp = ie_1.SelectText(2, len(ie_1.text))
			ls_result += wf_result_add(ls_item, "4. select than length ", not isnull(ll_tmp) and ll_tmp = len(ls_temp2) - 1)
			
			setnull(ll_tmp)
			ll_tmp = ie_1.SelectText(1, 3)
			ls_result += wf_result_add(ls_item, "5. select normal 3 ", not isnull(ll_tmp) and ll_tmp = 3 )	
		case lower("SetFocus")
			li_rtn = ie_1.setfocus( )
			ls_result += wf_result_add(ls_item, "1. set normal ", not isnull(li_rtn) and li_rtn = 1 )
		case lower("SetPosition")
			li_rtn = ie_1.setposition(ToBottom! )
			ls_result += wf_result_add(ls_item, "1. set ToBottom ", not isnull(li_rtn) and li_rtn = 1 )
			
			setnull(li_rtn)
			li_rtn = ie_1.setposition(ToTop! )
			ls_result += wf_result_add(ls_item, "2. set ToTop ", not isnull(li_rtn) and li_rtn = 1 )

			setnull(li_rtn)
			li_rtn = ie_1.setposition(Behind!, st_1)
			ls_result += wf_result_add(ls_item, "3. set Behind ", not isnull(li_rtn) and li_rtn = 1 )
			
			setnull(li_rtn)
			li_rtn = ie_1.setposition(ToTop! )
			ls_result += wf_result_add(ls_item, "4. set default ", not isnull(li_rtn) and li_rtn = 1 )
		case lower("SetRedraw")
			li_rtn = ie_1.setredraw( true)
			ls_result += wf_result_add(ls_item, "1. set true ", not isnull(li_rtn) and li_rtn = 1 )
			
			setnull(li_rtn)
			li_rtn = ie_1.setredraw( false)
			ls_result += wf_result_add(ls_item, "2. set false ", not isnull(li_rtn) and li_rtn = 1 )			
		case lower("Show")
			ie_1.hide( )
			sleep(2)
			li_rtn = ie_1.show( )
			ls_result += wf_result_add(ls_item, "1. set ", not isnull(li_rtn) and li_rtn = 1 )
		case lower("TriggerEvent")
			li_rtn = ie_1.triggerevent( constructor!)
			Yield ( )
			ls_result += wf_result_add(ls_item, "1. constructor ", not isnull(li_rtn) and li_rtn = 1  and pos(lower(is_log), "constructor()") > 0 )
			
			is_log = ""
			li_rtn = 0 
			li_rtn = ie_1.triggerevent( 'stroke')
			Yield ( )
			ls_result += wf_result_add(ls_item, "2. stroke ", not isnull(li_rtn) and li_rtn = 1  and pos(lower(is_log), "stroke()") > 0 )

			is_log = ""
			li_rtn = 0 
			li_rtn = ie_1.triggerevent( 'getfocus')
			Yield ( )
			ls_result += wf_result_add(ls_item, "3. getfocus ", not isnull(li_rtn) and li_rtn = 1  and pos(lower(is_log), "getfocus()") > 0 )

			is_log = ""
			li_rtn = 0 
			li_rtn = ie_1.triggerevent( losefocus!)
			Yield ( )
			ls_result += wf_result_add(ls_item, "4. losefocus ", not isnull(li_rtn) and li_rtn = 1  and pos(lower(is_log), "losefocus()") > 0 )
			
			is_log = ""
			li_rtn = 0 
			li_rtn = ie_1.triggerevent( modified!)			
			Yield ( )
			ls_result += wf_result_add(ls_item, "5. modified ", not isnull(li_rtn) and li_rtn = 1  and pos(lower(is_log), "modified()") > 0 )

			is_log = ""
			li_rtn = 0 
			li_rtn = ie_1.triggerevent( rbuttondown!)
			Yield ( )	
			ls_result += wf_result_add(ls_item, "6. rbuttondown ", not isnull(li_rtn) and li_rtn = 1  and pos(lower(is_log), "rbuttondown()") > 0 )

			is_log = ""
			li_rtn = 0 
			li_rtn = ie_1.triggerevent( 'gesture')
			Yield ( )
			ls_result += wf_result_add(ls_item, "7. gesture ", not isnull(li_rtn) and li_rtn = 1  and pos(lower(is_log), "gesture()") > 0 )
			
			is_log = ""
			li_rtn = 0 
			li_rtn = ie_1.triggerevent(destructor!)
			Yield ( )
			ls_result += wf_result_add(ls_item, "8. destructor ", not isnull(li_rtn) and li_rtn = 1  and pos(lower(is_log), "destructor()") > 0 )
		case lower("TypeOf")		
			ls_result += wf_result_add(ls_item, "1. get default ", ie_1.typeof( ) = inkedit! )	
		case lower("")	
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

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "Constructor"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "Destructor"
ls_array[Upperbound(ls_array) + 1 ] = "Gesture"
ls_array[Upperbound(ls_array) + 1 ] = "GetFocus"
ls_array[Upperbound(ls_array) + 1 ] = "Help"
ls_array[Upperbound(ls_array) + 1 ] = "LoseFocus"
ls_array[Upperbound(ls_array) + 1 ] = "Modified"
ls_array[Upperbound(ls_array) + 1 ] = "Other"
ls_array[Upperbound(ls_array) + 1 ] = "RButtonDown"
ls_array[Upperbound(ls_array) + 1 ] = "RecognitionResult"
ls_array[Upperbound(ls_array) + 1 ] = "Stroke"
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
		case lower("Constructor")	
			//			... your test case code...
			ie_1.event constructor( )				
			ls_result += wf_result_add(ls_item, "1. event ", not isnull(is_log)  and pos(lower(is_log), lower( " Constructor() Triggered ")) > 0)					
		case lower("Destructor")
			ie_1.event destructor( )
			ls_result += wf_result_add(ls_item, "1. event ", not isnull(is_log)  and pos(lower(is_log), lower( " Destructor() Triggered")) > 0)	
		case lower("Gesture")
			lbn_flag = ie_1.event gesture( 1 )
			ls_result += wf_result_add(ls_item, "1. event ", not isnull(is_log)  and pos(lower(is_log), lower( " Gesture() Triggered")) > 0 and lbn_flag =true )	
		case lower("GetFocus")
			ie_1.event getfocus( )
			ls_result += wf_result_add(ls_item, "1. event ", not isnull(is_log)  and pos(lower(is_log), lower( " GetFocus() Triggered")) > 0)	
		case lower("Help")
			yield()
			ie_1.event help(ie_1.x + 100 ,ie_1.y + 100 )
			ls_result += wf_result_add(ls_item, "1. event ", not isnull(is_log)  and pos(lower(is_log), lower( " Help() Triggered")) > 0)	
			
		case lower("LoseFocus")
			ie_1.event losefocus( )
			ls_result += wf_result_add(ls_item, "1. event ", not isnull(is_log)  and pos(lower(is_log), lower( " LoseFocus() Triggered")) > 0)	
		case lower("Modified")
			ie_1.event modified( )
			ls_result += wf_result_add(ls_item, "1. event ", not isnull(is_log)  and pos(lower(is_log), lower( " Modified() Triggered")) > 0)	
		case lower("Other")
			ie_1.event other(10,10)
			ls_result += wf_result_add(ls_item, "1. event ", not isnull(is_log)  and pos(lower(is_log), lower( " Other() Triggered")) > 0)	
		case lower("RButtonDown")
			ie_1.event rbuttondown( 2, ie_1.x + 200, ie_1.y + 200 ) 
			ls_result += wf_result_add(ls_item, "1. event Right ", not isnull(is_log)  and pos(lower(is_log), lower( " RButtonDown() Triggered")) > 0)	
	
			is_log = ""
			ie_1.event rbuttondown( 1, ie_1.x + 100, ie_1.y + 100 ) 
			ls_result += wf_result_add(ls_item, "2. event Left ", not isnull(is_log)  and pos(lower(is_log), lower( " RButtonDown() Triggered")) > 0)				
		case lower("RecognitionResult")
			ie_1.event recognitionresult( )
			ls_result += wf_result_add(ls_item, "1. event ", not isnull(is_log)  and pos(lower(is_log), lower( " RecognitionResult() Triggered")) > 0)	
		case lower("Stroke")
			ie_1.event stroke( )
			ls_result += wf_result_add(ls_item, "1. event ", not isnull(is_log)  and pos(lower(is_log), lower( " Stroke() Triggered")) > 0)	
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module3 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

ls_array[Upperbound(ls_array) + 1 ] = "style AntiAliased"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "style Color"
ls_array[Upperbound(ls_array) + 1 ] = "style Height"
ls_array[Upperbound(ls_array) + 1 ] = "style IgnorePressure"
ls_array[Upperbound(ls_array) + 1 ] = "style Pentip"
ls_array[Upperbound(ls_array) + 1 ] = "style Transparency"
ls_array[Upperbound(ls_array) + 1 ] = "style Width"
ls_array[Upperbound(ls_array) + 1 ] = "style AutoSelect"
ls_array[Upperbound(ls_array) + 1 ] = "style DisplayOnly"
ls_array[Upperbound(ls_array) + 1 ] = "style Factoid"
ls_array[Upperbound(ls_array) + 1 ] = "style FocusRectangle"
ls_array[Upperbound(ls_array) + 1 ] = "style HScrollbar"
ls_array[Upperbound(ls_array) + 1 ] = "style InkMode"
ls_array[Upperbound(ls_array) + 1 ] = "style Limit"
ls_array[Upperbound(ls_array) + 1 ] = "style NilIsNull"
ls_array[Upperbound(ls_array) + 1 ] = "style RecognitionTimer"
ls_array[Upperbound(ls_array) + 1 ] = "style Required"
ls_array[Upperbound(ls_array) + 1 ] = "style UseMouseForInput"
ls_array[Upperbound(ls_array) + 1 ] = "style VScrollbar"
ls_array[Upperbound(ls_array) + 1 ] = ""

dw_1.dataobject= 'd_datawindow_column_inkedit_style'			//not same
dw_1.settransobject( sqlca)
dw_1.retrieve( )

//inkedit.limit=0 inkedit.focusrectangle=no inkedit.autoselect=yes inkedit.inkmode=2 inkedit.recognitiontimer=2000 inkedit.factoid="" 
//ink.antialiased = yes ink.height=1 ink.width=53  
//
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
		case lower("style AntiAliased")	
			//			... your test case code...				
			ls_temp = dw_1.Describe("fdescription.Ink.antialiased")
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ls_temp) and ls_temp = "yes")
			
			ls_temp = ""
			ls_temp = dw_1.Modify("fdescription.Ink.antialiased=no")
			ls_temp = dw_1.Object.fdescription.ink.antialiased
			ls_result += wf_result_add(ls_item, "2. set false ", not isnull(ls_temp) and ls_temp = "no")
			
			ls_temp = ""
			ls_temp = dw_1.Modify("fdescription.ink.antialiased=yes")
			ls_temp = dw_1.Object.fdescription.ink.antialiased
			ls_result += wf_result_add(ls_item, "3. set true ", not isnull(ls_temp) and ls_temp = "yes")			
		case lower("style Color")
			//获取原始值
			ll_tmp = long(dw_1.Describe("fdescription.Ink.Color"))			
			ls_result += wf_result_add(ls_item, " 1. get orginal 0, real value = " + string(ll_tmp), ll_tmp = 0)			
			
			//动态设置BackColor为-3， 无效值
			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.Color=-3")
			ll_tmp = long(dw_1.Object.fdescription.ink.Color)
			ls_result += wf_result_add(ls_item, " 2. set -3, real value = " + string(ll_tmp), ll_tmp = -3)			
			
			//非正常值，正数
			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.Color=10000")
			ll_tmp = long(dw_1.Object.fdescription.ink.Color)
			ls_result += wf_result_add(ls_item, " 3. set 10000, real value = " + string(ll_tmp), ll_tmp = 10000)	
			
			//正常值
			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.Color=16777215")
			ll_tmp = long(dw_1.Object.fdescription.ink.Color)		
			ls_result += wf_result_add(ls_item, " 4. set 16777215, real value = " + string(ll_tmp),  ll_tmp = 16777215)	
			
			//超出范围
			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.Color=16777216")
			ll_tmp = long(dw_1.Object.fdescription.ink.Color)
			ls_result += wf_result_add(ls_item, " 5. set 16777216, real value = " + string(ll_tmp),ll_tmp = 16777216)			
		case lower("style Height")
			ll_tmp = long(dw_1.Describe("fdescription.Ink.height"))			
			ls_result += wf_result_add(ls_item, " 1. get orginal ", not isnull(ll_tmp) and ll_tmp = 1)			

			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.height=118")
			ll_tmp = long(dw_1.Object.fdescription.ink.height)
			ls_result += wf_result_add(ls_item, " 2. set bigger ", not isnull(ll_tmp) and ll_tmp = 118)			

			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.height=1")
			ll_tmp = long(dw_1.Object.fdescription.ink.height)
			ls_result += wf_result_add(ls_item, " 3. set orginal ", not isnull(ll_tmp) and ll_tmp = 1)		
		case lower("style IgnorePressure")
			ls_temp = dw_1.Describe("fdescription.Ink.IgnorePressure")
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ls_temp) and ls_temp = "no")
			
			ls_temp = ""
			ls_temp = dw_1.Modify("fdescription.Ink.IgnorePressure=yes")
			ls_temp = dw_1.Object.fdescription.ink.IgnorePressure
			ls_result += wf_result_add(ls_item, "2. set true ", not isnull(ls_temp) and ls_temp = "yes")
			
			ls_temp = ""
			ls_temp = dw_1.Modify("fdescription.ink.IgnorePressure=no")
			ls_temp = dw_1.Object.fdescription.ink.IgnorePressure
			ls_result += wf_result_add(ls_item, "3. set false ", not isnull(ls_temp) and ls_temp = "no")		
		case lower("style Pentip")
			ls_temp = dw_1.Describe("fdescription.Ink.Pentip")
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ls_temp) and ls_temp = "0")
			
			ls_temp = ""
			ls_temp = dw_1.Modify("fdescription.Ink.Pentip=1")
			ls_temp = dw_1.Object.fdescription.ink.Pentip
			ls_result += wf_result_add(ls_item, "2. set 1 ", not isnull(ls_temp) and ls_temp = "1")
			
			ls_temp = ""
			ls_temp = dw_1.Modify("fdescription.ink.Pentip=0")
			ls_temp = dw_1.Object.fdescription.ink.Pentip
			ls_result += wf_result_add(ls_item, "3. set 0 ", not isnull(ls_temp) and ls_temp = "0")		
		case lower("style Transparency")
			ll_tmp = long(dw_1.Describe("fdescription.Ink.Transparency"))			
			ls_result += wf_result_add(ls_item, " 1. get orginal 0, real value = " + string(ll_tmp), ll_tmp = 0)			

			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.Transparency=255")
			ll_tmp = long(dw_1.Object.fdescription.ink.Transparency)
			ls_result += wf_result_add(ls_item, " 2. set bigger 255, real value = " + string(ll_tmp), ll_tmp = 255)			

			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.Transparency=256")
			ll_tmp = long(dw_1.Object.fdescription.ink.Transparency)
			ls_result += wf_result_add(ls_item, " 3. set biggest 256, real value = " + string(ll_tmp), ll_tmp = 256)	
			
			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.Transparency=-3")
			ll_tmp = long(dw_1.Object.fdescription.ink.Transparency)	//return 65533
			ls_result += wf_result_add(ls_item, " 4. set smallest -3, real value = " + string(ll_tmp), ll_tmp = 65533)	
			
			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.Transparency=0")
			ll_tmp = long(dw_1.Object.fdescription.ink.Transparency)
			ls_result += wf_result_add(ls_item, " 5. set orginal 0, real value = " + string(ll_tmp),ll_tmp = 0)		
		case lower("style Width")
			ll_tmp = long(dw_1.Describe("fdescription.Ink.Width"))			
			ls_result += wf_result_add(ls_item, " 1. get default 53, real value = " + string(ll_tmp), not isnull(ll_tmp ) and ll_tmp  = 53)					
			
			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.Width=-3")
			ll_tmp = long(dw_1.Describe("fdescription.Ink.Width"))			
			ls_result += wf_result_add(ls_item, " 2. set -3, real value = " + string(ll_tmp), not isnull(ll_tmp ) and ll_tmp  = -3)		
			
			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.Width=26")
			ll_tmp = long(dw_1.Describe("fdescription.Ink.Width"))			
			ls_result += wf_result_add(ls_item, " 3. set 26, real value = " + string(ll_tmp), ll_tmp  = 26)		 
			
			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.Width=0")
			ll_tmp = long(dw_1.Describe("fdescription.Ink.Width"))			
			ls_result += wf_result_add(ls_item, " 4. set 0, real value = " + string(ll_tmp), ll_tmp  = 0)		 
			
			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.Width=600")
			ll_tmp = long(dw_1.Describe("fdescription.Ink.Width"))			
			ls_result += wf_result_add(ls_item, " 5. set 600, real value = " + string(ll_tmp), ll_tmp  = 600	)		
			
			ll_tmp = 0 
			ls_temp = dw_1.Modify("fdescription.Ink.Width=53")
			ll_tmp = long(dw_1.Describe("fdescription.Ink.Width"))			
			ls_result += wf_result_add(ls_item, " 6. set default, real value = " + string(ll_tmp),ll_tmp  = 53	)	
		case lower("style AutoSelect")
			//获取原始值 yes
			ls_temp = ""
			ls_temp = dw_1.describe( "fdescription.inkedit.AutoSelect ")			
			ls_result += wf_result_add(ls_item, " 1. get default ", not isnull(ls_temp ) and ls_temp  = "yes"	)	
	
			//动态修改为no
			ls_temp = dw_1.Modify( "fdescription.inkedit.AutoSelect ="+"no")
			ls_temp = dw_1.describe( "fdescription.inkedit.AutoSelect ")			
			ls_result += wf_result_add(ls_item, " 2. set no ", not isnull(ls_temp ) and ls_temp  = "no"	)	

			//动态修改为yes
			ls_temp = dw_1.Modify( "fdescription.inkedit.AutoSelect ="+"yes")
			ls_temp = dw_1.describe( "fdescription.inkedit.AutoSelect ")			
			ls_result += wf_result_add(ls_item, " 3. set yes ", not isnull(ls_temp ) and ls_temp  = "yes"	)	
		case lower("style DisplayOnly")
			//获取原始值 no
			ls_temp = ""
			ls_temp = dw_1.describe( "fdescription.inkedit.DisplayOnly ")			
			ls_result += wf_result_add(ls_item, " 1. get default ", not isnull(ls_temp ) and ls_temp  = "no"	)	
	
			//动态修改为 yes
			ls_temp = dw_1.Modify( "fdescription.inkedit.DisplayOnly ="+"yes")
			ls_temp = dw_1.describe( "fdescription.inkedit.DisplayOnly ")			
			ls_result += wf_result_add(ls_item, " 2. set yes ", not isnull(ls_temp ) and ls_temp  = "yes"	)	

			//动态修改为 no
			ls_temp = dw_1.Modify( "fdescription.inkedit.DisplayOnly ="+"no")
			ls_temp = dw_1.describe( "fdescription.inkedit.DisplayOnly ")			
			ls_result += wf_result_add(ls_item, " 3. set no ", not isnull(ls_temp ) and ls_temp  = "no"	)	
		case lower("style Factoid")
			ls_temp = dw_1.Object.fdescription.InkEdit.Factoid
			ls_result += wf_result_add(ls_item, " 1. get default ", not isnull(ls_temp ) and (ls_temp  = "" or ls_temp = "DEFAULT")	)	
			
			ls_temp = ""
			dw_1.Object.fdescription.InkEdit.Factoid = "EMAIL"	
			ls_temp = dw_1.Describe("fdescription.InkEdit.Factoid")
			ls_result += wf_result_add(ls_item, " 2. set EMAIL ", not isnull(ls_temp ) and ls_temp  = "EMAIL"	)	
			
			ls_temp = ""
			ls_temp2 = dw_1.Modify("fdescription.InkEdit.Factoid=DEFAULT")
			ls_temp = dw_1.Describe("fdescription.InkEdit.Factoid")
			ls_result += wf_result_add(ls_item, " 3. set DEFAULT ", not isnull(ls_temp ) and ls_temp  = "DEFAULT"	)	
			
			ls_temp = ""
			dw_1.Object.fdescription.InkEdit.Factoid = ""	
			ls_temp = dw_1.Describe("fdescription.InkEdit.Factoid")
			ls_result += wf_result_add(ls_item, " 4. set empty ", not isnull(ls_temp ) and ls_temp  = ""	)			
		case lower("style FocusRectangle")
			//获取原始值 no
			ls_temp = ""
			ls_temp = dw_1.describe( "fdescription.inkedit.FocusRectangle ")			
			ls_result += wf_result_add(ls_item, " 1. get default ", not isnull(ls_temp ) and ls_temp  = "no"	)	
	
			//动态修改为 yes
			ls_temp = dw_1.Modify( "fdescription.inkedit.FocusRectangle ="+"yes")
			ls_temp = dw_1.describe( "fdescription.inkedit.FocusRectangle ")			
			ls_result += wf_result_add(ls_item, " 2. set yes ", not isnull(ls_temp ) and ls_temp  = "yes"	)	

			//动态修改为 no
			ls_temp = dw_1.Modify( "fdescription.inkedit.FocusRectangle ="+"no")
			ls_temp = dw_1.describe( "fdescription.inkedit.FocusRectangle ")			
			ls_result += wf_result_add(ls_item, " 3. set no ", not isnull(ls_temp ) and ls_temp  = "no"	)	
		case lower("style HScrollbar")
			//获取原始值 no
			ls_temp = ""
			ls_temp = dw_1.describe( "fdescription.inkedit.HScrollbar ")			
			ls_result += wf_result_add(ls_item, " 1. get default ", not isnull(ls_temp ) and ls_temp  = "no"	)	
	
			//动态修改为 yes
			ls_temp = dw_1.Modify( "fdescription.inkedit.HScrollbar ="+"yes")
			ls_temp = dw_1.describe( "fdescription.inkedit.HScrollbar ")			
			ls_result += wf_result_add(ls_item, " 2. set yes ", not isnull(ls_temp ) and ls_temp  = "yes"	)	

			//动态修改为 no
			ls_temp = dw_1.Modify( "fdescription.inkedit.HScrollbar ="+"no")
			ls_temp = dw_1.describe( "fdescription.inkedit.HScrollbar ")			
			ls_result += wf_result_add(ls_item, " 3. set no ", not isnull(ls_temp ) and ls_temp  = "no"	)	
		case lower("Istyle InkMode")
			ls_temp = dw_1.Describe("fdescription.inkedit.inkmode")
			ls_result += wf_result_add(ls_item, "1. get default ", not isnull(ls_temp) and ls_temp = "2")
			
			ls_temp = ""
			ls_temp = dw_1.Modify("fdescription.inkedit.inkmode=1")
			ls_temp = dw_1.Object.fdescription.inkedit.inkmode
			ls_result += wf_result_add(ls_item, "2. set 1 ", not isnull(ls_temp) and ls_temp = "1")
			
			ls_temp = ""
			ls_temp = dw_1.Modify("fdescription.inkedit.inkmode=0")
			ls_temp = dw_1.Object.fdescription.inkedit.inkmode
			ls_result += wf_result_add(ls_item, "3. set 0 ", not isnull(ls_temp) and ls_temp = "0")		
			
			ls_temp = ""
			ls_temp = dw_1.Modify("fdescription.inkedit.inkmode=2")
			ls_temp = dw_1.Object.fdescription.inkedit.inkmode
			ls_result += wf_result_add(ls_item, "4. set 2 ", not isnull(ls_temp) and ls_temp = "2")				
		case lower("style Limit")
			ll_tmp = long(dw_1.Object.fdescription.inkedit.limit)
			ls_result += wf_result_add(ls_item, " 1.get default 0, real value = " + string(ll_tmp),ll_tmp  = 0)					
						
			ll_tmp = 0 
			dw_1.Object.fdescription.inkedit.limit = 600
			ll_tmp = long(dw_1.Object.fdescription.inkedit.limit)
			ls_result += wf_result_add(ls_item, " 2.set 600, real value = " + string(ll_tmp),ll_tmp  = 600)		 
						
			ll_tmp = 0 
			dw_1.Object.fdescription.inkedit.limit = -3
			ll_tmp = long(dw_1.Object.fdescription.inkedit.limit)
			ls_result += wf_result_add(ls_item, " 3.set -3, real value = " + string(ll_tmp),ll_tmp  = -3)		
			
			ll_tmp = 0 
			dw_1.Object.fdescription.inkedit.limit = 32767	
			ll_tmp = long(dw_1.Object.fdescription.inkedit.limit)
			ls_result += wf_result_add(ls_item, " 4.set 32767, real value = " + string(ll_tmp),ll_tmp  = 32767)		 
			
			ll_tmp = 0 
			dw_1.Object.fdescription.inkedit.limit = 32768
			ll_tmp = long(dw_1.Object.fdescription.inkedit.limit)
			ls_result += wf_result_add(ls_item, " 5.set 32768, real value = " + string(ll_tmp),ll_tmp  = -32768	)		
			
			ll_tmp = 0 
			dw_1.Object.fdescription.inkedit.limit = 0
			ll_tmp = long(dw_1.Object.fdescription.inkedit.limit)
			ls_result += wf_result_add(ls_item, " 6.set default 0, real value = " + string(ll_tmp),ll_tmp  = 0	)				
		case lower("style NilIsNull")
			//获取原始值 no
			ls_temp = ""
			ls_temp = dw_1.describe( "fdescription.inkedit.NilIsNull ")			
			ls_result += wf_result_add(ls_item, " 1. get default ", not isnull(ls_temp ) and ls_temp  = "no"	)	
	
			//动态修改为 yes
			ls_temp = dw_1.Modify( "fdescription.inkedit.NilIsNull ="+"yes")
			ls_temp = dw_1.describe( "fdescription.inkedit.NilIsNull ")			
			ls_result += wf_result_add(ls_item, " 2. set yes ", not isnull(ls_temp ) and ls_temp  = "yes"	)	

			//动态修改为 no
			ls_temp = dw_1.Modify( "fdescription.inkedit.NilIsNull ="+"no")
			ls_temp = dw_1.describe( "fdescription.inkedit.NilIsNull ")			
			ls_result += wf_result_add(ls_item, " 3. set no ", not isnull(ls_temp ) and ls_temp  = "no"	)	
		case lower("style RecognitionTimer")
			ll_tmp = long(dw_1.Object.fdescription.inkedit.recognitiontimer)
			ls_result += wf_result_add(ls_item, " 1.get default ", not isnull(ll_tmp ) and ll_tmp  = 2000)					
						
			ll_tmp = 0 
			dw_1.Object.fdescription.inkedit.recognitiontimer = 60000
			ll_tmp = long(dw_1.Object.fdescription.inkedit.recognitiontimer)
			ls_result += wf_result_add(ls_item, " 2.set 60000 ", not isnull(ll_tmp ) and ll_tmp  = 60000)		 
						
			ll_tmp = 0 
			dw_1.Object.fdescription.inkedit.recognitiontimer = -3
			ll_tmp = long(dw_1.Object.fdescription.inkedit.recognitiontimer)
			ls_result += wf_result_add(ls_item, " 3.set -3 ", not isnull(ll_tmp ) and (ll_tmp  = 0 or ll_tmp  = -3 ) )	
			
			ll_tmp = 0 
			dw_1.Object.fdescription.inkedit.recognitiontimer = 32767	
			ll_tmp = long(dw_1.Object.fdescription.inkedit.recognitiontimer)
			ls_result += wf_result_add(ls_item, " 4.set 32767 ", not isnull(ll_tmp ) and ll_tmp  = 32767)		 
						
			ll_tmp = 0 
			dw_1.Object.fdescription.inkedit.recognitiontimer = 0
			ll_tmp = long(dw_1.Object.fdescription.inkedit.recognitiontimer)
			ls_result += wf_result_add(ls_item, "5.set 0 ", not isnull(ll_tmp ) and ll_tmp  = 0	)		
			
			ll_tmp = 0 
			dw_1.Object.fdescription.inkedit.recognitiontimer = 2000
			ll_tmp = long(dw_1.Object.fdescription.inkedit.recognitiontimer)
			ls_result += wf_result_add(ls_item, " 6.set default ", not isnull(ll_tmp ) and ll_tmp  = 2000	)	
		case lower("style Required")
			//获取原始值 no
			ls_temp = ""
			ls_temp = dw_1.describe( "fdescription.inkedit.Required ")			
			ls_result += wf_result_add(ls_item, " 1. get default ", not isnull(ls_temp ) and ls_temp  = "no"	)	
	
			//动态修改为 yes
			ls_temp = dw_1.Modify( "fdescription.inkedit.Required ="+"yes")
			ls_temp = dw_1.describe( "fdescription.inkedit.Required ")			
			ls_result += wf_result_add(ls_item, " 2. set yes ", not isnull(ls_temp ) and ls_temp  = "yes"	)	

			//动态修改为 no
			ls_temp = dw_1.Modify( "fdescription.inkedit.Required ="+"no")
			ls_temp = dw_1.describe( "fdescription.inkedit.Required ")			
			ls_result += wf_result_add(ls_item, " 3. set no ", not isnull(ls_temp ) and ls_temp  = "no"	)	
		case lower("style UseMouseForInput")
			//获取原始值 no
			ls_temp = ""
			ls_temp = dw_1.describe( "fdescription.inkedit.usemouseforinput")			
			ls_result += wf_result_add(ls_item, " 1. get default ", not isnull(ls_temp ) and ls_temp  = "no"	)	
	
			//动态修改为 yes
			ls_temp = dw_1.Modify( "fdescription.inkedit.UseMouseForInput ="+"yes")
			ls_temp = dw_1.describe( "fdescription.inkedit.UseMouseForInput ")			
			ls_result += wf_result_add(ls_item, " 2. set yes ", not isnull(ls_temp ) and ls_temp  = "yes"	)	

			//动态修改为 no
			ls_temp = dw_1.Modify( "fdescription.inkedit.UseMouseForInput ="+"no")
			ls_temp = dw_1.describe( "fdescription.inkedit.UseMouseForInput ")			
			ls_result += wf_result_add(ls_item, " 3. set no ", not isnull(ls_temp ) and ls_temp  = "no"	)
		case lower("style VScrollbar")
			//获取原始值 no
			ls_temp = ""
			ls_temp = dw_1.describe( "fdescription.inkedit.VScrollbar ")			
			ls_result += wf_result_add(ls_item, " 1. get default ", not isnull(ls_temp ) and ls_temp  = "no"	)	
	
			//动态修改为 yes
			ls_temp = dw_1.Modify( "fdescription.inkedit.VScrollbar ="+"yes")
			ls_temp = dw_1.describe( "fdescription.inkedit.VScrollbar ")			
			ls_result += wf_result_add(ls_item, " 2. set yes ", not isnull(ls_temp ) and ls_temp  = "yes"	)	

			//动态修改为 no
			ls_temp = dw_1.Modify( "fdescription.inkedit.VScrollbar ="+"no")
			ls_temp = dw_1.describe( "fdescription.inkedit.VScrollbar ")			
			ls_result += wf_result_add(ls_item, " 3. set no ", not isnull(ls_temp ) and ls_temp  = "no"	)	
		case lower("")	
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result


end subroutine

on w_inkedit.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.ie_1=create ie_1
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_4
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.ie_1
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.st_1
end on

on w_inkedit.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.ie_1)
destroy(this.cb_1)
destroy(this.st_1)
end on

event ue_init_data;call super::ue_init_data;ie_1.x = 759
ie_1.y =40
ie_1.width = 1897
ie_1.height = 1432

ie_1.InkHeight = 1 
ie_1.inkwidth = 53
end event

event timer;call super::timer;if lower(is_type) = lower("PrintCancel") then 
	wf_closepopwindow( "Save the file as", 'Save')
	wf_closepopwindow( "Print to File", 'OK')
	wf_closepopwindow( "Save Print Output As", 'Save')			//for win10 print machine
end if 

if lower(is_type) = lower("msgbox") then
	wf_closepopwindow( "info", 'OK')
end if
end event

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator

if FileExists(ls_filepath+"PrintCancelTest1.xps") then
	FileDelete(ls_filepath+"PrintCancelTest1.xps")
end if

if FileExists(ls_filepath+"PrintCancelTest1.oxps") then			//for win10
	FileDelete(ls_filepath+"PrintCancelTest1.oxps")
end if
end event

event ue_preopen;call super::ue_preopen;
ie_1.x = 681
ie_1.y = 12
ie_1.width = 1966
ie_1.height = 1252

end event

type dw_1 from datawindow within w_inkedit
integer x = 91
integer y = 1224
integer width = 686
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "d_datawindow_column_inkedit_style"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_inkedit
integer x = 82
integer y = 680
integer width = 617
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute edit style"
end type

event clicked;of_testcase_point_module3()
end event

type cb_3 from commandbutton within w_inkedit
integer x = 91
integer y = 496
integer width = 603
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute event"
end type

event clicked;of_testcase_point_module2()
end event

type cb_2 from commandbutton within w_inkedit
integer x = 87
integer y = 308
integer width = 603
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute function"
end type

event clicked;of_testcase_point_module1()
end event

type ie_1 from inkedit within w_inkedit
integer x = 759
integer y = 40
integer width = 1897
integer height = 1432
integer taborder = 20
borderstyle borderstyle = stylelowered!
inkmode inkmode = collectink!
string text = "none"
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
end type

event stroke;is_log += ' Stroke() Triggered '

return true
end event

event constructor;is_log += ' Constructor() Triggered '  
end event

event destructor;is_log += ' Destructor() Triggered '
end event

event gesture;is_log += ' Gesture() Triggered '  

return true 
end event

event getfocus;is_log += ' Getfocus() Triggered '  
end event

event losefocus;is_log += ' Losefocus() Triggered '  
end event

event modified;is_log += ' Modified() Triggered '
end event

event recognitionresult;is_log += ' Recognitionresult() Triggered '
end event

event rbuttondown;is_log += ' Rbuttondown() Triggered '  
end event

event help;is_log += ' Help() Triggered '
end event

event other;is_log += ' Other() Triggered '
end event

type cb_1 from commandbutton within w_inkedit
integer x = 78
integer y = 136
integer width = 603
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute property"
end type

event clicked;of_testcase_point_module()
end event

type st_1 from statictext within w_inkedit
integer x = 59
integer y = 1124
integer width = 8718
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "About this Appeon for PowerBuilder Help: This HTML help contains the HTML version of several Appeon 3.0 user documents: Working with Appeon Developer is the HTML version of the Appeon Developer User Guide; Appeon Features Help for Appeon Xcelerator and f"
boolean focusrectangle = false
end type

