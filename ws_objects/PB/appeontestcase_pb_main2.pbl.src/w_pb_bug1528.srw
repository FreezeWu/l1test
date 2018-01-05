$PBExportHeader$w_pb_bug1528.srw
forward
global type w_pb_bug1528 from w_base_case
end type
end forward

global type w_pb_bug1528 from w_base_case
end type
global w_pb_bug1528 w_pb_bug1528

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();//处理bug 1528
//mdidock方式的窗体打开的sheet，timer事件崩溃

string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position,ll_start,ll_end
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

ls_array[1] = "mdi"			//edit you test case point name
ls_array[2] = "mdidock1"
ls_array[3] = "mdidock2"
ls_array[4] = "open"



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
		case "open"			
			open(w_sheet_1528)
			ls_result += "OpenTimer,The State = "+w_sheet_1528.of_output()+"~r~n"
			//关闭时间
			w_sheet_1528.of_stop()
			ls_result += "CloseTimer,The State = "+w_sheet_1528.of_output()+"~r~n"
			//关闭窗体
			close(w_sheet_1528)
		case "mdi"
			open(w_mdi_1528)
			ls_result += "OpenMdiTime,The State="+w_mdi_1528.wf_output()+"~r~n"
			//打开sheet
			opensheet(w_sheet_1528,w_mdi_1528)
			ls_result += "OpenSheetTime,The State="+w_sheet_1528.of_output()+"~r~n"
			//关闭mdi时间
			w_mdi_1528.wf_stop()
			ls_result += "CloseMDITimer,The State = "+w_mdi_1528.wf_output()+"~r~n"
			//关闭sheet时间
			w_sheet_1528.of_stop()
			ls_result += "CloseSheetTimer,The State = "+w_sheet_1528.of_output()+"~r~n"
			//关闭窗体
			close(w_mdi_1528)
		case "mdidock1"
			open(w_mdidock_1528)
			ls_result += "OpenMdiDockTime,The State="+w_mdidock_1528.wf_output()+"~r~n"
			//打开sheet
			opensheet(w_sheet_1528,w_mdidock_1528)
			ls_result += "OpenSheetTime,The State="+w_sheet_1528.of_output()+"~r~n"
			//关闭mdi时间
			w_mdidock_1528.wf_stop()
			ls_result += "CloseMDIDockTimer,The State = "+w_mdidock_1528.wf_output()+"~r~n"
			//关闭sheet时间
			w_sheet_1528.of_stop()
			ls_result += "CloseSheetTimer,The State = "+w_sheet_1528.of_output()+"~r~n"
			//关闭窗体
			close(w_mdidock_1528)
		case "mdidock2"
			open(w_mdidock_1528)
			ls_result += "OpenMdiDockTime,The State="+w_mdidock_1528.wf_output()+"~r~n"
			//打开sheet
			opensheetasdocument(w_sheet_1528,w_mdidock_1528,"Test")
			ls_result += "OpenDocumentTime,The State="+w_sheet_1528.of_output()+"~r~n"
			//关闭mdi时间
			w_mdidock_1528.wf_stop()
			ls_result += "CloseMDIDockTimer,The State = "+w_mdidock_1528.wf_output()+"~r~n"
			//关闭sheet时间
			w_sheet_1528.of_stop()
			ls_result += "CloseDocumentTimer,The State = "+w_sheet_1528.of_output()+"~r~n"
			//关闭窗体
			close(w_mdidock_1528)
	end choose 
next 

is_resultlog += ls_result


end subroutine

on w_pb_bug1528.create
call super::create
end on

on w_pb_bug1528.destroy
call super::destroy
end on

