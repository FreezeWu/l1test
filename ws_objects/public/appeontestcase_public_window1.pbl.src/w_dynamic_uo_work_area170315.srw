$PBExportHeader$w_dynamic_uo_work_area170315.srw
$PBExportComments$MDI Sheet that is the work area for the Dynamic User Object Example.
forward
global type w_dynamic_uo_work_area170315 from w_base_case
end type
type cb_3 from commandbutton within w_dynamic_uo_work_area170315
end type
type cb_2 from commandbutton within w_dynamic_uo_work_area170315
end type
type cb_1 from commandbutton within w_dynamic_uo_work_area170315
end type
type uo_dw from datawindow within w_dynamic_uo_work_area170315
end type
end forward

global type w_dynamic_uo_work_area170315 from w_base_case
integer x = 87
integer y = 200
integer width = 3045
integer height = 1760
string title = "Dynamic User Object Work Area"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_retrieve pbm_custom14
event ue_apply pbm_custom15
event ue_deleterow pbm_custom16
event ue_openwindow pbm_custom17
event ue_firstrow pbm_custom18
event ue_insertrow pbm_custom19
event ue_lastrow pbm_custom20
event ue_nextrow pbm_custom21
event ue_priorrow pbm_custom22
event ue_resetdw pbm_custom23
event ue_close_udo pbm_custom24
event ue_printdw pbm_custom25
event ue_exitapp pbm_custom26
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
uo_dw uo_dw
end type
global w_dynamic_uo_work_area170315 w_dynamic_uo_work_area170315

type variables
integer ii_PointerXOffset, ii_PointerYOffset
boolean      ib_Place
integer ii_UDO_nmbr 
u_dyn_cb170315 uo_placed[]
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
end prototypes

on ue_retrieve;	uo_dw.retrieve()

//***********************************************************************
// 		The last thing that we want to do in every script that would 
//			move focus away from the datawindow is to set the focus back
//			to the datawindow and thus make it appear that control never 
//			left the DataWindow.
//************************************************************************
	uo_dw.setfocus()

	
end on

on ue_apply;uo_dw.update()


//***********************************************************************
// 		The last thing that we want to do in every script that would 
//			move focus away from the datawindow is to set the focus back
//			to the datawindow and thus make it appear that control never 
//			left the DataWindow.
//************************************************************************
uo_dw.SetFocus()
end on

on ue_deleterow;//***********************************************************************
// 		Using a row number of 0 as an arguement to DeleteRow will cause
//			the current row to be deleted.  This will make the total row 
//			count for the DataWindow go down by one.
//			
//************************************************************************
uo_dw.deleterow(0)


//***********************************************************************
// 		The last thing that we want to do in every script that would 
//			move focus away from the datawindow is to set the focus back
//			to the datawindow and thus make it appear that control never 
//			left the DataWindow.
//************************************************************************
uo_dw.setfocus()
end on

event ue_openwindow;//// cause the uo_dw control to get a new datawindowobject that we have just created.
//string ls_response, ls_table, ls_style, ls_error
//int li_posi
//
//open(w_dynamic_uo_table_list)
//ls_response = message.stringparm
//
//li_posi = pos(ls_response,'|')
//if li_posi > 0 then
//	ls_table = left(ls_response, li_posi - 1)
//	ls_style = mid(ls_response, li_posi + 1)
//	uo_dw.Create(SyntaxFromSql(sqlca,"Select * from "+ls_table,"style(type=" + ls_style + ")",ls_error))
//	uo_dw.title	=	upper(ls_table)
//	uo_dw.SetTransObject(sqlca)
//	this.title = 'Dynamic User Object Work Area ('+ls_table+')'
//end if
//
end event

on ue_firstrow;uo_dw.ScrollToRow (1)


//***********************************************************************
// 		The last thing that we want to do in every script that would 
//			move focus away from the datawindow is to set the focus back
//			to the datawindow and thus make it appear that control never 
//			left the DataWindow.
//************************************************************************
uo_dw.setfocus()
end on

on ue_insertrow;
int lReturnCode

lReturnCode = uo_dw.insertrow(uo_dw.getrow())
//***********************************************************************
// 		If lReturnCode = 0 then something went wrong with the insert
//			row funtion and we should not try to scroll to row 0.  
//			In a true application an error message of some kind would be 
//			displayed by the programmer
//************************************************************************
if lReturnCode <> 0 then 
	uo_dw.scrolltorow(lReturnCode)
end if


//***********************************************************************
// 		The last thing that we want to do in every script that would 
//			move focus away from the datawindow is to set the focus back
//			to the datawindow and thus make it appear that control never 
//			left the DataWindow.
//************************************************************************
	uo_dw.SetFocus()
end on

on ue_lastrow;//***********************************************************************
// 		The use of the Function RowCount will return the number of 
//			rows in the datawindow thus any rows inserted or deleted will be
//			reflected.  Thus by nesting the RowCount inside the ScrollToRow
//			functions it is guarenteed to find the last row.
//************************************************************************
uo_dw.ScrollToRow (uo_dw.RowCount())


//***********************************************************************
// 		The last thing that we want to do in every script that would 
//			move focus away from the datawindow is to set the focus back
//			to the datawindow and thus make it appear that control never 
//			left the DataWindow.
//************************************************************************
uo_dw.setfocus()
end on

on ue_nextrow;//***********************************************************************
// 		Using variables for current row and last row will stop the
//			script from trying to scroll past the last row.  When the 
//			last row is the current row the script will beep
//************************************************************************

int lCurrentRow, lLastRow

lCurrentRow = uo_dw.GetRow()
lLastRow		= uo_dw.RowCount()

	if lCurrentRow < lLastRow then
		uo_dw.ScrollToRow (lCurrentRow + 1)
	else
		Beep (1)
	end if

//***********************************************************************
// 		The last thing that we want to do in every script that would 
//			move focus away from the datawindow is to set the focus back
//			to the datawindow and thus make it appear that control never 
//			left the DataWindow.
//************************************************************************
	uo_dw.SetFocus()
end on

on ue_priorrow;//***********************************************************************
// 		Using variables for current row will stop the
//			script from trying to scroll past the first row.  When the 
//			first row is the current row the script will beep
//************************************************************************


int lCurrentRow

lCurrentRow = uo_dw.GetRow()


	if lCurrentRow > 1 then
		uo_dw.ScrollToRow (lCurrentRow - 1)
	else
		Beep (1)
	end if


//***********************************************************************
// 		The last thing that we want to do in every script that would 
//			move focus away from the datawindow is to set the focus back
//			to the datawindow and thus make it appear that control never 
//			left the DataWindow.
//************************************************************************
	uo_dw.SetFocus()
end on

on ue_resetdw;uo_dw.reset()
end on

event ue_close_udo;//// make sure that the appropriate menu item is turned back on and then close the 
//// user object
//CHOOSE CASE iu_being_dragged.ii_object_number
//	CASE 2
//		m_dynamic_uo_open_udo.m_UDOs.m_retrieve.enabled	=	TRUE
//	CASE 3
//		m_dynamic_uo_open_udo.m_UDOs.m_insert.enabled		=	TRUE
//	CASE 4
//		m_dynamic_uo_open_udo.m_UDOs.m_delete.enabled		=	TRUE
//	CASE 5
//		m_dynamic_uo_open_udo.m_UDOs.m_update.enabled		=	TRUE
//	CASE 6
//		m_dynamic_uo_open_udo.m_UDOs.m_first.enabled		=	TRUE
//	CASE 7
//		m_dynamic_uo_open_udo.m_UDOs.m_last.enabled			=	TRUE
//	CASE 8
//		m_dynamic_uo_open_udo.m_UDOs.m_next.enabled			=	TRUE
//	CASE 9
//		m_dynamic_uo_open_udo.m_UDOs.m_prior.enabled		=	TRUE
//	CASE 10
//		m_dynamic_uo_open_udo.m_UDOs.m_reset.enabled		=	TRUE
//	CASE 11
//		m_dynamic_uo_open_udo.m_UDOs.m_print.enabled		=	TRUE
//	CASE 12
//		m_dynamic_uo_open_udo.m_UDOs.m_exit.enabled		=	TRUE
//END CHOOSE
//closeUserObject(iu_being_dragged)
//
end event

on ue_printdw;uo_dw.print()

//***********************************************************************
// 		The last thing that we want to do in every script that would 
//			move focus away from the datawindow is to set the focus back
//			to the datawindow and thus make it appear that control never 
//			left the DataWindow.
//************************************************************************
uo_dw.setfocus()
end on

event ue_exitapp;close(this)

end event

public subroutine of_testcase_point_module ();// 测试li_rc = OpenUserObjectwithparm

integer i , j, h, li_rc
u_dyn_struct170315 parm


i	=	20
j	=	1300
// determine which button is to be created and then create and place it. 

// 动态产生12个u_dyn_cb170315对象



For h =1  to 12
	
	ii_UDO_nmbr = h
	parm.code= ii_UDO_nmbr
	parm.win = this
	uo_placed[ii_UDO_nmbr] = create u_dyn_cb170315
	CHOOSE CASE ii_UDO_nmbr
		CASE 1
			parm.label = '&Test'
			parm.clicked = 'ue_retrieve'
			parm.size = 300
			li_rc = OpenUserObjectwithparm(uo_placed[ii_UDO_nmbr],parm , i , j)
		CASE 2
			parm.label = '&Retrieve'
			parm.clicked = 'ue_retrieve'
			parm.size = 300
			li_rc = OpenUserObjectwithparm(uo_placed[ii_UDO_nmbr],parm , i , j)
		CASE 3
			parm.label = '&Insert'
			parm.clicked = 'ue_insertrow'
			parm.size = 300
			li_rc = OpenUserObjectwithparm(uo_placed[ii_UDO_nmbr],parm , i , j)
		CASE 4
			parm.label = '&Delete'
			parm.clicked = 'ue_deleterow'
			parm.size = 300
			li_rc = OpenUserObjectwithparm(uo_placed[ii_UDO_nmbr],parm , i , j)
		CASE 5
			parm.label = '&Update'
			parm.clicked = 'ue_apply'
			parm.size = 300
			li_rc = OpenUserObjectwithparm(uo_placed[ii_UDO_nmbr],parm , i , j)
		CASE 6
			parm.label = '&First'
			parm.clicked = 'ue_firstrow'
			parm.size = 300
			li_rc = OpenUserObjectwithparm(uo_placed[ii_UDO_nmbr],parm , i , j)
		CASE 7
			parm.label = '&Last'
			parm.clicked = 'ue_lastrow'
			parm.size = 300
			li_rc = OpenUserObjectwithparm(uo_placed[ii_UDO_nmbr],parm , i , j)
		CASE 8
			parm.label = '&Next'
			parm.clicked = 'ue_nextrow'
			parm.size = 300
			li_rc = OpenUserObjectwithparm(uo_placed[ii_UDO_nmbr],parm , i , j)
		CASE 9
			parm.label = 'Pri&or'
			parm.clicked = 'ue_priorrow'
			parm.size = 300
			li_rc = OpenUserObjectwithparm(uo_placed[ii_UDO_nmbr],parm , i , j)
		CASE 10
			parm.label = 'Re&set'
			parm.clicked = 'ue_resetdw'
			parm.size = 300
			li_rc = OpenUserObjectwithparm(uo_placed[ii_UDO_nmbr],parm , i , j)
		CASE 11
			parm.label = '&Print'
			parm.clicked = 'ue_printdw'
			parm.size = 300
			li_rc = OpenUserObjectwithparm(uo_placed[ii_UDO_nmbr],parm , i , j)
		CASE 12
			parm.label = 'E&xit'
			parm.clicked = 'ue_exitapp'
			parm.size = 300
			li_rc = OpenUserObjectwithparm(uo_placed[ii_UDO_nmbr],parm , i , j)
		   
	END CHOOSE
     i +=380
	 if h = 6 then
		i = 20
		 j += 180
	 end if
	 If isnull(li_rc) or li_rc < 1 then
		exit;
		
	 end if
next	
is_resultlog += wf_result_add("testcasepoint1", "OpenUserObjectwithparm", li_rc = 1)

// 测试closeUserObject是否成功
li_rc = closeUserObject(uo_placed[1])
is_resultlog += wf_result_add("testcasepoint1", "closeUserObject", li_rc = 1)

end subroutine

public subroutine of_testcase_point_module1 ();// 测试动态创建DW
integer i
long ll_count
string ls_table, ls_style, ls_error,ls_filename, ls_styles[]
string ls_dw_syntax, ls_dw_data
n_resource_manager ln_resource_manager

ls_table ="sales_order"
ls_styles[1]= "form"
ls_styles[2]= "tabular"
ls_styles[3]= "grid"
  
for i = 1 to 3
	ls_style = ls_styles[i]
	ls_filename = 'w_dynamic_uo_work_area' +"_" + ls_table + "_" + ls_style
	
	
	ls_dw_syntax = SyntaxFromSql(sqlca,"Select * from "+ls_table,"style(type=" + ls_style + ")",ls_error)
	If ls_error <> "" Then
		is_resultlog += wf_result_add("testcasepoint2", ls_filename + " Dynamic create datawindow SyntaxFromSQL error:" +ls_error, False)
		Return
	Else
		is_resultlog += wf_result_add("testcasepoint2", ls_filename + " Dynamic create datawindow SyntaxFromSQL", True)
	End If
	uo_dw.Create(ls_dw_syntax)
	// 比较生成的syntax是否相等，比较时先将头部的版本(release 12.6;)信息清除
	ls_dw_data = ln_resource_manager.f_get_resource(ls_filename+ ".txt")
	ls_dw_data = mid(ls_dw_data, pos(ls_dw_data, ";") + 1 )
	ls_dw_syntax = mid(ls_dw_syntax, pos(ls_dw_syntax, ";") + 1 )
	is_resultlog += wf_result_add("testcasepoint2", ls_filename + " Dynamic Datawindow syntax equal", ls_dw_data = ls_dw_syntax )
	//Retrieve into the new datawindow
	uo_dw.SetTransObject(sqlca)
	ll_count = uo_dw.Retrieve( )
	is_resultlog += wf_result_add("testcasepoint2", ls_filename + " Dynamic Datawindow retrieved", ll_count > 0 )
next


end subroutine

event clicked;//integer i , j
//u_dyn_struct170315 parm
//u_dyn_cb170315 uo_placed
//
//i	=	PointerX()
//j	=	PointerY()
//// determine which button is to be created and then create and place it. 
//
//if ib_Place then
//	If ge_Environment.OSType <> sol2! Then
//		// This statement is not valid on PB for Unix
//		this.pointer = ""
//	End if
//
//	parm.code= ii_UDO_nmbr
//	parm.win = this
//	CHOOSE CASE ii_UDO_nmbr
//		CASE 1
//			uo_dw.x	=	i
//			uo_dw.y	=	j
//			uo_dw.visible	=	TRUE
//			im_menu.m_UDOs.m_dw.enabled	=	FALSE
//			this.postevent('ue_openwindow')
//		CASE 2
//			parm.label = '&Retrieve'
//			parm.clicked = 'ue_retrieve'
//			parm.size = 353
//			OpenUserObjectwithparm(uo_placed,parm , i , j)
//			im_menu.m_UDOs.m_retrieve.enabled	=	FALSE
//		CASE 3
//			parm.label = '&Insert'
//			parm.clicked = 'ue_insertrow'
//			parm.size = 353
//			OpenUserObjectwithparm(uo_placed,parm , i , j)
//			im_menu.m_UDOs.m_insert.enabled		=	FALSE
//		CASE 4
//			parm.label = '&Delete'
//			parm.clicked = 'ue_deleterow'
//			parm.size = 353
//			OpenUserObjectwithparm(uo_placed,parm , i , j)
//			im_menu.m_UDOs.m_delete.enabled		=	FALSE
//		CASE 5
//			parm.label = '&Update'
//			parm.clicked = 'ue_apply'
//			parm.size = 353
//			OpenUserObjectwithparm(uo_placed,parm , i , j)
//			im_menu.m_UDOs.m_update.enabled		=	FALSE
//		CASE 6
//			parm.label = '&First'
//			parm.clicked = 'ue_firstrow'
//			parm.size = 353
//			OpenUserObjectwithparm(uo_placed,parm , i , j)
//			im_menu.m_UDOs.m_first.enabled		=	FALSE
//		CASE 7
//			parm.label = '&Last'
//			parm.clicked = 'ue_lastrow'
//			parm.size = 353
//			OpenUserObjectwithparm(uo_placed,parm , i , j)
//			im_menu.m_UDOs.m_last.enabled		=	FALSE
//		CASE 8
//			parm.label = '&Next'
//			parm.clicked = 'ue_nextrow'
//			parm.size = 353
//			OpenUserObjectwithparm(uo_placed,parm , i , j)
//			im_menu.m_UDOs.m_next.enabled		=	FALSE
//		CASE 9
//			parm.label = 'Pri&or'
//			parm.clicked = 'ue_priorrow'
//			parm.size = 353
//			OpenUserObjectwithparm(uo_placed,parm , i , j)
//			im_menu.m_UDOs.m_prior.enabled		=	FALSE
//		CASE 10
//			parm.label = 'Re&set'
//			parm.clicked = 'ue_resetdw'
//			parm.size = 353
//			OpenUserObjectwithparm(uo_placed,parm , i , j)
//			im_menu.m_UDOs.m_reset.enabled		=	FALSE
//		CASE 11
//			parm.label = '&Print'
//			parm.clicked = 'ue_printdw'
//			parm.size = 353
//			OpenUserObjectwithparm(uo_placed,parm , i , j)
//			im_menu.m_UDOs.m_print.enabled		=	FALSE
//		CASE 12
//			parm.label = 'E&xit'
//			parm.clicked = 'ue_exitapp'
//			parm.size = 353
//			OpenUserObjectwithparm(uo_placed,parm , i , j)
//			im_menu.m_UDOs.m_exit.enabled		=	FALSE
//	END CHOOSE
//	ib_Place = FALSE
//end if
//	
end event

on w_dynamic_uo_work_area170315.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.uo_dw=create uo_dw
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.uo_dw
end on

on w_dynamic_uo_work_area170315.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.uo_dw)
end on

type cb_3 from commandbutton within w_dynamic_uo_work_area170315
integer x = 2377
integer y = 600
integer width = 608
integer height = 132
integer taborder = 31
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update resource file"
end type

event clicked;// 写入动态创建DW syntax 到数据库
integer i
long ll_count
string ls_table, ls_style, ls_error,ls_filename, ls_styles[]
string ls_dw_syntax, ls_dw_data
n_resource_manager ln_resource_manager

ls_table ="sales_order"
ls_styles[1]= "form"
ls_styles[2]= "tabular"
ls_styles[3]= "grid"
  
for i = 1 to 3
	ls_style = ls_styles[i]
	ls_filename = 'w_dynamic_uo_work_area' +"_" + ls_table + "_" + ls_style
	
	
	ls_dw_syntax = SyntaxFromSql(sqlca,"Select * from "+ls_table,"style(type=" + ls_style + ")",ls_error)
	If ls_error <> "" Then
		MessageBox("Error",  ls_filename + "Dynamic create datawindow SyntaxFromSQL error:" +ls_error)
		Return
	End If
	uo_dw.Create(ls_dw_syntax)
	ln_resource_manager.f_insert_resource(ls_filename+ ".txt", ls_dw_syntax)
next


end event

type cb_2 from commandbutton within w_dynamic_uo_work_area170315
integer x = 2377
integer y = 368
integer width = 608
integer height = 132
integer taborder = 21
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2.Testcasepoint2"
end type

event clicked;of_testcase_point_module1()
end event

type cb_1 from commandbutton within w_dynamic_uo_work_area170315
integer x = 2377
integer y = 136
integer width = 608
integer height = 132
integer taborder = 11
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.Testcasepoint1"
end type

event clicked;of_testcase_point_module()
end event

type uo_dw from datawindow within w_dynamic_uo_work_area170315
integer x = 82
integer y = 32
integer width = 2272
integer height = 996
boolean titlebar = true
string dataobject = "d_dyn_uo_tables_list"
boolean hsplitscroll = true
end type

