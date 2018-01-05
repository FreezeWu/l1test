$PBExportHeader$w_mdi_1614.srw
forward
global type w_mdi_1614 from window
end type
type mdi_1 from mdiclient within w_mdi_1614
end type
end forward

global type w_mdi_1614 from window
integer width = 3378
integer height = 1572
boolean titlebar = true
string title = "Untitled"
string menuname = "m_mdi_1528"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
end type
global w_mdi_1614 w_mdi_1614

forward prototypes
public subroutine of_handle2 (long al_whandle, long al_cbhandle, string as_parm)
public subroutine of_handle1 (long al_whandle, string as_parm)
end prototypes

public subroutine of_handle2 (long al_whandle, long al_cbhandle, string as_parm);//触发按钮的click事件
string ls_test
Send(al_whandle, 273, 0,al_cbhandle)

ls_test = as_parm
end subroutine

public subroutine of_handle1 (long al_whandle, string as_parm);//触发按钮的click事件
string ls_test
Send(al_whandle, 274, 61488, 0)

ls_test = as_parm
end subroutine

on w_mdi_1614.create
if this.MenuName = "m_mdi_1528" then this.MenuID = create m_mdi_1528
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_mdi_1614.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

type mdi_1 from mdiclient within w_mdi_1614
long BackColor=268435456
end type

