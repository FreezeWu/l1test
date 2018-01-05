$PBExportHeader$w_apb_web_bugtrack2014_1.srw
forward
global type w_apb_web_bugtrack2014_1 from w_base_case
end type
type dw_1 from datawindow within w_apb_web_bugtrack2014_1
end type
end forward

global type w_apb_web_bugtrack2014_1 from w_base_case
long backcolor = 1073741824
dw_1 dw_1
end type
global w_apb_web_bugtrack2014_1 w_apb_web_bugtrack2014_1

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
ls_array[Upperbound(ls_array) + 1 ] = "bugid33874"
//ls_array[Upperbound(ls_array) + 1 ] = "bugid33857"	//not support
ls_array[Upperbound(ls_array) + 1 ] = "bugid33849"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33768"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33478"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33475"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33404"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33353"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33313"
//ls_array[Upperbound(ls_array) + 1 ] = "bugid33287"	//hand case
ls_array[Upperbound(ls_array) + 1 ] = "bugid33143"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33076"
ls_array[Upperbound(ls_array) + 1 ] = "bugid33010"

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
		//case lower("")			
			//Maximum script size exceeded. 		//2100
			
		case lower("bugid33874")
			//filewrite issue when data over 32765
			integer li_filenum,li_temp,li_loops,li_write
			long ll_len,ll_writed,ll_end,ll_temp
			blob lb_pic,lb_buf
			ls_file = gs_cachedir+ gs_dirseparator + "33874.jpg"
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

			//if len(lb_Pic)>1024 then
				//transfer blob to file
				li_FileNum = FileOpen(ls_file,StreamMode!,Read!)
				fileread(li_filenum,lb_pic)
				ll_len=len(lb_pic)
				//calculate the loops
				IF ll_len> 32765 THEN 
					IF Mod(ll_len, 32765) = 0 THEN 
						li_loops = ll_len/32765
					ELSE 
						li_loops = (ll_len/32765) + 1 
					END IF 
				ELSE 
					li_loops = 1 
				END IF
				fileclose(li_filenum)
				li_FileNum = FileOpen(ls_file,StreamMode!,Write!,Shared!,Replace!)
				FileSeek(li_FileNum,0,FromBeginning!)				
				ll_writed=FileWrite(li_FileNum,lb_pic) 
				ll_temp = ll_writed
				FOR li_temp = 1 to li_loops - 2 
					lb_buf=blobmid(lb_pic,li_temp*32765+1,32765) 
					FileSeek(li_FileNum,0, FromCurrent!) 
					li_write=FileWrite(li_FileNum,lb_buf) 
					ll_writed=ll_writed+li_write 
				NEXT 
				ll_end=ll_len - ll_writed 
				lb_buf=blobmid(lb_pic,li_temp*32765+1,ll_end) 
				FileSeek(li_FileNum,0, FromCurrent!) 
				li_write=FileWrite(li_FileNum,lb_buf) 
				ll_writed=ll_writed+li_write 

				FileClose(li_FileNum)
			//end if
			
			if ll_writed = 32765 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "filewrite issue when data over 32765", lbn_flag)
			
		case lower("bugid33857")
			//calculate issue of decimal variable
			decimal ldc_1,ldc_2,ldc_3
			ldc_1 = 15918.7300 - 15.92 - 0.36
			ldc_2 = 15902.4500
			ldc_3 = ldc_1 - ldc_2
			
			if ldc_3 = 0 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "calculate issue of decimal variable", lbn_flag)
			
		case lower("bugid33849")
			//filereadex return should not include the newline character '~r'
			string ls_buf
			ls_file = gs_cachedir+ gs_dirseparator + "test.txt"
			li_filenum = FileOpen ( ls_File, LineMode!,  Write!, LockReadWrite!, Replace!, EncodingUTF8! )
			ls_buf = 'hello'
			filewriteex(li_filenum, ls_buf)
			ls_buf = 'world'
			filewriteex(li_filenum, ls_buf)
			ls_buf = 'battle'
			filewriteex(li_filenum, ls_buf)
			fileclose(li_filenum)
			li_filenum = FileOpen(ls_File, LineMode!,  ReAD!, LockReadWrite!, Append!, EncodingUTF8! )
			ls_buf = ''
			fileread(li_filenum, ls_buf)
			filereadex(li_filenum, ls_buf)
			fileclose(li_filenum)
			
			if ls_buf = 'world' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "filereadex return should not include the newline character ~'r~' ", lbn_flag)
			
		case lower("bugid33768")
			//importfile error when CSV file contain a quoted text
			dw_1.dataobject = 'd_test33768'
			dw_1.settransobject(sqlca)
			dw_1.retrieve()
			ls_file = gs_cachedir+ gs_dirseparator + "33768.csv"			
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
			
			dw_1.importfile(ls_file)
			ls_temp = dw_1.getitemstring(1,'id')
			
			if ls_temp = 'set,22' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "importfile error when CSV file contain a quoted text", lbn_flag)
			
		case lower("bugid33478")
			//Date to string is error.
			date ld_date1
			ld_date1 = 2014-01-01
			ls_temp = string(date(ld_date1),'yyyy-dd-mm')
			
			if ls_temp = '2014-01-01' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "Date to string is error.", lbn_flag)
			
		case lower("bugid33475")
			//The Isdate function is error.
			boolean lb_isdate
			lb_isdate = Isdate(string(today()))
			
			if lb_isdate = true then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "Date to string is error.", lbn_flag)
			
			
		case lower("bugid33404")
			//retrieve data does not reset detail height after call setdetailheight
			dw_1.dataobject = 'd_dept33404'
			dw_1.settransobject(sqlca)
			dw_1.retrieve()
			dw_1.setdetailheight(2,4,0)
			dw_1.retrieve()
			ls_temp = dw_1.getitemstring(3,'dept_name')
			
			if ls_temp = 'Finance' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "retrieve data does not reset detail height after call setdetailheight", lbn_flag)
			
		case lower("bugid33353")
			//using resize event to change window size getting smaller
			long ll_height,ll_width
			ll_height = this.height
			ll_width = this.width
			this.resize(ll_height,ll_width)
			if ll_height = 1740 and ll_width = 2752 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "using resize event to change window size getting smaller", lbn_flag)
			
		case lower("bugid33313")
			//all array elements pass as first array element  to function
			string ls_ref[],ls_tar
			string ls_var1, ls_var2
			integer li_n
			n_index_not_auto ln_array
			ln_array = create n_index_not_auto
			
			ls_ref[] = {'','','','','','','','','',''}
			
			for li_n = 1 to 10
				ls_ref[li_n] = string(li_n)
			next
			
			ls_tar = ln_array.of_test( ls_var1, ls_var2, ls_ref[1], ls_ref[2], ls_ref[3], ls_ref[4], ls_ref[5], ls_ref[6], ls_ref[7], ls_ref[8], ls_ref[9], ls_ref[10])
			
			if ls_tar = '1234510' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			destroy ln_array
			
			ls_result += wf_result_add(ls_item, "all array elements pass as first array element  to function", lbn_flag)
			
//		case lower("bugid33287")
//			//descit("datawindow.data") return null for datatime value when in querymode
//			datetime ldt_now
//			date ld_today
//			time lt_now
//			ld_today = today()
//			lt_now = now()
//			ldt_now = datetime(ld_today, lt_now)
//			dw_1.dataobject = 'd_dt33287'	
//			dw_1.Object.DataWindow.QueryMode = 'yes'
//			dw_1.insertrow(0)			
//			dw_1.setitem(1,1,ldt_now)
//			ls_temp = dw_1.describe("datawindow.data")
//			
//			if ls_temp = string(ldt_now) then
//				lbn_flag = true
//			else
//				lbn_flag = false
//			end if	
//			
//			ls_result += wf_result_add(ls_item, "descit(~"datawindow.data~") return null for datatime value when in querymode", lbn_flag)

		case lower("bugid33143")
			//getrow return 0 after sharedata
			String ls_data
			long ll_ret
			integer li_ret
			DataStore lds_Retrieve, lds_work
			lds_Retrieve = CREATE DataStore
			lds_work = CREATE DataStore
			lds_Retrieve.DataObject = 'dw_retrieve'
			dw_1.DataObject = 'dw_display'
			lds_Work.DataObject='dw_retrieve'
			lds_Retrieve.SetTransObject( SQLCA )
			dw_1.sharedataoff( )
			dw_1.reset()
			lds_work.reset()
			lds_Retrieve.Reset()
			lds_Retrieve.Retrieve( )
			ls_Data = lds_Retrieve.object.datawindow.data
			lds_Work.ShareData( dw_1 )
			lds_Work.importString( ls_Data )
			li_ret = dw_1.getRow()
			ll_ret = dw_1.rowcount()
			
			if li_ret = 1 and ll_ret = 650 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			destroy lds_retrieve
			destroy lds_work
			
			ls_result += wf_result_add(ls_item, "getrow return 0 after sharedata", lbn_flag)
			
		case lower("bugid33076")
			//display as -0 in datawindow.
			integer li_row
			long ll_value,ll_get
			double ldb_value = 0
			dw_1.dataobject = 'd_test33076'
			dw_1.settransobject(sqlca)
			li_row = dw_1.insertrow(0)
			ll_value = round(ldb_value, 0)
			dw_1.setitem(li_row, 'a', ll_value)
			ll_get = dw_1.getitemnumber(li_row, 'a')
			ls_temp = string(ll_get)
			
			if ls_temp = '0' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "display as -0 in datawindow.", lbn_flag)
			
		case lower("bugid33010")
			//GetNextModified error .
			integer li_get
			dw_1.dataobject = 'd_dept33404'
			dw_1.settransobject(sqlca)
			dw_1.retrieve()
			li_get = dw_1.GetNextModified(dw_1.rowcount() + 1 , primary!)
			
			if li_get = 0 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "GetNextModified error .", lbn_flag)
			
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_web_bugtrack2014_1.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_apb_web_bugtrack2014_1.destroy
call super::destroy
destroy(this.dw_1)
end on

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator

if FileExists(ls_filepath+"33874.jpg") then
	FileDelete(ls_filepath+"33874.jpg")
end if

if FileExists(ls_filepath+"33768.csv") then
	FileDelete(ls_filepath+"33768.csv")
end if
end event

type dw_1 from datawindow within w_apb_web_bugtrack2014_1
integer x = 261
integer y = 100
integer width = 521
integer height = 400
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

