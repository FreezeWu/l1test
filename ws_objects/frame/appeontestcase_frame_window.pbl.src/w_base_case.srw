$PBExportHeader$w_base_case.srw
forward
global type w_base_case from w_base
end type
end forward

global type w_base_case from w_base
end type
global w_base_case w_base_case

type prototypes
PUBLIC FUNCTION ulong FindWindowA (ulong classname, string windowname) LIBRARY "user32.dll"    ALIAS FOR "FindWindowA;Ansi"
PUBLIC FUNCTION ulong FindWindowW (ulong classname, string windowname) LIBRARY "user32.dll"    ALIAS FOR "FindWindowW;Unicode"

PUBLIC FUNCTION long FindWindowExA (long hParent, long hChildAfter, ref string lpszClass, ref string lpszWindow) LIBRARY "user32.dll" ALIAS FOR "FindWindowExA;Ansi"
PUBLIC FUNCTION long FindWindowExW (long hParent, long hChildAfter, ref string lpszClass, ref string lpszWindow) LIBRARY "user32.dll" ALIAS FOR "FindWindowExW;Unicode"

PUBLIC FUNCTION BOOLEAN SetForegroundWindow (ulong hwnd ) LIBRARY "user32.dll" ALIAS FOR "SetForegroundWindow"
PUBLIC FUNCTION BOOLEAN BringWindowToTop (ulong hwnd ) LIBRARY "user32.dll" ALIAS FOR "BringWindowToTop"
PUBLIC FUNCTION ulong SetActiveWindow (ulong hwnd ) LIBRARY "user32.dll" ALIAS FOR "SetActiveWindow"
PUBLIC FUNCTION ulong GetWindow (ulong hwnd, ulong lnextwindow) LIBRARY "user32.dll" ALIAS FOR "GetWindow"

PUBLIC FUNCTION ulong GetWindowTextA (ulong hwnd, ref string titleText, ulong nMaxCount ) LIBRARY "user32.dll" ALIAS FOR "GetWindowTextA;Ansi"
PUBLIC FUNCTION ulong GetWindowTextW (ulong hwnd, ref string titleText, ulong nMaxCount ) LIBRARY "user32.dll" ALIAS FOR "GetWindowTextW;Unicode"

PUBLIC FUNCTION ulong SetWindowTextA (ulong hwnd, ref string lpString ) LIBRARY "user32.dll" ALIAS FOR "SetWindowTextA;Ansi"
PUBLIC FUNCTION ulong SetWindowTextW (ulong hwnd, ref string lpString ) LIBRARY "user32.dll" ALIAS FOR "SetWindowTextW;Unicode"

PUBLIC FUNCTION long SendMessageA(long hwnd, long wMsg, long wParam, long lParam ) LIBRARY "user32.dll" ALIAS FOR "SendMessageA;Ansi"
PUBLIC FUNCTION long SendMessageW(long hwnd, long wMsg, long wParam, long lParam ) LIBRARY "user32.dll" ALIAS FOR "SendMessageW;Unicode"
end prototypes

type variables
string 	is_log = ''
string 	is_resultlog = ''  
string 	is_type
long		il_recordfile
end variables

forward prototypes
public subroutine of_recordtestpoint (string as_content)
public subroutine of_testcase_point_module ()
public subroutine wf_closepopwindow (string as_poptitle, string as_buttonname)
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
public subroutine of_testcase_point_module4 ()
public subroutine of_testcase_point_module5 ()
public subroutine of_testcase_point_module6 ()
public subroutine of_testcase_point_module7 ()
public subroutine of_testcase_point_module8 ()
public subroutine of_testcase_point_module9 ()
public subroutine of_testcase_point_module10 ()
protected function string wf_result_add (string as_itemname, string as_log, boolean ab_flag)
public subroutine of_testcase_point_module11 ()
public subroutine of_testcase_point_module12 ()
public subroutine of_testcase_point_module13 ()
public subroutine of_testcase_point_module14 ()
public subroutine of_testcase_point_module15 ()
public subroutine wf_closepopwindoww (string as_poptitle, string as_buttonname)
end prototypes

public subroutine of_recordtestpoint (string as_content);
string ls_record,	ls_global_path, ls_filepath

ls_global_path = 	gs_cachedir + gs_dirseparator + "testcase.ini"
ls_record = profilestring(ls_global_path,"settings","recordtestpoint","N")
if isnull(ls_record) or ls_record = 'N' then 
	return 
end if 

ls_filepath = 	gs_cachedir + gs_dirseparator + "recordtestpoint.log"
if isnull(il_recordfile) or il_recordfile <= 0 then il_recordfile = fileopen(ls_filepath,streammode!,write!,lockwrite!,append!)

if not isnull(as_content) and trim(as_content) <> "" then filewrite(il_recordfile,as_content)
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine wf_closepopwindow (string as_poptitle, string as_buttonname);long 			ll_tmp, ll_class, ll_handler
string 		ls_null, ls_windowtitle, ls_textname, ls_buttonname
long 			ll_Buff, ll_len
long 			ll_child, ll_childafter, ll_childlen
string 		ls_windows, ls_childclassname, ls_childtitle, ls_path
integer 	 	i, j 
				
Constant long BM_CLICK = 245, WM_CLOSE = 16
Constant long ll_gw_hwndnext = 2

setNull(ll_class)
setnull(ls_null)

ll_handler = FindWindowA( ll_class,ls_null)
ll_len =len(as_poptitle) + 1
ls_windowtitle = space(ll_len)
//	ls_windowtitle = space(200)	

Do While ll_handler <> 0 
	GetWindowTextA(ll_handler, ls_windowtitle, ll_len)
	if not isnull(ls_windowtitle) then 
		if pos(upper(ls_windowtitle), upper(as_poptitle) ) > 0 then 
			is_log +=" timer title: "+as_poptitle+" action: "+as_buttonname
			SetForegroundWindow(ll_handler)		//  64 
			SetActiveWindow(ll_handler)
			BringWindowToTop(ll_handler)
			
			if pos(lower(is_type), lower("PrintCancel")) > 0  then 				
				setnull(ls_windows)
				ll_childafter = 0 
				
				ls_path  = gs_cachedir					//mobile web  & pb				
				ls_textname = ls_path +gs_dirseparator+"PrintCancelTest1"
				j = 4 
				ll_child = ll_handler
				if as_poptitle = "Print to File" then 
					ls_childclassname = "Edit"
					ll_tmp = FindWindowExA(ll_child,ll_childafter,ls_childclassname,ls_windows)
					if ll_tmp > 0 then 
						  ll_child = ll_tmp
						  if FileExists(ls_textname) then FileDelete(ls_textname)					//add 
						  SetWindowTextA(ll_child,ls_textname)							  
						  ls_windows = as_buttonname
						  ll_tmp = FindWindowExA(ll_handler,ll_childafter,ls_null,ls_windows)
						  if ll_tmp >  0 then     SendMessageA(ll_tmp, BM_CLICK, 0,0 )
					end if
				else
					//Save Print Output As
					//Save the file as
					for i = 1 to j 
						choose case i 
							case 1 
								ls_childclassname = "DUIViewWndClassName"
							case 2
								ls_childclassname = "DirectUIHWND"
							case 3
								ls_childclassname = "FloatNotifySink"
							case 4
								ls_childclassname = "ComboBox"
						end choose 
						
						 ll_tmp = FindWindowExA(ll_child,ll_childafter,ls_childclassname,ls_windows)
						 if ll_tmp > 0 then 
							ll_child = ll_tmp
						 end if 
						 
						 if i = 4 and ll_tmp > 0 then
							ll_childlen = 100
							ls_childtitle = space(ll_childlen)
							GetWindowTextA(ll_tmp, ls_childtitle, ll_childlen)
							if FileExists(ls_textname) then FileDelete(ls_textname)					//add 
							SetWindowTextA(ll_tmp,ls_textname)
							ls_windows = as_buttonname
							ll_tmp = FindWindowExA(ll_handler,ll_childafter,ls_null,ls_windows)
							if ll_tmp >  0 then
								SendMessageA(ll_tmp, BM_CLICK, 0,0 )
							else
								if left(ls_windows, 1) <> "&" then 
									ls_windows = "&" + ls_windows
									ll_tmp = FindWindowExA(ll_handler,ll_childafter,ls_null,ls_windows)
									if ll_tmp >  0 then	SendMessageA(ll_tmp, BM_CLICK, 0,0 )									
								end if 
							end if 
						 end if 					 
					next 					
				end if 
			elseif 	pos(lower(is_type), lower("CloseWindow")) > 0  then 				
					ll_child = ll_handler
					SendMessageA(ll_child, WM_CLOSE, 0,0 )				
			else			//other			
				ll_Buff = 0 
				setnull(ls_null)
				ll_tmp= FindWindowExA(ll_handler, ll_Buff, ls_null,as_buttonname)		
				if ll_tmp > 0 then 
						send(ll_tmp,256,32,0)
						send(ll_tmp,257,32,0)
				end if 
				exit
			end if 
		end if 
	end if 
	ll_handler = GetWindow(ll_handler,ll_gw_hwndnext)
loop
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

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

//ls_array[Upperbound(ls_array) + 1 ] = "testcasepoint_example1"			//edit you test case point name
//ls_array[Upperbound(ls_array) + 1 ] = ""

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

//ls_array[Upperbound(ls_array) + 1 ] = "testcasepoint_example1"			//edit you test case point name
//ls_array[Upperbound(ls_array) + 1 ] = ""

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

//ls_array[Upperbound(ls_array) + 1 ] = "testcasepoint_example1"			//edit you test case point name
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module4 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module5 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module6 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module7 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module8 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module9 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module10 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

protected function string wf_result_add (string as_itemname, string as_log, boolean ab_flag);// as_log 要记录的日志内容
// ab_flag 测试的内容是否成功，true:成功, false:不成功
string 		ls_return 

If ab_flag Then
	ls_return += is_testcasename + " " + as_itemname + " " + as_log +" = Success!~r~n"
Else
	ls_return += is_testcasename + " " + as_itemname + " " + as_log +" = Fail!~r~n"
End If
				
return ls_return
end function

public subroutine of_testcase_point_module11 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module12 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module13 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module14 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module15 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine wf_closepopwindoww (string as_poptitle, string as_buttonname);long 			ll_tmp, ll_class, ll_handler
string 		ls_null, ls_windowtitle, ls_textname, ls_buttonname
long 			ll_Buff, ll_len
long 			ll_child, ll_childafter, ll_childlen
string 		ls_windows, ls_childclassname, ls_childtitle, ls_path
integer 	 	i, j 
				
Constant long BM_CLICK = 245, WM_CLOSE = 16
Constant long ll_gw_hwndnext = 2

setNull(ll_class)
setnull(ls_null)

ll_handler = FindWindowW( ll_class,ls_null)
ll_len =len(as_poptitle) + 1
ls_windowtitle = space(ll_len)
//	ls_windowtitle = space(200)	

Do While ll_handler <> 0 
	GetWindowTextW(ll_handler, ls_windowtitle, ll_len)
	if not isnull(ls_windowtitle) then 
		if pos(upper(ls_windowtitle), upper(as_poptitle) ) > 0 then 
			is_log +=" timer title: "+as_poptitle+" action: "+as_buttonname
			SetForegroundWindow(ll_handler)		//  64 
			SetActiveWindow(ll_handler)
			BringWindowToTop(ll_handler)
			
			if pos(lower(is_type), lower("PrintCancel")) > 0  then 				
				setnull(ls_windows)
				ll_childafter = 0 
				
				ls_path  = gs_cachedir					//mobile web  & pb				
				ls_textname = ls_path +gs_dirseparator+"PrintCancelTest1"			
				j = 4 
				ll_child = ll_handler
				if as_poptitle = "Print to File" then 
					ls_childclassname = "Edit"
					ll_tmp = FindWindowExW(ll_child,ll_childafter,ls_childclassname,ls_windows)
					if ll_tmp > 0 then 
						  ll_child = ll_tmp
						  if FileExists(ls_textname) then FileDelete(ls_textname)					//add 
						  SetWindowTextW(ll_child,ls_textname)							  
						  ls_windows = as_buttonname
						  ll_tmp = FindWindowExW(ll_handler,ll_childafter,ls_null,ls_windows)
						  if ll_tmp >  0 then     SendMessageW(ll_tmp, BM_CLICK, 0,0 )
					end if
				else
					//Save Print Output As
					//Save the file as
					for i = 1 to j 
						choose case i 
							case 1 
								ls_childclassname = "DUIViewWndClassName"
							case 2
								ls_childclassname = "DirectUIHWND"
							case 3
								ls_childclassname = "FloatNotifySink"
							case 4
								ls_childclassname = "ComboBox"
						end choose 
						
						 ll_tmp = FindWindowExW(ll_child,ll_childafter,ls_childclassname,ls_windows)
						 if ll_tmp > 0 then 
							ll_child = ll_tmp
						 end if 
						 
						 if i = 4 and ll_tmp > 0 then
							ll_childlen = 100
							ls_childtitle = space(ll_childlen)
							GetWindowTextW(ll_tmp, ls_childtitle, ll_childlen)
							if FileExists(ls_textname) then FileDelete(ls_textname)					//add 
							SetWindowTextW(ll_tmp,ls_textname)
							ls_windows = as_buttonname
							ll_tmp = FindWindowExW(ll_handler,ll_childafter,ls_null,ls_windows)
							if ll_tmp >  0 then
								SendMessageW(ll_tmp, BM_CLICK, 0,0 )
							else
								if left(ls_windows, 1) <> "&" then 
									ls_windows = "&" + ls_windows
									ll_tmp = FindWindowExW(ll_handler,ll_childafter,ls_null,ls_windows)
									if ll_tmp >  0 then	SendMessageW(ll_tmp, BM_CLICK, 0,0 )									
								end if 
							end if 
						 end if 					 
					next 					
				end if 
			elseif 	pos(lower(is_type), lower("CloseWindow")) > 0  then 				
					ll_child = ll_handler
					SendMessageA(ll_child, WM_CLOSE, 0,0 )				
			else			//other			
				ll_Buff = 0 
				setnull(ls_null)
				ll_tmp= FindWindowExW(ll_handler, ll_Buff, ls_null,as_buttonname)		
				if ll_tmp > 0 then 
						send(ll_tmp,256,32,0)
						send(ll_tmp,257,32,0)
				end if 
				exit
			end if 
		end if 
	end if 
	ll_handler = GetWindow(ll_handler,ll_gw_hwndnext)
loop
end subroutine

on w_base_case.create
call super::create
end on

on w_base_case.destroy
call super::destroy
end on

event close;call super::close;string 	ls_clean, ls_record, ls_global_path, ls_filepath

ls_global_path = 	gs_cachedir + gs_dirseparator + "testcase.ini"
ls_clean = profilestring(ls_global_path,"settings","autodeletetempfile","Y")

if ls_clean = 'Y' then 
	event ue_cleantempfile( )
end if 

if not isnull(il_recordfile) and il_recordfile > 0 then
	fileclose(il_recordfile)
end if 
 
ls_filepath = 	gs_cachedir + gs_dirseparator + "recordtestpoint.log"
ls_record = profilestring(ls_global_path,"settings","recordtestpoint","N")
if ls_record = 'N' then 
	if fileexists(ls_filepath) then
		filedelete(ls_filepath)
	end if
end if 

end event

event ue_execute;call super::ue_execute;choose case as_testcasename 
	case 	is_testcasename				
		is_resultlog = ''
		of_testcase_point_module( )
		of_testcase_point_module1( )
		of_testcase_point_module2( )		
		of_testcase_point_module3( )		
		of_testcase_point_module4( )				
		of_testcase_point_module5( )				
		of_testcase_point_module6( )
		of_testcase_point_module7( )		
		of_testcase_point_module8( )		
		of_testcase_point_module9( )				
		of_testcase_point_module10( )
		of_testcase_point_module11( )
		of_testcase_point_module12( )
		of_testcase_point_module13( )
		of_testcase_point_module14( )
		of_testcase_point_module15( )
end choose

gf_returnresult(is_resultlog)
		 
close(this)
end event

