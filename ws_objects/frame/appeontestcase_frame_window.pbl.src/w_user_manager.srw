$PBExportHeader$w_user_manager.srw
forward
global type w_user_manager from w_base
end type
type cb_4 from commandbutton within w_user_manager
end type
type cb_3 from commandbutton within w_user_manager
end type
type cb_2 from commandbutton within w_user_manager
end type
type cb_1 from commandbutton within w_user_manager
end type
type dw_2 from datawindow within w_user_manager
end type
type dw_1 from datawindow within w_user_manager
end type
type gb_1 from groupbox within w_user_manager
end type
end forward

global type w_user_manager from w_base
integer width = 2994
integer height = 1620
string title = "用户信息维护"
windowstate windowstate = maximized!
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
end type
global w_user_manager w_user_manager

type variables
string is_passorg
end variables

forward prototypes
public subroutine wf_setenabled ()
end prototypes

public subroutine wf_setenabled ();choose case gi_rightmode
	case 1
		cb_1.enabled = true
		cb_2.enabled = true
		cb_3.enabled = true
		cb_4.enabled = true
	case else
		cb_1.enabled = false
		cb_2.enabled = false
		cb_3.enabled = false
		cb_4.enabled = false
end choose
	
end subroutine

on w_user_manager.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.dw_2
this.Control[iCurrent+6]=this.dw_1
this.Control[iCurrent+7]=this.gb_1
end on

on w_user_manager.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;dw_1.settransobject( sqlca)
dw_2.settransobject(sqlca)
dw_1.retrieve( )

end event

type cb_4 from commandbutton within w_user_manager
integer x = 2112
integer y = 1216
integer width = 457
integer height = 132
integer taborder = 40
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

type cb_3 from commandbutton within w_user_manager
integer x = 1467
integer y = 1208
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Delete"
end type

event clicked;long ll_row
string ls_name

ll_row = dw_1.getrow( )

if ll_row =  0 then 
	messagebox("Error","Please select one row")
	return
end if
ls_name = dw_1.getitemstring(ll_row,'username')
if messagebox("Question","Are you sure to delete "+ls_name+" ?",question!,yesno!,2) = 1 then
	dw_1.deleterow( ll_row )
	if dw_1.update( ) = 1 then
		commit;
	else
		messagebox("Failed","Delete user Failed : "+sqlca.sqlerrtext)
		rollback;
	end if
end if


end event

type cb_2 from commandbutton within w_user_manager
integer x = 2112
integer y = 984
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;dw_2.accepttext( )
string ls_pass
ls_pass = gf_simple_encode(is_passorg,'1')
dw_2.setitem(1,'userpass',ls_pass)
if dw_2.update( ) = 1 then
	commit;
	messagebox("Success","Save the user information success")
	dw_1.retrieve( )
	dw_1.setrow(dw_1.rowcount())
else
	messagebox("Failed","Save to database Failed : "+sqlca.sqlerrtext)
	rollback;
end if
end event

type cb_1 from commandbutton within w_user_manager
integer x = 1467
integer y = 992
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Insert"
end type

event clicked;long ll_id
dw_2.reset( )
dw_2.insertrow(0)
select max(userid) into :ll_id from t_user;
if isnull(ll_id) then 
	ll_id = 1
else
	ll_id = ll_id + 1
end if

dw_2.setitem(1,"userid",ll_id)
end event

type dw_2 from datawindow within w_user_manager
integer x = 1097
integer width = 1847
integer height = 812
integer taborder = 20
boolean titlebar = true
string title = "UserDetail"
string dataobject = "d_userform"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if lower(dwo.name) = 'userpass' then
	is_passorg = data
end if
end event

type dw_1 from datawindow within w_user_manager
integer width = 1097
integer height = 1512
integer taborder = 10
boolean titlebar = true
string title = "UserList"
string dataobject = "d_userlist"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_id
if  currentrow = 0 then return

ll_id = this.getitemnumber(currentrow,'userid')

dw_2.retrieve(ll_id)
end event

event clicked;this.selectrow(0,false)
this.selectrow(row,true)
end event

type gb_1 from groupbox within w_user_manager
integer x = 1093
integer y = 820
integer width = 1851
integer height = 696
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operation"
end type

