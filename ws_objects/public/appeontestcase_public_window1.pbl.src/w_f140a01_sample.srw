$PBExportHeader$w_f140a01_sample.srw
forward
global type w_f140a01_sample from window
end type
type uo_1 from u_cst_1 within w_f140a01_sample
end type
end forward

global type w_f140a01_sample from window
integer width = 2533
integer height = 1408
boolean titlebar = true
string title = "w_sample"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
uo_1 uo_1
end type
global w_f140a01_sample w_f140a01_sample

on w_f140a01_sample.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on w_f140a01_sample.destroy
destroy(this.uo_1)
end on

type uo_1 from u_cst_1 within w_f140a01_sample
integer x = 343
integer y = 216
integer taborder = 30
end type

on uo_1.destroy
call u_cst_1::destroy
end on

