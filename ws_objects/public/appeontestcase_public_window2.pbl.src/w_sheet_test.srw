$PBExportHeader$w_sheet_test.srw
forward
global type w_sheet_test from window
end type
type mdi_1 from mdiclient within w_sheet_test
end type
end forward

global type w_sheet_test from window
integer width = 3566
integer height = 1724
boolean titlebar = true
string title = "Untitled"
string menuname = "m_opensheet"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
end type
global w_sheet_test w_sheet_test

on w_sheet_test.create
if this.MenuName = "m_opensheet" then this.MenuID = create m_opensheet
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_sheet_test.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event open;str_testcase lstr_testcase
m_opensheet PopMenu
boolean lb_case1[], lb_case2[], lb_case3[]

lstr_testcase = message.powerobjectparm

PopMenu = CREATE m_opensheet
PopMenu.triggerevent("clicked")


if This.ArrangeSheets(Tile!) = 1 and This.ArrangeSheets (TileHorizontal!) = 1 and This.ArrangeSheets(Layer!) = 1 &
   and This.ArrangeSheets(Cascade!) = 1 and This.ArrangeSheets(Icons!) = 1 then
	lb_case2[1] = true
	gw_setvalue.dynamic of_setvalue(4,lb_case2[])
end if
															
if this.SetMicroHelp("Opening Graph Sheets....") = 1 then
	lb_case3[1] = true
	gw_setvalue.dynamic of_setvalue(5,lb_case3[])
end if

w_opensheet_test.cb_1.triggerevent("clicked")
w_opensheet_test2.cb_1.triggerevent("clicked")
w_opensheet_test3.cb_1.triggerevent("clicked")

if OpenSheet(w_opensheet_test  , this, 2, original!) = 1 then
	lb_case1[1] = true
	gw_setvalue.dynamic of_setvalue(3,lb_case1[])
end if

w_opensheet_test.cb_1.triggerevent("clicked")

Close(This)
end event

type mdi_1 from mdiclient within w_sheet_test
long BackColor=268435456
end type

