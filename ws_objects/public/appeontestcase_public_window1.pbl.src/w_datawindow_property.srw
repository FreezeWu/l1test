$PBExportHeader$w_datawindow_property.srw
forward
global type w_datawindow_property from w_base_case
end type
type dw_1 from datawindow within w_datawindow_property
end type
type cb_1 from commandbutton within w_datawindow_property
end type
type cb_2 from commandbutton within w_datawindow_property
end type
end forward

global type w_datawindow_property from w_base_case
integer width = 3145
dw_1 dw_1
cb_1 cb_1
cb_2 cb_2
end type
global w_datawindow_property w_datawindow_property

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag,lbn_return 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "Border"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "BorderStyle"
ls_array[Upperbound(ls_array) + 1 ] = "BringToTop"
ls_array[Upperbound(ls_array) + 1 ] = "ControlMenu"
ls_array[Upperbound(ls_array) + 1 ] = "DataObject"
ls_array[Upperbound(ls_array) + 1 ] = "Enabled"
ls_array[Upperbound(ls_array) + 1 ] = "height"
ls_array[Upperbound(ls_array) + 1 ] = "HScroolBar"
ls_array[Upperbound(ls_array) + 1 ] = "HSpiltSvroll"
ls_array[Upperbound(ls_array) + 1 ] = "MaxBox"
ls_array[Upperbound(ls_array) + 1 ] = "MinBox"
ls_array[Upperbound(ls_array) + 1 ] = "Object"
ls_array[Upperbound(ls_array) + 1 ] = "Resizable"
ls_array[Upperbound(ls_array) + 1 ] = "RightToLeft"
ls_array[Upperbound(ls_array) + 1 ] = "TabOrder"
ls_array[Upperbound(ls_array) + 1 ] = "Tag"
ls_array[Upperbound(ls_array) + 1 ] = "Title"
ls_array[Upperbound(ls_array) + 1 ] = "TitleBar"
ls_array[Upperbound(ls_array) + 1 ] = "Visible"
ls_array[Upperbound(ls_array) + 1 ] = "VScrollBar"
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
	choose case lower(ls_item)
		case lower("Border")	
			//获取原始值 true
			lbn_return = dw_1.Border
			if lbn_return = true then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". Get Original = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". Get Original = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为false
			lbn_return = false
			lbn_return = dw_1.righttoleft
			if lbn_return = false then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set false = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set false = "+ String ( "Fail!" ) +"~r~n"
			end if 
			//动态修改为true
			lbn_return = true
			lbn_return = dw_1.righttoleft
			if lbn_return = true then
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set true = "+ String ( "Success!" ) +"~r~n"
			else
				ls_result +=" "+is_testcasename+" "+ls_item+" property "+". set true = "+ String ( "Fail!" ) +"~r~n"
			end if
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_datawindow_property.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
end on

on w_datawindow_property.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.cb_2)
end on

type dw_1 from datawindow within w_datawindow_property
integer x = 1285
integer y = 104
integer width = 1573
integer height = 1136
integer taborder = 20
string title = "none"
string dataobject = "d_dcp001_w01_external"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_datawindow_property
integer x = 82
integer y = 204
integer width = 475
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "test property"
end type

type cb_2 from commandbutton within w_datawindow_property
integer x = 1079
integer y = 636
integer width = 457
integer height = 132
integer taborder = 20
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

