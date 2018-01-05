$PBExportHeader$w_dynamic_userobject.srw
forward
global type w_dynamic_userobject from w_base_case
end type
type cb_3 from commandbutton within w_dynamic_userobject
end type
type cb_2 from commandbutton within w_dynamic_userobject
end type
type uo_room from uo_parent within w_dynamic_userobject
end type
type cb_1 from commandbutton within w_dynamic_userobject
end type
end forward

global type w_dynamic_userobject from w_base_case
integer width = 2994
integer height = 1920
cb_3 cb_3
cb_2 cb_2
uo_room uo_room
cb_1 cb_1
end type
global w_dynamic_userobject w_dynamic_userobject

type variables

end variables

forward prototypes
public subroutine wf_output (string as_string, boolean ab_clear)
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
end prototypes

public subroutine wf_output (string as_string, boolean ab_clear);
if not ab_clear then
	is_log +=" "+is_testcasename+" "+" log userobject clear="+string(ab_clear)+" "+as_string+"~r~n"			//+=
else
	is_log +=" "+is_testcasename+" "+" log userobject clear="+string(ab_clear)+" "+as_string+"~r~n"
end if
end subroutine

public subroutine of_testcase_point_module ();string	 	ls_array[], ls_item, ls_result, ls_temp 
long		ll_bound, i , ll_tmp, ll_tmp2, ll_return
uo_cb 	lcb_1
uo_cb 	luo_cus1, luo_cus2
uo_dp 	ldp_1[]
dragobject ldo
groupbox lgb
tab ltb
windowobject 	ltmp

ls_array[Upperbound(ls_array) + 1 ] = "dynamic_commandbutton"
ls_array[Upperbound(ls_array) + 1 ] = "dynamic_datepicker"		
ls_array[Upperbound(ls_array) + 1 ] = "dynamic_dragobject"			
ls_array[Upperbound(ls_array) + 1 ] = "dynamic_groupbox"		
ls_array[Upperbound(ls_array) + 1 ] = "dynamic_tab"		
ls_array[Upperbound(ls_array) + 1 ] = "closeuserobject"		
ls_array[Upperbound(ls_array) + 1 ] = ""				

ls_result = ''
ll_bound =0 
randomize(0)			//	rand

ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")
	ls_temp = ''
	is_log = ''
	ll_tmp = 0	
	ll_tmp2 = 0
	choose case lower(ls_item)
		case lower('dynamic_commandbutton')
			ll_tmp = uo_room.openuserobject(uo_cb,0,0)
			uo_cb.bringtotop = true
			uo_cb.tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " original openuserobject(uo_cb,0,0) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " original openuserobject(uo_cb,0,0) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ll_tmp = 0 
			is_log = ''
			ll_tmp = uo_room.openuserobject(uo_cb,1200,0)
			uo_cb.bringtotop = true
			uo_cb.tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = -1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " original openuserobject(uo_cb,1200,0) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " original openuserobject(uo_cb,1200,0) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ll_tmp = 0 
			is_log = ''
			ll_tmp = uo_room.openuserobject(lcb_1)
			lcb_1.bringtotop = true
			lcb_1.tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lcb_1) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lcb_1) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ll_tmp = 0
			is_log = ''
			ll_tmp = uo_room.openuserobject(luo_cus1,300,5)
			luo_cus1.bringtotop = true
			luo_cus1.tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(luo_cus1) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(luo_cus1) = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
//			ll_tmp = 0
//			is_log = ''
//			ll_tmp = uo_room.openuserobject(luo_cus1,'uo_cus1_inh',400,5)			
//			luo_cus1.bringtotop = true
//			luo_cus1.tag = 'newuo'
//			ls_result += is_log
//			if not isnull(ll_tmp) and ll_tmp = 1 then 
//				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(luo_cus1 2) = "+String ( "Success!" ) +"~r~n"
//			else
//				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(luo_cus1 2 ) = "+String ( "Fail!" ) +"~r~n"
//			end if 				
		case lower('dynamic_datepicker')
			ll_tmp = 0 
			is_log = ''
			ll_tmp = uo_room.openuserobject(ldp_1[1],rand(800),rand(800))			
			ldp_1[1].bringtotop = true
			ldp_1[1].tag = 'newuo'
			ls_result += is_log			
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldp_1[1]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldp_1[1]) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ll_tmp = 0 
			is_log = ''
			ll_tmp = uo_room.openuserobject(ldp_1[2],rand(800),200)			
			ldp_1[2].bringtotop = true
			ldp_1[2].tag = 'newuo'
			ls_result += is_log			
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldp_1[2]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldp_1[2]) = "+String ( "Fail!" ) +"~r~n"
			end if 				
		case lower('dynamic_dragobject')
			ll_tmp = uo_room.openuserobject(ldo,'uo_em',900,5)
			ldo.bringtotop = true
			ldo.tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldo) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldo) = "+String ( "Fail!" ) +"~r~n"
			end if 				
		case lower('dynamic_groupbox')
			ll_tmp = uo_room.openuserobject(lgb,'uo_gb',850,0)
			lgb.tag = 'newuo'	
			lgb.bringtotop = true
 			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lgb) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lgb) = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower('dynamic_tab')
			ll_tmp = uo_room.openuserobject(ltb,'uo_tab',900,5)		 
			ltb.bringtotop = true
			ltb.tag = 'newuo'	
 			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ltb) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ltb) = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower('closeuserobject')
			ll_tmp = upperbound(uo_room.control)
			for ll_tmp2 = ll_tmp to 1 step -1
				if ieon_resize.of_gettag( uo_room.control[ll_tmp2]) = 'newuo' then
					ltmp = uo_room.control[ll_tmp2]
					ls_temp = ltmp.classname( )
					ll_return = closeuserobject(uo_room.control[ll_tmp2])
					if not isnull(ll_return) and ll_return = 1 then 
						ls_result += " "+is_testcasename+" "+ls_item +  "close("+ls_temp+") = "+string(ll_Return)+" isvalid("+ls_temp+") = "+string(isvalid(ltmp))+ " userobject = "+String ( "Success!" ) +"~r~n"
					else
						ls_result += " "+is_testcasename+" "+ls_item + "close("+ls_temp+") = "+string(ll_Return)+" isvalid("+ls_temp+") = "+string(isvalid(ltmp)) + " userobject = "+String ( "Fail!" ) +"~r~n"
					end if
				end if
			next
	end choose 
next 

//gf_returnresult(ls_result)
is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module1 ();string	 	ls_array[], ls_item, ls_result, ls_temp 
long		ll_bound, i , ll_tmp, ll_tmp2, j , ll_return
uo_cb 	lcb_1
uo_cb 	luo_cus1, luo_cus2
uo_cus_2 luo_2
uo_dp 	ldp_1[]
dragobject ldo
groupbox lgb
tab ltb
windowobject 			ltmp
datastore				lds, lds_emp
stru_dept 				lstr_1
uo_dw_longparm 		luo_dw
datepicker 				ldp
picturehyperlink 		lphp
graph 	 				lgh_1

ls_array[Upperbound(ls_array) + 1 ] = "dynamic_inherited_userobject"
ls_array[Upperbound(ls_array) + 1 ] = "inherited_closeuserobject"				

ls_result = ''
ll_bound =0 

lds = create datastore
lds.dataobject = 'dddw_department'
lds.settransobject( sqlca)
lds.retrieve( )
for j = 1 to lds.rowcount( )
	lstr_1.l_dept[j] = lds.getitemnumber( j,'dept_id')
next

lds_emp = create datastore
lds_emp.dataobject = 'd_employer'
lds_emp.settransobject(sqlca)
lds_emp.retrieve()

lstr_1.d_ds = lds_emp
lstr_1.s_tile = 'Filter employer by dept_id'

ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")
	ls_temp = ''
	is_log = ''
	ll_tmp = 0	
	ll_tmp2 = 0
	choose case lower(ls_item)		
		case lower('dynamic_inherited_userobject')
			ll_tmp = uo_room.openuserobjectwithparm(uo_cbx_parm,255,900,5)
			uo_cbx_parm.bringtotop = true
			uo_cbx_parm.tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(uo_cbx_parm) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(uo_cbx_parm) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ll_tmp = 0	
			is_log = ''
			ll_tmp = uo_room.openuserobjectwithparm(luo_dw,200,1200,5)
			luo_dw.bringtotop = true
			luo_dw.tag = 'newuo'
 			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(luo_dw) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(luo_dw) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ll_tmp = 0	
			is_log = ''
			ll_tmp = uo_room.openuserobjectwithparm(luo_2,lstr_1,300,5)
			luo_2.bringtotop = true
			luo_2.tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(luo_2 lstr_1) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(luo_2 lstr_1) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ll_tmp = 0	
			is_log = ''
			ll_tmp = uo_room.openuserobjectwithparm(ldp,'2015-03-05','uo_dp_stringparm',900,5)
			ldp.bringtotop = true
			ldp.tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldp) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldp) = "+String ( "Fail!" ) +"~r~n"
			end if 
							
			ll_tmp = 0	
			is_log = ''
			ll_tmp = uo_room.openuserobjectwithparm(lphp,"http://192.0.3.99/AEM",'uo_phl_stringparm')
			lphp.bringtotop = true
			lphp.tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lphp) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lphp) = "+String ( "Fail!" ) +"~r~n"
			end if 		
			
			ll_tmp = 0	
			is_log = ''
			ll_tmp = uo_room.openuserobjectwithparm(lgh_1,lds_emp,'uo_graph_ds',500,5)
			lgh_1.bringtotop = true
			lgh_1.tag = 'newuo'
		 	ls_result += is_log
		 	if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lgh_1) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lgh_1) = "+String ( "Fail!" ) +"~r~n"
			end if 		
		case lower('inherited_closeuserobject')
			ll_tmp = upperbound(uo_room.control)
			for ll_tmp2 = ll_tmp to 1 step -1
				if ieon_resize.of_gettag( uo_room.control[ll_tmp2]) = 'newuo' then
					ltmp = uo_room.control[ll_tmp2]
					ls_temp = ltmp.classname( )
					ll_return = closeuserobject(uo_room.control[ll_tmp2])
					if not isnull(ll_return) and ll_return = 1 then 
						ls_result += " "+is_testcasename+" "+ls_item +  " inherited close("+ls_temp+") = "+string(ll_Return)+" isvalid("+ls_temp+") = "+string(isvalid(ltmp))+ " userobject = "+String ( "Success!" ) +"~r~n"
					else
						ls_result += " "+is_testcasename+" "+ls_item + " inherited close("+ls_temp+") = "+string(ll_Return)+" isvalid("+ls_temp+") = "+string(isvalid(ltmp)) + " userobject = "+String ( "Fail!" ) +"~r~n"
					end if
				end if
			next
	end choose 
next 

//gf_returnresult(ls_result)
is_resultlog += ls_result

destroy lds
destroy lds_emp

end subroutine

public subroutine of_testcase_point_module2 ();string	 	ls_array[], ls_item, ls_result, ls_temp 
long		ll_bound, i , ll_tmp, ll_tmp2, j , k  
uo_cb 	lcb_1[]
uo_cb 	luo_cus1, luo_cus2
uo_cus_2 luo_2
uo_dp 	ldp_1[]
dragobject ldo[]
groupbox lgb
tab ltb
treeview 					ltr
windowobject 			ltmp
datastore				lds_emp
stru_dept 				lstr_1
uo_dw_longparm 		luo_dw
datepicker 				ldp
picturehyperlink 		lphp
graph 					lgh[],lgh1[]
uo_phl_stringparm 	lph_1[]
uo_graph_stru	 		lgh_str[]
long						ll_start, ll_end



ls_array[Upperbound(ls_array) + 1 ] = "dynamic_array_userobject"
ls_array[Upperbound(ls_array) + 1 ] = "dynamic_tree_ds"	
ls_array[Upperbound(ls_array) + 1 ] = "dynamic_performance"		


ls_result = ''
ll_bound =0 

lds_emp = create datastore
lds_emp.dataobject = 'd_employer'
lds_emp.settransobject(sqlca)
lds_emp.retrieve()

lstr_1.d_ds = lds_emp

ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")	
	ls_temp = ''
	is_log = ''
	ll_tmp = 0	
	ll_tmp2 = 0
	choose case lower(ls_item)		
		case lower('dynamic_array_userobject')
			ll_tmp = uo_room.openuserobject(lcb_1[1],600,0)
			lcb_1[1].bringtotop = true
			lcb_1[1].tag = 'newuo'
			lcb_1[1].text = 'cb_1'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lcb_1[1]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lcb_1[1]) = "+String ( "Fail!" ) +"~r~n"
			end if 

			ll_tmp = 0	
			is_log = ''
			ll_tmp = uo_room.openuserobject(lcb_1[2],600,150)
			lcb_1[2].bringtotop = true
			lcb_1[2].tag = 'newuo'
			lcb_1[2].text = 'cb_2'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lcb_1[2]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lcb_1[2]) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ll_tmp = 0	
			is_log = ''
			ll_tmp = uo_room.openuserobject(lcb_1[3],600,300)
			lcb_1[3].bringtotop = true
			lcb_1[3].tag = 'newuo'
			lcb_1[3].text = 'cb_3'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lcb_1[3]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lcb_1[3]) = "+String ( "Fail!" ) +"~r~n"
			end if 

			ll_tmp = 0	
			is_log = ''
			ll_tmp = uo_room.openuserobject(ldo[1],'uo_shy',1200,0)
			ldo[1].bringtotop = true
			ldo[1].tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldo[1]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldo[1]) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ll_tmp = 0	
			is_log = ''
			ll_tmp = uo_room.openuserobject(ldo[2],'uo_dp',1200,150)
			ldo[2].bringtotop = true
			ldo[2].tag = 'newuo'
			ldo[2].width = 550
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldo[2]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldo[2]) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ll_tmp = 0	
			is_log = ''
			ll_tmp = uo_room.openuserobject(ldo[3],'uo_em',1200,300)
			ldo[3].bringtotop = true
			ldo[3].tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldo[3]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldo[3]) = "+String ( "Fail!" ) +"~r~n"
			end if 
									
			ll_tmp = 0	
			is_log = ''			
			ll_tmp = uo_room.openuserobjectwithparm(lph_1[1],"http://192.0.1.71/AEM",1800,0)
			lph_1[1].bringtotop = true
			lph_1[1].tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lph_1[1]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lph_1[1]) = "+String ( "Fail!" ) +"~r~n"
			end if 
												
			ll_tmp = 0	
			is_log = ''	
			ll_tmp = uo_room.openuserobjectwithparm(lph_1[2],"http://192.0.1.72/AEM",1800,150)
			lph_1[2].bringtotop = true
			lph_1[2].tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lph_1[2]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lph_1[2]) = "+String ( "Fail!" ) +"~r~n"
			end if 

			ll_tmp = 0	
			is_log = ''	
			ll_tmp = uo_room.openuserobjectwithparm(lph_1[3],"http://192.0.1.71/AEM",1800,300)
			lph_1[3].bringtotop = true
			lph_1[3].tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lph_1[3]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lph_1[3]) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ll_tmp = 0	
			is_log = ''	
			ll_tmp = uo_room.openuserobject(ldo[4],'uo_mc',2500,0)
			ldo[4].bringtotop = true
			ldo[4].tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldo[4]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ldo[4]) = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			ll_tmp = 0	
			is_log = ''	
			ll_tmp = uo_room.openuserobjectwithparm(lgh[1],lds_emp,'uo_graph_ds',600,5)
			lgh[1].bringtotop = true
			lgh[1].tag = 'newuo'
			ls_result += is_log
			if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lgh[1]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(lgh[1]) = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
		case lower('dynamic_tree_ds')	
			if isvalid(uo_tree_ds) then
				closeuserobject(uo_tree_ds)
			end if
			ll_tmp = uo_room.openuserobjectwithparm(ltr,lds_emp,'uo_tree_ds',600,0)
			ltr.bringtotop = true
			ltr.tag = 'newuo'
			 if not isnull(ll_tmp) and ll_tmp = 1 then 
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ltr) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " openuserobject(ltr) = "+String ( "Fail!" ) +"~r~n"
			end if 
		case lower('dynamic_performance')		
			ll_start = cpu() 
			if isvalid(uo_tree_ds) then
				closeuserobject(uo_tree_ds)
			end if
			for ll_tmp2 = 1 to long(20)										//LOOP times
				lstr_1.s_tile = " Get "+string(ll_tmp2)+" Graph(s) "
				yield()															// Yield	

				k = (ll_tmp2 - 1) / 5											// value y 
				k = mod(k,3)													// Only 3 Rows
				j = mod(ll_tmp2,5)
				if j = 0 then j = 5
				uo_room.openuserobjectwithparm(lgh_str[ll_tmp2],lstr_1,'uo_graph_stru', (j - 1)*1000, k*800)
				lgh_str[ll_tmp2].bringtotop = true
				lgh_str[ll_tmp2].tag = 'newuo'
//				ls_result += is_log												//no need it 
			next
			ll_end = cpu()	
//			messagebox("耗时","耗时 : "+string(ll_end - ll_start)+" MS")
			 if ll_end - ll_start < 400 then 
				ls_result += " "+is_testcasename+" "+ls_item + " performance time  = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " performance time  = "+String ( "Fail!" ) +"~r~n"
			end if 
			
	end choose 
next 

//gf_returnresult(ls_result)
is_resultlog += ls_result
 
destroy lds_emp

end subroutine

on w_dynamic_userobject.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.uo_room=create uo_room
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.uo_room
this.Control[iCurrent+4]=this.cb_1
end on

on w_dynamic_userobject.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.uo_room)
destroy(this.cb_1)
end on

type cb_3 from commandbutton within w_dynamic_userobject
integer x = 23
integer y = 420
integer width = 544
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Execute other"
end type

event clicked;of_testcase_point_module2()
end event

type cb_2 from commandbutton within w_dynamic_userobject
integer x = 23
integer y = 268
integer width = 544
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Execute open2"
end type

event clicked;of_testcase_point_module1()
end event

type uo_room from uo_parent within w_dynamic_userobject
integer x = 581
integer y = 12
integer taborder = 20
long backcolor = 134217731
end type

on uo_room.destroy
call uo_parent::destroy
end on

type cb_1 from commandbutton within w_dynamic_userobject
integer x = 14
integer y = 108
integer width = 544
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Execute open"
end type

event clicked;of_testcase_point_module()
end event

