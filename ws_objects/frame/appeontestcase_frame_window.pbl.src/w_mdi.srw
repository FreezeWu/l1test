$PBExportHeader$w_mdi.srw
forward
global type w_mdi from window
end type
type mdi_1 from mdiclient within w_mdi
end type
end forward

global type w_mdi from window
integer width = 3378
integer height = 1720
boolean titlebar = true
string title = "Appeon L1 TestCase"
string menuname = "m_mdi"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
end type
global w_mdi w_mdi

on w_mdi.create
if this.MenuName = "m_mdi" then this.MenuID = create m_mdi
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_mdi.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event open;// --------  打开登录窗口，记录登录信息

open(w_login)
//modified by zhoujunwei at 2017-11-29 执行权限无法操作manager
this.menuid.function dynamic of_setenable()
if gi_rightmode = 3 then
	opensheet(w_controller,this,0,original!)
end if
end event

type mdi_1 from mdiclient within w_mdi
long BackColor=268435456
end type

