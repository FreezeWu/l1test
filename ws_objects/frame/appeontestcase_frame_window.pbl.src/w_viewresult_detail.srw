$PBExportHeader$w_viewresult_detail.srw
forward
global type w_viewresult_detail from w_base
end type
type cb_3 from commandbutton within w_viewresult_detail
end type
type cb_2 from commandbutton within w_viewresult_detail
end type
type cb_1 from commandbutton within w_viewresult_detail
end type
type dw_1 from datawindow within w_viewresult_detail
end type
end forward

global type w_viewresult_detail from w_base
integer width = 3323
integer height = 2416
string title = "Result-Detail"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_viewresult_detail w_viewresult_detail

type variables
string is_filter
end variables

on w_viewresult_detail.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_1
end on

on w_viewresult_detail.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;call super::open;string ls_exp[],ls_real[]
long ll_row,ll_count, ll_exp, ll_real
str_testcase_result lstr_1
String 	ls_String, ls_String2
Long 		ll_Find, ll_Row2

lstr_1 = message.powerobjectparm

ieon_resize.of_stringtoarray( lstr_1.s_exp, ls_exp, "~r~n")
ieon_resize.of_stringtoarray( lstr_1.s_real, ls_real, "~r~n")

ll_exp = upperbound(ls_exp)
ll_real = upperbound(ls_real)

for ll_row = 1 to ll_exp
	ll_count = dw_1.insertrow( 0 )	
	ls_String = MidA ( ls_exp[ll_row], 1, PosA ( ls_exp[ll_row], '=') - 1 )
	dw_1.setitem(ll_count,'s_exp',ls_exp[ll_row])
	
	//
	For ll_Row2 = ll_row To ll_real		
		ls_String2 =  MidA ( ls_real[ll_Row2], 1, PosA ( ls_real[ll_Row2], '=') - 1 )
		if trim(ls_String) = trim(ls_String2) Then
			dw_1.setitem(ll_count,'s_real',ls_real[ll_Row2])
			Exit
		End If		
	Next
	
	if trim(ls_String) <> trim(ls_String2) Then
		For ll_Row2 = 1 To Min( ll_row, ll_real)
			ls_String2 =  MidA ( ls_real[ll_Row2], 1, PosA ( ls_real[ll_Row2], '=') + 1 )
			if trim(ls_String) = trim(ls_String2) Then
				dw_1.setitem(ll_count,'s_real',ls_real[ll_Row2])
				Exit
			End If
		Next
	End If
	
next

for ll_row = 1 to ll_real
//	If Pos( ls_real[ll_row], '"') > 0 Then
		ll_Find = dw_1.Find ( 's_real="' + ls_real[ll_row] + '"', 1, dw_1.RowCount () )
//	ElseIf Pos( ls_real[ll_row], "'") > 0 Then
//		ll_Find = dw_1.Find ( "s_real='" + ls_real[ll_row] + "'", 1, dw_1.RowCount () )
//	Else
//		ll_Find = dw_1.Find ( "s_real='" + ls_real[ll_row] + "'", 1, dw_1.RowCount () )
//	End If
	If ll_Find = 0 Then
		ll_count = dw_1.insertrow( 0 )	
		dw_1.setitem(ll_count,'s_real',ls_real[ll_row])		
	End If
next




end event

type cb_3 from commandbutton within w_viewresult_detail
integer x = 576
integer y = 2184
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "showerror"
end type

event clicked;string ls_filter

if lower(this.text) = "showerror" then
	if len(is_filter) > 2 then
		ls_filter = is_filter+" and compute_1 = 'Failed'"
	else
		ls_filter = "compute_1 = 'Failed'"
	end if
	
	dw_1.setfilter( ls_filter)
	dw_1.filter( )
	this.text = "ShowAll"
else
	dw_1.setfilter( is_filter)
	dw_1.filter( )
	this.text = "ShowError"
end if
end event

type cb_2 from commandbutton within w_viewresult_detail
integer x = 1166
integer y = 2184
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Saveas"
end type

event clicked;dw_1.saveas()
end event

type cb_1 from commandbutton within w_viewresult_detail
integer x = 1755
integer y = 2184
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_viewresult_detail
integer width = 3305
integer height = 2168
integer taborder = 10
string title = "none"
string dataobject = "d_testcase_detail_result"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

