$PBExportHeader$w_f140a01_sample2.srw
forward
global type w_f140a01_sample2 from window
end type
type dw_1 from datawindow within w_f140a01_sample2
end type
end forward

global type w_f140a01_sample2 from window
integer width = 2533
integer height = 1408
boolean titlebar = true
string title = "w_sample"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
end type
global w_f140a01_sample2 w_f140a01_sample2

on w_f140a01_sample2.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_f140a01_sample2.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_f140a01_sample2
integer x = 123
integer y = 108
integer width = 1321
integer height = 736
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

