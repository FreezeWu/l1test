$PBExportHeader$w_oracle_proc_array.srw
forward
global type w_oracle_proc_array from w_base_case
end type
type cb_1 from commandbutton within w_oracle_proc_array
end type
end forward

global type w_oracle_proc_array from w_base_case
cb_1 cb_1
end type
global w_oracle_proc_array w_oracle_proc_array

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

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
//		case lower("testcasepoint_example1")	
			//			... your test case code...
			//	ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_oracle_proc_array.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_oracle_proc_array.destroy
call super::destroy
destroy(this.cb_1)
end on

event open;call super::open;//en_ora12c =
//  (DESCRIPTION =
//    (ADDRESS_LIST =
//      (ADDRESS = (PROTOCOL = TCP)(HOST = 192.0.3.98)(PORT = 1521))
//    )
//    (CONNECT_DATA =
//      (SERVER = DEDICATED)
//      (SERVICE_NAME = pdborcl)
//    )
//  )


//EN_ORA9I =
//  (DESCRIPTION =
//    (ADDRESS_LIST =
//      (ADDRESS = (PROTOCOL = TCP)(HOST = 192.0.0.40)(PORT = 1521))
//    )
//    (CONNECT_DATA =
//      (SERVICE_NAME = enora9i)
//    )
//  )


//gtr_ora = create n_trans
//gtr_ora.DBMS = "O10 Oracle10g (10.1.0)"
//gtr_ora.LogPass = "en_ora9i"
//gtr_ora.ServerName = "en_ora12c"
//gtr_ora.LogId = "en_ora9i"
//gtr_ora.AutoCommit = False
//gtr_ora.DBParm = "PBCatalogOwner='en_ora9i'"
end event

type cb_1 from commandbutton within w_oracle_proc_array
integer x = 137
integer y = 132
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute"
end type

