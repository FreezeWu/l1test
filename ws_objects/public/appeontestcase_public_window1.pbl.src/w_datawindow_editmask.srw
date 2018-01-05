$PBExportHeader$w_datawindow_editmask.srw
forward
global type w_datawindow_editmask from w_base
end type
type cb_5 from commandbutton within w_datawindow_editmask
end type
type cb_4 from commandbutton within w_datawindow_editmask
end type
type cb_3 from commandbutton within w_datawindow_editmask
end type
type cb_2 from commandbutton within w_datawindow_editmask
end type
type dw_1 from datawindow within w_datawindow_editmask
end type
type cb_1 from commandbutton within w_datawindow_editmask
end type
type st_1 from statictext within w_datawindow_editmask
end type
end forward

global type w_datawindow_editmask from w_base
integer width = 2843
integer height = 1688
string title = "DataWindow EditMask Test"
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
st_1 st_1
end type
global w_datawindow_editmask w_datawindow_editmask

type variables

string 	is_result
end variables

on w_datawindow_editmask.create
int iCurrent
call super::create
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_5
this.Control[iCurrent+2]=this.cb_4
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.st_1
end on

on w_datawindow_editmask.destroy
call super::destroy
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.st_1)
end on

event ue_execute;call super::ue_execute;choose case as_testcasename 
	case 'DW_datawindow_EditMask'
		cb_1.triggerevent( clicked!)
		cb_2.triggerevent( clicked!)
		cb_3.triggerevent( clicked!)
		cb_4.triggerevent( clicked!)
		cb_5.triggerevent( clicked!)
		
		gf_returnresult(is_result)
	
end choose

close(this)



end event

type cb_5 from commandbutton within w_datawindow_editmask
integer x = 96
integer y = 800
integer width = 654
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "DateTime EditMask Test"
end type

event clicked;//Time
dw_1.DataObject = 'd_mask_datetime'
dw_1.Retrieve()

dw_1.SetColumn( 'name_13' )
dw_1.SelectText(1, Len(dw_1.GetText()) + 5)
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', '[date][time]' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't01' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'yyyy' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't02' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'mm' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't03' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'hh' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't04' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'yyyy,mm,dd hh:mm:ss' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't05' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'yyyy/mm/dd hh:mm:ss' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't06' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'yyyy.mm.dd hh:mm:ss' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't07' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'yyyy-mm-dd hh:mm:ss' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't08' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'yyyy mm dd hh:mm:ss' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't09' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'hh:mm:ss' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_3' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'yyyy-mm-dd' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_4' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'yy-mm-dd hh:mm:ss' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_5' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'mm-dd-yy hh:mm:ss' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_6' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'dd-mm-yy hh:mm:ss' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_7' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'mm-dd-yyyy hh:mm:ss' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_8' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'dd-mm-yyyy hh:mm:ss' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_9' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'yyyy-mm-dd hh:mm:ss:fff' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_11' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'yyyy-mm-dd hh:mm' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_12' )
dw_1.SelectText(1, Len(dw_1.GetText()) )
dw_1.Copy()
is_result += "EditMask ( '01/09/2003 12:58:59', 'yyyy-mm-dd hh' ) = " + String ( Clipboard()) +"~r~n"



end event

type cb_4 from commandbutton within w_datawindow_editmask
integer x = 96
integer y = 668
integer width = 558
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Time EditMask Test"
end type

event clicked;
//Time
dw_1.DataObject = 'd_mask_time'
dw_1.Retrieve()

dw_1.SetColumn( 't08' )
dw_1.SelectText(1, Len(dw_1.GetText()) + 5)
dw_1.Copy()
is_result += "EditMask ( '09:45:33:234567', '[time]' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't01' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '09:45:33:234567', '[hh:mm]' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't02' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '09:45:33:234567', '[hh:mm:ss]' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't03' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '09:45:33:234567', '[hh-mm-ss]' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't04' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '09:45:33:234567', '[hhmmss]' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't05' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '09:45:33:234567', '[hh:mm:ss:fff]' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 't06' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '09:45:33:234567', '[hh:mm:ss:ffffff]' ) = " + String ( Clipboard()) +"~r~n"

end event

type cb_3 from commandbutton within w_datawindow_editmask
integer x = 96
integer y = 536
integer width = 558
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Date EditMask Test"
end type

event clicked;
//Date
dw_1.DataObject = 'd_mask_date'
dw_1.Retrieve()

dw_1.SetColumn( 'name_12' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', '[date]' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'd01' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'yy-mm-dd' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'd02' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'yy' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'd03' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'yyyy' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'd04' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'yyyy,mm,dd' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'd05' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'yyyy.mm.dd' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_1' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'yyyy/mm/dd' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_2' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'yyyy-mm-dd' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_3' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'yyyy mm dd' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_4' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'yyyy-mm/dd' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_6' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'YYYY-MM-DD' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_7' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'mm-dd-yy' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_8' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'dd-mm-yy' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_9' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'yy-mm-dd' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_10' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'mm-dd-yyyy' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_11' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '01/30/1998', 'dd-mm-yyyy' ) = " + String ( Clipboard()) +"~r~n"

end event

type cb_2 from commandbutton within w_datawindow_editmask
integer x = 96
integer y = 404
integer width = 608
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Number EditMask Test"
end type

event clicked;

//Number
//5
dw_1.DataObject = 'd_mask_number'
dw_1.Retrieve()

dw_1.SetColumn( 'a01' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( 5, '[General]' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'a02' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( 5, '0' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'a04' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( 5, '#,##0' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'a05' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( 5, '#,###,###' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'a06' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( 5, '#,###.00' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'a07' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( 5, '#,##0.00' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'a08' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( 5, '#,###.##' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'a11' )
dw_1.SelectText(1, Len(dw_1.GetText()) + 5)
dw_1.Copy()

is_result += "EditMask ( 5, '0%' ) = " + String (  Clipboard()) +"~r~n"

dw_1.SetColumn( 'a12' )
dw_1.SelectText(1, Len(dw_1.GetText()) + 6)
dw_1.Copy()
is_result += "EditMask ( 5, '0.00%' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'a13' )
dw_1.SelectText(1, Len(dw_1.GetText() )+5)
dw_1.Copy()
is_result += "EditMask ( 5, '0.00E+00' ) = " + String ( Clipboard()) +"~r~n"

//-5
dw_1.SetColumn( 'b01' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( -5, '[General]' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'b02' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( -5, '0' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'b04' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( -5, '#,##0' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'b05' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( -5, '#,###,###' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'b06' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( -5, '#,###.00' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'b07' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( -5, '#,##0.00' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'b08' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( -5, '#,###.##' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'b11' )
dw_1.SelectText(1, Len(dw_1.GetText()) + 5)
dw_1.Copy()

is_result += "EditMask ( -5, '0%' ) = " + String (  Clipboard()) +"~r~n"

dw_1.SetColumn( 'b12' )
dw_1.SelectText(1, Len(dw_1.GetText()) + 6)
dw_1.Copy()
is_result += "EditMask ( -5, '0.00%' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'b13' )
dw_1.SelectText(1, Len(dw_1.GetText() )+5)
dw_1.Copy()
is_result += "EditMask ( -5, '0.00E+00' ) = " + String ( Clipboard()) +"~r~n"

//.5
dw_1.SetColumn( 'c01' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( .5, '[General]' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'c02' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( .5, '0' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'c04' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( .5, '#,##0' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'c05' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( .5, '#,###,###' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'c06' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( .5, '#,###.00' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'c07' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( .5, '#,##0.00' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'c08' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( .5, '#,###.##' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'c11' )
dw_1.SelectText(1, Len(dw_1.GetText()) + 5)
dw_1.Copy()

is_result += "EditMask ( .5, '0%' ) = " + String (  Clipboard()) +"~r~n"

dw_1.SetColumn( 'c12' )
dw_1.SelectText(1, Len(dw_1.GetText()) + 6)
dw_1.Copy()
is_result += "EditMask ( .5, '0.00%' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'c13' )
dw_1.SelectText(1, Len(dw_1.GetText() )+5)
dw_1.Copy()
is_result += "EditMask ( .5, '0.00E+00' ) = " + String ( Clipboard()) +"~r~n"



end event

type dw_1 from datawindow within w_datawindow_editmask
integer x = 1326
integer y = 272
integer width = 1394
integer height = 852
integer taborder = 20
string title = "none"
string dataobject = "d_mask_string"
boolean livescroll = true
end type

type cb_1 from commandbutton within w_datawindow_editmask
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
string text = "String EditMask Test"
end type

event clicked;
//String
dw_1.DataObject = 'd_mask_string'
dw_1.Retrieve()

dw_1.SetColumn( 's01' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( 'Hello', '!!!!!' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_1' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( 'Hello', '^^^^^' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_2' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '5and5', '#####' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_3' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '5and5', 'aaaaa' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_4' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '5or%$', 'xxxxx' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_5' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( 'Hello World', '!!!!!!' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_6' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( 'Hello World', '^^^^^^' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_7' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '123456789','######' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_11' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( 'hELLOHello','!^^^^^-aaaaa' ) = " + String ( Clipboard()) +"~r~n"

dw_1.SetColumn( 'name_12' )
dw_1.SelectText(1, Len(dw_1.GetText()))
dw_1.Copy()
is_result += "EditMask ( '800china','###-xxxxxx' ) = " + String ( Clipboard() ) +"~r~n"

dw_1.SetColumn( 'name_13' )
dw_1.SelectText(1, Len(dw_1.GetText()) + 5)
dw_1.Copy()
is_result += "EditMask ( '20th','##% $xx' ) = " + String ( Clipboard() ) +"~r~n"


end event

type st_1 from statictext within w_datawindow_editmask
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
string text = "DataWindow EditMask Test"
boolean focusrectangle = false
end type

