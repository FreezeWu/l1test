$PBExportHeader$w_data_manager170310.srw
$PBExportComments$Data Manager (Program Manager-style ListViews)
forward
global type w_data_manager170310 from w_base_case
end type
type cb_3 from commandbutton within w_data_manager170310
end type
type cb_1 from commandbutton within w_data_manager170310
end type
type lv_1 from listview within w_data_manager170310
end type
end forward

global type w_data_manager170310 from w_base_case
integer x = 41
integer y = 20
integer width = 2231
integer height = 1236
long backcolor = 79416533
toolbaralignment toolbaralignment = alignatleft!
event ue_populate ( )
event ue_edititem ( )
event ue_arrangeicons ( )
event ue_openitem ( )
event ue_setdefaultstyle ( listviewview alvv_style )
event ue_refresh ( )
cb_3 cb_3
cb_1 cb_1
lv_1 lv_1
end type
global w_data_manager170310 w_data_manager170310

type variables
integer                                 ii_columns
integer                                 ii_level
integer                                 ii_openpos
integer                                 ii_parm1
integer                                 ii_parm2
integer		            ii_sortcol = 2
// Window border to be used on all sides. (resize service)
integer		            ii_windowborder = 15	
string		            is_dataobject[4]
datastore		            ids_data
grsorttype		            igrs_sort = ascending!
//w_data_manager_frame      iw_frame
string  is_tree_data



end variables

forward prototypes
public function integer of_add_lv_items (integer ai_level, integer ai_rows)
public subroutine of_set_lv_item (integer ai_level, integer ai_row, ref listviewitem alvi_new)
public subroutine of_getcurrentstyle (ref listviewview alvv_Current)
public subroutine of_testcase_point_module ()
end prototypes

event ue_populate();Integer		li_Rows, li_Cnt

// Determine which set of data to display
lv_1.DeleteItems()
ids_Data.dataobject = is_DataObject[ii_Level]
ids_Data.SetTransObject(sqlca)
li_Rows = ids_Data.Retrieve(ii_Parm1, ii_Parm2)
of_add_lv_items(ii_Level, li_Rows)

end event

event ue_edititem();//Integer			li_Index, li_Level
//Long				ll_Parent
//n_cst_parms	lnv_Parm
//ListViewItem	llvi_Current
//
//li_Index = lv_1.SelectedIndex()
//If li_Index <= 0 Then Return
//If lv_1.GetItem(li_Index, llvi_Current) = -1 Then Return
//
//// Filter the DW to show only the proper row
//Choose Case ii_Level
//	Case 1
//		lnv_Parm.is_Filter = "employee_emp_id = " + String(llvi_Current.Data)
//	Case 2
//		lnv_Parm.is_Filter = "customer_id = " + String(llvi_Current.Data)
//	Case 3
//		lnv_Parm.is_Filter = "id = " + String(llvi_Current.Data)
//	Case 4
//		lnv_Parm.is_Filter = "line_id = " + String(llvi_Current.Data)
//End Choose
//
//lnv_Parm.ii_Parm1 = ii_Parm1
//lnv_Parm.ii_Parm2 = ii_Parm2
//lnv_Parm.iw_Parent = This
//lnv_Parm.is_DataObject = ids_Data.DataObject
//ii_OpenPos = ii_OpenPos + 80
//If ii_OpenPos > 1020 Then ii_OpenPos = 0
//lnv_Parm.ii_OpenPos = ii_OpenPos
//lnv_Parm.iw_Frame = iw_Frame
//
//OpenWithParm(w_data_edit, lnv_Parm)
//
//If iw_Frame.ib_MinimizeOnUse Then
//	iw_Frame.WindowState = Minimized!
//End If
//
end event

event ue_arrangeicons;lv_1.Arrange()

end event

event ue_openitem;Integer			li_Index
ListViewItem	llvi_Current

li_Index = lv_1.SelectedIndex()
If li_Index <= 0 Then Return

lv_1.Post Event DoubleClicked(li_Index)

end event

event ue_setdefaultstyle;lv_1.View = alvv_style

end event

event ue_refresh;// Refresh the ListView

ids_Data.Reset()

lv_1.DeleteItems()

Trigger Event ue_populate()

end event

public function integer of_add_lv_items (integer ai_level, integer ai_rows);// Function to add the items to the ListView using the data in the DataStore

Integer				li_Cnt
ListViewItem		llvi_New

// Delete all existing columns from the ListView
lv_1.DeleteColumns()

// Add the columns to the ListView
Choose Case ai_Level
	Case 1
		lv_1.AddColumn("Name", Left!, 500)
		lv_1.AddColumn("ID", Left!, 150)
		lv_1.AddColumn("Dept", Left!, 150)
		lv_1.AddColumn("Manager", Left!, 235)
		lv_1.AddColumn("Status", Center!, 175)
		lv_1.AddColumn("Phone #", Left!, 350)
		lv_1.AddColumn("Salary", Right!, 280)
		ii_Columns = 7
	Case 2
		lv_1.AddColumn("Company Name", Left!, 700)
		lv_1.AddColumn("ID", Left!, 150)
		lv_1.AddColumn("Contact Name", Left!, 500)
		lv_1.AddColumn("Address", Left!, 1150)
		lv_1.AddColumn("Phone #", Left!, 350)
		ii_Columns = 5
	Case 3
		lv_1.AddColumn("Order ID", Left!, 225)
		lv_1.AddColumn("Date", Left!, 250)
		lv_1.AddColumn("Financial Code", Center!, 375)
		lv_1.AddColumn("Region", Left!, 250)
		ii_Columns = 4
	Case 4
		lv_1.AddColumn("Product Description", Left!, 500)
		lv_1.AddColumn("Line #", Right!, 175)
		lv_1.AddColumn("ID", Left!, 150)
		lv_1.AddColumn("Ship Date", Left!, 275)
		lv_1.AddColumn("Qty", Right!, 150)
		lv_1.AddColumn("Unit Price", Right!, 250)
		lv_1.AddColumn("Total", Right!, 250)
		ii_Columns = 7
End Choose

// Add each item to the ListView
For li_Cnt = 1 To ai_Rows
	// Call a function to set the values of the ListView item from 
	// the DataStore data
	of_set_lv_item(ai_Level, li_Cnt, llvi_New)
	
	// Add the item after the last child
	If lv_1.AddItem(llvi_New) < 1 Then
		// Error
		//MessageBox("Error", "Error adding item to the ListView", Exclamation!)
		is_resultlog += wf_result_add("testcasepoint1", "Error adding item to the ListView", False)
		Return -1
	End If
Next

//is_resultlog += wf_result_add("testcasepoint1", "Level:" + string(ai_level) +";Rows:" + string(ai_rows), True)
is_tree_data +=  "Level:" + string(ai_level) +";Rows:" + string(ai_rows) + ";"

Return ai_Rows

end function

public subroutine of_set_lv_item (integer ai_level, integer ai_row, ref listviewitem alvi_new);// Set the Lable and Data attributes for the new item from the data in the DataStore

Integer	li_Picture
String	ls_Phone
Double	ldb_Number

Choose Case ai_Level
	Case 1
		alvi_New.Label = ids_Data.Object.employee_emp_lname[ai_Row] + ", " + &
									ids_Data.Object.employee_emp_fname[ai_Row] + "~t" + &
									String(ids_Data.Object.employee_emp_id[ai_Row]) + "~t" + &
									String(ids_Data.Object.employee_dept_id[ai_Row]) + "~t" + &
									String(ids_Data.Object.employee_manager_id[ai_Row]) + "~t" + &
									ids_Data.Object.employee_status[ai_Row] + "~t"
		ls_Phone = ids_Data.Object.employee_phone[ai_Row]
		alvi_New.Label = alvi_New.Label + String(ls_Phone, "(@@@)@@@-@@@@") + "~t"
		ldb_Number = ids_Data.Object.employee_salary[ai_Row]
		alvi_New.Label = alvi_New.Label + String(ldb_Number, "$#0,000.00")
		
		alvi_New.Data = ids_Data.Object.employee_emp_id[ai_Row]
		
	Case 2
		alvi_New.Label = ids_Data.Object.customer_company_name[ai_Row] + "~t" + &
									String(ids_Data.Object.customer_id[ai_Row]) + "~t" + &
									ids_Data.Object.customer_lname[ai_Row] + ", " + &
									ids_Data.Object.customer_fname[ai_Row] + "~t" + &
									ids_Data.Object.customer_address[ai_Row] + ", " + &
									ids_Data.Object.customer_city[ai_Row] + ", " + &
									ids_Data.Object.customer_state[ai_Row] + "  " + &
									ids_Data.Object.customer_zip[ai_Row] + "~t"
		ls_Phone = ids_Data.Object.customer_phone[ai_Row]
		alvi_New.Label = alvi_New.Label + String(ls_Phone, "(@@@)@@@-@@@@")
									
		alvi_New.Data = ids_Data.Object.customer_id[ai_Row]
		
	Case 3
		alvi_New.Label = String(ids_Data.Object.id[ai_Row]) + "~t" + &
									String(ids_Data.Object.order_date[ai_Row], "mm/dd/yy") + "~t" + &
									ids_Data.Object.fin_code_id[ai_Row] + "~t" + &
									ids_Data.Object.region[ai_Row]
									
		alvi_New.data = ids_Data.Object.id[ai_Row]
		
	Case 4
		alvi_New.Label = ids_Data.Object.product_description[ai_Row] + "~t" + &
									String(ids_Data.Object.line_id[ai_Row]) + "~t" + &
									String(ids_Data.Object.prod_id[ai_Row]) + "~t" + &
									String(ids_Data.Object.ship_date[ai_Row], "mm/dd/yy") + "~t" + &
									String(ids_Data.Object.quantity[ai_Row]) + "~t"
		ldb_Number = ids_Data.Object.product_unit_price[ai_Row]
		alvi_New.Label = alvi_New.Label + String(ldb_Number, "$#0.00") + "~t"
		ldb_Number = ids_Data.Object.total_cost[ai_Row]
		alvi_New.Label = alvi_New.Label + String(ldb_Number, "$#,##0.00")

		alvi_New.Data = ids_Data.Object.line_id[ai_Row]
End Choose


If ai_Level < 4 Then
	alvi_New.PictureIndex = ai_Level
Else
	// Set the picture to be the product picture
	li_Picture = lv_1.AddLargePicture(ids_Data.Object.product_picture_name[ai_Row])
	lv_1.AddSmallPicture(ids_Data.Object.product_picture_name[ai_Row])
	alvi_New.PictureIndex = li_Picture
End If

// 测试Datastore中的数据是否正确
//is_resultlog += wf_result_add("testcasepoint1", "Label:" + alvi_New.Label + ";Data:" +string(alvi_New.Data), True)
is_tree_data += "Label:" + alvi_New.Label + ";Data:" +string(alvi_New.Data) + ";"
end subroutine

public subroutine of_getcurrentstyle (ref listviewview alvv_Current);// Return the style of the ListView
alvv_Current = lv_1.View

end subroutine

public subroutine of_testcase_point_module ();Integer		li_Rows, li_Cnt
ListViewItem		llvi_Current

// Determine which set of data to display
ii_Level = 1
This.TriggerEvent("ue_populate")


// 按第二层数据源显示

ii_Level = 2
If lv_1.GetItem(1, llvi_Current) = -1 Then Return
ii_Parm1 = llvi_Current.Data
ii_Parm2 = ii_Parm1
This.TriggerEvent("ue_populate")


// 按第三层数据源显示
ii_Level = 3
If lv_1.GetItem(1, llvi_Current) = -1 Then Return
//ii_Parm2 = ii_Parm1
ii_Parm1 = llvi_Current.Data
This.TriggerEvent("ue_populate")


n_resource_manager ln_resource_manager
string ls_filename, ls_data_test
ls_filename = 'w_data_manager170310' +"_tree_data"
ls_data_test = ln_resource_manager.f_get_resource(ls_filename+ ".txt")

is_resultlog += wf_result_add("testcasepoint1", "listview load data", ls_data_test = is_tree_data )

end subroutine

on w_data_manager170310.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_1=create cb_1
this.lv_1=create lv_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.lv_1
end on

on w_data_manager170310.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.lv_1)
end on

event close;// Destroy DataStore used by this example
Destroy ids_Data


end event

event ue_preopen;call super::ue_preopen;Integer			li_Cnt
String			ls_Label


// Create DataStore used by this example
ids_Data = Create DataStore

// This window could display data from any of these objects
is_DataObject[1] = "d_sales_reps170310"
is_DataObject[2] = "d_sales_rep_customers170310"
is_DataObject[3] = "d_sales_rep_customer_orders170310"
is_DataObject[4] = "d_salesorder_items170310"






end event

type cb_3 from commandbutton within w_data_manager170310
integer x = 1170
integer y = 992
integer width = 608
integer height = 132
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update resource file"
end type

event clicked;// 写入treeview data to database
string ls_filename
n_resource_manager ln_resource_manager

ls_filename = 'w_data_manager170310' +"_tree_data"


ln_resource_manager.f_insert_resource(ls_filename+ ".txt", is_tree_data)

end event

type cb_1 from commandbutton within w_data_manager170310
integer x = 384
integer y = 992
integer width = 585
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.testcasepoint1"
end type

event clicked;of_testcase_point_module()
end event

type lv_1 from listview within w_data_manager170310
integer x = 5
integer y = 8
integer width = 2094
integer height = 976
integer taborder = 20
boolean dragauto = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
borderstyle borderstyle = stylelowered!
boolean hideselection = false
string largepicturename[] = {"emp.ico","Library!","DosEdit!"}
integer largepicturewidth = 32
integer largepictureheight = 32
long largepicturemaskcolor = 12632256
string smallpicturename[] = {"emp.ico","Library!","DosEdit!"}
integer smallpicturewidth = 16
integer smallpictureheight = 16
long smallpicturemaskcolor = 12632256
long statepicturemaskcolor = 553648127
end type

event columnclick;If column <> ii_SortCol Then
	igrs_Sort = ascending!
	ii_SortCol = column
Else
	If igrs_Sort = ascending! Then
		igrs_Sort = descending!
	Else
		igrs_Sort = ascending!
	End if
End if

This.Sort(igrs_Sort, column)

end event

