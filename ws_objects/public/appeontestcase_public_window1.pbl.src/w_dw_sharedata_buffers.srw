$PBExportHeader$w_dw_sharedata_buffers.srw
forward
global type w_dw_sharedata_buffers from w_base_case
end type
type tab_emp from tab within w_dw_sharedata_buffers
end type
type tabpage_employment from userobject within tab_emp
end type
type dw_emp from datawindow within tabpage_employment
end type
type tabpage_employment from userobject within tab_emp
dw_emp dw_emp
end type
type tabpage_address from userobject within tab_emp
end type
type dw_addr from datawindow within tabpage_address
end type
type tabpage_address from userobject within tab_emp
dw_addr dw_addr
end type
type tab_emp from tab within w_dw_sharedata_buffers
tabpage_employment tabpage_employment
tabpage_address tabpage_address
end type
type cb_1 from commandbutton within w_dw_sharedata_buffers
end type
type dw_basic from datawindow within w_dw_sharedata_buffers
end type
end forward

global type w_dw_sharedata_buffers from w_base_case
integer width = 3136
integer height = 1984
tab_emp tab_emp
cb_1 cb_1
dw_basic dw_basic
end type
global w_dw_sharedata_buffers w_dw_sharedata_buffers

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();// Open script for w_empl_dw_share_buffers
integer li_ret

DataWindowChild	dwc

/****************************************************************
	Set Transaction Object ONLY for the primary DataWindow
 ***************************************************************/
dw_basic.SetTransObject (sqlca)

/****************************************************************
	Since the secondary DataWindows do not retrieve their
	DropDownDataWindows, do that now
 ***************************************************************/
tab_emp.tabpage_employment.dw_emp.GetChild ("dept_id", dwc)
dwc.SetTransObject (sqlca)
dwc.Retrieve ()

tab_emp.tabpage_address.dw_addr.GetChild ("state", dwc)
dwc.SetTransObject (sqlca)
dwc.Retrieve ()



// Share the optional datawindows
li_ret = dw_basic.ShareData (tab_emp.tabpage_address.dw_addr)
//if li_ret <> 1 then messagebox("Sharedata error","Error Sharing to address DW",exclamation!)
is_resultlog += wf_result_add("testcasepoint1", "Sharing to address DW", li_ret = 1 )

li_ret = dw_basic.ShareData (tab_emp.tabpage_employment.dw_emp)
//if li_ret <> 1 then messagebox("Sharedata error","Error Sharing employment DW",exclamation!)
is_resultlog += wf_result_add("testcasepoint1", "Sharing employment DW", li_ret = 1 )

/****************************************************************
	Now, go retrieve data in the primary DataWindow
 ***************************************************************/
dw_basic.Retrieve ()

is_resultlog += wf_result_add("testcasepoint1", "Sharedata", dw_basic.rowcount() = tab_emp.tabpage_address.dw_addr.rowcount() and dw_basic.rowcount() =tab_emp.tabpage_employment.dw_emp.rowcount() )

 tab_emp.tabpage_address.dw_addr.object.city[1] = "Appeon"
 tab_emp.tabpage_employment.dw_emp.object.manager_id[1] = 1000
 
 is_resultlog += wf_result_add("testcasepoint1", "Sharedata and change item ", dw_basic.object.city[1] = "Appeon" and dw_basic.object.manager_id[1] = 1000 )
 


end subroutine

on w_dw_sharedata_buffers.create
int iCurrent
call super::create
this.tab_emp=create tab_emp
this.cb_1=create cb_1
this.dw_basic=create dw_basic
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_emp
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_basic
end on

on w_dw_sharedata_buffers.destroy
call super::destroy
destroy(this.tab_emp)
destroy(this.cb_1)
destroy(this.dw_basic)
end on

type tab_emp from tab within w_dw_sharedata_buffers
integer x = 155
integer y = 632
integer width = 2501
integer height = 1224
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_employment tabpage_employment
tabpage_address tabpage_address
end type

on tab_emp.create
this.tabpage_employment=create tabpage_employment
this.tabpage_address=create tabpage_address
this.Control[]={this.tabpage_employment,&
this.tabpage_address}
end on

on tab_emp.destroy
destroy(this.tabpage_employment)
destroy(this.tabpage_address)
end on

type tabpage_employment from userobject within tab_emp
integer x = 18
integer y = 112
integer width = 2464
integer height = 1096
long backcolor = 67108864
string text = "Employment"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_emp dw_emp
end type

on tabpage_employment.create
this.dw_emp=create dw_emp
this.Control[]={this.dw_emp}
end on

on tabpage_employment.destroy
destroy(this.dw_emp)
end on

type dw_emp from datawindow within tabpage_employment
integer x = 101
integer y = 56
integer width = 1925
integer height = 936
integer taborder = 20
string dataobject = "d_empl_employment_data"
boolean border = false
boolean livescroll = true
end type

type tabpage_address from userobject within tab_emp
integer x = 18
integer y = 112
integer width = 2464
integer height = 1096
long backcolor = 67108864
string text = "Address"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_addr dw_addr
end type

on tabpage_address.create
this.dw_addr=create dw_addr
this.Control[]={this.dw_addr}
end on

on tabpage_address.destroy
destroy(this.dw_addr)
end on

type dw_addr from datawindow within tabpage_address
integer x = 128
integer y = 196
integer width = 1929
integer height = 472
integer taborder = 70
string dataobject = "d_empl_address_data"
boolean border = false
boolean livescroll = true
end type

type cb_1 from commandbutton within w_dw_sharedata_buffers
integer x = 2048
integer y = 68
integer width = 608
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Testcasepoint1"
end type

event clicked;of_testcase_point_module()
end event

type dw_basic from datawindow within w_dw_sharedata_buffers
integer x = 142
integer y = 88
integer width = 1193
integer height = 516
integer taborder = 10
string dataobject = "d_empl_basic_data"
boolean border = false
boolean livescroll = true
end type

