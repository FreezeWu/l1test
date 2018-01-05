$PBExportHeader$w_runtime_datebug.srw
forward
global type w_runtime_datebug from w_base
end type
type cb_3 from commandbutton within w_runtime_datebug
end type
type dw_1 from datawindow within w_runtime_datebug
end type
type cb_2 from commandbutton within w_runtime_datebug
end type
type cb_1 from commandbutton within w_runtime_datebug
end type
end forward

global type w_runtime_datebug from w_base
string title = "Runtime Bug"
cb_3 cb_3
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_runtime_datebug w_runtime_datebug

on w_runtime_datebug.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
end on

on w_runtime_datebug.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event ue_execute;call super::ue_execute;
choose case as_testcasename 
	case 'RB_ISQL_DateTime'
		cb_1.triggerevent( clicked!)
	case 'RB_Mobile_Date'
		cb_2.triggerevent( clicked!)
	case 'RB_Today'
		cb_3.triggerevent( clicked!)
end choose

close(this)
end event

event ue_preopen;call super::ue_preopen;//execute immediate "drop TABLE DateTime_nul";
		String strSql
		Long 	li_sqlcode
		
		execute immediate "drop TABLE DateTime_bug";
		
		strSql = "CREATE TABLE DateTime_bug (empl_id float NOT NULL DEFAULT NULL,  expired_date datetime DEFAULT NULL,bug_date datetime DEFAULT NULL, bug_time datetime DEFAULT NULL,bug_datetime datetime DEFAULT NULL, PRIMARY KEY (empl_id))"
		execute immediate :strSql;
		if sqlca.sqlcode<>0 then
//			a_msg+="Create table fail. sqlca.sqlcode="+string(sqlca.sqlcode)+", sqlca.sqlerrtext="+sqlca.sqlerrtext
			li_sqlcode=sqlca.sqlcode
			rollback;
		else
			commit;
		end if
		
		if li_sqlcode=0 then
			strSql = "INSERT INTO DateTime_bug VALUES ( 16,null,'2015-03-19 12:13:14','2015-03-19 12:13:14','2015-03-19 12:13:14' ) "
			execute immediate :strSql;
			if sqlca.sqlcode<>0 then
//				a_msg+="Insert first row fail. sqlca.sqlcode="+string(sqlca.sqlcode)+", sqlca.sqlerrtext="+sqlca.sqlerrtext
				li_sqlcode=sqlca.sqlcode
				rollback;
			else
				commit;
			end if
		end if
end event

type cb_3 from commandbutton within w_runtime_datebug
integer x = 78
integer y = 332
integer width = 869
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Today bug"
end type

event clicked;string  ls_result

Date 			ld_today, ld_date
DateTime 	ldt_date
Time 			lt_time


//bug33478
ls_result += "date(today()) = "+ string(date(today())) +"~r~n"	
ls_result += "Isdate(string(today())) = " + string(Isdate(string(today()))) +"~r~n"	

//bug33405
ls_result += "string(today(),'yyyy-mm-dd hh:mm:ss') = "+ string(today(),'yyyy-mm-dd hh:mm:ss') +"~r~n"	

dw_1.SetItem ( 1, 'testdatetime', today()) 
ldt_date = dw_1.GetItemDateTime ( 1, 'testdatetime' )
ls_result += "SetItem(1,'datetime', today()) = "+ string(ldt_date) +"~r~n"	

dw_1.SetItem ( 1, 'testdate', today()) 
ld_date = dw_1.GetItemDate ( 1, 'testdate' )
ls_result += "SetItem(1,'date', today()) = "+ string(ld_date) +"~r~n"	

dw_1.SetItem ( 1, 'testtime', today()) 
lt_time = dw_1.GetItemTime ( 1, 'testtime' )
ls_result += "SetItem(1,'time', today()) = "+ string(lt_time) +"~r~n"	



gf_returnresult(ls_result)
end event

type dw_1 from datawindow within w_runtime_datebug
integer x = 1070
integer y = 68
integer width = 1495
integer height = 424
integer taborder = 20
string title = "none"
string dataobject = "d_test_datetime"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_runtime_datebug
integer x = 78
integer y = 228
integer width = 869
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = " Data bug"
end type

event clicked;string  ls_result

Date ld_today, ld_date
DateTime 	ldt_date
Time 			lt_time
//bug34148
ld_today = Date('19-03-2015') // Not Support in Mobile App
ls_result += "Date('19-03-2015') = "+ string(ld_today,'yyyy-mm-dd') +"~r~n"	

ld_today = Date('2015-03-19') 
ls_result += "Date('2015-03-19')  = "+ string(ld_today,'yyyy-mm-dd') +"~r~n"	

ld_today = Date('03-19-2015') // Not Support in Mobile App
ls_result += "Date('03-19-2015') = "+ string(ld_today,'yyyy-mm-dd') +"~r~n"	


ld_today = Date('19-mar-2015') // Not Support in Mobile App
ls_result += "Date('19-mar-2015') = "+ string(ld_today,'yyyy-mm-dd') +"~r~n"	

dw_1.SetItem ( 1, 'testdate', ld_today) //bug34313
ld_date = dw_1.GetItemDate( 1, 'testdate' )
ls_result += "SetItem(1,'date','19-mar-2015') = "+ string(ld_date,'yyyy-mm-dd') +"~r~n"	

ld_today = Date('2015-mar-19')
ls_result += "Date('2015-mar-19') = "+ string(ld_today,'yyyy-mm-dd') +"~r~n"	

dw_1.SetItem ( 1, 'testdate', ld_today) //bug34313
ld_date = dw_1.GetItemDate( 1, 'testdate' )
ls_result += "SetItem(1,'date','2015-mar-19') = "+ string(ld_date,'yyyy-mm-dd') +"~r~n"	

////bug33478
//ls_result += "date(today()) = "+ string(date(today())) +"~r~n"	
//ls_result += "Isdate(string(today())) = " + string(Isdate(string(today()))) +"~r~n"	
//
////bug33405
//ls_result += "string(today(),'yyyy-mm-dd hh:mm:ss') = "+ string(today(),'yyyy-mm-dd hh:mm:ss') +"~r~n"	
//
//dw_1.SetItem ( 1, 'testdatetime', today()) 
//ldt_date = dw_1.GetItemDateTime ( 1, 'testdatetime' )
//ls_result += "SetItem(1,'datetime', today()) = "+ string(ldt_date) +"~r~n"	
//
//dw_1.SetItem ( 1, 'testdate', today()) 
//ld_date = dw_1.GetItemDate ( 1, 'testdate' )
//ls_result += "SetItem(1,'date', today()) = "+ string(ld_date) +"~r~n"	
//
//dw_1.SetItem ( 1, 'testtime', today()) 
//lt_time = dw_1.GetItemTime ( 1, 'testtime' )
//ls_result += "SetItem(1,'time', today()) = "+ string(lt_time) +"~r~n"	

Datastore 	lds_data

lds_data = Create DataStore
lds_data.DataObject = 'ds_test_datetime'
lds_data.SetTransObject ( SQLCA )
lds_data.Retrieve()

ld_today = Date('2016-03-19') 
If lds_data.RowCount () > 0 Then
	lds_data.SetItem ( 1, 'bug_datetime',ld_today )
	lds_data.Update()
	lds_data.Retrieve()
	if lds_data.RowCount() > 0 Then
		ldt_date = lds_Data.GetItemDateTime( 1, 'bug_datetime' )
		ls_result += "DataStore datetime Save Date('2016-03-19') = "+ string(ldt_date,'yyyy-MM-dd hh:mm:ss') +"~r~n"	
	End If
End If

If IsValid ( lds_data ) Then DesTroy ( lds_data )

gf_returnresult(ls_result)
end event

type cb_1 from commandbutton within w_runtime_datebug
integer x = 78
integer y = 124
integer width = 869
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ESQL_DateTime_bug"
end type

event clicked;string  ls_result

//ESQL_DateTime_null(bug34466)
Datetime ldt_expired_date
Long ll_user
Date  		ld_date
Time  		lt_time
DateTime		ldt_datetime

setnull(ldt_expired_date)

SELECT	empl_id,
			expired_date,
			bug_date,
			bug_time,
			bug_datetime
INTO		:ll_user,
			:ldt_expired_date,
			:ld_date,
			:lt_time,
			:ldt_datetime
FROM 	DateTime_bug
WHERE	empl_id = 16 ;

if isnull(ldt_expired_date) then
	ls_result += "ISQL Select INTO DateTime(Null) = "+"NULL"+"~r~n"	
else
	ls_result += "ISQL Select INTO DateTime(Null) = "+"Not NULL"+"~r~n"
end if

ls_result += "ISQL Select INTO Date(2015-03-19 12:13:14) = "+ string ( ld_date,'yyyy-mm-dd') +"~r~n"
ls_result += "ISQL Select INTO Time(2015-03-19 12:13:14) = "+ string ( lt_time,'hh:mm:ss') +"~r~n"
ls_result += "ISQL Select INTO DateTime(2015-03-19 12:13:14) = "+ string ( ldt_datetime,'yyyy-MM-dd hh:mm:ss') +"~r~n"



gf_returnresult(ls_result)
end event

