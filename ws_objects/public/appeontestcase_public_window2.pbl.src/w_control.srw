$PBExportHeader$w_control.srw
forward
global type w_control from w_base_case
end type
type cb_1 from commandbutton within w_control
end type
end forward

global type w_control from w_base_case
string title = ""
cb_1 cb_1
end type
global w_control w_control

type variables
w_sheet_main			iw_main
w_f132a01_child iw_child
w_f132a01_Popup lw_popup
w_sheet_popup		iw_popup2
w_sheet_response     iw_response 
w_sheet_response     iw_response2
w_sheet_main		iw_main2
w_woc101_sheet iw_woc109_sheet
window lw_main,iw_Open[]
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine wf_addopen (window aw_window)
end prototypes

public subroutine of_testcase_point_module ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col,li_return
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
//messagebox('0',' ')

ls_array[Upperbound(ls_array) + 1 ] = "open_sheet"			//edit you test case point name
//ls_array[Upperbound(ls_array) + 1 ] = ""

ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	Yield ( )
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")	
	is_log = ''
	ls_temp = ''
	li_rtn = 0 
	ls_temp2 = ''
	is_type =""
	ll_tmp = 0
	choose case lower(ls_item)
		case lower("open_sheet") 
			yield()
			is_type="closewindow"
			timer(1)
			
			li_return=  Open ( w_sheet_mdi )
			ls_result += wf_result_add(ls_item, "1.  ", not isnull(li_return) and li_return = 1)
			if isvalid(w_sheet_mdi) then
				close(w_sheet_mdi)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			li_return= Open ( w_f132a01_main )
			ls_result += wf_result_add(ls_item, "2.  ", not isnull(li_return) and li_return = 1)
			if isvalid(w_f132a01_main) then
				close(w_f132a01_main)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			li_return= Open ( iw_child, 'w_f132a01_child'  )
			ls_result += wf_result_add(ls_item, "3.  ", not isnull(li_return) and li_return = 1)
			if isvalid(iw_child) then
				close(iw_child)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			li_return=Open ( lw_popup, 'w_f132a01_Popup', w_mdi )
			ls_result += wf_result_add(ls_item, "4.  ", not isnull(li_return) and li_return = 1)
			if isvalid(lw_popup) then
				close(lw_popup)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			
			li_return= Open ( w_sheet_Response )
			ls_result += wf_result_add(ls_item, "5.  ", not isnull(li_return) and li_return = 1)			
			if isvalid(w_sheet_Response) then
				close(w_sheet_Response)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			li_return=OpenSheet(w_sheet_main,w_mdi)
			ls_result += wf_result_add(ls_item, "6.  ", not isnull(li_return) and li_return = 1)
			if isvalid(w_sheet_main) then
				close(w_sheet_main)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
	         w_sheet_main lw_main1
			li_return=OpenSheet(lw_main1,w_mdi)
			ls_result += wf_result_add(ls_item, "7.  ", not isnull(li_return) and li_return = 1)
			if isvalid(lw_main1) then
				close(lw_main1)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			Long	ll_LongParm = 123456
			li_return= OpenWithParm ( iw_main, ll_LongParm)
			ls_result += wf_result_add(ls_item, "8.  ", not isnull(li_return) and li_return = 1)
			if isvalid(iw_main) then
				close(iw_main)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			Double	ldb_DoubleParm = 12345
			li_return= OpenWithParm ( iw_popup2, ldb_DoubleParm , w_mdi )
			ls_result += wf_result_add(ls_item, "9.  ", not isnull(li_return) and li_return = 1)
			if isvalid(iw_popup2) then
				close(iw_popup2)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			String	ls_StrParm = 'Hello'
			li_return= OpenWithParm ( iw_response, ls_StrParm, w_Mdi)
			ls_result += wf_result_add(ls_item, "10.  ", not isnull(li_return) and li_return = 1)
			if isvalid(iw_response) then
				close(iw_response)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			DataStore d_OpenParm
			d_OpenParm = Create DataStore
			d_OpenParm.DataObject = "d_window"
			d_OpenParm.SetTransObject(sqlca)
			d_OpenParm.Retrieve()
			li_return= OpenWithParm ( iw_response2, d_OpenParm, w_Mdi)
			ls_result += wf_result_add(ls_item, "11.  ", not isnull(li_return) and li_return = 1)
			if isvalid(iw_response2) then
				close(iw_response2)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
//			Long	ll_LongParm = 123456
//			w_f132a04_main lw_main1
//			li_return= OpenSheetWithParm ( lw_main1, ll_LongParm , w_mdi )
//			ls_result += wf_result_add(ls_item, "11.  ", not isnull(li_return) and li_return = 1)
//			if isvalid(lw_main1) then
//				close(lw_main1)
//			end if
//			if  isvalid(w_controller) then
//				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
//			end if 
			
//			str_common str_OpenParm
//			str_OpenParm.c_id = '10'
//			str_OpenParm.v_Name = 'v_Name1'
//			str_OpenParm.dt_Born = DateTime(Date('1980/01/01'), Time('12:30:00'))
//			str_OpenParm.i_arg = 20
//			str_OpenParm.c_sex = 'W'
//			str_OPenParm.dec_salary = dec(1500.85)
//			li_return= OpenWithParm ( iw_main2, str_OpenParm, w_Mdi)
//			ls_result += wf_result_add(ls_item, "11.  ", not isnull(li_return) and li_return = 1)
//			if  isvalid(w_controller) then
//				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
//			end if 
			
		
			gs_method = 'OpenSheet(w_woc101_sheet,w_mdi)'
			li_return= OpenSheet(w_woc101_sheet,w_mdi)
			ls_result += wf_result_add(ls_item, "12.  ", not isnull(li_return) and li_return = 1)
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			window lw_sheet
			gs_method = 'OpenSheet(lw_sheet,~'w_woc101_sheet~',w_mdi)'
			li_return= OpenSheet(lw_sheet,'w_woc101_sheet',w_mdi)
			ls_result += wf_result_add(ls_item, "13.  ", not isnull(li_return) and li_return = 1)
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			gs_method = 'OpenSheet(w_woc101_sheet,w_mdi,1,Layered!)'
			li_return= OpenSheet(w_woc101_sheet,w_mdi,1,Layered!)
			ls_result += wf_result_add(ls_item, "14.  ", not isnull(li_return) and li_return = 1)
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			window lw_p003
			gs_method = 'OpenSheet(lw_p003,~'w_woc101_sheet~',w_mdi,1)'
			li_return= OpenSheet(lw_p003,'w_woc101_sheet',w_mdi,1)
			ls_result += wf_result_add(ls_item, "15.  ", not isnull(li_return) and li_return = 1)
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			li_return= OpenSheetWithParm(w_woc101_sheet,'appeonparm',w_mdi)
			ls_result += wf_result_add(ls_item, "16.  ", not isnull(li_return) and li_return = 1)
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if 
			
			li_return= OpenSheetWithParm(w_woc101_sheet,'appeonparm',w_mdi,1)
			ls_result += wf_result_add(ls_item, "17.  ", not isnull(li_return) and li_return = 1)
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if
			
			li_return= OpenSheetWithParm(w_woc101_sheet,'appeonparm',w_mdi,1,layered!)
			ls_result += wf_result_add(ls_item, "18.  ", not isnull(li_return) and li_return = 1)
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if
			
			li_return= openWithParm(w_woc101_sheet,'appeonparm')
			ls_result += wf_result_add(ls_item, "19.  ", not isnull(li_return) and li_return = 1)
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if
			
			window lw_P004
			li_return=openWithParm(lw_P004,'appeonparm','w_woc101_sheet',w_mdi)
			ls_result += wf_result_add(ls_item, "20.  ", not isnull(li_return) and li_return = 1)
			if isvalid(lw_P004) then
				close(lw_P004)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if
			
			li_return= open(gw_winobj)
			ls_result += wf_result_add(ls_item, "21.  ", not isnull(li_return) and li_return = 1)
			if isvalid(gw_winobj) then
				close(gw_winobj)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if
			
			li_return= open(iw_woc109_sheet)
			ls_result += wf_result_add(ls_item, "22.  ", not isnull(li_return) and li_return = 1)
			if isvalid(iw_woc109_sheet) then
				close(iw_woc109_sheet)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if
			
			li_return=Opensheet(iw_woc109_sheet,w_mdi)
			ls_result += wf_result_add(ls_item, "23.  ", not isnull(li_return) and li_return = 1)
			if isvalid(iw_woc109_sheet) then
				close(iw_woc109_sheet)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if
			
			li_return=open(w_woc202_uoctrlseq,this)
			ls_result += wf_result_add(ls_item, "24.  ", not isnull(li_return) and li_return = 1)
			if isvalid(w_woc202_uoctrlseq) then
				close(w_woc202_uoctrlseq)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if
			
			li_return=open(w_woc202_tabctrlseq,this)
			ls_result += wf_result_add(ls_item, "25.  ", not isnull(li_return) and li_return = 1)
			if isvalid(w_woc202_tabctrlseq) then
				close(w_woc202_tabctrlseq)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if
			
			li_return=open(w_woc202_tabctrlandwinctrlseq,this)
			ls_result += wf_result_add(ls_item, "26.  ", not isnull(li_return) and li_return = 1)
			if isvalid(w_woc202_tabctrlandwinctrlseq) then
				close(w_woc202_tabctrlandwinctrlseq)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if
			
			li_return=openwithparm(w_woc301_num,312)
			ls_result += wf_result_add(ls_item, "27.  ", not isnull(li_return) and li_return = 1)
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if
		
//			yield()
//			is_type="closewindow"
//			timer(1)
			//窗口关不掉
//			str_woc401_winstuct lSTR_winstr
//			lSTR_winstr.ls_winclassname = 'w_woc401_winclass'
//			
//			lSTR_winstr.ls_caption =  'testwinstruct'
//			window lw_open
//			li_return=open(lw_open,lSTR_winstr.ls_winclassname)
//			ls_result += wf_result_add(ls_item, "28.  ", not isnull(li_return) and li_return = 1)
//			if isvalid(w_woc401_winclass) then
//				close(w_woc401_winclass)
//			end if
//			if  isvalid(w_controller) then
//				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
//			end if
			
			li_return= open(w_woc501_close)
			gf_addwin(w_woc501_close)
			ls_result += wf_result_add(ls_item, "29.  ", not isnull(li_return) and li_return = 1)
			if isvalid(w_woc501_close) then
				close(w_woc501_close)
			end if
			if  isvalid(w_controller) then
				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
			end if
			
//			W_sheet_Main.Height = W_sheet_Main.Height + 100
//			li_return= W_sheet_Main.Height
//			ls_result += wf_result_add(ls_item, "30.  ", not isnull(li_return) and li_return = W_sheet_Main.Height)
//			if  isvalid(w_controller) then
//				if w_controller.windowstate = normal! then w_controller.windowstate = maximized! 
//			end if	
			
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine wf_addopen (window aw_window);integer  i

for i=1 to upperbound(iw_Open)
	if not isvalid(iw_Open[i]) or isnull(iw_Open[i]) then
		iw_Open[i] = aw_window
		return
	end if
next

iw_Open[i] = aw_window


end subroutine

on w_control.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_control.destroy
call super::destroy
destroy(this.cb_1)
end on

event timer;call super::timer;wf_closepopwindow('ResponseWindowType','ok')
wf_closepopwindow('tabctrl1','ok')
wf_closepopwindow('tabctrl2','ok')
wf_closepopwindow('tabctrl3','ok')
wf_closepopwindow('num parm','ok')
wf_closepopwindow('winclass1','ok')
wf_closepopwindow('Tested_Window','ok')
wf_closepopwindow('close1','ok')



end event

event open;call super::open;timer(0.1)
end event

type cb_1 from commandbutton within w_control
integer x = 78
integer y = 108
integer width = 384
integer height = 116
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

