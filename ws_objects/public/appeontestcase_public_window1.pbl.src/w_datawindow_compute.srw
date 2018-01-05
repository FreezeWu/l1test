$PBExportHeader$w_datawindow_compute.srw
forward
global type w_datawindow_compute from w_base
end type
type cb_2 from commandbutton within w_datawindow_compute
end type
type dw_1 from datawindow within w_datawindow_compute
end type
type cb_1 from commandbutton within w_datawindow_compute
end type
type st_1 from statictext within w_datawindow_compute
end type
end forward

global type w_datawindow_compute from w_base
integer width = 2843
integer height = 1688
string title = "DataWindow Compute Test"
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
st_1 st_1
end type
global w_datawindow_compute w_datawindow_compute

type variables

string 	is_result
end variables

on w_datawindow_compute.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.st_1
end on

on w_datawindow_compute.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.st_1)
end on

event ue_execute;call super::ue_execute;choose case as_testcasename 
	case 'DW_datawindow_Compute'
		cb_1.triggerevent( clicked!)
		cb_2.triggerevent( clicked!)	
		gf_returnresult(is_result)
	
end choose

close(this)



end event

type cb_2 from commandbutton within w_datawindow_compute
integer x = 96
integer y = 404
integer width = 558
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Compute2 Test"
end type

event clicked;
//String
dw_1.DataObject = "d_employee_summary_computedcolumn"
dw_1.SetTransObject ( SQLCA )
dw_1.Retrieve()

If dw_1.RowCount () > 0 Then
	is_result +=  String ( dw_1.GetItemString ( 1, 'compute_1' )) +"~r~n"
	is_result +=  + String (  dw_1.GetItemString ( 1, 'compute_2' )) +"~r~n"
	is_result +=  + String (  dw_1.GetItemString ( 1, 'compute_4' )) +"~r~n"
	is_result +=  + String (  dw_1.GetItemString ( 1, 'compute_5' )) +"~r~n"
	is_result +=  + String (  dw_1.GetItemString ( 1, 'compute_6' )) +"~r~n"
End If




end event

type dw_1 from datawindow within w_datawindow_compute
integer x = 1326
integer y = 272
integer width = 1394
integer height = 852
integer taborder = 20
string title = "none"
string dataobject = "d_print_employee_roster_dw"
boolean livescroll = true
end type

type cb_1 from commandbutton within w_datawindow_compute
integer x = 96
integer y = 272
integer width = 558
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Compute Test"
end type

event clicked;
//String
dw_1.SetTransObject ( SQLCA )
dw_1.Retrieve()

If dw_1.RowCount () > 0 Then
	is_result += "Total Salaries = " + String ( Round(dw_1.GetItemNumber ( 1, 'compute_10' ),2)) +"~r~n"
	is_result += "Minimum Salary = " + String ( Round ( dw_1.GetItemNumber ( 1, 'compute_8' ),2)) +"~r~n"
	is_result += "Average Salary = " + String ( Round ( dw_1.GetItemNumber ( 1, 'compute_11' ),2)) +"~r~n"
	is_result += "Maximum Salary = " + String ( Round ( dw_1.GetItemNumber ( 1, 'compute_9' ),2)) +"~r~n"
End If




end event

type st_1 from statictext within w_datawindow_compute
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
string text = "DataWindow Compute Test"
boolean focusrectangle = false
end type

