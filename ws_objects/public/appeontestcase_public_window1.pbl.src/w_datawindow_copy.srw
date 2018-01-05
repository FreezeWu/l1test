$PBExportHeader$w_datawindow_copy.srw
forward
global type w_datawindow_copy from w_base
end type
type dw_dest from datawindow within w_datawindow_copy
end type
type cb_6 from commandbutton within w_datawindow_copy
end type
type cb_5 from commandbutton within w_datawindow_copy
end type
type cb_4 from commandbutton within w_datawindow_copy
end type
type cb_3 from commandbutton within w_datawindow_copy
end type
type cb_2 from commandbutton within w_datawindow_copy
end type
type dw_source from datawindow within w_datawindow_copy
end type
type cb_1 from commandbutton within w_datawindow_copy
end type
type st_1 from statictext within w_datawindow_copy
end type
end forward

global type w_datawindow_copy from w_base
integer width = 2843
integer height = 1688
string title = "DataWindow Copy Test"
dw_dest dw_dest
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
dw_source dw_source
cb_1 cb_1
st_1 st_1
end type
global w_datawindow_copy w_datawindow_copy

type variables

string 	is_result
Long	il_Begin, il_Rows

end variables

on w_datawindow_copy.create
int iCurrent
call super::create
this.dw_dest=create dw_dest
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_source=create dw_source
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_dest
this.Control[iCurrent+2]=this.cb_6
this.Control[iCurrent+3]=this.cb_5
this.Control[iCurrent+4]=this.cb_4
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.dw_source
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.st_1
end on

on w_datawindow_copy.destroy
call super::destroy
destroy(this.dw_dest)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_source)
destroy(this.cb_1)
destroy(this.st_1)
end on

event ue_execute;call super::ue_execute;dw_source.SetTransObject ( SQLCA )
dw_source.Retrieve()

choose case as_testcasename 
	case 'DW_datawindow_Copy'
		cb_1.triggerevent( clicked!)
		cb_2.triggerevent( clicked!)
		cb_3.triggerevent( clicked!)
		cb_4.triggerevent( clicked!)
		cb_5.triggerevent( clicked!)
		cb_6.triggerevent( clicked!)
		gf_returnresult(is_result)
	
end choose

close(this)



end event

type dw_dest from datawindow within w_datawindow_copy
integer x = 1349
integer y = 668
integer width = 1394
integer height = 852
integer taborder = 20
string title = "none"
string dataobject = "d_items"
boolean livescroll = true
end type

type cb_6 from commandbutton within w_datawindow_copy
integer x = 96
integer y = 932
integer width = 942
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Copy Using Dot Notation by Item"
end type

event clicked;
Long			ll_Cnt,ll_New
Integer		li_Data
Date	ldt_Data

SetPointer(HourGlass!)

dw_dest.Reset()
il_Rows = dw_source.RowCount()
For ll_Cnt = 1 To il_Rows
	
	dw_dest.Object.id[ll_Cnt] = dw_source.Object.id[ll_Cnt]
	dw_dest.Object.line_id[ll_Cnt] = dw_source.Object.line_id[ll_Cnt]
	dw_dest.Object.prod_id[ll_Cnt] = dw_source.Object.prod_id[ll_Cnt]
	dw_dest.Object.quantity[ll_Cnt] = dw_source.Object.quantity[ll_Cnt]
	dw_dest.Object.ship_date[ll_Cnt] = dw_source.Object.ship_date[ll_Cnt]
	
	
Next

is_result += "Copy Using Dot Notation by Item Rows = " + String ( dw_dest.RowCount()) +"~r~n"
end event

type cb_5 from commandbutton within w_datawindow_copy
integer x = 96
integer y = 800
integer width = 942
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Copy Using Dot Notation by Column"
end type

event clicked;Long			ll_Cnt,ll_New
Integer		li_Data
Date	ldt_Data

//SetPointer(HourGlass!)

dw_dest.Reset()
il_Rows = dw_source.RowCount()
dw_dest.Object.id[1,il_rows] = dw_source.Object.id[1,il_rows]
dw_dest.Object.line_id[1,il_rows] = dw_source.Object.line_id[1,il_rows]
dw_dest.Object.prod_id[1,il_rows] = dw_source.Object.prod_id[1,il_rows]
dw_dest.Object.quantity[1,il_rows] = dw_source.Object.quantity[1,il_rows]
dw_dest.Object.ship_date[1,il_rows] = dw_source.Object.ship_date[1,il_rows]

is_result += "Copy Using Dot Notation by Column Rows = " + String ( dw_dest.RowCount()) +"~r~n"
end event

type cb_4 from commandbutton within w_datawindow_copy
integer x = 96
integer y = 668
integer width = 869
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Copy Using Dot Notation by Row"
end type

event clicked;
Long			ll_Cnt,ll_New
Integer		li_Data
Date	ldt_Data

SetPointer(HourGlass!)

// First, reset the destination DataWindow and turn redraw off
dw_dest.Reset()
il_Rows = dw_source.RowCount()
For ll_Cnt = 1 To il_Rows
	
	// Insert a blank row
	//ll_New = dw_dest.InsertRow(0)
	dw_dest.Object.Data[ll_Cnt] = dw_source.Object.Data[ll_Cnt]
	
	
Next

is_result += "Copy Using Dot Notation by Row Rows = " + String ( dw_dest.RowCount()) +"~r~n"
end event

type cb_3 from commandbutton within w_datawindow_copy
integer x = 96
integer y = 536
integer width = 814
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Copy Using Dot Notation by All"
end type

event clicked;// First, reset the destination DataWindow
dw_dest.Reset()

// Copy the data to the destination DataWindow

dw_dest.Object.Data = dw_source.Object.Data

is_result += "Copy Using Dot Notation by All Rows = " + String ( dw_dest.RowCount()) +"~r~n"
end event

type cb_2 from commandbutton within w_datawindow_copy
integer x = 96
integer y = 404
integer width = 640
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Copy Using RowsCopy()"
end type

event clicked;// First, reset the destination DataWindow
dw_dest.Reset()
il_Rows = dw_source.RowCount()
// Copy the data to the destination DataWindow
dw_source.RowsCopy(1, il_Rows, Primary!, dw_dest, 1, Primary!)

is_result += "Copy Using RowsCopy() Rows = " + String ( dw_dest.RowCount()) +"~r~n"
end event

type dw_source from datawindow within w_datawindow_copy
integer x = 1326
integer y = 272
integer width = 1394
integer height = 852
integer taborder = 20
string title = "none"
string dataobject = "d_items"
boolean livescroll = true
end type

type cb_1 from commandbutton within w_datawindow_copy
integer x = 96
integer y = 272
integer width = 777
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Copy Using GetItem/SetItem"
end type

event clicked;Long			ll_Cnt,ll_New
Integer		li_Data
Date	ldt_Data

//SetPointer(HourGlass!)

// First, reset the destination DataWindow and turn redraw off
dw_dest.Reset()

il_Rows = dw_source.RowCount()
For ll_Cnt = 1 To il_Rows
	
	// Insert a blank row
	ll_New = dw_dest.InsertRow(0)
	
	// Copy data from the source DataWindow using GetItem...
	// And write it to the destination DataWindow using SetItem
	li_Data = dw_source.GetItemNumber(ll_Cnt, "id")
	dw_dest.SetItem(ll_New, "id", li_Data)
	
	li_Data = dw_source.GetItemNumber(ll_Cnt, "line_id")
	dw_dest.SetItem(ll_New, "line_id", li_Data)
	
	li_Data = dw_source.GetItemNumber(ll_Cnt, "prod_id")
	dw_dest.SetItem(ll_New, "prod_id", li_Data)
	
	li_Data = dw_source.GetItemNumber(ll_Cnt, "quantity")
	dw_dest.SetItem(ll_New, "quantity", li_Data)
	
	ldt_Data = dw_source.GetItemDate(ll_Cnt, "ship_date")
	dw_dest.SetItem(ll_New, "ship_date", ldt_Data)
	
	// Display Rows
	
	
Next

is_result += "Copy Using GetItem/SetItem Rows = " + String ( dw_dest.RowCount()) +"~r~n"
end event

type st_1 from statictext within w_datawindow_copy
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
string text = "DataWindow Copy Test"
boolean focusrectangle = false
end type

