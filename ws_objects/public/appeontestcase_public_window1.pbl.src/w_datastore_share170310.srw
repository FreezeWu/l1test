$PBExportHeader$w_datastore_share170310.srw
$PBExportComments$Window showing a DataWindow sharing data with DataStores
forward
global type w_datastore_share170310 from w_base_case
end type
type mle_inst from multilineedit within w_datastore_share170310
end type
type rb_4 from radiobutton within w_datastore_share170310
end type
type rb_3 from radiobutton within w_datastore_share170310
end type
type rb_2 from radiobutton within w_datastore_share170310
end type
type rb_1 from radiobutton within w_datastore_share170310
end type
type cb_close from commandbutton within w_datastore_share170310
end type
type dw_1 from datawindow within w_datastore_share170310
end type
type gb_1 from groupbox within w_datastore_share170310
end type
end forward

global type w_datastore_share170310 from w_base_case
integer x = 5
integer y = 64
integer width = 3438
integer height = 1420
string title = "Share Data With DataStores"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen ( )
mle_inst mle_inst
rb_4 rb_4
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
cb_close cb_close
dw_1 dw_1
gb_1 gb_1
end type
global w_datastore_share170310 w_datastore_share170310

type variables
DataStore	ids_1, ids_2, ids_3, ids_4
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
end prototypes

public subroutine of_testcase_point_module ();long ll_ds_count, ll_dw_count, ll_rc

ids_1.SetTransObject(sqlca)
ids_1.Retrieve()




dw_1.DataObject = ids_1.DataObject

ll_rc = ids_1.ShareData(dw_1)
ll_ds_count = ids_1.rowcount()
ll_dw_count = dw_1.rowcount()
//is_resultlog += wf_result_add("testcasepoint1", "d_compute_in_attribute170310 source rows:" + string(ll_ds_count) +";destination rows:" +string(ll_dw_count) +", Sharedata ", ll_ds_count = ll_dw_count and ll_rc =1)
is_resultlog += wf_result_add("testcasepoint1", "d_compute_in_attribute170310 sharedata" , ll_ds_count = ll_dw_count and ll_rc =1)

// 测试datastore数据修改时,datawindow是否也会修改
string ls_name, ls_name_w
double ld_salary, ld_salary_w
ls_name = "Appeon_ds"
ld_salary = 1999.99
ids_1.setitem(1, "employee_emp_lname", ls_name)
ids_1.setitem(1, "employee_salary", ld_salary)

ls_name = ids_1.getitemstring(1, "employee_emp_lname")
ls_name_w = dw_1.getitemstring(1, "employee_emp_lname")

ld_salary = ids_1.getitemnumber(1, "employee_salary")
ld_salary_w = dw_1.getitemnumber(1, "employee_salary")

//is_resultlog += wf_result_add("testcasepoint1", "Datastore name value:" + ls_name + ";salary value;" + string(ld_salary)+ ", Datawindow name value:" + ls_name_w + ";salary value;" + string(ld_salary_w),  ls_name = ls_name_w and ld_salary = ld_salary_w)
is_resultlog += wf_result_add("testcasepoint1", "Change Datastore to Datawindow",  ls_name = ls_name_w and ld_salary = ld_salary_w)


// 测试,datawindow数据修改时,datastore是否也会修改
ls_name = "Appeon_dw"
ld_salary = 9999.00
dw_1.setitem(1, "employee_emp_lname", ls_name)
dw_1.setitem(1, "employee_salary", ld_salary)

ls_name = ids_1.getitemstring(1, "employee_emp_lname")
ls_name_w = dw_1.getitemstring(1, "employee_emp_lname")

ld_salary = ids_1.getitemnumber(1, "employee_salary")
ld_salary_w = dw_1.getitemnumber(1, "employee_salary")

//is_resultlog += wf_result_add("testcasepoint1", "Datastore name value:" + ls_name + ";salary value;" + string(ld_salary)+ ", Datawindow name value:" + ls_name_w + ";salary value;" + string(ld_salary_w),  ls_name = ls_name_w and ld_salary = ld_salary_w)
is_resultlog += wf_result_add("testcasepoint1", "Change Datawindow and Datastore",  ls_name = ls_name_w and ld_salary = ld_salary_w)

dw_1.HScrollBar = True









end subroutine

public subroutine of_testcase_point_module1 ();long ll_ds_count, ll_dw_count, ll_rc
ids_2.SetTransObject(sqlca)
ids_2.Retrieve()

dw_1.DataObject = ids_2.DataObject

ll_rc = ids_2.ShareData(dw_1)
ll_ds_count = ids_2.rowcount()
ll_dw_count = dw_1.rowcount()
//is_resultlog += wf_result_add("testcasepoint2", "d_contact_list_protected170310 source rows:" + string(ll_ds_count) +";destination rows:" +string(ll_dw_count) +", Sharedata ", ll_ds_count = ll_dw_count and ll_rc =1)
is_resultlog += wf_result_add("testcasepoint2", "d_contact_list_protected170310 sharedata", ll_ds_count = ll_dw_count and ll_rc =1)


// 测试新增一行数据时，是否同时新增
ll_ds_count = ids_2.insertrow(0)
ll_ds_count = ids_2.rowcount()
ll_dw_count = dw_1.rowcount()
//is_resultlog += wf_result_add("testcasepoint2", "d_contact_list_protected170310 source rows:" + string(ll_ds_count) +";destination rows:" +string(ll_dw_count) +", Sharedata ", ll_ds_count = ll_dw_count and ll_rc =1)
is_resultlog += wf_result_add("testcasepoint2", "Add records to datastore and datawindow", ll_ds_count = ll_dw_count and ll_rc =1)

//datawindow
ll_dw_count = dw_1.insertrow(0)
ll_ds_count = ids_2.rowcount()
ll_dw_count = dw_1.rowcount()
//is_resultlog += wf_result_add("testcasepoint2", "d_contact_list_protected170310 source rows:" + string(ll_ds_count) +";destination rows:" +string(ll_dw_count) +", Sharedata ", ll_ds_count = ll_dw_count and ll_rc =1)
is_resultlog += wf_result_add("testcasepoint2", "Add records to datawindow and datastore", ll_ds_count = ll_dw_count and ll_rc =1)

dw_1.HScrollBar = True

end subroutine

public subroutine of_testcase_point_module2 ();long ll_ds_count, ll_dw_count, ll_rc

DataWindowChild	ldwc_Target, ldwc_Source


ids_3.SetTransObject(sqlca)
ids_3.Retrieve()

dw_1.DataObject = ids_3.DataObject

ll_rc = ids_3.ShareData(dw_1)

ll_ds_count = ids_3.rowcount()
ll_dw_count = dw_1.rowcount()
//is_resultlog += wf_result_add("testcasepoint3", "d_empl_employment_data170310 source rows:" + string(ll_ds_count) +";destination rows:" +string(ll_dw_count) +", Sharedata ", ll_ds_count = ll_dw_count and ll_rc =1)
is_resultlog += wf_result_add("testcasepoint3", "d_empl_employment_data170310 Sharedata", ll_ds_count = ll_dw_count and ll_rc =1)

dw_1.HScrollBar = False

// Share the DropDownDataWindow
ids_3.GetChild("dept_id", ldwc_Source)
dw_1.GetChild("dept_id", ldwc_Target)

ll_rc =ldwc_Source.ShareData(ldwc_Target)
ll_ds_count = ldwc_Source.rowcount()
ll_dw_count = ldwc_Target.rowcount()

//is_resultlog += wf_result_add("testcasepoint3", "Datastore childdatawindow d_dddw_dept170310 source rows:" + string(ll_ds_count) +";destination rows:" +string(ll_dw_count) +", Sharedata ", ll_ds_count = ll_dw_count and ll_rc =1)
is_resultlog += wf_result_add("testcasepoint3", "Datastore childdatawindow sharedata ", ll_ds_count = ll_dw_count and ll_rc =1)


// 测试子数据窗口修改时是否同时修改
string ls_dept, ls_dept_w
ls_dept = "Appeon"
ldwc_Source.setitem(1, 'dept_name', ls_dept)
ls_dept = ldwc_Source.getitemstring(1, 'dept_name')
ls_dept_w = ldwc_Target.getitemstring(1, 'dept_name')

//is_resultlog += wf_result_add("testcasepoint3", "Datastore childdatawindow dept value:" + ls_dept + ", Datawindow childdatawindow dept value:" + ls_dept_w,  ls_dept = ls_dept_w )
is_resultlog += wf_result_add("testcasepoint3", "Change Datastore childdatawindow value and Datawindow childdatawindow value",  ls_dept = ls_dept_w )


ls_dept = "Appeon2"
ldwc_Target.setitem(1, 'dept_name', ls_dept)
ls_dept = ldwc_Source.getitemstring(1, 'dept_name')
ls_dept_w = ldwc_Target.getitemstring(1, 'dept_name')

//is_resultlog += wf_result_add("testcasepoint3", "Datastore childdatawindow dept value:" + ls_dept + ", Datawindow childdatawindow dept value:" + ls_dept_w,  ls_dept = ls_dept_w )
is_resultlog += wf_result_add("testcasepoint3", "Change Datawindow childdatawindow value and Datastore childdatawindow value" + ls_dept_w,  ls_dept = ls_dept_w )

//dept_name
end subroutine

public subroutine of_testcase_point_module3 ();long ll_ds_count, ll_dw_count, ll_rc

ids_4.SetTransObject(sqlca)
ids_4.Retrieve()

dw_1.DataObject = ids_4.DataObject

ll_rc = ids_4.ShareData(dw_1)


ll_ds_count = ids_4.rowcount()
ll_dw_count = dw_1.rowcount()
//is_resultlog += wf_result_add("testcasepoint4", "d_employees_by_dept170310 source rows:" + string(ll_ds_count) +";destination rows:" +string(ll_dw_count) +", Sharedata ", ll_ds_count = ll_dw_count and ll_rc =1)
is_resultlog += wf_result_add("testcasepoint4", "d_employees_by_dept170310 source rows sharedata", ll_ds_count = ll_dw_count and ll_rc =1)


// 测试删除一行数据时，是否同时删除
ids_2.deleterow(1)
ll_ds_count = ids_4.rowcount()
ll_dw_count = dw_1.rowcount()
//is_resultlog += wf_result_add("testcasepoint4", "d_employees_by_dept170310 source rows:" + string(ll_ds_count) +";destination rows:" +string(ll_dw_count) +", Sharedata ", ll_ds_count = ll_dw_count and ll_rc =1)
is_resultlog += wf_result_add("testcasepoint4", "delete sharedata datastore", ll_ds_count = ll_dw_count and ll_rc =1)

//datawindow
dw_1.deleterow(1)
ll_ds_count = ids_4.rowcount()
ll_dw_count = dw_1.rowcount()
//is_resultlog += wf_result_add("testcasepoint4", "d_employees_by_dept170310 source rows:" + string(ll_ds_count) +";destination rows:" +string(ll_dw_count) +", Sharedata ", ll_ds_count = ll_dw_count and ll_rc =1)
is_resultlog += wf_result_add("testcasepoint4", "delete sharedata datawindow", ll_ds_count = ll_dw_count and ll_rc =1)

dw_1.HScrollBar = True


end subroutine

event close;Destroy ids_1
Destroy ids_2
Destroy ids_3
Destroy ids_4

end event

on w_datastore_share170310.create
int iCurrent
call super::create
this.mle_inst=create mle_inst
this.rb_4=create rb_4
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_close=create cb_close
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_inst
this.Control[iCurrent+2]=this.rb_4
this.Control[iCurrent+3]=this.rb_3
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.dw_1
this.Control[iCurrent+8]=this.gb_1
end on

on w_datastore_share170310.destroy
call super::destroy
destroy(this.mle_inst)
destroy(this.rb_4)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_close)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event ue_preopen;call super::ue_preopen;ids_1 = Create DataStore
ids_2 = Create DataStore
ids_3 = Create DataStore
ids_4 = Create DataStore

ids_1.DataObject = "d_compute_in_attribute170310"
ids_2.DataObject = "d_contact_list_protected170310"
ids_3.DataObject = "d_empl_employment_data170310"
ids_4.DataObject = "d_employees_by_dept170310"

end event

type mle_inst from multilineedit within w_datastore_share170310
integer x = 809
integer y = 440
integer width = 791
integer height = 148
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Retrieving data into DataStores, please wait..."
boolean displayonly = true
borderstyle borderstyle = styleraised!
end type

type rb_4 from radiobutton within w_datastore_share170310
event clicked pbm_bnclicked
integer x = 2194
integer y = 320
integer width = 759
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "4.d_employees_by_dept170310"
end type

event clicked;of_testcase_point_module3()
end event

type rb_3 from radiobutton within w_datastore_share170310
event clicked pbm_bnclicked
integer x = 2194
integer y = 240
integer width = 837
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "3.d_empl_employment_data170310"
end type

event clicked;of_testcase_point_module2()
end event

type rb_2 from radiobutton within w_datastore_share170310
event clicked pbm_bnclicked
integer x = 2194
integer y = 164
integer width = 809
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "2.d_contact_list_protected170310"
end type

event clicked;of_testcase_point_module1()
end event

type rb_1 from radiobutton within w_datastore_share170310
integer x = 2194
integer y = 88
integer width = 782
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "1.d_compute_in_attribute170310"
end type

event clicked;of_testcase_point_module()
end event

type cb_close from commandbutton within w_datastore_share170310
integer x = 2359
integer y = 500
integer width = 325
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;Close(Parent)

end event

type dw_1 from datawindow within w_datastore_share170310
integer x = 9
integer y = 20
integer width = 2135
integer height = 1236
integer taborder = 10
boolean vscrollbar = true
boolean livescroll = true
end type

type gb_1 from groupbox within w_datastore_share170310
integer x = 2167
integer y = 20
integer width = 891
integer height = 412
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "DataStore"
end type

