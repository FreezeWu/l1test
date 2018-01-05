$PBExportHeader$w_sap_psr.srw
forward
global type w_sap_psr from w_base_case
end type
type dw_2 from datawindow within w_sap_psr
end type
type dw_1 from datawindow within w_sap_psr
end type
type cb_1 from commandbutton within w_sap_psr
end type
end forward

global type w_sap_psr from w_base_case
dw_2 dw_2
dw_1 dw_1
cb_1 cb_1
end type
global w_sap_psr w_sap_psr

forward prototypes
public subroutine of_testcase_point_module ()
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
string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null,ls_tmp,ls_tmp3,ls_fullname2
long			ll_bound, i , ll_tmp, ll_null, ll_position,ll_rowcount
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

ls_array[Upperbound(ls_array) + 1 ] = "sap_psr"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = ""

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
		case lower("sap_psr")	
			ls_file = "d_label.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr1= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr1 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0'  and ll_rowcount =75 and ls_temp2 = '102' then 
						ls_result += " Window.sap_psr "+ls_item + " 1 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 1 = "+String ( "Fail!" ) +"~r~n"
			 end if 	
			 
			ls_file = "d_crosstab.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr2= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr2 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0'  and ll_rowcount =5 and ls_temp2 = '100' then 
						ls_result += " Window.sap_psr "+ls_item + " 2 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 2 = "+String ( "Fail!" ) +"~r~n"
			 end if 	
			 
			ls_file = "d_complicate2.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr3= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr3 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =75 and ls_temp2 = '102' then 
						ls_result += " Window.sap_psr "+ls_item + " 3 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 3 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_freeform.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr4= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr4 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =75 and ls_temp2 = '102' then 
						ls_result += " Window.sap_psr "+ls_item + " 4 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 4 = "+String ( "Fail!" ) +"~r~n"
			 end if 	
			 
			ls_file = "tabular_dept.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr5= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr5 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =5 and ls_temp2 = '100' then 
						ls_result += " Window.sap_psr "+ls_item + " 5 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 5 = "+String ( "Fail!" ) +"~r~n"
			 end if 	
			 
		     ls_file = "d_graph.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr6= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr6 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =75 and ls_temp2 = '102' then 
						ls_result += " Window.sap_psr "+ls_item + " 6 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 6 = "+String ( "Fail!" ) +"~r~n"
			 end if 	
			 
			ls_file = "d_grid.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr7= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr7 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =75 and ls_temp2 = '102' then 
						ls_result += " Window.sap_psr "+ls_item + " 7 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 7 = "+String ( "Fail!" ) +"~r~n"
			 end if 	
			 
			ls_file = "d_grid_graph.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr8= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr8 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =75 and ls_temp2 = '102' then 
						ls_result += " Window.sap_psr "+ls_item + " 8 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 8 = "+String ( "Fail!" ) +"~r~n"
			 end if 	
			 
			ls_file = "d_grid_ole.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					 
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr9= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr9 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =75 and ls_temp2 = '102' then 
						ls_result += " Window.sap_psr "+ls_item + " 9 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 9 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_group.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr10= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr10 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =75 and ls_temp2 = '109' then 
						ls_result += " Window.sap_psr "+ls_item + " 10 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 10 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_group_sc.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr11= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr11 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =75 and ls_temp2 = '300' then 
						ls_result += " Window.sap_psr "+ls_item + " 11 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 11 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_label_sc.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr12= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr12 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =3 and ls_temp2 = '123' then 
						ls_result += " Window.sap_psr "+ls_item + " 12= "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 12 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_nup.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr13= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr13 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =5 and ls_temp2 = '100' then 
						ls_result += " Window.sap_psr "+ls_item + " 13 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 13 = "+String ( "Fail!" ) +"~r~n"
			 end if
			 
			ls_file = "d_oledb.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr14= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr14 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =6 and ls_temp2 ='Ala' then 
						ls_result += " Window.sap_psr "+ls_item + " 14 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 14 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_rte_sc.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr15= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr15 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =5 and ls_temp2 ='100' then 
						ls_result += " Window.sap_psr "+ls_item + " 15 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 15 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_tabular.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr16= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr16 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =75 and ls_temp2 ='102' then 
						ls_result += " Window.sap_psr "+ls_item + "16 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 16 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "richtextdw.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr17= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr17 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =77 and ls_temp2 ='102' then 
						ls_result += " Window.sap_psr "+ls_item + " 17 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 17 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_all_type_utf8.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr18= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr18 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =1 and ls_temp2 ='ABC' then 
						ls_result += " Window.sap_psr "+ls_item + " 18 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 18 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_composite_utf8.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr19= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr19 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if  ll_rowcount =1  then 
						ls_result += " Window.sap_psr "+ls_item + " 19 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 19 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_crosstab_ansi.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr20= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr20 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =64  and ls_temp2 ='100' then 
						ls_result += " Window.sap_psr "+ls_item + " 20= "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 20 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_free_utf88.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr21= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr21 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =77 and ls_temp2 ='102' then 
						ls_result += " Window.sap_psr "+ls_item + " 21 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 21 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_graph_ansi.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr22= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr22 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =77 and ls_temp2 ='102' then 
						ls_result += " Window.sap_psr "+ls_item + " 22 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 22 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_grid_ansi.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr23= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr23 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =77 and ls_temp2 ='102' then 
						ls_result += " Window.sap_psr "+ls_item + " 23 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 23 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_label_ansi.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr24= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr24 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =77 and ls_temp2 ='102' then 
						ls_result += " Window.sap_psr "+ls_item + " 24 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 24 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_tabular_ansi.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr25= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr25 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =77 and ls_temp2 ='102' then 
						ls_result += " Window.sap_psr "+ls_item + " 25 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 25 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_treeview_utf16le.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr26= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr26 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =77 and ls_temp2 ='992' then 
						ls_result += " Window.sap_psr "+ls_item + " 26 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 26 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			ls_file = "grid_ole_ink.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr27= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr27 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =3 and ls_temp2 ='Ala' then 
						ls_result += " Window.sap_psr "+ls_item + " 27 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 27 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "treeview_multilevels.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr28= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr28 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =75 and ls_temp2 ='Shi' then 
						ls_result += " Window.sap_psr "+ls_item + " 28 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 28 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "d_group_ink.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr29= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr29 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =6 and ls_temp2 ='Ala' then 
						ls_result += " Window.sap_psr "+ls_item + " 29 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 29 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			ls_file = "grid_resize.psr"
			ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result += " window.sap_psr "+ls_item + " sap_psr30= "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result += " window.sap_psr "+ls_item + " sap_psr30 = "+String ( "Fail!" ) +"~r~n"
				end if 
			 end if 
			 
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 ll_rowcount = dw_1.rowcount()
			 ls_temp2 = mid(ls_tmp,1,3)
		 	 if ls_tmp > '0' and ll_rowcount =1 and ls_temp2 ='101' then 
						ls_result += " Window.sap_psr "+ls_item + " 30 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr "+ls_item + " 30 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
	
			 ls_file = "grid_resize.psr"
			 ls_fullname = gs_cachedir+gs_dirseparator+ls_file
			 if not FileExists(ls_fullname)  then 
			 messagebox('提示',ls_fullname+'文件不存在')
			 end if 
			
			 dw_1.dataobject = ls_fullname
			 ls_tmp = dw_1.object.datawindow.data
			 dw_1.saveas("grid_resize1.psr",PSReport!,false)
			 
			 ls_fullname2='grid_resize1.psr'
			 if not FileExists(ls_fullname2)  then 
				messagebox('提示',ls_fullname2+'文件不存在')
			end if
			 dw_2.dataobject = ls_fullname2
			 ls_tmp3 = dw_2.object.datawindow.data
		 	 if ls_tmp = ls_tmp3 then 
						ls_result += " Window.sap_psr_saveas "+ls_item + " 31 = "+String ( "Success!" ) +"~r~n"
			else
						ls_result += " Window.sap_psr_saveas "+ls_item + " 31 = "+String ( "Fail!" ) +"~r~n"
			 end if 
			 
			 
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_sap_psr.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_1
end on

on w_sap_psr.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_1)
end on

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator

if FileExists(ls_filepath+"d_label.psr") then
	FileDelete(ls_filepath+"d_label.psr")
end if

if FileExists(ls_filepath+"d_crosstab.psr") then
	FileDelete(ls_filepath+"d_crosstab.psr")
end if
if FileExists(ls_filepath+"d_complicate2.psr") then
	FileDelete(ls_filepath+"d_complicate2.psr")
end if
if FileExists(ls_filepath+"d_freeform.psr") then
	FileDelete(ls_filepath+"d_freeform.psr")
end if
if FileExists(ls_filepath+"tabular_dept.psr") then
	FileDelete(ls_filepath+"tabular_dept.psr")
end if
if FileExists(ls_filepath+"d_graph.psr") then
	FileDelete(ls_filepath+"d_graph.psr")
end if
if FileExists(ls_filepath+"d_grid.psr") then
	FileDelete(ls_filepath+"d_grid.psr")
end if
if FileExists(ls_filepath+"d_grid_graph.psr") then
	FileDelete(ls_filepath+"d_grid_graph.psr")
end if
if FileExists(ls_filepath+"d_grid_ole.psr") then
	FileDelete(ls_filepath+"d_grid_ole.psr")
end if
if FileExists(ls_filepath+"d_group.psr") then
	FileDelete(ls_filepath+"d_group.psr")
end if
if FileExists(ls_filepath+"d_group_sc.psr") then
	FileDelete(ls_filepath+"d_group_sc.psr")
end if
if FileExists(ls_filepath+"d_label_sc.psr") then
	FileDelete(ls_filepath+"d_label_sc.psr")
end if
if FileExists(ls_filepath+"d_nup.psr") then
	FileDelete(ls_filepath+"d_nup.psr")
end if
if FileExists(ls_filepath+"d_oledb.psr") then
	FileDelete(ls_filepath+"d_oledb.psr")
end if
if FileExists(ls_filepath+"d_rte_sc.psr") then
	FileDelete(ls_filepath+"d_rte_sc.psr")
end if
if FileExists(ls_filepath+"d_tabular.psr") then
	FileDelete(ls_filepath+"d_tabular.psr")
end if
if FileExists(ls_filepath+"richtextdw.psr") then
	FileDelete(ls_filepath+"richtextdw.psr")
end if
if FileExists(ls_filepath+"d_all_type_utf8.psr") then
	FileDelete(ls_filepath+"d_all_type_utf8.psr")
end if
if FileExists(ls_filepath+"d_composite_utf8.psr") then
	FileDelete(ls_filepath+"d_composite_utf8.psr")
end if
if FileExists(ls_filepath+"d_crosstab_ansi.psr") then
	FileDelete(ls_filepath+"d_crosstab_ansi.psr")
end if
if FileExists(ls_filepath+"d_free_utf88.psr") then
	FileDelete(ls_filepath+"d_free_utf88.psr")
end if
if FileExists(ls_filepath+"d_graph_ansi.psr") then
	FileDelete(ls_filepath+"d_graph_ansi.psr")
end if
if FileExists(ls_filepath+"d_grid_ansi.psr") then
	FileDelete(ls_filepath+"d_grid_ansi.psr")
end if
if FileExists(ls_filepath+"d_label_ansi.psr") then
	FileDelete(ls_filepath+"d_label_ansi.psr")
end if
if FileExists(ls_filepath+"d_tabular_ansi.psr") then
	FileDelete(ls_filepath+"d_tabular_ansi.psr")
end if
if FileExists(ls_filepath+"d_treeview_utf16le.psr") then
	FileDelete(ls_filepath+"d_treeview_utf16le.psr")
end if
if FileExists(ls_filepath+"grid_ole_ink.psr") then
	FileDelete(ls_filepath+"grid_ole_ink.psr")
end if
if FileExists(ls_filepath+"treeview_multilevels.psr") then
	FileDelete(ls_filepath+"treeview_multilevels.psr")
end if
if FileExists(ls_filepath+"d_group_ink.psr") then
	FileDelete(ls_filepath+"d_group_ink.psr")
end if
if FileExists(ls_filepath+"grid_resize.psr") then
	FileDelete(ls_filepath+"grid_resize.psr")
end if
if FileExists(ls_filepath+"grid_resize1.psr") then
	FileDelete(ls_filepath+"grid_resize1.psr")
end if
end event

type dw_2 from datawindow within w_sap_psr
integer x = 366
integer y = 928
integer width = 1915
integer height = 668
integer taborder = 20
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_sap_psr
integer x = 366
integer y = 40
integer width = 1915
integer height = 840
integer taborder = 20
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_sap_psr
integer x = 23
integer y = 56
integer width = 329
integer height = 128
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "PSR"
end type

event clicked;of_testcase_point_module()
end event

