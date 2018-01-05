$PBExportHeader$w_sheet_mdi.srw
forward
global type w_sheet_mdi from window
end type
type mdi_1 from mdiclient within w_sheet_mdi
end type
end forward

global type w_sheet_mdi from window
integer width = 3959
integer height = 1724
boolean titlebar = true
string title = "MDIWindowType"
string menuname = "m_sheet_menu"
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
global w_sheet_mdi w_sheet_mdi

on w_sheet_mdi.create
if this.MenuName = "m_sheet_menu" then this.MenuID = create m_sheet_menu
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_sheet_mdi.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

type mdi_1 from mdiclient within w_sheet_mdi
long BackColor=268435456
end type

