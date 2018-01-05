$PBExportHeader$w_user_object1.srw
forward
global type w_user_object1 from w_base_case
end type
type uo_1 from n_uso307_cvo within w_user_object1
end type
type st_6 from statictext within w_user_object1
end type
type uo_cvo6 from n_uso306_cvo within w_user_object1
end type
type st_5 from statictext within w_user_object1
end type
type uo_cvo3 from n_uso303_cvo within w_user_object1
end type
type st_4 from statictext within w_user_object1
end type
type uo_cvo2 from n_uso302_cvo within w_user_object1
end type
type st_3 from statictext within w_user_object1
end type
type uo_cvo5 from n_uso305_cvo within w_user_object1
end type
type st_2 from statictext within w_user_object1
end type
type uo_cvo4 from n_uso304_cvo within w_user_object1
end type
type mle_output from multilineedit within w_user_object1
end type
type st_1 from statictext within w_user_object1
end type
type cb_1 from commandbutton within w_user_object1
end type
end forward

global type w_user_object1 from w_base_case
integer width = 3259
integer height = 2176
uo_1 uo_1
st_6 st_6
uo_cvo6 uo_cvo6
st_5 st_5
uo_cvo3 uo_cvo3
st_4 st_4
uo_cvo2 uo_cvo2
st_3 st_3
uo_cvo5 uo_cvo5
st_2 st_2
uo_cvo4 uo_cvo4
mle_output mle_output
st_1 st_1
cb_1 cb_1
end type
global w_user_object1 w_user_object1

type variables
Integer ii_index = 0
n_uso301_cvo iuo_cvo,iuo_cvo1,iuo_cvo2

n_uso301_cvo guo_cvo
n_uso301_cvo guo_cvo1, guo_cvo2
Integer	il_int1 = 1, il_int2
Date	id_date1 = 2000-01-01, id_date2
String	ls_constructor[], ls_destructor[]
String ls_call[], ls_callevent
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine wf_output (string as_mess, boolean ab_clear)
public subroutine of_testcase_point_module3 ()
public subroutine of_testcase_point_module4 ()
public subroutine of_testcase_point_module5 ()
public subroutine of_testcase_point_module6 ()
end prototypes

public subroutine of_testcase_point_module ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

ls_array[Upperbound(ls_array) + 1 ] = "Custom Visual Object"			
//ls_array[Upperbound(ls_array) + 1 ] = "uso301w01_cvoscope1"			//Verdict Global Type Custom Visual Object Whether Valid
//ls_array[Upperbound(ls_array) + 1 ] = "uso301w01_cvoscope2"			//Verdict Womdow Instance Type Costom Class Valid
//ls_array[Upperbound(ls_array) + 1 ] = "uso301w01_cvoscope3"			// Verdict Local Type Custom Visual Object Whether Valid
//ls_array[Upperbound(ls_array) + 1 ] = "uso301w01_cvoscope4"			//Declare Tow Global Custom Visual Object Variable One Time
//ls_array[Upperbound(ls_array) + 1 ] = "uso301w01_cvoscope5"			//Declare Tow Instance Custom Visual Object Variable One Time
//ls_array[Upperbound(ls_array) + 1 ] = "uso301w01_cvoscope6"			//Declare Tow Local Custom Visual Object Variable One Time
//ls_array[Upperbound(ls_array) + 1 ] = "uso301w01_cvoscope7"			//Verdict UserObject Type Variable Whether Valid

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
		case lower("Custom Visual Object")
			String(IsValid(guo_cvo))
			ls_result += wf_result_add(ls_item, " uso301w01_cvoscope1 ",    IsValid(guo_cvo) = false)
			
	//	case lower("uso301w01_cvoscope2")	
			String(IsValid(iuo_cvo))
			ls_result += wf_result_add(ls_item, " uso301w01_cvoscope2 ",   IsValid(iuo_cvo) = false)
		
	//	case lower("uso301w01_cvoscope3")
			n_uso301_cvo luo_cvo
			String(IsValid(luo_cvo))
			ls_result += wf_result_add(ls_item, " uso301w01_cvoscope3 ",   IsValid(luo_cvo) = false)
			
	//	case lower("uso301w01_cvoscope4")
			String(IsValid(guo_cvo1))
			String(IsValid(guo_cvo2))
			ls_result += wf_result_add(ls_item, " uso301w01_cvoscope4 ",   IsValid(guo_cvo1) = false and  IsValid(guo_cvo2) = false)
			
	//	case lower("uso301w01_cvoscope5")
			String(IsValid(iuo_cvo1))
			String(IsValid(iuo_cvo2))
			ls_result += wf_result_add(ls_item, " uso301w01_cvoscope5 ",  IsValid(iuo_cvo1) = false and  IsValid(iuo_cvo2) = false)
			
	//	case lower("uso301w01_cvoscope6")
			n_uso301_cvo luo_cvo1, luo_cvo2
			String(IsValid(luo_cvo1))
			String(IsValid(luo_cvo2))
			ls_result += wf_result_add(ls_item, " uso301w01_cvoscope6 ",   IsValid(luo_cvo1) = false and  IsValid(luo_cvo2) = false)
			
	//	case lower("uso301w01_cvoscope7")
			UserObject luo_cvo3
			String(IsValid(luo_cvo3))
			ls_result += wf_result_add(ls_item, " uso301w01_cvoscope7 ",   IsValid(luo_cvo3) = false)
			
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

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "Custom Visual Object"			
//ls_array[Upperbound(ls_array) + 1 ] = "uso302w01_cvoeval1"			//Simple Eval
//ls_array[Upperbound(ls_array) + 1 ] = "uso302w01_cvoeval2"			//Refrence Eval
//ls_array[Upperbound(ls_array) + 1 ] = "uso302w01_cvoeval3"			// Verdict Inner Object After Refrence Eval
//ls_array[Upperbound(ls_array) + 1 ] = "uso302w01_cvoeval4"			// Expression '=' After Refrence Eval

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
		case lower("Custom Visual Object")	
			n_uso302_cvo luo_a
			uo_cvo2.is_str = 'Modified cvo'
			luo_a = uo_cvo2
			ls_result += wf_result_add(ls_item, " uso302w01_cvoeval1 ",   uo_cvo2.is_str = 'Modified cvo' and  luo_a.is_str = 'Modified cvo')
			
	//	case lower("uso302w01_cvoeval2")
			n_uso302_cvo luo_b
			luo_b = uo_cvo2
			luo_b.is_str = 'Modified b'
			ls_result += wf_result_add(ls_item, " uso302w01_cvoeval2 ",    uo_cvo2.is_str = 'Modified b' and  luo_b.is_str = 'Modified b')
		
	//	case lower("uso302w01_cvoeval3")
			n_uso302_cvo luo_c
			luo_c = uo_cvo2
			luo_c.iuo_autouo.is_str = 'Modified c'
			ls_result += wf_result_add(ls_item, " uso302w01_cvoeval3 ",    uo_cvo2.iuo_autouo.is_str = 'Modified c' and  luo_c.iuo_autouo.is_str = 'Modified c')
			
	//	case lower("uso302w01_cvoeval4")
			n_uso302_cvo luo_d
			luo_d = uo_cvo2
			ls_result += wf_result_add(ls_item, " uso302w01_cvoeval4 ",     uo_cvo2.is_str = 'Modified b' and  luo_d.is_str = 'Modified b')
		
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
n_uso303_cvo uo_cvo

ls_array[Upperbound(ls_array) + 1 ] = "Custom Visual Object"			
//ls_array[Upperbound(ls_array) + 1 ] = "uso303w01_cvoprop1"			//Use This Get Property Inner Object
//ls_array[Upperbound(ls_array) + 1 ] = "uso303w01_cvoprop2"			//Don't Use This Get Property Inner Object
//ls_array[Upperbound(ls_array) + 1 ] = "uso303w01_cvoprop3"			// Get Property Outer Object

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
		case lower("Custom Visual Object")
			uo_cvo3.of_this_text()
			ls_result += wf_result_add(ls_item, " uso303w01_cvoprop1 ",   uo_cvo3.BackColor = 67108864)
			
	//	case lower("uso303w01_cvoprop2")
			uo_cvo3.of_text()
			ls_result += wf_result_add(ls_item, " uso303w01_cvoprop2 ",    uo_cvo3.BackColor = 67108864)
		
	//	case lower("uso303w01_cvoprop3")
			String(uo_cvo3.BackColor)
			ls_result += wf_result_add(ls_item, " uso303w01_cvoprop3 ",      uo_cvo3.BackColor = 67108864)
		
	end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine wf_output (string as_mess, boolean ab_clear);////////////////////////////////////////////////////////////////
//Function : Wf_OutPut
//Argument : String   as_mess;   The Message you will output 
//				 Boolean  ab_clear;  Clear Flag
//Output   : None
//Designer : 
//Date     :
////////////////////////////////////////////////////////////////

If ab_clear Then
mle_output.Text = ""
ii_index = 0
End IF	

ii_index = ii_index + 1
mle_output.Text += String(ii_index,'00')+". "+as_mess+"~r~n"
end subroutine

public subroutine of_testcase_point_module3 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

ls_array[Upperbound(ls_array) + 1 ] = "Custom Visual Object"			
//ls_array[Upperbound(ls_array) + 1 ] = "uso304w01_callevent1"			//Trigger Constructor Event When Define Object
//ls_array[Upperbound(ls_array) + 1 ] = "uso304w01_callevent2"			//Object Event Name then Same as Window Event Name

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
		case lower("Custom Visual Object")
			n_uso304_cvo uo_cvo
			ls_result += wf_result_add(ls_item, " uso304w01_callevent1 ",   uo_cvo4.is_str = 'Call Object Event n_uso303_cvo.Constructor()')
			
	//	case lower("uso304w01_callevent2")
			gs_str = 'Create'
			uo_cvo4.of_callsameevent()
			ls_result += wf_result_add(ls_item, " uso304w01_callevent2 ", gs_str='Call Object Event n_uso303_cvo.ue_same()')
			
	end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module4 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

ls_array[Upperbound(ls_array) + 1 ] = "Custom Visual Object"			
//ls_array[Upperbound(ls_array) + 1 ] = "uso305w01_callfunction1"			//Call Object Function Inner Object
//ls_array[Upperbound(ls_array) + 1 ] = "uso305w01_callfunction2"			//Call Object Override Function Inner Object
//ls_array[Upperbound(ls_array) + 1 ] = "uso305w01_callfunction3"			//Object Function Name The Same as Window Function
//ls_array[Upperbound(ls_array) + 1 ] = "uso305w01_callfunction4"			//Call Object Override Function Outer Object

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
		case lower("Custom Visual Object")
			uo_cvo5.of_override_user('1')
			ls_result += wf_result_add(ls_item, " uso305w01_callfunction1_1 ",  uo_cvo5.is_str = 'Call Object Function n_uso305_cvo.of_override(integer ai_data)')
			uo_cvo5.of_override_user('2')
			ls_result += wf_result_add(ls_item, " uso305w01_callfunction1_2 ",   uo_cvo5.is_str = 'Call Object Function n_uso305_cvo.of_override(string as_data)')
			uo_cvo5.of_override_user('3')
			ls_result += wf_result_add(ls_item, " uso305w01_callfunction1_3 ",   uo_cvo5.is_str = 'Call Object Function n_uso305_cvo.of_override(integer ai_data, string as_data)')
			
	//	case lower("uso305w01_callfunction2")
			uo_cvo5.of_callsamefunc()
			ls_result += wf_result_add(ls_item, " uso305w01_callfunction2 ",  uo_cvo5.is_str = 'Call Object Function n_uso305_cvo.of_same()')
			
	//	case lower("uso305w01_callfunction3")
			uo_cvo5.of_override('1')
			ls_result += wf_result_add(ls_item, " uso305w01_callfunction3_1 ",  uo_cvo5.is_str = 'Call Object Function n_uso305_cvo.of_override(string as_data)')
			uo_cvo5.of_override(1)
			ls_result += wf_result_add(ls_item, " uso305w01_callfunction3_2 ",  uo_cvo5.is_str = 'Call Object Function n_uso305_cvo.of_override(integer ai_data)')
			uo_cvo5.of_override(1, '1')
			ls_result += wf_result_add(ls_item, " uso305w01_callfunction3_3 ",  uo_cvo5.is_str = 'Call Object Function n_uso305_cvo.of_override(integer ai_data, string as_data)')
			
	end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module5 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

ls_array[Upperbound(ls_array) + 1 ] = "Custom Visual Object"			
//ls_array[Upperbound(ls_array) + 1 ] = "uso306w01_cvoinstance1"			//Call Object Inner Simple Type Instance Variable
//ls_array[Upperbound(ls_array) + 1 ] = "uso306w01_cvoinstance2"			//Call Object Inner Date Type Instance Variable
//ls_array[Upperbound(ls_array) + 1 ] = "uso306w01_cvoinstance3"			//Call Object Inner Object Type Instance Variable
//ls_array[Upperbound(ls_array) + 1 ] = "uso306w01_cvoinstance4"			//Call Object Use This Appoint
//ls_array[Upperbound(ls_array) + 1 ] = "uso306w01_cvoinstance5"			//Call Object Don't Use This Appoint
//ls_array[Upperbound(ls_array) + 1 ] = "uso306w01_cvoinstance6"			//Object Variable Name as Same as Windows Instance Variable Name
//ls_array[Upperbound(ls_array) + 1 ] = "uso306w01_cvoinstance7"			//Outer Call Object Simple Type Instance Variable
//ls_array[Upperbound(ls_array) + 1 ] = "uso306w01_cvoinstance8"			//Outer Call Object Type Instance Variable

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
		case lower("Custom Visual Object")	
			uo_cvo6.of_intinstance()
			ls_result += wf_result_add(ls_item, " uso306w01_cvoinstance1 ",    il_int1 = 1 and  il_int2 = 0)
			
	//	case lower("uso306w01_cvoinstance2")	
			uo_cvo6.of_dateinstance()
			 date t=date(2000,1,1)
			 date t1=date(1900,1,1)
			 ls_result += wf_result_add(ls_item, " uso306w01_cvoinstance2 ", id_date1=t and  id_date2=t1   )
		
	//	case lower("uso306w01_cvoinstance3")
			uo_cvo6.of_objectinstance()
			ls_result += wf_result_add(ls_item, " uso306w01_cvoinstance3 ",   uo_cvo6.iuo_autouo.is_str = 'Create')
			
	//	case lower("uso306w01_cvoinstance4")
			uo_cvo6.of_this_string()
			ls_result += wf_result_add(ls_item, " uso306w01_cvoinstance4 ",   uo_cvo6.is_str = 'Create')
			
	//	case lower("uso306w01_cvoinstance5")
			uo_cvo6.of_string()
			ls_result += wf_result_add(ls_item, " uso306w01_cvoinstance5 ",  uo_cvo6.is_str = 'Create')
			
	//	case lower("uso306w01_cvoinstance6")
			uo_cvo6.of_same()
			ls_result += wf_result_add(ls_item, " uso306w01_cvoinstance6 ",  uo_cvo6.is_same ='This is Object n_uso306_cvo.is_same')
			
	//	case lower("uso306w01_cvoinstance7")
			ls_result += wf_result_add(ls_item, " uso306w01_cvoinstance7 ",   uo_cvo6.is_str ='Create')
			
	//	case lower("uso306w01_cvoinstance8")
			ls_result += wf_result_add(ls_item, " uso306w01_cvoinstance8 ",    uo_cvo6.iuo_autouo.is_str = 'Create')
			
	end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module6 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

ls_array[Upperbound(ls_array) + 1 ] = "Custom Visual Object"			
//ls_array[Upperbound(ls_array) + 1 ] = "uso307w01_cvoarray"				// Define Custom Visual Object Array

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
	case lower("Custom Visual Object")	
		n_uso307_cvo luo_cvo[2]
		ls_result += wf_result_add(ls_item, " uso307w01_cvoarray ",    IsValid(luo_cvo[1]) = false and  IsValid(luo_cvo[2]) = false)
	
end choose 
next 

is_resultlog += ls_result
end subroutine

on w_user_object1.create
int iCurrent
call super::create
this.uo_1=create uo_1
this.st_6=create st_6
this.uo_cvo6=create uo_cvo6
this.st_5=create st_5
this.uo_cvo3=create uo_cvo3
this.st_4=create st_4
this.uo_cvo2=create uo_cvo2
this.st_3=create st_3
this.uo_cvo5=create uo_cvo5
this.st_2=create st_2
this.uo_cvo4=create uo_cvo4
this.mle_output=create mle_output
this.st_1=create st_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
this.Control[iCurrent+2]=this.st_6
this.Control[iCurrent+3]=this.uo_cvo6
this.Control[iCurrent+4]=this.st_5
this.Control[iCurrent+5]=this.uo_cvo3
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.uo_cvo2
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.uo_cvo5
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.uo_cvo4
this.Control[iCurrent+12]=this.mle_output
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.cb_1
end on

on w_user_object1.destroy
call super::destroy
destroy(this.uo_1)
destroy(this.st_6)
destroy(this.uo_cvo6)
destroy(this.st_5)
destroy(this.uo_cvo3)
destroy(this.st_4)
destroy(this.uo_cvo2)
destroy(this.st_3)
destroy(this.uo_cvo5)
destroy(this.st_2)
destroy(this.uo_cvo4)
destroy(this.mle_output)
destroy(this.st_1)
destroy(this.cb_1)
end on

type uo_1 from n_uso307_cvo within w_user_object1
integer x = 2240
integer y = 1100
integer taborder = 50
end type

on uo_1.destroy
call n_uso307_cvo::destroy
end on

type st_6 from statictext within w_user_object1
integer x = 1623
integer y = 1240
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "uo_cvo6:"
boolean focusrectangle = false
end type

type uo_cvo6 from n_uso306_cvo within w_user_object1
integer x = 590
integer y = 1104
integer taborder = 40
end type

on uo_cvo6.destroy
call n_uso306_cvo::destroy
end on

type st_5 from statictext within w_user_object1
integer x = 114
integer y = 1264
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "uo_cvo6:"
boolean focusrectangle = false
end type

type uo_cvo3 from n_uso303_cvo within w_user_object1
integer x = 640
integer y = 604
integer taborder = 30
end type

on uo_cvo3.destroy
call n_uso303_cvo::destroy
end on

type st_4 from statictext within w_user_object1
integer x = 128
integer y = 836
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "uo_cvo3:"
boolean focusrectangle = false
end type

type uo_cvo2 from n_uso302_cvo within w_user_object1
integer x = 663
integer y = 88
integer taborder = 20
end type

on uo_cvo2.destroy
call n_uso302_cvo::destroy
end on

type st_3 from statictext within w_user_object1
integer x = 160
integer y = 256
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "uo_cvo2:"
boolean focusrectangle = false
end type

type uo_cvo5 from n_uso305_cvo within w_user_object1
integer x = 2286
integer y = 596
integer taborder = 20
end type

on uo_cvo5.destroy
call n_uso305_cvo::destroy
end on

type st_2 from statictext within w_user_object1
integer x = 1637
integer y = 808
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "uo_cvo5:"
boolean focusrectangle = false
end type

type uo_cvo4 from n_uso304_cvo within w_user_object1
integer x = 2286
integer y = 68
integer taborder = 10
end type

on uo_cvo4.destroy
call n_uso304_cvo::destroy
end on

type mle_output from multilineedit within w_user_object1
integer x = 197
integer y = 1556
integer width = 2981
integer height = 476
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_user_object1
integer x = 1637
integer y = 272
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "uo_cvo4:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_user_object1
integer x = 23
integer y = 60
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

