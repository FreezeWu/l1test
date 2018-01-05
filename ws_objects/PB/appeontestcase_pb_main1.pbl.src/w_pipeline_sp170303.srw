$PBExportHeader$w_pipeline_sp170303.srw
forward
global type w_pipeline_sp170303 from w_base_case
end type
type cb_execute2 from commandbutton within w_pipeline_sp170303
end type
type rb_query from radiobutton within w_pipeline_sp170303
end type
type rb_sp from radiobutton within w_pipeline_sp170303
end type
type st_time from statictext within w_pipeline_sp170303
end type
type st_5 from statictext within w_pipeline_sp170303
end type
type st_6 from statictext within w_pipeline_sp170303
end type
type cb_execute from commandbutton within w_pipeline_sp170303
end type
type dw_result from datawindow within w_pipeline_sp170303
end type
type dw_errors from datawindow within w_pipeline_sp170303
end type
type st_1 from statictext within w_pipeline_sp170303
end type
type st_2 from statictext within w_pipeline_sp170303
end type
type st_3 from statictext within w_pipeline_sp170303
end type
type st_4 from statictext within w_pipeline_sp170303
end type
type st_read from statictext within w_pipeline_sp170303
end type
type st_written from statictext within w_pipeline_sp170303
end type
type st_errors from statictext within w_pipeline_sp170303
end type
type gb_1 from groupbox within w_pipeline_sp170303
end type
end forward

global type w_pipeline_sp170303 from w_base_case
integer width = 3031
integer height = 1896
cb_execute2 cb_execute2
rb_query rb_query
rb_sp rb_sp
st_time st_time
st_5 st_5
st_6 st_6
cb_execute cb_execute
dw_result dw_result
dw_errors dw_errors
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_read st_read
st_written st_written
st_errors st_errors
gb_1 gb_1
end type
global w_pipeline_sp170303 w_pipeline_sp170303

type variables

end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
end prototypes

public subroutine of_testcase_point_module ();Integer			li_RC
Long				ll_Start, ll_End, ll_count, ll_count_2
Transaction	lt_Source
p_pipe_wmeter170303	lp_Create



dw_result.Reset()

// lt_Source will be the source transaction, sqlca is the destination.
lt_Source = CREATE Transaction

lt_Source.dbms   = sqlca.dbms
lt_Source.database = sqlca.database
lt_Source.userid   = sqlca.userid
lt_Source.dbpass = sqlca.dbpass
lt_Source.logid  = sqlca.logid
lt_Source.logpass  = sqlca.logpass
lt_Source.servername   = sqlca.servername
lt_Source.dbparm = sqlca.dbparm

Connect using lt_Source;
If lt_Source.sqlcode <> 0 Then 
	is_resultlog = is_resultlog + "Source Connect Err:" + lt_Source.sqlerrtext + "Fail!~r~n"
End If

// Create the local pipeline object to create the new table.
lp_Create = CREATE p_pipe_wmeter170303
lp_Create.st_read = st_read
lp_Create.st_written = st_written
lp_Create.st_errors = st_errors


// Set the data object based on the radio button checked.
lp_Create.DataObject = "p_create_full_sales_orders170303" 
//If rb_query.Checked Then
//	lp_Create.DataObject = "p_create_full_sales_orders170303" 
//Else
//	lp_Create.DataObject = "p_create_full_sales_orders_sp170303" 
//End If
//
// Execute the pipe.
// Get the time for a total elapsed time.
ll_Start = CPU()

li_RC = lp_Create.Start(lt_Source, sqlca, dw_errors)

// Get the ending time.
ll_End = CPU()
st_time.Text = String((ll_End - ll_Start)/1000,"##0.0")

If li_RC <> 1 Then
	is_resultlog += wf_result_add("testcasepoint1", "Execute the pipe:p_create_full_sales_orders170303  to create New Table error, Error return code:" + lt_Source.sqlerrtext, False)

else
	is_resultlog += wf_result_add("testcasepoint1", "Execute the pipe:p_create_full_sales_orders170303  to create New Table", True)
End if

Commit;

DESTROY lp_Create

Disconnect Using lt_Source;
DESTROY lt_Source

dw_result.Retrieve()

//compare result again
ll_count = dw_result.Retrieve()
select count(1) into :ll_count_2  from full_sales_orders;
//is_resultlog += wf_result_add("testcasepoint1", "The sales_orders table has "+ string(ll_count) +" rows, the full_sales_orders has " + string(ll_count_2)+" rows, pipe", ll_count = ll_count_2)
is_resultlog += wf_result_add("testcasepoint1", "The sales_orders table to the full_sales_orders pipe", ll_count = ll_count_2)

//if st_read.text = "6" and st_written.text = "6"  and st_errors.text = "0"  then
//	is_resultlog = is_resultlog + "Read rows:6="+st_read.text + ",Write rows:6="+st_written.text+", Erroe rows:0="+ st_errors.text+", Successful!~r~n"
//else
//	is_resultlog = is_resultlog + "Read rows:6="+st_read.text + ",Write rows:6="+st_written.text+", Erroe rows:0="+ st_errors.text+", Fail!~r~n"
//end if
//如果执行时间过长, 给错误提示
if (ll_End - ll_Start)/1000 > 100 then 
	is_resultlog += wf_result_add("testcasepoint1", "exec time:"+ string( (ll_End - ll_Start)/1000) +"  to long , pipe", False)
else
	is_resultlog += wf_result_add("testcasepoint1", "exec time is normal , pipe", True)
end if




//is_resultlog += wf_result_add("testcasepoint1", "Read rows="+st_read.text + ",Write rows="+st_written.text+", Error rows:0="+ st_errors.text,  st_read.text = st_written.text)
//is_resultlog += wf_result_add("testcasepoint1", "Execute the pipe:p_create_full_sales_orders170303 has Error rows:"+ st_errors.text, st_errors.text = "0")

is_resultlog += wf_result_add("testcasepoint1", "Read rows and Write rows",  st_read.text = st_written.text)
is_resultlog += wf_result_add("testcasepoint1", "Execute the pipe:p_create_full_sales_orders170303", st_errors.text = "0")


Integer	li_NotExist

Choose Case Lower(Left(sqlca.DBMS, 3))
	Case "odb"
		li_NotExist = -141
	Case "syb"
		li_NotExist = 3701
	Case "syc"
		li_NotExist = 3701
	Case "ora"
		li_NotExist = 3701
End Choose

// Drop the new table if it already exists
sqlca.AutoCommit = True
Execute Immediate "DROP TABLE full_sales_orders";
If sqlca.SQLCode <> 0 Then
	If sqlca.SQLDBCode <> li_NotExist Then
		// -141 means the table did not already exist
		sqlca.AutoCommit = False
		wf_result_add("testcasepoint1", "Could not drop the new table.  Error:  " + &
							String(sqlca.SQLDBCode) + " - " + sqlca.SQLErrText, False)
	End If
End If
sqlca.AutoCommit = False

commit;

end subroutine

public subroutine of_testcase_point_module1 ();Integer			li_RC
Long				ll_Start, ll_End, ll_count, ll_count_2
Transaction	lt_Source
p_pipe_wmeter170303	lp_Create



dw_result.Reset()

// lt_Source will be the source transaction, sqlca is the destination.
lt_Source = CREATE Transaction

lt_Source.dbms   = sqlca.dbms
lt_Source.database = sqlca.database
lt_Source.userid   = sqlca.userid
lt_Source.dbpass = sqlca.dbpass
lt_Source.logid  = sqlca.logid
lt_Source.logpass  = sqlca.logpass
lt_Source.servername   = sqlca.servername
lt_Source.dbparm = sqlca.dbparm

Connect using lt_Source;
If lt_Source.sqlcode <> 0 Then 
	is_resultlog += wf_result_add("testcasepoint2", "Source Connect Err:" + lt_Source.sqlerrtext, False)
End If

// Create the local pipeline object to create the new table.
lp_Create = CREATE p_pipe_wmeter170303
lp_Create.st_read = st_read
lp_Create.st_written = st_written
lp_Create.st_errors = st_errors


// Set the data object based on the radio button checked.
lp_Create.DataObject = "p_create_full_sales_orders_sp170303" 
//If rb_query.Checked Then
//	lp_Create.DataObject = "p_create_full_sales_orders170303" 
//Else
//	lp_Create.DataObject = "p_create_full_sales_orders_sp170303" 
//End If
//
// Execute the pipe.
// Get the time for a total elapsed time.
ll_Start = CPU()

li_RC = lp_Create.Start(lt_Source, sqlca, dw_errors)

// Get the ending time.
ll_End = CPU()
st_time.Text = String((ll_End - ll_Start)/1000,"##0.0")

If li_RC <> 1 Then
	is_resultlog += wf_result_add("testcasepoint2",  "Execute the pipe:p_create_full_sales_orders_sp170303  to create New Table error, Error return code:" + lt_Source.sqlerrtext, False)
else
	is_resultlog += wf_result_add("testcasepoint2",  "Execute the pipe:p_create_full_sales_orders_sp170303  to create New Table", True)	
End if

Commit;

DESTROY lp_Create

Disconnect Using lt_Source;
DESTROY lt_Source

dw_result.Retrieve()

//compare result again
ll_count = dw_result.Retrieve()
select count(1) into :ll_count_2  from full_sales_orders;

is_resultlog += wf_result_add("testcasepoint2",  "The sales_orders table to the full_sales_orders table pipe", ll_count = ll_count_2)


//如果执行时间过长, 给错误提示
if (ll_End - ll_Start)/1000 > 100 then 
	is_resultlog += wf_result_add("testcasepoint2", "exec time:"+ string( (ll_End - ll_Start)/1000) +"  to long , pipe", False)
else
	is_resultlog += wf_result_add("testcasepoint2", "exec time is normal , pipe", True)
end if


is_resultlog += wf_result_add("testcasepoint2", "Read rows and Write rows", st_read.text = st_written.text)

is_resultlog += wf_result_add("testcasepoint2",  "Execute the pipe:p_create_full_sales_orders_sp170303 ",  st_errors.text = "0")




end subroutine

on w_pipeline_sp170303.create
int iCurrent
call super::create
this.cb_execute2=create cb_execute2
this.rb_query=create rb_query
this.rb_sp=create rb_sp
this.st_time=create st_time
this.st_5=create st_5
this.st_6=create st_6
this.cb_execute=create cb_execute
this.dw_result=create dw_result
this.dw_errors=create dw_errors
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_read=create st_read
this.st_written=create st_written
this.st_errors=create st_errors
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_execute2
this.Control[iCurrent+2]=this.rb_query
this.Control[iCurrent+3]=this.rb_sp
this.Control[iCurrent+4]=this.st_time
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.st_6
this.Control[iCurrent+7]=this.cb_execute
this.Control[iCurrent+8]=this.dw_result
this.Control[iCurrent+9]=this.dw_errors
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.st_read
this.Control[iCurrent+15]=this.st_written
this.Control[iCurrent+16]=this.st_errors
this.Control[iCurrent+17]=this.gb_1
end on

on w_pipeline_sp170303.destroy
call super::destroy
destroy(this.cb_execute2)
destroy(this.rb_query)
destroy(this.rb_sp)
destroy(this.st_time)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.cb_execute)
destroy(this.dw_result)
destroy(this.dw_errors)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_read)
destroy(this.st_written)
destroy(this.st_errors)
destroy(this.gb_1)
end on

event ue_cleantempfile;call super::ue_cleantempfile;Integer	li_NotExist

Choose Case Lower(Left(sqlca.DBMS, 3))
	Case "odb"
		li_NotExist = -141
	Case "syb"
		li_NotExist = 3701
	Case "syc"
		li_NotExist = 3701
	Case "ora"
		li_NotExist = 3701
End Choose

// Drop the new table if it already exists
sqlca.AutoCommit = True
Execute Immediate "DROP TABLE full_sales_orders";
If sqlca.SQLCode <> 0 Then
	If sqlca.SQLDBCode <> li_NotExist Then
		// -141 means the table did not already exist
		sqlca.AutoCommit = False
		wf_result_add("ue_cleantempfile","Could not drop the new table.  Error:  " + &
							String(sqlca.SQLDBCode) + " - " + sqlca.SQLErrText, False)
	End If
End If
sqlca.AutoCommit = False

commit;



end event

type cb_execute2 from commandbutton within w_pipeline_sp170303
integer x = 2217
integer y = 300
integer width = 402
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "2.Execute Pipe"
boolean default = true
end type

event clicked;of_testcase_point_module2()
end event

type rb_query from radiobutton within w_pipeline_sp170303
integer x = 142
integer y = 180
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "SQL Query"
end type

type rb_sp from radiobutton within w_pipeline_sp170303
integer x = 142
integer y = 116
integer width = 480
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Stored Procedure"
boolean checked = true
end type

type st_time from statictext within w_pipeline_sp170303
integer x = 1769
integer y = 732
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

type st_5 from statictext within w_pipeline_sp170303
integer x = 1550
integer y = 732
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

type st_6 from statictext within w_pipeline_sp170303
integer x = 1934
integer y = 732
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

type cb_execute from commandbutton within w_pipeline_sp170303
integer x = 2217
integer y = 144
integer width = 402
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "1.Execute Pipe"
boolean default = true
end type

event clicked;of_testcase_point_module()
end event

type dw_result from datawindow within w_pipeline_sp170303
integer x = 69
integer y = 856
integer width = 2862
integer height = 888
integer taborder = 20
string dataobject = "d_full_sales_orders170303"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

event constructor;This.SetTrans(sqlca)
end event

type dw_errors from datawindow within w_pipeline_sp170303
integer x = 114
integer y = 396
integer width = 1911
integer height = 276
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_pipeline_sp170303
integer x = 101
integer y = 312
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

type st_2 from statictext within w_pipeline_sp170303
integer x = 87
integer y = 732
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

type st_3 from statictext within w_pipeline_sp170303
integer x = 567
integer y = 732
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

type st_4 from statictext within w_pipeline_sp170303
integer x = 1088
integer y = 732
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

type st_read from statictext within w_pipeline_sp170303
integer x = 407
integer y = 728
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

type st_written from statictext within w_pipeline_sp170303
integer x = 919
integer y = 728
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

type st_errors from statictext within w_pipeline_sp170303
integer x = 1303
integer y = 728
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

type gb_1 from groupbox within w_pipeline_sp170303
integer x = 119
integer y = 52
integer width = 512
integer height = 224
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Data Source"
end type

