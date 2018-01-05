$PBExportHeader$w_byteinesql.srw
forward
global type w_byteinesql from w_base_case
end type
type cb_1 from commandbutton within w_byteinesql
end type
end forward

global type w_byteinesql from w_base_case
integer height = 1744
cb_1 cb_1
end type
global w_byteinesql w_byteinesql

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
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
byte   lb_data
is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "Byteinw_Sql"			//edit you test case point name
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
		case lower("Byteinw_Sql")	
			Declare my_cursor cursor for Select age from v65_byte;
			   Open my_cursor;
			Fetch my_cursor into :lb_data;
			do  
				ls_temp =  string(lb_data)
				li_rtn ++
				if li_rtn = 1 then 
					if not isnull(ls_temp) and  ls_temp = "0"  then 
						ls_result += " Window.Byteinw Sql "+ls_item + " 0 = "+String ( "Success!" ) +"~r~n"
					else
						ls_result += " Window.Byteinw Sql "+ls_item + " 0 = "+String ( "Fail!" ) +"~r~n"
					end if 		
				elseif li_rtn = 2 then 
					if not isnull(ls_temp) and  ls_temp = "1"  then 
						ls_result += " Window.Byteinw Sql "+ls_item + " 1 = "+String ( "Success!" ) +"~r~n"
					else
						ls_result += " Window.Byteinw Sql "+ls_item + " 1 = "+String ( "Fail!" ) +"~r~n"
					end if 	
				elseif li_rtn = 3 then 
					if not isnull(ls_temp) and  ls_temp = "255"  then 
						ls_result += " Window.Byteinw Sql "+ls_item + " 255 = "+String ( "Success!" ) +"~r~n"
					else
						ls_result += " Window.Byteinw Sql "+ls_item + " 255 = "+String ( "Fail!" ) +"~r~n"
					end if 	
				elseif li_rtn = 4 then 
					if not isnull(ls_temp) and  ls_temp = "32"  then 
						ls_result += " Window.Byteinw Sql "+ls_item + " 32 = "+String ( "Success!" ) +"~r~n"
					else
						ls_result += " Window.Byteinw Sql "+ls_item + " 32 = "+String ( "Fail!" ) +"~r~n"
					end if 	 
				end if 
				
				Fetch Next my_cursor into :lb_data;
			Loop while sqlca.sqlcode = 0
			Close my_cursor;
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_byteinesql.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_byteinesql.destroy
call super::destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_byteinesql
integer x = 325
integer y = 288
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Byteinw_Sql"
end type

event clicked;of_testcase_point_module()
end event

