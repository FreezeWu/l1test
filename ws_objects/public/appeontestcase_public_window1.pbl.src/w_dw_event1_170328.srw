$PBExportHeader$w_dw_event1_170328.srw
forward
global type w_dw_event1_170328 from w_base_case
end type
type dw_dberror from datawindow within w_dw_event1_170328
end type
type cb_5 from commandbutton within w_dw_event1_170328
end type
type cb_4 from commandbutton within w_dw_event1_170328
end type
type dw_copy from datawindow within w_dw_event1_170328
end type
type dw_cust from datawindow within w_dw_event1_170328
end type
type dw_currentrow from datawindow within w_dw_event1_170328
end type
type cb_3 from commandbutton within w_dw_event1_170328
end type
type cb_2 from commandbutton within w_dw_event1_170328
end type
type dw_compute from datawindow within w_dw_event1_170328
end type
type cb_1 from commandbutton within w_dw_event1_170328
end type
type dw_clock from datawindow within w_dw_event1_170328
end type
end forward

global type w_dw_event1_170328 from w_base_case
integer width = 3927
integer height = 2276
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
dw_dberror dw_dberror
cb_5 cb_5
cb_4 cb_4
dw_copy dw_copy
dw_cust dw_cust
dw_currentrow dw_currentrow
cb_3 cb_3
cb_2 cb_2
dw_compute dw_compute
cb_1 cb_1
dw_clock dw_clock
end type
global w_dw_event1_170328 w_dw_event1_170328

type variables
integer ii_db_ereor
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
public subroutine of_testcase_point_module4 ()
public subroutine of_testcase_point_module5 ()
end prototypes

public subroutine of_testcase_point_module ();/*
测试datawindow 数字钟， 如果不同时间获取的两个时间不相等，则表示时钟在变动
*/

datetime ldt_1, ldt_2


ldt_1 = dw_clock.getitemdatetime(1, 'compute_1')
sleep(0.5)
ldt_2 = dw_clock.getitemdatetime(1, 'compute_1')

if isnull(ldt_1) or isnull(ldt_2) or datetime(ldt_1) = datetime('1900-01-01') or datetime(ldt_2) = datetime('1900-01-01') then
	ldt_1 = datetime(today())
	ldt_2 = ldt_1
end if
is_resultlog += wf_result_add("testcasepoint1","Datawindow clock", ldt_2 > ldt_1)


end subroutine

public subroutine of_testcase_point_module1 ();/*
测试列的属性, Fontcolor:if (employee_salary = min_sal, 16711680, if (employee_salary = max_sal, 255, 0))
改变列的值，查看颜色是否变换，分别设置默认，要覆盖到条件表达式内的三个条件
*/
long ll_row, ll_pos
//long ll_color
string ls_color_expression, ls_color
ll_row = dw_compute.rowcount()
if ll_row <= 0 then
	is_resultlog += wf_result_add("testcasepoint2","Datawindow retrieved" , False)
	return 
end if 

/*
由于直接设置值不起作用, 但通过按钮点击可以起到作用，可能需要翻译窗口柄,
为了保证案例运行，并测试到所有条件表达式中的条件, 构造一个三条记录的datawindow,
这三条记录第一条为最小值，第二条为中间值， 第三条为最大值.

*/
// 中间值color : 0
ls_color_expression = dw_compute.describe("employee_salary.Color")
ll_pos = pos(ls_color_expression, 'if')
ls_color_expression = mid(ls_color_expression, ll_pos)
ls_color_expression = left(ls_color_expression, len(ls_color_expression) -1)
ls_color = dw_compute.describe("Evaluate('"+ ls_color_expression + "', 2)")
is_resultlog += wf_result_add("testcasepoint2","When the object's values is default, the color:0" , ls_color = '0')


//设置成最大值后，颜色为红色 color:255
//dw_compute.setitem(1, "employee_salary", 100000)
//dw_compute.accepttext()


ls_color_expression = dw_compute.describe("employee_salary.Color")
ll_pos = pos(ls_color_expression, 'if')
ls_color_expression = mid(ls_color_expression, ll_pos)
ls_color_expression = left(ls_color_expression, len(ls_color_expression) -1)
ls_color = dw_compute.describe("Evaluate('"+ ls_color_expression + "', 3)")
is_resultlog += wf_result_add("testcasepoint2","When the object's values is max, the color:255" , ls_color = '255')

//设置成最小值，颜色为蓝色 color:16711680
//dw_compute.setitem(1, "employee_salary", 10)
//dw_compute.accepttext()
ls_color_expression = dw_compute.describe("employee_salary.Color")
ll_pos = pos(ls_color_expression, 'if')
ls_color_expression = mid(ls_color_expression, ll_pos)
ls_color_expression = left(ls_color_expression, len(ls_color_expression) -1)
ls_color = dw_compute.describe("Evaluate('"+ ls_color_expression + "', 1)")
is_resultlog += wf_result_add("testcasepoint2","When the object's values is min, the color:16711680" , ls_color = '16711680')
end subroutine

public subroutine of_testcase_point_module2 ();/*
测试currnet属性是否正确, 
Border: if (getrow() = currentrow(), 5, 0)
backcolor:if (getrow() = currentrow(), 1087434968, 78682240)
*/
long ll_row, ll_pos
//long ll_color
string ls_color_expression, ls_color, ls_border_expression, ls_border
ll_row = dw_currentrow.rowcount()
if ll_row <= 0 then
	is_resultlog += wf_result_add("testcasepoint3","Datawindow:dw_currentrow retrieved" , False)
	return 
end if 

/*
Datawindow 默认currentrow()为第一行

*/

ls_border_expression = dw_currentrow.describe("company_name.Border")
ll_pos = pos(ls_border_expression, 'if')
ls_border_expression = mid(ls_border_expression, ll_pos)
ls_border_expression = left(ls_border_expression, len(ls_border_expression) -1)
ls_border = dw_currentrow.describe("Evaluate('"+ ls_border_expression + "', 1)")
is_resultlog += wf_result_add("testcasepoint3","Defualt Current row:1 border:5" , ls_border = '5')


ls_color_expression = dw_currentrow.describe("company_name.Background.Color")
ll_pos = pos(ls_color_expression, 'if')
ls_color_expression = mid(ls_color_expression, ll_pos)
ls_color_expression = left(ls_color_expression, len(ls_color_expression) -1)
ls_color = dw_currentrow.describe("Evaluate('"+ ls_color_expression + "', 1)")
is_resultlog += wf_result_add("testcasepoint3","Defualt Current row:1 Background Color:1087434968" , ls_color = '1087434968')

/*
Datawindow 默认currentrow()为第二行不是currentrow, 得到的值应该不同

*/


ls_border_expression = dw_currentrow.describe("company_name.Border")
ll_pos = pos(ls_border_expression, 'if')
ls_border_expression = mid(ls_border_expression, ll_pos)
ls_border_expression = left(ls_border_expression, len(ls_border_expression) -1)
ls_border = dw_currentrow.describe("Evaluate('"+ ls_border_expression + "', 2)")
is_resultlog += wf_result_add("testcasepoint3","Row:2 is not Current row border:0" , ls_border = '0')


ls_color_expression = dw_currentrow.describe("company_name.Background.Color")
ll_pos = pos(ls_color_expression, 'if')
ls_color_expression = mid(ls_color_expression, ll_pos)
ls_color_expression = left(ls_color_expression, len(ls_color_expression) -1)
ls_color = dw_currentrow.describe("Evaluate('"+ ls_color_expression + "', 2)")
is_resultlog += wf_result_add("testcasepoint3","Row:2 is not Current row Background Color:78682240" , ls_color = '78682240')


/*
设置currentrow() 后再测试一次

*/
dw_currentrow.scrolltorow(3)
dw_currentrow.setcolumn('lname')
ls_border_expression = dw_currentrow.describe("lname.Border")
ll_pos = pos(ls_border_expression, 'if')
ls_border_expression = mid(ls_border_expression, ll_pos)
ls_border_expression = left(ls_border_expression, len(ls_border_expression) -1)
ls_border = dw_currentrow.describe("Evaluate('"+ ls_border_expression + "', 3)")
is_resultlog += wf_result_add("testcasepoint3","Set Current row:3 border:5" , ls_border = '5')


ls_color_expression = dw_currentrow.describe("lname.Background.Color")
ll_pos = pos(ls_color_expression, 'if')
ls_color_expression = mid(ls_color_expression, ll_pos)
ls_color_expression = left(ls_color_expression, len(ls_color_expression) -1)
ls_color = dw_currentrow.describe("Evaluate('"+ ls_color_expression + "', 3)")
is_resultlog += wf_result_add("testcasepoint3","Set Current row:3 Background Color:1087434968" , ls_color = '1087434968')

/*
再测试一次普通行
*/

ls_border_expression = dw_currentrow.describe("lname.Border")
ll_pos = pos(ls_border_expression, 'if')
ls_border_expression = mid(ls_border_expression, ll_pos)
ls_border_expression = left(ls_border_expression, len(ls_border_expression) -1)
ls_border = dw_currentrow.describe("Evaluate('"+ ls_border_expression + "',4)")
is_resultlog += wf_result_add("testcasepoint3","Row:4 is not Current row border:0" , ls_border = '0')


ls_color_expression = dw_currentrow.describe("lname.Background.Color")
ll_pos = pos(ls_color_expression, 'if')
ls_color_expression = mid(ls_color_expression, ll_pos)
ls_color_expression = left(ls_color_expression, len(ls_color_expression) -1)
ls_color = dw_currentrow.describe("Evaluate('"+ ls_color_expression + "', 4)")
is_resultlog += wf_result_add("testcasepoint3","Row:4 is not Background Color:78682240" , ls_color = '78682240')

//
////设置成最大值后，颜色为红色 color:255
////dw_currentrow.setitem(1, "employee_salary", 100000)
////dw_currentrow.accepttext()
//
//
//ls_border_expression = dw_currentrow.describe("employee_salary.Color")
//ll_pos = pos(ls_border_expression, 'if')
//ls_border_expression = mid(ls_border_expression, ll_pos)
//ls_border_expression = left(ls_border_expression, len(ls_border_expression) -1)
//ls_color = dw_currentrow.describe("Evaluate('"+ ls_border_expression + "', 3)")
//is_resultlog += wf_result_add("testcasepoint3","When the object's values is max, the color:255" , ls_color = '255')
//
////设置成最小值，颜色为蓝色 color:16711680
////dw_currentrow.setitem(1, "employee_salary", 10)
////dw_currentrow.accepttext()
//ls_border_expression = dw_currentrow.describe("employee_salary.Color")
//ll_pos = pos(ls_border_expression, 'if')
//ls_border_expression = mid(ls_border_expression, ll_pos)
//ls_border_expression = left(ls_border_expression, len(ls_border_expression) -1)
//ls_color = dw_currentrow.describe("Evaluate('"+ ls_border_expression + "', 1)")
//is_resultlog += wf_result_add("testcasepoint3","When the object's values is min, the color:16711680" , ls_color = '16711680')
end subroutine

public subroutine of_testcase_point_module3 ();long ll_count, ll_count2, ll_rc
string ls_dwcopy
//set transaction object up for the datawindow and retrieve
dw_cust.settransobjecT(sqlca)
ll_count = dw_cust.retrieve()


//This will store the data portion of the datawindow in a string called is_dwcopy
ls_dwcopy = dw_cust.Object.DataWindow.data


//This will clear of data contents of the datawindow and 
//refill the data using the importstring() function. The data is stored in the instance
//string is_dwcopy which was loaded in the postopen event of the window.
dw_cust.reset()
ll_rc = dw_cust.importstring(ls_dwcopy)

ll_count2 = dw_cust.rowcount()


is_resultlog += wf_result_add("testcasepoint4", "execute importstring function", ll_count = ll_count2 and ll_rc > 0  )

end subroutine

public subroutine of_testcase_point_module4 ();string ls_dwcopy, ls_type, ls_name
datawindowchild ldw_child
string ls_count
int li_count, li_index, li_rc
Boolean ib_error
long ll_count1, ll_count2

//accept text on datawindow about to be copied
dw_cust.settransobjecT(sqlca)
dw_cust.reset()
ll_count1 = dw_cust.retrieve()
dw_cust.accepttext()

//clear out the destination
dw_copy.reset()

//This section is not needed if the destination does not contain child datawindows.
ls_count = dw_copy.Object.DataWindow.column.count
li_count = integer (ls_count)

For li_index = 1 to li_count
	ls_type = dw_copy.describe("#" + string(li_index) + ".edit.style")
	If ls_type = "dddw" Then
		ls_name = dw_copy.describe("#" + string(li_index) + ".name")
         	li_rc = dw_copy.GetChild(ls_name , ldw_child)
		If li_rc = -1 Then 
			ib_error = True
			//MessageBox("Error on DWC Retreive",String(li_rc))
		Else
			ldw_child.settransobject(sqlca)
			ldw_child.retrieve()
		End If
	End If
Next
//***********************************************************************************


is_resultlog += wf_result_add("testcasepoint5", "DDDW Retreive", Not ib_error )

//put the data portion of source datawindow into a string

li_rc = dw_cust.RowsCopy(1,dw_cust.rowcount(),Primary!,dw_copy,1,Primary!)

ll_count2 = dw_copy.rowcount()

is_resultlog += wf_result_add("testcasepoint5", "datawindow rowscopy ", ll_count1 = ll_count2  and li_rc = 1 )


end subroutine

public subroutine of_testcase_point_module5 ();//db_error 三种方式



//1. 系统默认提示

is_type = "messagebox"
timer(1)

dw_dberror.settransobjecT(sqlca)
dw_dberror.insertrow(0)
dw_dberror.setitem(1, 'dept_name' , '123')


if dw_dberror.Update() = 1 then
	commit;
else
	rollback;
end if
is_resultlog += wf_result_add("testcasepoint6", "Db error:Default PB error message", ii_db_ereor = 1 )

//2. 自定义提示
dw_dberror.reset()
dw_dberror.insertrow(0)
dw_dberror.setitem(1, 'dept_name' , '456')

if dw_dberror.Update() = 1 then
	commit;
else
	rollback;
end if
is_resultlog += wf_result_add("testcasepoint6", "Db error:Customized error message", ii_db_ereor = 2 )


//3. 不提示
dw_dberror.reset()
dw_dberror.insertrow(0)
dw_dberror.setitem(1, 'dept_name' , '789')

if dw_dberror.Update() = 1 then
	commit;
else
	rollback;
end if
is_resultlog += wf_result_add("testcasepoint6", "Db error:No error message", ii_db_ereor = 3 )
end subroutine

on w_dw_event1_170328.create
int iCurrent
call super::create
this.dw_dberror=create dw_dberror
this.cb_5=create cb_5
this.cb_4=create cb_4
this.dw_copy=create dw_copy
this.dw_cust=create dw_cust
this.dw_currentrow=create dw_currentrow
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_compute=create dw_compute
this.cb_1=create cb_1
this.dw_clock=create dw_clock
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_dberror
this.Control[iCurrent+2]=this.cb_5
this.Control[iCurrent+3]=this.cb_4
this.Control[iCurrent+4]=this.dw_copy
this.Control[iCurrent+5]=this.dw_cust
this.Control[iCurrent+6]=this.dw_currentrow
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.dw_compute
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.dw_clock
end on

on w_dw_event1_170328.destroy
call super::destroy
destroy(this.dw_dberror)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.dw_copy)
destroy(this.dw_cust)
destroy(this.dw_currentrow)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_compute)
destroy(this.cb_1)
destroy(this.dw_clock)
end on

event ue_preopen;call super::ue_preopen;dw_compute.SetTransObject (sqlca)
dw_compute.Retrieve()

dw_currentrow.SetTransObject (sqlca)
dw_currentrow.Retrieve()
end event

event timer;call super::timer;wf_closepopwindow( "DataWindow Error", 'OK')
end event

type dw_dberror from datawindow within w_dw_event1_170328
integer x = 1746
integer y = 1224
integer width = 777
integer height = 588
integer taborder = 70
string dataobject = "d_departments"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// dberror script for dw_1
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

integer li_rc
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Depending on which error message option is checked, display appropriate error message.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if ii_db_ereor = 0 then
	ii_db_ereor =  1


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// If custom error message is checked, then display an error message with the specific
// database error code and error message that occurred.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//if rb_custom.checked then
//	MessageBox ("Database Error", "Database Error Code:  " + String (sqldbcode) + &
//						"~r~nDatabase Error Message:  " + sqlerrtext, exclamation!)
//end if

elseif  ii_db_ereor = 1 then
	li_rc = MessageBox ("DataWindow Error", "Database Error Code:  " + String (sqldbcode) + &
						"~r~nDatabase Error Message:  " + sqlerrtext, exclamation!)
	// 判断messagebox是否弹出执行
	if 	li_rc = 1 then			
		ii_db_ereor = 2
	else
		ii_db_ereor = 5
	end if
	return 1

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Setting the return code to 1 in the dberror event will stop PowerBuilder from displaying
// the default error message
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//if not rb_default.checked then
//	return 1
//end if
// 这一步在L1框架中测试可能结果不正确，因为无法判断系统dberror窗口是否打开
elseif  ii_db_ereor = 2 then
	ii_db_ereor = 3
	return 1
end if

end event

type cb_5 from commandbutton within w_dw_event1_170328
integer x = 2738
integer y = 676
integer width = 951
integer height = 132
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "5.Db_error"
end type

event clicked;of_testcase_point_module5()
end event

type cb_4 from commandbutton within w_dw_event1_170328
integer x = 2738
integer y = 512
integer width = 951
integer height = 132
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "4.Testcasepoint:ImportString"
end type

event clicked;of_testcase_point_module3()
end event

type dw_copy from datawindow within w_dw_event1_170328
integer x = 1120
integer y = 1228
integer width = 590
integer height = 576
integer taborder = 70
string dataobject = "d_cust"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_cust from datawindow within w_dw_event1_170328
integer x = 41
integer y = 1236
integer width = 1056
integer height = 604
integer taborder = 60
string dataobject = "d_cust"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_currentrow from datawindow within w_dw_event1_170328
integer x = 14
integer y = 708
integer width = 2537
integer height = 480
integer taborder = 50
string title = "none"
string dataobject = "d_currentrow"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_dw_event1_170328
integer x = 2729
integer y = 336
integer width = 951
integer height = 132
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "3.Testcasepoint:CurrentRow"
end type

event clicked;of_testcase_point_module2()
end event

type cb_2 from commandbutton within w_dw_event1_170328
integer x = 2729
integer y = 180
integer width = 951
integer height = 132
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2.Testcasepoint:compute attribute"
end type

event clicked;of_testcase_point_module1()
end event

type dw_compute from datawindow within w_dw_event1_170328
integer x = 18
integer y = 188
integer width = 2537
integer height = 480
integer taborder = 30
string title = "none"
string dataobject = "d_compute_in_attribute170328"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_dw_event1_170328
integer x = 2729
integer y = 24
integer width = 951
integer height = 132
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.Testcasepoint:dw_clock"
end type

event clicked;of_testcase_point_module()
end event

type dw_clock from datawindow within w_dw_event1_170328
integer x = 59
integer y = 28
integer width = 654
integer height = 124
integer taborder = 10
string title = "none"
string dataobject = "d_clock170328"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_clock.insertrow(0)
end event

