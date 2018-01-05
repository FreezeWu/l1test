$PBExportHeader$w_pipeline170303.srw
forward
global type w_pipeline170303 from w_base_case
end type
type cb_0 from commandbutton within w_pipeline170303
end type
type cb_reset from commandbutton within w_pipeline170303
end type
type cb_cancel from commandbutton within w_pipeline170303
end type
type cb_repair from commandbutton within w_pipeline170303
end type
type cb_1 from commandbutton within w_pipeline170303
end type
type dw_dept from datawindow within w_pipeline170303
end type
type st_10 from statictext within w_pipeline170303
end type
type st_time from statictext within w_pipeline170303
end type
type st_5 from statictext within w_pipeline170303
end type
type st_6 from statictext within w_pipeline170303
end type
type dw_errors from datawindow within w_pipeline170303
end type
type st_1 from statictext within w_pipeline170303
end type
type st_2 from statictext within w_pipeline170303
end type
type st_3 from statictext within w_pipeline170303
end type
type st_4 from statictext within w_pipeline170303
end type
type st_read from statictext within w_pipeline170303
end type
type st_written from statictext within w_pipeline170303
end type
type st_errors from statictext within w_pipeline170303
end type
type st_7 from statictext within w_pipeline170303
end type
type st_8 from statictext within w_pipeline170303
end type
type st_9 from statictext within w_pipeline170303
end type
type dw_transaction from datawindow within w_pipeline170303
end type
type dw_master from datawindow within w_pipeline170303
end type
end forward

global type w_pipeline170303 from w_base_case
integer width = 3109
integer height = 1816
cb_0 cb_0
cb_reset cb_reset
cb_cancel cb_cancel
cb_repair cb_repair
cb_1 cb_1
dw_dept dw_dept
st_10 st_10
st_time st_time
st_5 st_5
st_6 st_6
dw_errors dw_errors
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_read st_read
st_written st_written
st_errors st_errors
st_7 st_7
st_8 st_8
st_9 st_9
dw_transaction dw_transaction
dw_master dw_master
end type
global w_pipeline170303 w_pipeline170303

type variables
Transaction i_src, i_dst
p_pipe_wmeter170303 i_pipe
end variables

forward prototypes
public subroutine wf_connect_db ()
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
end prototypes

public subroutine wf_connect_db ();//wf_connect_db

//create transactions and connect to the database


//i_src will be the source transaction
i_src = create transaction

i_src.dbms   = sqlca.dbms
i_src.database = sqlca.database
i_src.userid   = sqlca.userid
i_src.dbpass = sqlca.dbpass
i_src.logid  = sqlca.logid
i_src.logpass  = sqlca.logpass
i_src.servername   = sqlca.servername
i_src.dbparm = sqlca.dbparm
connect using i_src;
If i_src.sqlcode <> 0 then 
	
	is_resultlog +=wf_result_add( "wf_connect_db()", "i_src Source Connect Err:" + i_src.sqlerrtext, False)
	//Return
End If

//i_src will be the destination transaction
i_dst = create transaction

i_dst.dbms   = sqlca.dbms
i_dst.database = sqlca.database
i_dst.userid   = sqlca.userid
i_dst.dbpass = sqlca.dbpass
i_dst.logid  = sqlca.logid
i_dst.logpass  = sqlca.logpass
i_dst.servername   = sqlca.servername
i_dst.dbparm = sqlca.dbparm

connect using i_dst;
If i_dst.sqlcode <> 0 then 
	is_resultlog +=wf_result_add( "wf_connect_db()", "i_dst Source Connect Err:" + i_dst.sqlerrtext, False)
End If

end subroutine

public subroutine of_testcase_point_module ();///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ue_postopen script for w_pipeline
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
long li_rc



//create a instance scope pipeline and set its output objects
//the output objects will allow you to monitor the status during the pipeline 
//execution
i_pipe = create p_pipe_wmeter170303
i_pipe.st_read    = st_read
i_pipe.st_written = st_written
i_pipe.st_errors  = st_errors

//pipe object to do the transaction to master updates
i_pipe.dataobject = "p_emp_master_transaction_update170303"

//this function will create the tables necessary for the example
//and load the datawindow monitors views.
p_pipe_wometer170303 lp_setup
lp_setup = create p_pipe_wometer170303


//create / reset master table
//this assigns the pipeline object that was created in the pipeline painter to the local
//instance of the pipe object. The struture and data for this table is the employee table 
//in the example database.
lp_setup.dataobject = "p_emp_master_create170303" 

li_rc = lp_setup.Start(i_src, i_dst, dw_errors)
If li_RC <> 1 Then
	is_resultlog += wf_result_add("testcasepoint1",  "Execute the pipe:p_emp_master_create170303  to create master Table error, Error return code:" + string(li_rc), False)
else
	is_resultlog += wf_result_add("testcasepoint1",  "Execute the pipe:p_emp_master_create170303  to create master Table", True)
End if


commit using i_src;
commit using i_dst;

//is_resultlog += wf_result_add("testcasepoint1",  "Execute the pipe:p_emp_master_create170303 has Error rows:"+ st_errors.text, st_errors.text = "0")
is_resultlog += wf_result_add("testcasepoint1",  "Execute the pipe:p_emp_master_create170303", st_errors.text = "0")

//加上外键约束在sqlserver上通不过，因为dept_id=401在department不存在
//create a foreign key between employee master and dept table
//this will allow us to simulate an error during the update of the example
Choose Case Left(Lower(i_src.dbms), 3)
	Case "syb"
		Execute Immediate "EXEC sp_foreignkey emp_pipe_master, department, dept_id" Using i_dst;
	Case "odb"
//		Execute Immediate "ALTER TABLE ~"dba~".~"department~" DELETE FOREIGN KEY ~"fk1~"" Using i_dst;
//		Execute Immediate "ALTER TABLE ~"dba~".~"department~" ADD FOREIGN KEY ~"fk1~"(~"dept_id~") REFERENCES ~"dba~".~"employee~""
//		Using i_dst;
	Case Else
		i_dst.AutoCommit = TRUE
		Execute Immediate "Alter table emp_pipe_master add constraint fk1_ep_master foreign key (dept_id) references department (dept_id)"
		Using i_dst;
		i_dst.AutoCommit = FALSE
End Choose

If i_dst.SQLCode <> 0 then 

	is_resultlog += wf_result_add("testcasepoint1", "Execute sql error, Error return code:" + i_dst.SQLErrText, False)
else

	is_resultlog += wf_result_add("testcasepoint1", "Execute" , True)
End If


//load dw of master data
dw_master.settransobject(i_dst)
dw_master.retrieve()


is_resultlog += wf_result_add("testcasepoint1", "dw_master retrieved" + i_dst.SQLErrText,  dw_master.rowcount() > 0)

//create / reset transaction table
//this assigns the pipeline object that was created in the pipeline painter to the local
//instance of the pipe object. The structure for this is the employee table in the example
//database. Note:The data to populate the transaction table is stored in the pipeline 
//object itself.
lp_setup.dataobject = "p_emp_transaction_create170303"
li_rc = lp_setup.Start(i_src,i_dst,dw_errors)

If li_RC <> 1 Then
	is_resultlog += wf_result_add("testcasepoint1", "Execute the pipe:p_emp_transaction_create170303 error, Error return code:" + string(li_rc), False)
else
	is_resultlog += wf_result_add("testcasepoint1", "Execute the pipe:p_emp_transaction_create170303", True)
End if

commit using i_src;
commit using i_dst;
destroy lp_setup


//is_resultlog += wf_result_add("testcasepoint1", "Execute the pipe:p_emp_transaction_create170303 has Error rows:"+ st_errors.text, st_errors.text = "0")
is_resultlog += wf_result_add("testcasepoint1", "Execute the pipe:p_emp_transaction_create170303, no errors", st_errors.text = "0")

//load transactions datawindow with new table contents.
dw_transaction.settransobject(i_dst)
dw_transaction.retrieve()


is_resultlog += wf_result_add("testcasepoint1", "dw_transaction retrieved", dw_transaction.rowcount() > 0)

//valid choices of departments for the transaction file
dw_dept.settransobject(i_dst)
dw_dept.retrieve()

is_resultlog += wf_result_add("testcasepoint1", "dw_dept retrieved", dw_dept.rowcount() > 0)


end subroutine

public subroutine of_testcase_point_module1 ();//////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_execute
//////////////////////////////////////////////////////////////////////////////////////////////////////////

int 		li_rc 
int 		li_dept, li_id
long  	ll_selectrow, ll_selected_row, ll_find_row, ll_row
long 	ll_stime, ll_etime

//This script will execute the pipeline update for whichever department is 
//highlighted.



//find out which dept is selected to update. if no dept is selected, don't do an update

ll_selectrow = dw_dept.GetSelectedRow(0)
If ll_selectrow = 0 Then //自动操作
	ll_row = 1
	do while ll_row < 4
		
		dw_dept.SelectRow(0, false)
		dw_dept.selectrow(ll_row, true)
		ll_selectrow = dw_dept.GetSelectedRow(0)
		If ll_selectrow > 0 Then
			li_dept = dw_dept.object.department_dept_id[ll_selectrow]
		Else
			is_resultlog = is_resultlog + "can not get department row, Fail!~r~n"
		End IF
	
		//get time for a total elapsed time
		ll_stime = Cpu ()
		
		//execute pipeline using the dept selected as a parameter. This pipeline is setup
		//to only update whichever dept is passed to it
		// 由于li_dept =401 在department不存在，而.emp_pipe_master加dept_id外键约束，导致有一条记录在sqlserver更改失败，但在asa中更新没有问题.
		dw_errors.reset()
		li_rc = i_pipe.start (i_src, i_dst, dw_errors,li_dept)
		//get ending time
		ll_etime = Cpu ()
		st_time.text = string((ll_etime - ll_stime)/1000,"##0.0") + " secs"
		If li_RC <> 1 Then
			is_resultlog += wf_result_add("testcasepoint2", "Execute the pipe:p_emp_master_transaction_update170303, Row:"+string(ll_row)+" error, Error return code:" + string(li_rc), False)
		else
			is_resultlog += wf_result_add("testcasepoint2", "Execute the pipe:p_emp_master_transaction_update170303, Row:"+string(ll_row), true)
		End if
			
		if li_dept  = 401 then	
			//is_resultlog += wf_result_add("testcasepoint2", "Execute the pipe:p_emp_master_transaction_update170303 has Error rows:"+ st_errors.text, st_errors.text <> "0")
			is_resultlog += wf_result_add("testcasepoint2", "Execute the pipe:p_emp_master_transaction_update170303, Row:"+string(ll_row) +",errors:" + st_errors.text , st_errors.text <> "0")
			
		else
			is_resultlog += wf_result_add("testcasepoint2", "Execute the pipe:p_emp_master_transaction_update170303, Row:"+string(ll_row) +",no errors", st_errors.text = "0")	
		end if
		
		commit using i_src;
		commit using i_dst;
		ll_row = ll_row + 1
	loop
else //手动选择
	//get time for a total elapsed time
		li_dept = dw_dept.object.department_dept_id[ll_selectrow]
		dw_errors.reset()
		ll_stime = Cpu ()		
		//execute pipeline using the dept selected as a parameter. This pipeline is setup
		//to only update whichever dept is passed to it
		// 由于li_dept =401 在department不存在，而.emp_pipe_master加dept_id外键约束，导致有一条记录在sqlserver更改失败，但在asa中更新没有问题.
	
		li_rc = i_pipe.start (i_src, i_dst, dw_errors,li_dept)
		//get ending time
		ll_etime = Cpu ()
		st_time.text = string((ll_etime - ll_stime)/1000,"##0.0") + " secs"
		If li_RC <> 1 Then
			is_resultlog += wf_result_add("testcasepoint2", "Execute the pipe:p_emp_master_transaction_update170303 error, Error return code:" + string(li_rc), False)
		else
			is_resultlog += wf_result_add("testcasepoint2",  "Execute the pipe:p_emp_master_transaction_update170303", True)
		End if
			
		if li_dept  = 401 then	
			//is_resultlog += wf_result_add("testcasepoint2",  "Execute the pipe:p_emp_master_transaction_update170303 has Error rows:"+ st_errors.text, st_errors.text <> "0")
			is_resultlog += wf_result_add("testcasepoint2",  "Execute the pipe:p_emp_master_transaction_update170303", st_errors.text <> "0")
		else
			//is_resultlog += wf_result_add("testcasepoint2",  "Execute the pipe:p_emp_master_transaction_update170303 has Error rows:"+ st_errors.text, st_errors.text = "0")
			is_resultlog += wf_result_add("testcasepoint2",  "Execute the pipe:p_emp_master_transaction_update170303", st_errors.text = "0")	
		end if
		
		commit using i_src;
		commit using i_dst;
end if


//retrieve from master table to show changes
dw_master.SetRedraw(false)
dw_master.retrieve()

is_resultlog = is_resultlog + wf_result_add("testcasepoint2", "dw_master return resords", dw_master.rowcount() > 0)



//If user had selected a row in the transaction datawindow to find in the master datawindow
//Reissue the find to highlight the row again after the pipe execution has completed.

ll_selected_row = dw_transaction.GetSelectedRow(0)
If ll_selected_row > 0 Then
	dw_transaction.selectrow(0,False)
	dw_transaction.selectrow(ll_selected_row,True)
	li_id = dw_transaction.object.emp_id[ll_selected_row]
	ll_find_row = dw_master.Find( 'emp_id' + '=' + string(li_id),0,dw_master.RowCount())
	If ll_find_row > 0 Then 
		dw_master.ScrollToRow(ll_find_row)
		dw_master.SelectRow(0,False)
		dw_master.SelectRow(ll_find_row,True)
	End If
End If

dw_master.SetRedraw(true)


end subroutine

public subroutine of_testcase_point_module2 ();//////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_repair
//////////////////////////////////////////////////////////////////////////////////////////////////////////
long ll_rc

//this is the function to grab any changes to the error datawindow (Dw_1) and
//try to commit the changes again.
ll_rc = i_pipe.repair (i_dst)

If ll_rc <> 1 Then
	is_resultlog += wf_result_add("testcasepoint3", "the pipe:p_emp_master_transaction_update170303 repair error, Error return code:" + string(ll_rc), False)
else
	is_resultlog += wf_result_add("testcasepoint3", "the pipe:p_emp_master_transaction_update170303 repair", True)
End if

//update the master table in case some errors were corrected.
dw_master.retrieve()

is_resultlog += wf_result_add("testcasepoint3", "dw_master retrieved", dw_master.rowcount() > 0)

end subroutine

public subroutine of_testcase_point_module3 ();//////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_cancel
//////////////////////////////////////////////////////////////////////////////////////////////////////////
long ll_rc

//pipeline function to cancel the pipeline in execution.
ll_rc = i_pipe.cancel ()

If ll_rc <> 1 Then
	is_resultlog += wf_result_add("testcasepoint4",  "the pipe:p_emp_master_transaction_update170303 cancel error, Error return code:" + string(ll_rc), False)
else
	is_resultlog += wf_result_add("testcasepoint4",  "the pipe:p_emp_master_transaction_update170303 cancel", True)
End if

dw_master.retrieve()

is_resultlog += wf_result_add("testcasepoint4",  "dw_master retrieved", dw_master.rowcount() > 0)
end subroutine

on w_pipeline170303.create
int iCurrent
call super::create
this.cb_0=create cb_0
this.cb_reset=create cb_reset
this.cb_cancel=create cb_cancel
this.cb_repair=create cb_repair
this.cb_1=create cb_1
this.dw_dept=create dw_dept
this.st_10=create st_10
this.st_time=create st_time
this.st_5=create st_5
this.st_6=create st_6
this.dw_errors=create dw_errors
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_read=create st_read
this.st_written=create st_written
this.st_errors=create st_errors
this.st_7=create st_7
this.st_8=create st_8
this.st_9=create st_9
this.dw_transaction=create dw_transaction
this.dw_master=create dw_master
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_0
this.Control[iCurrent+2]=this.cb_reset
this.Control[iCurrent+3]=this.cb_cancel
this.Control[iCurrent+4]=this.cb_repair
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.dw_dept
this.Control[iCurrent+7]=this.st_10
this.Control[iCurrent+8]=this.st_time
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.st_6
this.Control[iCurrent+11]=this.dw_errors
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.st_4
this.Control[iCurrent+16]=this.st_read
this.Control[iCurrent+17]=this.st_written
this.Control[iCurrent+18]=this.st_errors
this.Control[iCurrent+19]=this.st_7
this.Control[iCurrent+20]=this.st_8
this.Control[iCurrent+21]=this.st_9
this.Control[iCurrent+22]=this.dw_transaction
this.Control[iCurrent+23]=this.dw_master
end on

on w_pipeline170303.destroy
call super::destroy
destroy(this.cb_0)
destroy(this.cb_reset)
destroy(this.cb_cancel)
destroy(this.cb_repair)
destroy(this.cb_1)
destroy(this.dw_dept)
destroy(this.st_10)
destroy(this.st_time)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.dw_errors)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_read)
destroy(this.st_written)
destroy(this.st_errors)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.dw_transaction)
destroy(this.dw_master)
end on

event ue_cleantempfile;call super::ue_cleantempfile;//using the Execute Immediate delete the two tables created


i_dst.AutoCommit = TRUE
Execute Immediate "DROP TABLE emp_pipe_master" Using i_dst;
If i_dst.SQLCode <> 0 then 
	//MessageBox("Error","Could not drop the emp_pipe_master table");
	is_resultlog +=wf_result_add("ue_cleantempfile()", "Could not DROP TABLE emp_pipe_master.  Error:  " + &
							String(i_dst.SQLDBCode) + " - " + i_dst.SQLErrText, False)
End If

Execute Immediate "DROP TABLE emp_pipe_transaction" Using i_dst;
If i_dst.SQLCode <> 0 then 
	//MessageBox("Error","Could not drop the emp_pipe_transaction table");
	is_resultlog +=wf_result_add("ue_cleantempfile()", "Could not DROP TABLE emp_pipe_transaction.  Error:  " + &
							String(i_dst.SQLDBCode) + " - " + i_dst.SQLErrText, False)
End If

i_dst.AutoCommit = FALSE


end event

event close;call super::close;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// close script for w_pipeline
///////////////////////////////////////////////////////////////////////////////////////////////////////////////


//delete tables created during the example

//commit any prior transactions that may have taken place that would
//prevent a delete from being successful.
commit using i_dst;
commit using i_src;
//commit using sqlca;


//close pipeline transactions
disconnect using i_src;
disconnect using i_dst;


//free space from the creations
destroy i_pipe
destroy i_src
destroy i_dst




end event

event ue_preopen;call super::ue_preopen;//function to connect to source & destination transactions to the database
wf_connect_db()
end event

type cb_0 from commandbutton within w_pipeline170303
integer x = 2427
integer y = 1132
integer width = 430
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "1.E&xecute Pipe"
boolean default = true
end type

event clicked;of_testcase_point_module()
end event

type cb_reset from commandbutton within w_pipeline170303
integer x = 1147
integer y = 1252
integer width = 416
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Re&set Example"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_reset
//////////////////////////////////////////////////////////////////////////////////////////////////////////


//Commit any pending transactions 
Commit using i_dst;
Commit using i_src;
Commit using sqlca;

//call function to reset database tables.
//wf_reset_window()
end event

type cb_cancel from commandbutton within w_pipeline170303
integer x = 2427
integer y = 1480
integer width = 430
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "4.C&ancel Pipe"
end type

event clicked;of_testcase_point_module3()
end event

type cb_repair from commandbutton within w_pipeline170303
integer x = 2427
integer y = 1364
integer width = 430
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "3.&Repair Pipe"
end type

event clicked;of_testcase_point_module2()
end event

type cb_1 from commandbutton within w_pipeline170303
integer x = 2427
integer y = 1248
integer width = 430
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "2.E&xecute Pipe"
boolean default = true
end type

event clicked;of_testcase_point_module1()
end event

type dw_dept from datawindow within w_pipeline170303
integer x = 402
integer y = 1272
integer width = 430
integer height = 396
integer taborder = 20
string dataobject = "d_pipe_deptlist170303"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for dw_dept
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Highlight the clicked row
If row > 0 Then
	dw_dept.selectrow(0,False)
	dw_dept.selectrow(row,True)
End If
end event

type st_10 from statictext within w_pipeline170303
integer x = 41
integer y = 1272
integer width = 366
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Dept to Update:"
boolean focusrectangle = false
end type

type st_time from statictext within w_pipeline170303
integer x = 1769
integer y = 1108
integer width = 151
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_pipeline170303
integer x = 1550
integer y = 1108
integer width = 192
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Time:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_pipeline170303
integer x = 1934
integer y = 1108
integer width = 192
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "secs."
boolean focusrectangle = false
end type

type dw_errors from datawindow within w_pipeline170303
integer x = 416
integer y = 864
integer width = 2414
integer height = 188
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_pipeline170303
integer x = 59
integer y = 944
integer width = 357
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Pipeline Errors:"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_2 from statictext within w_pipeline170303
integer x = 87
integer y = 1108
integer width = 297
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Rows Read:"
alignment alignment = right!
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_3 from statictext within w_pipeline170303
integer x = 567
integer y = 1108
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Rows Written:"
alignment alignment = right!
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_4 from statictext within w_pipeline170303
integer x = 1088
integer y = 1108
integer width = 201
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Errors:"
alignment alignment = right!
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_read from statictext within w_pipeline170303
integer x = 407
integer y = 1104
integer width = 151
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean border = true
long bordercolor = 8388608
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_written from statictext within w_pipeline170303
integer x = 919
integer y = 1104
integer width = 151
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean border = true
long bordercolor = 8388608
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_errors from statictext within w_pipeline170303
integer x = 1303
integer y = 1104
integer width = 151
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean border = true
long bordercolor = 8388608
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within w_pipeline170303
integer x = 539
integer y = 20
integer width = 869
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "--------------------------------------------->"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_pipeline170303
integer x = 37
integer y = 20
integer width = 503
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Transaction Table: "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_9 from statictext within w_pipeline170303
integer x = 1440
integer y = 20
integer width = 366
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Master Table:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_transaction from datawindow within w_pipeline170303
integer x = 37
integer y = 96
integer width = 1362
integer height = 752
integer taborder = 10
string dataobject = "d_employee_transaction170303"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for dw_transaction
///////////////////////////////////////////////////////////////////////////////////////////////////////////////


long	ll_find_row
int	li_trans_id, &
		li_master_id


//If you click on an employee  in the transaction dw, 
//find that same employee on the master dw

If row > 0 Then
	this.selectrow(0,False)
	this.selectrow(row,True)
	dw_master.SelectRow(0,False)
	li_trans_id = this.object.emp_id[row]
	ll_find_row = dw_master.Find( 'emp_id' + '=' + string(li_trans_id),0,dw_master.RowCount())
	If ll_find_row > 0 Then 
		li_master_id = dw_master.object.emp_id[ll_find_row]
		If li_trans_id = li_master_id Then
			dw_master.ScrollToRow(ll_find_row)
			dw_master.SelectRow(ll_find_row, True)
		End If
	End If
End If
end event

type dw_master from datawindow within w_pipeline170303
integer x = 1445
integer y = 96
integer width = 1362
integer height = 752
integer taborder = 20
string dataobject = "d_employee_master170303"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

