$PBExportHeader$w_trycatch.srw
forward
global type w_trycatch from w_base_case
end type
type dw_1 from datawindow within w_trycatch
end type
end forward

global type w_trycatch from w_base_case
integer width = 3205
integer height = 1992
event type integer ue_err_noreturn ( )
dw_1 dw_1
end type
global w_trycatch w_trycatch

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public function integer wf_error_noreturn ()
public function integer wf_test (integer ai_parm1[], integer ai_index)
end prototypes

event type integer ue_err_noreturn();
If 1 <> 1 Then 
	Return 1
End If 
end event

public subroutine of_testcase_point_module ();//
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

ls_array = {"001_noerror","002_zero","003_runtimeerror","004_other1","005_other2","006_other3","007_final","008_runtime","009_error","010_other","011_other","012_manu","013_other","014_other","015_other","016_more"}
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
		case lower("001_noerror")	
			Try
				If dw_1.RowCount() > 0 Then 
					String	ls_id, ls_Name, ls_sex
					DateTime ldt_Born
					Integer	li_arg
					Decimal	ldec_salary
					ls_Id = dw_1.Object.c_id[1]
					ls_Name = dw_1.Object.v_Name[1]
					ldt_born = dw_1.Object.dt_Born[1]
					li_arg = dw_1.Object.i_arg[1]
					ls_sex = dw_1.Object.c_sex[1]
					ldec_salary = dw_1.Object.dec_salary[1]
					ls_result += "w_trycatch.001_noerror = No error occured.~r~n"
				End If	
			Catch(Throwable ex01)   
				ls_result += "w_trycatch.001_noerror = "+ex01.getmessage()+"~r~n"
			End Try
		case lower("002_zero")			
			Try
				Integer li_Result
				li_Result = 1 / 0 
			Catch(DivideByZeroError ex02)   
				ls_result += "w_trycatch.002_zero = "+ex02.getmessage()+"~r~n"
			End Try	
		case '003_runtimeerror'
			Try
				String	ls_Name3
				ls_Name3 = dw_1.Object.v_name[dw_1.RowCount() + 1]
			Catch(DwRuntimeError ex03)   
				ls_result += "w_trycatch.003_runtimeerror = "+ ex03.GetMessage()+"~r~n"
			End Try
		case "004_other1"
			Try    
				dw_1.Object.v_name[1] = dw_1.Object.dt_born[1]
			Catch(NullObjectError ex04_1)
				ls_result+="w_trycatch.004_other1.nullobjecterror = " + ex04_1.GetMessage()+"~r~n"
			Catch(RuntimeError ex04_2)
				ls_result+="w_trycatch.004_other1.runtimeerror = " + ex04_2.GetMessage()+"~r~n"
			Catch(Exception ex04_3)
				ls_result+="w_trycatch.004_other1.exception = " + ex04_3.GetMessage()+"~r~n"
			End Try	
		case '005_other2'
			Try    
				dw_1.Object.abcde = 123456
			Catch(NullObjectError ex05_1)
				ls_result+="w_trycatch.005_other2.nullobjecterror = " + ex05_1.GetMessage()+"~r~n"
			Catch(RuntimeError ex05_2)
				ls_result+="w_trycatch.005_other2.runtimeerror = " + ex05_2.GetMessage()+"~r~n"
			Catch(Exception ex05_3)
				ls_result+="w_trycatch.005_other2.exception = " + ex05_3.GetMessage()+"~r~n"
			End Try	
		case "006_other3"
			Try 
				dw_1.GetItemString(1, 'abcd')
			Catch(NullObjectError ex06_1)
				ls_result+="w_trycatch.006_other3.nullobjecterror = " + ex06_1.GetMessage()+"~r~n"
			Catch(RuntimeError ex06_2)
				ls_result+="w_trycatch.006_other3.runtimeerror = " + ex06_2.GetMessage()+"~r~n"
			Catch(Exception ex06_3)
				ls_result+="w_trycatch.006_other3.exception = " + ex06_3.GetMessage()+"~r~n"
			End Try	
		case "007_final"
			Try
				If dw_1.RowCount() > 0 Then 
					dw_1.DeleteRow(dw_1.RowCount())
				Else
					dw_1.InsertRow(0)
				End If
			Finally
				ls_result +="w_trycatch.007_final = final script no error.~r~n"
			End Try
		case "008_runtime"
			Try 
				dw_1.Reset()
				dw_1.GetItemNumber(4, 'i_arg')
			catch (runtimeerror ex08)
				ls_result+="w_trycatch.008_runtime = "+ex08.getmessage()+"~r~n"
			Finally
				ls_result +="w_trycatch.008_runtime = final script with no catch script.~r~n"
			End Try	
		case "009_error"
			Try
				window lw_1
				Open(lw_1, 'w_withnowidnow')
			Catch(Throwable ex09)   
				ls_result +="w_trycatch.009_error = "+ex09.GetMessage()+"~r~n"
			Finally
				ls_result +="w_trycatch.009_error = OutPut in Finally Script.~r~n"
			End Try	
		case '010_other'
			Try
				Setnull(dw_1)
				dw_1.Enabled = false
			Catch(DwRuntimeError ex10_1)   
				ls_result+="w_trycatch.010_other = " + ex10_1.GetMessage()+"~r~n"
			Catch(NullObjectError ex10_2)   
				ls_result+="w_trycatch.010_other = " + ex10_2.GetMessage()+"~r~n"
			Catch(RuntimeError ex10_3)
				ls_result+="w_trycatch.010_other = " + ex10_3.GetMessage()+"~r~n"
			Finally
				ls_result+="w_trycatch.010_other = OutPut in Finally Script~r~n"
			End Try
		case '011_other'
			Try 
				NullObjectError 	e11_1
				Exception 			e11_2
				DwRuntimeError 	e11_3
				CorbaInternal 		e11_4
				e11_1 = Create NullObjectError
				e11_2 = Create Exception
				e11_3 = Create RuntimeError
				e11_4 = Create CorbaInternal
				e11_1.setMessage('Throw NullObjectError e11_1.') 
				e11_2.setMessage('Throw Exception e11_2.') 
				e11_3.setMessage('Throw DwRuntimeError e11_3.') 
				e11_4.setMessage('Throw CorbaInternal e11_4.') 
				Throw e11_3
				Throw e11_1   
				Throw e11_2   
				Throw e11_4   
			Catch(Exception ex11_1)
				ls_result+='Error ex11_1:' + ex11_1.GetMessage()+"~r~n"
			Catch(DwRuntimeError ex11_2)
				ls_result+='Error ex11_2:' + ex11_2.GetMessage()+"~r~n"
			Catch(NullObjectError ex11_3)
				ls_result+='Error ex11_3:' + ex11_3.GetMessage()+"~r~n"
			Catch(RuntimeError ex11_4)   
				ls_result+='Error ex11_4:' + ex11_4.GetMessage()+"~r~n"
			Catch(Throwable ex11_5)
				ls_result+='Error ex11_5:' + ex11_5.GetMessage()+"~r~n"
			End Try
		case "012_manu"
			Try 
				RuntimeError 		e12_1
				e12_1 = Create RuntimeError
				e12_1.setMessage('Throw RuntimeError e12_1.') 
				Throw e12_1   
			Catch(DwRuntimeError ex12_1)
				ls_result+='Error ex12_1:' + ex12_1.GetMessage()+"~r~n"
			Catch(NullObjectError ex12_2)  
				ls_result+='Error ex12_2:' + ex12_2.GetMessage()+"~r~n"
			Catch(throwable ex12_3)
				ls_result+='Error ex12_3:' + ex12_3.GetMessage()+"~r~n"
			End Try
		case '013_other'
			Try 
				Exception e13
				e13 = Create Exception
				e13.SetMessage('Throw Exception e13.') 
				Throw e13
			Catch(Exception ex13_1)
				ls_result+='Error ex13_1:' + ex13_1.GetMessage()+"~r~n"
				try
					SetNull(dw_1)
					dw_1.SetItem(1, 'v_name', 'Jack')
				catch (NullObjectError ex13_5)
					ls_result+='Error ex13_5:' + ex13_5.GetMessage()+"~r~n"
				end try
			Catch(dwRuntimeError ex13_2)   
				ls_result+='Error ex13_2:' + ex13_2.GetMessage()+"~r~n"
			Catch(NullObjectError ex13_3)
				ls_result+='Error ex13_3:' + ex13_3.GetMessage()+"~r~n"
			Catch(Throwable ex13_4)
				ls_result+='Error ex13_4:' + ex13_4.GetMessage()+"~r~n"
			Finally
				ls_result+='013_other: Output in Finally Script.~r~n'
			End Try
		case "014_other"
			Try 
			Catch(Exception ex14_1)
				ls_result +='Error ex14_1:' + ex14_1.GetMessage()+"~r~n"
			Catch(DwRuntimeError ex14_2)   
				ls_result +='Error ex14_2:' + ex14_2.GetMessage()+"~r~n"
			Catch(NullObjectError ex14_3)
				ls_result +='Error ex14_3:' + ex14_3.GetMessage()+"~r~n"
			Catch(RuntimeError ex14_4)
				ls_result +='Error ex14_4:' + ex14_4.GetMessage()+"~r~n"
			Catch(Throwable ex14_5)
				ls_result +='Error ex14_5:' + ex14_5.GetMessage()+"~r~n"
			Finally
				ls_result +='014_other:'+"OutPut in Finally Script.~r~n"
				try 
					RuntimeError e14
					e14 = Create RuntimeError
					e14.SetMessage('Throw RuntimeError e14.') 
					Throw e14
				catch(throwable ex14_6)
					ls_result +='Error ex14_6:' + ex14_6.GetMessage()+"~r~n"
				end try
			End Try
		case "015_other"
			Try 
				SetNull(dw_1)
				dw_1.Insertrow(0)
			Catch(Exception ex15_1)
				ls_result+='Error ex15_1:' + ex15_1.GetMessage()+"~r~n"
			Catch(DwRuntimeError ex15_2)   
				ls_result+='Error ex15_2:' + ex15_2.GetMessage()+"~r~n"
			Catch(NullObjectError ex15_3)
				ls_result+='Error ex15_3:' + ex15_3.GetMessage()+"~r~n"
			Catch(RuntimeError ex15_4)
				ls_result+='Error ex15_4:' + ex15_4.GetMessage()+"~r~n"
			Catch(Throwable ex15_5)
				ls_result+='Error ex15_5:' + ex15_5.GetMessage()+"~r~n"
			Finally
				ls_result +='015_other:'+"OutPut in Finally Script.~r~n"
				try
					RuntimeError e15
					e15 = Create RuntimeError
					e15.SetMessage('Throw RuntimeError e15.') 
					Throw e15
				catch(throwable ex15_6)
					ls_result +='Error ex15_6:' + ex15_6.GetMessage()+"~r~n"
				end try
			End Try	
		case "016_more"
			Try
				Throwable e16_1
				e16_1 = Create Throwable
				e16_1.SetMessage('Throwable')
				Throw e16_1
			Catch(Throwable ex16_1)
				ls_result+='Catch ThrowableType:' + ex16_1.GetMessage()+"~r~n"
			End try
			//
			Try
				exception e16_2
				e16_2 = Create exception
				e16_2.SetMessage('exception')
				Throw e16_2
			Catch(exception ex16_2)
				ls_result+='Catch ThrowableType:' + ex16_2.GetMessage()+"~r~n"
			End try
			
			Try
				corbauserexception e16_3
				e16_3 = Create corbauserexception
				e16_3.SetMessage('corbauserexception')
				Throw e16_3
			Catch(corbauserexception ex16_3)
				ls_result+='Catch ThrowableType:' + ex16_3.GetMessage()+"~r~n"
			End try
			//
			Try
				runtimeerror e16_4
				e16_4 = Create runtimeerror
				e16_4.SetMessage('runtimeerror')
				Throw e16_4
			Catch(Throwable ex16_4)
				ls_result+='Catch ThrowableType:' + ex16_4.GetMessage()+"~r~n"
			End try
			//
			Try
				corbasystemexception e16_5
				e16_5 = Create corbasystemexception
				e16_5.SetMessage('corbasystemexception')
				Throw e16_5
			Catch(Throwable ex16_5)
				ls_result+='Catch ThrowableType:' + ex16_5.GetMessage()+"~r~n"
			End try
			Try
				dividebyzeroerror e16_6
				e16_6 = Create dividebyzeroerror
				e16_6.SetMessage('dividebyzeroerror')
				Throw e16_6
			Catch(Throwable ex16_6)
				ls_result+='Catch ThrowableType:' + ex16_6.GetMessage()+"~r~n"
			End try
			Try
				dwruntimeerror e16_7
				e16_7 = Create dwruntimeerror
				e16_7.SetMessage('dwruntimeerror')
				Throw e16_7
			Catch(Throwable ex16_7)
				ls_result+='Catch ThrowableType:' + ex16_7.GetMessage()+"~r~n"
			End try
			Try
				nullobjecterror e16_8
				e16_8 = Create nullobjecterror
				e16_8.SetMessage('nullobjecterror')
				Throw e16_8
			Catch(Throwable ex16_8)
				ls_result+='Catch ThrowableType:' + ex16_8.GetMessage()+"~r~n"
			End try
			Try
				oleruntimeerror e16_9
				e16_9 = Create oleruntimeerror
				e16_9.SetMessage('oleruntimeerror')
				Throw e16_9
			Catch(Throwable ex16_9)
				ls_result+='Catch ThrowableType:' + ex16_9.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbabadcontext e16_10
				e16_10 = Create corbabadcontext
				e16_10.SetMessage('corbabadcontext')
				Throw e16_10
			Catch(Throwable ex16_10)
				ls_result+='Catch ThrowableType:' + ex16_10.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbabadinvorder e16_11
				e16_11 = Create corbabadinvorder
				e16_11.SetMessage('corbabadinvorder')
				Throw e16_11
			Catch(Throwable ex16_11)
				ls_result+='Catch ThrowableType:' + ex16_11.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbabadoperation e16_12
				e16_12 = Create corbabadoperation
				e16_12.SetMessage('corbabadoperation')
				Throw e16_12
			Catch(Throwable ex16_12)
				ls_result+='Catch ThrowableType:' + ex16_12.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbabadparam e16_13
				e16_13 = Create corbabadparam
				e16_13.SetMessage('corbabadparam')
				Throw e16_13
			Catch(Throwable ex16_13)
				ls_result+='Catch ThrowableType:' + ex16_13.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbabadtypecode e16_14
				e16_14 = Create corbabadtypecode
				e16_14.SetMessage('corbabadtypecode')
				Throw e16_14
			Catch(Throwable ex16_14)
				ls_result+='Catch ThrowableType:' + ex16_14.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbacommfailure e16_15
				e16_15 = Create corbacommfailure
				e16_15.SetMessage('corbacommfailure')
				Throw e16_15
			Catch(Throwable ex16_15)
				ls_result+='Catch ThrowableType:' + ex16_15.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbadataconversion e16_16
				e16_16 = Create corbadataconversion
				e16_16.SetMessage('corbadataconversion')
				Throw e16_16
			Catch(Throwable ex16_16)
				ls_result+='Catch ThrowableType:' + ex16_16.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbafreemem e16_17
				e16_17 = Create corbafreemem
				e16_17.SetMessage('corbafreemem')
				Throw e16_17
			Catch(Throwable ex16_17)
				ls_result+='Catch ThrowableType:' + ex16_17.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbaimplimit e16_18
				e16_18 = Create corbaimplimit
				e16_18.SetMessage('corbaimplimit')
				Throw e16_18
			Catch(Throwable ex16_18)
				ls_result+='Catch ThrowableType:' + ex16_18.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbainitialize e16_19
				e16_19 = Create corbainitialize
				e16_19.SetMessage('corbainitialize')
				Throw e16_19
			Catch(Throwable ex16_19)
				ls_result+='Catch ThrowableType:' + ex16_19.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbainternal e16_20
				e16_20 = Create corbainternal
				e16_20.SetMessage('corbainternal')
				Throw e16_20
			Catch(Throwable ex16_20)
				ls_result+='Catch ThrowableType:' + ex16_20.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbaintfrepos e16_21
				e16_21 = Create corbaintfrepos
				e16_21.SetMessage('corbaintfrepos')
				Throw e16_21
			Catch(Throwable ex16_21)
				ls_result+='Catch ThrowableType:' + ex16_21.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbainvalidtransaction e16_22
				e16_22 = Create corbainvalidtransaction
				e16_22.SetMessage('corbainvalidtransaction')
				Throw e16_22
			Catch(Throwable ex16_22)
				ls_result+='Catch ThrowableType:' + ex16_22.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbainvflag e16_23
				e16_23 = Create corbainvflag
				e16_23.SetMessage('corbainvflag')
				Throw e16_23
			Catch(Throwable ex16_23)
				ls_result+='Catch ThrowableType:' + ex16_23.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbainvident e16_24
				e16_24 = Create corbainvident
				e16_24.SetMessage('corbainvident')
				Throw e16_24
			Catch(Throwable ex16_24)
				ls_result+='Catch ThrowableType:' + ex16_24.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbainvobjref e16_25
				e16_25 = Create corbainvobjref
				e16_25.SetMessage('corbainvobjref')
				Throw e16_25
			Catch(Throwable ex16_25)
				ls_result+='Catch ThrowableType:' + ex16_25.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbamarshal e16_26
				e16_26 = Create corbamarshal
				e16_26.SetMessage('corbamarshal')
				Throw e16_26
			Catch(Throwable ex16_26)
				ls_result+='Catch ThrowableType:' + ex16_26.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbanoimplement e16_27
				e16_27 = Create corbanoimplement
				e16_27.SetMessage('corbanoimplement')
				Throw e16_27
			Catch(Throwable ex16_27)
				ls_result+='Catch ThrowableType:' + ex16_27.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbanomemory e16_28
				e16_28 = Create corbanomemory
				e16_28.SetMessage('corbanomemory')
				Throw e16_28
			Catch(Throwable ex16_28)
				ls_result+='Catch ThrowableType:' + ex16_28.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbanopermission e16_29
				e16_29 = Create corbanopermission
				e16_29.SetMessage('corbanopermission')
				Throw e16_29
			Catch(Throwable ex16_29)
				ls_result+='Catch ThrowableType:' + ex16_29.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbanoresources e16_30
				e16_30 = Create corbanoresources
				e16_30.SetMessage('corbanoresources')
				Throw e16_30
			Catch(Throwable ex16_30)
				ls_result+='Catch ThrowableType:' + ex16_30.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbanoresponse e16_31
				e16_31 = Create corbanoresponse
				e16_31.SetMessage('corbanoresponse')
				Throw e16_31
			Catch(Throwable ex16_31)
				ls_result+='Catch ThrowableType:' + ex16_31.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbaobjadapter e16_32
				e16_32 = Create corbaobjadapter
				e16_32.SetMessage('corbaobjadapter')
				Throw e16_32
			Catch(Throwable ex16_32)
				ls_result+='Catch ThrowableType:' + ex16_32.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbaobjectnotexist e16_33
				e16_33 = Create corbaobjectnotexist
				e16_33.SetMessage('corbaobjectnotexist')
				Throw e16_33
			Catch(Throwable ex16_33)
				ls_result+='Catch ThrowableType:' + ex16_33.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbapersiststore e16_34
				e16_34 = Create corbapersiststore
				e16_34.SetMessage('corbapersiststore')
				Throw e16_34
			Catch(Throwable ex16_34)
				ls_result+='Catch ThrowableType:' + ex16_34.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbatransactionrequired e16_35
				e16_35 = Create corbatransactionrequired
				e16_35.SetMessage('corbatransactionrequired')
				Throw e16_35
			Catch(Throwable ex16_35)
				ls_result+='Catch ThrowableType:' + ex16_35.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbatransactionrolledback e16_36
				e16_36 = Create corbatransactionrolledback
				e16_36.SetMessage('corbatransactionrolledback')
				Throw e16_36
			Catch(Throwable ex16_36)
				ls_result+='Catch ThrowableType:' + ex16_36.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbatransient e16_37
				e16_37 = Create corbatransient
				e16_37.SetMessage('corbatransient')
				Throw e16_37
			Catch(Throwable ex16_37)
				ls_result+='Catch ThrowableType:' + ex16_37.GetMessage()+"~r~n"
			End try
			//	
			Try
				corbaunknown e16_38
				e16_38 = Create corbaunknown
				e16_38.SetMessage('corbaunknown')
				Throw e16_38
			Catch(Throwable ex16_38)
				ls_result+='Catch ThrowableType:' + ex16_38.GetMessage()+"~r~n"
			End try
	end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname,ls_name
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data

long ll_divide = 5818,ll_zero=0
int li_result
datastore lds_test
lds_test = create datastore

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

//ls_array[Upperbound(ls_array) + 1 ] = "testcasepoint_example1"			//edit you test case point name
//ls_array[Upperbound(ls_array) + 1 ] = ""
ls_array={"001_cascade","002_cascade","003_cascade","004_cascade","005_cascade","006_cascade","007_cascade","008_cascade","009_cascade","010_cascade","011_cascade","012_cascade","013_cascade","014_cascade","015_cascade","016_cascade","017_cascade","018_cascade"}
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
		case "001_cascade"
			TRY 
				TRY 
					TRY 
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p001)
						ls_result+='Try3-DivideByzeroError:'+DBZE3_p001.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p001)
						ls_result+='Try3-DWRuntimeError:'+DWRE3_p001.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p001)
						ls_result+='Try3-NullObjectError:'+NOE3_p001.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='001_cascade:Try3-Finally!~r~n'
					END TRY
				Catch(DivideByzeroError DBZE2_p001)
					ls_result+='Try2-DivideByzeroError:'+DBZE2_p001.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p001)
					ls_result+='Try2-DWRuntimeError:'+DWRE2_p001.Getmessage()+"~r~n"
				Catch(NullObjectError  NOE2_p001)
					ls_result+='Try2-NullObjectError:'+NOE2_p001.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='001_cascade:Try2-Finally!'+"~r~n"
				END TRY
			Catch (DivideByzeroError DBZE1_p001) 
				ls_result+='Try1-DivideByzeroError:'+DBZE1_p001.Getmessage()+"~r~n"
			Catch(DWRuntimeError   DWRE1_p001)
				ls_result+='Try1-DWRuntimeError:'+DWRE1_p001.Getmessage()+"~r~n"
			Catch(NullObjectError  NOE1_p001)
				ls_result+='Try1-NullObjectError:'+NOE1_p001.Getmessage()+"~r~n"
			FINALLY 
				ls_result+='001_cascade:Try1-Finally!~r~n'
			END TRY
		case lower("002_cascade")			
			TRY 
				li_result = ll_divide/ll_zero  //new exception
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception				
					TRY 
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p002)
						ls_result+='Try3-DivideByzeroError:'+DBZE3_p002.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p002)
						ls_result+='Try3-DWRuntimeError:'+DWRE3_p002.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p002)
						ls_result+='Try3-NullObjectError:'+NOE3_p002.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='002_cascade:Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p002)
					ls_result+='Try2-DivideByzeroError:'+DBZE2_p002.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p002)
					ls_result+='Try2-DWRuntimeError:'+DWRE2_p002.Getmessage()+"~r~n"
				Catch(NullObjectError  NOE2_p002)
					ls_result+='Try2-NullObjectError:'+NOE2_p002.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='002_cascade:Try2-Finally!~r~n'
				END TRY
			Catch (DivideByzeroError DBZE1_p002) 
				ls_result+='Try1-DivideByzeroError:'+DBZE1_p002.Getmessage()+"~r~n"
			Catch(DWRuntimeError   DWRE1_p002)
				ls_result+='Try1-DWRuntimeError:'+DWRE1_p002.Getmessage()+"~r~n"
			Catch(NullObjectError  NOE1_p002)
				ls_result+='Try1-NullObjectError:'+NOE1_p002.Getmessage()+"~r~n"
			FINALLY 
				ls_result+='002_cascade:Try1-Finally!'+"~r~n"
			END TRY
		case "003_cascade"
			TRY 
				TRY 
					TRY 
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p003)
						ls_result+='Try3-DivideByzeroError:'+DBZE3_p003.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p003)
						ls_result+='Try3-DWRuntimeError:'+DWRE3_p003.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p003)
						ls_result+='Try3-NullObjectError:'+NOE3_p003.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='003_cascade:Try3-Finally!~r~n'
					END TRY
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception		
				Catch(DivideByzeroError DBZE2_p003)
					ls_result+='Try2-DivideByzeroError:'+DBZE2_p003.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p003)
					ls_result+='Try2-DWRuntimeError:'+DWRE2_p003.Getmessage()+"~r~n"
				Catch(NullObjectError  NOE2_p003)
					ls_result+='Try2-NullObjectError:'+NOE2_p003.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='003_cascade:Try2-Finally!~r~n'
				END TRY
				
			li_result = ll_divide/ll_zero  //new exception
			Catch (DivideByzeroError DBZE1_p003) 
				ls_result+='Try1-DivideByzeroError:'+DBZE1_p003.Getmessage()+"~r~n"
			Catch(DWRuntimeError   DWRE1_p003)
				ls_result+='Try1-DWRuntimeError:'+DWRE1_p003.Getmessage()+"~r~n"
			Catch(NullObjectError  NOE1_p003)
				ls_result+='Try1-NullObjectError:'+NOE1_p003.Getmessage()+"~r~n"
			FINALLY 
				ls_result+='003_cascade:Try1-Finally!~r~n'
			END TRY
		case "004_cascade"	
			TRY 
				li_result = ll_divide/ll_zero  //new exception
			Catch (DivideByzeroError DBZE1_p004) 
				TRY 
					ls_result+='Try1-DivideByzeroError:'+DBZE1_p004.Getmessage()+"~r~n"
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p004)
					TRY 
						ls_result+='Try2-NullObjectError:'+NOE2_p004.Getmessage()+"~r~n"
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p004)
						ls_result+='Try3-DivideByzeroError:'+DBZE3_p004.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p004)
						ls_result+='Try3-DWRuntimeError:'+DWRE3_p004.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p004)
						ls_result+='Try3-NullObjectError:'+NOE3_p004.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='004_cascade:Try3-Finally!~r~n'
					END TRY
				Catch(DivideByzeroError DBZE2_p004)
					ls_result+='Try2-DivideByzeroError:'+DBZE2_p004.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p004)
					ls_result+='Try2-DWRuntimeError:'+DWRE2_p004.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='004_cascade:Try2-Finally!~r~n'
				END TRY	
			Catch(DWRuntimeError   DWRE1_p004)
				ls_result+='Try1-DWRuntimeError:'+DWRE1_p004.Getmessage()+"~r~n"
			Catch(NullObjectError  NOE1_p004)
				ls_result+='Try1-NullObjectError:'+NOE1_p004.Getmessage()+"~r~n"
			FINALLY 
				ls_result+='004_cascade:Try1-Finally!'+"~r~n"
			END TRY
		case "005_cascade"
			TRY 
				li_result = ll_divide/ll_zero  //new exception
			Catch (DivideByzeroError DBZE1_p005) 
				ls_result+='Try1-DivideByzeroError:'+DBZE1_p005.Getmessage()+"~r~n"
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p005)
					ls_result+='Try2-NullObjectError:'+NOE2_p005.Getmessage()+"~r~n"
					TRY 
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p005)
						ls_result+='Try3-DivideByzeroError:'+DBZE3_p005.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p005)
						ls_result+='Try3-DWRuntimeError:'+DWRE3_p005.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p005)
						ls_result+='Try3-NullObjectError:'+NOE3_p005.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='005_cascade:Try3-Finally!~r~n'
					END TRY
				Catch(DivideByzeroError DBZE2_p005)
					ls_result+='Try2-DivideByzeroError:'+DBZE2_p005.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p005)
					ls_result+='Try2-DWRuntimeError:'+DWRE2_p005.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='005_cascade:Try2-Finally!'+"~r~n"
				END TRY	
			Catch(DWRuntimeError   DWRE1_p005)
				ls_result+='Try1-DWRuntimeError:'+DWRE1_p005.Getmessage()+"~r~n"
			Catch(NullObjectError  NOE1_p005)
				ls_result+='Try1-NullObjectError:'+NOE1_p005.Getmessage()+"~r~n"
			FINALLY 
				ls_result+='005_cascade:Try1-Finally!'+"~r~n"
			END TRY
		case "006_cascade"
			TRY 
				li_result = ll_divide/ll_zero  //new exception
			Catch (DivideByzeroError DBZE1_p006) 
				TRY 
					ls_result+='Try1-DivideByzeroError:'+DBZE1_p006.Getmessage()+"~r~n"
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p006)
					TRY 
						ls_result+='Try2-NullObjectError:'+NOE2_p006.Getmessage()+"~r~n"
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p006)
						ls_result+='Try3-DivideByzeroError:'+DBZE3_p006.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p006)
						ls_result+='Try3-DWRuntimeError:'+DWRE3_p006.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p006)
						ls_result+='Try3-NullObjectError:'+NOE3_p006.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='006_cascade:Try3-Finally!~r~n'
					END TRY
				Catch(DivideByzeroError DBZE2_p006)
					ls_result+='Try2-DivideByzeroError:'+DBZE2_p006.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p006)
					ls_result+='Try2-DWRuntimeError:'+DWRE2_p006.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='006_cascade:Try2-Finally!~r~n'
				END TRY	
			Catch(DWRuntimeError   DWRE1_p006)
				ls_result+='Try1-DWRuntimeError:'+DWRE1_p006.Getmessage()+"~r~n"
			Catch(NullObjectError  NOE1_p006)
				ls_result+='Try1-NullObjectError:'+NOE1_p006.Getmessage()+"~r~n"
			FINALLY 
				ls_result+='006_cascade:Try1-Finally!~r~n'
			END TRY
		case "007_cascade"
			TRY 
				li_result = ll_divide/ll_zero  //new exception
			Catch (DivideByzeroError DBZE1_p007) 
				ls_result+='Try1-DivideByzeroError:'+DBZE1_p007.Getmessage()+"~r~n"
			Catch(DWRuntimeError   DWRE1_p007)
				ls_result+='Try1-DWRuntimeError:'+DWRE1_p007.Getmessage()+"~r~n"
			Catch(NullObjectError  NOE1_p007)
				ls_result+='Try1-NullObjectError:'+NOE1_p007.Getmessage()+"~r~n"
			FINALLY 
				ls_result+='007_cascade:Try1-Finally!~r~n'
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p007)
					ls_result+='Try2-NullObjectError:'+NOE2_p007.Getmessage()+"~r~n"
				Catch(DivideByzeroError DBZE2_p007)
					ls_result+='Try2-DivideByzeroError:'+DBZE2_p007.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p007)
					ls_result+='Try2-DWRuntimeError:'+DWRE2_p007.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='007_cascade:Try2-Finally!~r~n'
					TRY 
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p007)
						ls_result+='Try3-DivideByzeroError:'+DBZE3_p007.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p007)
						ls_result+='Try3-DWRuntimeError:'+DWRE3_p007.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p007)
						ls_result+='Try3-NullObjectError:'+NOE3_p007.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='007_cascade:Try3-Finally!~r~n'
					END TRY
				END TRY	
			END TRY	
		case "008_cascade"
			TRY 
				li_result = ll_divide/ll_zero  //new exception
			Catch (DivideByzeroError DBZE1_p008) 
				ls_result+='Try1-DivideByzeroError:'+DBZE1_p008.Getmessage()+"~r~n"
			Catch(DWRuntimeError   DWRE1_p008)
				ls_result+='Try1-DWRuntimeError:'+DWRE1_p008.Getmessage()+"~r~n"
			Catch(NullObjectError  NOE1_p008)
				ls_result+='Try1-NullObjectError:'+NOE1_p008.Getmessage()+"~r~n"
			FINALLY 
				ls_result+='008_cascade:Try1-Finally!~r~n'
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p008)
					ls_result+='Try2-NullObjectError:'+NOE2_p008.Getmessage()+"~r~n"
				Catch(DivideByzeroError DBZE2_p008)
					ls_result+='Try2-DivideByzeroError:'+DBZE2_p008.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p008)
					ls_result+='Try2-DWRuntimeError:'+DWRE2_p008.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='008_cascade:Try2-Finally!~r~n'
					TRY 
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p008)
						ls_result+='Try3-DivideByzeroError:'+DBZE3_p008.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p008)
						ls_result+='Try3-DWRuntimeError:'+DWRE3_p008.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p008)
						ls_result+='Try3-NullObjectError:'+NOE3_p008.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='008_cascade:Try3-Finally!'+"~r~n"
					END TRY
				END TRY	
			END TRY	
		case "009_cascade"
			RuntimeError Run_throw
			Run_throw = Create RuntimeError
			Try
				Run_throw.SetMessage('Throw RuntimeError Run_throw.')
				Throw Run_throw	//new exception
			catch(throwable ex09_1)
				ls_result += "009_cascade = "+ex09_1.getmessage()+"~r~n"
			END TRY	
			Try
				NullObjectError Null_throw
				Null_throw = Create NullObjectError
				Null_throw.SetMessage('Throw NullObjectError Null_throw.')
				Throw Null_throw	//new exception
			catch(throwable ex09_2)
				ls_result += "009_cascade = "+ex09_2.getmessage()+"~r~n"
			END TRY	
		case "010_cascade"
			TRY 
			//try
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p010)
					ls_result+='TRY,Try2-NullObjectError:'+NOE2_p010.Getmessage()+"~r~n"
					TRY 
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p010)
						ls_result+='TRY,Try3-DivideByzeroError:'+DBZE3_p010.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p010)
						ls_result+='TRY,Try3-DWRuntimeError:'+DWRE3_p010.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p010)
						ls_result+='TRY,Try3-NullObjectError:'+NOE3_p010.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='010_cascade:TRY,Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p010)
					ls_result+='TRY,Try2-DivideByzeroError:'+DBZE2_p010.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p010)
					ls_result+='TRY,Try2-DWRuntimeError:'+DWRE2_p010.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='010_cascade:TRY,Try2-Finally!'+"~r~n"
				END TRY
			Catch (DivideByzeroError DBZE1_p010) 
				ls_result+='Catch,Try1-DivideByzeroError:'+DBZE1_p010.Getmessage()+"~r~n"
			Catch(DWRuntimeError   DWRE1_p010)
				ls_result+='Catch,Try1-DWRuntimeError:'+DWRE1_p010.Getmessage()+"~r~n"
			Catch(NullObjectError  NOE1_p010)
				ls_result+='Catch,Try1-NullObjectError:'+NOE1_p010.Getmessage()+"~r~n"
				
			FINALLY 
			//finally				
				ls_result+='010_cascade:Finally,Try1-Finally!'+"~r~n"
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p010_3)
					ls_result+='Finally,Try2-NullObjectError:'+NOE2_p010_3.Getmessage()+"~r~n"
					TRY 
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p010_3)
						ls_result+='Finally,Try3-DivideByzeroError:'+DBZE3_p010_3.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p010_3)
						ls_result+='Finally,Try3-DWRuntimeError:'+DWRE3_p010_3.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p010_3)
						ls_result+='Finally,Try3-NullObjectError:'+NOE3_p010_3.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='Finally,Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p010_3)
					ls_result+='Finally,Try2-DivideByzeroError:'+DBZE2_p010_3.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p010_3)
					ls_result+='Finally,Try2-DWRuntimeError:'+DWRE2_p010_3.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='010_cascade:Finally,Try2-Finally!'+"~r~n"
				END TRY
			END TRY
		case "011_cascade"
			TRY  
			//try
				SetNULL(lds_test)
				ls_name = lds_test.Getitemstring(1,1)  //new exception
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p011)
					ls_result+='TRY,Try2-NullObjectError:'+NOE2_p011.Getmessage()+"~r~n"
					TRY 
						li_result = ll_divide/ll_zero  //new exception
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p011)
						ls_result+='TRY,Try3-DivideByzeroError:'+DBZE3_p011.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p011)
						ls_result+='TRY,Try3-DWRuntimeError:'+DWRE3_p011.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p011)
						ls_result+='TRY,Try3-NullObjectError:'+NOE3_p011.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='TRY,Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p011)
					ls_result+='TRY,Try2-DivideByzeroError:'+DBZE2_p011.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p011)
					ls_result+='TRY,Try2-DWRuntimeError:'+DWRE2_p011.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='TRY,Try2-Finally!'+"~r~n"
				END TRY
			Catch (DivideByzeroError DBZE1_p011) 
				ls_result+='Catch,Try1-DivideByzeroError:'+DBZE1_p011.Getmessage()+"~r~n"
			Catch(DWRuntimeError   DWRE1_p011)
				ls_result+='Catch,Try1-DWRuntimeError:'+DWRE1_p011.Getmessage()+"~r~n"
			
			//catch
			Catch(NullObjectError  NOE1_p011)
				ls_result+='Catch,Try1-NullObjectError:'+NOE1_p011.Getmessage()+"~r~n"
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p011_2)
					ls_result+='Finally,Try2-NullObjectError:'+NOE2_p011_2.Getmessage()+"~r~n"
					TRY 
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p011_2)
						ls_result+='Finally,Try3-DivideByzeroError:'+DBZE3_p011_2.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p011_2)
						ls_result+='Finally,Try3-DWRuntimeError:'+DWRE3_p011_2.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p011_2)
						ls_result+='Finally,Try3-NullObjectError:'+NOE3_p011_2.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='Finally,Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p011_2)
					ls_result+='Finally,Try2-DivideByzeroError:'+DBZE2_p011_2.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p011_2)
					ls_result+='Finally,Try2-DWRuntimeError:'+DWRE2_p011_2.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='Finally,Try2-Finally!'+"~r~n"
				END TRY
				
			FINALLY 
			//finally	
				ls_result+='Finally,Try1-Finally!'+"~r~n"
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p011_3)
					ls_result+='Finally,Try2-NullObjectError:'+NOE2_p011_3.Getmessage()+"~r~n"
					TRY 
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p011_3)
						ls_result+='Finally,Try3-DivideByzeroError:'+DBZE3_p011_3.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p011_3)
						ls_result+='Finally,Try3-DWRuntimeError:'+DWRE3_p011_3.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p011_3)
						ls_result+='Finally,Try3-NullObjectError:'+NOE3_p011_3.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='Finally,Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p011_3)
					ls_result+='Finally,Try2-DivideByzeroError:'+DBZE2_p011_3.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p011_3)
					ls_result+='Finally,Try2-DWRuntimeError:'+DWRE2_p011_3.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='Finally,Try2-Finally!'+"~r~n"
				END TRY
			END TRY
		case "012_cascade"
			TRY  
			//try
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p012)
					ls_result+='TRY,Try2-NullObjectError:'+NOE2_p012.Getmessage()+"~r~n"
					TRY 
						li_result = ll_divide/ll_zero  //new exception
					CATCH (DivideByzeroError DBZE3_p012)
						ls_result+='TRY,Try3-DivideByzeroError:'+DBZE3_p012.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p012)
						ls_result+='TRY,Try3-DWRuntimeError:'+DWRE3_p012.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p012)
						ls_result+='TRY,Try3-NullObjectError:'+NOE3_p012.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='TRY,Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p012)
					ls_result+='TRY,Try2-DivideByzeroError:'+DBZE2_p012.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p012)
					ls_result+='TRY,Try2-DWRuntimeError:'+DWRE2_p012.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='TRY,Try2-Finally!'+"~r~n"
				END TRY
				SetNULL(lds_test)
				ls_name = lds_test.Getitemstring(1,1)  //new exception
			Catch (DivideByzeroError DBZE1_p012) 
				ls_result+='Catch,Try1-DivideByzeroError:'+DBZE1_p012.Getmessage()+"~r~n"
			Catch(DWRuntimeError   DWRE1_p012)
				ls_result+='Catch,Try1-DWRuntimeError:'+DWRE1_p012.Getmessage()+"~r~n"
			
			//catch
			Catch(NullObjectError  NOE1_p012)
				
				ls_result+='Catch,Try1-NullObjectError:'+NOE1_p012.Getmessage()+"~r~n"
				
				TRY 
					li_result = ll_divide/ll_zero  //new exception
				Catch(NullObjectError  NOE2_p012_2)
					ls_result+='Finally,Try2-NullObjectError:'+NOE2_p012_2.Getmessage()+"~r~n"
					TRY 
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p012_2)
						ls_result+='Finally,Try3-DivideByzeroError:'+DBZE3_p012_2.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p012_2)
						ls_result+='Finally,Try3-DWRuntimeError:'+DWRE3_p012_2.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p012_2)
						ls_result+='Finally,Try3-NullObjectError:'+NOE3_p012_2.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='Finally,Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p012_2)
					ls_result+='Finally,Try2-DivideByzeroError:'+DBZE2_p012_2.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p012_2)
					ls_result+='Finally,Try2-DWRuntimeError:'+DWRE2_p012_2.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='Finally,Try2-Finally!'+"~r~n"
				END TRY
			FINALLY 
			//finally	
				ls_result+='Finally,Try1-Finally!'+"~r~n"
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p012_3)
					ls_result+='Finally,Try2-NullObjectError:'+NOE2_p012_3.Getmessage()+"~r~n"
					TRY 
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p012_3)
						ls_result+='Finally,Try3-DivideByzeroError:'+DBZE3_p012_3.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p012_3)
						ls_result+='Finally,Try3-DWRuntimeError:'+DWRE3_p012_3.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p012_3)
						ls_result+='Finally,Try3-NullObjectError:'+NOE3_p012_3.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='Finally,Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p012_3)
					ls_result+='Finally,Try2-DivideByzeroError:'+DBZE2_p012_3.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p012_3)
					ls_result+='Finally,Try2-DWRuntimeError:'+DWRE2_p012_3.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='Finally,Try2-Finally!'+"~r~n"
				END TRY
				Try
					li_result = ll_divide/ll_zero  //new exception
				catch (DivideByzeroError e012_manu)
					ls_result+= "012_cascade : "+e012_manu.getmessage()+"~r~n"
				end try
			END TRY
		case "013_cascade"
			TRY 
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p013)
					ls_result+='TRY,Try2-NullObjectError:'+NOE2_p013.Getmessage()+"~r~n"
					TRY 
						SetNULL(lds_test)
						ls_name = lds_test.Getitemstring(1,1)  //new exception
					Catch(NullObjectError  NOE2_p013_4)
						ls_result+='TRY,Try2-1-NullObjectError:'+NOE2_p013_4.Getmessage()+"~r~n"
					Catch(DivideByzeroError DBZE2_p013_4)
						ls_result+='TRY,Try2-1-DivideByzeroError:'+DBZE2_p013_4.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE2_p013_4)
						ls_result+='TRY,Try2-1-DWRuntimeError:'+DWRE2_p013_4.Getmessage()+"~r~n"
					END TRY
					TRY 
						dw_1.object.dt_bron[1] = 100   //new exception
					CATCH (DivideByzeroError DBZE3_p013_5)
						ls_result+='TRY,Try2-2-DivideByzeroError:'+DBZE3_p013_5.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p013_5)
						ls_result+='TRY,Try2-2-DWRuntimeError:'+DWRE3_p013_5.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p013_5)
						ls_result+='TRY,Try2-2-NullObjectError:'+NOE3_p013_5.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='TRY,Try2-2-Finally!'+"~r~n"
					END TRY
					TRY 
		//					dw_1.object.dt_bron[1] = 100   //new exception
					FINALLY 
						ls_result+='TRY,Try2-3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p013)
					ls_result+='TRY,Try2-DivideByzeroError:'+DBZE2_p013.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p013)
					ls_result+='TRY,Try2-DWRuntimeError:'+DWRE2_p013.Getmessage()+"~r~n"
				END TRY
				TRY 
					dw_1.object.dt_bron[1] = 100   //new exception
				CATCH (DivideByzeroError DBZE3_p013)
					ls_result+='TRY,Try3-DivideByzeroError:'+DBZE3_p013.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE3_p013)
					ls_result+='TRY,Try3-DWRuntimeError:'+DWRE3_p013.Getmessage()+"~r~n"
				Catch(NullObjectError  NOE3_p013)
					ls_result+='TRY,Try3-NullObjectError:'+NOE3_p013.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='TRY,Try3-Finally!'+"~r~n"
				END TRY
				TRY 
//					dw_1.object.dt_bron[1] = 100   //new exception
				FINALLY 
					ls_result+='TRY,Try4-Finally!'+"~r~n"
				END TRY
				
				SetNULL(lds_test)
				ls_name = lds_test.Getitemstring(1,1)  //new exception
			Catch (DivideByzeroError DBZE1_p013) 
				ls_result+='Catch,Try1-DivideByzeroError:'+DBZE1_p013.Getmessage()+"~r~n"
			Catch(DWRuntimeError   DWRE1_p013)
				ls_result+='Catch,Try1-DWRuntimeError:'+DWRE1_p013.Getmessage()+"~r~n"
			Catch(NullObjectError  NOE1_p013)
				ls_result+='Catch,Try1-NullObjectError:'+NOE1_p013.Getmessage()+"~r~n"
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p013_2)
					ls_result+='Catch,Try2-NullObjectError:'+NOE2_p013_2.Getmessage()+"~r~n"
				Catch(DivideByzeroError DBZE2_p013_2)
					ls_result+='Catch,Try2-DivideByzeroError:'+DBZE2_p013_2.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p013_2)
					ls_result+='Catch,Try2-DWRuntimeError:'+DWRE2_p013_2.Getmessage()+"~r~n"
				END TRY
				TRY 
					dw_1.object.dt_bron[1] = 100   //new exception
				CATCH (DivideByzeroError DBZE3_p013_2)
					ls_result+='Catch,Try3-DivideByzeroError:'+DBZE3_p013_2.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE3_p013_2)
					ls_result+='Catch,Try3-DWRuntimeError:'+DWRE3_p013_2.Getmessage()+"~r~n"
				Catch(NullObjectError  NOE3_p013_2)
					ls_result+='Catch,Try3-NullObjectError:'+NOE3_p013_2.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='Catch,Try3-Finally!'+"~r~n"
				END TRY
				TRY 
//					dw_1.object.dt_bron[1] = 100   //new exception
				FINALLY 
					ls_result+='Catch,Try4-Finally!'+"~r~n"
				END TRY
			FINALLY 
			//finally				
				ls_result+='Finally,Try1-Finally!'+"~r~n"
				TRY 
					SetNULL(lds_test)
					ls_name = lds_test.Getitemstring(1,1)  //new exception
				Catch(NullObjectError  NOE2_p013_3)
					ls_result+='Finally,Try2-NullObjectError:'+NOE2_p013_3.Getmessage()+"~r~n"
				Catch(DivideByzeroError DBZE2_p013_3)
					ls_result+='Finally,Try2-DivideByzeroError:'+DBZE2_p013_3.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p013_3)
					ls_result+='Finally,Try2-DWRuntimeError:'+DWRE2_p013_3.Getmessage()+"~r~n"
				END TRY
				TRY 
					dw_1.object.dt_bron[1] = 100   //new exception
				CATCH (DivideByzeroError DBZE3_p013_3)
					ls_result+='Finally,Try3-DivideByzeroError:'+DBZE3_p013_3.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE3_p013_3)
					ls_result+='Finally,Try3-DWRuntimeError:'+DWRE3_p013_3.Getmessage()+"~r~n"
				Catch(NullObjectError  NOE3_p013_3)
					ls_result+='Finally,Try3-NullObjectError:'+NOE3_p013_3.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='Finally,Try3-Finally!'+"~r~n"
				END TRY
				TRY 
//					dw_1.object.dt_bron[1] = 100   //new exception
				FINALLY 
					ls_result+='Finally,Try4-Finally!'+"~r~n"
				END TRY
			END TRY
		case "014_cascade"
			TRY 
				TRY 
					TRY 
						OleRuntimeError ORE_excep
						ORE_excep = Create OleRuntimeError
						ORE_excep.setMessage('Throw OleRuntimeError error ORE_excep.')
						Throw ORE_excep
					CATCH (DivideByzeroError DBZE3_p014)
						ls_result+='Try3-DivideByzeroError:'+DBZE3_p014.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p014)
						ls_result+='Try3-DWRuntimeError:'+DWRE3_p014.Getmessage()+"~r~n"
					Catch(OleRuntimeError  NOE3_p014)
						ls_result+='Try3-OleRuntimeError:'+NOE3_p014.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p014)
					ls_result+='Try2-DivideByzeroError:'+DBZE2_p014.Getmessage()+"~r~n"
				Catch(OleRuntimeError  ORE2_p014)
					ls_result+='Try2-OleRuntimeError:'+ORE2_p014.Getmessage()+"~r~n"	
				FINALLY 
					ls_result+='Try2-Finally!'+"~r~n"
				END TRY
			Catch(OleRuntimeError  ORE3_p014)
					ls_result+='Try1-OleRuntimeError:'+ORE3_p014.Getmessage()+"~r~n"
			FINALLY 
				ls_result+='Try1-Finally!'+"~r~n"
			END TRY
		case "015_cascade"
			TRY 
				TRY 
					TRY 
						Exception excep
						excep = Create Exception
						excep.setMessage('Throw Exception error excep.')
						Throw excep
					CATCH (DivideByzeroError DBZE3_p015)
						ls_result+='Try3-DivideByzeroError:'+DBZE3_p015.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p015)
						ls_result+='Try3-DWRuntimeError:'+DWRE3_p015.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p015)
						ls_result+='Try3-NullObjectError:'+NOE3_p015.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p015)
					ls_result+='Try2-DivideByzeroError:'+DBZE2_p015.Getmessage()+"~r~n"
				Catch(OleRuntimeError  NOE2_p015)
					ls_result+='Try2-OleRuntimeError:'+NOE2_p015.Getmessage()+"~r~n"	
				FINALLY 
					ls_result+='Try2-Finally!'+"~r~n"
				END TRY
			Catch(Exception  excep_1)
					ls_result+='Try1-Exception:'+excep_1.Getmessage()+"~r~n"
			FINALLY 
				ls_result+='Try1-Finally!'+"~r~n"
			END TRY
		case "016_cascade"
			TRY 
				TRY 
					Throwable Throw_excep
					Throw_excep = Create Throwable
					Throw_excep.setMessage('Throw Throwable error Throw_excep.')
					Throw Throw_excep
					TRY 
					CATCH (DivideByzeroError DBZE3_p016)
						ls_result+='Try3-DivideByzeroError:'+DBZE3_p016.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p016)
						ls_result+='Try3-DWRuntimeError:'+DWRE3_p016.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p016)
						ls_result+='Try3-NullObjectError:'+NOE3_p016.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p016)
					ls_result+='Try2-DivideByzeroError:'+DBZE2_p016.Getmessage()+"~r~n"
				Catch(Exception  excep_16)
					ls_result+='Try2-Exception:'+excep_16.Getmessage()+"~r~n"	
				FINALLY 
					ls_result+='Try2-Finally!'+"~r~n"
				END TRY
			Catch(Throwable  throw_16)
					ls_result+='Try1-Throwable:'+throw_16.Getmessage()+"~r~n"
			FINALLY 
				ls_result+='Try1-Finally!'+"~r~n"
			END TRY
		case "017_cascade"
			TRY 
				TRY 
					TRY
						oleRuntimeError ole_excep3
						ole_excep3 = Create oleRuntimeError
						ole_excep3.SetMessage('TRY:Try3-oleRuntimeError')
						Throw ole_excep3
					Catch(NullObjectError  NOE3_p004_1)
						ls_result+='Try:Try3-NullObjectError:'+NOE3_p004_1.Getmessage()+"~r~n"
					catch (oleRuntimeError noe_ole_1)
						ls_result+='Try:Try3-oleRuntimeError:'+noe_ole_1.Getmessage()+"~r~n"
					FINALLY
						ls_result+='Try:Try3-Finally!'+"~r~n"
					END TRY
				Catch(NullObjectError  NOE2_p004_1)
					ls_result+='Try:Try2-NullObjectError:'+NOE2_p004_1.Getmessage()+"~r~n"
				Finally
					ls_result+='Try:Try2-Finally!'+"~r~n"
				END TRY
			Catch (DivideByzeroError DBZE1_p0041) 
				TRY 
				Catch(NullObjectError  NOE2_p0041)
					TRY 
						oleRuntimeError ole_excep2
						ole_excep2 = Create oleRuntimeError
						ole_excep2.SetMessage('Catch:Try3-oleRuntimeError')
						Throw ole_excep2
					CATCH (oleRuntimeError DBZE3_p0041)
						ls_result+='Try3-oleRuntimeError:'+DBZE3_p0041.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p0041)
						ls_result+='Try3-DWRuntimeError:'+DWRE3_p0041.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p0041)
						ls_result+='Try3-NullObjectError:'+NOE3_p0041.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p0041)
					ls_result+='Try2-DivideByzeroError:'+DBZE2_p0041.Getmessage()+"~r~n"
				Catch(DWRuntimeError   DWRE2_p0041)
					ls_result+='Try2-DWRuntimeError:'+DWRE2_p0041.Getmessage()+"~r~n"
				FINALLY 
					ls_result+='Try2-Finally!'+"~r~n"
				END TRY	
			Catch(DWRuntimeError   DWRE1_p0041)
				ls_result+='Try1-DWRuntimeError:'+DWRE1_p0041.Getmessage()+"~r~n"
			FINALLY 
				ls_result+='Finally:Try1-Finally!'+"~r~n"
				TRY 
				Catch(DWRuntimeError   DWRE2_p017_3)
				Finally
					ls_result+='Finally:Try2-Finally!'+"~r~n"
					TRY 
						oleRuntimeError ole_excep1
						ole_excep1 = Create oleRuntimeError
						ole_excep1.SetMessage("Finally:Try3-oleRuntimeError")
						Throw ole_excep1
					Catch(oleRuntimeError   DWRE3_p004_3)
						ls_result+= "Finally: Catch oleRuntimeError = "+DWRE3_p004_3.getmessage()+"~r~n"
					Finally
						ls_result+='Finally:Try3-Finally!'+"~r~n"
					END TRY
				END TRY
			END TRY
		case "018_cascade"
			TRY 
				TRY 
					TRY 
					CATCH (DivideByzeroError DBZE3_p018)
						ls_result+='Try3-DivideByzeroError:'+DBZE3_p018.Getmessage()+"~r~n"
					Catch(DWRuntimeError   DWRE3_p018)
						ls_result+='Try3-DWRuntimeError:'+DWRE3_p018.Getmessage()+"~r~n"
					Catch(NullObjectError  NOE3_p018)
						ls_result+='Try3-NullObjectError:'+NOE3_p018.Getmessage()+"~r~n"
					FINALLY 
						ls_result+='Try3-Finally!'+"~r~n"
					END TRY
				Catch(DivideByzeroError DBZE2_p018)
					ls_result+='Try2-DivideByzeroError:'+DBZE2_p018.Getmessage()+"~r~n"
				Catch(NullObjectError  NOE2_p018)
					ls_result+='Try2-OleRuntimeError:'+NOE2_p018.Getmessage()+"~r~n"	
				FINALLY 
					ls_result+='Try2-Finally!'+"~r~n"
				END TRY
			Catch(NullObjectError  NOE1_p018)
					ls_result+='Try1-NullObjectError:'+NOE1_p018.Getmessage()+"~r~n"
			FINALLY 
				ls_result+='Try1-Finally!'+"~r~n"
			END TRY
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module2 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
ls_array = {"001_usual","002_usual","003_usual","004_usual","005_usual","006_usual","007_usual","008_usual","009_usual","010_usual","011_usual","012_usual","013_usual","014_usual","015_usual","016_usual"}
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
		case "001_usual"
			Try
				wf_Error_NoReturn()
			Catch(Throwable ex01)   
				ls_result+='Error ex01:' + ex01.GetMessage()+"~r~n"
			End Try			
		case "002_usual"		
			Try
				Event ue_Err_NoReturn()
			Catch(Throwable ex02)   
				ls_result+='Error ex02:' + ex02.GetMessage()+"~r~n"
			End Try	
		case "003_usual"
			Try
				String	ls_ClassName
				nnvo_1 lnnvo_1
				ls_ClassName = lnnvo_1.ClassName()
			Catch(Throwable ex03)   
				ls_result+='Error ex03:' + ex03.GetMessage()+"~r~n"
			End Try	
		case "004_usual"
			Try
				String	ls_Name
				u_cst_1	lu_cst_1
				ls_Name = lu_cst_1.ClassName()
			Catch(Throwable ex04)   
				ls_result+='Error ex04:' + ex04.GetMessage()+"~r~n"
			End Try
		case "005_usual"
			Try
				String	ls_Arr[10], ls_str
				ls_str = ls_Arr[11]				
			Catch(Throwable ex05)   
				ls_result+='Error ex05:' + ex05.GetMessage()+"~r~n"
			End Try
		case "006_usual"
			Try
				Integer	li_Arr[]
				wf_test(li_Arr, 0)
			Catch(Throwable ex06)   
				ls_result+='Error ex06:' + ex06.GetMessage()+"~r~n"
			End Try	
		case "007_usual"
			Try
				Dynamic wf_NoExist()
			Catch(Throwable ex07)   
				ls_result+='Error ex07:' + ex07.GetMessage()+"~r~n"
			End Try
		case "008_usual"
			Try
				integer li_divZero
				li_divZero = 1 / 0 
			Catch(Throwable ex08)   
				ls_result+='Error ex08:' + ex08.GetMessage()+"~r~n"
			End Try
		case "009_usual"
			Try
				Destroy w_f140a01_sample.uo_1
			Catch(Throwable ex09)   
				ls_result+='Error ex09:' + ex09.GetMessage()+"~r~n"
			End Try	
		case "010_usual"
			Try
				string	ls_Name10
				str_1 	lstr_1
				str_2 	lstr_2
				PowerObject lpo_test
				lpo_test = lstr_2
				lstr_1 = lpo_test
				ls_Name10= lstr_1.v_name 
			Catch(Throwable ex10)   
				ls_result+='Error ex10:' + ex10.GetMessage()+"~r~n"
			End Try
		case "011_usual"
			Try
				String ls_winName
				ls_winName = w_f140a01_sample2.dw_1.DataObject
			Catch(Throwable ex11)   
				ls_result+='Error ex11:' + ex11.GetMessage()+"~r~n"
			End Try
		case "012_usual"
			Try
				dw_1.Object.aaabbb = 'Hello'
			Catch(Throwable ex12)   
				ls_result+='Error ex12:' + ex12.GetMessage()+"~r~n"
			End Try	
		case "013_usual"
			Try
				dw_1.GetItemString(1, "dt_born")
			Catch(Throwable ex13)   
				ls_result+='Error ex13:' + ex13.GetMessage()+"~r~n"
			End Try	
		case "014_usual"
			Try
				String	ls_Name14
				ls_Name14 = dw_1.Object.v_name[11]
			Catch(Throwable ex14)   
				ls_result+='Error ex14:' + ex14.GetMessage()+"~r~n"
			End Try	
		case "015_usual"
			Try
				Integer li_Name
				li_Name = dw_1.Object.v_name[1]
			Catch(Throwable ex15)   
				ls_result+='Error ex15:' + ex15.GetMessage()+"~r~n"
			End Try	
		case "016_usual"
			Try
				Open(w_f140a01_sample2, "lw_test")
			Catch(Throwable ex16)   
				ls_result+='Error ex16:' + ex16.GetMessage()+"~r~n"
			End Try
	end choose 
next 

is_resultlog += ls_result

end subroutine

public function integer wf_error_noreturn ();If 1 <> 1 Then 
	Return 1
End If 
end function

public function integer wf_test (integer ai_parm1[], integer ai_index);ai_parm1[ai_index] = 100
//adw_parm2.ClassName()


Return 1
end function

on w_trycatch.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_trycatch.destroy
call super::destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_trycatch
integer x = 1193
integer y = 40
integer width = 1861
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "d_f140a01_common"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()
end event

