$PBExportHeader$w_filewrite_streammode.srw
forward
global type w_filewrite_streammode from w_base_case
end type
type cb_1 from commandbutton within w_filewrite_streammode
end type
end forward

global type w_filewrite_streammode from w_base_case
integer width = 2030
integer height = 1100
string title = "FileWrite Test"
cb_1 cb_1
end type
global w_filewrite_streammode w_filewrite_streammode

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
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
long			ll_bound, i , ll_tmp, ll_null, ll_position,ll_rtn,ll_file
string 		ls_path, ls_file, ls_fullname
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

ls_array[Upperbound(ls_array) + 1 ] = "FileWrite"			//测试在stream mode下的文件读写功能
ls_array[Upperbound(ls_array) + 1 ] = "FileWrite2"		//测试在line mode下的文件读写功能

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
		case lower("FileWrite")
			ls_file =  gs_cachedir+ gs_dirseparator + "testwrite.txt"
             ll_file = FileOpen(ls_file,StreamMode!,write!)
             ll_rtn = FileWrite(ll_file,"test")
             fileclose(ll_file)
	  
			if not isnull(ll_rtn) and ll_rtn = 4  then 
				ls_result += " "+is_testcasename+" "+ls_item + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " = "+String ( "Fail!" ) +"~r~n"
			end if         
			
		case lower("FileWrite2")			
			ls_file =gs_cachedir+ gs_dirseparator + "testwrite2.txt"
             ll_file = FileOpen(ls_file,LineMode!,write!)
             ll_rtn = FileWrite(ll_file,"test")
             fileclose(ll_file)
	  
              if not isnull(ll_rtn) and ll_rtn = 4  then 
				ls_result += " "+is_testcasename+" "+ls_item + " = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " = "+String ( "Fail!" ) +"~r~n"
			end if 
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_filewrite_streammode.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_filewrite_streammode.destroy
call super::destroy
destroy(this.cb_1)
end on

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator

if FileExists(ls_filepath+"testwrite.txt") then
	FileDelete(ls_filepath+"testwrite.txt")
end if

if FileExists(ls_filepath+"testwrite2.txt") then
	FileDelete(ls_filepath+"testwrite2.txt")
end if

end event

type cb_1 from commandbutton within w_filewrite_streammode
integer x = 128
integer y = 136
integer width = 457
integer height = 128
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "run"
end type

event clicked;of_testcase_point_module()
end event

