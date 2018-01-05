$PBExportHeader$uo_cus_2.sru
forward
global type uo_cus_2 from userobject
end type
type cb_4 from uo_cb within uo_cus_2
end type
type st_2 from statictext within uo_cus_2
end type
type ddlb_1 from uo_ddlb_stringparm within uo_cus_2
end type
type st_1 from statictext within uo_cus_2
end type
type cb_3 from uo_cb within uo_cus_2
end type
type cb_2 from uo_cb within uo_cus_2
end type
type cb_1 from uo_cb within uo_cus_2
end type
type dw_1 from datawindow within uo_cus_2
end type
end forward

global type uo_cus_2 from userobject
integer width = 2555
integer height = 1044
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_4 cb_4
st_2 st_2
ddlb_1 ddlb_1
st_1 st_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global uo_cus_2 uo_cus_2

type variables
stru_dept  istr_1
end variables

on uo_cus_2.create
this.cb_4=create cb_4
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_4,&
this.st_2,&
this.ddlb_1,&
this.st_1,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on uo_cus_2.destroy
destroy(this.cb_4)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event constructor;ddlb_1.reset( )
long ll_count
istr_1 = message.powerobjectparm
st_2.text = istr_1.s_tile

for ll_count = 1 to upperbound(istr_1.l_dept)
	ddlb_1.additem( string(istr_1.l_dept[ll_count]))
next
dw_1.settransobject(sqlca)
istr_1.d_ds.sharedata( dw_1)

end event

type cb_4 from uo_cb within uo_cus_2
integer x = 9
integer y = 828
integer taborder = 60
string text = "close"
end type

event clicked;call super::clicked;closeuserobject(parent)
end event

type st_2 from statictext within uo_cus_2
integer x = 512
integer y = 8
integer width = 1307
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type ddlb_1 from uo_ddlb_stringparm within uo_cus_2
integer y = 124
integer width = 498
integer height = 504
integer taborder = 30
end type

event selectionchanged;call super::selectionchanged;long ll_id

ll_id = long(this.text(index))

dw_1.setfilter( "dept_id = "+string(ll_id))
dw_1.filter( )
end event

type st_1 from statictext within uo_cus_2
integer x = 50
integer y = 20
integer width = 315
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dep ID"
boolean focusrectangle = false
end type

type cb_3 from uo_cb within uo_cus_2
integer x = 9
integer y = 640
integer taborder = 50
string text = "update"
end type

event clicked;call super::clicked;dw_1.accepttext()

if dw_1.update() = 1 then
	commit;
	messagebox("Success","Update Success")
else
	messagebox("Failed","Update Failed : "+sqlca.sqlerrtext)
	rollback;
end if
end event

type cb_2 from uo_cb within uo_cus_2
integer x = 9
integer y = 460
integer taborder = 40
string text = "delete"
end type

event clicked;call super::clicked;long ll_row
ll_row = dw_1.getrow()

if ll_row = 0 then return

dw_1.deleterow(ll_row)
end event

type cb_1 from uo_cb within uo_cus_2
integer x = 9
integer y = 296
integer taborder = 30
string text = "insert"
end type

event clicked;call super::clicked;long ll_row
ll_row = dw_1.insertrow(0)
dw_1.scrolltorow(ll_row)
dw_1.setrow(ll_row)

closeuserobject(this)
end event

type dw_1 from datawindow within uo_cus_2
integer x = 507
integer y = 132
integer width = 2030
integer height = 900
integer taborder = 20
string title = "none"
string dataobject = "d_employer"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

