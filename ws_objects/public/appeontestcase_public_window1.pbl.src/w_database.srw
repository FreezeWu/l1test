$PBExportHeader$w_database.srw
forward
global type w_database from w_base
end type
type cb_15 from commandbutton within w_database
end type
type cb_14 from commandbutton within w_database
end type
type cb_13 from commandbutton within w_database
end type
type cb_12 from commandbutton within w_database
end type
type cb_11 from commandbutton within w_database
end type
type cb_10 from commandbutton within w_database
end type
type cb_9 from commandbutton within w_database
end type
type dw_2 from datawindow within w_database
end type
type dw_1 from datawindow within w_database
end type
type cb_8 from commandbutton within w_database
end type
type cb_7 from commandbutton within w_database
end type
type cb_6 from commandbutton within w_database
end type
type cb_5 from commandbutton within w_database
end type
type cb_4 from commandbutton within w_database
end type
type cb_3 from commandbutton within w_database
end type
type cb_2 from commandbutton within w_database
end type
type cb_1 from commandbutton within w_database
end type
type st_1 from statictext within w_database
end type
end forward

global type w_database from w_base
integer width = 2843
integer height = 1688
string title = "database connect Test"
cb_15 cb_15
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
dw_2 dw_2
dw_1 dw_1
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_1 st_1
end type
global w_database w_database

type variables
//string is_result
//Boolean 		ib_Retrieve, ib_Other, ib_Printpage
end variables

on w_database.create
int iCurrent
call super::create
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_15
this.Control[iCurrent+2]=this.cb_14
this.Control[iCurrent+3]=this.cb_13
this.Control[iCurrent+4]=this.cb_12
this.Control[iCurrent+5]=this.cb_11
this.Control[iCurrent+6]=this.cb_10
this.Control[iCurrent+7]=this.cb_9
this.Control[iCurrent+8]=this.dw_2
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.cb_8
this.Control[iCurrent+11]=this.cb_7
this.Control[iCurrent+12]=this.cb_6
this.Control[iCurrent+13]=this.cb_5
this.Control[iCurrent+14]=this.cb_4
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.cb_1
this.Control[iCurrent+18]=this.st_1
end on

on w_database.destroy
call super::destroy
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
end on

event ue_execute;call super::ue_execute;choose case as_testcasename 
	case 'DB_ODBC_Connect'
		cb_1.triggerevent( clicked!)
	case 'DB_OLEDB_Connect'
		cb_2.triggerevent( clicked!)
	case 'DB_SNC_Connect'
		cb_3.triggerevent( clicked!)
	case 'DB_ASE_Connect'
		cb_4.triggerevent( clicked!)
	case 'DB_O10_Connect'
		cb_5.triggerevent( clicked!)
	case 'DB_IN10_Connect'
		cb_6.triggerevent( clicked!)
	case 'DB_JDBC_ASA_Connect'
		cb_7.triggerevent( clicked!)
	case 'DB_JDBC_DB2_Connect'
		cb_8.triggerevent( clicked!)
	case 'DB_JDBC_INF_Connect'
		cb_9.triggerevent( clicked!)
	case 'DB_JDBC_O10_Connect'
		cb_10.triggerevent( clicked!)
	case 'DB_JDBC_SQL_Connect'
		cb_11.triggerevent( clicked!)
	case 'DB_ODATA_ASA_Connect'
		cb_12.triggerevent( clicked!)
	Case 'DB_Pipeline_test'
		cb_13.triggerevent( clicked!)
	Case 'DB_ADO_SQL_Connect'
		cb_14.triggerevent( clicked!)
	Case 'DB_POSTGRESQL_ODBC'
		cb_15.triggerevent( clicked!)
end choose

close(this)



end event

type cb_15 from commandbutton within w_database
integer x = 96
integer y = 1224
integer width = 608
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "POSTSQL_ODBC"
end type

event clicked;String ls_result, strSql, ls_Name, testname
transaction 	tran_SQLCA

tran_SQLCA = Create transaction

testname = "POSTSQL_ODBC"
// Profile PostgreSQL35W
//SQLCA.DBMS = "ODBC"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "ConnectString='DSN=PostgreSQL35W;UID=en_postgres;PWD=en_postgres'"

CONNECT USING tran_SQLCA;

If f_db_connect (tran_SQLCA, testname, '') Then

	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//drop function
	execute immediate " drop function sp_appeon_test()" USING tran_SQLCA;
	
	//Create table
	execute immediate "drop TABLE appeon_test" USING tran_SQLCA;
	
	strSql = "CREATE TABLE appeon_test (id integer NOT NULL,testname char(40) NOT NULL , testdate timestamp  , testnumber numeric(12,3)  , PRIMARY KEY (id)) "
	execute immediate :strSql USING tran_SQLCA;
	
	if tran_SQLCA.sqlcode<>0 then
		
		ls_result += testname + " Create Table appeon_test = "+ String ( "Fail!" ) +"~r~n"
		rollback USING tran_SQLCA;
		
	else
		ls_result += testname + " Create Table appeon_test = "+ String ( "Success!" ) +"~r~n"
		
		commit USING tran_SQLCA;
		
		//insert row
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 1, 'database', '2016-11-12', 12.34 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 2, 'Appeon', '2015-03-09 11:22:33', 34.56 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		//create sp
//		execute immediate " drop function sp_appeon_test()" USING tran_SQLCA;
		
		strSql = "create or replace function sp_appeon_test() returns setof appeon_test "+&
						" AS "+&
						"$$ "+&
						" select * from appeon_test ; "+&						
						"$$"+&
						" language SQL;"
			execute immediate :strSql USING tran_SQLCA;
			if tran_SQLCA.sqlcode<>0 then
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Fail!" ) +"~r~n"
				rollback USING tran_SQLCA;
			else
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Success!" ) +"~r~n"				
				commit USING tran_SQLCA;
			end if
			
		SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
		else
			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
		end if
		
		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd hh:mm:ss' ) +"~r~n"
		End If
		
		string ls_Syntax, ls_synErr,ls_CrtErr
		long li_Ret
		DataStore 	lds_sp
		lds_sp = Create DataStore

		ls_Syntax = tran_SQLCA.SyntaxFromSQL("select id,testname,testdate,testnumber from sp_appeon_test()", "style(type=tabular)", ls_synErr)		
		li_Ret = lds_sp.Create(ls_Syntax, ls_CrtErr)
		lds_sp.SetTransObject ( tran_SQLCA )
		lds_sp.Retrieve ( )
		
		ls_result += testname +" SP_Syntax Retrieve RowCount() = "+ String (lds_sp.RowCount () ) +"~r~n"	
		If lds_sp.RowCount () > 0 Then
			ls_result += testname +" SP_Syntax first row testname = "+ String (lds_sp.GetItemString (  lds_sp.RowCount (), 'testname' ) ) +"~r~n"
			ls_result += testname +" SP_Syntax last row testDate = "+ String (lds_sp.GetItemDateTime ( 1, 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		If IsValid ( lds_sp ) Then DesTroy ( lds_sp )	
		
	end if
	
	DisConnect USING tran_SQLCA;
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If

If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )


gf_returnresult(ls_result)






end event

type cb_14 from commandbutton within w_database
integer x = 96
integer y = 1096
integer width = 608
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ADO_SQL Test"
end type

event clicked;String ls_result, strSql, ls_Name, testname
transaction 	tran_SQLCA

tran_SQLCA = Create transaction

testname = "ADOSQL"
// Profile ado_sql
//tran_SQLCA.DBMS = "ADO.Net"
//tran_SQLCA.LogPass = "en_qaappeon"
//tran_SQLCA.LogId = "en_qaappeon"
//tran_SQLCA.AutoCommit = False
//tran_SQLCA.DBParm = "Namespace='System.Data.SqlClient',DataSource='192.0.0.19',Database='en_qaappeon'"

//
//CONNECT USING tran_SQLCA;
//
//If tran_SQLCA.SQLCode = 0 Then
If f_db_connect (tran_SQLCA, testname, '') Then
	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//Create table
	execute immediate "drop TABLE appeon_test" USING tran_SQLCA;
	
	strSql = "CREATE TABLE appeon_test (id integer NOT NULL ,testname varchar(40) NOT NULL , testdate datetime  , testnumber decimal(12,3)  , PRIMARY KEY (id)) "
	execute immediate :strSql USING tran_SQLCA;
	
	if tran_SQLCA.sqlcode<>0 then
		
		ls_result += testname + " Create Table appeon_test = "+ String ( "Fail!" ) +"~r~n"
		rollback USING tran_SQLCA;
		
	else
		ls_result += testname + " Create Table appeon_test = "+ String ( "Success!" ) +"~r~n"
		
		commit USING tran_SQLCA;
		
		//insert row
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 1, 'database', '2016-11-12', 12.34 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 2, 'Appeon', '2015-03-09', 34.56 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		//create sp
		execute immediate " drop procedure sp_appeon_test" USING tran_SQLCA;
		
		strSql = "create procedure sp_appeon_test "+&
						" AS "+&
						" begin "+&
						" select id,testname,testdate,testnumber "+&						
						" from appeon_test "+&
						" end "
			execute immediate :strSql USING tran_SQLCA;
			if tran_SQLCA.sqlcode<>0 then
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Fail!" ) +"~r~n"
				rollback USING tran_SQLCA;
			else
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Success!" ) +"~r~n"				
				commit USING tran_SQLCA;
			end if
			
			
			SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
		else
			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
		end if
		
		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		DataStore 	lds_sp
		lds_sp = Create DataStore
		lds_sp.DataObject = 'd_database_connect_sp'
		lds_sp.SetTransObject ( tran_SQLCA )
		lds_sp.Retrieve ( )
		
		ls_result += testname +" DS_SP Retrieve RowCount() = "+ String (lds_sp.RowCount () ) +"~r~n"	
		If lds_sp.RowCount () > 0 Then
			ls_result += testname +" DS_SP first row testname = "+ String (lds_sp.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DS_SP last row testDate = "+ String (lds_sp.GetItemDateTime ( lds_sp.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		If IsValid ( lds_sp ) Then DesTroy ( lds_sp )
		
	end if
	
	DisConnect USING tran_SQLCA;
	
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If

If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )


gf_returnresult(ls_result)






end event

type cb_13 from commandbutton within w_database
integer x = 763
integer y = 1096
integer width = 608
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Pipeline Test"
end type

event clicked;String 	ls_result
pipeline 		lp_1
Long 	ll_ret
String strSql, ls_Name, testname
transaction 	tran_SQLCA, tran_Source

//source database
testname = "OLEDB"
tran_Source = Create transaction
If f_db_connect (tran_Source, testname, '') Then
	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//Create table
	execute immediate "drop TABLE appeon_test" USING tran_Source;
	
	strSql = "CREATE TABLE appeon_test (id integer NOT NULL ,testname varchar(40) NOT NULL , testdate datetime  , testnumber decimal(12,3)  , PRIMARY KEY (id)) "
	execute immediate :strSql USING tran_Source;
	
	if tran_Source.sqlcode<>0 then
		
		ls_result += testname + " Create Table appeon_test = "+ String ( "Fail!" ) +"~r~n"
		rollback USING tran_Source;
		
	else
		ls_result += testname + " Create Table appeon_test = "+ String ( "Success!" ) +"~r~n"
		
		commit USING tran_Source;
		
		//insert row
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 1, 'database2', '2016-10-12', 12.30 )"
		
		execute immediate :strSql USING tran_Source;
		if tran_Source.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_Source;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_Source;
		end if
		
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 2, 'Appeon2', '2015-04-09', 34.06 )"
		
		execute immediate :strSql USING tran_Source;
		if tran_Source.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_Source;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_Source;
		end if
	End if
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End IF

//target database
tran_SQLCA = Create transaction
testname = "ASE"
If f_db_connect (tran_SQLCA, testname, '') Then
	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//drop table
	execute immediate "drop TABLE appeon_test" USING tran_SQLCA;
	
	lp_1 = Create pipeline
	lp_1.DataObject = "p_pipeline_test"
	
	ll_ret= lp_1.Start(tran_Source, tran_SQLCA,dw_2)
	
	If ll_Ret = 1 Then
		ls_result += " PipeLine Start ( OLEDB, ASE ) = "+ String ( "Success!" ) +"~r~n"
		
		SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
			
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
		else
			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
		end if
		
		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
	Else
		ls_result += " PipeLine Start ( OLEDB, ASE ) "+ String ( "Fail!" ) + " Return:" + String ( ll_ret ) +"~r~n"
	End If
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If



gf_returnresult(ls_result)

If IsValid ( tran_Source ) Then DesTroy ( tran_Source )
If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )





end event

type cb_12 from commandbutton within w_database
integer x = 754
integer y = 968
integer width = 608
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OData Test"
end type

event clicked;String ls_result, strSql, ls_Name, testname
transaction 	tran_SQLCA
Long 	ll_I, ll_Row
tran_SQLCA = Create transaction

testname = "ODATA_ASA"
// Profile odata196
//tran_SQLCA.DBMS = "ODT"
//tran_SQLCA.DBParm = "ConnectString='URI=http://192.0.0.196:8090/odata'"


If f_db_connect (tran_SQLCA, testname, '') Then

	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	

		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		For ll_I = dw_1.RowCount () To 1 Step -1
			strSql = "Delete table=appeon_test index=" + String ( ll_I - 1 )
			execute immediate :strSql USING tran_SQLCA;	
			if tran_SQLCA.sqlcode<>0 then
				ls_result += testname +" Delete Row " + String ( ll_I ) +" = "+ String ( "Fail!" ) +"~r~n"
				rollback USING tran_SQLCA;
			else
				ls_result += testname +" Delete Row " + String ( ll_I ) +" = "+ String ( "Success!" ) +"~r~n"				
				commit USING tran_SQLCA;
			end if
		Next
		

		//insert row		
		strSql = "INSERT INTO appeon_test ( id, testname, testdate, testnumber ) VALUES ( 1, 'database', datetime'2016-11-12T00:00:00.000', 12.34 ) index=0"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		strSql = "INSERT INTO appeon_test ( id, testname, testdate, testnumber ) VALUES ( 2, 'Appeon', datetime'2016-03-09T00:00:00.000', 34.56 ) index=1"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
			

			
//		SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
//		if tran_SQLCA.sqlcode<>0 then
//			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
//		else
//			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
//		end if
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
	
	DisConnect USING tran_SQLCA;
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If

If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )


gf_returnresult(ls_result)






end event

type cb_11 from commandbutton within w_database
integer x = 754
integer y = 840
integer width = 608
integer height = 112
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JDBC_SQL Test"
end type

event clicked;String ls_result, strSql, ls_Name, testname
transaction 	tran_SQLCA

tran_SQLCA = Create transaction

testname = "JDBC_SQL"
// Profile sqljdbc
//tran_SQLCA.DBMS = "JDBC"
//tran_SQLCA.LogPass = "en_qaappeon"
//tran_SQLCA.LogId = "en_qaappeon"
//tran_SQLCA.AutoCommit = False
//tran_SQLCA.DBParm = "Driver='com.microsoft.sqlserver.jdbc.SQLServerDriver',URL='jdbc:sqlserver://192.0.0.19:1433;DatabaseName=en_qaappeon'"

//CONNECT USING tran_SQLCA;
//
//If tran_SQLCA.SQLCode = 0 Then
If f_db_connect (tran_SQLCA, testname, '') Then
	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//Create table
	execute immediate "drop TABLE appeon_test" USING tran_SQLCA;
	
	strSql = "CREATE TABLE appeon_test (id integer NOT NULL ,testname varchar(40) NOT NULL , testdate datetime  , testnumber decimal(12,3)  , PRIMARY KEY (id)) "
	execute immediate :strSql USING tran_SQLCA;
	
	if tran_SQLCA.sqlcode<>0 then
		
		ls_result += testname + " Create Table appeon_test = "+ String ( "Fail!" ) +"~r~n"
		rollback USING tran_SQLCA;
		
	else
		ls_result += testname + " Create Table appeon_test = "+ String ( "Success!" ) +"~r~n"
		
		commit USING tran_SQLCA;
		
		//insert row
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 1, 'database', '2016-11-12', 12.34 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 2, 'Appeon', '2015-03-09', 34.56 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		//create sp
		execute immediate " drop procedure sp_appeon_test" USING tran_SQLCA;
		
		strSql = "create procedure sp_appeon_test "+&
						" AS "+&
						" begin "+&
						" select id,testname,testdate,testnumber "+&						
						" from appeon_test "+&
						" end "
			execute immediate :strSql USING tran_SQLCA;
			if tran_SQLCA.sqlcode<>0 then
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Fail!" ) +"~r~n"
				rollback USING tran_SQLCA;
			else
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Success!" ) +"~r~n"				
				commit USING tran_SQLCA;
			end if
			
			
			SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
		else
			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
		end if
		
		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		DataStore 	lds_sp
		lds_sp = Create DataStore
		lds_sp.DataObject = 'd_database_connect_sp'
		lds_sp.SetTransObject ( tran_SQLCA )
		lds_sp.Retrieve ( )
		
		ls_result += testname +" DS_SP Retrieve RowCount() = "+ String (lds_sp.RowCount () ) +"~r~n"	
		If lds_sp.RowCount () > 0 Then
			ls_result += testname +" DS_SP first row testname = "+ String (lds_sp.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DS_SP last row testDate = "+ String (lds_sp.GetItemDateTime ( lds_sp.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		If IsValid ( lds_sp ) Then DesTroy ( lds_sp )
		
	end if
	
	DisConnect USING tran_SQLCA;
	
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If

If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )


gf_returnresult(ls_result)






end event

type cb_10 from commandbutton within w_database
integer x = 754
integer y = 712
integer width = 608
integer height = 112
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JDBC_O10 Test"
end type

event clicked;String ls_result, strSql, ls_Name, testname
transaction 	tran_SQLCA

tran_SQLCA = Create transaction

testname = "JDBC_O10"
// Profile oracl_jdbc
//tran_SQLCA.DBMS = "JDBC"
//tran_SQLCA.LogPass = "en_qaeng"
//tran_SQLCA.LogId = "en_qaeng"
//tran_SQLCA.AutoCommit = False
//tran_SQLCA.DBParm = "Driver='oracle.jdbc.driver.OracleDriver',URL='jdbc:Oracle:thin:@192.0.0.19:1521:orcleng'"

//CONNECT USING tran_SQLCA;
//
//If tran_SQLCA.SQLCode = 0 Then
If f_db_connect (tran_SQLCA, testname, '') Then
	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//Create table
	execute immediate "drop TABLE appeon_test" USING tran_SQLCA;

	
	strSql = "CREATE TABLE appeon_test (id float NOT NULL,testname varchar(40) NOT NULL , testdate date  , testnumber decimal(12,3)  , PRIMARY KEY (id))  "
	execute immediate :strSql USING tran_SQLCA;
	
	if tran_SQLCA.sqlcode<>0 then
		
		ls_result += testname + " Create Table appeon_test = "+ String ( "Fail!" ) +"~r~n"
		rollback USING tran_SQLCA;
		
	else
		ls_result += testname + " Create Table appeon_test = "+ String ( "Success!" ) +"~r~n"
		
		commit USING tran_SQLCA;
		
		//insert row
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 1, 'database', TO_TIMESTAMP('2016-11-12 00:00:00','YYYY-DD-MM HH24:MI:SS'), 12.34 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 2, 'Appeon', TO_TIMESTAMP('2015-03-09 00:00:00','YYYY-DD-MM HH24:MI:SS'), 34.56 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		//create sp
		//execute immediate " drop procedure sp_appeon_test" USING tran_SQLCA;
		
		strSql = "CREATE OR REPLACE  PACKAGE SP_QA_Appeon  IS TYPE rct1 "+&
					"    IS REF CURSOR "+&
					" RETURN appeon_test%ROWTYPE; "+&
					" PROCEDURE QA_Appeon2(rc1 IN OUT rct1); "+&
					"end; "
		execute immediate :strSql USING tran_SQLCA;
		if sqlca.sqlcode<>0 then			
			ls_result += testname +" Create PACKAGE = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Create PACKAGE = "+ String ( "Success!" ) +"~r~n"
			
			commit USING tran_SQLCA;
			
			strSql = "CREATE OR REPLACE  PROCEDURE SP_QA_FINAL2 (rc1 IN OUT  "+&
						"    SP_QA_Appeon.rct1) "+&
						"AS "+&
						"BEGIN "+&
						" OPEN rc1 FOR SELECT * FROM appeon_test; "+&
						"END; "
						

			execute immediate :strSql USING tran_SQLCA;
			if sqlca.sqlcode<>0 then
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Fail!" ) +"~r~n"
				rollback USING tran_SQLCA;
			else
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Success!" ) +"~r~n"	
				commit USING tran_SQLCA;
			end if
			
		end if
			
			
			SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
			
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
		else
			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
		end if
		
		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		//DataStore 	lds_sp
		string ERRORS, dwsyntax_str
		
		dwsyntax_str = tran_SQLCA.SyntaxFromSQL("execute SP_QA_FINAL2", "style(type=grid)" , ERRORS)
		dw_2.Create( dwsyntax_str, ERRORS)
//		lds_sp = Create DataStore
//		lds_sp.DataObject = 'd_database_connect_sp'
		dw_2.SetTransObject ( tran_SQLCA )
		
		dw_2.Retrieve ( )
		
		ls_result += testname +" DW_SP Retrieve RowCount() = "+ String (dw_2.RowCount () ) +"~r~n"	
		If dw_2.RowCount () > 0 Then
			ls_result += testname +" DW_SP first row testname = "+ String (dw_2.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW_SP last row testDate = "+ String (dw_2.GetItemDateTime ( dw_2.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		//If IsValid ( lds_sp ) Then DesTroy ( lds_sp )
		
	end if
		
	DisConnect USING tran_SQLCA;	
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If

If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )


gf_returnresult(ls_result)






end event

type cb_9 from commandbutton within w_database
integer x = 754
integer y = 584
integer width = 608
integer height = 112
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JDBC_INF Test"
end type

event clicked;String ls_result, strSql, ls_Name, testname
transaction 	tran_SQLCA

tran_SQLCA = Create transaction

testname = "JDBC_INF"
// Profile infor_jdbc
//SQLCA.DBMS = "JDBC"
//SQLCA.LogPass = "informix"
//SQLCA.LogId = "informix"
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "Driver='com.informix.jdbc.IfxDriver',URL='jdbc:informix-sqli://192.0.0.19:1527/en_qaappeon:INFORMIXSERVER=informix_19'"

If f_db_connect (tran_SQLCA, testname, '') Then
	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//Create table
	execute immediate "drop TABLE appeon_test" USING tran_SQLCA;
	
	strSql = "CREATE TABLE appeon_test (id INTEGER NOT NULL,testname VARCHAR(40) NOT NULL, testdate DATETIME YEAR TO FRACTION(3),testnumber decimal ( 12,3 ),  PRIMARY KEY (id) constraint pk_id ) "
	execute immediate :strSql USING tran_SQLCA;
	
	if tran_SQLCA.sqlcode<>0 then
		
		ls_result += testname + " Create Table appeon_test = "+ String ( "Fail!" ) +"~r~n"
		rollback USING tran_SQLCA;
		
	else
		ls_result += testname + " Create Table appeon_test = "+ String ( "Success!" ) +"~r~n"
		
		commit USING tran_SQLCA;
		
		//insert row
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 1, 'database', TO_DATE('2016-11-12 00:00:00'), 12.34 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 2, 'Appeon', TO_DATE('2015-03-09 00:00:00'), 34.56 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		//create sp
		execute immediate " drop procedure sp_appeon_test" USING tran_SQLCA;
		

			strSQl = "create procedure sp_appeon_test ( )~r~n"+&
						"returning varchar(40),DATETIME YEAR TO FRACTION(3);~r~n"+&						
						"define var_name varchar(40);~r~n"+&
						"define var_date DATETIME YEAR TO FRACTION(3);~r~n"+&
						"Foreach Cursor1 for ~r~n"+&
						 "select testname,testdate  into var_name,var_date from appeon_test ~r~n"+&						 
						"return var_name,var_date with RESUME;~r~n"+&			
						"end Foreach~r~n"+&
						 "end procedure;"
						 
			execute immediate :strSql USING tran_SQLCA;
			if tran_SQLCA.sqlcode<>0 then
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Fail!" ) +"~r~n"
				rollback USING tran_SQLCA;
			else
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Success!" ) +"~r~n"				
				commit USING tran_SQLCA;
			end if
			
			
			SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
		else
			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
		end if
		
		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		string ERRORS, dwsyntax_str
		
		dwsyntax_str = tran_SQLCA.SyntaxFromSQL(" execute sp_appeon_test", "style(type=grid)" , ERRORS)
		dw_2.Create( dwsyntax_str, ERRORS)
		dw_2.SetTransObject ( tran_SQLCA )
		
		dw_2.Retrieve ( )
		
		ls_result += testname +" DW_SP Retrieve RowCount() = "+ String (dw_2.RowCount () ) +"~r~n"	
		If dw_2.RowCount () > 0 Then
			ls_result += testname +" DW_SP first row testname = "+ String (dw_2.GetItemString ( 1, 1 ) ) +"~r~n"
			ls_result += testname +" DW_SP last row testDate = "+ String (dw_2.GetItemDateTime ( dw_2.RowCount (), 2 ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
	end if
	
	DisConnect USING tran_SQLCA;
	
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If

If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )


gf_returnresult(ls_result)






end event

type dw_2 from datawindow within w_database
integer x = 1486
integer y = 896
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_database
integer x = 1403
integer y = 388
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "d_database_connect"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event sqlpreview;//MessageBox ( "", sqlsyntax )
end event

type cb_8 from commandbutton within w_database
integer x = 754
integer y = 456
integer width = 608
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JDBC_DB2 Test"
end type

event clicked;String ls_result



gf_returnresult(ls_result)






end event

type cb_7 from commandbutton within w_database
integer x = 754
integer y = 328
integer width = 608
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JDBC_ASA Test"
end type

event clicked;String ls_result, strSql, ls_Name, testname
transaction 	tran_SQLCA

tran_SQLCA = Create transaction

testname = "JDBC_ASA"
// Profile asa_jdbc
//tran_SQLCA.DBMS = "JDBC"
//tran_SQLCA.LogPass = "en_qaappeon"
//tran_SQLCA.LogId = "en_qaappeon"
//tran_SQLCA.AutoCommit = False
//tran_SQLCA.DBParm = "Driver='com.sybase.jdbc3.jdbc.SybDriver',URL='jdbc:sybase:Tds:192.0.0.19:5000?DYNAMIC-PREPARE=true'"


If f_db_connect (tran_SQLCA, testname, '') Then

	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//Create table
	execute immediate "drop TABLE appeon_test" USING tran_SQLCA;
	
	strSql = "CREATE TABLE appeon_test (id integer NOT NULL,testname char(40) NOT NULL , testdate datetime  , testnumber decimal(12,3)  , PRIMARY KEY (id)) "
	execute immediate :strSql USING tran_SQLCA;
	
	if tran_SQLCA.sqlcode<>0 then
		
		ls_result += testname + " Create Table appeon_test = "+ String ( "Fail!" ) +"~r~n"
		rollback USING tran_SQLCA;
		
	else
		ls_result += testname + " Create Table appeon_test = "+ String ( "Success!" ) +"~r~n"
		
		commit USING tran_SQLCA;
		
		//insert row
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 1, 'database', '2016-11-12', 12.34 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 2, 'Appeon', '2015-03-09', 34.56 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		//create sp
		execute immediate " drop procedure sp_appeon_test" USING tran_SQLCA;
		
		strSql = "create procedure sp_appeon_test "+&
						" AS "+&
						" begin "+&
						" select id,testname,testdate,testnumber "+&						
						" from appeon_test "+&
						" end "
			execute immediate :strSql USING tran_SQLCA;
			if tran_SQLCA.sqlcode<>0 then
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Fail!" ) +"~r~n"
				rollback USING tran_SQLCA;
			else
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Success!" ) +"~r~n"				
				commit USING tran_SQLCA;
			end if
			
			SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
		else
			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
		end if
		
		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		DataStore 	lds_sp
		lds_sp = Create DataStore
		lds_sp.DataObject = 'd_database_connect_sp'
		lds_sp.SetTransObject ( tran_SQLCA )
		lds_sp.Retrieve ( )
		
		ls_result += testname +" DS_SP Retrieve RowCount() = "+ String (lds_sp.RowCount () ) +"~r~n"	
		If lds_sp.RowCount () > 0 Then
			ls_result += testname +" DS_SP first row testname = "+ String (lds_sp.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DS_SP last row testDate = "+ String (lds_sp.GetItemDateTime ( lds_sp.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		If IsValid ( lds_sp ) Then DesTroy ( lds_sp )	
		
	end if
	
	DisConnect USING tran_SQLCA;
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If

If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )


gf_returnresult(ls_result)






end event

type cb_6 from commandbutton within w_database
integer x = 96
integer y = 968
integer width = 608
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Informix Test"
end type

event clicked;String ls_result, strSql, ls_Name, testname
transaction 	tran_SQLCA

tran_SQLCA = Create transaction

testname = "IN10"
// Profile inf10
//tran_SQLCA.DBMS = "I10 INFORMIX-10.0"
//tran_SQLCA.Database = "en_qaappeon"
//tran_SQLCA.UserId = "informix"
//tran_SQLCA.DBPass = "informix"
//tran_SQLCA.ServerName = "192.0.0.19@informix_19"
//tran_SQLCA.AutoCommit = False
//tran_SQLCA.DBParm = ""
//
//CONNECT USING tran_SQLCA;
//
//If tran_SQLCA.SQLCode = 0 Then
If f_db_connect (tran_SQLCA, testname, '') Then
	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//Create table
	execute immediate "drop TABLE appeon_test" USING tran_SQLCA;
	
	strSql = "CREATE TABLE appeon_test (id INTEGER NOT NULL,testname VARCHAR(40) NOT NULL, testdate DATETIME YEAR TO FRACTION(3),testnumber decimal ( 12,3 ),  PRIMARY KEY (id) constraint pk_id ) "
	execute immediate :strSql USING tran_SQLCA;
	
	if tran_SQLCA.sqlcode<>0 then
		
		ls_result += testname + " Create Table appeon_test = "+ String ( "Fail!" ) +"~r~n"
		rollback USING tran_SQLCA;
		
	else
		ls_result += testname + " Create Table appeon_test = "+ String ( "Success!" ) +"~r~n"
		
		commit USING tran_SQLCA;
		
		//insert row
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 1, 'database', TO_DATE('2016-11-12 00:00:00'), 12.34 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 2, 'Appeon', TO_DATE('2015-03-09 00:00:00'), 34.56 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		//create sp
		execute immediate " drop procedure sp_appeon_test" USING tran_SQLCA;
		

			strSQl = "create procedure sp_appeon_test ( )~r~n"+&
						"returning varchar(40),DATETIME YEAR TO FRACTION(3);~r~n"+&						
						"define var_name varchar(40);~r~n"+&
						"define var_date DATETIME YEAR TO FRACTION(3);~r~n"+&
						"Foreach Cursor1 for ~r~n"+&
						 "select testname,testdate  into var_name,var_date from appeon_test ~r~n"+&						 
						"return var_name,var_date with RESUME;~r~n"+&			
						"end Foreach~r~n"+&
						 "end procedure;"
						 
			execute immediate :strSql USING tran_SQLCA;
			if tran_SQLCA.sqlcode<>0 then
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Fail!" ) +"~r~n"
				rollback USING tran_SQLCA;
			else
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Success!" ) +"~r~n"				
				commit USING tran_SQLCA;
			end if
			
			
			SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
		else
			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
		end if
		
		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		string ERRORS, dwsyntax_str
		
		dwsyntax_str = tran_SQLCA.SyntaxFromSQL("execute procedure  sp_appeon_test ()", "style(type=grid)" , ERRORS)
		dw_2.Create( dwsyntax_str, ERRORS)
		dw_2.SetTransObject ( tran_SQLCA )
		
		dw_2.Retrieve ( )
		
		ls_result += testname +" DW_SP Retrieve RowCount() = "+ String (dw_2.RowCount () ) +"~r~n"	
		If dw_2.RowCount () > 0 Then
			ls_result += testname +" DW_SP first row testname = "+ String (dw_2.GetItemString ( 1, 1 ) ) +"~r~n"
			ls_result += testname +" DW_SP last row testDate = "+ String (dw_2.GetItemDateTime ( dw_2.RowCount (), 2 ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
	end if
	
	DisConnect USING tran_SQLCA;
	
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If

If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )


gf_returnresult(ls_result)






end event

type cb_5 from commandbutton within w_database
integer x = 96
integer y = 840
integer width = 608
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Oracle Test"
end type

event clicked;String ls_result, strSql, ls_Name, testname
transaction 	tran_SQLCA

tran_SQLCA = Create transaction

testname = "O10"
//// Profile testl_eng
//tran_SQLCA.DBMS = "O10 Oracle10g (10.1.0)"
//tran_SQLCA.LogPass = "en_qaeng"
//tran_SQLCA.ServerName = "en_eng"
//tran_SQLCA.LogId = "en_qaeng"
//tran_SQLCA.AutoCommit = False
//tran_SQLCA.DBParm = "PBCatalogOwner='en_qaeng'"
//
//
//CONNECT USING tran_SQLCA;
//
//If tran_SQLCA.SQLCode = 0 Then
If f_db_connect (tran_SQLCA, testname, '') Then
	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//Create table
	execute immediate "drop TABLE appeon_test" USING tran_SQLCA;

	
	strSql = "CREATE TABLE appeon_test (id float NOT NULL,testname varchar(40) NOT NULL , testdate date  , testnumber decimal(12,3)  , PRIMARY KEY (id))  "
	execute immediate :strSql USING tran_SQLCA;
	
	if tran_SQLCA.sqlcode<>0 then
		
		ls_result += testname + " Create Table appeon_test = "+ String ( "Fail!" ) +"~r~n"
		rollback USING tran_SQLCA;
		
	else
		ls_result += testname + " Create Table appeon_test = "+ String ( "Success!" ) +"~r~n"
		
		commit USING tran_SQLCA;
		
		//insert row
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 1, 'database', TO_TIMESTAMP('2016-11-12 00:00:00','YYYY-DD-MM HH24:MI:SS'), 12.34 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 2, 'Appeon', TO_TIMESTAMP('2015-03-09 00:00:00','YYYY-DD-MM HH24:MI:SS'), 34.56 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		//create sp
		//execute immediate " drop procedure sp_appeon_test" USING tran_SQLCA;
		
		strSql = "CREATE OR REPLACE  PACKAGE SP_QA_Appeon  IS TYPE rct1 "+&
					"    IS REF CURSOR "+&
					" RETURN appeon_test%ROWTYPE; "+&
					" PROCEDURE QA_Appeon2(rc1 IN OUT rct1); "+&
					"end; "
		execute immediate :strSql USING tran_SQLCA;
		if sqlca.sqlcode<>0 then			
			ls_result += testname +" Create PACKAGE = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Create PACKAGE = "+ String ( "Success!" ) +"~r~n"
			
			commit USING tran_SQLCA;
			
			strSql = "CREATE OR REPLACE  PROCEDURE SP_QA_FINAL2 (rc1 IN OUT  "+&
						"    SP_QA_Appeon.rct1) "+&
						"AS "+&
						"BEGIN "+&
						" OPEN rc1 FOR SELECT * FROM appeon_test; "+&
						"END; "
						

			execute immediate :strSql USING tran_SQLCA;
			if sqlca.sqlcode<>0 then
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Fail!" ) +"~r~n"
				rollback USING tran_SQLCA;
			else
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Success!" ) +"~r~n"	
				commit USING tran_SQLCA;
			end if
			
		end if
			
			
			SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
			
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
		else
			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
		end if
		
		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		//DataStore 	lds_sp
		string ERRORS, dwsyntax_str
		
		dwsyntax_str = tran_SQLCA.SyntaxFromSQL("execute SP_QA_FINAL2", "style(type=grid)" , ERRORS)
		dw_2.Create( dwsyntax_str, ERRORS)
//		lds_sp = Create DataStore
//		lds_sp.DataObject = 'd_database_connect_sp'
		dw_2.SetTransObject ( tran_SQLCA )
		
		dw_2.Retrieve ( )
		
		ls_result += testname +" DW_SP Retrieve RowCount() = "+ String (dw_2.RowCount () ) +"~r~n"	
		If dw_2.RowCount () > 0 Then
			ls_result += testname +" DW_SP first row testname = "+ String (dw_2.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW_SP last row testDate = "+ String (dw_2.GetItemDateTime ( dw_2.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		//If IsValid ( lds_sp ) Then DesTroy ( lds_sp )
		
	end if
		
	DisConnect USING tran_SQLCA;	
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If

If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )


gf_returnresult(ls_result)






end event

type cb_4 from commandbutton within w_database
integer x = 96
integer y = 712
integer width = 608
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ASE Test"
end type

event clicked;String ls_result, strSql, ls_Name, testname
transaction 	tran_SQLCA

tran_SQLCA = Create transaction

testname = "ASE"
//// Profile SAPASE
//tran_SQLCA.DBMS = "SYC Adaptive Server Enterprise"
//tran_SQLCA.Database = "en_qaappeon"
//tran_SQLCA.LogPass = "en_qaappeon"
//tran_SQLCA.ServerName = "ASE19"
//tran_SQLCA.LogId = "en_qaappeon"
//tran_SQLCA.AutoCommit = True
//tran_SQLCA.DBParm = "Release='15'"
//
//CONNECT USING tran_SQLCA;
//
//If tran_SQLCA.SQLCode = 0 Then
If f_db_connect (tran_SQLCA, testname, '') Then
	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//Create table
	execute immediate "drop TABLE appeon_test" USING tran_SQLCA;

	
	strSql = "CREATE TABLE appeon_test (id integer NOT NULL,testname char(40) NOT NULL , testdate datetime  , testnumber decimal(12,3)  , PRIMARY KEY (id))  "
	execute immediate :strSql USING tran_SQLCA;
	
	if tran_SQLCA.sqlcode<>0 then
		
		ls_result += testname + " Create Table appeon_test = "+ String ( "Fail!" ) +"~r~n"
		rollback USING tran_SQLCA;
		
	else
		ls_result += testname + " Create Table appeon_test = "+ String ( "Success!" ) +"~r~n"
		
		commit USING tran_SQLCA;
		
		//insert row
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 1, 'database', '2016-11-12', 12.34 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 2, 'Appeon', '2015-03-09', 34.56 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		//create sp
		execute immediate " drop procedure sp_appeon_test" USING tran_SQLCA;
		
		strSql = "create procedure sp_appeon_test "+&
						" AS "+&
						" begin "+&
						" select id,testname,testdate,testnumber "+&						
						" from appeon_test "+&
						" end "
			execute immediate :strSql USING tran_SQLCA;
			if tran_SQLCA.sqlcode<>0 then
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Fail!" ) +"~r~n"
				rollback USING tran_SQLCA;
			else
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Success!" ) +"~r~n"				
				commit USING tran_SQLCA;
			end if
			
			
			SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
			
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
		else
			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
		end if
		
		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		//DataStore 	lds_sp
		string ERRORS, dwsyntax_str
		//dw_1.DataObject = ''
		dwsyntax_str = tran_SQLCA.SyntaxFromSQL("execute sp_appeon_test", "style(type=grid)" , ERRORS)
		dw_2.Create( dwsyntax_str, ERRORS)
//		lds_sp = Create DataStore
//		lds_sp.DataObject = 'd_database_connect_sp'
		dw_2.SetTransObject ( tran_SQLCA )
		
		dw_2.Retrieve ( )
		
		ls_result += testname +" DW_SP Retrieve RowCount() = "+ String (dw_2.RowCount () ) +"~r~n"	
		If dw_2.RowCount () > 0 Then
			ls_result += testname +" DW_SP first row testname = "+ String (dw_2.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW_SP last row testDate = "+ String (dw_2.GetItemDateTime ( dw_2.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		//If IsValid ( lds_sp ) Then DesTroy ( lds_sp )
		
	end if
		
	DisConnect USING tran_SQLCA;	
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If

If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )


gf_returnresult(ls_result)






end event

type cb_3 from commandbutton within w_database
integer x = 96
integer y = 584
integer width = 608
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SQL Native Client Test"
end type

event clicked;String ls_result, strSql, ls_Name, testname
transaction 	tran_SQLCA

tran_SQLCA = Create transaction

testname = "SNC"
//// Profile mss_crs
//tran_SQLCA.DBMS = "SNC SQL Native Client(OLE DB)"
//tran_SQLCA.LogPass = "en_qaappeon"
//tran_SQLCA.ServerName = "192.0.0.19"
//tran_SQLCA.LogId = "en_qaappeon"
//tran_SQLCA.AutoCommit = False
//tran_SQLCA.DBParm = "Database='en_qaappeon'"
//
//CONNECT USING tran_SQLCA;
//
//If tran_SQLCA.SQLCode = 0 Then
If f_db_connect (tran_SQLCA, testname, '') Then
	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//Create table
	execute immediate "drop TABLE appeon_test" USING tran_SQLCA;
	
	strSql = "CREATE TABLE appeon_test (id integer NOT NULL ,testname varchar(40) NOT NULL , testdate datetime  , testnumber decimal(12,3)  , PRIMARY KEY (id)) "
	execute immediate :strSql USING tran_SQLCA;
	
	if tran_SQLCA.sqlcode<>0 then
		
		ls_result += testname + " Create Table appeon_test = "+ String ( "Fail!" ) +"~r~n"
		rollback USING tran_SQLCA;
		
	else
		ls_result += testname + " Create Table appeon_test = "+ String ( "Success!" ) +"~r~n"
		
		commit USING tran_SQLCA;
		
		//insert row
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 1, 'database', '2016-11-12', 12.34 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 2, 'Appeon', '2015-03-09', 34.56 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		//create sp
		execute immediate " drop procedure sp_appeon_test" USING tran_SQLCA;
		
		strSql = "create procedure sp_appeon_test "+&
						" AS "+&
						" begin "+&
						" select id,testname,testdate,testnumber "+&						
						" from appeon_test "+&
						" end "
			execute immediate :strSql USING tran_SQLCA;
			if tran_SQLCA.sqlcode<>0 then
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Fail!" ) +"~r~n"
				rollback USING tran_SQLCA;
			else
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Success!" ) +"~r~n"				
				commit USING tran_SQLCA;
			end if
			
			
			SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
		else
			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
		end if
		
		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		DataStore 	lds_sp
		lds_sp = Create DataStore
		lds_sp.DataObject = 'd_database_connect_sp'
		lds_sp.SetTransObject ( tran_SQLCA )
		lds_sp.Retrieve ( )
		
		ls_result += testname +" DS_SP Retrieve RowCount() = "+ String (lds_sp.RowCount () ) +"~r~n"	
		If lds_sp.RowCount () > 0 Then
			ls_result += testname +" DS_SP first row testname = "+ String (lds_sp.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DS_SP last row testDate = "+ String (lds_sp.GetItemDateTime ( lds_sp.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		If IsValid ( lds_sp ) Then DesTroy ( lds_sp )
		
	end if
	
	DisConnect USING tran_SQLCA;
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If

If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )


gf_returnresult(ls_result)






end event

type cb_2 from commandbutton within w_database
integer x = 96
integer y = 456
integer width = 608
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OLE DB Test"
end type

event clicked;String ls_result, strSql, ls_Name, testname
transaction 	tran_SQLCA

tran_SQLCA = Create transaction

testname = "OLEDB"
//// Profile sql2005
//tran_SQLCA.DBMS = "OLE DB"
//tran_SQLCA.LogPass = "en_qaappeon"
//tran_SQLCA.LogId = "en_qaappeon"
//tran_SQLCA.AutoCommit = False
//tran_SQLCA.DBParm = "PROVIDER='SQLOLEDB',DATASOURCE='192.0.0.19',PROVIDERSTRING='database=en_qaappeon'"
//
//
//CONNECT USING tran_SQLCA;
//
//If tran_SQLCA.SQLCode = 0 Then
If f_db_connect (tran_SQLCA, testname, '') Then
	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//Create table
	execute immediate "drop TABLE appeon_test" USING tran_SQLCA;
	
	strSql = "CREATE TABLE appeon_test (id integer NOT NULL ,testname varchar(40) NOT NULL , testdate datetime  , testnumber decimal(12,3)  , PRIMARY KEY (id)) "
	execute immediate :strSql USING tran_SQLCA;
	
	if tran_SQLCA.sqlcode<>0 then
		
		ls_result += testname + " Create Table appeon_test = "+ String ( "Fail!" ) +"~r~n"
		rollback USING tran_SQLCA;
		
	else
		ls_result += testname + " Create Table appeon_test = "+ String ( "Success!" ) +"~r~n"
		
		commit USING tran_SQLCA;
		
		//insert row
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 1, 'database', '2016-11-12', 12.34 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 2, 'Appeon', '2015-03-09', 34.56 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		//create sp
		execute immediate " drop procedure sp_appeon_test" USING tran_SQLCA;
		
		strSql = "create procedure sp_appeon_test "+&
						" AS "+&
						" begin "+&
						" select id,testname,testdate,testnumber "+&						
						" from appeon_test "+&
						" end "
			execute immediate :strSql USING tran_SQLCA;
			if tran_SQLCA.sqlcode<>0 then
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Fail!" ) +"~r~n"
				rollback USING tran_SQLCA;
			else
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Success!" ) +"~r~n"				
				commit USING tran_SQLCA;
			end if
			
			
			SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
		else
			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
		end if
		
		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		DataStore 	lds_sp
		lds_sp = Create DataStore
		lds_sp.DataObject = 'd_database_connect_sp'
		lds_sp.SetTransObject ( tran_SQLCA )
		lds_sp.Retrieve ( )
		
		ls_result += testname +" DS_SP Retrieve RowCount() = "+ String (lds_sp.RowCount () ) +"~r~n"	
		If lds_sp.RowCount () > 0 Then
			ls_result += testname +" DS_SP first row testname = "+ String (lds_sp.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DS_SP last row testDate = "+ String (lds_sp.GetItemDateTime ( lds_sp.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		If IsValid ( lds_sp ) Then DesTroy ( lds_sp )
		
	end if
	
	DisConnect USING tran_SQLCA;
	
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If

If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )


gf_returnresult(ls_result)






end event

type cb_1 from commandbutton within w_database
integer x = 96
integer y = 328
integer width = 608
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ODBC Test"
end type

event clicked;String ls_result, strSql, ls_Name, testname
transaction 	tran_SQLCA

tran_SQLCA = Create transaction

testname = "ODBC"
//// Profile EAS Demo DB V126
//tran_SQLCA.DBMS = "ODBC"
//tran_SQLCA.AutoCommit = False
//tran_SQLCA.DBParm = "ConnectString='DSN=EAS Demo DB V126;UID=dba;PWD=sql'"
//
//CONNECT USING tran_SQLCA;

If f_db_connect (tran_SQLCA, testname, '') Then

	ls_result += testname + " Connect To DB = "+ String ( "Success!" ) +"~r~n"
	
	//Create table
	execute immediate "drop TABLE appeon_test" USING tran_SQLCA;
	
	strSql = "CREATE TABLE appeon_test (id integer NOT NULL,testname char(40) NOT NULL , testdate datetime  , testnumber decimal(12,3)  , PRIMARY KEY (id)) "
	execute immediate :strSql USING tran_SQLCA;
	
	if tran_SQLCA.sqlcode<>0 then
		
		ls_result += testname + " Create Table appeon_test = "+ String ( "Fail!" ) +"~r~n"
		rollback USING tran_SQLCA;
		
	else
		ls_result += testname + " Create Table appeon_test = "+ String ( "Success!" ) +"~r~n"
		
		commit USING tran_SQLCA;
		
		//insert row
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 1, 'database', '2016-11-12', 12.34 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert first Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert first Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		strSql = "INSERT INTO appeon_test (id,testname,testdate,testnumber) VALUES ( 2, 'Appeon', '2015-03-09', 34.56 )"
		
		execute immediate :strSql USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" Insert second Row = "+ String ( "Fail!" ) +"~r~n"
			rollback USING tran_SQLCA;
		else
			ls_result += testname +" Insert second Row = "+ String ( "Success!" ) +"~r~n"
			commit USING tran_SQLCA;
		end if
		
		//create sp
		execute immediate " drop procedure sp_appeon_test" USING tran_SQLCA;
		
		strSql = "create procedure sp_appeon_test "+&
						" AS "+&
						" begin "+&
						" select id,testname,testdate,testnumber "+&						
						" from appeon_test "+&
						" end "
			execute immediate :strSql USING tran_SQLCA;
			if tran_SQLCA.sqlcode<>0 then
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Fail!" ) +"~r~n"
				rollback USING tran_SQLCA;
			else
				ls_result += testname +" Create sp_appeon_test = "+ String ( "Success!" ) +"~r~n"				
				commit USING tran_SQLCA;
			end if
			
			SELECT testname into :ls_Name FROM appeon_test WHERE id = 1 USING tran_SQLCA;
		if tran_SQLCA.sqlcode<>0 then
			ls_result += testname +" EXEC ISQL = "+ String ( "Fail!" ) +"~r~n"		
		else
			ls_result += testname +" EXEC ISQL = "+ String ( ls_Name ) +"~r~n"			
		end if
		
		dw_1.SetTransObject ( tran_SQLCA )
		dw_1.Retrieve()
		
		ls_result += testname +" DW Retrieve RowCount() = "+ String (dw_1.RowCount () ) +"~r~n"	
		If dw_1.RowCount () > 0 Then
			ls_result += testname +" DW first row testname = "+ String (dw_1.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DW last row testDate = "+ String (dw_1.GetItemDateTime ( dw_1.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		DataStore 	lds_sp
		lds_sp = Create DataStore
		lds_sp.DataObject = 'd_database_connect_sp'
		lds_sp.SetTransObject ( tran_SQLCA )
		lds_sp.Retrieve ( )
		
		ls_result += testname +" DS_SP Retrieve RowCount() = "+ String (lds_sp.RowCount () ) +"~r~n"	
		If lds_sp.RowCount () > 0 Then
			ls_result += testname +" DS_SP first row testname = "+ String (lds_sp.GetItemString ( 1, 'testname' ) ) +"~r~n"
			ls_result += testname +" DS_SP last row testDate = "+ String (lds_sp.GetItemDateTime ( lds_sp.RowCount (), 'testdate' ), 'yyyy-mm-dd' ) +"~r~n"
		End If
		
		If IsValid ( lds_sp ) Then DesTroy ( lds_sp )	
		
	end if
	
	DisConnect USING tran_SQLCA;
	
Else
	ls_result += testname +" Connect To DB = "+ String ( "Fail!" ) +"~r~n"
End If

If IsValid ( tran_SQLCA ) Then DesTroy ( tran_SQLCA )


gf_returnresult(ls_result)






end event

type st_1 from statictext within w_database
integer x = 361
integer y = 108
integer width = 910
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "database connect Test"
boolean focusrectangle = false
end type

