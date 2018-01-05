$PBExportHeader$w_datawindow_key.srw
forward
global type w_datawindow_key from w_base_case
end type
type dw_2 from datawindow within w_datawindow_key
end type
type cb_1 from commandbutton within w_datawindow_key
end type
type dw_1 from datawindow within w_datawindow_key
end type
type gb_1 from groupbox within w_datawindow_key
end type
end forward

global type w_datawindow_key from w_base_case
integer width = 5129
integer height = 2544
dw_2 dw_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_datawindow_key w_datawindow_key

type variables

Boolean	ib_DispSyntax,ib_DispEvent
Integer ii_index = 0
Boolean	ib_sleep = false
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
public subroutine of_testcase_point_module4 ()
public subroutine of_testcase_point_module5 ()
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
Boolean      ab_execute
Int		li_IDDataBase,li_IDDataWindow
Long		ll_RowNo1, ll_RowNo2, ll_RowNo3
is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)
Long		ll_RowNo
ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_key"	
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key"			//edit you test case point name
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key2"
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key3"
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key4"
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key5"
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key6"          // Look at the Insert Statement if include Identity column while don't input Identity column
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key7"          // Look at whether the Insert Row Identity column's value is equal to database row's value(don't input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key8"          // When Insert Statement save successfully to look at the Identity column status(don't input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key9"          //When Insert Statement save successfully to look at the triggered event
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key10"         // Look at the Insert Statement include Identity column while input Identity column
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key11"         //Look at the Insert Statement it can save successfully
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key12"        // Look at whether the Insert Row Identity column's value is equal to database row's value(input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key13"        //When Insert Statement save successfully to look at the Identity column status(input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key14"        //Modify Identity column,and look at if it can save successfully(Key Modification is Use Update)
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key15"        // Look at whether the Modify Identity column's value is equal to database column's value"
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key16"        //Look at the Modify Identity column status
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key17"        //Look at the Modify Identity column whether it can save successfully
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key18"        //When Insert Statement save successfully to look at the Identity column status(update(true,false))
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key19"        //Insert a row (Type is don't matching) to look at the Identity column
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key20"        //Move row in different buffer and update dw
//ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_primary_key21"        //Modify some row and insert a row and update dw

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
	is_type= ''
	choose case lower(ls_item)
		case lower("DW_datawindow_key")	
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W01_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = true
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key  = "+String ( "Success!" ) +"~r~n"
			     dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key  = "+String ( "Failed!" ) +"~r~n"
			end if
		
			delete from v30_SqlServerIdentityPrimary where id = 11; 
			commit;			
			
//		case lower("DW_datawindow_primary_key2")			
			ib_DispSyntax = false
			dw_1.DataObject = "d_F169A01W01_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',300)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn <> 1 then
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key2  = "+String ( "Success!" ) +"~r~n"
				rollback;
			else
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key2  = "+String ( "Failed!" ) +"~r~n"
			end if
			
//		case lower("DW_datawindow_primary_key3")	
			ib_DispSyntax = false
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W01_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',400)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn <> 1 then
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key3  = "+String ( "Success!" ) +"~r~n"
				rollback;
			else
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key3  = "+String ( "Failed!" ) +"~r~n"
			end if
			
//		case lower("DW_datawindow_primary_key4")	
			ib_DispSyntax = false		
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W01_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.GetRow()
			if ll_RowNo > 0 and ll_RowNo <= dw_1.RowCount() then
				dw_1.SetItem(ll_RowNo,'id',800)
				is_type= "DataWindow"
				timer(1)    
				li_rtn=dw_1.Update( )
				if  li_rtn <> 1 then
					ls_result += " "+is_testcasename+" "+ls_item + "  primary_key4  = "+String ( "Success!" ) +"~r~n"
					rollback;
				else
					commit;
					ls_result += " "+is_testcasename+" "+ls_item + "  primary_key4  = "+String ( "Failed!" ) +"~r~n"
				end if
			end if
			
//		case lower("DW_datawindow_primary_key5")	
		     ib_DispSyntax = false 			//Allow Ouput SqlPreview's SqlSyntax
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			//Use a DELETE and an INSERT statement when the key is changed
			dw_1.Object.DataWindow.Table.UpdateKeyinPlace = 'No'
			ll_RowNo = dw_1.GetRow()
			if ll_RowNo > 0 and ll_RowNo <= dw_1.RowCount() then
				dw_1.SetItem(ll_RowNo,'id',600)
				is_type= "DataWindow"
				timer(1)    
				li_rtn=dw_1.Update( )
				if  li_rtn <> 1 then
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key5  = "+String ( "Success!" ) +"~r~n"
				rollback;
			else
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key5  = "+String ( "Failed!" ) +"~r~n"
			end if
			end if
//		case lower("DW_datawindow_primary_key6")
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W02_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = true 			//Allow Ouput SqlPreview's SqlSyntax
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key6  = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key6  = "+String ( "Failed!" ) +"~r~n"
			end if
            
		   delete from v30_SqlServerIdentityPrimary where id = 11; 
		   commit;	

//		case lower("DW_datawindow_primary_key7")			
			ROLLBACK USING SQLCA;
			//Delete all Row which v_name = 'NAME00'
			DELETE FROM v30_SqlServerIdentityPrimary WHERE v_name = 'NAME00';
			dw_1.DataObject = "d_F169A01W02_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'v_name','NAME00')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = true				//Allow Ouput SqlPreview's SqlSyntax
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			li_IDDataWindow = dw_1.GetItemNumber(dw_1.RowCount(),'id')
			SELECT id
			INTO :li_IDDataBase
			FROM v30_SqlServerIdentityPrimary
			WHERE v_name = 'NAME00';
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key7  = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key7  = "+String ( "Failed!" ) +"~r~n"
			end if
			delete from v30_SqlServerIdentityPrimary where id = 11; 
			commit;	

//		case lower("DW_datawindow_primary_key8")	
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W02_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key8  = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key8  = "+String ( "Failed!" ) +"~r~n"
			end if
			
			delete from v30_SqlServerIdentityPrimary where id = 11; 
			commit;	

//		case lower("DW_datawindow_primary_key9")	
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W02_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispEvent = true 			
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key9  = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key9  = "+String ( "Failed!" ) +"~r~n"
			end if
			delete from v30_SqlServerIdentityPrimary where id = 11; 
			commit;	

//		case lower("DW_datawindow_primary_key10")				
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W02_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)	//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',300)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = true
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key10 = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key10 = "+String ( "Failed!" ) +"~r~n"
			end if
		
//		case lower("DW_datawindow_primary_key11")		
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W02_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',320)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key11 = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key11 = "+String ( "Failed!" ) +"~r~n"
			end if
		
//		case lower("DW_datawindow_primary_key12")				
			ROLLBACK USING SQLCA;
			DELETE FROM v30_SqlServerIdentityPrimary WHERE v_name = 'NAME00';
			dw_1.DataObject = "d_F169A01W02_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',500)
			dw_1.SetItem(ll_RowNo,'v_name','NAME00')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = true 			//Allow Ouput SqlPreview's SqlSyntax
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			li_IDDataWindow = dw_1.GetItemNumber(dw_1.RowCount(),'id')
			SELECT id
			INTO :li_IDDataBase
			FROM v30_SqlServerIdentityPrimary
			WHERE v_name = 'NAME00';
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key12 = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key12 = "+String ( "Failed!" ) +"~r~n"
			end if
		
//		case lower("DW_datawindow_primary_key13")		
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W02_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',600)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key13 = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key13 = "+String ( "Failed!" ) +"~r~n"
			end if
		
//		case lower("DW_datawindow_primary_key14")		
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W02_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			//Use a DELETE and an INSERT statement when the key is changed
			dw_1.Object.DataWindow.Table.UpdateKeyinPlace = 'NO'
			ll_RowNo = dw_1.GetRow()
			if ll_RowNo > 0 and ll_RowNo <= dw_1.RowCount() then
				ib_DispSyntax = true 			//Allow Ouput SqlPreview's SqlSyntax
				dw_1.SetItem(ll_RowNo,'id',234)
				is_type= "DataWindow"
				timer(1)    
				li_rtn=dw_1.Update( )
				if  li_rtn = 1 then
					commit;
					ls_result += " "+is_testcasename+" "+ls_item + "  primary_key14 = "+String ( "Success!" ) +"~r~n"
					dw_1.retrieve()
				else
					rollback;
					ls_result += " "+is_testcasename+" "+ls_item + "  primary_key14 = "+String ( "Failed!" ) +"~r~n"
				end if
			end if
		
//		case lower("DW_datawindow_primary_key15")		
			ROLLBACK USING SQLCA;
			DELETE FROM v30_SqlServerIdentityPrimary WHERE v_name = 'NAME00';
			dw_1.DataObject = "d_F169A01W02_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			dw_1.Object.DataWindow.Table.UpdateKeyinPlace = 'NO'
			ib_DispSyntax = true  			//Allow Ouput SqlPreview's SqlSyntax
			ll_RowNo = dw_1.GetRow()
			if ll_RowNo > 0 and ll_RowNo <= dw_1.RowCount() then
				dw_1.SetItem(ll_RowNo,'id','456')
				dw_1.SetItem(ll_RowNo,'v_name','NAME00')
			end if
			dw_1.Update()
			li_IDDataWindow = dw_1.GetItemNumber(ll_RowNo,'id')
			SELECT id
			INTO :li_IDDataBase
			FROM v30_SqlServerIdentityPrimary
			WHERE v_name = 'NAME00';
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key15 = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key15 = "+String ( "Failed!" ) +"~r~n"
			end if
		
//		case lower("DW_datawindow_primary_key16")					
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W02_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			//Use a DELETE and an INSERT statement when the key is changed
			dw_1.Object.DataWindow.Table.UpdateKeyinPlace = 'NO'
			ll_RowNo = dw_1.GetRow()
			if ll_RowNo > 0 and ll_RowNo <= dw_1.RowCount() then
				dw_1.SetItem(ll_RowNo,'id','135')
			end if
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key16 = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key16 = "+String ( "Failed!" ) +"~r~n"
			end if	
			
//		case lower("DW_datawindow_primary_key17")		
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W02_02"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			dw_1.Object.DataWindow.Table.UpdateKeyinPlace = 'Yes'
			if ll_RowNo > 0 and ll_RowNo <= dw_1.RowCount() then
				dw_1.SetItem(ll_RowNo,'id',246)
				is_type= "DataWindow"
				timer(1)    
				li_rtn=dw_1.Update( )
				if  li_rtn = 1 then
					commit;
					ls_result += " "+is_testcasename+" "+ls_item + "  primary_key17 = "+String ( "Success!" ) +"~r~n"
				    dw_1.retrieve()
			   else
				    rollback;
				   ls_result += " "+is_testcasename+" "+ls_item + "  primary_key17 = "+String ( "Failed!" ) +"~r~n"
			  end if
			end if
	
//		case lower("DW_datawindow_primary_key18")	
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W02_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key18 = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key18 = "+String ( "Failed!" ) +"~r~n"
			end if
			
//		case lower("DW_datawindow_primary_key19")	
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W02_03"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = true 
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key19 = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key19 = "+String ( "Failed!" ) +"~r~n"
			end if
		
//		case lower("DW_datawindow_primary_key20")	
			ROLLBACK USING SQLCA;
			dw_1.DataObject = "d_F169A01W02_03"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			ib_DispSyntax = false  			//Allow Ouput SqlPreview's SqlSyntax
			ll_RowNo1 = dw_1.InsertRow(0)	
			ll_RowNo2 = dw_1.InsertRow(0)						
			dw_1.SetItem(ll_RowNo2,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo2,'c_sex','M')
			dw_1.SetItem(ll_RowNo2,'i_arg',21)
			dw_1.SetItem(ll_RowNo2,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo2,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo2,'c1','A09')
			dw_1.SetItem(ll_RowNo2,'c2',110)
			ll_RowNo3 = dw_1.InsertRow(0)
			dw_1.SetItem(ll_RowNo3,'v_name','NAME20')
			dw_1.SetItem(ll_RowNo3,'c_sex','W')
			dw_1.SetItem(ll_RowNo3,'i_arg',22)
			dw_1.SetItem(ll_RowNo3,'dt_born',1980-02-03)
			dw_1.SetItem(ll_RowNo3,'dec_salary',1280.20)
			dw_1.SetItem(ll_RowNo3,'c1','A10')
			dw_1.SetItem(ll_RowNo3,'c2',120)
			dw_1.AcceptText()
			dw_1.RowsMove(ll_RowNo3, ll_RowNo3, Primary!, dw_1, 1, filter!)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn > 0 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key20 = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key20 = "+String ( "Failed!" ) +"~r~n"
			end if
			
//		case lower("DW_datawindow_primary_key21")	
			ROLLBACK USING SQLCA;
			//Delete all Row which v_name = 'NAME00'
			DELETE FROM v30_SqlServerIdentityPrimary WHERE v_name = 'NAME00';
			dw_1.DataObject = "d_F169A01W02_01"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			dw_1.setitem(1,2,'appeon')			
			dw_1.deleterow(2)						
			ll_RowNo = dw_1.InsertRow(0)						
			dw_1.SetItem(ll_RowNo,'v_name','NAME00')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',10)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = true				
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			li_IDDataWindow = dw_1.GetItemNumber(dw_1.RowCount(),'id')
			SELECT id
			INTO :li_IDDataBase
			FROM v30_SqlServerIdentityPrimary
			WHERE v_name = 'NAME00';
			if  li_rtn > 0 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key21 = "+String ( "Success!" ) +"~r~n"
				dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  primary_key21 = "+String ( "Failed!" ) +"~r~n"
			end if

end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
Long		ll_RowNo,ll_RowCount
Int		li_IDDataBase,li_IDDataWindow
Int		li_ArgDatase01,li_ArgDatase02,li_ArgDatase03
Int		li_ArgDatawindow01,li_ArgDatawindow02,li_ArgDatawindow03
Long		ll_RowNo1, ll_RowNo2, ll_RowNo3


is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)
ls_array[Upperbound(ls_array) + 1 ] = "DW_datawindow_key"	
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary"			// Look at the Insert Statement if include Identity column while don't input Identity column
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary2"      // Look at the Insert Statement if include Identity column while input Identity column
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary3"      // Insert Statement if can save successfully
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary4"      //Modify Identity column,and look at if if can save successfully(Key Modification is Use Delete then Insert)
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary5"      //Modify Identity column,and look at if if can save successfully(Key Modification is Use Update)
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary01"    //Look at the Insert Statement if include Identity column while don't input Identity column
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary02"     // Look at whether the Insert Row Identity column's value is equal to database row's value(don't input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary03"     //Look at the Identity column status while Insert successfully(don't input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary04"     // Look at the Insert Statement it can save successfully
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary05"     //Look at the Identity column status while Insert successfully(input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary06"     //Modify Identity column,and look at if it can save successfully
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary07"     // Modify Primary column,and look at if it can save successfully
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary08"     // Partly save successfully,look at the Identity column
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary09"     // Partly save successfully,compare the Identity column between database and datawindow
//ls_array[Upperbound(ls_array) + 1 ] = "notprimary10"     // Move row to different buffer and update dw
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
	is_type= ''
	choose case lower(ls_item)
		case lower("DW_datawindow_key")	
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',300)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = false 			//Allow Ouput SqlPreview's SqlSyntax
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  01_notprimary = "+String ( "Success!" ) +"~r~n"
			     dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  01_notprimary = "+String ( "Failed!" ) +"~r~n"
			end if
			
		
//		case lower("notprimary2")			
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',345)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',100)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = false 			//Allow Ouput SqlPreview's SqlSyntax
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  02_notprimary = "+String ( "Success!" ) +"~r~n"
			     dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  02_notprimary = "+String ( "Failed!" ) +"~r~n"
			end if
		
		
//		case lower("notprimary3")
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',400)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',123)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = false 
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn= 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  03_notprimary = "+String ( "Success!" ) +"~r~n"
			     dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  03_notprimary = "+String ( "Failed!" ) +"~r~n"
			end if
		
//		case lower("notprimary4")	
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.GetRow()
			if ll_RowNo > 0 and ll_RowNo <= dw_1.RowCount() then
				ib_DispSyntax = false 			//Allow Ouput SqlPreview's SqlSyntax
				dw_1.SetItem(ll_RowNo,'i_arg',201)
				is_type= "DataWindow"
				timer(1)    
				li_rtn=dw_1.Update( )
		    		if  li_rtn = 1 then
					commit;
					ls_result += " "+is_testcasename+" "+ls_item + "  04_notprimary = "+String ( "Success!" ) +"~r~n"
			     	dw_1.retrieve()
				else
					rollback;
					ls_result += " "+is_testcasename+" "+ls_item + "  04_notprimary = "+String ( "Failed!" ) +"~r~n"
				end if
			end if
		
//		case lower("notprimary5")				
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.GetRow()
			if ll_RowNo > 0 and ll_RowNo <= dw_1.RowCount() then
				ib_DispSyntax = false 			//Allow Ouput SqlPreview's SqlSyntax
				dw_1.SetItem(ll_RowNo,'id',600)
				is_type= "DataWindow"
				timer(1)    
				li_rtn=dw_1.Update( )
				if  li_rtn = 1 then
					commit;
					ls_result += " "+is_testcasename+" "+ls_item + "  05_notprimary = "+String ( "Success!" ) +"~r~n"
			     	dw_1.retrieve()
				else
					rollback;
					ls_result += " "+is_testcasename+" "+ls_item + "  05_notprimary = "+String ( "Failed!" ) +"~r~n"
				end if
		    end if

//		case lower("notprimary01")	
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',234)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			//	dw_1.SetItem(ll_RowNo,'i_arg',103)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = false 			//Allow Ouput SqlPreview's SqlSyntax
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_01 = "+String ( "Success!" ) +"~r~n"
			     dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_01 = "+String ( "Failed!" ) +"~r~n"
			end if
				

//		case lower("notprimary02")	
			ROLLBACK USING SQLCA;
			//Delete all Row which v_name = 'NAME00'
			DELETE FROM v30_SqlServerIdentityNoPrimary WHERE v_name = 'NAME00';
			dw_1.Retrieve()
			ib_DispSyntax = false 			//Allow Ouput SqlPreview's SqlSyntax
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			li_IDDataWindow = dw_1.GetItemNumber(dw_1.RowCount(),'i_arg')
			SELECT i_arg
			INTO :li_IDDataBase
			FROM v30_SqlServerIdentityNoPrimary
			WHERE v_name = 'NAME00';
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_02 = "+String ( "Success!" ) +"~r~n"
			     dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_02 = "+String ( "Failed!" ) +"~r~n"
			end if

//		case lower("notprimary03")	
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',134)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			//	dw_1.SetItem(ll_RowNo,'i_arg',103)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_03 = "+String ( "Success!" ) +"~r~n"
			     dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_03 = "+String ( "Failed!" ) +"~r~n"
			end if
				
//		case lower("notprimary04")	
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)	//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',300)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',156)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = false 	
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_04 = "+String ( "Success!" ) +"~r~n"
			     dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_04 = "+String ( "Failed!" ) +"~r~n"
			end if

//		case lower("notprimary05")	
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',600)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',357)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_05 = "+String ( "Success!" ) +"~r~n"
			     dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_05 = "+String ( "Failed!" ) +"~r~n"
			end if

//		case lower("notprimary06")	
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.GetRow()
			if ll_RowNo > 0 and ll_RowNo <= dw_1.RowCount() then
				ib_DispSyntax = false 			//Allow Ouput SqlPreview's SqlSyntax
				dw_1.SetItem(ll_RowNo,'i_arg',342)
				is_type= "DataWindow"
				timer(1)    
				li_rtn=dw_1.Update( )
				if  li_rtn = 1 then
					commit;
					ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_06 = "+String ( "Success!" ) +"~r~n"
			    		 dw_1.retrieve()
				else
					rollback;
					ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_06 = "+String ( "Failed!" ) +"~r~n"
				end if
			end if

//		case lower("notprimary07")	
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.GetRow()
			if ll_RowNo > 0 and ll_RowNo <= dw_1.RowCount() then
				dw_1.SetItem(ll_RowNo,'id',246)
				is_type= "DataWindow"
				timer(1)    
				li_rtn=dw_1.Update( )
				if  li_rtn = 1 then
					commit;
					ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_07 = "+String ( "Success!" ) +"~r~n"
			   	  dw_1.retrieve()
				else
					rollback;
					ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_07 = "+String ( "Failed!" ) +"~r~n"
				end if
			end if

//		case lower("notprimary08")	
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',234)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			//	dw_1.SetItem(ll_RowNo,'i_arg',103)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',1280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',120)
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',356)
			dw_1.SetItem(ll_RowNo,'v_name','NAME20')
			dw_1.SetItem(ll_RowNo,'c_sex','W')
			//	dw_1.SetItem(ll_RowNo,'i_arg',103)
			dw_1.SetItem(ll_RowNo,'dt_born',1981-07-08)
			dw_1.SetItem(ll_RowNo,'dec_salary',5280.20)
			dw_1.SetItem(ll_RowNo,'c1','A10')
			dw_1.SetItem(ll_RowNo,'c2',121)
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			dw_1.SetItem(ll_RowNo,'id',356)
			dw_1.SetItem(ll_RowNo,'v_name','NAME21')
			dw_1.SetItem(ll_RowNo,'c_sex','W')
			//	dw_1.SetItem(ll_RowNo,'i_arg',103)
			dw_1.SetItem(ll_RowNo,'dt_born',1982-07-29)
			dw_1.SetItem(ll_RowNo,'dec_salary',2820.20)
			dw_1.SetItem(ll_RowNo,'c1','A11')
			dw_1.SetItem(ll_RowNo,'c2',122)
			ib_DispSyntax = false 
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_08 = "+String ( "Success!" ) +"~r~n"
			     dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_08 = "+String ( "Failed!" ) +"~r~n"
			end if

//		case lower("notprimary09")	
			ROLLBACK USING SQLCA;
			DELETE FROM v30_SqlServerIdentityNoPrimary WHERE v_name = 'NAME001' OR v_name = 'NAME002' OR v_name = 'NAME003';
			dw_1.Retrieve()
			ll_RowCount = dw_1.RowCount()
			if ll_RowCount < 3 then return
				li_ArgDatawindow01 = dw_1.GetItemNumber(ll_RowCount - 2,'i_arg')
				li_ArgDatawindow02 = dw_1.GetItemNumber(ll_RowCount - 1,'i_arg')
				li_ArgDatawindow03 = dw_1.GetItemNumber(ll_RowCount - 0,'i_arg')
				SELECT i_arg
				INTO :li_ArgDatase01
				FROM v30_SqlServerIdentityNoPrimary
				WHERE v_name = 'NAME001';
				SELECT i_arg
				INTO :li_ArgDatase02
				FROM v30_SqlServerIdentityNoPrimary
				WHERE v_name = 'NAME002';
				SELECT i_arg
				INTO :li_ArgDatase03
				FROM v30_SqlServerIdentityNoPrimary
				WHERE v_name = 'NAME003';
				is_type= "DataWindow"
				timer(1)    
				li_rtn=dw_1.Update( )
				if  li_rtn = 1 then
					commit;
					ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_09 = "+String ( "Success!" ) +"~r~n"
			     	dw_1.retrieve()
				else
					rollback;
					ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_09 = "+String ( "Failed!" ) +"~r~n"
				end if

//		case lower("notprimary10")	
			ROLLBACK USING SQLCA;
			DELETE FROM v30_SqlServerIdentityNoPrimary WHERE v_name = 'NAME001' OR v_name = 'NAME002' OR v_name = 'NAME003';
			dw_1.Retrieve()
			ll_RowNo1 = dw_1.InsertRow(0)
			ll_RowNo2 = dw_1.InsertRow(0)
			dw_1.SetItem(ll_RowNo2,'id',234)
			dw_1.SetItem(ll_RowNo2,'v_name','NAME001')
			dw_1.SetItem(ll_RowNo2,'c_sex','M')
			//	dw_1.SetItem(ll_RowNo2,'i_arg',103)
			dw_1.SetItem(ll_RowNo2,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo2,'dec_salary',1280.20)
			dw_1.SetItem(ll_RowNo2,'c1','A09')
			dw_1.SetItem(ll_RowNo2,'c2',120)
			ll_RowNo3 = dw_1.InsertRow(0)
			dw_1.SetItem(ll_RowNo3,'id',235)
			dw_1.SetItem(ll_RowNo3,'v_name','NAME002')
			dw_1.SetItem(ll_RowNo3,'c_sex','W')
			//	dw_1.SetItem(ll_RowNo3,'i_arg',104)
			dw_1.SetItem(ll_RowNo3,'dt_born',1980-02-03)
			dw_1.SetItem(ll_RowNo3,'dec_salary',2280.20)
			dw_1.SetItem(ll_RowNo3,'c1','A10')
			dw_1.SetItem(ll_RowNo3,'c2',130)
			dw_1.AcceptText()
			dw_1.RowsMove(ll_RowNo3, ll_RowNo3, Primary!,  dw_1, 1, filter!)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_10 = "+String ( "Success!" ) +"~r~n"
			     dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  notprimary_10 = "+String ( "Failed!" ) +"~r~n"
			end if

	end choose 
	next 

is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module2 ();
//Identiy have many column
string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
Long		    ll_RowNo
Int		         li_IDDataBase,li_IDDataWindow

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)
ls_array[Upperbound(ls_array) + 1 ] = "Identiy have many column"	
//ls_array[Upperbound(ls_array) + 1 ] = "case1"			//Look at the Insert Statement if include Identity column while don't input Identity column
//ls_array[Upperbound(ls_array) + 1 ] = "case2"         // Look at Identity column value while don't input Identity column
//ls_array[Upperbound(ls_array) + 1 ] = "case3"         //Look at the Integer Identity column status while don't input Identity colum
//ls_array[Upperbound(ls_array) + 1 ] = "case4"         // Look at the Integer Identity column status while input Identity column
//ls_array[Upperbound(ls_array) + 1 ] = "case5"        //Insert a row ,and then Look at the Integer Identity column value whether has been write to database while input Identity colum
//ls_array[Upperbound(ls_array) + 1 ] = "case6"        //Modify a row ,and then Look at the Integer Identity column value whether has been write to database
//ls_array[Upperbound(ls_array) + 1 ] = "case7"       //Insert a row ,and then Look at the Identity column status(Update(true,false))

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
	is_type= ""
	choose case lower(ls_item)
		case lower("Identiy have many column")	
		ROLLBACK USING SQLCA;
		dw_1.Retrieve()
		ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
		//	dw_1.SetItem(ll_RowNo,'id',234)
		dw_1.SetItem(ll_RowNo,'v_name','NAME19')
		dw_1.SetItem(ll_RowNo,'c_sex','M')
		//	dw_1.SetItem(ll_RowNo,'i_arg',103)
		dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
		dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
		dw_1.SetItem(ll_RowNo,'c1','A09')
		dw_1.SetItem(ll_RowNo,'c2',110)
		ib_DispSyntax = false
		is_type= "DataWindow"
		timer(1)    
		li_rtn=dw_1.Update( )
		if  li_rtn = 1 then
			commit;
			ls_result += " "+is_testcasename+" "+ls_item + "  case1  = "+String ( "Success!" ) +"~r~n"
		    dw_1.retrieve()
		else
			rollback;
			ls_result += " "+is_testcasename+" "+ls_item + "  case1 = "+String ( "Failed!" ) +"~r~n"
		end if
		
//		case lower("case2")	
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			//	dw_1.SetItem(ll_RowNo,'id',234)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			//	dw_1.SetItem(ll_RowNo,'i_arg',103)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = false
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  case2  = "+String ( "Success!" ) +"~r~n"
		   		 dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  case2 = "+String ( "Failed!" ) +"~r~n"
			end if
		
//		case lower("case3")
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			//	dw_1.SetItem(ll_RowNo,'id',234)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			//	dw_1.SetItem(ll_RowNo,'i_arg',103)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  case3  = "+String ( "Success!" ) +"~r~n"
		  	    dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  case3 = "+String ( "Failed!" ) +"~r~n"
			end if
		
//		case lower("case4")
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			//	dw_1.SetItem(ll_RowNo,'id',234)
			dw_1.SetItem(ll_RowNo,'v_name','NAME19')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',103)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  case4  = "+String ( "Success!" ) +"~r~n"
		  	    dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  case4 = "+String ( "Failed!" ) +"~r~n"
			end if
		
//		case lower("case5")
			ROLLBACK USING SQLCA;
			//Delete all Row which v_name = 'NAME00'
			DELETE FROM v30_SqlServerMulIdentity WHERE v_name = 'NAME00';
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			//	dw_1.SetItem(ll_RowNo,'id',234)
			dw_1.SetItem(ll_RowNo,'v_name','NAME00')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			dw_1.SetItem(ll_RowNo,'i_arg',103)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			ib_DispSyntax = false 			//Allow Ouput SqlPreview's SqlSyntax
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			li_IDDataWindow = dw_1.GetItemNumber(dw_1.RowCount(),'i_arg')
			SELECT i_arg
			INTO :li_IDDataBase
			FROM v30_SqlServerMulIdentity
			WHERE v_name = 'NAME00';
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  case5  = "+String ( "Success!" ) +"~r~n"
		  	    dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  case5  = "+String ( "Failed!" ) +"~r~n"
			end if
			
		
		
//		case lower("case6")
			ROLLBACK USING SQLCA;
			DELETE FROM v30_SqlServerMulIdentity WHERE id = 222 or i_arg = 321;
			dw_1.Retrieve()
			ll_RowNo = dw_1.GetRow()
			if ll_RowNo > 0 and ll_RowNo <= dw_1.RowCount() then
			dw_1.SetItem(ll_RowNo,'id',222)
			dw_1.SetItem(ll_RowNo,'i_arg',321)
			is_type= "DataWindow"
			timer(1)   
			li_rtn=dw_1.Update( )
			li_IDDataWindow = dw_1.GetItemNumber(ll_RowNo,'i_arg')
			SELECT i_arg
			INTO :li_IDDataBase
			FROM v30_SqlServerMulIdentity
			WHERE id = 222;
				if  li_rtn = 1 then
					commit;
					ls_result += " "+is_testcasename+" "+ls_item + "  case6  = "+String ( "Success!" ) +"~r~n"
		  	    		dw_1.retrieve()
				else
					rollback;
					ls_result += " "+is_testcasename+" "+ls_item + "  case6 = "+String ( "Failed!" ) +"~r~n"
				end if
			end if
			
		
//		case lower("case7")
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
			//	dw_1.SetItem(ll_RowNo,'id',234)
			dw_1.SetItem(ll_RowNo,'v_name','NAME00')
			dw_1.SetItem(ll_RowNo,'c_sex','M')
			//	dw_1.SetItem(ll_RowNo,'i_arg',103)
			dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
			dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
			dw_1.SetItem(ll_RowNo,'c1','A09')
			dw_1.SetItem(ll_RowNo,'c2',110)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  case7  = "+String ( "Success!" ) +"~r~n"
		  	    dw_1.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  case7 = "+String ( "Failed!" ) +"~r~n"
			end if
		
	end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module3 ();//Identity is fasle
string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
Long		    ll_RowNo
Int		         li_IDDataBase,li_IDDataWindow

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)
ls_array[Upperbound(ls_array) + 1 ] = " Identity is fasle"	
//ls_array[Upperbound(ls_array) + 1 ] = "case1"			// Look at the Identity column data after saved(dw_2:Insert a row and don't input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "case2"         //  Look at the Identity column status after saved(dw_2:Insert a row and don't input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "case3"         //Look at if can save successfully(dw_1:Insert a row and input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "case4"         //  Look at the Identity column data after saved(dw_2:Insert a row and input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "case5"        //Look at if can save successfully(dw_2:Modify a row's Identity column)
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
is_type= ""
choose case lower(ls_item)
	case lower(" Identity is fasle")	
		ROLLBACK USING SQLCA;
		dw_2.Retrieve()
		ll_RowNo = dw_2.InsertRow(0)						//Insert a Row at end
		dw_2.ScrollToRow(ll_RowNo)
		//	dw_2.SetItem(ll_RowNo,'id',234)
		dw_2.SetItem(ll_RowNo,'v_name','NAME19')
		dw_2.SetItem(ll_RowNo,'c_sex','M')
		dw_2.SetItem(ll_RowNo,'i_arg',103)
		dw_2.SetItem(ll_RowNo,'dt_born',1980-01-03)
		dw_2.SetItem(ll_RowNo,'dec_salary',280.20)
		dw_2.SetItem(ll_RowNo,'c1','A09')
		dw_2.SetItem(ll_RowNo,'c2',110)
		is_type= "DataWindow"
		timer(1)    
		li_rtn=dw_2.Update( )
		if  li_rtn = 1 then
			commit;
			ls_result += " "+is_testcasename+" "+ls_item + "  case1  = "+String ( "Success!" ) +"~r~n"
		    dw_2.retrieve()
		else
			rollback;
			ls_result += " "+is_testcasename+" "+ls_item + "  case1 = "+String ( "Failed!" ) +"~r~n"
		end if

//	case lower("case2")	
		ROLLBACK USING SQLCA;
		dw_2.Retrieve()
		ll_RowNo = dw_2.InsertRow(0)						//Insert a Row at end
		dw_2.ScrollToRow(ll_RowNo)
		//	dw_2.SetItem(ll_RowNo,'id',234)
		dw_2.SetItem(ll_RowNo,'v_name','NAME19')
		dw_2.SetItem(ll_RowNo,'c_sex','M')
		dw_2.SetItem(ll_RowNo,'i_arg',103)
		dw_2.SetItem(ll_RowNo,'dt_born',1980-01-03)
		dw_2.SetItem(ll_RowNo,'dec_salary',280.20)
		dw_2.SetItem(ll_RowNo,'c1','A09')
		dw_2.SetItem(ll_RowNo,'c2',110)
		is_type= "DataWindow"
		timer(1)    
		li_rtn=dw_2.Update( )
		if  li_rtn = 1 then
			commit;
			ls_result += " "+is_testcasename+" "+ls_item + "  case2  = "+String ( "Success!" ) +"~r~n"
		    dw_2.retrieve()
		else
			rollback;
			ls_result += " "+is_testcasename+" "+ls_item + "  case2  = "+String ( "Failed!" ) +"~r~n"
		end if

//	case lower("case3")
		ROLLBACK USING SQLCA;
		dw_1.Retrieve()
		ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
		dw_1.ScrollToRow(ll_RowNo)
		dw_1.SetItem(ll_RowNo,'id',225)
		dw_1.SetItem(ll_RowNo,'v_name','NAME19')
		dw_1.SetItem(ll_RowNo,'c_sex','M')
		dw_1.SetItem(ll_RowNo,'i_arg',103)
		dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
		dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
		dw_1.SetItem(ll_RowNo,'c1','A09')
		dw_1.SetItem(ll_RowNo,'c2',110)
		is_type= "DataWindow"
		timer(1)    
		li_rtn=dw_1.Update( )
		if  li_rtn = 1 then
			commit;
			ls_result += " "+is_testcasename+" "+ls_item + "  case3  = "+String ( "Success!" ) +"~r~n"
		    dw_1.retrieve()
		else
			rollback;
			ls_result += " "+is_testcasename+" "+ls_item + "  case3 = "+String ( "Failed!" ) +"~r~n"
		end if


//	case lower("case4")
		ROLLBACK USING SQLCA;
		dw_2.Retrieve()
		ll_RowNo = dw_2.InsertRow(0)						//Insert a Row at end
		dw_2.ScrollToRow(ll_RowNo)
		dw_2.SetItem(ll_RowNo,'id',572)
		dw_2.SetItem(ll_RowNo,'v_name','NAME00')
		dw_2.SetItem(ll_RowNo,'c_sex','M')
		dw_2.SetItem(ll_RowNo,'i_arg',103)
		dw_2.SetItem(ll_RowNo,'dt_born',1980-01-03)
		dw_2.SetItem(ll_RowNo,'dec_salary',280.20)
		dw_2.SetItem(ll_RowNo,'c1','A09')
		dw_2.SetItem(ll_RowNo,'c2',110)
		is_type= "DataWindow"
		timer(1)    
		li_rtn=dw_2.Update( )
		if  li_rtn <> 1 then
			commit;
			ls_result += " "+is_testcasename+" "+ls_item + "  case4  = "+String ( "Success!" ) +"~r~n"
		    dw_2.retrieve()
		else
			rollback;
			ls_result += " "+is_testcasename+" "+ls_item + "  case4  = "+String ( "Failed!" ) +"~r~n"
		end if

//	case lower("case5")
		ROLLBACK USING SQLCA;
		dw_2.Retrieve()
		ll_RowNo = dw_2.GetRow()
		if ll_RowNo > 0 and ll_RowNo <= dw_2.RowCount() then
			dw_2.SetItem(ll_RowNo,'id',539)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_2.Update( )
			if  li_rtn <> 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  case5  = "+String ( "Success!" ) +"~r~n"
		 	   dw_2.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  case5  = "+String ( "Failed!" ) +"~r~n"
			end if
		end if


end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module4 ();//Identity is true
string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
Long		    ll_RowNo
Int		         li_IDDataBase,li_IDDataWindow

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)
ls_array[Upperbound(ls_array) + 1 ] = " Identity is true"	
//ls_array[Upperbound(ls_array) + 1 ] = "case1"			// Look at the dw_2's Identity column data after saved(dw_1:Insert a row and don't input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "case2"           // Look at the dw_2's Identity column status after saved(dw_1:Insert a row and don't input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "case3"           //Look at dw_2 whether can save successfully(dw_2:Insert a row and input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "case4"          // Look at the dw_1's Identity column status after saved(dw_2:Insert a row and input Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "case5"         //Look at the dw_1's Identity column data and dw_2' Identity column data after saved(Modify dw_2's Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "case6"         //Look at the dw_1's Identity column data and database Identity column data after saved(Modify dw_2's Identity column)
//ls_array[Upperbound(ls_array) + 1 ] = "case7"        //Look at the dw_2's Identity column status after saved(dw_1:Insert a row and don't input Identity column,and Update(true,false))

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
is_type= ""
choose case lower(ls_item)
	case lower(" Identity is true")	
		ROLLBACK USING SQLCA;
	    dw_1.Retrieve()
	    ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
		dw_1.ScrollToRow(ll_RowNo)
		 dw_1.SetItem(ll_RowNo,'v_name','NAME19')
		dw_1.SetItem(ll_RowNo,'c_sex','M')
		dw_1.SetItem(ll_RowNo,'i_arg',103)
		dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
		dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
		dw_1.SetItem(ll_RowNo,'c1','A09')
		dw_1.SetItem(ll_RowNo,'c2',110)
		is_type= "DataWindow"
		timer(1)    
		li_rtn=dw_1.Update( )
		if  li_rtn = 1 then
			commit;
			ls_result += " "+is_testcasename+" "+ls_item + "  case1  = "+String ( "Success!" ) +"~r~n"
		    dw_1.retrieve()
		else
			rollback;
			ls_result += " "+is_testcasename+" "+ls_item + "  case1 = "+String ( "Failed!" ) +"~r~n"
		end if

//	case lower("case2")	
		ROLLBACK USING SQLCA;
		dw_1.Retrieve()
		ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
		dw_1.ScrollToRow(ll_RowNo)
	     dw_1.SetItem(ll_RowNo,'v_name','NAME19')
		dw_1.SetItem(ll_RowNo,'c_sex','M')
		dw_1.SetItem(ll_RowNo,'i_arg',103)
		dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
		dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
		dw_1.SetItem(ll_RowNo,'c1','A09')
		dw_1.SetItem(ll_RowNo,'c2',110)
		is_type= "DataWindow"
		timer(1)    
		li_rtn=dw_1.Update( )
		if  li_rtn = 1 then
			commit;
			ls_result += " "+is_testcasename+" "+ls_item + "  case2  = "+String ( "Success!" ) +"~r~n"
		    dw_1.retrieve()
		else
			rollback;
			ls_result += " "+is_testcasename+" "+ls_item + "  case2  = "+String ( "Failed!" ) +"~r~n"
		end if

//	case lower("case3")
		ROLLBACK USING SQLCA;
		dw_2.Retrieve()
		ll_RowNo = dw_2.InsertRow(0)						//Insert a Row at end
		dw_2.ScrollToRow(ll_RowNo)
		dw_2.SetItem(ll_RowNo,'id',225)
		dw_2.SetItem(ll_RowNo,'v_name','NAME19')
		dw_2.SetItem(ll_RowNo,'c_sex','M')
		dw_2.SetItem(ll_RowNo,'i_arg',103)
		dw_2.SetItem(ll_RowNo,'dt_born',1980-01-03)
		dw_2.SetItem(ll_RowNo,'dec_salary',280.20)
		dw_2.SetItem(ll_RowNo,'c1','A09')
		dw_2.SetItem(ll_RowNo,'c2',110)
		is_type= "DataWindow"
		timer(1)    
		li_rtn=dw_2.Update( )
		if  li_rtn <> 1 then
			commit;
			ls_result += " "+is_testcasename+" "+ls_item + "  case3  = "+String ( "Success!" ) +"~r~n"
		    dw_2.retrieve()
		else
			rollback;
			ls_result += " "+is_testcasename+" "+ls_item + "  case3 = "+String ( "Failed!" ) +"~r~n"
		end if


//	case lower("case4")
		ROLLBACK USING SQLCA;
		dw_2.Retrieve()
		ll_RowNo = dw_2.InsertRow(0)						//Insert a Row at end
		dw_2.ScrollToRow(ll_RowNo)
		dw_2.SetItem(ll_RowNo,'id',234)
		dw_2.SetItem(ll_RowNo,'v_name','NAME19')
		dw_2.SetItem(ll_RowNo,'c_sex','M')
		dw_2.SetItem(ll_RowNo,'i_arg',103)
		dw_2.SetItem(ll_RowNo,'dt_born',1980-01-03)
		dw_2.SetItem(ll_RowNo,'dec_salary',280.20)
		dw_2.SetItem(ll_RowNo,'c1','A09')
		dw_2.SetItem(ll_RowNo,'c2',110)
		is_type= "DataWindow"
		timer(1)    
		li_rtn=dw_2.Update( )
		if  li_rtn <> 1 then
			commit;
			ls_result += " "+is_testcasename+" "+ls_item + "  case4  = "+String ( "Success!" ) +"~r~n"
		    dw_2.retrieve()
		else
			rollback;
			ls_result += " "+is_testcasename+" "+ls_item + "  case4  = "+String ( "Failed!" ) +"~r~n"
		end if

//	case lower("case5")
		ROLLBACK USING SQLCA;
		dw_2.Retrieve()
		ll_RowNo = dw_2.GetRow()
		if ll_RowNo > 0 and ll_RowNo <= dw_2.RowCount() then
			dw_2.SetItem(ll_RowNo,'id',539)
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_2.Update( )
			if  li_rtn <> 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  case5  = "+String ( "Success!" ) +"~r~n"
		 	   dw_2.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  case5  = "+String ( "Failed!" ) +"~r~n"
			end if
		end if

//	case lower("case6")
		ROLLBACK USING SQLCA;
		DELETE FROM v30_SqlServerIdentityPrimary WHERE v_name = 'NAME00';
		dw_2.Retrieve()
		ll_RowNo = dw_2.GetRow()
		if ll_RowNo > 0 and ll_RowNo <= dw_2.RowCount() then
			dw_2.SetItem(ll_RowNo,'id',539)
			dw_2.SetItem(ll_RowNo,'v_name','NAME00')
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_2.Update( )
			if  li_rtn <> 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  case6  = "+String ( "Success!" ) +"~r~n"
				dw_2.retrieve()
			else
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  case6  = "+String ( "Failed!" ) +"~r~n"
			end if
		end if
	

//	case lower("case7")
		ROLLBACK USING SQLCA;
		dw_1.Retrieve()
		ll_RowNo = dw_1.InsertRow(0)						//Insert a Row at end
		dw_1.ScrollToRow(ll_RowNo)
		dw_1.SetItem(ll_RowNo,'v_name','NAME19')
		dw_1.SetItem(ll_RowNo,'c_sex','M')
		dw_1.SetItem(ll_RowNo,'i_arg',103)
		dw_1.SetItem(ll_RowNo,'dt_born',1980-01-03)
		dw_1.SetItem(ll_RowNo,'dec_salary',280.20)
		dw_1.SetItem(ll_RowNo,'c1','A09')
		dw_1.SetItem(ll_RowNo,'c2',110)
		is_type= "DataWindow"
		timer(1)    
		li_rtn=dw_1.Update( )
		if  li_rtn = 1 then
			commit;
			ls_result += " "+is_testcasename+" "+ls_item + "  case7  = "+String ( "Success!" ) +"~r~n"
			dw_2.retrieve()
		else
			rollback;
			ls_result += " "+is_testcasename+" "+ls_item + "  case7  = "+String ( "Failed!" ) +"~r~n"
		end if
	


end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module5 ();//Identity column
string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i ,j, ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
Long		    ll_RowNo
Int		         li_IDDataBase,li_IDDataWindow
string	         ls_str

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)
ls_array[Upperbound(ls_array) + 1 ] = "Identity column"	
//ls_array[Upperbound(ls_array) + 1 ] = "case1"			// Insert 1000 record
//ls_array[Upperbound(ls_array) + 1 ] = "case2"           // delay Insert 1000 record
//ls_array[Upperbound(ls_array) + 1 ] = "case3"           //Use Insert statement insert 1000 record

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
	is_type= ""
	choose case lower(ls_item)
		case lower("Identity column")	
			ROLLBACK USING SQLCA;
			 dw_1.Retrieve()
			 for j  = 1 to 1000 
				ll_RowNo = dw_1.insertrow(0)
				dw_1.object.v_name[ll_RowNo] = "NAME" + string(j)
				dw_1.object.c_sex[ll_RowNo] = "M"
				dw_1.object.dt_born[ll_RowNo] = 1980-01-01
				dw_1.object.i_arg[ll_RowNo] =j
				dw_1.object.dec_salary[ll_RowNo] = 123.45
				dw_1.object.c1[ll_RowNo] = string(j)
				dw_1.object.c2[ll_RowNo] = j
			next
				 is_type= "DataWindow"
				timer(1)    
				li_rtn=dw_1.Update( )
				 if  li_rtn = 1 then
					commit;
					ls_result +=" "+is_testcasename+" "+ls_item+ "  case1  = "+String ( "Success!" ) +"~r~n"
					 dw_1.retrieve()
				else
					rollback;
					ls_result += " "+is_testcasename+" "+ls_item + "  case1 = "+String ( "Failed!" ) +"~r~n"
				end if
	
	//	case lower("case2")	
			ROLLBACK USING SQLCA;
			dw_1.Retrieve()
			for i  = 1 to 1000 
			ll_RowNo = dw_1.insertrow(0)
			dw_1.object.v_name[ll_RowNo] = "NAME" + string(i)
			dw_1.object.c_sex[ll_RowNo] = "M"
			dw_1.object.dt_born[ll_RowNo] = 1980-01-01
			dw_1.object.i_arg[ll_RowNo] = i
			dw_1.object.dec_salary[ll_RowNo] = 123.45
			dw_1.object.c1[ll_RowNo] = string(i)
			dw_1.object.c2[ll_RowNo] = i
			 next
			  ib_sleep = true
			is_type= "DataWindow"
			timer(1)    
			li_rtn=dw_1.Update( )
			if  li_rtn = 1 then
				commit;
				ls_result += " "+is_testcasename+" "+ls_item + "  case2  = "+String ( "Success!" ) +"~r~n"
				 dw_1.retrieve()
			else
				 ib_sleep = true
				rollback;
				ls_result += " "+is_testcasename+" "+ls_item + "  case2  = "+String ( "Failed!" ) +"~r~n"
			end if
	
	//	case lower("case3")
			ROLLBACK USING SQLCA;
			  dw_1.Retrieve()
			for i  = 1 to 1000
				ls_str = string(i)
				Insert into v30_SqlServerIdentityCol02(
				v_name, c_sex,  dt_born, i_arg, dec_salary, c1, c2) 
				values ( "NAME" + :ls_str, "M", 1981-02-02, 1, 456.78, :ls_str, :i);
				Commit;	
			next
				  SetPointer(arrow!)
				is_type= "DataWindow"
				timer(1)    
				li_rtn=dw_1.Update( )
				if  li_rtn = 1 then
					commit;
					ls_result += " "+is_testcasename+" "+ls_item + "  case3  = "+String ( "Success!" ) +"~r~n"
					dw_2.retrieve()
				else
					rollback;
					ls_result += " "+is_testcasename+" "+ls_item + "  case3 = "+String ( "Failed!" ) +"~r~n"
				end if
	
	end choose 
next 

is_resultlog += ls_result
end subroutine

event ue_init_data;call super::ue_init_data;sqlca.autocommit = true
declare initprokey procedure for v30_sqlservermulidentity_init  using sqlca;
execute initprokey ;
sqlca.autocommit = false

sqlca.autocommit = true
declare initprokey1 procedure for v30_SqlServerIdentityNoPrimary  using sqlca;
execute initprokey1 ;
sqlca.autocommit = false

sqlca.autocommit = true
declare initprokey2  procedure for v30_SqlServerMulIdentity  using sqlca;
execute initprokey2 ;
sqlca.autocommit = false


sqlca.autocommit = true
declare initprokey3  procedure for v30_SqlServerIdentityPrimary  using sqlca;
execute initprokey3 ;
sqlca.autocommit = false

sqlca.autocommit = true
declare initprokey4  procedure for v30_SqlServerIdentityCol02  using sqlca;
execute initprokey4 ;
sqlca.autocommit = false









end event

on w_datawindow_key.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.gb_1
end on

on w_datawindow_key.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event timer;call super::timer;wf_closepopwindow("DataWindow Error","OK")
end event

event open;call super::open;timer(0.1)
end event

type dw_2 from datawindow within w_datawindow_key
integer x = 2299
integer y = 1176
integer width = 2651
integer height = 964
integer taborder = 30
string title = "none"
string dataobject = "d_f169a01w01_01"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve()
end event

type cb_1 from commandbutton within w_datawindow_key
integer x = 375
integer y = 824
integer width = 457
integer height = 152
integer taborder = 30
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;of_testcase_point_module()
of_testcase_point_module1()
of_testcase_point_module2()
of_testcase_point_module3()
end event

type dw_1 from datawindow within w_datawindow_key
integer x = 2313
integer y = 248
integer width = 2651
integer height = 856
integer taborder = 10
string title = "none"
string dataobject = "d_f169a01w01_01"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.settransobject(sqlca)
this.retrieve()
end event

type gb_1 from groupbox within w_datawindow_key
integer x = 2208
integer width = 2843
integer height = 1960
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "group box"
end type

