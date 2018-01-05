$PBExportHeader$w_system_event.srw
$PBExportComments$Drag-and-drop to change Employee Status
forward
global type w_system_event from w_base_case
end type
type dw_3 from datawindow within w_system_event
end type
type tv_1 from treeview within w_system_event
end type
type dw_2 from datawindow within w_system_event
end type
type dw_1 from datawindow within w_system_event
end type
end forward

global type w_system_event from w_base_case
integer width = 2935
event ue_buttondown pbm_lbuttondown
event ue_buttonup pbm_lbuttonup
dw_3 dw_3
tv_1 tv_1
dw_2 dw_2
dw_1 dw_1
end type
global w_system_event w_system_event

type prototypes
Function boolean SetCursorPos(int cx, int cy) LIBRARY  "User32.dll" 
Subroutine mouse_event(Ulong dwflag, Ulong dx, Ulong dy, Ulong cbutton, Ulong dwextra) LIBRARY "user32.dll" 
end prototypes

type variables
boolean ib_rowchange,ib_rowchange_row
boolean ib_buttondown,ib_buttondown_flags,ib_buttondown_xpos,ib_buttondown_ypos
boolean ib_buttonup,ib_buttonup_flags,ib_buttonup_xpos,ib_buttonup_ypos
boolean ib_mousemove,ib_mousemove_flags,ib_mousemove_xpos,ib_mousemove_ypos
boolean ib_dragdrop,ib_dragdrop_source,ib_dragdrop_row,ib_dragdrop_dwo
boolean ib_dragenter,ib_dragenter_source
boolean ib_dragleave,ib_dragleave_source

boolean ib_tv_begindrag,ib_tv_begindrag_handle
boolean ib_tv_dragdrop,ib_tv_dragdrop_handle,ib_tv_dragdrop_source
boolean ib_tv_dragwithin,ib_tv_dragwithin_handle,ib_tv_dragwithin_source
boolean ib_tv_itempopulate,ib_tv_itempopulate_handle

int   ii_row,ii_start,ii_end
end variables

forward prototypes
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
public subroutine of_testcase_point_module4 ()
end prototypes

public subroutine of_testcase_point_module1 ();//测试DW的拖拽事件触发
long ll_x,ll_y
boolean lb_mouse

//this.windowstate = maximized!
//ib_mousemove = false 
//dw_1.Drag (begin!)
//
//
//ll_x = ( dw_2.x + dw_2.Width/2)
//ll_y = ( dw_2.y + dw_2.Height/2 + 100)
//ll_x = unitstopixels(ll_x, xunitstopixels!)
//ll_y = unitstopixels(ll_y, yunitstopixels!)
//lb_mouse = setcursorpos(ll_x, ll_y)
//sleep(0.6)

unsignedlong  ll_flags
int li_x,li_y
ll_flags = 0 
li_x = 20
li_y = 40
dw_1.event ue_mousemove(ll_flags,li_x,li_y)


is_resultlog += wf_result_add("testcasepoint4", "pbm_mousemove,Parameter flags&xpos&ypos", &
		                                    ib_mousemove = true and ib_mousemove_flags = true &
										and ib_mousemove_xpos = true and ib_mousemove_ypos =true)


   
end subroutine

public subroutine of_testcase_point_module ();//测试DW的拖拽事件触发
long ll_x,ll_y
boolean lb_mouse
ulong MOUSEEVENTF_LEFTDOWN, MOUSEEVENTF_LEFTUP

long ll_row

unsignedlong  ll_flags
int li_x,li_y
ll_flags = 0 
li_x = 20
li_y = 40

//this.visible = true
//this.windowstate = maximized!
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_1.retrieve()
dw_1.SelectRow(2,True)

ll_row = 2
dw_1.event rowfocuschanged(ll_row)

is_resultlog += wf_result_add("testcasepoint1", "pbm_rowchange,Parameter row", &
                                             ib_rowchange = true)

//ll_x = ( dw_1.x + dw_1.Width/2)
//ll_y = ( dw_1.y + dw_1.Height/2 + 100)
//ll_x = unitstopixels(ll_x, xunitstopixels!)   
//ll_y = unitstopixels(ll_y, yunitstopixels!)
//lb_mouse = setcursorpos(ll_x, ll_y)
//sleep(0.6)
//
////MOUSEEVENTF_MOVE = 1 MOUSEEVENTF_LEFTDOWN = 2  MOUSEEVENTF_LEFTUP = 4    MOUSEEVENTF_CLICKED = 7
//MOUSEEVENTF_LEFTDOWN = 2
//mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)  
//sleep(0.6)


dw_1.event ue_buttondown(ll_flags,li_x,li_y)

is_resultlog += wf_result_add("testcasepoint2", "pbm_lbuttondown,Parameter flags&xpos&ypos", &
		                                    ib_buttondown = true and ib_buttondown_flags = true &
										and ib_buttondown_xpos = true and ib_buttondown_ypos =true)


//MOUSEEVENTF_LEFTUP = 4
//mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)   
//sleep(0.6)

dw_1.event ue_buttonup(ll_flags,li_x,li_y)

is_resultlog += wf_result_add("testcasepoint3", "pbm_lbuttonup,Parameter flags&xpos&ypos", &
		                                    ib_buttonup = true and ib_buttonup_flags = true &
									    and ib_buttonup_xpos = true and ib_buttonup_ypos =true)





end subroutine

public subroutine of_testcase_point_module2 ();//测试DW的拖拽事件触发
//long ll_x,ll_y
//ulong MOUSEEVENTF_LEFTUP
DragObject	ldo_control
dwobject ld_dwo
long ll_row

//this.windowstate = maximized!

//MOUSEEVENTF_MOVE = 1 MOUSEEVENTF_LEFTDOWN = 2  MOUSEEVENTF_LEFTUP = 4    MOUSEEVENTF_CLICKED = 7
//MOUSEEVENTF_LEFTUP = 4
//mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)  
//sleep(0.6)

string ls_fname
dwobject ldwo_column


ldo_control = dw_1
ll_row = 2
ldwo_column = dw_1.object.#1

dw_2.event dragdrop(ldo_control,ll_row,ldwo_column)
dw_2.event dragenter(ldo_control)
dw_2.event dragleave(ldo_control)

//
is_resultlog += wf_result_add("testcasepoint5", "pbm_dragdrop,Parameter source&row&dwo", &
		                                   ib_dragdrop = true and ib_dragdrop_source = true &
									    and ib_dragdrop_row = true and ib_dragdrop_dwo =true)

//
is_resultlog += wf_result_add("testcasepoint6", "pbm_dragenter,Parameter source", &
		                                    ib_dragenter = true and ib_dragenter_source = true)

//
is_resultlog += wf_result_add("testcasepoint7", "pbm_dragleave,Parameter source", &
		                                    ib_dragleave = true and ib_dragleave_source = true)


yield()



	
end subroutine

public subroutine of_testcase_point_module3 ();//测试TreeView的拖拽事件触发
long ll_handle
DragObject	ldo_control

ldo_control = dw_1
ll_handle = 101214

//
tv_1.event begindrag(ll_handle)
is_resultlog += wf_result_add("testcasepoint8", "pbm_tvnbegindrag,Parameter handle", &
		                                   ib_tv_begindrag = true and ib_tv_begindrag_handle =true)

//
tv_1.event dragdrop(ldo_control ,ll_handle)
is_resultlog += wf_result_add("testcasepoint9", "pbm_tvndragdrop,Parameter source&handle", &
		                                   ib_tv_dragdrop = true and ib_tv_dragdrop_handle =true and ib_tv_dragdrop_source = true)

//
tv_1.event dragwithin(ldo_control ,ll_handle)
is_resultlog += wf_result_add("testcasepoint10", "pbm_tvndragwithin,Parameter source&handle", &
		                                   ib_tv_dragwithin = true and ib_tv_dragwithin_handle =true and ib_tv_dragwithin_source = true)

//
tv_1.event itempopulate(ll_handle)
is_resultlog += wf_result_add("testcasepoint11", "pbm_tvnitempopulate,Parameter handle", &
		                                   ib_tv_itempopulate = true and ib_tv_itempopulate_handle =true)





end subroutine

public subroutine of_testcase_point_module4 ();//测试dw检索时的三个事件pbm_dwnretrievestart, pbm_dwnretrieverow, pbm_dwnretrieveend

long ll_row

dw_3.settransobject(sqlca)
ll_row = dw_3.retrieve()

is_resultlog += wf_result_add("testcasepoint12", "pbm_dwnretrievestart", &
	                                         ii_start = 1)

is_resultlog += wf_result_add("testcasepoint13", "pbm_dwnretrieverow", &
	                                         ii_row = 16)

is_resultlog += wf_result_add("testcasepoint14", "pbm_dwnretrieveend", &
	                                         ii_end = 2)












end subroutine

on w_system_event.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.tv_1=create tv_1
this.dw_2=create dw_2
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.tv_1
this.Control[iCurrent+3]=this.dw_2
this.Control[iCurrent+4]=this.dw_1
end on

on w_system_event.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.tv_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

type dw_3 from datawindow within w_system_event
integer x = 123
integer y = 1128
integer width = 686
integer height = 400
integer taborder = 40
string title = "none"
string dataobject = "d_total_customer_orders"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrievestart;//
ii_start++
end event

event retrieveend;//
ii_end = ii_start + 1
end event

event retrieverow;//
ii_row++
end event

type tv_1 from treeview within w_system_event
integer x = 1915
integer y = 92
integer width = 768
integer height = 896
integer taborder = 30
boolean dragauto = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event begindrag;
ib_tv_begindrag = true

if handle = 101214 then
	ib_tv_begindrag_handle = true
end if
end event

event dragdrop;
ib_tv_dragdrop = true

if source = dw_1 and handle = 101214 then
	ib_tv_dragdrop_handle = true
	ib_tv_dragdrop_source = true
end if
end event

event dragwithin;
ib_tv_dragwithin = true 

if source = dw_1 and handle = 101214 then
	ib_tv_dragwithin_handle = true
	ib_tv_dragwithin_source = true
end if
end event

event itempopulate;
ib_tv_itempopulate = true

if handle = 101214 then
	ib_tv_itempopulate_handle = true
end if
end event

type dw_2 from datawindow within w_system_event
event ue_lbuttonup pbm_lbuttonup
integer x = 992
integer y = 56
integer width = 750
integer height = 936
integer taborder = 20
string dragicon = "Information!"
string title = "none"
string dataobject = "dw_dragdrop_dwdown"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_lbuttonup;//
end event

event dragdrop;DragObject	ldo_control
long ll_row
string ls_fname


ib_dragdrop = true

ldo_control = source// DraggedObject()

if ldo_control = dw_1 then
   ib_dragdrop_source = true
end if

if row = 2 then
	ib_dragdrop_row = true
end if

if dwo.name = 'fproname' then
	ib_dragdrop_dwo = true
end if 






	
end event

event dragleave;DragObject	ldo_control

// Get the dragged object.
ldo_control = source

ib_dragleave = true

if ldo_control = dw_1 then
   ib_dragleave_source = true
end if 

end event

event dragenter;DragObject	ldo_control

// Get the dragged object.
ldo_control = source

ib_dragenter = true

if ldo_control = dw_1 then
   ib_dragenter_source = true
end if 

end event

type dw_1 from datawindow within w_system_event
event ue_buttonup pbm_lbuttonup
event ue_buttondown pbm_lbuttonup
event ue_mousemove pbm_mousemove
integer x = 55
integer y = 32
integer width = 859
integer height = 988
integer taborder = 10
string dragicon = "Information!"
string title = "none"
string dataobject = "dw_dragdrop_dwup"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_buttonup;ib_buttonup = true


if flags = 0 then
	ib_buttonup_flags = true
end if

if xpos = 20  then
	ib_buttonup_xpos = true 
end if

if ypos=40  then
     ib_buttonup_ypos = true
end if
end event

event ue_buttondown;ib_buttondown = true


if flags = 0 then
	ib_buttondown_flags = true
end if

if xpos = 20  then
	ib_buttondown_xpos = true 
end if

if ypos=40  then
	ib_buttondown_ypos = true
end if
end event

event ue_mousemove;ib_mousemove = true


if flags = 0 then
	ib_mousemove_flags = true
end if

if xpos = 20  then
	ib_mousemove_xpos = true 
end if

if ypos=40  then
	ib_mousemove_ypos = true
end if
end event

event rowfocuschanged;ib_rowchange = true

if currentrow = 2 then
	ib_rowchange_row = true
end if
end event

