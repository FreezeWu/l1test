$PBExportHeader$w_user_object.srw
forward
global type w_user_object from w_base_case
end type
type st_5 from statictext within w_user_object
end type
type uo_customvisual103 from u_cst_uso103_customvisual within w_user_object
end type
type st_4 from statictext within w_user_object
end type
type st_3 from statictext within w_user_object
end type
type uo_composite from n_cst_uso101_composite within w_user_object
end type
type cb_standardvisual from u_cst_uso101_standardvisual within w_user_object
end type
type st_2 from statictext within w_user_object
end type
type st_1 from statictext within w_user_object
end type
type uo_customvisual from u_cst_uso101_customvisual within w_user_object
end type
type cb_1 from commandbutton within w_user_object
end type
type cb_standardvisual103 from u_cst_uso103_standardvisual within w_user_object
end type
end forward

global type w_user_object from w_base_case
integer width = 3232
integer height = 2788
string title = "w_user_object"
string menuname = "m_uso103_autouvo"
st_5 st_5
uo_customvisual103 uo_customvisual103
st_4 st_4
st_3 st_3
uo_composite uo_composite
cb_standardvisual cb_standardvisual
st_2 st_2
st_1 st_1
uo_customvisual uo_customvisual
cb_1 cb_1
cb_standardvisual103 cb_standardvisual103
end type
global w_user_object w_user_object

type variables
n_cst_uso101_autouo iuo_autouo, iuo_multiautouo
n_cst_uso104_autouo iuo4_autouo
String	is_sameevent = 'No Event Triggered'
String	is_samefunc = 'No Function Called'
n_cst_uso109_l1_nvo iuo_nvo
n_cst_uso109_l1_nvo iuo_nvo1, iuo_nvo2
n_cst_uso111_nvo iuo11_nvo
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
public subroutine of_testcase_point_module4 ()
public subroutine of_testcase_point_module5 ()
public subroutine of_testcase_point_module6 ()
public subroutine of_testcase_point_module7 ()
public subroutine of_testcase_point_module8 ()
public subroutine of_testcase_point_module9 ()
public subroutine of_testcase_point_module10 ()
public subroutine of_testcase_point_module11 ()
end prototypes

public subroutine of_testcase_point_module ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname,ls_rtn
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
ls_array[Upperbound(ls_array) + 1 ] = "AutoInstantiate"	
//ls_array[Upperbound(ls_array) + 1 ] = "uso101_autonvodefine1"			//USO101W01P001: Instance Variable In Global AutoInstantiate Custom Class Valid Test
//ls_array[Upperbound(ls_array) + 1 ] = "uso101_autonvodefine2"			//USO101W02P001: Instance Variable In Instance AutoInstantiate Custom Class Define In Application
//ls_array[Upperbound(ls_array) + 1 ] = "uso101_autonvodefine3"			//USO101W03P001: Instance Variable In Instance AutoInstantiate Custom Class Define In Window
//ls_array[Upperbound(ls_array) + 1 ] = "uso101_autonvodefine4"			//USO101W04P001: Instance Variable In Instance AutoInstantiate Custom Class Define In Custom Class
//ls_array[Upperbound(ls_array) + 1 ] = "uso101_autonvodefine5"			//USO101W05P001: Instance Variable In Instance AutoInstantiate Custom Class Define In AutoInstantiate Custom Class
//ls_array[Upperbound(ls_array) + 1 ] = "uso101_autonvodefine6"			//USO101W06P001: Instance Variable In Instance AutoInstantiate Custom Class Define In Custom Visual
//ls_array[Upperbound(ls_array) + 1 ] = "uso101_autonvodefine7"			//USO101W07P001: Instance Variable In Instance AutoInstantiate Custom Class Define In Standard Class
//ls_array[Upperbound(ls_array) + 1 ] = "uso101_autonvodefine8"			//USO101W08P001: Instance Variable In Instance AutoInstantiate Custom Class Define In Standard Visual
//ls_array[Upperbound(ls_array) + 1 ] = "uso101_autonvodefine9"			//USO101W09P001: Instance Variable In Instance AutoInstantiate Custom Class Define In Local
//ls_array[Upperbound(ls_array) + 1 ] = "uso101_autonvodefine10"			//USO101W10P001: Multi Define Global AutoInstantiate Custom Class Variable,USO101W10P002: Multi Define Instance AutoInstantiate Custom Class Variable,USO101W10P003: Multi Define Local AutoInstantiate Custom Class Variable
//ls_array[Upperbound(ls_array) + 1 ] = "uso101_autonvodefine11"			//USO101W11P001: Instance Variable In Instance AutoInstantiate Custom Class Define In Custom Visual

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
		case lower("AutoInstantiate")	
			ls_result += wf_result_add(ls_item, " uso101_autonvodefine1 ",   guo_autouo.is_str= "Create")
		
	//	case lower("uso101_autonvodefine2")
			//Modified by zhoujunwei at 2017-11-28
			ls_rtn = getapplication().function dynamic of_setinstance()
			ls_result += wf_result_add(ls_item, " uso101_autonvodefine2 ", ls_rtn= "Create")
		
	//	case lower("uso101_autonvodefine3")
			ls_result += wf_result_add(ls_item, " uso101_autonvodefine3 ", This.iuo_autouo.is_str= "Create")
		
	//	case lower("uso101_autonvodefine4")
				n_cst_uso101_customclass luo_customclass
				luo_customclass = Create n_cst_uso101_customclass
				ls_result += wf_result_add(ls_item, " uso101_autonvodefine4 ",  luo_customclass.iuo_autouo.is_str= "Create")
				destroy luo_customclass
		
	//	case lower("uso101_autonvodefine5")
			n_cst_uso101_autocustomclass luo_autocustomclass
			ls_result += wf_result_add(ls_item, " uso101_autonvodefine5 ",  luo_autocustomclass.iuo_autouo.is_str= "Create")
		
	//	case lower("uso101_autonvodefine6")
			ls_result += wf_result_add(ls_item, " uso101_autonvodefine6 ",  uo_customvisual.iuo_autouo.is_str= "Create")
			
	//	case lower("uso101_autonvodefine7")
			n_cst_uso101_standardclass luo_standardclass
			luo_standardclass = Create n_cst_uso101_standardclass
			ls_result += wf_result_add(ls_item, " uso101_autonvodefine7 ",  luo_standardclass.iuo_autouo.is_str= "Create")
			destroy luo_standardclass
			
	//	case lower("uso101_autonvodefine8")
			ls_result += wf_result_add(ls_item, " uso101_autonvodefine8 ",  cb_standardvisual.iuo_autouo.is_str= "Create")
		
	//	case lower("uso101_autonvodefine9")
			n_cst_uso101_autouo luo_autouo
			ls_result += wf_result_add(ls_item, " uso101_autonvodefine9 ",   luo_autouo.is_str= "Create")
		
	//	case lower("uso101_autonvodefine10")
			ls_result += wf_result_add(ls_item, " uso101_autonvodefine10_1 ",  guo_multiautouo.is_str= "Create" and  guo_autouo.is_str="Create" )
		
			ls_result += wf_result_add(ls_item, " uso101_autonvodefine10_2 ",  iuo_autouo.is_str= "Create" and  iuo_multiautouo.is_str="Create")
			
			n_cst_uso101_autouo  luo_multiautouo
			ls_result += wf_result_add(ls_item, " uso101_autonvodefine10_3 ", luo_autouo.is_str= "Create" and  luo_multiautouo.is_str="Create")
			
	//	case lower("uso101_autonvodefine11")
			ls_result += wf_result_add(ls_item, " uso101_autonvodefine2 ",  uo_composite.iuo_autouo.is_str="Create")
			
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
Long		    ll_RowNo
Int		         li_IDDataBase,li_IDDataWindow

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)
ls_array[Upperbound(ls_array) + 1 ] = "AutoInstantiate"	
//ls_array[Upperbound(ls_array) + 1 ] = "uso102_autonvoappasscee"			//USO102W01P001: Call AutoCustomClass In Applicatin


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
		case lower("AutoInstantiate")
		n_cst_uso102_autouo luo2_autouo
		luo2_autouo.is_str = 'Create'
		gs_str = luo2_autouo.is_str
		ls_result += wf_result_add(ls_item, " uso102_autonvoappasscee ",  gs_str = 'Create')

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
Long		    ll_RowNo
Int		         li_IDDataBase,li_IDDataWindow

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)
gs_str = 'Call Error!'
ls_array[Upperbound(ls_array) + 1 ] = "AutoInstantiate"	
//ls_array[Upperbound(ls_array) + 1 ] = "uso103_autonvoasscee1"			//USO103W01P001: Call AutoCustomClass In Window
//ls_array[Upperbound(ls_array) + 1 ] = "uso103_autonvoasscee2"			//USO103W01P002: Call AutoCustomClass In Menu
//ls_array[Upperbound(ls_array) + 1 ] = "uso103_autonvoasscee3"			//USO103W01P003: Call AutoCustomClass In Global Function
//ls_array[Upperbound(ls_array) + 1 ] = "uso103_autonvoasscee4"			//USO103W01P004: Call AutoCustomClass In Custom Class
//ls_array[Upperbound(ls_array) + 1 ] = "uso103_autonvoasscee5"			//USO103W01P005: Call AutoCustomClass In Custom Visual
//ls_array[Upperbound(ls_array) + 1 ] = "uso103_autonvoasscee6"			//USO103W01P006: Call AutoCustomClass In Standard Class
//ls_array[Upperbound(ls_array) + 1 ] = "uso103_autonvoasscee7"			//USO103W01P007: Call AutoCustomClass In Standard Visual

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
		case lower("AutoInstantiate")	
			n_cst_uso103_autouo luo_autouo
			gs_str = luo_autouo.is_str
			ls_result += wf_result_add(ls_item, " uso103_autonvoasscee1 ",  gs_str= "Create")
		
	//	case lower("uso103_autonvoasscee2")	
			m_uso103_autouvo.mf_call()
			ls_result += wf_result_add(ls_item, " uso103_autonvoasscee2 ",  gs_str="Create")
		
	//	case lower("uso103_autonvoasscee3")
			gf_uso103_call()
			ls_result += wf_result_add(ls_item, " uso103_autonvoasscee3 ",  gs_str="Create")
			
	//	case lower("uso103_autonvoasscee4")
			n_cst_uso103_customclass luo_customclass
			luo_customclass = Create n_cst_uso103_customclass
			luo_customclass.uf_call()
			Destroy luo_customclass
			ls_result += wf_result_add(ls_item, " uso103_autonvoasscee4 ",  gs_str="Create")
			
	//	case lower("uso103_autonvoasscee5")
			uo_customvisual103.uf_call()
			ls_result += wf_result_add(ls_item, " uso103_autonvoasscee5 ",  gs_str="Create")
			
	//	case lower("uso103_autonvoasscee6")
			n_cst_uso103_standardclass luo_standardclass
			luo_standardclass = Create n_cst_uso103_standardclass
			luo_standardclass.uf_call()
			ls_result += wf_result_add(ls_item, " uso103_autonvoasscee6 ",  gs_str="Create")
		
	//	case lower("uso103_autonvoasscee7")
			cb_standardvisual103.uf_call()
			ls_result += wf_result_add(ls_item, " uso103_autonvoasscee7 ",  gs_str="Create")
			
	end choose 
next 

is_resultlog += ls_result
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
Long		    ll_RowNo
Int		         li_IDDataBase,li_IDDataWindow

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)
ls_array[Upperbound(ls_array) + 1 ] = "AutoInstantiate"	
ls_array[Upperbound(ls_array) + 1 ] = "uso104wo1_autonvoeval1"			//USO104W01P001: Simple Eval Bettween AutoCustomClass And AutoCustomClass
ls_array[Upperbound(ls_array) + 1 ] = "uso104wo1_autonvoeval2"			//USO104W02P002: Eval Bettween AutoCustomClass And AutoCustomClass Inner Custom Class
ls_array[Upperbound(ls_array) + 1 ] = "uso104wo1_autonvoeval3"			//USO104W01P003: Eval Bettween Instance And Global AutoCustomClass
ls_array[Upperbound(ls_array) + 1 ] = "uso104wo1_autonvoeval4"			//USO104W01P004: Eval Bettween Instance And Local AutoCustomClass
ls_array[Upperbound(ls_array) + 1 ] = "uso104wo1_autonvoeval5"			//USO104W01P005: Eval Bettween Local And Global AutoCustomClass
ls_array[Upperbound(ls_array) + 1 ] = "uso104wo1_complexeval1"			//USO104W02P001: Eval Bettween AutoCustomClass And AutoCustomClass Inner Instance Variable
ls_array[Upperbound(ls_array) + 1 ] = "uso104wo1_complexeval2"			//USO103W01P007: Call AutoCustomClass In Standard Visual
ls_array[Upperbound(ls_array) + 1 ] = "uso104wo1_complexeval3"			//USO104W02P003: Eval Bettween Instance And Global AutoCustomClass Inner AutoInstantiate Class
ls_array[Upperbound(ls_array) + 1 ] = "uso104wo1_complexeval4"			//USO104W02P004: Eval Bettween Instance And Local AutoCustomClass Inner Stucture Object
ls_array[Upperbound(ls_array) + 1 ] = "uso104wo1_complexeval5"			//USO104W02P005: Expression '=' Bettween AutoCustomClass And AutoCustomClass
ls_array[Upperbound(ls_array) + 1 ] = "uso104wo1_complexeval6"			//USO104W02P006: Expression '=' After Eval Bettween AutoCustomClass And AutoCustomClass

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
		case lower("AutoInstantiate")	
			n_cst_uso104_autouo luo_a, luo_b
			luo_a.is_str = 'Modified a'
			luo_b = luo_a	
			ls_result += wf_result_add(ls_item, " uso104wo1_autonvoeval1 ",  luo_b.is_str= 'Modified a')
	
	//	case lower("uso104wo1_autonvoeval2")	
			n_cst_uso104_autouo luo_c, luo_d
			luo_c.is_str = 'Modified c'
			luo_d = luo_c
			luo_d.is_str = 'Modified d' 
			ls_result += wf_result_add(ls_item, " uso104wo1_autonvoeval2 ", 	luo_c.is_str ='Modified c' and luo_d.is_str = 'Modified d' )
			
		
	//	case lower("uso104wo1_autonvoeval3")
			iuo4_autouo.is_str = 'Modified Instance'
			guo4_autouo = iuo4_autouo
			ls_result += wf_result_add(ls_item, " uso104wo1_autonvoeval3 ", 	guo4_autouo.is_str ='Modified Instance' )
	
	
	//	case lower("uso104wo1_autonvoeval4")
			n_cst_uso104_autouo luo_e
			luo_e.is_str = 'Modified e'
			iuo4_autouo = luo_e
			ls_result += wf_result_add(ls_item, " uso104wo1_autonvoeval4 ", 	 iuo4_autouo.is_str ='Modified e' )
	
		
	//	case lower("uso104wo1_autonvoeval5")
			n_cst_uso104_autouo luo_f
			guo4_autouo.is_str = 'Modified Global'
			luo_f = guo4_autouo
			ls_result += wf_result_add(ls_item, " uso104wo1_autonvoeval5 ", 	 luo_f.is_str='Modified Global' )
			
	//	case lower("uso104wo1_complexeval1")	
			n_cst_uso104_autouo luo_b1
			luo_b1.is_str = 'Modified b'
			luo_a.is_str = luo_b1.is_str
			ls_result += wf_result_add(ls_item, " uso104wo1_complexeval1 ", 	 luo_a.is_str ='Modified b' )
		
		
	//	case lower("uso104wo1_complexeval2")
			n_cst_uso104_autouo luo_c1, luo_d1
			n_cst_uso104_customclass luo_customclass
			luo_customclass = Create n_cst_uso104_customclass
			luo_customclass.is_str = 'Modified Customclass'
			luo_c1.iuo_customclass = luo_customclass
			luo_d1.iuo_customclass = luo_c1.iuo_customclass
			luo_c1.iuo_customclass.is_str = 'Modified c'
			ls_result += wf_result_add(ls_item, " uso104wo1_complexeval2 ",  luo_c1.iuo_customclass.is_str = 'Modified c' and luo_d1.iuo_customclass.is_str= 'Modified c'  )
			destroy  luo_customclass
	
	
	//	case lower("uso104wo1_complexeval3")
			n_cst_uso104_autouo luo_e1, luo_f1
			n_cst_uso104_customautoclass luo_customautoclass
			luo_customautoclass.is_str = 'Modified Customautoclass'
			luo_e1.iuo_customautoclass = luo_customautoclass
			luo_f1.iuo_customautoclass = luo_e1.iuo_customautoclass
			luo_e1.iuo_customautoclass.is_str = 'Modified e'
			ls_result += wf_result_add(ls_item, " uso104wo1_complexeval3 ",  luo_e1.iuo_customautoclass.is_str = 'Modified e' and luo_f1.iuo_customautoclass.is_str= 'Modified Customautoclass'  )
	
	
	//	case lower("uso104wo1_complexeval4")
			n_cst_uso104_autouo luo_g, luo_h
			luo_g.istr_string.ss_str = 'Modified g'
			luo_h.istr_string = luo_g.istr_string
			luo_h.istr_string.ss_str = 'Modified h'
			ls_result += wf_result_add(ls_item, " uso104wo1_complexeval4 ", 	luo_g.istr_string.ss_str = 'Modified g' and luo_h.istr_string.ss_str = 'Modified h'  )
	
		
	//	case lower("uso104wo1_complexeval5")
			n_cst_uso104_autouo luo_i, luo_j
			luo_i.is_str = 'Modified i'
			luo_j.is_str = 'Modified j'
			ls_result += wf_result_add(ls_item, " uso104wo1_complexeval5 ", 	luo_i.is_str = 'Modified i' and luo_j.is_str = 'Modified j'  )
		
	
	//	case lower("uso104wo1_complexeval6")
			n_cst_uso104_autouo luo_k, luo_l
			luo_k.is_str = 'Modified k'
			luo_l = luo_k
			ls_result += wf_result_add(ls_item, " uso104wo1_complexeval6 ", 	 luo_k.is_str  = 'Modified k' and  luo_l.is_str = 'Modified k'  )
			
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
Long		    ll_RowNo
Int		         li_IDDataBase,li_IDDataWindow

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)
ls_array[Upperbound(ls_array) + 1 ] = "AutoInstantiate"	
ls_array[Upperbound(ls_array) + 1 ] = "uso105w01_autonvoinstance1"			//Call AutoCustomClass Inner Simple Type Instance Variable
ls_array[Upperbound(ls_array) + 1 ] = "uso105w01_autonvoinstance2"			//Call AutoCustomClass Inner Date Type Instance Variable
ls_array[Upperbound(ls_array) + 1 ] = "uso105w01_autonvoinstance3"			//Call AutoCustomClass Inner Object Type Instance Variable
ls_array[Upperbound(ls_array) + 1 ] = "uso105w01_autonvoinstance4"			//Call AutoCustomClass Use This Appoint
ls_array[Upperbound(ls_array) + 1 ] = "uso105w01_autonvoinstance5"			//Call AutoCustomClass Don't Use This Appoint
ls_array[Upperbound(ls_array) + 1 ] = "uso105w01_autonvoinstance6"			// AutoCustomClass Variable Name as Same as Windows Instance Variable Name
ls_array[Upperbound(ls_array) + 1 ] = "uso105w01_autonvoinstance7"			//Outer Call AutoCustomClass Simple Type Instance Variable
ls_array[Upperbound(ls_array) + 1 ] = "uso105w01_autonvoinstance8"			//Outer Call AutoCustomClass Object Type Instance Variable

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
		case lower("AutoInstantiate")	
			n_cst_uso105_autouo luo_a
			luo_a.of_strinstance()
			ls_result += wf_result_add(ls_item, " uso105w01_autonvoinstance1 ",  luo_a.is_str1 = "Create" and luo_a.is_str2 =""  )
		
	//	case lower("uso105w01_autonvoinstance2")	
			 luo_a.of_dateinstance()
			 date t=date(2000,1,1)
			 date t1=date(1900,1,1)
		ls_result += wf_result_add(ls_item, " uso105w01_autonvoinstance2 ",  luo_a.id_date1 = t  and  luo_a.id_date2 =t1)
		
	//	case lower("uso105w01_autonvoinstance3")
			n_cst_uso105_autouo luo_c
			luo_c.of_objectinstance()
			ls_result += wf_result_add(ls_item, " uso105w01_autonvoinstance3 ",   luo_a.iuo_autouo.is_str ="Create")
			
	//	case lower("uso105w01_autonvoinstance4")
			n_cst_uso105_autouo luo_d
			luo_d.of_this_string()
			ls_result += wf_result_add(ls_item, " uso105w01_autonvoinstance4 ",luo_d.is_str1="Create")
			
	//	case lower("uso105w01_autonvoinstance5")
			n_cst_uso105_autouo luo_e
			 luo_a.of_string()
			ls_result += wf_result_add(ls_item, " uso105w01_autonvoinstance5 ",  luo_a.is_str1="Create")
			
	//	case lower("uso105w01_autonvoinstance6")
			n_cst_uso105_autouo luo_f
			luo_a.of_same()
			ls_result += wf_result_add(ls_item, " uso105w01_autonvoinstance6 ",  luo_a.is_samename = 'Variable is_samename inner n_cst_uso105_autouo')
		
	//	case lower("uso105w01_autonvoinstance7")
			n_cst_uso105_autouo luo_g
			ls_result += wf_result_add(ls_item, " uso105w01_autonvoinstance7 ",   luo_g.is_str1="Create")
	
	//	case lower("uso105w01_autonvoinstance8")
			n_cst_uso105_autouo luo_h
			ls_result += wf_result_add(ls_item, " uso105w01_autonvoinstance8 ",  luo_h.iuo_autouo.is_str="Create")
			
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
Long		    ll_RowNo
Int		         li_IDDataBase,li_IDDataWindow

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)
ls_array[Upperbound(ls_array) + 1 ] = "AutoInstantiate"	
//ls_array[Upperbound(ls_array) + 1 ] = "uso106w01_callevent1"			//Call Constructor When Declare
//ls_array[Upperbound(ls_array) + 1 ] = "uso106w01_callevent2"			//Use Event Call Custom Event Inner Object
//ls_array[Upperbound(ls_array) + 1 ] = "uso106w01_callevent3"			//Use This.Event Call Object Custom Event Inner Object
//ls_array[Upperbound(ls_array) + 1 ] = "uso106w01_callevent4"			//Object Event Name the Same As Window Event Name
//ls_array[Upperbound(ls_array) + 1 ] = "uso106w01_callevent5"			//Use Object.Event Call Object Custom Event Outer Object

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
		case lower("AutoInstantiate")	
			n_cst_uso106_autouo luo_a
			 ls_result += wf_result_add(ls_item, " uso106w01_callevent1 ",  luo_a.is_status =  'Call UserObject Event n_cst_uso106_nvo.constructor()')
		
	//	case lower("uso106w01_callevent2")	
			n_cst_uso106_autouo luo_b
			luo_b.of_event()
			ls_result += wf_result_add(ls_item, " uso106w01_callevent2 ",   luo_b.is_status = 'Call UserObject Event n_cst_uso106_nvo.ue_customevent()')
		
	//	case lower("uso106w01_callevent3")
			n_cst_uso106_autouo luo_c
			luo_c.of_this_event()
			ls_result += wf_result_add(ls_item, " uso106w01_callevent3 ",    luo_c.is_status = 'Call UserObject Event n_cst_uso106_nvo.ue_customevent()')
			
	//	case lower("uso106w01_callevent4")
			n_cst_uso106_autouo luo_d
			luo_d.of_callsameevent()
			ls_result += wf_result_add(ls_item, " uso106w01_callevent4 ",  luo_d.is_status = 'Call UserObject Event n_cst_uso106_nvo.ue_same()' and This.is_sameevent = 'No Event Triggered')
			
	//	case lower("uso106w01_callevent5")
			n_cst_uso106_autouo luo_e
			luo_e.Event ue_customevent()
			ls_result += wf_result_add(ls_item, " uso106w01_callevent5 ",    luo_e.is_status ='Call UserObject Event n_cst_uso106_nvo.ue_customevent()')
		
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
Long		    ll_RowNo
Int		         li_IDDataBase,li_IDDataWindow

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)
ls_array[Upperbound(ls_array) + 1 ] = "AutoInstantiate"	
//ls_array[Upperbound(ls_array) + 1 ] = "uso107w01_callfunction1"			// Immediate Call Object Function Inner Object
//ls_array[Upperbound(ls_array) + 1 ] = "uso107w01_callfunction2"			//Use This Call Object Function Inner Object
//ls_array[Upperbound(ls_array) + 1 ] = "uso107w01_callfunction3"			//Call Object Override Function Inner Object
//ls_array[Upperbound(ls_array) + 1 ] = "uso107w01_callfunction4"			// Object Function Name the Same As Window Function Name
//ls_array[Upperbound(ls_array) + 1 ] = "uso107w01_callfunction5"			//Use Object.Function Call Object Function Outer Object
//ls_array[Upperbound(ls_array) + 1 ] = "uso107w01_callfunction6"			//Call Object Override Function Outer Object
//ls_array[Upperbound(ls_array) + 1 ] = "uso107w01_callfunction7"			//Object Function argument use reference of object-self

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
		case lower("AutoInstantiate")	
			n_cst_uso107_autouo luo_a
			luo_a.of_user()
			ls_result += wf_result_add(ls_item, " uso107w01_callfunction1 ",   luo_a.is_status= 'Call UserObject Function n_cst_uso107_autouo.of_function()')
		
	//	case lower("uso107w01_callfunction2")	
			n_cst_uso107_autouo luo_b
			luo_b.of_this_user()
			ls_result += wf_result_add(ls_item, " uso107w01_callfunction2 ",  luo_b.is_status='Call UserObject Function n_cst_uso107_autouo.of_this_function()')
		
	//	case lower("uso107w01_callfunction3")
			n_cst_uso107_autouo luo_c
			luo_c.of_override_user('1')
			ls_result += wf_result_add(ls_item, " uso107w01_callfunction3_1 ",  luo_c.is_status = 'Call UserObject Function n_cst_uso107_autouo.of_override(integer ai_data)')
			luo_c.of_override_user('2')
			ls_result += wf_result_add(ls_item, " uso107w01_callfunction3_2 ",  luo_c.is_status = 'Call UserObject Function n_cst_uso107_autouo.of_override(string as_data)')
			luo_c.of_override_user('3')
			ls_result += wf_result_add(ls_item, " uso107w01_callfunction3_3 ",  luo_c.is_status = 'Call UserObject Function n_cst_uso107_autouo.of_override(integer ai_data, string as_data)')
			
	//	case lower("uso107w01_callfunction4")
			n_cst_uso107_autouo luo_d
			luo_d.of_same_user()
			ls_result += wf_result_add(ls_item, " uso107w01_callfunction4 ",   luo_d.is_status = 'Call UserObject Function n_cst_uso107_autouo.of_same()' and  This.is_samefunc = 'No Function Called')
			
	//	case lower("uso107w01_callfunction5")
			n_cst_uso107_autouo luo_e
			luo_e.of_function()
			ls_result += wf_result_add(ls_item, " uso107w01_callfunction5 ",  luo_e.is_status = 'Call UserObject Function n_cst_uso107_autouo.of_function()')
			
	//	case lower("uso107w01_callfunction6")
				n_cst_uso107_autouo luo_f		
				luo_f.of_override(1)	
				ls_result += wf_result_add(ls_item, " uso107w01_callfunction6_1 ",  luo_f.is_status = 'Call UserObject Function n_cst_uso107_autouo.of_override(integer ai_data)')
				luo_f.of_override('1')	
				ls_result += wf_result_add(ls_item, " uso107w01_callfunction6_2 ",  luo_f.is_status = 'Call UserObject Function n_cst_uso107_autouo.of_override(string as_data)')
				luo_f.of_override(1, '1')
				ls_result += wf_result_add(ls_item, " uso107w01_callfunction6_3 ",  luo_f.is_status = 'Call UserObject Function n_cst_uso107_autouo.of_override(integer ai_data, string as_data)')
	
		
	//	case lower("uso107w01_callfunction7")
			string ls_status
			n_cst_uso107_autouo luo_07
			ls_status = luo_07.of_getmystatus()
			ls_result += wf_result_add(ls_item, " uso107w01_callfunction7 ",   luo_07.of_getmystatus()= 'Call UserObject Event n_cst_uso107_autouo.constructor()')
			
	end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module7 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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
ls_array[Upperbound(ls_array) + 1 ] = "AutoInstantiate"	
//ls_array[Upperbound(ls_array) + 1 ] = "uso108w01_autonvoarray1"			// Valid Testing For Fixed-Size Object Array
//ls_array[Upperbound(ls_array) + 1 ] = "uso108w01_autonvoarray2"			//Fixed-Size Object Array Eval
//ls_array[Upperbound(ls_array) + 1 ] = "uso108w01_autonvoarray3"			//Fixed-Size Object Array Reset By Variable-Size Object Array
//ls_array[Upperbound(ls_array) + 1 ] = "uso108w01_autonvoarray4"			// Valid Testing For Variable-Size Object Array
//ls_array[Upperbound(ls_array) + 1 ] = "uso108w01_autonvoarray5"			// Variable-Size Object Array Auto Eval
//ls_array[Upperbound(ls_array) + 1 ] = "uso108w01_autonvoarray6"			//Variable-Size Object Array Reset By Variable-Size Object Array

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
	case lower("AutoInstantiate")	
		n_cst_uso108_autouo luo_a[2]
		ls_result += wf_result_add(ls_item, " uso108w01_autonvoarray1 ",    luo_a[1].is_str = 'Create' and  luo_a[2].is_str = 'Create')
	
//	case lower("uso108w01_autonvoarray2")	
		n_cst_uso108_autouo luo_b[2]
		luo_b[1].is_str = 'Modified 1'
		luo_b[2] = luo_b[1]
		ls_result += wf_result_add(ls_item, " uso108w01_autonvoarray2 ",  luo_b[1].is_str = 'Modified 1' and  luo_b[2].is_str = 'Modified 1')
	
//	case lower("uso108w01_autonvoarray3")
		n_cst_uso108_autouo luo_c[2], luo_d[]
		luo_c[1].is_str = 'Modified 1'
		luo_c[2].is_str = 'Modified 2'
		luo_c = luo_d
		ls_result += wf_result_add(ls_item, " uso108w01_autonvoarray3 ",  luo_c[1].is_str = 'Create' and luo_c[2].is_str = 'Create')
		
//	case lower("uso108w01_autonvoarray4")
		n_cst_uso108_autouo luo_e[]
		ls_result += wf_result_add(ls_item, " uso108w01_autonvoarray4 ",   gs_str = 'Create')
		
//	case lower("uso108w01_autonvoarray5")
		n_cst_uso108_autouo luo_f[]
		luo_f[2].is_str = 'Modified 2'
		ls_result += wf_result_add(ls_item, " uso108w01_autonvoarray5 ", luo_f[1].is_str = 'Create'  and luo_f[2].is_str = 'Modified 2')
		
//	case lower("uso108w01_autonvoarray6")
			n_cst_uso108_autouo luo_g[], luo_h[]
			luo_g[1].is_str = 'Modified 1'
			luo_g[2].is_str = 'Modified 2'
			luo_g = luo_h
			luo_g[2].is_str = 'Modified 2'
			ls_result += wf_result_add(ls_item, " uso108w01_autonvoarray6 ",  luo_g[1].is_str = 'Create' and luo_g[2].is_str = 'Modified 2')

end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module8 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

ls_array[Upperbound(ls_array) + 1 ] = "Non AutoInstantiate"			
//ls_array[Upperbound(ls_array) + 1 ] = "uso109w01_nvoscope1"			//Verdict Global Type Costom Class Valid
//ls_array[Upperbound(ls_array) + 1 ] = "uso109w01_nvoscope2"			//Verdict Womdow Instance Type Costom Class Valid
//ls_array[Upperbound(ls_array) + 1 ] = "uso109w01_nvoscope3"			// Verdict Local Type Costom Class Valid
//ls_array[Upperbound(ls_array) + 1 ] = "uso109w01_nvoscope4"			//Declare Tow Global Costom Class Variable One Time
//ls_array[Upperbound(ls_array) + 1 ] = "uso109w01_nvoscope5"			//Declare Tow Instance Costom Class Variable One Time
//ls_array[Upperbound(ls_array) + 1 ] = "uso109w01_nvoscope6"			//Declare Tow Local Costom Class Variable One Time
//ls_array[Upperbound(ls_array) + 1 ] = "uso109w02_nvodefine1"		//Create Whether Successfully
//ls_array[Upperbound(ls_array) + 1 ] = "uso109w02_nvodefine2"		//Create Whether Trigger Constructor Event
//ls_array[Upperbound(ls_array) + 1 ] = "uso109w02_nvodefine3"		// Create Children Class Whether Successfully
//ls_array[Upperbound(ls_array) + 1 ] = "uso109w02_nvodefine4"		//Create Using Type Whether Successfully
//ls_array[Upperbound(ls_array) + 1 ] = "uso109w02_nvodefine5"		//Create Children Class Using Type Whether Successfully
//ls_array[Upperbound(ls_array) + 1 ] = "uso109w02_nvodefine6"		//Create After Destroy Whether Successfully


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
		case lower("Non AutoInstantiate")	
			String(IsValid(guo_nvo))
			ls_result += wf_result_add(ls_item, " uso109w01_nvoscope1 ",   IsValid(guo_nvo) = false)
			
	//	case lower("uso109w01_nvoscope2")	
			String(IsValid(iuo_nvo))
			ls_result += wf_result_add(ls_item, " uso109w01_nvoscope2 ",   IsValid(iuo_nvo) =false)
		
	//	case lower("uso109w01_nvoscope3")
			n_cst_uso109_l1_nvo luo_nvo1
			String(IsValid(luo_nvo1))
			ls_result += wf_result_add(ls_item, " uso109w01_nvoscope3 ",   IsValid(luo_nvo1) =false)
			
	//	case lower("uso109w01_nvoscope4")
			String(IsValid(guo_nvo1))
			String(IsValid(guo_nvo2))
			ls_result += wf_result_add(ls_item, " uso109w01_nvoscope4 ",   IsValid(guo_nvo1) =false and  IsValid(guo_nvo2) =false)
			
	//	case lower("uso109w01_nvoscope5")
			String(IsValid(iuo_nvo1))
			String(IsValid(iuo_nvo2))
			ls_result += wf_result_add(ls_item, " uso109w01_nvoscope5 ",  IsValid(iuo_nvo1) = false  and  IsValid(iuo_nvo2) =false)
			
	//	case lower("uso109w01_nvoscope6")
			n_cst_uso109_l1_nvo  luo_nvo2
			String(IsValid(luo_nvo1))
			String(IsValid(luo_nvo2))
			ls_result += wf_result_add(ls_item, " uso109w01_nvoscope6 ",  IsValid(luo_nvo1) = false and  IsValid(luo_nvo2) =false)
			
	//	case lower("uso109w02_nvodefine1")
			n_cst_uso109_l1_nvo luo_a
			luo_a = Create n_cst_uso109_l1_nvo
			ls_result += wf_result_add(ls_item, " uso109w02_nvodefine1 ",   luo_a.is_str = 'Create')
		
	//	case lower("uso109w02_nvodefine2")
			ls_result += wf_result_add(ls_item, " uso109w02_nvodefine2 ",  luo_a.ib_constructor = true)
			Destroy luo_a
			
	//	case lower("uso109w02_nvodefine3")
			n_cst_uso109_l1_nvo luo_c
			luo_c = Create n_cst_uso109_l2_nvo
			ls_result += wf_result_add(ls_item, " uso109w02_nvodefine3 ",   luo_c.is_str = 'Create')
			Destroy luo_c
			
	//	case lower("uso109w02_nvodefine4")
			n_cst_uso109_l1_nvo luo_d
			luo_d = Create Using 'n_cst_uso109_l1_nvo'
			ls_result += wf_result_add(ls_item, " uso109w02_nvodefine4 ", luo_d.is_str = 'Create')
			Destroy luo_d
			
	//	case lower("uso109w02_nvodefine5")
			n_cst_uso109_l1_nvo luo_e
			luo_e = Create Using 'n_cst_uso109_l2_nvo'
			ls_result += wf_result_add(ls_item, " uso109w02_nvodefine5 ",  luo_e.is_str = 'Create')
				Destroy luo_e
				
	//	case lower("uso109w02_nvodefine6")
			n_cst_uso109_l1_nvo luo_f
			luo_f = Create n_cst_uso109_l1_nvo
			Destroy luo_f
			luo_f = Create n_cst_uso109_l1_nvo
			ls_result += wf_result_add(ls_item, " uso109w02_nvodefine6 ", luo_f.is_str = 'Create')
			Destroy luo_f
	end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module9 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

ls_array[Upperbound(ls_array) + 1 ] = "Non AutoInstantiate"			
//ls_array[Upperbound(ls_array) + 1 ] = "uso110w01_nvodestroy1"			// Destroy Whether Trigger Destructor Event
//ls_array[Upperbound(ls_array) + 1 ] = "uso110w01_nvodestroy2"			//Destroy ObjectName Syntax

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
		case lower("Non AutoInstantiate")	
			n_cst_uso110_nvo luo_a
			gs_str = 'Not Create'
			luo_a = Create n_cst_uso110_nvo
			Destroy luo_a	
			ls_result += wf_result_add(ls_item, " uso110w01_nvodestroy1 ",    gs_str = 'Call UserObject Event n_cst_uso110_nvo.Destructor()')
			
	//	case lower("uso110w01_nvodestroy2")
			String(IsValid(luo_a))
			ls_result += wf_result_add(ls_item, " uso110w01_nvodestroy2 ",   IsValid(luo_a) = false)
	
	end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module10 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

ls_array[Upperbound(ls_array) + 1 ] = "Non AutoInstantiate"			
//ls_array[Upperbound(ls_array) + 1 ] = "uso111w01_nvoeval1"			//Simple Eval Bettween CustomClass And CustomClass
//ls_array[Upperbound(ls_array) + 1 ] = "uso111w01_nvoeval2"			//Copy Eval Bettween CustomClass And CustomClass
//ls_array[Upperbound(ls_array) + 1 ] = "uso111w01_nvoeval3"			// Eval Bettween Instance And Global CustomClass
//ls_array[Upperbound(ls_array) + 1 ] = "uso111w01_nvoeval4"			//Eval Bettween Instance And Local CustomClass
//ls_array[Upperbound(ls_array) + 1 ] = "uso111w01_nvoeval5"			//Eval Bettween Local And Global CustomClass
//ls_array[Upperbound(ls_array) + 1 ] = "uso111w02_complexeval1"			//Eval Bettween CustomClass And CustomClass Inner Instance Variable
//ls_array[Upperbound(ls_array) + 1 ] = "uso111w02_complexeval2"			// Eval Bettween CustomClass And CustomClass Inner Custom Class
//ls_array[Upperbound(ls_array) + 1 ] = "uso111w02_complexeval3"			// Eval Bettween Instance And Global CustomClass Inner AutoInstantiate Class
//ls_array[Upperbound(ls_array) + 1 ] = "uso111w02_complexeval4"			//Eval Bettween Instance And Local CustomClass Inner Stucture Object
//ls_array[Upperbound(ls_array) + 1 ] = "uso111w02_complexeval5"			//Expression '=' Bettween CustomClass And CustomClass
//ls_array[Upperbound(ls_array) + 1 ] = "uso111w02_complexeval6"			// Expression '=' After Eval Bettween CustomClass And CustomClass

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
		case lower("Non AutoInstantiate")	
			n_cst_USO111_nvo luo_a, luo_b
			luo_a = Create n_cst_USO111_nvo
			luo_b = Create n_cst_USO111_nvo
			luo_b = luo_a			
			luo_a.is_str = 'Modified a'
			ls_result += wf_result_add(ls_item, " uso111w01_nvoeval1 ",   luo_b.is_str = 'Modified a')
			Destroy luo_a
			Destroy luo_b
			
	//	case lower("uso111w01_nvoeval2")	
			n_cst_USO111_nvo luo_c, luo_d
			luo_c = Create n_cst_USO111_nvo
			luo_d = Create n_cst_USO111_nvo
			luo_c.is_str = 'Modified c'
			luo_d = luo_c
			luo_d.is_str = 'Modified d' 
			ls_result += wf_result_add(ls_item, " uso111w01_nvoeval2 ",    luo_c.is_str = 'Modified d' and  luo_d.is_str = 'Modified d')
			Destroy luo_c
			Destroy luo_d
		
	//	case lower("uso111w01_nvoeval3")
			iuo11_nvo = Create n_cst_uso111_nvo
			guo11_nvo = iuo11_nvo			
			iuo11_nvo.is_str = 'Modified Instance'
			ls_result += wf_result_add(ls_item, " uso111w01_nvoeval3 ",   guo11_nvo.is_str = 'Modified Instance')
			
	//	case lower("uso111w01_nvoeval4")
			n_cst_USO111_nvo luo_e
			luo_e = Create n_cst_USO111_nvo
			iuo11_nvo = luo_e			
			luo_e.is_str = 'Modified e'
			ls_result += wf_result_add(ls_item, " uso111w01_nvoeval4 ",    iuo11_nvo.is_str = 'Modified e')
			Destroy luo_e
			
	//	case lower("uso111w01_nvoeval5")
			n_cst_USO111_nvo luo_f
			luo_f = Create n_cst_USO111_nvo
			luo_f = guo11_nvo			
			guo11_nvo.is_str = 'Modified Global'
			ls_result += wf_result_add(ls_item, " uso111w01_nvoeval5 ",  luo_f.is_str = 'Modified Global')
			destroy luo_f
			
	//	case lower("uso111w02_complexeval1")
			n_cst_USO111_nvo luo_a1, luo_b1
			luo_a1 = Create n_cst_USO111_nvo
			luo_b1 = Create n_cst_USO111_nvo
			luo_a1.is_str = luo_b1.is_str
			luo_b1.is_str = 'Modified b'
			ls_result += wf_result_add(ls_item, " uso111w02_complexeval1 ", luo_a1.is_str = 'Create')
			Destroy luo_a1
			Destroy luo_b1
				
	//	case lower("uso111w02_complexeval2")
			n_cst_USO111_nvo luo_c1, luo_d1
			luo_c1 = Create n_cst_USO111_nvo
			luo_d1 = Create n_cst_USO111_nvo
			n_cst_USO111_customclass luo_customclass
			luo_customclass = Create n_cst_USO111_customclass
			luo_customclass.is_str = 'Modified Customclass'
			luo_c1.iuo_customclass = luo_customclass
			luo_d1.iuo_customclass = luo_c1.iuo_customclass
			luo_c1.iuo_customclass.is_str = 'Modified c'
			ls_result += wf_result_add(ls_item, " uso111w02_complexeval2 ",   luo_c1.iuo_customclass.is_str = 'Modified c' and  luo_d1.iuo_customclass.is_str = 'Modified c')
			Destroy luo_c1
			Destroy luo_d1
			Destroy luo_customclass
		
	//	case lower("uso111w02_complexeval3")
			n_cst_USO111_nvo luo_e1, luo_f1
			luo_e1 = Create n_cst_USO111_nvo
			luo_f1 = Create n_cst_USO111_nvo
			n_cst_USO111_customautoclass luo_customautoclass
			luo_customautoclass.is_str = 'Modified Customautoclass'
			luo_e1.iuo_customautoclass = luo_customautoclass
			luo_f1.iuo_customautoclass = luo_e1.iuo_customautoclass
			luo_e1.iuo_customautoclass.is_str = 'Modified e'
			ls_result += wf_result_add(ls_item, " uso111w02_complexeval3 ",   luo_e1.iuo_customautoclass.is_str = 'Modified e' and  luo_f1.iuo_customautoclass.is_str = 'Modified Customautoclass')
			Destroy luo_e1
			Destroy luo_f1
			
	//	case lower("uso111w02_complexeval4")
			n_cst_USO111_nvo luo_g, luo_h
			luo_g = Create n_cst_USO111_nvo
			luo_h = Create n_cst_USO111_nvo
			luo_g.istr_string.ss_str = 'Modified g'
			luo_h.istr_string = luo_g.istr_string
			luo_h.istr_string.ss_str = 'Modified h'
			ls_result += wf_result_add(ls_item, " uso111w02_complexeval4 ",     luo_g.istr_string.ss_str = 'Modified g' and  luo_h.istr_string.ss_str = 'Modified h')
			Destroy luo_g
			Destroy luo_h	
			
	//	case lower("uso111w02_complexeval5")
			n_cst_USO111_nvo luo_i, luo_j
			luo_i = Create n_cst_USO111_nvo
			luo_j = Create n_cst_USO111_nvo
			luo_i.is_str = 'Modified'
			luo_j.is_str = 'Modified'
			ls_result += wf_result_add(ls_item, " uso111w02_complexeval5 ", luo_i.is_str = 'Modified' and  luo_j.is_str =' Modified')
			Destroy luo_i
			Destroy luo_j
				
	//	case lower("uso109w02_nvodefine6")
			n_cst_USO111_nvo luo_k, luo_l
			luo_k = Create n_cst_USO111_nvo
			luo_l = Create n_cst_USO111_nvo
			luo_k.is_str = 'Modified'
			luo_l = luo_k
			ls_result += wf_result_add(ls_item, " uso109w02_nvodefine6 ", luo_k.is_str = 'Modified' and  luo_l.is_str = 'Modified')
			Destroy luo_k
			Destroy luo_l
	
	end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine of_testcase_point_module11 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

ls_array[Upperbound(ls_array) + 1 ] = "Non AutoInstantiate"			
//ls_array[Upperbound(ls_array) + 1 ] = "uso112w01_nvoarray1"			//Define CustomClass Array
//ls_array[Upperbound(ls_array) + 1 ] = "uso112w01_nvoarray2"			//Use CustomClass Array


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
		case lower("Non AutoInstantiate")	
			n_cst_uso112_nvo luo_a[2]
			ls_result += wf_result_add(ls_item, " uso112w01_nvoarray1 ",   IsValid(luo_a[1]) = false)
			
	//	case lower("uso112w01_nvoarray2")
			n_cst_uso112_nvo luo_b[2]
			luo_b[1] = Create n_cst_uso112_nvo
			luo_b[2] = Create n_cst_uso112_nvo
			ls_result += wf_result_add(ls_item, " uso112w01_nvoarray2 ",    luo_b[1].is_str = 'Create' and  luo_b[2].is_str = 'Create')
			Destroy luo_b[1]
			Destroy luo_b[2]
			
	end choose 
next 

is_resultlog += ls_result
end subroutine

on w_user_object.create
int iCurrent
call super::create
if this.MenuName = "m_uso103_autouvo" then this.MenuID = create m_uso103_autouvo
this.st_5=create st_5
this.uo_customvisual103=create uo_customvisual103
this.st_4=create st_4
this.st_3=create st_3
this.uo_composite=create uo_composite
this.cb_standardvisual=create cb_standardvisual
this.st_2=create st_2
this.st_1=create st_1
this.uo_customvisual=create uo_customvisual
this.cb_1=create cb_1
this.cb_standardvisual103=create cb_standardvisual103
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_5
this.Control[iCurrent+2]=this.uo_customvisual103
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.uo_composite
this.Control[iCurrent+6]=this.cb_standardvisual
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.uo_customvisual
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_standardvisual103
end on

on w_user_object.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_5)
destroy(this.uo_customvisual103)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.uo_composite)
destroy(this.cb_standardvisual)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.uo_customvisual)
destroy(this.cb_1)
destroy(this.cb_standardvisual103)
end on

event open;call super::open;n_cst_uso102_autouo luo_autouo
luo_autouo.is_str = 'Create'
gs_str = luo_autouo.is_str
end event

type st_5 from statictext within w_user_object
integer x = 608
integer y = 2124
integer width = 681
integer height = 72
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "uo_customvisual103:"
boolean focusrectangle = false
end type

type uo_customvisual103 from u_cst_uso103_customvisual within w_user_object
event destroy ( )
integer x = 1362
integer y = 2132
integer taborder = 60
end type

on uo_customvisual103.destroy
call u_cst_uso103_customvisual::destroy
end on

type st_4 from statictext within w_user_object
integer x = 608
integer y = 1932
integer width = 731
integer height = 72
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "cb_standardvisual103:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_user_object
integer x = 599
integer y = 1276
integer width = 494
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "uo_composite:"
boolean focusrectangle = false
end type

type uo_composite from n_cst_uso101_composite within w_user_object
integer x = 1230
integer y = 968
integer taborder = 40
end type

on uo_composite.destroy
call n_cst_uso101_composite::destroy
end on

type cb_standardvisual from u_cst_uso101_standardvisual within w_user_object
integer x = 1202
integer y = 740
integer width = 795
integer taborder = 30
string text = "Standard Visual Object"
end type

type st_2 from statictext within w_user_object
integer x = 530
integer y = 772
integer width = 617
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "cb_standardvisual:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_user_object
integer x = 526
integer y = 564
integer width = 581
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "uo_customvisual:"
boolean focusrectangle = false
end type

type uo_customvisual from u_cst_uso101_customvisual within w_user_object
integer x = 1152
integer y = 536
integer taborder = 20
end type

on uo_customvisual.destroy
call u_cst_uso101_customvisual::destroy
end on

type cb_1 from commandbutton within w_user_object
integer x = 475
integer y = 112
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

type cb_standardvisual103 from u_cst_uso103_standardvisual within w_user_object
integer x = 1362
integer y = 1924
integer width = 919
integer taborder = 50
boolean bringtotop = true
string text = "Standard Visual Object103"
end type

