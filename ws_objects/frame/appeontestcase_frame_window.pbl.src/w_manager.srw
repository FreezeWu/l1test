$PBExportHeader$w_manager.srw
forward
global type w_manager from w_base
end type
type cbx_3 from checkbox within w_manager
end type
type cbx_2 from checkbox within w_manager
end type
type cbx_1 from checkbox within w_manager
end type
type cb_3 from commandbutton within w_manager
end type
type cb_2 from commandbutton within w_manager
end type
type cb_1 from commandbutton within w_manager
end type
type tv_1 from treeview within w_manager
end type
type gb_1 from groupbox within w_manager
end type
type dw_1 from datawindow within w_manager
end type
end forward

global type w_manager from w_base
integer width = 3950
integer height = 2708
string title = "TestCase Maintanace"
windowstate windowstate = maximized!
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
tv_1 tv_1
gb_1 gb_1
dw_1 dw_1
end type
global w_manager w_manager

type variables
long il_currenthandle

boolean ib_modify
end variables

forward prototypes
public subroutine wf_setenabled ()
public subroutine wf_ini_treeview ()
public subroutine wf_insertitem (string as_testcaseid, string as_testcasename)
end prototypes

public subroutine wf_setenabled ();if gi_rightmode = 3 then
	cb_1.enabled = false
	cb_2.enabled = false
end if
end subroutine

public subroutine wf_ini_treeview ();// 构建treeview数据
treeviewitem ltrv_1,ltrv_2
string ls_testcasename,ls_testcaseid
long ll_handle1,ll_handle2,ll_count1,ll_count2,ll_step1,ll_step2
datastore lds_1,lds_2
lds_1 = create datastore
lds_1.dataobject = "d_testcase_list"
lds_1.settransobject( sqlca)
lds_1.retrieve( )
lds_2 = create datastore
lds_2.dataobject = "d_testcase_list"
lds_2.settransobject( sqlca)
lds_2.retrieve( )

lds_1.setfilter("parentid = '0'")
lds_1.filter( )

for ll_step1 = 1 to lds_1.rowcount()
	ls_testcasename = lds_1.getitemstring(ll_step1,"testcasename")
	ls_testcaseid = lds_1.getitemstring(ll_step1,"testcaseid")
	ltrv_1.label = ls_testcasename
	ltrv_1.data = ls_testcaseid
	ll_handle1 = tv_1.insertitemlast(0,ltrv_1)
	lds_2.setfilter( "parentid = '"+ls_testcaseid+"'")
	lds_2.filter( )
	for ll_step2 = 1 to lds_2.rowcount( )
		ls_testcasename = lds_2.getitemstring(ll_step2,"testcasename")
		ls_testcaseid = lds_2.getitemstring(ll_step2,"testcaseid")
		ltrv_2.label = ls_testcasename
		ltrv_2.data = ls_testcaseid
		ll_handle2 = tv_1.insertitemlast(ll_handle1,ltrv_2)
	next
next

destroy lds_1
destroy lds_2
end subroutine

public subroutine wf_insertitem (string as_testcaseid, string as_testcasename);treeviewitem ltrv_1,ltrv_data
long ll_handle,ll_parent
ltrv_data.data = as_testcaseid
ltrv_data.label = as_testcasename
if il_currenthandle <> 0 then
	tv_1.getitem(il_currenthandle,ltrv_1)
	if ltrv_1.level = 1 then
		ll_handle = tv_1.insertitemlast(il_currenthandle,ltrv_data)
	else
		ll_parent = tv_1.finditem( parenttreeitem!, il_currenthandle)
		ll_handle = tv_1.insertitem( ll_parent, il_currenthandle,ltrv_data)
	end if
else
	ll_handle = tv_1.insertitemlast(0,ltrv_data)
end if

tv_1.selectitem( ll_handle )
end subroutine

on w_manager.create
int iCurrent
call super::create
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.tv_1=create tv_1
this.gb_1=create gb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_3
this.Control[iCurrent+2]=this.cbx_2
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.tv_1
this.Control[iCurrent+8]=this.gb_1
this.Control[iCurrent+9]=this.dw_1
end on

on w_manager.destroy
call super::destroy
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.tv_1)
destroy(this.gb_1)
destroy(this.dw_1)
end on

event open;call super::open;wf_ini_treeview()


//设置权限
//added by zhoujunwei at 2017-11-29
string ls_view
ls_view = message.stringparm
if ls_view = 'view' then
	cb_1.enabled = false
	cb_2.enabled = false
else
	cb_1.enabled = true
	cb_2.enabled = true
end if
end event

type cbx_3 from checkbox within w_manager
integer x = 2647
integer y = 2208
integer width = 457
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "PB"
boolean checked = true
end type

type cbx_2 from checkbox within w_manager
integer x = 2171
integer y = 2208
integer width = 457
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "mobile"
end type

type cbx_1 from checkbox within w_manager
integer x = 1728
integer y = 2208
integer width = 434
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "web"
end type

type cb_3 from commandbutton within w_manager
integer x = 2953
integer y = 2380
integer width = 457
integer height = 132
integer taborder = 60
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

type cb_2 from commandbutton within w_manager
integer x = 2313
integer y = 2380
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Save"
end type

event clicked;string ls_web,ls_mobile,ls_pb,ls_run
string ls_testcaseid,ls_testcasename,ls_modify,ls_error
setpointer(hourglass!)

dw_1.accepttext( )
if cbx_1.checked then
	ls_web= '1'
else
	ls_web = '0'
end if
if cbx_2.checked then
	ls_mobile= '1'
else
	ls_mobile = '0'
end if
if cbx_3.checked then
	ls_pb= '1'
else
	ls_pb = '0'
end if
ls_run = ls_web+ls_mobile+ls_pb+"00"
dw_1.setitem(1,"runmode",ls_run)
if dw_1.update( ) = 1 then
	commit;
	ls_testcaseid = dw_1.getitemstring(1,"testcaseid")
	ls_testcasename = dw_1.getitemstring(1,"testcasename")
	if not ib_modify then
		wf_insertitem(ls_testcaseid,ls_testcasename)
	end if
	messagebox("Success","Save the testcase success")
	//还原modify之前的状态
	ib_modify = false
	cbx_1.enabled = false
	cbx_2.enabled = false
	cbx_3.enabled = false
	if dw_1.dataobject = "d_testcase_view" then
		ls_modify = "testcasename.protect='1'"
		ls_modify += "windowname.protect='1'"
		ls_modify += " description.protect='1'"
		ls_modify += " expectvalue.protect='1'"
		ls_modify += " realvalue.protect='1'"
		ls_modify += " l1flag.protect='1'"
	else
		ls_modify = "testcasename.protect='1'"
		ls_modify += " description.protect='1'"
		ls_modify += " l1flag.protect='1'"
	end if
	
	ls_error = dw_1.modify( ls_modify)
	
	if len(trim(ls_error)) > 0 then
		messagebox("Error",ls_error)
		return
	end if
else
	messagebox("Error","Save the testcase failed : "+sqlca.sqlerrtext)
	rollback;
end if













setpointer(arrow!)
end event

type cb_1 from commandbutton within w_manager
integer x = 1641
integer y = 2380
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Modify"
end type

event clicked;// 修改可改变列

string ls_modify,ls_error
if dw_1.dataobject = "d_testcase_view"  then
	ls_modify = "testcasename.protect='0'"
	ls_modify += " windowname.protect='0'"
	ls_modify += " description.protect='0'"
	ls_modify += " expectvalue.protect='0'"
	ls_modify += " realvalue.protect='0'"
	ls_modify += " l1flag.protect='0'"
else
	ls_modify = "testcasename.protect='0'"
	ls_modify += " description.protect='0'"
	ls_modify += " l1flag.protect='0'"
end if

ls_error = dw_1.modify( ls_modify)

if len(trim(ls_error)) > 0 then
	messagebox("Error",ls_error)
	return
end if
cbx_1.enabled = true
cbx_2.enabled = true
cbx_3.enabled = true
ib_modify = true
end event

type tv_1 from treeview within w_manager
integer x = 18
integer y = 16
integer width = 1230
integer height = 2580
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
grsorttype sorttype = ascending!
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event selectionchanged;//查看测试点信息
treeviewitem ltrv_1,ltrv_2
string ls_testcaseid
string ls_runmode

il_currenthandle = newhandle				// add it

this.getitem( newhandle, ltrv_1)
ls_testcaseid = string(ltrv_1.data)


if ltrv_1.level = 1 then
	dw_1.reset( )
	dw_1.dataobject = "d_testcase_view_parent"
	dw_1.settransobject(sqlca)
	dw_1.retrieve(ls_testcaseid)
	if dw_1.rowcount( ) > 0 then
		ls_runmode = dw_1.getitemstring(1,"runmode")
		if left(ls_runmode,1) = '1' then
			cbx_1.checked = true
		else
			cbx_1.checked = false
		end if
		if mid(ls_runmode,2,1) = '1' then
			cbx_2.checked = true
		else
			cbx_2.checked = false
		end if
		if mid(ls_runmode,3,1) = '1' then
			cbx_3.checked = true
		else
			cbx_3.checked = false
		end if
	end if
else
	dw_1.reset( )
	dw_1.dataobject = "d_testcase_view"
	dw_1.settransobject(sqlca)
	dw_1.retrieve(ls_testcaseid)
	if dw_1.rowcount( ) > 0 then
		ls_runmode = dw_1.getitemstring(1,"runmode")
		if left(ls_runmode,1) = '1' then
			cbx_1.checked = true
		else
			cbx_1.checked = false
		end if
		if mid(ls_runmode,2,1) = '1' then
			cbx_2.checked = true
		else
			cbx_2.checked = false
		end if
		if mid(ls_runmode,3,1) = '1' then
			cbx_3.checked = true
		else
			cbx_3.checked = false
		end if
	end if
end if
end event

event rightclicked;//
treeviewitem ltrv_1
string ls_testcaseid
long ll_handle
long ll_id
m_popup  lm_pop
lm_pop = create m_popup

if isnull(il_currenthandle) or il_currenthandle <> handle then this.event selectionchanged(il_currenthandle , handle)
cbx_1.enabled = true
cbx_2.enabled = true
cbx_3.enabled = true
dw_1.accepttext( ) 					// add it 
//select max(cast(testcaseid as integer)) into :ll_id from t_testcase;
il_currenthandle = handle
lm_pop.of_setparm(handle,this,dw_1)
lm_pop.popmenu( parent.pointerx(), parent.pointery())







end event

type gb_1 from groupbox within w_manager
integer x = 1257
integer y = 2108
integer width = 2651
integer height = 488
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operate"
end type

type dw_1 from datawindow within w_manager
integer x = 1253
integer y = 16
integer width = 2661
integer height = 2080
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_testcase_insert"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

