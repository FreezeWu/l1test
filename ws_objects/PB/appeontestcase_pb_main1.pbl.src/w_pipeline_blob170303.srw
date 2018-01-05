$PBExportHeader$w_pipeline_blob170303.srw
forward
global type w_pipeline_blob170303 from w_base_case
end type
type cb_execute from commandbutton within w_pipeline_blob170303
end type
type dw_result from datawindow within w_pipeline_blob170303
end type
type dw_errors from datawindow within w_pipeline_blob170303
end type
type st_1 from statictext within w_pipeline_blob170303
end type
type st_2 from statictext within w_pipeline_blob170303
end type
type st_3 from statictext within w_pipeline_blob170303
end type
type st_4 from statictext within w_pipeline_blob170303
end type
type st_read from statictext within w_pipeline_blob170303
end type
type st_written from statictext within w_pipeline_blob170303
end type
type st_errors from statictext within w_pipeline_blob170303
end type
end forward

global type w_pipeline_blob170303 from w_base_case
integer width = 2528
integer height = 1896
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
end type
global w_pipeline_blob170303 w_pipeline_blob170303

type variables
string is_class, is_module
end variables

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();Integer			li_RC
Transaction	lt_Source
p_pipe_wmeter170303	lp_Create
long ll_count, ll_count_2


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
	is_resultlog += wf_result_add("testcasepoint1", "Source Connect Err:" + lt_Source.sqlerrtext, False)
	Return
End If

// Create the local pipeline object to create the new table.
lp_Create = CREATE p_pipe_wmeter170303
lp_Create.st_read = st_read
lp_Create.st_written = st_written
lp_Create.st_errors = st_errors



lp_Create.DataObject = "p_create_ole_blob170303" 

// Execute the pipe. 
li_RC = lp_Create.Start(lt_Source, sqlca, dw_errors)

If li_RC <> 1 Then
	is_resultlog += wf_result_add("testcasepoint1", "Execute the pipe  to create New Table error, Error return code:" + lt_Source.sqlerrtext , False)
else
	is_resultlog += wf_result_add("testcasepoint1",  "Execute the pipe  to create New Table.", True)
End if

Commit;

DESTROY lp_Create

Disconnect Using lt_Source;
DESTROY lt_Source

// Retrieve data into display DataWindow
//compare result again
ll_count = dw_result.Retrieve()
select count(1) into :ll_count_2  from ole_copy;

//is_resultlog += wf_result_add("testcasepoint1", "The ole table has "+ string(ll_count) +" rows, the ole_copy has " + string(ll_count_2)+" rows, pipe", ll_count = ll_count_2)
//is_resultlog += wf_result_add("testcasepoint1",  "Read rows:6="+st_read.text + ",Write rows:6="+st_written.text+", Error rows:0="+ st_errors.text , st_read.text = "6" and st_written.text = "6"  and st_errors.text = "0" )
//
is_resultlog += wf_result_add("testcasepoint1", "The ole table  to the ole_copy pipe", ll_count = ll_count_2)
is_resultlog += wf_result_add("testcasepoint1",  "Read rows and Write rows", st_read.text = "6" and st_written.text = "6"  and st_errors.text = "0" )


Execute Immediate "DROP TABLE ole_copy";
If sqlca.SQLCode <> 0 Then
	If sqlca.SQLDBCode <> -141 Then
		// -141 means the table did not already exist
		is_resultlog += wf_result_add("testcasepoint1", "Could not drop the new table.  Error:  " + &
							String(sqlca.SQLDBCode) + " - " + sqlca.SQLErrText, False)
	End If
End If

commit;


end subroutine

on w_pipeline_blob170303.create
int iCurrent
call super::create
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
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_execute
this.Control[iCurrent+2]=this.dw_result
this.Control[iCurrent+3]=this.dw_errors
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.st_read
this.Control[iCurrent+9]=this.st_written
this.Control[iCurrent+10]=this.st_errors
end on

on w_pipeline_blob170303.destroy
call super::destroy
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
end on

type cb_execute from commandbutton within w_pipeline_blob170303
integer x = 2034
integer y = 32
integer width = 375
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

type dw_result from datawindow within w_pipeline_blob170303
integer x = 69
integer y = 480
integer width = 1911
integer height = 1264
integer taborder = 20
string dataobject = "d_ole_blob170303"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

event constructor;This.SetTrans(sqlca)
end event

type dw_errors from datawindow within w_pipeline_blob170303
integer x = 69
integer y = 184
integer width = 1911
integer height = 276
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_pipeline_blob170303
integer x = 69
integer y = 116
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

type st_2 from statictext within w_pipeline_blob170303
integer x = 229
integer y = 32
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

type st_3 from statictext within w_pipeline_blob170303
integer x = 709
integer y = 32
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

type st_4 from statictext within w_pipeline_blob170303
integer x = 1230
integer y = 32
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

type st_read from statictext within w_pipeline_blob170303
integer x = 549
integer y = 28
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

type st_written from statictext within w_pipeline_blob170303
integer x = 1061
integer y = 28
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

type st_errors from statictext within w_pipeline_blob170303
integer x = 1445
integer y = 28
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

