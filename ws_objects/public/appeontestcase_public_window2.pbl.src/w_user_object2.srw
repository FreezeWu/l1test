$PBExportHeader$w_user_object2.srw
forward
global type w_user_object2 from w_base_case
end type
type mle_output from multilineedit within w_user_object2
end type
type tab_4 from tab within w_user_object2
end type
type tabpage_8 from userobject within tab_4
end type
type tabpage_8 from userobject within tab_4
end type
type tab_4 from tab within w_user_object2
tabpage_8 tabpage_8
end type
type tab_3 from tab within w_user_object2
end type
type tabpage_5 from userobject within tab_3
end type
type tabpage_5 from userobject within tab_3
end type
type tabpage_6 from userobject within tab_3
end type
type tabpage_6 from userobject within tab_3
end type
type tabpage_7 from userobject within tab_3
end type
type tabpage_7 from userobject within tab_3
end type
type tab_3 from tab within w_user_object2
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type
type tab_2 from tab within w_user_object2
end type
type tabpage_4 from userobject within tab_2
end type
type tabpage_4 from userobject within tab_2
end type
type tab_2 from tab within w_user_object2
tabpage_4 tabpage_4
end type
type uo_1 from u_cst_tabpage within w_user_object2
end type
type cb_1 from commandbutton within w_user_object2
end type
type tab_1 from tab within w_user_object2
end type
type tabpage_2 from userobject within tab_1
end type
type tabpage_2 from userobject within tab_1
end type
type tabpage_3 from userobject within tab_1
end type
type tabpage_3 from userobject within tab_1
end type
type tabpage_1 from u_cst_l1 within tab_1
end type
type tabpage_1 from u_cst_l1 within tab_1
end type
type tab_1 from tab within w_user_object2
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_1 tabpage_1
end type
end forward

global type w_user_object2 from w_base_case
integer width = 3840
integer height = 3112
string title = "OpenUserObject function syntax1"
mle_output mle_output
tab_4 tab_4
tab_3 tab_3
tab_2 tab_2
uo_1 uo_1
cb_1 cb_1
tab_1 tab_1
end type
global w_user_object2 w_user_object2

type variables
u_cst_tab001_tabpage iuo_tabpage
Integer ii_index = 0


end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine wf_output (string as_mess, boolean ab_clear)
public subroutine of_testcase_point_module3 ()
public subroutine wf_describe ()
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

ls_array[Upperbound(ls_array) + 1 ] = "Dynamic Create_TabPage"			
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w01_userobjectvar1"			//UserObjectVar Is CVO Root Object Of Not Instance
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w01_userobjectvar2"			//UserObjectVar Is Global CVO Type Of Not Instance
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w01_userobjectvar3"			// UserObjectVar Is Instance CVO Type Of Not Instance
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w01_userobjectvar4"			// UserObjectVar Is Local CVO Type Of Not Instance 
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w01_userobjectvar5"			//UserObjectVar Is UserObject Type
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w01_userobjectvar6"			// UserObjectVar Is CVO Object and Added from PB Paint
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w01_userobjectvar7"			// UserObjectVar Is 1-dimensional Array Element Of CVO Type
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w01_userobjectvar8"			// UserObjectVar Is 2-dimensional Array Element Of CVO Type
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w01_userobjectvar9"			//UserObjectVar Is Null UserObject Type   
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w02_index1"			//Index Equal 0 
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w02_index2"			//Index Large than Max Tabpage 
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w02_index3"			// Index Between 0 And max Tabpage
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w02_index4"			// Index Equal Negative 
//ls_array[Upperbound(ls_array) + 1 ] = "taba01w02_index5"			//Index Is Null



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
		case lower("Dynamic Create_TabPage")	
				Integer li_Rtn1
				li_Rtn1 = tab_1.Opentab(u_cst_tab001_tabpage, 0)
				IsNull(li_Rtn1)
				ls_result += wf_result_add(ls_item, " taba01w01_userobjectvar1 ",    tab_1.Opentab(u_cst_tab001_tabpage, 0) = 1 and  IsValid(u_cst_tab001_tabpage) = true )
				
			
	//	case lower("taba01w01_userobjectvar2")	
				Integer li_Rtn3
				li_Rtn3 = tab_1.Opentab(guo_tabpage, 0)
				IsNull(li_Rtn3)
				ls_result += wf_result_add(ls_item, " taba01w01_userobjectvar2 ",  tab_1.Opentab(guo_tabpage, 0) = 1 and IsValid(guo_tabpage) = true)
	
	//	case lower("taba01w01_userobjectvar3")
				Integer li_Rtn5
				li_Rtn5 = tab_1.Opentab(iuo_tabpage, 0)
				IsNull(li_Rtn5)
				ls_result += wf_result_add(ls_item, " taba01w01_userobjectvar3 ",   tab_1.Opentab(iuo_tabpage, 0) = 1 and  IsValid(iuo_tabpage) = true)
			
	//	case lower("taba01w01_userobjectvar4")
				Integer li_Rtn7
				u_cst_tab001_tabpage luo_tabpage
				li_Rtn7 = tab_1.Opentab(luo_tabpage, 0)
				IsNull(li_Rtn7)
			ls_result += wf_result_add(ls_item, " taba01w01_userobjectvar4 ",    tab_1.Opentab(luo_tabpage, 0) = 1 and  IsValid(luo_tabpage) = true)
			
	//	case lower("taba01w01_userobjectvar5")
				Integer li_Rtn9
				UserObject luo_1
				li_Rtn9 = tab_1.Opentab(luo_1, 0)
				IsNull(li_Rtn9)
			ls_result += wf_result_add(ls_item, " taba01w01_userobjectvar5 ",  tab_1.Opentab(luo_1, 0) = 1 and  IsValid(luo_1) = true)
		
	//	case lower("taba01w01_userobjectvar6")
				Integer li_Rtn10
				li_Rtn10 = Tab_1.Opentab(tab_1.tabpage_2, 0)
				IsNull(li_Rtn10)
				ls_result += wf_result_add(ls_item, " taba01w01_userobjectvar6 ",   Tab_1.Opentab(tab_1.tabpage_2, 0) = 1 and  IsValid(tab_1.tabpage_2) = true)
		
	//	case lower("taba01w01_userobjectvar7")
				Integer li_Rtn11
				u_cst_tab001_tabpage luo_arr1[1]
				li_Rtn11 = tab_1.OpenTab(luo_arr1[1], 0)
				IsNull(li_Rtn11)
			ls_result += wf_result_add(ls_item, " taba01w01_userobjectvar7 ",  tab_1.OpenTab(luo_arr1[1], 0) = 1 and  IsValid(luo_arr1[1]) = true)
			
	//	case lower("taba01w01_userobjectvar8")
				Integer li_Rtn12
				u_cst_tab001_tabpage luo_arr2[2,2]
				li_Rtn12 = tab_1.OpenTab(luo_arr2[2,1], 0)
				IsNull(li_Rtn12)
			ls_result += wf_result_add(ls_item, " taba01w01_userobjectvar8 ",    tab_1.OpenTab(luo_arr2[2,1], 0) = 1 and IsValid(luo_arr2[2,1]) = true)
			
	//	case lower("taba01w01_userobjectvar9")
				Integer li_Rtn13
				UserObject luo_2
				SetNull(luo_2)
				li_Rtn13 = tab_1.Opentab(luo_2, 0)
				IsNull(li_Rtn13)
				ls_result += wf_result_add(ls_item, " taba01w01_userobjectvar9 ",  IsNull( tab_1.Opentab(luo_2, 0)) and IsNull(IsValid(luo_2) ))
	
	//	case lower("taba01w02_index1")
				Integer li_Rnt14
				li_Rnt14 = tab_1.Opentab(u_cst_tab001_tabpage, 0)
				IsNull(li_Rnt14)
				ls_result += wf_result_add(ls_item, " taba01w02_index1 ",    tab_1.Opentab(u_cst_tab001_tabpage, 0) = 1)
			
	//	case lower("taba01w02_index2")
				Integer li_Rnt15
				li_Rnt15 = tab_1.Opentab(u_cst_tab001_tabpage, UpperBound(Tab_1.Control) + 1)
				IsNull(li_Rnt15)
				ls_result += wf_result_add(ls_item, " taba01w02_index2 ", tab_1.Opentab(u_cst_tab001_tabpage, UpperBound(Tab_1.Control) + 1) = 1)
		
	//	case lower("taba01w02_index3")
				Integer li_Rnt16, li_Max, li_Index
				li_Max = UpperBound(Tab_1.Control)
				If li_Max > 2 Then 
					li_Index = li_Max - 1
				ElseIf li_Max <= 2  Then 
					li_Index = li_Max
				End If
				li_Rnt16 = tab_1.Opentab(u_cst_tab001_tabpage, li_Index)
				IsNull(li_Rnt16)
				ls_result += wf_result_add(ls_item, " taba01w02_index3 ", tab_1.Opentab(u_cst_tab001_tabpage, li_Index) = 1  )
		
	//	case lower("taba01w02_index4")
				Integer li_Rnt17
				li_Rnt17 = tab_1.Opentab(u_cst_tab001_tabpage, -1)
				IsNull(li_Rnt17)
			ls_result += wf_result_add(ls_item, " taba01w02_index4 ", tab_1.Opentab(u_cst_tab001_tabpage, -1) = 1 )
			
	//	case lower("taba01w02_index5")
				integer li_Null, li_Rnt18
				SetNull(li_Null)
				li_Rnt18 = tab_1.Opentab(u_cst_tab001_tabpage, li_Null)
				IsNull(li_Rnt18)
				ls_result += wf_result_add(ls_item, " taba01w02_index5 ",   IsNull(tab_1.Opentab(u_cst_tab001_tabpage, li_Null) ))
			
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

ls_array[Upperbound(ls_array) + 1 ] = "Dynamic Create_TabPage"			
//ls_array[Upperbound(ls_array) + 1 ] = "taba02w01_userobjecttype1"			//UserObjectVar and UserObjectType Type Matching
//ls_array[Upperbound(ls_array) + 1 ] = "taba02w01_userobjecttype2"			//UserObjectVar Is UserObject Type and UserObjectType Is CVO Type
//ls_array[Upperbound(ls_array) + 1 ] = "taba02w01_userobjecttype3"			// UserObjectVar Is CVO Type and UserObjectType Inherit From UserObjectVar Object
//ls_array[Upperbound(ls_array) + 1 ] = "taba02w01_userobjecttype4"			// UserObjectVar Is CVO Object and Add by PB Paint and UserObjectType Inherit From UserObjectVar Object
//ls_array[Upperbound(ls_array) + 1 ] = "taba02w01_userobjecttype5"			//UserObjectVar Is UserObject Type and UserObjectType Is UserObject Of Existed In Window
//ls_array[Upperbound(ls_array) + 1 ] = "taba02w01_userobjecttype6"			// UserObjectType Is Null




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
		case lower("Dynamic Create_TabPage")	
				u_cst_l1 luo_L0
				Integer li_Rnt1
				li_Rnt1 = tab_1.OpenTab(luo_L0, "u_cst_l1", 0)
				IsNull(li_Rnt1)
				ls_result += wf_result_add(ls_item, " taba02w01_userobjecttype1 ",    tab_1.OpenTab(luo_L0, "u_cst_l1", 0) = 1 )
				
			
	//	case lower("taba02w01_userobjecttype2")	
				UserObject luo_1
				Integer li_Rnt2
				li_Rnt2 = tab_1.OpenTab(luo_1, "u_cst_l1", 0)
				IsNull(li_Rnt2)
				ls_result += wf_result_add(ls_item, " taba02w01_userobjecttype2 ",   tab_1.OpenTab(luo_1, "u_cst_l1", 0) = 1)
	
	//	case lower("taba02w01_userobjecttype3")
				u_cst_l1 luo_L1
				Integer li_Rnt3
				li_Rnt3 = tab_1.OpenTab(luo_L1, "u_cst_l3", 0)
				IsNull(li_Rnt3)
				ls_result += wf_result_add(ls_item, " taba02w01_userobjecttype3 ",   tab_1.OpenTab(luo_L1, "u_cst_l3", 0) = 1)
			
	//	case lower("taba02w01_userobjecttype4")
				Integer	li_Rnt4
				li_Rnt4 = Tab_1.OpenTab(tab_1.tabpage_1, "u_cst_L3", 0)
				IsNull(li_Rnt4)
			ls_result += wf_result_add(ls_item, " taba02w01_userobjecttype4 ",   Tab_1.OpenTab(tab_1.tabpage_1, "u_cst_L3", 0) = 1)
			
	//	case lower("taba02w01_userobjecttype5")
				UserObject luo_2
				Integer li_Rnt5
				li_Rnt5 = Tab_1.OpenTab(luo_2, "uo_1", 0)
				IsNull(li_Rnt5)
			ls_result += wf_result_add(ls_item, " taba02w01_userobjecttype5 ",  Tab_1.OpenTab(luo_2, "uo_1", 0) = 1)
		
	//	case lower("taba02w01_userobjecttype6")
				Integer li_Rnt6
				String ls_null2
				u_cst_l1 luo_7
				SetNull(ls_null2)
				tab_1.OpenTab(luo_7, ls_null2,  0)
				li_Rnt6 = tab_1.OpenTab(luo_7, ls_null2, 0)
				IsNull(li_Rnt6)
				ls_result += wf_result_add(ls_item, " taba02w01_userobjecttype6 ",   IsNull(tab_1.OpenTab(luo_7, ls_null2, 0) ))
		
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

ls_array[Upperbound(ls_array) + 1 ] = "Dynamic Create_TabPage"			
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w01_uoiniprop"				//CVO Object Property to change or become different
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop1"				//UserObject text is null
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop2"				// UserObject text is null and set text
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop3"				// UserObject text is not null and ShowText is true
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop4"				//UserObject text is not null and ShowText is false
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop5"				// UserObject PictureName is null
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop6"				// UserObject TabTextColor is red
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop7"				// UserObject TabBackColor is green
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop8"				// UserObject BackColor is blue
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop9"				//UserObject Visible is false
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop10"				// UserObject Enabled is false
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop_sp1"			//UserObject PictureName is not null
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop_sp2"			// UserObject BorderStyle is StyleBox! and Border is True
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop_sp3"			// UserObject BorderStyle is StyleLowered! and Border is True
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop_sp4"			//UserObject BorderStyle is StyleRaised! and Border is True
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w02_uoiniprop_sp5"			// UserObject BorderStyle is HourGlass! and Border is True
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w03_tabprop1"					// CreateOnDemand is false and index equal 1
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w03_tabprop2"					//CreateOnDemand is false and index equal 0
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w03_tabprop3"					// CreateOnDemand is false and index between 1 and max tabpage
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w03_tabprop4"					//Open multi-tabpage
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w03_tabprop5"					// Current tabpage is first and index = 1
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w03_tabprop6"					// Current tabpage is first and UserObject enabled is false and index = 1
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w03_tabprop7"					//Current tabpage is end and index equal 0
//ls_array[Upperbound(ls_array) + 1 ] = "taba03w03_tabprop8"					// Current tabpage is second and index equal 2

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
		case lower("Dynamic Create_TabPage")	
				u_cst_taba03_tabpage luo03_1
				Tab_2.OpenTab(luo03_1, 0)
				ls_result += wf_result_add(ls_item, " taba03w01_uoiniprop ",    luo03_1.BackColor = 67108864 and luo03_1.Border = false )
				
	
	//	case lower("taba03w02_uoiniprop1")	
				u_cst_TextNull luo_1
				Integer li_Rtn1
				li_Rtn1 = Tab_4.OpenTab(luo_1, 0)
				IsNull(li_Rtn1)
				ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop1 ",   Tab_4.OpenTab(luo_1, 0) = 1)
	
	//	case lower("taba03w02_uoiniprop2")
				Integer li_Rtn2
				u_cst_TextNull luo_2
				li_Rtn2 = Tab_4.OpenTab(luo_2, 0)
				IsNull(li_Rtn2)
				ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop2 ",    Tab_4.OpenTab(luo_2, 0) = 1)
			
	//	case lower("taba03w02_uoiniprop3")
				Integer li_Rtn3
				u_cst_Text luo_3
				Tab_4.ShowText = true
				li_Rtn3 = Tab_4.OpenTab(luo_3, 0)
				IsNull(li_Rtn3)
			ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop3 ",   Tab_4.OpenTab(luo_3, 0) = 1)
			
	//	case lower("taba03w02_uoiniprop4")
				Integer li_Rtn4
				u_cst_Text luo_4
				Tab_4.ShowText = False
				li_Rtn4 =Tab_4.OpenTab(luo_4, 0)
				IsNull(li_Rtn4)
			ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop4 ",  Tab_4.OpenTab(luo_4, 0) = 1)
		
	//	case lower("taba03w02_uoiniprop5")
				Integer li_Rtn5
				u_cst_Normal luo_8
				li_Rtn5 = Tab_4.Opentab(luo_8, 0)
				IsNull(li_Rtn5)
			ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop5 ",    Tab_4.OpenTab(luo_8, 0) = 1)
			
	//	case lower("taba03w02_uoiniprop6")
				Integer li_Rtn6
				u_cst_tabtextcolor luo_14
				li_Rtn6 = Tab_4.Opentab(luo_14, 0)
				IsNull(li_Rtn6)
			ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop6 ",   Tab_4.OpenTab(luo_14, 0) = 1)
		
	//	case lower("taba03w02_uoiniprop7")
				Integer li_Rtn7
				u_cst_TabBackColor luo_15
				li_Rtn7 = Tab_4.Opentab(luo_15, 0)
				IsNull(li_Rtn7)
				ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop7 ",   Tab_4.OpenTab(luo_15, 0) = 1)
	
	//	case lower("taba03w02_uoiniprop8")
				Integer li_Rtn8
				u_cst_BackColor luo_16
				li_Rtn8 = Tab_4.Opentab(luo_16, 0)
				IsNull(li_Rtn8)
			ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop11 ",   Tab_4.OpenTab(luo_16, 0) = 1)
			
	//	case lower("taba03w02_uoiniprop9")
				Integer li_Rtn9
				u_cst_Visible luo_17
				li_Rtn8 = Tab_4.Opentab(luo_17, 0)
				IsNull(li_Rtn9)
			ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop9 ",   Tab_4.OpenTab(luo_17, 0) = 1)
		
	//	case lower("taba03w02_uoiniprop10")
				Integer li_Rtn10
				u_cst_Enabled luo_18
				li_Rtn10 = Tab_4.Opentab(luo_18, 0)
				IsNull(li_Rtn10)
				ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop10 ",   Tab_4.OpenTab(luo_18, 0) = 1)
	
	//	case lower("taba03w02_uoiniprop_sp1")	
				Integer li_Rtn11
				u_cst_pic luo_9
				li_Rtn11 = Tab_4.Opentab(luo_9, 0)
				IsNull(li_Rtn11)
				ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop_sp1 ",   Tab_4.OpenTab(luo_9, 0) = 1)
	
	//	case lower("taba03w02_uoiniprop_sp2")
				Integer li_Rtn12
				u_cst_stylebox luo_10
				li_Rtn12 = Tab_4.Opentab(luo_10, 0)
				IsNull(li_Rtn12)
				ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop_sp2 ",   Tab_4.OpenTab(luo_10, 0) = 1)
			
	//	case lower("taba03w02_uoiniprop_sp3")
				Integer li_Rtn13
				u_cst_stylelowered luo_11
				li_Rtn13 = Tab_4.Opentab(luo_11, 0)
				IsNull(li_Rtn13)
			ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop_sp3 ",    Tab_4.OpenTab(luo_11, 0) = 1)
			
	//	case lower("taba03w02_uoiniprop_sp4")
				Integer li_Rtn14
				u_cst_StyleRaised luo_12
				li_Rtn14 = Tab_4.Opentab(luo_12, 0)
				IsNull(li_Rtn14)
			ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop_sp4 ",  Tab_4.OpenTab(luo_12, 0) = 1)
		
	//	case lower("taba03w02_uoiniprop_sp5")
				Integer li_Rtn15
				u_cst_pointer luo_13
				li_Rtn15 = Tab_4.Opentab(luo_13, 0)
				IsNull(li_Rtn15)
				ls_result += wf_result_add(ls_item, " taba03w02_uoiniprop_sp5 ",   Tab_4.OpenTab(luo_13, 0) = 1)
	
	//	case lower("taba03w03_tabprop1")	
				u_cst_taba03_tabpage luo1_1
				Integer li_Rtn16
				li_Rtn16 = Tab_3.OpenTab(luo1_1, 1)
				IsNull(li_Rtn16)
				ls_result += wf_result_add(ls_item, " taba03w03_tabprop1 ",   Tab_3.OpenTab(luo1_1, 1) = 1)
	
	//	case lower("taba03w03_tabprop2")
				u_cst_taba03_tabpage luo1_2
				Integer j, li_Rtn17
				li_Rtn17 = Tab_3.OpenTab(luo1_2, 0)
				IsNull(li_Rtn17)
				ls_result += wf_result_add(ls_item, " taba03w03_tabprop2 ",   Tab_3.OpenTab(luo1_2, 1) = 1)
			
	//	case lower("taba03w03_tabprop3")
				u_cst_taba03_tabpage luo1_3
				Integer k, li_Index, li_Max, li_Rtn18
				li_Max = UpperBound(Tab_4.Control[])
				If li_Max > 2 Then 
					li_Index = li_Max -1
				Else
					li_Index = li_Max
				End If 
				li_Rtn18 = Tab_3.Opentab(luo1_3, li_Index)
				IsNull(li_Rtn18)
			ls_result += wf_result_add(ls_item, " taba03w03_tabprop3 ",   Tab_3.Opentab(luo1_3, li_Index) = 1)
			
	//	case lower("taba03w03_tabprop4")
				u_cst_taba03_tabpage luo1_4
				Integer l, li_Rtn4_1, li_Rtn4_2, li_Rtn4_19
				li_Rtn4_19 = Tab_3.Opentab(luo1_4, 0)
				IsNull(li_Rtn4_19)
				ls_result += wf_result_add(ls_item, " taba03w03_tabprop4_1 ",  Tab_3.Opentab(luo1_4, li_Index) = 1)
			
	
	//	case lower("taba03w03_tabprop5")	
				Integer li_Rtn21
				u_cst_taba03_tabpage luo1_6
				Tab_3.SelectTab(1)
				li_Rtn21 = Tab_3.OpenTab(luo1_6, 1)
				IsNull(li_Rtn21)
				ls_result += wf_result_add(ls_item, " taba03w03_tabprop6 ",   Tab_3.Opentab(luo1_6, li_Index) = 1)
	
	//	case lower("taba03w03_tabprop6")
				Integer li_Rtn22
				u_cst_enabled luo1_7
				Tab_3.SelectTab(1)
				li_Rtn22 = Tab_3.OpenTab(luo1_7, 1)
				IsNull(li_Rtn22)
				ls_result += wf_result_add(ls_item, " taba03w03_tabprop6 ",   Tab_3.Opentab(luo1_7, li_Index) = 1)
			
	//	case lower("taba03w03_tabprop7")
				Integer li_Rtn23
				u_cst_taba03_tabpage luo1_8
				Tab_3.SelectTab(UpperBound(Tab_4.Control[]))
				li_Rtn23 = Tab_3.OpenTab(luo1_8, 0)
				IsNull(li_Rtn23)
				ls_result += wf_result_add(ls_item, " taba03w03_tabprop7 ",  Tab_3.Opentab(luo1_8, li_Index) = 1 )
			
			//	case lower("taba03w03_tabprop8")
				Integer li_Rtn20
				u_cst_taba03_tabpage luo1_9
				Tab_3.SelectTab(2)
				li_Rtn20 = Tab_3.OpenTab(luo_9, 2)
				IsNull(li_Rtn20)
				ls_result += wf_result_add(ls_item, " taba03w03_tabprop8 ",   Tab_3.Opentab(luo1_9, li_Index) = 1 )
			
	end choose 
next 

is_resultlog += ls_result
end subroutine

public subroutine wf_output (string as_mess, boolean ab_clear);If ab_clear Then
mle_output.Text = ""
ii_index = 0
End IF	

ii_index = ii_index + 1
mle_output.Text += String(ii_index,'00')+". "+as_mess+"~r~n"
end subroutine

public subroutine of_testcase_point_module3 ();//string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
//long			ll_bound, i , ll_tmp, ll_null, ll_position
//string 		ls_file, ls_fullname
//integer 		li_rtn, li_col
//boolean		lbn_flag 
//Date			ld_date
//Datetime		ldt_datatime
//time			lt_time
//Decimal		ldc_data
//
//is_log = ''
//ls_result = ''
//ll_bound =0 
//setnull(ll_null)
//SetNull(ls_null)
//
//ls_array[Upperbound(ls_array) + 1 ] = "Dynamic Create_UserObject"			
//ll_bound  = Upperbound(ls_array)
//for i = 1 to ll_bound
//Yield ( )
//ls_item = ls_array[i]
//of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")	
//is_log = ''
//ls_temp = ''
//li_rtn = 0 
//ls_temp2 = ''
//ll_tmp = 0
//lbn_flag = false
//choose case lower(ls_item)
//	case lower("Dynamic Create_UserObject")	
//			Integer li_Rtn1
//			li_Rtn1 = w_user_object2.OpenUserObject(u_checkbox, 50, 50)
//			IsNull(li_Rtn1)
//			ls_result += wf_result_add(ls_item, " case1 ",   w_user_object2.OpenUserObject(u_checkbox, 50, 50) = 1 )
//			
//			Integer li_Rtn2
//			li_Rtn2 = w_user_object2.OpenUserObject(u_commandbutton, 50, 150)
//			IsNull(li_Rtn2)
//			ls_result += wf_result_add(ls_item, " case2 ",   w_user_object2.OpenUserObject(u_commandbutton, 50, 150) = 1 )
//			
//			Integer li_Rtn3
//			li_Rtn3 = w_user_object2.OpenUserObject(u_datawindow, 50, 300)
//			IsNull(li_Rtn3)
//			ls_result += wf_result_add(ls_item, " case3 ",  w_user_object2.OpenUserObject(u_datawindow, 50, 300) = 1 )
//			
//			Integer li_Rtn4
//			li_Rtn4 = w_user_object2.OpenUserObject(u_dropdownlistbox, 50, 450)
//			IsNull(li_Rtn4)
//			ls_result += wf_result_add(ls_item, " case4 ",    w_user_object2.OpenUserObject(u_dropdownlistbox, 50, 450) = 1 )
//			
//			Integer li_Rtn5
//			li_Rtn5 = w_user_object2.OpenUserObject(u_dropdownpicturelistbox, 50, 550)
//			IsNull(li_Rtn5)
//			ls_result += wf_result_add(ls_item, " case5 ",   w_user_object2.OpenUserObject(u_dropdownpicturelistbox, 50, 550) = 1)
//			
//			Integer li_Rtn6
//			li_Rtn6 = w_user_object2.OpenUserObject(u_editmask, 550, 50)
//			IsNull(li_Rtn6)
//			ls_result += wf_result_add(ls_item, " case6 ",    w_user_object2.OpenUserObject(u_editmask, 550, 50) = 1)
//			
//			Integer li_Rtn7
//			li_Rtn7 = w_user_object2.OpenUserObject(u_groupbox, 550, 150)
//			IsNull(li_Rtn7)
//			ls_result += wf_result_add(ls_item, " case7 ",   w_user_object2.OpenUserObject(u_groupbox, 550, 150) = 1 )
//			
//			Integer li_Rtn8
//			li_Rtn8 = w_user_object2.OpenUserObject(u_listbox, 550, 300)
//			IsNull(li_Rtn8)
//			ls_result += wf_result_add(ls_item, " case8 ",   w_user_object2.OpenUserObject(u_listbox, 550, 300) = 1 )
//			
//			Integer li_Rtn9
//			li_Rtn9 = w_user_object2.OpenUserObject(u_listview, 550, 420)
//			IsNull(li_Rtn9)
//			ls_result += wf_result_add(ls_item, " case9 ",   w_user_object2.OpenUserObject(u_listview, 550, 420) = 1 )
//			
//			Integer li_Rtn10
//			li_Rtn10 = w_user_object2.OpenUserObject(u_multilineedit, 550, 550)
//			IsNull(li_Rtn10)
//			ls_result += wf_result_add(ls_item, " case10 ",    w_user_object2.OpenUserObject(u_multilineedit, 550, 550) = 1 )
//			
//			Integer li_Rtn11
//			li_Rtn11 = w_user_object2.OpenUserObject(u_picture, 950, 50)
//			IsNull(li_Rtn11)
//			ls_result += wf_result_add(ls_item, " case11 ",    w_user_object2.OpenUserObject(u_picture, 950, 50) = 1 )
//			
//			Integer li_Rtn12
//			li_Rtn12 = w_user_object2.OpenUserObject(u_picturebutton, 950, 200)
//			IsNull(li_Rtn12)
//			ls_result += wf_result_add(ls_item, " case12 ",   w_user_object2.OpenUserObject(u_picturebutton, 950, 200) = 1 )
//			
//			Integer li_Rtn13
//			li_Rtn13 = w_user_object2.OpenUserObject(u_picturehyperlink, 1200, 50)
//			IsNull(li_Rtn13)
//			ls_result += wf_result_add(ls_item, " case13 ",    w_user_object2.OpenUserObject(u_picturehyperlink, 1200, 50) = 1 )
//			
//			Integer li_Rtn14
//			li_Rtn14 = w_user_object2.OpenUserObject(u_picturelistbox, 950, 330)
//			IsNull(li_Rtn14)
//			ls_result += wf_result_add(ls_item, " case14",    w_user_object2.OpenUserObject(u_picturelistbox, 950, 330) = 1 )
//			
//			Integer li_Rtn15
//			li_Rtn15 = w_user_object2.OpenUserObject(u_radiobutton, 950, 450)
//			IsNull(li_Rtn15)
//			ls_result += wf_result_add(ls_item, " case15 ",    w_user_object2.OpenUserObject(u_radiobutton, 950, 450) = 1 )
//			
//			Integer li_Rtn16
//			li_Rtn16 = w_user_object2.OpenUserObject(u_singlelineedit, 950, 550)
//			IsNull(li_Rtn16)
//			ls_result += wf_result_add(ls_item, " case16 ",   w_user_object2.OpenUserObject(u_singlelineedit, 950, 550) = 1 )
//			
//			Integer li_Rtn17
//			li_Rtn17 = w_user_object2.OpenUserObject(u_statichyperlink, 1400, 50)
//			IsNull(li_Rtn17)
//			ls_result += wf_result_add(ls_item, " case17 ",   w_user_object2.OpenUserObject(u_statichyperlink, 1400, 50) = 1 )
//			
//			Integer li_Rtn18
//			li_Rtn18 = w_user_object2.OpenUserObject(u_statictext, 1400, 130)
//			IsNull(li_Rtn18)
//			ls_result += wf_result_add(ls_item, " case18 ",   w_user_object2.OpenUserObject(u_statictext, 1400, 130) = 1 )
//			
//			Integer li_Rtn19
//			li_Rtn19 = w_user_object2.OpenUserObject(u_tab, 1400, 200)
//			IsNull(li_Rtn19)
//			ls_result += wf_result_add(ls_item, " case19 ",   w_user_object2.OpenUserObject(u_tab, 1400, 200) = 1 )
//			
//			Integer li_Rtn20
//			li_Rtn20 = w_user_object2.OpenUserObject(u_treeview, 1400, 360)
//			IsNull(li_Rtn20)
//			ls_result += wf_result_add(ls_item, " case20 ",    w_user_object2.OpenUserObject(u_treeview, 1400, 360) = 1 )
//			
//			Integer li_Rtn21
//			li_Rtn21 = w_user_object2.OpenUserObject(u_cst_l1, 1400, 550)
//			IsNull(li_Rtn21)
//			ls_result += wf_result_add(ls_item, " case21 ",   w_user_object2.OpenUserObject(u_cst_l1, 1400, 550) = 1)
//			u_cst_l1.Width = 350
//			u_cst_l1.Height = 100
//
//
//end choose 
//next 
//
//is_resultlog += ls_result
//
//
end subroutine

public subroutine wf_describe ();
end subroutine

on w_user_object2.create
int iCurrent
call super::create
this.mle_output=create mle_output
this.tab_4=create tab_4
this.tab_3=create tab_3
this.tab_2=create tab_2
this.uo_1=create uo_1
this.cb_1=create cb_1
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_output
this.Control[iCurrent+2]=this.tab_4
this.Control[iCurrent+3]=this.tab_3
this.Control[iCurrent+4]=this.tab_2
this.Control[iCurrent+5]=this.uo_1
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.tab_1
end on

on w_user_object2.destroy
call super::destroy
destroy(this.mle_output)
destroy(this.tab_4)
destroy(this.tab_3)
destroy(this.tab_2)
destroy(this.uo_1)
destroy(this.cb_1)
destroy(this.tab_1)
end on

type mle_output from multilineedit within w_user_object2
integer x = 357
integer y = 2012
integer width = 1632
integer height = 476
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type tab_4 from tab within w_user_object2
integer x = 384
integer y = 1504
integer width = 576
integer height = 408
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_8 tabpage_8
end type

on tab_4.create
this.tabpage_8=create tabpage_8
this.Control[]={this.tabpage_8}
end on

on tab_4.destroy
destroy(this.tabpage_8)
end on

type tabpage_8 from userobject within tab_4
integer x = 18
integer y = 124
integer width = 539
integer height = 268
long backcolor = 67108864
string text = "page1"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type tab_3 from tab within w_user_object2
integer x = 1454
integer y = 1024
integer width = 1426
integer height = 664
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type

on tab_3.create
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.tabpage_7=create tabpage_7
this.Control[]={this.tabpage_5,&
this.tabpage_6,&
this.tabpage_7}
end on

on tab_3.destroy
destroy(this.tabpage_5)
destroy(this.tabpage_6)
destroy(this.tabpage_7)
end on

type tabpage_5 from userobject within tab_3
integer x = 18
integer y = 124
integer width = 1390
integer height = 524
long backcolor = 67108864
string text = "page1"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type tabpage_6 from userobject within tab_3
integer x = 18
integer y = 124
integer width = 1390
integer height = 524
long backcolor = 67108864
string text = "page2"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type tabpage_7 from userobject within tab_3
integer x = 18
integer y = 124
integer width = 1390
integer height = 524
long backcolor = 67108864
string text = "page3"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type tab_2 from tab within w_user_object2
integer x = 402
integer y = 1024
integer width = 613
integer height = 356
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_4 tabpage_4
end type

on tab_2.create
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_4}
end on

on tab_2.destroy
destroy(this.tabpage_4)
end on

type tabpage_4 from userobject within tab_2
integer x = 18
integer y = 124
integer width = 576
integer height = 216
long backcolor = 67108864
string text = "tabpage_1"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type uo_1 from u_cst_tabpage within w_user_object2
integer x = 1792
integer y = 300
integer taborder = 20
end type

on uo_1.destroy
call u_cst_tabpage::destroy
end on

type cb_1 from commandbutton within w_user_object2
integer x = 1838
integer y = 772
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

type tab_1 from tab within w_user_object2
integer x = 311
integer y = 160
integer width = 1317
integer height = 732
integer taborder = 10
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_2,&
this.tabpage_3,&
this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_1)
end on

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 124
integer width = 1280
integer height = 592
long backcolor = 67108864
string text = "page2"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 124
integer width = 1280
integer height = 592
long backcolor = 67108864
string text = "page3"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

type tabpage_1 from u_cst_l1 within tab_1
integer x = 18
integer y = 124
integer width = 1280
integer height = 592
string text = "page1"
end type

