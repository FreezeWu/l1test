$PBExportHeader$w_pb_bug1614.srw
forward
global type w_pb_bug1614 from w_base_case
end type
end forward

global type w_pb_bug1614 from w_base_case
integer width = 2807
integer height = 1832
end type
global w_pb_bug1614 w_pb_bug1614

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();// bug1614的测试点，dynamic调用handle句柄时崩溃
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

ls_array[1] = "window"
ls_array[2] = "commandbutton"
ls_array[3] = "long"

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
		case "window"		
			//通过handle最大化sheet
			open(w_mdi_1614)
			opensheet(w_sheet_1614,w_mdi_1614)
			//动态调用
			w_sheet_1614.of_window(true)
			if w_sheet_1614.windowstate =maximized! then
				ls_result += "Dynamic Max sheetwindow Succeed!~r~n"
			else
				ls_result += "Dynamic Max sheetwindow Failed!~r~n"
			end if
			//还原窗体
			w_sheet_1614.windowstate =normal!
			w_sheet_1614.of_window(false)
			if w_sheet_1614.windowstate =maximized! then
				ls_result += "Max sheetwindow Succeed!~r~n"
			else
				ls_result += "Max sheetwindow Failed!~r~n"
			end if
			//关闭窗体
			close(w_mdi_1614)
		case "commandbutton"
			//通过handle触发button的click事件
			open(w_mdi_1614)
			opensheet(w_sheet_1614,w_mdi_1614)
			//动态调用
			w_sheet_1614.of_cb(true)
			ls_result +="Handle dynamic Trigger:"+w_sheet_1614.is_message+"~r~n"
			//非动态调用
			w_sheet_1614.of_cb(false)
			ls_result += "Handle Trigger:"+w_sheet_1614.is_message+"~r~n"
			//关闭窗体
			close(w_mdi_1614)
		case "long"
			//通过long触发button的click事件
			open(w_mdi_1614)
			opensheet(w_sheet_1614,w_mdi_1614)
			//动态调用
			w_sheet_1614.of_long(true)
			ls_result +="long dynamic Trigger:"+w_sheet_1614.is_message+"~r~n"
			//非动态调用
			w_sheet_1614.of_long(false)
			ls_result += "long Trigger:"+w_sheet_1614.is_message+"~r~n"
			//关闭窗体
			close(w_mdi_1614)
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_pb_bug1614.create
call super::create
end on

on w_pb_bug1614.destroy
call super::destroy
end on

