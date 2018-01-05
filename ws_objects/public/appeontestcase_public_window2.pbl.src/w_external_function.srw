$PBExportHeader$w_external_function.srw
forward
global type w_external_function from w_base_case
end type
end forward

global type w_external_function from w_base_case
string is_type = "0"
end type
global w_external_function w_external_function

type prototypes
//External function systeminformation
Function ulong GetTickCount() Library "KERNEL32.DLL" 
//GlobalMemoryStatus can return incorrect information. Use the GlobalMemoryStatusEx function instead.
Subroutine GlobalMemoryStatusEx (ref str_memorystatus memorystatus) Library "KERNEL32.DLL" alias for "GlobalMemoryStatusEx"
Function ulong GetWindowsDirectoryA (ref string dirtext, ulong textlen) library "KERNEL32.DLL" ALIAS FOR "GetWindowsDirectoryA;Ansi"
Function ulong GetWindowsDirectoryW (ref string dirtext, ulong textlen) library "KERNEL32.DLL" ALIAS FOR "GetWindowsDirectoryW;Unicode"

Function boolean GetUserNameA(ref string name, ref ulong len) library "ADVAPI32.DLL" ALIAS FOR "GetUserNameA;Ansi"
Function boolean GetUserNameW(ref string name, ref ulong len) library "ADVAPI32.DLL" ALIAS FOR "GetUserNameW;Unicode"

end prototypes

forward prototypes
public function string of_getactivetime ()
public subroutine of_testcase_point_module ()
end prototypes

public function string of_getactivetime ();long ll_winticks
int li_myhours, li_mymins, li_mysecs
string ls_tmp1, tmp2


/*  get windows running time */
ll_winticks = GetTickCount() / 1000

if ll_winticks < 60 then
	ll_winticks = ll_winticks
else
	li_mymins = ll_winticks / 60
	ll_winticks = ll_winticks - (li_mymins * 60)
	li_mysecs = ll_winticks
	if li_mymins >= 60 then
		li_myhours = li_mymins / 60
		li_mymins = li_mymins - (li_myhours * 60)
	end if
end if

if li_myhours = 1 then
	ls_tmp1 = string(li_myhours) + " hour "
else
	ls_tmp1 = string(li_myhours) + " hours "
end if

if li_mymins < 1 then
	ls_tmp1 = ls_tmp1
elseif li_mymins = 1 then
	ls_tmp1 = ls_tmp1 + string(li_mymins) + " minute "
else
	ls_tmp1 = ls_tmp1 + string(li_mymins) + " minutes "
end if

if li_mysecs < 1 then
	ls_tmp1 = ls_tmp1
elseif li_mysecs = 1 then
	ls_tmp1 = ls_tmp1 + string(li_mysecs) + " second "
else
	ls_tmp1 = ls_tmp1 + string(li_mysecs) + " seconds "
end if

return ls_tmp1
end function

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
long			ll_pos, ll_pos2, ll_pos3
str_memorystatus 		lstr_memory
ulong 			lul_value
longlong		lll_maxM, lll_minM
	
is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "GetTickCount API"							//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "GlobalMemoryStatusEx API"
ls_array[Upperbound(ls_array) + 1 ] = "GetWindowsDirectoryW API"
ls_array[Upperbound(ls_array) + 1 ] = "GetUserNameW API"

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
		case lower("GetTickCount API")	
			//Activetime test
			ls_temp = of_getactivetime()
			if isnull(ls_temp) then ls_temp = ''
			
			ll_pos = POS(ls_temp,'hours')
			ll_pos2 = POS(ls_temp,'minutes')
			ll_pos3 = POS(ls_temp,'seconds')
			lbn_flag = True
			if ll_pos3 > 0 then
				if IsNumber(mid(ls_temp,(ll_pos2 + len("minutes")),3)) = false then
					lbn_flag =False
				else
					if ll_pos2 > 0 then
						if IsNumber(mid(ls_temp,(ll_pos + len("hours")),3))  = false then
							lbn_flag = False
						  else
							if ll_pos > 0 then
								if IsNumber(left(ls_temp,(ll_pos - 1)))  = false then
									lbn_flag = False
								end if
							end if
						 end if
					end if
				end if
			else
				lbn_flag = False				
			end if
			
			ls_result += wf_result_add(ls_item, " ", lbn_flag)
		case lower("GlobalMemoryStatusEx API")		
			//Memory test (Min:256MB = 256*1024*1024  ,Max 2048GB= 2048*1024*1024*1024 ,ungingedlong range 0~4,294,967,295)
			lstr_memory.ul_length = 64		//32
			GlobalMemoryStatusEx(lstr_memory)
			lll_maxM = lstr_memory.ll_availpagefile

			lll_minM = 268435456 - 10			//min memory			
			ls_result += wf_result_add(ls_item, " ",	lll_maxM >= lll_minM)
		case lower("GetWindowsDirectoryW API")		
			//Windows Directory test
			ls_temp = space(144)
			li_rtn = GetWindowsDirectoryW(ls_temp,144)
			if isnull(ls_temp) then ls_temp = ''
			ls_result += wf_result_add(ls_item, " ",	POS(ls_temp,':\Windows') > 0 or POS(ls_temp,':\WINDOWS') > 0)
			
		case lower("GetUserNameW API")			
			//Logon Name test
			ls_temp = space(255)
			If ge_Environment.OSType <> sol2! Then
				// get the network id
				lul_value = 255
				lbn_flag = GetUserNameW(ls_temp, lul_value)
			End if
			if isnull(ls_temp) then ls_temp = ''
			ls_result += wf_result_add(ls_item, " ",	lbn_flag and len(trim(ls_temp)) > 0)
			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_external_function.create
call super::create
end on

on w_external_function.destroy
call super::destroy
end on

