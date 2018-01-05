$PBExportHeader$w_inkpicture.srw
forward
global type w_inkpicture from w_base_case
end type
type st_memo from statictext within w_inkpicture
end type
type cb_3 from commandbutton within w_inkpicture
end type
type cb_2 from commandbutton within w_inkpicture
end type
type cb_1 from commandbutton within w_inkpicture
end type
type ip_1 from inkpicture within w_inkpicture
end type
type gb_1 from groupbox within w_inkpicture
end type
end forward

global type w_inkpicture from w_base_case
st_memo st_memo
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
ip_1 ip_1
gb_1 gb_1
end type
global w_inkpicture w_inkpicture

type variables
//eon_mobile_cameraex  ieon_camera
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
end prototypes

public subroutine of_testcase_point_module ();string ls_array[], ls_item, ls_result, ls_temp, ls_default_dataobject
long	ll_bound, i , ll_tmp
string ls_temp2	, ls_path
integer 	li_rtn

ls_result = ''
ll_bound =0 

ls_array[Upperbound(ls_array) + 1 ] = "AutoErase"
ls_array[Upperbound(ls_array) + 1 ] = "BackColor"
ls_array[Upperbound(ls_array) + 1 ] = "Border"
ls_array[Upperbound(ls_array) + 1 ] = "Borderstyle"
ls_array[Upperbound(ls_array) + 1 ] = "BringtoTop"
ls_array[Upperbound(ls_array) + 1 ] = "CollectionMode"
ls_array[Upperbound(ls_array) + 1 ] = "Dragauto"
ls_array[Upperbound(ls_array) + 1 ] = "DragIcon"
ls_array[Upperbound(ls_array) + 1 ] = "DynamicRendering"
ls_array[Upperbound(ls_array) + 1 ] = "EditMode"
ls_array[Upperbound(ls_array) + 1 ] = "Enabled"
ls_array[Upperbound(ls_array) + 1 ] = "Erasermode"
ls_array[Upperbound(ls_array) + 1 ] = "Eraserwidth"
ls_array[Upperbound(ls_array) + 1 ] = "Height"
ls_array[Upperbound(ls_array) + 1 ] = "HighContrastInk"
ls_array[Upperbound(ls_array) + 1 ] = "IgnorePressure"
ls_array[Upperbound(ls_array) + 1 ] = "InkAntiAliased"
ls_array[Upperbound(ls_array) + 1 ] = "InkColor"
ls_array[Upperbound(ls_array) + 1 ] = "InkEnabled"
ls_array[Upperbound(ls_array) + 1 ] = "InkFileName"					//unsupport	 	//This propery of inkpicture is readonly
ls_array[Upperbound(ls_array) + 1 ] = "InkHeight"
ls_array[Upperbound(ls_array) + 1 ] = "InkWidth"
ls_array[Upperbound(ls_array) + 1 ] = "MarginX"
ls_array[Upperbound(ls_array) + 1 ] = "MarginY"
ls_array[Upperbound(ls_array) + 1 ] = "PenTip"
ls_array[Upperbound(ls_array) + 1 ] = "PictureFileName"
ls_array[Upperbound(ls_array) + 1 ] = "PictureSizeMode"
ls_array[Upperbound(ls_array) + 1 ] = "PowerTipText"
ls_array[Upperbound(ls_array) + 1 ] = "Status"						// unsupport 	//status is a readonly property
ls_array[Upperbound(ls_array) + 1 ] = "TabOrder"
ls_array[Upperbound(ls_array) + 1 ] = "Tag"
ls_array[Upperbound(ls_array) + 1 ] = "Visible"
ls_array[Upperbound(ls_array) + 1 ] = "Width"
ls_array[Upperbound(ls_array) + 1 ] = "X"
ls_array[Upperbound(ls_array) + 1 ] = "Y"
//ls_array[Upperbound(ls_array) + 1 ] = ""

ls_path = gs_cachedir			
ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")
	is_log = ''
	ls_temp = ''
	li_rtn = 0 
	ls_temp2 = ''
	ll_tmp = 0
	choose case lower(ls_item)
		case lower("AutoErase")				
			//	default
			if ip_1.autoerase = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
	
			ip_1.autoerase = true 
			if ip_1.autoerase = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.autoerase = false 
			if ip_1.autoerase = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("BackColor")					
			//获取原始值
			ls_temp = string(ip_1.backcolor)
			if not isnull(ls_temp) and ls_temp = '1073741824'	then			//1073741824
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=  " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//动态设置BackColor为-3， 无效值
			ip_1.backcolor = - 3 
			ls_temp = string(ip_1.backcolor)
			if not isnull(ls_temp) and ls_temp = '-3'	then
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//非正常值，正数
			ip_1.backcolor = 10000 
			ls_temp = string(ip_1.backcolor)
			if not isnull(ls_temp) and ls_temp = '10000'	then
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//正常值
			ip_1.backcolor = 16777215 
			ls_temp = string(ip_1.backcolor)
			if not isnull(ls_temp) and ls_temp = '16777215'	then
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get normal = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get normal = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//超出范围
			ip_1.backcolor = 16777216 
			ls_temp = string(ip_1.backcolor)
			if not isnull(ls_temp) and (ls_temp = '16777216' or ls_temp = '0')	then
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Border")				
			//	default
			if ip_1.Border = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
	
			ip_1.Border = false 
			if ip_1.autoerase = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.autoerase = true 
			if ip_1.autoerase = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Borderstyle")			
			//	default
			if ip_1.borderstyle = StyleBox!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get StyleBox = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get StyleBox = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.borderstyle = StyleLowered!
			if ip_1.borderstyle = StyleLowered!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set StyleLowered = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set StyleLowered = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ip_1.borderstyle = StyleRaised!
			if ip_1.borderstyle = StyleRaised!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set StyleRaised = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set StyleRaised = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ip_1.borderstyle = StyleShadowBox!
			if ip_1.borderstyle = StyleShadowBox!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set StyleShadowBox = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set StyleShadowBox = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ip_1.borderstyle = StyleBox!
			if ip_1.borderstyle = StyleBox!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set StyleBox = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set StyleBox = "+String ( "Fail!" ) +"~r~n"
			end if			
		case lower("BringtoTop")	
			if ip_1.BringToTop = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.BringToTop = true 
			if ip_1.BringToTop = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.BringToTop = false 
			if ip_1.BringToTop = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("CollectionMode")	
			//	default
			if ip_1.collectionmode = inkonly!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get inkonly = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get inkonly = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.collectionmode = gestureonly!
			if ip_1.collectionmode = gestureonly!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set gestureonly = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set gestureonly = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ip_1.collectionmode = inkandgesture!
			if ip_1.collectionmode = inkandgesture!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkandgesture = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkandgesture = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ip_1.collectionmode = inkonly!
			if ip_1.collectionmode = inkonly!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkonly = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkonly = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("Dragauto")		
			if ip_1.dragauto = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
	
			ip_1.dragauto = true 
			if ip_1.dragauto = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.dragauto = false 
			if ip_1.dragauto = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("DragIcon")
			ls_temp = string(ip_1.dragicon )
			if isnull(ls_temp) or ls_temp = "" then
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get inkonly = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get inkonly = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.dragicon = "Question!"
			if ip_1.dragicon = "Question!"  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set Question! = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set Question! = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ip_1.dragicon = "error!"
			if ip_1.dragicon = "error!"  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set error! = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set error! = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ip_1.dragicon = ".\pbex.ico"
			if ip_1.dragicon = ".\pbex.ico"  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set .\pbex.ico! = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set .\pbex.ico! = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("DynamicRendering")
			if ip_1.dynamicrendering = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
	
			ip_1.dynamicrendering = false 
			if ip_1.dynamicrendering = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.dynamicrendering = true 
			if ip_1.dynamicrendering = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("EditMode")			
			//	default
			if ip_1.EditMode = inkpicinkmode!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get inkpicinkmode = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get inkpicinkmode = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.EditMode = inkpicdeletemode!
			if ip_1.EditMode = inkpicdeletemode!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpicdeletemode = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpicdeletemode = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ip_1.EditMode = inkpicselectmode!
			if ip_1.EditMode = inkpicselectmode!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpicselectmode = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpicselectmode = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ip_1.EditMode = inkpicinkmode!
			if ip_1.EditMode = inkpicinkmode!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpicinkmode = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpicinkmode = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("Enabled")	
			if ip_1.Enabled = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
	
			ip_1.Enabled = false 
			if ip_1.Enabled = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.Enabled = true 
			if ip_1.Enabled = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Erasermode")	
			ls_temp = string(ip_1.erasermode)
			if not isnull(ls_temp ) and ls_temp  = '0' then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.erasermode = 1
			ls_temp = string(ip_1.erasermode)			
			if not isnull(ls_temp ) and ls_temp  = '1' then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 1 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 1 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.erasermode = 0
			ls_temp = string(ip_1.erasermode)			
			if not isnull(ls_temp ) and ls_temp  = '0' then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 0 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 0 = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Eraserwidth")		
			ip_1.EditMode = inkpicdeletemode!
			ip_1.erasermode = 1
			
			ll_tmp = ip_1.eraserwidth 
			if not isnull(ll_tmp ) and ll_tmp  = 212 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.eraserwidth = 96
			ll_tmp = ip_1.eraserwidth 
			if not isnull(ll_tmp ) and ll_tmp  = 96 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 96 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 96 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.eraserwidth = 160
			ll_tmp = ip_1.eraserwidth 
			if not isnull(ll_tmp ) and ll_tmp  = 160 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 160 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 160 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.eraserwidth = 212
			ll_tmp = ip_1.eraserwidth 
			if not isnull(ll_tmp ) and ll_tmp  = 212 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 212 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 212 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			//default 
			ip_1.EditMode =inkpicinkmode!
			ip_1.EraserMode = 0			
		case lower("Height")
			ll_tmp = ip_1.Height 
			if not isnull(ll_tmp ) and ll_tmp  = 1252 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.Height = 176
			ll_tmp = ip_1.Height 
			if not isnull(ll_tmp ) and ll_tmp  = 176 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 176 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 176 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.Height = 240
			ll_tmp = ip_1.Height 
			if not isnull(ll_tmp ) and ll_tmp  = 240 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 240 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 240 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.Height = 1252
			ll_tmp = ip_1.Height 
			if not isnull(ll_tmp ) and ll_tmp  = 1252 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 1252 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 1252 = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("HighContrastInk")
			if ip_1.HighContrastInk = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
	
			ip_1.HighContrastInk = false 
			if ip_1.HighContrastInk = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.HighContrastInk = true 
			if ip_1.HighContrastInk = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("IgnorePressure")
			if ip_1.IgnorePressure = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.IgnorePressure = true 
			if ip_1.IgnorePressure = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.IgnorePressure = false 
			if ip_1.IgnorePressure = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("InkAntiAliased")	
			if ip_1.InkAntiAliased = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
	
			ip_1.InkAntiAliased = false 
			if ip_1.InkAntiAliased = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.InkAntiAliased = true 
			if ip_1.InkAntiAliased = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("InkColor")	
			ls_temp = string(ip_1.InkColor)
			if not isnull(ls_temp) and ls_temp = '0'	then			 
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=  " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//动态设置BackColor为-3
			ip_1.InkColor = - 3 
			ls_temp = string(ip_1.InkColor)
			if not isnull(ls_temp) and ls_temp = '-3'	then
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//非正常值，正数
			ip_1.InkColor = 10000 
			ls_temp = string(ip_1.InkColor)
			if not isnull(ls_temp) and ls_temp = '10000'	then
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//正常值
			ip_1.InkColor = 16777215 
			ls_temp = string(ip_1.InkColor)
			if not isnull(ls_temp) and ls_temp = '16777215'	then
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get normal = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get normal = "+ String ( "Fail!" ) +"~r~n"
			end if 
			
			//超出范围
			ip_1.InkColor = 16777216 
			ls_temp = string(ip_1.InkColor)
			if not isnull(ls_temp) and (ls_temp = '16777216' or ls_temp = '0')	then
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=   " "+is_testcasename+" "+ls_item +" property "+" is "+ls_temp+". Get = "+ String ( "Fail!" ) +"~r~n"
			end if 
		case lower("InkEnabled")		
			if ip_1.InkEnabled = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
	
			ip_1.InkEnabled = false 
			if ip_1.InkEnabled = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.InkEnabled = true 
			if ip_1.InkEnabled = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("InkFileName")			//This propery of inkpicture is readonly
			ls_temp = ip_1.inkfilename 
		//	ip_1.inkfilename  = 	ls_temp				// error , unspport.
			if not isnull(ls_temp) and ls_temp = ''  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("InkHeight")
			ll_tmp = ip_1.InkHeight 
			if not isnull(ll_tmp ) and ll_tmp  = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.InkHeight = 118
			ll_tmp = ip_1.InkHeight 
			if not isnull(ll_tmp ) and ll_tmp  = 118 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 118 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 118 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.InkHeight = 1
			ll_tmp = ip_1.InkHeight 
			if not isnull(ll_tmp ) and ll_tmp  = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 1 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 1 = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("InkWidth")
			ll_tmp = ip_1.InkWidth 
			if not isnull(ll_tmp ) and ll_tmp  = 53 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.InkWidth = 105
			ll_tmp = ip_1.InkWidth 
			if not isnull(ll_tmp ) and ll_tmp  = 105 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 105 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 105 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.InkWidth = 53
			ll_tmp = ip_1.InkWidth 
			if not isnull(ll_tmp ) and ll_tmp  = 53 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 53 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 53 = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("MarginX")	
			ll_tmp = ip_1.MarginX 
			if not isnull(ll_tmp ) and ll_tmp  = 0 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.MarginX = 560
			ll_tmp = ip_1.MarginX 
			if not isnull(ll_tmp ) and ll_tmp  = 560 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 560 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 560 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.MarginX = 0
			ll_tmp = ip_1.MarginX 
			if not isnull(ll_tmp ) and ll_tmp  = 0 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 0 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 0 = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("MarginY")	
			ll_tmp = ip_1.MarginY 
			if not isnull(ll_tmp ) and ll_tmp  = 0 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.MarginY = 640
			ll_tmp = ip_1.MarginY 
			if not isnull(ll_tmp ) and ll_tmp  = 640 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 640 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 640 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.MarginY = 0
			ll_tmp = ip_1.MarginY 
			if not isnull(ll_tmp ) and ll_tmp  = 0 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 0 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 0 = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("PenTip")		
			//	default
			if ip_1.PenTip = pentipball!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get  = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.PenTip = pentiprectangle!
			if ip_1.PenTip = pentiprectangle!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set pentiprectangle = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set pentiprectangle = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ip_1.PenTip = pentipball!
			if ip_1.PenTip = pentipball!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set pentipball = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set pentipball = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("PictureFileName")
			ls_temp = ip_1.picturefilename 
			if not isnull(ls_temp) and ls_temp = ""  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 

			ip_1.picturefilename = "spicon1.png"
			ls_temp = ip_1.picturefilename 
			if not isnull(ls_temp) and ls_temp = "spicon1.png"  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set spicon1.png = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set spicon1.png = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.picturefilename = "test.bmp"
			ls_temp = ip_1.picturefilename 
			if not isnull(ls_temp) and ls_temp = "test.bmp"  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set test.bmp = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set test.bmp = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.picturefilename = "systemcolor.jpg"
			ls_temp = ip_1.picturefilename 
			if not isnull(ls_temp) and ls_temp = "systemcolor.jpg"  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set systemcolor.jpg = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set systemcolor.jpg = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.picturefilename = ""
			ls_temp = ip_1.picturefilename 
			if not isnull(ls_temp) and ls_temp = ""  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set  = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("PictureSizeMode")
			//	default
			if ip_1.PictureSizeMode = inkpicnormal!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get  = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.PictureSizeMode = inkpicautosize!
			if ip_1.PictureSizeMode = inkpicautosize!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpicautosize = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpicautosize = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ip_1.PictureSizeMode = inkpiccentered!
			if ip_1.PictureSizeMode = inkpiccentered!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpiccentered = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpiccentered = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			ip_1.PictureSizeMode = inkpicstretched!
			if ip_1.PictureSizeMode = inkpicstretched!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpicstretched = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpicstretched = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ip_1.PictureSizeMode = inkpicnormal!
			if ip_1.PictureSizeMode = inkpicnormal!  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpicnormal = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set inkpicnormal = "+String ( "Fail!" ) +"~r~n"
			end if				
		case lower("PowerTipText")
			ls_temp = string(ip_1.PowerTipText)
			if not isnull(ls_temp ) and ls_temp  = '' then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.PowerTipText = "bcdef"
			ls_temp = string(ip_1.PowerTipText)			
			if not isnull(ls_temp ) and ls_temp  = 'bcdef' then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set bcdef = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set bcdef = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.PowerTipText = ""
			ls_temp = string(ip_1.PowerTipText)			
			if not isnull(ls_temp ) and ls_temp  = '' then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set   = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set   = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Status")			 						// unsupport //		status is a readonly property
			if ip_1.status = inkpicidle! then 					//inkpicCollectingInk!	
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("TabOrder")	
			ll_tmp = ip_1.TabOrder 
			if not isnull(ll_tmp ) and ll_tmp  = 0 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.TabOrder = 784
			ll_tmp = ip_1.TabOrder 
			if not isnull(ll_tmp ) and ll_tmp  = 784 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 784 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 784 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.TabOrder = 800
			ll_tmp = ip_1.TabOrder 
			if not isnull(ll_tmp ) and ll_tmp  = 800 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 800 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 800 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.TabOrder = -5
			ll_tmp = ip_1.TabOrder 
			if not isnull(ll_tmp ) and ll_tmp  = -5 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set -5 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set -5 = "+String ( "Fail!" ) +"~r~n"
			end if 		
			
			ip_1.TabOrder = 10000
			ll_tmp = ip_1.TabOrder 
			if not isnull(ll_tmp ) and ll_tmp  = 10000 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 10000 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 10000 = "+String ( "Fail!" ) +"~r~n"
			end if 	
			//original 
			ip_1.TabOrder = 0
			ll_tmp = ip_1.TabOrder 
			if not isnull(ll_tmp ) and ll_tmp  = 0 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 0 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 0 = "+String ( "Fail!" ) +"~r~n"
			end if 				
		case lower("Tag")
			ls_temp = ip_1.Tag	//bug
			if left(ls_temp,1)  = '1' then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.Tag = "bcdef"
			ls_temp = string(ip_1.Tag)			
			if not isnull(ls_temp ) and ls_temp  = 'bcdef' then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set bcdef = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set bcdef = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.Tag = ""
			ls_temp = string(ip_1.Tag)			
			if not isnull(ls_temp ) and ls_temp  = '' then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set   = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set   = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Visible")
			if ip_1.Visible = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.Visible = false 
			if ip_1.Visible = false  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set false = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			ip_1.Visible = true 
			if ip_1.Visible = true  then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set true = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("Width")
			ll_tmp = ip_1.Width 
			if not isnull(ll_tmp ) and ll_tmp  = 1966 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.Width = 960
			ll_tmp = ip_1.Width 
			if not isnull(ll_tmp ) and ll_tmp  = 960 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 960 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 960 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.Width = 1966
			ll_tmp = ip_1.Width 
			if not isnull(ll_tmp ) and ll_tmp  = 1966 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 1966 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 1966 = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("X")
			ll_tmp = ip_1.X 
			if not isnull(ll_tmp ) and ll_tmp  = 681 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.X = 1024
			ll_tmp = ip_1.X 
			if not isnull(ll_tmp ) and ll_tmp  = 1024 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 1024 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 1024 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.X = 681
			ll_tmp = ip_1.X 
			if not isnull(ll_tmp ) and ll_tmp  = 681 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 681 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 681 = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("Y")	
			ll_tmp = ip_1.Y 
			if not isnull(ll_tmp ) and ll_tmp  = 12 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.Y = 1120
			ll_tmp = ip_1.Y 
			if not isnull(ll_tmp ) and ll_tmp  = 1120 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 1120 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 1120 = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ip_1.Y = 12
			ll_tmp = ip_1.Y 
			if not isnull(ll_tmp ) and ll_tmp  = 12 then 
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 12 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" property "+ " set 12 = "+String ( "Fail!" ) +"~r~n"
			end if 			
		case lower("")	
			//Maximum script size exceeded. 		//2100
	end choose 
next 

//gf_returnresult(ls_result)
is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module1 ();string ls_array[], ls_item, ls_result, ls_temp, ls_default_dataobject
long	ll_bound, i , ll_tmp, j , k 
string ls_temp2	, ls_path, ls_file, ls_fullname
integer 	li_rtn
blob		lb_data
boolean		lbn_return

InkPersistenceFormat   		ipf_1
InkCompressionMode  		icm_1
ContextKeyword 				lcx_key

ls_result = ''
ll_bound =0 

ls_array[Upperbound(ls_array) + 1 ] = "ClassName"
ls_array[Upperbound(ls_array) + 1 ] = "drag"
ls_array[Upperbound(ls_array) + 1 ] = "GetContextService"
ls_array[Upperbound(ls_array) + 1 ] = "Getparent"
ls_array[Upperbound(ls_array) + 1 ] = "hide"
ls_array[Upperbound(ls_array) + 1 ] = "loadink"
ls_array[Upperbound(ls_array) + 1 ] = "loadpicture"
ls_array[Upperbound(ls_array) + 1 ] = "move"
ls_array[Upperbound(ls_array) + 1 ] = "pointerx"
ls_array[Upperbound(ls_array) + 1 ] = "pointery"
ls_array[Upperbound(ls_array) + 1 ] = "postevent"
ls_array[Upperbound(ls_array) + 1 ] = "Print"
ls_array[Upperbound(ls_array) + 1 ] = "resetink"
ls_array[Upperbound(ls_array) + 1 ] = "resetpicture"
ls_array[Upperbound(ls_array) + 1 ] = "resize"
ls_array[Upperbound(ls_array) + 1 ] = "save"			//save1	//save2		 
ls_array[Upperbound(ls_array) + 1 ] = "saveink"	
ls_array[Upperbound(ls_array) + 1 ] = "setfocus"
ls_array[Upperbound(ls_array) + 1 ] = "setposition"
ls_array[Upperbound(ls_array) + 1 ] = "setredraw"
ls_array[Upperbound(ls_array) + 1 ] = "show"
ls_array[Upperbound(ls_array) + 1 ] = "triggerevent"
ls_array[Upperbound(ls_array) + 1 ] = "typeof"
ls_array[Upperbound(ls_array) + 1 ] = ""

ls_path = gs_cachedir			
ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")
	is_log = ''
	ls_temp = ''
	li_rtn = 0 
	ls_temp2 = ''
	ll_tmp = 0
	lbn_return = false 
	choose case lower(ls_item)
		case lower("ClassName")			
			ls_temp = ip_1.classname( )
			if not isnull(ls_temp) and ls_temp = "ip_1" then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 					
		case lower("drag")					
			try 
				li_rtn = ip_1.drag( begin!)
				if not isnull(li_rtn) and li_rtn = 1 then 
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " begin = "+String ( "Success!" ) +"~r~n"
				else
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " begin = "+String ( "Fail!" ) +"~r~n"
				end if 
				
				sleep(3)
				li_rtn = 0 
				li_rtn = ip_1.drag( end!)
				if not isnull(li_rtn)  then 	//and li_rtn = 1
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " end = "+String ( "Success!" ) +"~r~n"
				else
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " end = "+String ( "Fail!" ) +"~r~n"
				end if 
				
				li_rtn = ip_1.drag( begin!)			
				sleep(3)
				li_rtn = 0 
				li_rtn = ip_1.drag( cancel!)
				if not isnull(li_rtn) then 	// and li_rtn = 1 
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " cancel = "+String ( "Success!" ) +"~r~n"
				else
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " cancel = "+String ( "Fail!" ) +"~r~n"
				end if 
			catch (exception e)
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " exception e.err"+e.getMessage() +" = "+String ( "Fail!" ) +"~r~n"
			end try
		case lower("GetContextService")				
			li_rtn = ip_1.GetContextService("Keyword", lcx_key)
			ls_temp =lcx_key.classname( )
			ls_result += wf_result_add(ls_item, "1. Keyword ", not isnull(li_rtn) and li_rtn =1 and not isnull(ls_temp) and ls_temp = "contextkeyword" )			
			
			li_rtn = 0 
			ls_temp = ""
			li_rtn = ip_1.GetContextService("ContextKeyword", lcx_key)
			ls_temp =lcx_key.classname( )
			ls_result += wf_result_add(ls_item, "2. ContextKeyword ", not isnull(li_rtn) and li_rtn =1 and not isnull(ls_temp) and ls_temp = "contextkeyword" )						
		case lower("Getparent")			
			ls_temp = ip_1.getparent( ).classname( )
			if not isnull(ls_temp) and ls_temp = "w_inkpicture" then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " default get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " default get = "+String ( "Fail!" ) +"~r~n"
			end if 	
		case lower("hide")			
			li_rtn = ip_1.hide()
			sleep(3)
			ip_1.show( )
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("loadink")		//fail, unknown reason
			ls_file = "contractlogix_detail.gif"
			ls_path = gs_cachedir				
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " contractlogix_detail.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " contractlogix_detail.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			lb_data = blob("")
			ll_tmp = fileopen(ls_fullname,StreamMode!,read!,shared!)	//ll_tmp = -100
			filereadex(ll_tmp,lb_data)
			fileclose(ll_tmp)
			li_rtn = ip_1.loadink( lb_data)	//li_rtn = -1
			
 			if not isnull(li_rtn) and li_rtn = 1 and len(lb_data) > 0 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get gif = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get gif = "+String ( "Fail!" ) +"~r~n"
			end if 		
		case lower("loadpicture")
			ls_file = "start.png"
			ls_path = gs_cachedir					
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " start.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " start.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
//			setnull(lb_data)
			lb_data = blob("")
			ll_tmp = fileopen(ls_file,StreamMode!,read!,shared!)
			filereadex(ll_tmp,lb_data)
			fileclose(ll_tmp)
			li_rtn = ip_1.loadpicture( lb_data)		//li_rtn = -1
			if not isnull(li_rtn) and li_rtn = 1 and len(lb_data) > 0 then 			//fail, unknown reason
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get png = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get png = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			ls_file = "bike.bmp"		
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " bike.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " bike.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
//			setnull(lb_data)
			lb_data = blob("")
			ll_tmp = fileopen(ls_file,StreamMode!,read!,shared!)
			filereadex(ll_tmp,lb_data)
			fileclose(ll_tmp)
			li_rtn = ip_1.loadpicture( lb_data)
			if not isnull(li_rtn) and li_rtn = 1 and len(lb_data) > 0 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get bmp = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get bmp = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_file = "Bridge.jpg"			
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " Bridge.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " Bridge.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
//			setnull(lb_data)
			lb_data = blob("")
			ll_tmp = fileopen(ls_file,StreamMode!,read!,shared!)
			filereadex(ll_tmp,lb_data)
			fileclose(ll_tmp)
			li_rtn = ip_1.loadpicture( lb_data)
			if not isnull(li_rtn) and li_rtn = 1 and len(lb_data) > 0 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get jpg = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get jpg = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("move")
			//default x=681, y =12 
			li_rtn = ip_1.move(300, 5)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set small = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set small = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			li_rtn = 0
			li_rtn = ip_1.move(800, 120)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set big = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set big = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			li_rtn = 0
			li_rtn = ip_1.move(681, 12)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set normal = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set normal = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("pointerx")			
			li_rtn = ip_1.pointerx( )
			if not isnull(li_rtn) and li_rtn > 0  then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get default = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("pointery")
			li_rtn = ip_1.pointery( )
			if not isnull(li_rtn) and li_rtn > 0  then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get default = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower("postevent")		
			lbn_return = ip_1.postevent( constructor!)
			Yield ( )
			if lbn_return = true and pos(lower(is_log), "constructor()") > 0  then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " constructor = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " constructor = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""
			lbn_return = false
			lbn_return = ip_1.postevent( 'stroke')
			Yield ( )
			if lbn_return = true and pos(lower(is_log), "stroke()") > 0  then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " stroke = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " stroke = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""
			lbn_return = false
			lbn_return = ip_1.postevent( 'getfocus')
			Yield ( )
			if lbn_return = true and pos(lower(is_log), "getfocus()") > 0  then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " getfocus = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " getfocus = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""
			lbn_return = false
			lbn_return = ip_1.postevent( losefocus!)
			Yield ( )
			if lbn_return = true and pos(lower(is_log), "losefocus()") > 0  then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " losefocus = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " losefocus = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""
			lbn_return = false	
			lbn_return = ip_1.postevent( modified!)			//no modifyied event.
			Yield ( )
			if lbn_return = false then 			
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " no modified event = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " no modified event = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""
			lbn_return = false
			lbn_return = ip_1.postevent( rbuttondown!)
			Yield ( )
			if lbn_return = true and pos(lower(is_log), "rbuttondown()") > 0  then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " rbuttondown = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " rbuttondown = "+String ( "Fail!" ) +"~r~n"
			end if 						
		case lower("Print")	
			if FileExists(gs_cachedir+gs_dirseparator+"PrintCancelTest1.xps") then FileDelete(gs_cachedir+gs_dirseparator+"PrintCancelTest1.xps")					//add 
			if FileExists(gs_cachedir+gs_dirseparator+"PrintCancelTest1.oxps") then FileDelete(gs_cachedir+gs_dirseparator+"PrintCancelTest1.oxps")					//add 
			is_type = "PrintCancel"
			yield()
			timer(1)

			ll_tmp = PrintOpen("Test inkpicture Print",false)
			li_rtn = ip_1.print( ll_tmp,500, 1000)	

			if not isnull(ll_tmp) and ll_tmp > 0 then PrintClose(ll_tmp)
//			if not isnull(is_log) and pos(lower(is_log), lower('printstart:')) > 0 and not isnull(li_rtn) and li_rtn = 1 and &
//				not FileExists("PrintCancelTest1.xps") then
//				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " job = "+String ( "Success!" ) +"~r~n"
//			else
//				ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " job = "+String ( "Fail!" ) +"~r~n"
//			end if	
			ls_result += wf_result_add(ls_item, "1. job ", not isnull(li_rtn) and li_rtn =1 and (FileExists(gs_cachedir+gs_dirseparator+"PrintCancelTest1.xps") or FileExists(gs_cachedir+gs_dirseparator+"PrintCancelTest1.oxps") ))		

			//			is_type = ""			
			if FileExists(gs_cachedir+gs_dirseparator+"PrintCancelTest1.xps") then FileDelete(gs_cachedir+gs_dirseparator+"PrintCancelTest1.xps")					//add 
			if FileExists(gs_cachedir+gs_dirseparator+"PrintCancelTest1.oxps") then FileDelete(gs_cachedir+gs_dirseparator+"PrintCancelTest1.oxps")					//add 
			
			yield()
			setnull(ll_tmp)
			ll_tmp = PrintOpen("Test inkpicture Print",false)
			li_rtn = ip_1.print( ll_tmp, 120, 150, this.width / 2  ,   this.height / 2 )
			if not isnull(ll_tmp) and ll_tmp > 0 then PrintClose(ll_tmp)
			ls_result += wf_result_add(ls_item, "2. job four ", not isnull(li_rtn) and li_rtn =1 and (FileExists(gs_cachedir+gs_dirseparator+"PrintCancelTest1.xps") or FileExists(gs_cachedir+gs_dirseparator+"PrintCancelTest1.oxps") ))		
			
			is_type = ""
		case lower("resetink")
			li_rtn = ip_1.resetink( )
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("resetpicture")			
			li_rtn = ip_1.resetpicture( )
			if not isnull(li_rtn) and li_rtn = 1 then  
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("resize")
			//default 		1966		1252
			li_rtn = ip_1.resize(48,20)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set small = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set small  = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
			li_rtn = ip_1.resize(2200,1600)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set big = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set big  = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
			li_rtn = ip_1.resize(5,5)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set smaller = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set smaller  = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0
			li_rtn = ip_1.resize(1966,1252)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set default  = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("save")
			//	0 – BMP (bitmap)
			ls_file = "bike.bmp"			
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " bike.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " bike.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = ip_1.loadpicture( ls_fullname)
			li_rtn = 0 
			li_rtn = ip_1.save( ls_file, 0,true) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set bitmap 0 true  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set bitmap 0 true   = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
			li_rtn = ip_1.save( ls_file, 0,false) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set bitmap 0 false  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set bitmap 0 false   = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
			li_rtn = ip_1.save( "savepicbmp1.bmp", 0,true) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special bitmap 0 true  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special bitmap 0 true  = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0
//			setnull(lb_data)
			lb_data = blob("")								// bug for save blob type 	
			li_rtn = ip_1.save( lb_data, 0,true)
			if not isnull(li_rtn) and li_rtn = 1 and not isnull(lb_data) and len(lb_data) > 0  then 
				select count(1) into :ll_tmp from inkdata using sqlca;
				if ll_tmp < 1 then 
					ll_tmp = 1 
					insert into inkdata(id) values(:ll_tmp) using sqlca;
					if sqlca.sqlcode <> 0 then
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special bitmap 0 true"+" error: insert failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
						execute immediate 'rollback' using sqlca;
					else
						execute immediate 'commit' using sqlca;
					end if
				else
					ll_tmp = 1 
				end if 
				
				updateblob inkdata set data = :lb_data where id = :ll_tmp using sqlca;
				if sqlca.sqlcode <> 0 then
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special bitmap 0 true"+" error: update failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
					execute immediate 'rollback' using sqlca;
				else
					execute immediate 'commit' using sqlca;
				end if
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special bitmap 0 true lb_data = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special bitmap 0 true lb_data = "+String ( "Fail!" ) +"~r~n"
			end if
		
			li_rtn = 0 
			li_rtn = ip_1.save( "savepicbmp0.bmp", 0,false) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special bitmap 0 false  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special bitmap 0 false  = "+String ( "Fail!" ) +"~r~n"
			end if

			if not isnull(li_rtn) and li_rtn = 1 and not isnull(lb_data) and len(lb_data) > 0  then 
				select count(1) into :ll_tmp from inkdata;
				if ll_tmp < 2 then 
					ll_tmp = 2 
					insert into inkdata(id) values(:ll_tmp) using sqlca;
					if sqlca.sqlcode <> 0 then
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special bitmap 0 false"+" error: insert failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
						execute immediate 'rollback' using sqlca;
					else
						execute immediate 'commit' using sqlca;
					end if
				else
					ll_tmp = 2 
				end if 
				
				updateblob inkdata set data = :lb_data where id = :ll_tmp using sqlca;
				if sqlca.sqlcode <> 0 then
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special bitmap 0 false"+" error: update failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
					execute immediate 'rollback' using sqlca;
				else
					execute immediate 'commit' using sqlca;
				end if
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special bitmap 0 false lb_data = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special bitmap 0 false lb_data = "+String ( "Fail!" ) +"~r~n"
			end if				
			
			//1 – JPEG (Joint Photographic Experts Group)
			ls_file = "Bridge.jpg"	
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " Bridge.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " Bridge.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = ip_1.loadpicture( ls_fullname)
			li_rtn = 0 
			li_rtn = ip_1.save( ls_file, 1,true) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set JPEG 0 true  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set JPEG 0 true   = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
			li_rtn = ip_1.save( ls_file, 1,false) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set JPEG 0 false  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set JPEG 0 false   = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
			li_rtn = ip_1.save( "savepicjpg1.jpg", 1,true) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special JPEG 0 true  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special JPEG 0 true  = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
//			setnull(lb_data)
			lb_data = blob("")
			li_rtn = ip_1.save( lb_data, 1,true)
			if not isnull(li_rtn) and li_rtn = 1 and not isnull(lb_data) and len(lb_data) > 0  then 
				select count(1) into :ll_tmp from inkdata;
				if ll_tmp < 3 then 
					ll_tmp = 3 
					insert into inkdata(id) values(:ll_tmp) using sqlca;
					if sqlca.sqlcode <> 0 then
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special JPEG 0 true"+" error: insert failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
						execute immediate 'rollback' using sqlca;
					else
						execute immediate 'commit' using sqlca;
					end if
				else
					ll_tmp = 3 
				end if 
				
				updateblob inkdata set data = :lb_data where id = :ll_tmp using sqlca;
				if sqlca.sqlcode <> 0 then
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special JPEG 0 true"+" error: update failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
					execute immediate 'rollback' using sqlca;
				else
					execute immediate 'commit' using sqlca;
				end if
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special JPEG 0 true lb_data = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special JPEG 0 true lb_data = "+String ( "Fail!" ) +"~r~n"
			end if
		
			li_rtn = 0 
			li_rtn = ip_1.save( "savepicjpg0.jpg", 1,false) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special JPEG 0 false  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special JPEG 0 false  = "+String ( "Fail!" ) +"~r~n"
			end if

			if not isnull(li_rtn) and li_rtn = 1 and not isnull(lb_data) and len(lb_data) > 0  then 
				select count(1) into :ll_tmp from inkdata;
				if ll_tmp < 4 then 
					ll_tmp = 4 
					insert into inkdata(id) values(:ll_tmp) using sqlca;
					if sqlca.sqlcode <> 0 then
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special JPEG 0 false"+" error: insert failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
						execute immediate 'rollback' using sqlca;
					else
						execute immediate 'commit' using sqlca;
					end if
				else
					ll_tmp = 4 
				end if 
				
				updateblob inkdata set data = :lb_data where id = :ll_tmp using sqlca;
				if sqlca.sqlcode <> 0 then
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special JPEG 0 false"+" error: update failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
					execute immediate 'rollback' using sqlca;
				else
					execute immediate 'commit' using sqlca;
				end if
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special JPEG 0 false lb_data = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special JPEG 0 false lb_data = "+String ( "Fail!" ) +"~r~n"
			end if				
			
			//2 – GIF (Graphics Interchange Format)
			ls_file = "contractlogix_detail.gif"
			ls_path = gs_cachedir					
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " contractlogix_detail.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " contractlogix_detail.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = ip_1.loadpicture( ls_fullname)
			li_rtn = 0 
			li_rtn = ip_1.save( ls_file, 2,true) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set GIF 0 true  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set GIF 0 true   = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
			li_rtn = ip_1.save( ls_file, 2,false) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set GIF 0 false  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set GIF 0 false   = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
			li_rtn = ip_1.save( "savepicgif1.gif", 2,true) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special GIF 0 true  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special GIF 0 true  = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
//			setnull(lb_data)
			lb_data = blob("")
			li_rtn = ip_1.save( lb_data, 2,true)
			if not isnull(li_rtn) and li_rtn = 1 and not isnull(lb_data) and len(lb_data) > 0  then 
				select count(1) into :ll_tmp from inkdata;
				if ll_tmp < 5 then 
					ll_tmp = 5 
					insert into inkdata(id) values(:ll_tmp) using sqlca;
					if sqlca.sqlcode <> 0 then
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special GIF 0 true"+" error: insert failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
						execute immediate 'rollback' using sqlca;
					else
						execute immediate 'commit' using sqlca;
					end if
				else
					ll_tmp = 5 
				end if 
				
				updateblob inkdata set data = :lb_data where id = :ll_tmp using sqlca;
				if sqlca.sqlcode <> 0 then
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special GIF 0 true"+" error: update failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
					execute immediate 'rollback' using sqlca;
				else
					execute immediate 'commit' using sqlca;
				end if
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special GIF 0 true lb_data = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special GIF 0 true lb_data = "+String ( "Fail!" ) +"~r~n"
			end if
		
			li_rtn = 0 
			li_rtn = ip_1.save( "savepicgif0.gif", 2,false) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special GIF 0 false  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special GIF 0 false  = "+String ( "Fail!" ) +"~r~n"
			end if

			if not isnull(li_rtn) and li_rtn = 1 and not isnull(lb_data) and len(lb_data) > 0  then 
				select count(1) into :ll_tmp from inkdata;
				if ll_tmp < 6 then 
					ll_tmp = 6 
					insert into inkdata(id) values(:ll_tmp) using sqlca;
					if sqlca.sqlcode <> 0 then
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special GIF 0 false"+" error: insert failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
						execute immediate 'rollback' using sqlca;
					else
						execute immediate 'commit' using sqlca;
					end if
				else
					ll_tmp = 6 
				end if 
				
				updateblob inkdata set data = :lb_data where id = :ll_tmp using sqlca;
				if sqlca.sqlcode <> 0 then
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special GIF 0 false"+" error: update failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
					execute immediate 'rollback' using sqlca;
				else
					execute immediate 'commit' using sqlca;
				end if
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special GIF 0 false lb_data = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special GIF 0 false lb_data = "+String ( "Fail!" ) +"~r~n"
			end if
			
			//3 – TIFF (Tagged Image File Format)
			ls_file = "inkpicture.tiff"
			ls_path = gs_cachedir					
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " inkpicture.tiff.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " inkpicture.tiff.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = ip_1.loadpicture( ls_fullname)
			li_rtn = 0 
			li_rtn = ip_1.save( ls_file, 3,true) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set TIFF 0 true  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set TIFF 0 true   = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
			li_rtn = ip_1.save( ls_file, 3,false) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set TIFF 0 false  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set TIFF 0 false   = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
			li_rtn = ip_1.save( "savepictiff1.tiff", 3,true) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special TIFF 0 true  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special TIFF 0 true  = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
//			setnull(lb_data)
			lb_data = blob("")
			li_rtn = ip_1.save( lb_data, 3,true)
			if not isnull(li_rtn) and li_rtn = 1 and not isnull(lb_data) and len(lb_data) > 0  then 
				select count(1) into :ll_tmp from inkdata;
				if ll_tmp < 7 then 
					ll_tmp = 7
					insert into inkdata(id) values(:ll_tmp) using sqlca;
					if sqlca.sqlcode <> 0 then
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special TIFF 0 true"+" error: insert failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
						execute immediate 'rollback' using sqlca;
					else
						execute immediate 'commit' using sqlca;
					end if
				else
					ll_tmp = 7
				end if 
				
				updateblob inkdata set data = :lb_data where id = :ll_tmp using sqlca;
				if sqlca.sqlcode <> 0 then
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special TIFF 0 true"+" error: update failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
					execute immediate 'rollback' using sqlca;
				else
					execute immediate 'commit' using sqlca; 
				end if
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special TIFF 0 true lb_data = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special TIFF 0 true lb_data = "+String ( "Fail!" ) +"~r~n"
			end if
		
			li_rtn = 0 
			li_rtn = ip_1.save( "savepictiff0.tiff", 3,false) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special TIFF 0 false  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special TIFF 0 false  = "+String ( "Fail!" ) +"~r~n"
			end if

			if not isnull(li_rtn) and li_rtn = 1 and not isnull(lb_data) and len(lb_data) > 0  then 
				select count(1) into :ll_tmp from inkdata;
				if ll_tmp < 8 then 
					ll_tmp = 8
					insert into inkdata(id) values(:ll_tmp) using sqlca;
					if sqlca.sqlcode <> 0 then
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special TIFF 0 false"+" error: insert failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
						execute immediate 'rollback' using sqlca;
					else
						execute immediate 'commit' using sqlca;
					end if
				else
					ll_tmp = 8 
				end if 
				
				updateblob inkdata set data = :lb_data where id = :ll_tmp using sqlca;
				if sqlca.sqlcode <> 0 then
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special TIFF 0 false"+" error: update failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
					execute immediate 'rollback' using sqlca;
				else
					execute immediate 'commit' using sqlca;
				end if
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special TIFF 0 false lb_data = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special TIFF 0 false lb_data = "+String ( "Fail!" ) +"~r~n"
			end if
			
			//4 – PNG (Portable Network Graphics)
			ls_file = "start.png"
			ls_path = gs_cachedir					
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " start.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " start.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if 
			
			li_rtn = ip_1.loadpicture( ls_fullname)
			li_rtn = 0 
			li_rtn = ip_1.save( ls_file, 4,true) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set PNG 0 true  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set PNG 0 true   = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
			li_rtn = ip_1.save( ls_file, 4,false) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set PNG 0 false  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set PNG 0 false   = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
			li_rtn = ip_1.save( "savepicpng1.png", 4,true) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special PNG 0 true  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special PNG 0 true  = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0 
//			setnull(lb_data)
			lb_data = blob("")
			li_rtn = ip_1.save( lb_data, 4,true)
			if not isnull(li_rtn) and li_rtn = 1 and not isnull(lb_data) and len(lb_data) > 0  then 
				select count(1) into :ll_tmp from inkdata;
				if ll_tmp < 9 then 
					ll_tmp = 9
					insert into inkdata(id) values(:ll_tmp) using sqlca;
					if sqlca.sqlcode <> 0 then
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special PNG 0 true"+" error: insert failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
						execute immediate 'rollback' using sqlca;
					else
						execute immediate 'commit' using sqlca;
					end if
				else
					ll_tmp = 9
				end if 
				
				updateblob inkdata set data = :lb_data where id = :ll_tmp using sqlca;
				if sqlca.sqlcode <> 0 then
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special PNG 0 true"+" error: update failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
					execute immediate 'rollback' using sqlca;
				else
					execute immediate 'commit' using sqlca;
				end if
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special PNG 0 true lb_data = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special PNG 0 true lb_data = "+String ( "Fail!" ) +"~r~n"
			end if
		
			li_rtn = 0 
			li_rtn = ip_1.save( "savepicpng0.png", 4,false) 
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special PNG 0 false  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special PNG 0 false  = "+String ( "Fail!" ) +"~r~n"
			end if

			if not isnull(li_rtn) and li_rtn = 1 and not isnull(lb_data) and len(lb_data) > 0  then 
				select count(1) into :ll_tmp from inkdata;
				if ll_tmp < 10 then 
					ll_tmp = 10
					insert into inkdata(id) values(:ll_tmp) using sqlca;
					if sqlca.sqlcode <> 0 then
						ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special PNG 0 false"+" error: insert failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
						execute immediate 'rollback' using sqlca;
					else
						execute immediate 'commit' using sqlca;
					end if
				else
					ll_tmp = 10 
				end if 
				
				updateblob inkdata set data = :lb_data where id = :ll_tmp using sqlca;
				if sqlca.sqlcode <> 0 then
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special PNG 0 false"+" error: update failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
					execute immediate 'rollback' using sqlca;
				else
					execute immediate 'commit' using sqlca;
				end if
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special PNG 0 false lb_data = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set special PNG 0 false lb_data = "+String ( "Fail!" ) +"~r~n"
			end if
			
		case lower("saveink")		
			select count(1) into :ll_tmp from inkdata;
			if ll_tmp < 11 then 
				ll_tmp = 11
				insert into inkdata(id) values(:ll_tmp) using sqlca;
				if sqlca.sqlcode <> 0 then
					ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set inkdata11 "+ " error: insert failed : "+sqlca.sqlerrtext+"  = "+String ( "Fail!" ) +"~r~n"
					execute immediate 'rollback' using sqlca;
				else
					execute immediate 'commit' using sqlca;
				end if
			else
				ll_tmp = 11 
			end if 
				
			for j = 1 to 4 
				if j = 1 then 
					ipf_1 = base64gifformat!
				elseif j =2 then 
					ipf_1 = Base64InkSerializedFormat!
				elseif j =3 then 
					ipf_1 = GIFFormat!
				elseif j =4 then 			
					ipf_1 = InkSerializedFormat!
				end if 
				
				for k =1 to 3
					if k =1 then 
						icm_1 = DefaultCompression!
					elseif k =2 then
						icm_1 = MaximumCompression!
					elseif k = 3 then 
						icm_1 = NoCompression!
					end if 					
					
					li_rtn = 0 
					ls_file = "saveink"+string(j)+string(k)+".gif"					
					li_rtn = ip_1.saveink( ls_file,ipf_1,icm_1)
					if not isnull(li_rtn) and li_rtn = 1 then 
						ls_result += " "+is_testcasename+" "+ls_item +" function "+" InkPersistenceFormat:"+string(j)+" InkCompressionMode:"+string(k) + " = "+String ( "Success!" ) +"~r~n"
					else
						ls_result += " "+is_testcasename+" "+ls_item +" function "+" InkPersistenceFormat:"+string(j)+" InkCompressionMode:"+string(k) + " = "+String ( "Fail!" ) +"~r~n"
					end if
					
					li_rtn = 0 
					lb_data = blob("")
					li_rtn = ip_1.saveink( lb_data,ipf_1,icm_1)
					if not isnull(li_rtn) and li_rtn = 1 and not isnull(lb_data) and len(lb_data) > 0  then 
						updateblob inkdata set data = :lb_data where id = :ll_tmp using sqlca;
						if sqlca.sqlcode<>0 then
							execute immediate 'rollback';
							ls_result += " "+is_testcasename+" "+ls_item +" function "+" loop "+string(j)+string(k)+ " update ink into database failed : "+sqlca.sqlerrtext +" "+String ( "Fail!" ) +"~r~n"
						else
							execute immediate 'commit';
							ls_result += " "+is_testcasename+" "+ls_item +" function "+" loop "+string(j)+string(k)+ " set special lb_data = "+String ( "Success!" ) +"~r~n"
						end if
					else
						ls_result += " "+is_testcasename+" "+ls_item +" function "+" loop "+string(j)+string(k)+ " set special lb_data = "+String ( "Fail!" ) +"~r~n"
					end if 		
				next
			next
		case lower("setfocus")		
			li_rtn = ip_1.setfocus( )
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set  = "+String ( "Fail!" ) +"~r~n"
			end if
		case lower("setposition")
			li_rtn = ip_1.SetPosition(Behind!,st_memo)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set Behind st_memo = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set Behind st_memo = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0
			li_rtn = ip_1.SetPosition(ToTop!)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set ToTop = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set ToTop  = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0
			li_rtn = ip_1.SetPosition(ToBottom!)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set ToBottom = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set ToBottom  = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0
			li_rtn = ip_1.SetPosition(Behind!)
			if li_rtn = -1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set Behind  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set Behind  = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0
			li_rtn = ip_1.SetPosition(ToTop!,st_memo)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set ToTop st_memo = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set ToTop st_memo  = "+String ( "Fail!" ) +"~r~n"
			end if
			
			li_rtn = 0
			li_rtn = ip_1.SetPosition(ToBottom!,st_memo)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set ToBottom st_memo = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set ToBottom st_memo = "+String ( "Fail!" ) +"~r~n"
			end if			
		case lower("setredraw")			
			li_rtn  = ip_1.setredraw(false)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set false = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set false = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			li_rtn = 0
			li_rtn  = ip_1.setredraw(true)
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " true = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " true = "+String ( "Fail!" ) +"~r~n"
			end if	
		case lower("show")			
			ip_1.hide( )
			sleep(2)
			li_rtn = ip_1.show( )
			if not isnull(li_rtn) and li_rtn = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " set = "+String ( "Fail!" ) +"~r~n"
			end if	
		case lower("triggerevent")
			li_rtn = ip_1.triggerevent( constructor!)
			Yield ( )
			if not isnull(li_rtn) and li_rtn = 1  and pos(lower(is_log), "constructor()") > 0  then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " constructor = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " constructor = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""
			li_rtn = 0 
			li_rtn = ip_1.triggerevent( 'stroke')
			Yield ( )
			if not isnull(li_rtn) and li_rtn = 1  and pos(lower(is_log), "stroke()") > 0  then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " stroke = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " stroke = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""
			li_rtn = 0 
			li_rtn = ip_1.triggerevent( 'getfocus')
			Yield ( )
			if not isnull(li_rtn) and li_rtn = 1  and pos(lower(is_log), "getfocus()") > 0  then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " getfocus = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " getfocus = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""
			li_rtn = 0 
			li_rtn = ip_1.triggerevent( losefocus!)
			Yield ( )
			if not isnull(li_rtn) and li_rtn = 1  and pos(lower(is_log), "losefocus()") > 0  then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " losefocus = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " losefocus = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""
			li_rtn = 0 
			li_rtn = ip_1.triggerevent( modified!)			//no modifyied event.
			Yield ( )
			if not isnull(li_rtn) and li_rtn = -1 then 		//no modifyied event.	
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " no modified event = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " no modified event = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			is_log = ""
			li_rtn = 0 
			li_rtn = ip_1.triggerevent( rbuttondown!)
			Yield ( )
			if not isnull(li_rtn) and li_rtn = 1  and pos(lower(is_log), "rbuttondown()") > 0  then 
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " rbuttondown = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " rbuttondown = "+String ( "Fail!" ) +"~r~n"
			end if 					
		case lower("typeof")
			if  ip_1.typeof( ) = inkpicture! then
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get default = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item +" function "+ " get default = "+String ( "Fail!" ) +"~r~n"
			end if 		
		case lower("")						
			//Maximum script size exceeded. 		//2100
	end choose 
next 

//gf_returnresult(ls_result)
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

ls_array[Upperbound(ls_array) + 1 ] = "Clicked"								//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "Constructor"
ls_array[Upperbound(ls_array) + 1 ] = "DoubleClicked"						//默认不存在事件
ls_array[Upperbound(ls_array) + 1 ] = "GetFocus"
ls_array[Upperbound(ls_array) + 1 ] = "SelectionChanged"
ls_array[Upperbound(ls_array) + 1 ] = "SizeChanged"
ls_array[Upperbound(ls_array) + 1 ] = "Stroke"
ls_array[Upperbound(ls_array) + 1 ] = "Destructor"							//end event.
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
		case lower("Clicked")				
			ip_1.event clicked( )
			ls_result += wf_result_add(ls_item, " ", not isnull(is_log)  and pos(lower(is_log), lower( " Clicked() Triggered ")) > 0)						
		case lower("Constructor")	
			ip_1.event constructor( )				
			ls_result += wf_result_add(ls_item, " ", not isnull(is_log)  and pos(lower(is_log), lower( " Constructor() Triggered ")) > 0)
			//		case lower("DoubleClicked")			//默认不存在事件
		case lower("GetFocus")	
			ip_1.event getfocus( )
			ls_result += wf_result_add(ls_item, " ", not isnull(is_log)  and pos(lower(is_log), lower( " Getfocus() Triggered ")) > 0)						
		case lower("SelectionChanged")			
			ip_1.event selectionchanged( )
			ls_result += wf_result_add(ls_item, " ", not isnull(is_log)  and pos(lower(is_log), lower( " Selectionchanged() Triggered ")) > 0)		
		case lower("SizeChanged")				
			ip_1.event sizechanged( 681, 12, 1966,1252)
			ls_result += wf_result_add(ls_item, " ", not isnull(is_log)  and pos(lower(is_log), lower( " Sizechanged() Triggered")) > 0)		
		case lower("Stroke")		
			ip_1.event stroke( )
			ls_result += wf_result_add(ls_item, " ", not isnull(is_log)  and pos(lower(is_log), lower( " Stroke() Triggered")) > 0)		
		case lower("Destructor")			
			ip_1.event destructor( )
			ls_result += wf_result_add(ls_item, " ", not isnull(is_log)  and pos(lower(is_log), lower( " Destructor() Triggered")) > 0)		
		case lower("")				
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_inkpicture.create
int iCurrent
call super::create
this.st_memo=create st_memo
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ip_1=create ip_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_memo
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.ip_1
this.Control[iCurrent+6]=this.gb_1
end on

on w_inkpicture.destroy
call super::destroy
destroy(this.st_memo)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ip_1)
destroy(this.gb_1)
end on

event ue_preopen;call super::ue_preopen;


ip_1.x = 681
ip_1.y = 12
ip_1.width = 1966
ip_1.height = 1252

end event

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"start.png") then
	FileDelete(ls_filepath+"start.png")
end if

if FileExists(ls_filepath+"contractlogix_detail.gif") then
	FileDelete(ls_filepath+"contractlogix_detail.gif")
end if

if FileExists(ls_filepath+"Bridge.jpg") then
	FileDelete(ls_filepath+"Bridge.jpg")
end if

if FileExists(ls_filepath+"bike.bmp") then
	FileDelete(ls_filepath+"bike.bmp")
end if

if FileExists(ls_filepath+"inkpicture.tiff") then
	FileDelete(ls_filepath+"inkpicture.tiff")
end if

if FileExists(ls_filepath+"savepicbmp1.bmp") then
	FileDelete(ls_filepath+"savepicbmp1.bmp")
end if

if FileExists(ls_filepath+"savepicbmp0.bmp") then
	FileDelete(ls_filepath+"savepicbmp0.bmp")
end if

if FileExists(ls_filepath+"savepicjpg0.jpg") then
	FileDelete(ls_filepath+"savepicjpg0.jpg")
end if

if FileExists(ls_filepath+"savepicjpg1.jpg") then
	FileDelete(ls_filepath+"savepicjpg1.jpg")
end if

if FileExists(ls_filepath+"savepicgif0.gif") then
	FileDelete(ls_filepath+"savepicgif0.gif")
end if

if FileExists(ls_filepath+"savepicgif1.gif") then
	FileDelete(ls_filepath+"savepicgif1.gif")
end if

if FileExists(ls_filepath+"savepictiff0.tiff") then
	FileDelete(ls_filepath+"savepictiff0.tiff")
end if

if FileExists(ls_filepath+"savepictiff1.tiff") then
	FileDelete(ls_filepath+"savepictiff1.tiff")
end if

if FileExists(ls_filepath+"savepicpng0.png") then
	FileDelete(ls_filepath+"savepicpng0.png")
end if

if FileExists(ls_filepath+"savepicpng1.png") then
	FileDelete(ls_filepath+"savepicpng1.png")
end if

long j , k 
string ls_file 

for j = 1 to 4 
	for k =1 to 3
		ls_file = ls_filepath+"saveink"+string(j)+string(k)+".gif"
		if FileExists(ls_file) then
			FileDelete(ls_file)
		end if 
	next
next

if FileExists(ls_filepath+"PrintCancelTest1.xps") then
	FileDelete(ls_filepath+"PrintCancelTest1.xps")
end if

if FileExists(ls_filepath+"PrintCancelTest1.oxps") then
	FileDelete(ls_filepath+"PrintCancelTest1.oxps")
end if

end event

event timer;call super::timer;if lower(is_type) = lower("PrintCancel") then 
	wf_closepopwindow( "Save the file as", 'Save')
	wf_closepopwindow( "Print to File", 'OK')
	wf_closepopwindow( "Save Print Output As", 'Save')			//for win10 print machine
end if 
end event

type st_memo from statictext within w_inkpicture
boolean visible = false
integer x = 242
integer y = 720
integer width = 2491
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 134217856
long backcolor = 67108864
string text = "Please lay the testing visual-control here!  The balance difference "
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_inkpicture
integer x = 27
integer y = 440
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

type cb_2 from commandbutton within w_inkpicture
integer x = 27
integer y = 272
integer width = 603
integer height = 132
integer taborder = 20
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

type cb_1 from commandbutton within w_inkpicture
integer x = 27
integer y = 104
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

type ip_1 from inkpicture within w_inkpicture
string tag = "1"
integer x = 681
integer y = 12
integer width = 1966
integer height = 1252
boolean bringtotop = true
end type

event stroke;is_log += ' Stroke() Triggered '

return true
end event

event clicked;is_log += ' Clicked() Triggered '  
end event

event constructor;is_log += ' Constructor() Triggered '  
end event

event gesture;is_log += ' Gesture() Triggered '  

return true 
end event

event rbuttondown;is_log += ' RbuttonDown() Triggered '  

end event

event losefocus;is_log += ' Losefocus() Triggered '  
end event

event getfocus;is_log += ' Getfocus() Triggered '  
end event

event sizechanged;is_log += ' Sizechanged() Triggered '
end event

event selectionchanged;is_log += ' Selectionchanged() Triggered '
end event

event destructor;is_log += ' Destructor() Triggered '
end event

event selectionchanging;is_log += ' Selectionchanging() Triggered '  
end event

type gb_1 from groupbox within w_inkpicture
integer x = 631
integer width = 2062
integer height = 1372
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 134217856
long backcolor = 67108864
string text = "Lay Control"
borderstyle borderstyle = stylebox!
end type

