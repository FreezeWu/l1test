$PBExportHeader$w_apb_web_bugtrack2012_1.srw
forward
global type w_apb_web_bugtrack2012_1 from w_base_case
end type
type mle_1 from multilineedit within w_apb_web_bugtrack2012_1
end type
type dw_1 from datawindow within w_apb_web_bugtrack2012_1
end type
type em_1 from editmask within w_apb_web_bugtrack2012_1
end type
end forward

global type w_apb_web_bugtrack2012_1 from w_base_case
mle_1 mle_1
dw_1 dw_1
em_1 em_1
end type
global w_apb_web_bugtrack2012_1 w_apb_web_bugtrack2012_1

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
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

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null,testname
long			ll_bound, i , ll_tmp, ll_null, ll_position,ll_rtn
string 		ls_file, ls_fullname
integer 		li_rtn, li_col,li_filenum,li_fnum
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data,ldc_data2

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "bugid29333"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29212"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "bugid29115"
ls_array[Upperbound(ls_array) + 1 ] = "bugid29106"
ls_array[Upperbound(ls_array) + 1 ] = "bugid28988"
ls_array[Upperbound(ls_array) + 1 ] = "bugid28984"
ls_array[Upperbound(ls_array) + 1 ] = "bugid28948"
ls_array[Upperbound(ls_array) + 1 ] = "bugid28943"
ls_array[Upperbound(ls_array) + 1 ] = "bugid28935"
ls_array[Upperbound(ls_array) + 1 ] = "bugid28933"
ls_array[Upperbound(ls_array) + 1 ] = "bugid28930"
ls_array[Upperbound(ls_array) + 1 ] = "bugid30178"


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
		case lower("bugid29333")
			//DW shows incorrent custom format for suppress 0
			dw_1.dataobject = 'dw_test29333'
			ll_tmp = dw_1.insertrow( 1)
			dw_1.setitem(ll_tmp,"d_1",2.12345)
			dw_1.setitem(ll_tmp,"d_2",2.12345)
			
			ll_tmp = dw_1.insertrow( 1)
			dw_1.setitem(ll_tmp,"d_1",0)
			dw_1.setitem(ll_tmp,"d_2",0)
			ldc_data = dw_1.getitemdecimal(1,'d_2')
			ls_result += wf_result_add(ls_item, " ", ldc_data = 0)
			
		case lower("bugid29212")	
			//registryset error when valuetype is RegULong! and value is -1
			long MaxScriptStatements = -1
			ulong li_test
			RegistrySet( "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Styles",  "MaxScriptStatements", RegULong!, MaxScriptStatements)
			RegistryGet( "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Styles",  "MaxScriptStatements", RegULong!, li_test)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_test) and li_test = 4294967295)
			
		case lower("bugid29155")
	     	//'~' in modstring of modify function with datawondow
		    string ls_TrueString,ls_FalseString,ls_TildeQuote
		    dw_1.dataobject = 'd_test29115'
		    ls_TildeQuote = '~~"'    
		    ls_TrueString = ls_TildeQuote+'true'+ls_TildeQuote   
		    ls_FalseString = ls_TildeQuote+'false'+ls_TildeQuote    
		    ls_result += wf_result_add(ls_item, " ", ls_TrueString ='~"true~"' and ls_FalseString = '~"false~"')
			
		case lower("bugid29106")	
			//datefmask issue of editmask object
			em_1.text = '09/12'
			ls_temp = em_1.text
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp) and ls_temp = '09/12')
			 
	    case lower("bugid28988")
			//FilewriteEX can only write 32765 characters at a time
			blob Emp_Id_Pic	
			ls_file = gs_cachedir +gs_dirseparator+ "28988.bmp"
			if not FileExists(ls_file)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_file, sqlca)
					if not FileExists(ls_file)  then 
						ls_result += wf_result_add(ls_item, "create temp file", false)
					end if 
				else
					ls_result += wf_result_add(ls_item, "create temp file", false)
				end if 
			end if
			
			li_fnum = FileOpen(ls_file,textMode!,read!,shared!)
			ll_tmp = FileReadEx(li_fnum, Emp_Id_Pic)
			fileclose(li_fnum)
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_tmp) and ll_tmp = 1769526)
			
//	    //案例执行时间太长，暂时屏蔽，有需要测试再放开
		case lower("bugid28984")
			//IE crashed when the retrieve records in sub report more than 32767
			transaction 	tran2_SQLCA
			tran2_SQLCA = Create transaction
			testname = "ODBC2"
			f_db_connect (tran2_SQLCA, testname, '') 
			dw_1.dataobject = 'dw_sub_1'
			dw_1.SetTransObject(tran2_SQLCA)
			ll_tmp = dw_1.Retrieve()
			disconnect using tran2_SQLCA;
			destroy tran2_SQLCA;
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_tmp) and ll_tmp = 1)
					
		case lower("bugid28948")	
		case lower("bugid28943")	
		case lower("bugid28935")	
			//round/abs/truncate a decimal data in dw
			dw_1.dataobject = 'd_test28935'
			long ll_row
			ll_row = dw_1.insertrow(0)
			dw_1.setitem(ll_row,"c_decimal",63.1)
			ll_row = dw_1.insertrow(0)
			dw_1.setitem(ll_row,"c_decimal",-63.1)
			ldc_data = dw_1.getitemdecimal(1,'c_decimal')
			ls_result += wf_result_add(ls_item, " ", not isnull(ldc_data) and ldc_data = 63.1)
			
	  case lower("bugid28933")	
		    //filereadex issue
			ls_file = gs_cachedir +gs_dirseparator+ "28933.bmp"
			if not FileExists(ls_file)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_file, sqlca)
					if not FileExists(ls_file)  then 
						ls_result += wf_result_add(ls_item, "create temp file", false)
					end if 
				else
					ls_result += wf_result_add(ls_item, "create temp file", false)
				end if 
			end if
			
			li_fnum = FileOpen(ls_file,textMode!,read!,shared!)
			ll_tmp = FileReadEx(li_fnum, Emp_Id_Pic)
			fileclose(li_fnum)
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_tmp) and ll_tmp = 670)
			
	 case lower("bugid28930")	
		    //FileWrite failure in streammode
			ls_file = 'testwrite.txt'		
			ll_tmp = FileOpen(ls_file,StreamMode!,write!)
			ll_rtn = FileWrite(ll_tmp,"test")
			fileclose(ll_tmp)
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_rtn) and ll_rtn <> -1)
			
	case lower("bugid30178")	
		//string(double datatype ) show error
		    Real	lr_real
		    lr_real = 3.402822E+38
		    ls_temp = String(lr_real)
		    ls_result += wf_result_add(ls_item, "Real转换为string类型,期望值：3.402822E+38，实际值 "+ls_temp, not isnull(ls_temp) and ls_temp = '3.402822E+38')
			

			
			
			
			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_web_bugtrack2012_1.create
int iCurrent
call super::create
this.mle_1=create mle_1
this.dw_1=create dw_1
this.em_1=create em_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_1
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.em_1
end on

on w_apb_web_bugtrack2012_1.destroy
call super::destroy
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.em_1)
end on

event timer;call super::timer;//wf_closepopwindow( "Save the file as", 'Save')
//	wf_closepopwindow( "Print to File", 'OK')
	wf_closepopwindow( "Save Print Output As", 'Save')			//for win10 print machine
end event

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator

if FileExists(ls_filepath+"28988.bmp") then
	FileDelete(ls_filepath+"28988.bmp")
end if

if FileExists(ls_filepath+"28933.bmp") then
	FileDelete(ls_filepath+"28933.bmp")
end if
end event

type mle_1 from multilineedit within w_apb_web_bugtrack2012_1
integer x = 1344
integer y = 396
integer width = 581
integer height = 308
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_apb_web_bugtrack2012_1
integer x = 485
integer y = 304
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_1 from editmask within w_apb_web_bugtrack2012_1
integer x = 1947
integer y = 156
integer width = 270
integer height = 108
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yy"
end type

