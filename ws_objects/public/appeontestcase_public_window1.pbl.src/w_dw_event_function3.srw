$PBExportHeader$w_dw_event_function3.srw
forward
global type w_dw_event_function3 from w_base_case
end type
type cb_8 from commandbutton within w_dw_event_function3
end type
type dw_items from datawindow within w_dw_event_function3
end type
type cb_7 from commandbutton within w_dw_event_function3
end type
type dw_5 from datawindow within w_dw_event_function3
end type
type cb_6 from commandbutton within w_dw_event_function3
end type
type dw_data from datawindow within w_dw_event_function3
end type
type dw_customers from datawindow within w_dw_event_function3
end type
type cb_5 from commandbutton within w_dw_event_function3
end type
type dw_sales_orders from datawindow within w_dw_event_function3
end type
type p_1 from picture within w_dw_event_function3
end type
type cb_4 from commandbutton within w_dw_event_function3
end type
type dw_4 from datawindow within w_dw_event_function3
end type
type cb_3 from commandbutton within w_dw_event_function3
end type
type dw_3 from datawindow within w_dw_event_function3
end type
type dw_2 from datawindow within w_dw_event_function3
end type
type cb_2 from commandbutton within w_dw_event_function3
end type
type cb_1 from commandbutton within w_dw_event_function3
end type
type dw_1 from datawindow within w_dw_event_function3
end type
end forward

global type w_dw_event_function3 from w_base_case
integer width = 4251
integer height = 2708
string title = "Event&Function3"
cb_8 cb_8
dw_items dw_items
cb_7 cb_7
dw_5 dw_5
cb_6 cb_6
dw_data dw_data
dw_customers dw_customers
cb_5 cb_5
dw_sales_orders dw_sales_orders
p_1 p_1
cb_4 cb_4
dw_4 dw_4
cb_3 cb_3
dw_3 dw_3
dw_2 dw_2
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_dw_event_function3 w_dw_event_function3

type variables
boolean ib_allow_rowchanging
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
public subroutine of_testcase_point_module4 ()
public subroutine of_testcase_point_module5 ()
public subroutine of_testcase_point_module6 ()
public subroutine of_testcase_point_module7 ()
end prototypes

public subroutine of_testcase_point_module ();string ls_first, ls_second, ls_compute_2, ls_last, ls_last2, ls_last3
dw_1.settransobject(sqlca)
dw_1.retrieve()


ls_first = "Position # 1 : Overbey              ($74,730) "
ls_second =  "Position # 2 : Singer               ($36,852) "
ls_compute_2 = "Position # 3 : Clark                ($34,200) "
ls_last = "Position #13: Chao                 ($276) "
ls_last2 =  "Position #12: Jordan               ($324) "
ls_last3 = "Position #11: Snow                 ($27,294) "


is_resultlog += wf_result_add("testcasepoint1", "Datawindow Large function ", ls_first = dw_1.object.first[1] and ls_second =  dw_1.object.second[1] and ls_compute_2 =  dw_1.object.compute_2[1] )
is_resultlog += wf_result_add("testcasepoint1", "Datawindow Small function ", ls_last =  dw_1.object.last[1] and ls_last2 =  dw_1.object.last2[1] and ls_last3 =  dw_1.object.last3[1] )

end subroutine

public subroutine of_testcase_point_module1 ();string ls_median, ls_median2, ls_mode, ls_mode2
long ll_count
dw_2.settransobject(sqlca)
ll_count = dw_2.retrieve()


ls_median = "Median: $1,080"
ls_mode =  "Mode: $1,296"
ls_median2 = "Median: $3,420"
ls_mode2 = "Mode: $3,780"


is_resultlog += wf_result_add("testcasepoint2", "Datawindow Median function ", ls_median = dw_2.object.compute_7[1] and ls_median2 =  dw_2.object.compute_7[ll_count]  )
is_resultlog += wf_result_add("testcasepoint2", "Datawindow Mode function ", ls_mode =  dw_2.object.compute_8[1] and ls_mode2 =  dw_2.object.compute_8[ll_count] )

end subroutine

public subroutine of_testcase_point_module2 ();long ll_count, ll_pos, ll_row,ll_row_protect, ll_row_new, ll_row_new_modify, ll_row_last
string ls_protect_expression , ls__region
string ls_value_1, ls_value_2, ls_value_3,  ls_value_4,  ls_value_5

ls__region = 'South'
dw_3.settransobject(sqlca)
ll_count = dw_3.retrieve(ls__region)




//messagebox('ls_protect', ls_protect)






ll_row_last = dw_3.rowcount()
dw_3.object.id[ll_row_last] = ll_row_last

ll_row_new = dw_3.insertrow(0)

ll_row_new_modify = dw_3.insertrow(0)
dw_3.object.id[ll_row_new_modify] = 1

// protect properties
ll_row = dw_3.Find("region = '" + ls__region + "'", 1, dw_3.RowCount())
ls_protect_expression = dw_3.describe( "id.protect")
ll_pos = pos(upper(ls_protect_expression), 'IF')
ls_protect_expression = mid(ls_protect_expression, ll_pos)
ls_protect_expression = left(ls_protect_expression, len(ls_protect_expression) -1)
ls_value_1  = dw_3.describe("Evaluate('"+ ls_protect_expression + "', " +string(ll_row) +")")

ll_row_protect = dw_3.Find("region <> '" + ls__region + "'", 1, dw_3.RowCount())
ls_protect_expression = dw_3.describe( "id.protect")
ll_pos = pos(upper(ls_protect_expression), 'IF')
ls_protect_expression = mid(ls_protect_expression, ll_pos)
ls_protect_expression = left(ls_protect_expression, len(ls_protect_expression) -1)
ls_value_2  = dw_3.describe("Evaluate('"+ ls_protect_expression + "', " +string(ll_row_protect) +")")
ll_row = dw_3.Find("region = '" + ls__region + "'", 1, dw_3.RowCount())
ls_protect_expression = dw_3.describe( "id.protect")
ll_pos = pos(upper(ls_protect_expression), 'IF')
ls_protect_expression = mid(ls_protect_expression, ll_pos)
ls_protect_expression = left(ls_protect_expression, len(ls_protect_expression) -1)
ls_value_3  = dw_3.describe("Evaluate('"+ ls_protect_expression + "', " +string(ll_row_last) +")")

ll_row_protect = dw_3.Find("region <> '" + ls__region + "'", 1, dw_3.RowCount())
ls_protect_expression = dw_3.describe( "id.protect")
ll_pos = pos(upper(ls_protect_expression), 'IF')
ls_protect_expression = mid(ls_protect_expression, ll_pos)
ls_protect_expression = left(ls_protect_expression, len(ls_protect_expression) -1)
ls_value_4  = dw_3.describe("Evaluate('"+ ls_protect_expression + "', " +string(ll_row_new) +")")

ll_row_protect = dw_3.Find("region <> '" + ls__region + "'", 1, dw_3.RowCount())
ls_protect_expression = dw_3.describe( "id.protect")
ll_pos = pos(upper(ls_protect_expression), 'IF')
ls_protect_expression = mid(ls_protect_expression, ll_pos)
ls_protect_expression = left(ls_protect_expression, len(ls_protect_expression) -1)
ls_value_5  = dw_3.describe("Evaluate('"+ ls_protect_expression + "', " +string(ll_row_new_modify) +")")

is_resultlog += wf_result_add("testcasepoint3", "Get datawindow expression:protect", ls_value_1 = '0' and  ls_value_2 = '1' and ls_value_3 ='0' and ls_value_4 ='0' and ls_value_5 ='0')


// backcolor properties
ll_row = dw_3.Find("region = '" + ls__region + "'", 1, dw_3.RowCount())
ls_protect_expression = dw_3.describe( "id.Background.Color")
ll_pos = pos(upper(ls_protect_expression), 'IF')
ls_protect_expression = mid(ls_protect_expression, ll_pos)
ls_protect_expression = left(ls_protect_expression, len(ls_protect_expression) -1)
ls_value_1  = dw_3.describe("Evaluate('"+ ls_protect_expression + "', " +string(ll_row) +")")

ll_row_protect = dw_3.Find("region <> '" + ls__region + "'", 1, dw_3.RowCount())
ls_protect_expression = dw_3.describe( "id.Background.Color")
ll_pos = pos(upper(ls_protect_expression), 'IF')
ls_protect_expression = mid(ls_protect_expression, ll_pos)
ls_protect_expression = left(ls_protect_expression, len(ls_protect_expression) -1)
ls_value_2  = dw_3.describe("Evaluate('"+ ls_protect_expression + "', " +string(ll_row_protect) +")")
ll_row = dw_3.Find("region = '" + ls__region + "'", 1, dw_3.RowCount())
ls_protect_expression = dw_3.describe( "id.Background.Color")
ll_pos = pos(upper(ls_protect_expression), 'IF')
ls_protect_expression = mid(ls_protect_expression, ll_pos)
ls_protect_expression = left(ls_protect_expression, len(ls_protect_expression) -1)
ls_value_3  = dw_3.describe("Evaluate('"+ ls_protect_expression + "', " +string(ll_row_last) +")")

ll_row_protect = dw_3.Find("region <> '" + ls__region + "'", 1, dw_3.RowCount())
ls_protect_expression = dw_3.describe( "id.Background.Color")
ll_pos = pos(upper(ls_protect_expression), 'IF')
ls_protect_expression = mid(ls_protect_expression, ll_pos)
ls_protect_expression = left(ls_protect_expression, len(ls_protect_expression) -1)
ls_value_4  = dw_3.describe("Evaluate('"+ ls_protect_expression + "', " +string(ll_row_new) +")")

ll_row_protect = dw_3.Find("region <> '" + ls__region + "'", 1, dw_3.RowCount())
ls_protect_expression = dw_3.describe( "id.Background.Color")
ll_pos = pos(upper(ls_protect_expression), 'IF')
ls_protect_expression = mid(ls_protect_expression, ll_pos)
ls_protect_expression = left(ls_protect_expression, len(ls_protect_expression) -1)
ls_value_5  = dw_3.describe("Evaluate('"+ ls_protect_expression + "', " +string(ll_row_new_modify) +")")

is_resultlog += wf_result_add("testcasepoint3", "Get datawindow expression:Background.Color", ls_value_1 = '16777215' and  ls_value_2 = '8421504' and ls_value_3 ='16777215' and ls_value_4 ='16777215' and ls_value_5 ='16777215')

end subroutine

public subroutine of_testcase_point_module3 ();// 测试SetRowFocusIndicator的四种样式Off!,FocusRect!,Hand!, picture
long ll_rc


 
dw_4.settransobject(sqlca)
dw_4.retrieve()

ll_rc = dw_4.SetRowFocusIndicator(off!)
is_resultlog += wf_result_add("testcasepoint4", "Datawindow.SetRowFocusIndicator(off!)", ll_rc = 1)

ll_rc = dw_4.SetRowFocusIndicator(FocusRect!)
is_resultlog += wf_result_add("testcasepoint4", "Datawindow.SetRowFocusIndicator(FocusRect!)", ll_rc = 1)


ll_rc = dw_4.SetRowFocusIndicator(Hand!)
is_resultlog += wf_result_add("testcasepoint4", "Datawindow.SetRowFocusIndicator(Hand!)", ll_rc = 1)

ll_rc = dw_4.SetRowFocusIndicator (hand!,dw_4.x + dw_4.width - p_1.width - 150)
is_resultlog += wf_result_add("testcasepoint4", "Datawindow.SetRowFocusIndicator(Hand!, position)", ll_rc = 1)

ll_rc = dw_4.SetRowFocusIndicator(p_1)
is_resultlog += wf_result_add("testcasepoint4", "Datawindow.SetRowFocusIndicator(picture)", ll_rc = 1)

ll_rc = SetRowFocusIndicator (dw_4,p_1,dw_4.x + dw_4.width - p_1.width - 150)
is_resultlog += wf_result_add("testcasepoint4", "Datawindow.SetRowFocusIndicator(picture, position)", ll_rc = 1)


end subroutine

public subroutine of_testcase_point_module4 ();long ll_rc
datawindowchild   ldw_customer, ldw_customer2

dw_sales_orders.settransobject(sqlca)
dw_customers.settransobject(sqlca)
dw_customers.retrieve()
dw_sales_orders.GetChild ("cust_id", ldw_customer)
ll_rc = dw_customers.ShareData (ldw_customer)
is_resultlog += wf_result_add("testcasepoint5", "DDDW ShareData", ll_rc = 1 and  ldw_customer.rowcount() = dw_customers.rowcount()  )

dw_sales_orders.insertrow(0)
ll_rc =dw_customers.ShareDataOff()
dw_sales_orders.GetChild ("cust_id", ldw_customer2)
is_resultlog += wf_result_add("testcasepoint5", "DDDW ShareDataOff", ll_rc = 1 and  ldw_customer.rowcount() <> dw_customers.rowcount() and   ldw_customer2.rowcount() =0 )
end subroutine

public subroutine of_testcase_point_module5 ();string ls_colx, ls_colx2, ls_colx3

//retrieve data into datawindow
dw_data.SetTransObject (sqlca)
dw_data.Retrieve ()

// Get x location of emp_fname column
ls_colx = dw_data.Object.emp_fname.x


// Set the position of the horizontal split scroll point.
// 设置值与获取值可能不相等
dw_data.Object.datawindow.horizontalscrollsplit = ls_colx

ls_colx2 = dw_data.Describe("DataWindow.HorizontalScrollSplit")
ls_colx3 = dw_data.Object.datawindow.horizontalscrollsplit 



is_resultlog += wf_result_add("testcasepoint6", "DataWindow HorizontalScrollSplit", ls_colx3 = ls_colx2 and isnumber(ls_colx2) and ls_colx2 <> '0')

end subroutine

public subroutine of_testcase_point_module6 ();long	ll_row, ll_count, ll_deleterow
int li_rc


dw_5.SetTransObject(sqlca)
dw_5.SetRowFocusIndicator(hand!, -10, -10)
if dw_5.Retrieve() = -1 then
	is_resultlog += wf_result_add("testcasepoint7", "Datawindow Retreived", False )
	return
end if

ll_deleterow = 1
dw_5.ScrollToRow(1)
dw_5.SetColumn(1)
dw_5.DeleteRow(ll_deleterow)

ll_count = dw_5.rowcount()


ll_row = dw_5.DeletedCount()


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Move the last row in the deleted buffer to the primary buffer
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
li_rc = dw_5.RowsMove(ll_row, ll_row, delete!, dw_5, ll_deleterow, primary!)

is_resultlog += wf_result_add("testcasepoint7", "Undeleting a Row using RowsMove Function", li_rc =1 )
end subroutine

public subroutine of_testcase_point_module7 ();long	ll_row, ll_count
int li_rc


dw_items.SetTransObject(sqlca)
ll_count = dw_items.Retrieve(2001)
if ll_count = 0 then
	is_resultlog += wf_result_add("testcasepoint8", "Datawindow Retreived", False )
	return
end if
// RowFocusChanging = 1
dw_items.setfocus()
dw_items.ScrollToRow(1)
dw_items.SetColumn("quantity")
dw_items.settext("-1")
dw_items.accepttext()

dw_items.ScrollToRow(2)
is_resultlog += wf_result_add("testcasepoint8", "RowFocusChanging return 1", ib_allow_rowchanging = False and dw_items.getrow() = 1 )


dw_items.Retrieve(2001)
dw_items.ScrollToRow(1)
dw_items.SetColumn("quantity")
dw_items.settext("10")
dw_items.accepttext()

dw_items.ScrollToRow(2)
is_resultlog += wf_result_add("testcasepoint8", "RowFocusChanging return 0", ib_allow_rowchanging and dw_items.getrow() = 2 )


end subroutine

on w_dw_event_function3.create
int iCurrent
call super::create
this.cb_8=create cb_8
this.dw_items=create dw_items
this.cb_7=create cb_7
this.dw_5=create dw_5
this.cb_6=create cb_6
this.dw_data=create dw_data
this.dw_customers=create dw_customers
this.cb_5=create cb_5
this.dw_sales_orders=create dw_sales_orders
this.p_1=create p_1
this.cb_4=create cb_4
this.dw_4=create dw_4
this.cb_3=create cb_3
this.dw_3=create dw_3
this.dw_2=create dw_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_8
this.Control[iCurrent+2]=this.dw_items
this.Control[iCurrent+3]=this.cb_7
this.Control[iCurrent+4]=this.dw_5
this.Control[iCurrent+5]=this.cb_6
this.Control[iCurrent+6]=this.dw_data
this.Control[iCurrent+7]=this.dw_customers
this.Control[iCurrent+8]=this.cb_5
this.Control[iCurrent+9]=this.dw_sales_orders
this.Control[iCurrent+10]=this.p_1
this.Control[iCurrent+11]=this.cb_4
this.Control[iCurrent+12]=this.dw_4
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.dw_3
this.Control[iCurrent+15]=this.dw_2
this.Control[iCurrent+16]=this.cb_2
this.Control[iCurrent+17]=this.cb_1
this.Control[iCurrent+18]=this.dw_1
end on

on w_dw_event_function3.destroy
call super::destroy
destroy(this.cb_8)
destroy(this.dw_items)
destroy(this.cb_7)
destroy(this.dw_5)
destroy(this.cb_6)
destroy(this.dw_data)
destroy(this.dw_customers)
destroy(this.cb_5)
destroy(this.dw_sales_orders)
destroy(this.p_1)
destroy(this.cb_4)
destroy(this.dw_4)
destroy(this.cb_3)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_8 from commandbutton within w_dw_event_function3
integer x = 2775
integer y = 2252
integer width = 1051
integer height = 132
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "8.Testcasepoint:RowFocusChanging"
end type

event clicked;of_testcase_point_module7()
end event

type dw_items from datawindow within w_dw_event_function3
integer x = 5
integer y = 2124
integer width = 1646
integer height = 460
integer taborder = 140
string dataobject = "d_update_sales_order_items"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanging;if currentrow = 0 then return
If dw_items.Object.quantity[currentrow]  > 0 then
	ib_allow_rowchanging = True
	return 0	
else
	ib_allow_rowchanging = false
	return 1
end if
end event

type cb_7 from commandbutton within w_dw_event_function3
integer x = 2775
integer y = 1880
integer width = 1051
integer height = 132
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "7.Testcasepoint:Undeleting a Row"
end type

event clicked;of_testcase_point_module6()
end event

type dw_5 from datawindow within w_dw_event_function3
integer y = 1852
integer width = 2423
integer height = 268
integer taborder = 120
string dataobject = "d_contact_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within w_dw_event_function3
integer x = 2770
integer y = 1428
integer width = 1051
integer height = 132
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "6.Testcasepoint:Horizontal Split Scroll"
end type

event clicked;of_testcase_point_module5()
end event

type dw_data from datawindow within w_dw_event_function3
integer x = 18
integer y = 1328
integer width = 2418
integer height = 496
integer taborder = 100
string dataobject = "d_employee_data_list_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_customers from datawindow within w_dw_event_function3
integer x = 1422
integer y = 988
integer width = 896
integer height = 300
integer taborder = 90
string dataobject = "d_cust_id"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_5 from commandbutton within w_dw_event_function3
integer x = 2766
integer y = 1084
integer width = 1051
integer height = 132
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "5.Testcasepoint:Sharing DDDW"
end type

event clicked;of_testcase_point_module4()
end event

type dw_sales_orders from datawindow within w_dw_event_function3
integer x = 27
integer y = 992
integer width = 1339
integer height = 324
integer taborder = 80
string dataobject = "d_sales_orders"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type p_1 from picture within w_dw_event_function3
boolean visible = false
integer x = 2473
integer y = 684
integer width = 151
integer height = 88
string picturename = "Where!"
end type

type cb_4 from commandbutton within w_dw_event_function3
integer x = 2734
integer y = 668
integer width = 1051
integer height = 132
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "4.Testcasepoint:Row Focus Indicators"
end type

event clicked;of_testcase_point_module3()
end event

type dw_4 from datawindow within w_dw_event_function3
integer x = 23
integer y = 544
integer width = 2441
integer height = 420
integer taborder = 60
string dataobject = "d_setrowfocus"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_dw_event_function3
integer x = 2738
integer y = 400
integer width = 1051
integer height = 132
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "3.Testcasepoint:Attribute Expressions"
end type

event clicked;of_testcase_point_module2()
end event

type dw_3 from datawindow within w_dw_event_function3
integer x = 2528
integer y = 32
integer width = 1495
integer height = 352
integer taborder = 40
string dataobject = "d_region_sales"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_dw_event_function3
integer x = 1239
integer y = 48
integer width = 1239
integer height = 340
integer taborder = 40
string dataobject = "d_mode_median"
boolean vscrollbar = true
boolean livescroll = true
end type

type cb_2 from commandbutton within w_dw_event_function3
integer x = 1376
integer y = 388
integer width = 1051
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2.Testcasepoint:Median_Mode"
end type

event clicked;of_testcase_point_module1()
end event

type cb_1 from commandbutton within w_dw_event_function3
integer x = 37
integer y = 392
integer width = 1051
integer height = 132
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.Testcasepoint:Large_Small"
end type

event clicked;of_testcase_point_module()
end event

type dw_1 from datawindow within w_dw_event_function3
integer x = 23
integer y = 48
integer width = 1193
integer height = 336
integer taborder = 10
string dataobject = "d_large_small"
boolean vscrollbar = true
boolean livescroll = true
end type

