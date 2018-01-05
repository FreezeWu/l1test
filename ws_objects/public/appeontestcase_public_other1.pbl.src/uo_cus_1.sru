$PBExportHeader$uo_cus_1.sru
forward
global type uo_cus_1 from userobject
end type
type lv_1 from uo_listview within uo_cus_1
end type
type p_1 from uo_pic within uo_cus_1
end type
type dp_1 from uo_dp within uo_cus_1
end type
type cbx_1 from uo_cbx within uo_cus_1
end type
type cb_1 from uo_cb within uo_cus_1
end type
type hpb_1 from uo_hsb within uo_cus_1
end type
type gb_1 from uo_gb within uo_cus_1
end type
end forward

global type uo_cus_1 from userobject
integer width = 1627
integer height = 1004
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
lv_1 lv_1
p_1 p_1
dp_1 dp_1
cbx_1 cbx_1
cb_1 cb_1
hpb_1 hpb_1
gb_1 gb_1
end type
global uo_cus_1 uo_cus_1

on uo_cus_1.create
this.lv_1=create lv_1
this.p_1=create p_1
this.dp_1=create dp_1
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.hpb_1=create hpb_1
this.gb_1=create gb_1
this.Control[]={this.lv_1,&
this.p_1,&
this.dp_1,&
this.cbx_1,&
this.cb_1,&
this.hpb_1,&
this.gb_1}
end on

on uo_cus_1.destroy
destroy(this.lv_1)
destroy(this.p_1)
destroy(this.dp_1)
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.hpb_1)
destroy(this.gb_1)
end on

event constructor;uo_em lem
this.openuserobject(lem,90,500)
lem.bringtotop = true
end event

type lv_1 from uo_listview within uo_cus_1
integer x = 50
integer y = 720
integer width = 517
integer height = 252
integer taborder = 30
string item[] = {"listview"}
integer itempictureindex[] = {1}
string largepicturename[] = {"Application5!"}
end type

type p_1 from uo_pic within uo_cus_1
integer x = 864
integer y = 408
integer width = 677
integer height = 568
boolean originalsize = false
end type

type dp_1 from uo_dp within uo_cus_1
integer x = 864
integer y = 236
integer taborder = 30
datetime value = DateTime(Date("2015-12-26"), Time("09:52:41.000000"))
integer calendarfontweight = 400
end type

type cbx_1 from uo_cbx within uo_cus_1
integer x = 905
integer y = 108
end type

type cb_1 from uo_cb within uo_cus_1
integer x = 59
integer y = 336
integer taborder = 20
string text = "open"
end type

event clicked;call super::clicked;parent.openuserobject( uo_shy)

uo_shy.bringtotop = true
end event

type hpb_1 from uo_hsb within uo_cus_1
integer x = 32
integer y = 128
end type

type gb_1 from uo_gb within uo_cus_1
integer width = 1632
integer height = 1048
integer taborder = 10
end type

