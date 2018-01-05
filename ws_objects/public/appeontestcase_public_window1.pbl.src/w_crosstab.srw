$PBExportHeader$w_crosstab.srw
$PBExportComments$Enhanced crosstab tab window.
forward
global type w_crosstab from w_base_case
end type
type cb_1 from commandbutton within w_crosstab
end type
type st_2 from statictext within w_crosstab
end type
type st_status from statictext within w_crosstab
end type
type cb_change from commandbutton within w_crosstab
end type
type cb_help from commandbutton within w_crosstab
end type
type cb_print from commandbutton within w_crosstab
end type
type cb_close from commandbutton within w_crosstab
end type
type dw_1 from datawindow within w_crosstab
end type
end forward

global type w_crosstab from w_base_case
integer x = 87
integer y = 40
integer width = 2789
integer height = 1872
string title = "Enhanced Crosstab Reports"
windowstate windowstate = maximized!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
cb_1 cb_1
st_2 st_2
st_status st_status
cb_change cb_change
cb_help cb_help
cb_print cb_print
cb_close cb_close
dw_1 dw_1
end type
global w_crosstab w_crosstab

type prototypes

end prototypes

forward prototypes
public subroutine wf_change_xtab (ref datawindow adw_datawindow)
public subroutine of_testcase_point_module ()
end prototypes

public subroutine wf_change_xtab (ref datawindow adw_datawindow);// This function will dynamically change a crosstab to have a 
// more formatted appearance.

int li_column_count
int li_counter
int li_cur, li_next
string	ls_split
string 	ls_rc, ls_object, ls_return, ls_modstring
string 	ls_temp
string	ls_colname

//returns a list of all of the objects on the datawindow
ls_rc = adw_datawindow.Object.datawindow.objects

li_cur = 1
li_next = pos(ls_rc,'~t')

do until li_next = 0
	ls_object = mid(ls_rc,li_cur, li_next - li_cur)

//center text in the heading	
	If Lower(Left(adw_datawindow.describe(ls_object + ".Band"),6)) = "header"  Then
		ls_modstring = ls_modstring + ls_object + ".Alignment=2 " + &
			ls_object + ".Font.Weight=700 "
	End If

//format detail and total columns differently
	If adw_datawindow.describe(ls_object + ".Type") = "compute"  Then
		ls_temp = adw_datawindow.describe(ls_object + ".Expression")
		If pos(ls_temp,"sum") > 0 Then
			ls_modstring = ls_modstring + ls_object + ".Format='$#,##0' " 
		ElseIf pos(ls_temp,"count") > 0 Then 
			ls_modstring = ls_modstring + ls_object + ".Format='#,##0' " 
		End If
	ElseIf adw_datawindow.describe(ls_object + ".Type") = "column"  Then
		ls_temp = adw_datawindow.describe(ls_object + ".Coltype")
		If pos(ls_temp,"dec") > 0 Then
			ls_modstring = ls_modstring + ls_object + ".Format='$#,##0.00' " 
		ElseIf pos(ls_temp,"num") > 0 Then 
			ls_modstring = ls_modstring + ls_object + ".Format='#,##0.00' " 
		End If
	End If


//loop throgh all the objects on the datawindow
	li_cur = li_next + 1
	li_next = pos(ls_rc,'~t',li_cur)
loop
int li_min, li_x, li_rightside

////find where the crosstab 1st columns stops add a horizontal split bar
//	ls_temp = adw_datawindow.describe("datawindow.crosstab.rows")
//	li_cur = 1
//	li_next = pos(ls_temp,",")
//	li_min = -999
//	//go down through the columns, find the one with the right most ending.
//	do while li_next > 0
//		ls_colname = mid(ls_temp,li_cur,li_next - li_cur)
//		li_x = Integer(adw_datawindow.describe(ls_colname + ".X"))
//		li_rightside = li_x + Integer(adw_datawindow.describe(ls_colname + ".Width"))
//		If li_min < li_rightside Then 
//			ls_split = string (li_rightside)
//			li_min = li_rightside
//
//messagebox(" in loop max is",ls_split)
//		End If
//		li_cur = li_next + 1
//		li_next = pos(ls_temp,",",li_cur)
//	loop
//	
//	
//messagebox("out loop max is ",ls_split)
//
//	ls_modstring = ls_modstring + " Datawindow.HorizontalScrollSplit=" + ls_split
//	ls_modstring = ls_modstring + " Datawindow.HorizontalScrollPosition2=" + ls_split

	ls_return = adw_datawindow.Modify(ls_modstring)
	If ls_return <> "" Then messagebox("Display Change Err" + ls_return, ls_modstring)
	



end subroutine

public subroutine of_testcase_point_module ();Long ll_row, ll_rc
//set the transaction object
dw_1.settransobject(sqlca)

//retrieve the data
ll_row = dw_1.retrieve()
st_status.text = " Ready"

is_resultlog += wf_result_add("testcasepoint1", "Crosstab datawindow retrieved", ll_row > 0  )


// 由于弹出 以下对话窗口后无法通过代码关闭，所以无法测试 dw_1.crosstabdialog( )  功能点
//ll_rc = dw_1.crosstabdialog( )  
//is_resultlog += wf_result_add("testcasepoint1", "crosstabdialog function exec", ll_rc > 0  )


int li_column_count
int li_counter
int li_cur, li_next
string	ls_split
string 	ls_rc, ls_object, ls_return, ls_modstring
string 	ls_temp
string	ls_colname

//returns a list of all of the objects on the datawindow
ls_rc = dw_1.Object.datawindow.objects

li_cur = 1
li_next = pos(ls_rc,'~t')

do until li_next = 0
	ls_object = mid(ls_rc,li_cur, li_next - li_cur)

//center text in the heading	
	If Lower(Left(dw_1.describe(ls_object + ".Band"),6)) = "header"  Then
		ls_modstring = ls_modstring + ls_object + ".Alignment=2 " + &
			ls_object + ".Font.Weight=700 "
	End If

//format detail and total columns differently
	If dw_1.describe(ls_object + ".Type") = "compute"  Then
		ls_temp = dw_1.describe(ls_object + ".Expression")
		If pos(ls_temp,"sum") > 0 Then
			ls_modstring = ls_modstring + ls_object + ".Format='$#,##0' " 
		ElseIf pos(ls_temp,"count") > 0 Then 
			ls_modstring = ls_modstring + ls_object + ".Format='#,##0' " 
		End If
	ElseIf dw_1.describe(ls_object + ".Type") = "column"  Then
		ls_temp = dw_1.describe(ls_object + ".Coltype")
		If pos(ls_temp,"dec") > 0 Then
			ls_modstring = ls_modstring + ls_object + ".Format='$#,##0.00' " 
		ElseIf pos(ls_temp,"num") > 0 Then 
			ls_modstring = ls_modstring + ls_object + ".Format='#,##0.00' " 
		End If
	End If


//loop throgh all the objects on the datawindow
	li_cur = li_next + 1
	li_next = pos(ls_rc,'~t',li_cur)
loop
int li_min, li_x, li_rightside
ls_return = dw_1.Modify(ls_modstring)
is_resultlog += wf_result_add("testcasepoint1", "crosstab modify" +ls_return ,ls_return =""  )
end subroutine

on w_crosstab.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_2=create st_2
this.st_status=create st_status
this.cb_change=create cb_change
this.cb_help=create cb_help
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_status
this.Control[iCurrent+4]=this.cb_change
this.Control[iCurrent+5]=this.cb_help
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.dw_1
end on

on w_crosstab.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_status)
destroy(this.cb_change)
destroy(this.cb_help)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_1)
end on

type cb_1 from commandbutton within w_crosstab
integer x = 1586
integer y = 8
integer width = 608
integer height = 132
integer taborder = 10
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

type st_2 from statictext within w_crosstab
integer x = 55
integer y = 16
integer width = 247
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Status:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_status from statictext within w_crosstab
integer x = 311
integer y = 16
integer width = 1056
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = " Ready"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_change from commandbutton within w_crosstab
integer x = 631
integer y = 1568
integer width = 544
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Change Cross&tab"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_change
///////////////////////////////////////////////////////////////////////////////////////////////////

//bring up the standard dialog to dynamically change crosstab definition
dw_1.setredraw(false)
dw_1.crosstabdialog( )
wf_change_xtab(dw_1)
st_status.text = " Ready"
dw_1.setredraw(true)
end event

type cb_help from commandbutton within w_crosstab
integer x = 1989
integer y = 1568
integer width = 279
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_help
///////////////////////////////////////////////////////////////////////////////////////////////////

//f_open_help(parent.ClassName( ))
end event

type cb_print from commandbutton within w_crosstab
integer x = 1266
integer y = 1568
integer width = 279
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_print
///////////////////////////////////////////////////////////////////////////////////////////////////

//print datawindow
dw_1.print() 
end event

type cb_close from commandbutton within w_crosstab
integer x = 1623
integer y = 1568
integer width = 279
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////
// clicked script for cb_close
///////////////////////////////////////////////////////////////////////////////////////////////////

Close(parent)
end event

type dw_1 from datawindow within w_crosstab
event ue_messagetext pbm_dwnmessagetext
integer x = 9
integer y = 172
integer width = 2697
integer height = 1352
integer taborder = 10
string dataobject = "d_crosstab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_messagetext;///////////////////////////////////////////////////////////////////////////////////////////////////
// ue_MessageText script for dw_1
///////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////
//This event occurs each time the datawindow has a message to 
//display on status
///////////////////////////////////////////////////////////////////////////////////////////////////

setpointer(hourglass!)

st_status.text = " " + text

end event

event retrievestart;///////////////////////////////////////////////////////////////////////////////////////////////////
// RetrieveStart script for dw_1
///////////////////////////////////////////////////////////////////////////////////////////////////

setpointer(hourglass!)

//Disable buttons
cb_help.enabled = false
cb_close.enabled = false
cb_print.enabled = false
cb_change.enabled = false

//Display on-window status
st_status.text = " Retrieving Data..."

end event

event retrieveend;///////////////////////////////////////////////////////////////////////////////////////////////////
// RetrieveEnd script for dw_1
///////////////////////////////////////////////////////////////////////////////////////////////////

//Enable buttons
cb_help.enabled = true
cb_close.enabled = true
cb_print.enabled = true
cb_change.enabled = true
end event

