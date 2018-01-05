$PBExportHeader$w_prod_listview170310.srw
$PBExportComments$Listview of products, used by the w_add_sales_order
forward
global type w_prod_listview170310 from w_base_case
end type
type cb_1 from commandbutton within w_prod_listview170310
end type
type st_1 from statictext within w_prod_listview170310
end type
type lv_prod from listview within w_prod_listview170310
end type
end forward

global type w_prod_listview170310 from w_base_case
integer x = 494
integer y = 988
integer width = 2359
integer height = 988
string title = "Products"
long backcolor = 78168256
toolbaralignment toolbaralignment = alignatleft!
event ue_refresh_items ( )
event ue_postopen ( )
event ue_arrangeicons ( )
event ue_chglistview ( listviewview alvv_newview )
event ue_edititem ( )
cb_1 cb_1
st_1 st_1
lv_prod lv_prod
end type
global w_prod_listview170310 w_prod_listview170310

type variables
DataStore		ids_Products
Integer		ii_SortCol = 1, ii_WindowBorder = 15
grsorttype		igrs_Sort = ascending!

end variables

forward prototypes
public subroutine of_getcurrentstyle (ref listviewview alvv_Current)
public function string of_set_label (integer ai_row)
public subroutine of_testcase_point_module ()
end prototypes

event ue_refresh_items();Integer			li_Rows, li_Cnt, ll_count
ListViewItem	llvi_Item
string ls_label, ls_labels
string ls_labels_test

SetPointer(Hourglass!)

ls_labels_test = "/Tank Top	Tee Shirt	300	Small	White	18	$9.00;/V-neck	Tee Shirt	301	Medium	Orange	39	$14.00;/Crew Neck	Tee Shirt	302	One size fits all	Black	72	$14.00;/Cotton Cap	Baseball Cap	400	One size fits all	Black	92	$9.00;/Wool cap	Baseball Cap	401	One size fits all	White	12	$10.00;/Cloth Visor	Visor	500	One size fits all	White	36	$7.00;/Plastic Visor	Visor	501	One size fits all	Black	28	$7.00;/Hooded Sweatshirt	Sweatshirt	600	Large	Green	39	$24.00;/Zipped Sweatshirt	Sweatshirt	601	Large	Blue	32	$24.00;/Cotton Shorts	Shorts	700	Medium	Black	80	$15.00;"

lv_prod.DeleteItems()

// Retrieve data into the datastore
ids_Products.SetTransObject(sqlca)
li_Rows = ids_Products.Retrieve()

// Get all rows from the datastore and add as items to the listview
For li_Cnt = 1 To li_Rows
	llvi_Item.PictureIndex = lv_prod.AddLargePicture(ids_Products.Object.picture_name[li_Cnt])
	lv_prod.AddSmallPicture(ids_Products.Object.picture_name[li_Cnt])

	// Save the picture name in the data attribute so it can be referenced when the item is dropped.
	llvi_Item.Data = ids_Products.Object.picture_name[li_Cnt]
	
	// The label is comprised of all the data displayed in the Report view
	ls_label = of_set_label(li_Cnt)
	llvi_Item.Label = ls_label
	ls_labels += "/" + ls_label + ";"
	
	lv_prod.AddItem(llvi_Item)
Next

is_resultlog += wf_result_add("testcasepoint1",  "listview load datastore's data", ls_labels = ls_labels_test)
ll_count = lv_prod.TotalItems()

//is_resultlog += wf_result_add("testcasepoint1", "datastore has Rows:" + string(li_Rows) + "; listview has Rows:" +  string(ll_count), ll_count = li_Rows)
is_resultlog += wf_result_add("testcasepoint1", "datastore to listview", ll_count = li_Rows)
end event

event ue_arrangeicons;lv_prod.Arrange()

end event

event ue_chglistview;lv_prod.View = alvv_NewView

end event

event ue_edititem;Integer			li_Index
ListViewItem	llvi_Current

li_Index = lv_prod.SelectedIndex()
If li_Index <= 0 Then Return

lv_prod.Post Event DoubleClicked(li_Index)

end event

public subroutine of_getcurrentstyle (ref listviewview alvv_Current);// Return the style of the ListView
alvv_Current = lv_prod.View

end subroutine

public function string of_set_label (integer ai_row);// The label attribute of a ListView item contains the "data" displayed in the report view.
// Multiple columns separated by a tab ("~t") are displayed as the columns in the report
// view.  The first is displayed as the label on the icon in icon view.

Integer		li_Columns, li_Cnt
String		ls_Column, ls_Label
Long			ll_Value
Double		ldb_Value
Date			ldt_Value

li_Columns = Integer(ids_Products.Object.DataWindow.Column.Count)

For li_Cnt = 1 To li_Columns
	ls_Column = ids_Products.Describe("#" + String(li_Cnt) + ".Name")
	
	// Do not add any columns with 'Display as BitMap' checked
	If ids_Products.Describe(ls_Column + ".BitMapName")	= "no" Then
		If li_Cnt > 1 Then ls_Label += "~t"
	
		Choose Case Lower(Left(ids_Products.Describe(ls_Column + ".Coltype"), 3))
			Case "dec"
				ldb_Value = ids_Products.GetItemDecimal(ai_Row, ls_Column)
				ls_Label += String(ldb_Value, "$#0.00")
			Case "cha"
				ls_Label += ids_Products.GetItemString(ai_Row, ls_Column)
			Case "dat"
				ldt_Value = ids_Products.GetItemDate(ai_Row, ls_Column)
				ls_Label += String(ldt_Value)
			Case Else
				ll_Value = ids_Products.GetItemNumber(ai_Row, ls_Column)
				ls_Label += String(ll_Value)
		End Choose
	End If
Next

Return ls_Label

end function

public subroutine of_testcase_point_module ();Integer		li_Columns, li_Cnt, li_Width, li_count, li_itemcount, li_rc
String		ls_Column, ls_Label, ls_ColType, ls_coumns, ls_type
Alignment	lal_Align
string		ls_column_test


ls_column_test = "Product Description/char/576;Product Name/char/379;ID/long/146;Size/char/379;Color/char/229;Qty/long/183;Unit Price/deci/279;"
// 测试datastore 列装载到listview是否正确，如果正确，列数量应该相等

// Add the columns for report view.
li_Columns = Integer(ids_Products.Object.DataWindow.Column.Count)

For li_Cnt = 1 To li_Columns
	ls_Column = ids_Products.Describe("#" + String(li_Cnt) + ".Name")

	// Do not add any columns with 'Display as BitMap' checked
	If ids_Products.Describe(ls_Column + ".BitMapName")	= "no" Then

		ls_Label = ids_Products.Describe(ls_Column + "_t.Text")
		li_Width = Integer(ids_Products.Describe(ls_Column + ".Width"))
		ls_type =  Lower(Left(ids_Products.Describe(ls_Column + ".Coltype"), 4))
		If ls_type = "char" Then
			lal_Align = Left!
		Else
			lal_Align = Right!
		End If
	
		lv_prod.AddColumn(ls_Label, lal_Align, li_Width)
		li_itemcount ++
		ls_coumns +=ls_Label +"/" + ls_type + "/" + string(li_Width) + ";"
	End If
Next
is_resultlog += wf_result_add("testcasepoint1", "Listview load data",  ls_column_test = ls_coumns )
li_count = lv_prod.TotalColumns ( )
//is_resultlog += wf_result_add("testcasepoint1", "datastore has columns:" + string(li_itemcount) + "; listview has columns:" +  string(li_count),  li_itemcount = li_count)
is_resultlog += wf_result_add("testcasepoint1", "datastore to listview",  li_itemcount = li_count)

Event ue_refresh_items()



li_rc = lv_prod.Arrange()
is_resultlog += wf_result_add("testcasepoint1", "Listview exec Arrange()" ,  li_rc = 1)
end subroutine

on w_prod_listview170310.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.lv_prod)
end on

event close;call super::close;Destroy ids_Products

//If IsValid(im_PopMenu) Then
//	Destroy im_PopMenu
//End If
//
end event

on w_prod_listview170310.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_1=create st_1
this.lv_prod=create lv_prod
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.lv_prod
end on

event ue_preopen;call super::ue_preopen;// Using a datastore to retrieve data from the database
ids_Products = Create DataStore
ids_Products.DataObject = "d_products170310"

// Set the large and small picture sizes
lv_prod.LargePictureWidth = 48
lv_prod.LargePictureHeight = 48
lv_prod.SmallPictureWidth = 24
lv_prod.SmallPictureHeight = 24
end event

type cb_1 from commandbutton within w_prod_listview170310
integer x = 448
integer y = 728
integer width = 544
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.testcasepoint"
end type

event clicked;of_testcase_point_module()
end event

type st_1 from statictext within w_prod_listview170310
integer x = 14
integer y = 8
integer width = 2286
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 75530304
boolean enabled = false
string text = "Drag/Drop a product onto the order to add it.  Double-click a product to view it.  RMB to change the view."
long bordercolor = 8388608
boolean focusrectangle = false
end type

type lv_prod from listview within w_prod_listview170310
integer x = 14
integer y = 72
integer width = 2263
integer height = 608
integer taborder = 10
boolean dragauto = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean editlabels = true
boolean extendedselect = true
boolean hideselection = false
integer largepicturewidth = 32
integer largepictureheight = 32
long largepicturemaskcolor = 12632256
integer smallpicturewidth = 16
integer smallpictureheight = 16
long smallpicturemaskcolor = 12632256
long statepicturemaskcolor = 553648127
end type

event doubleclicked;//String			ls_ID
//ListViewItem	llvi_Item
//
//GetItem(index, 3, ls_ID)
//
//If Trim(ls_ID) <> "" Then
//	OpenWithParm(w_update_prod, Integer(ls_ID))
//	If Message.DoubleParm = 1 Then
//		Parent.Post Event ue_refresh_items()
//	End if
//End if
//
end event

event rightclicked;//If Not IsValid(im_PopMenu) Then
//	im_PopMenu = Create m_lv_rmb_prod
//End If
//
//If index < 1 Then
//	im_PopMenu.m_action.m_edititem.Enabled = False
//Else
//	im_PopMenu.m_action.m_edititem.Enabled = True
//End If
//
//If This.View = ListViewList! Or This.View = ListViewReport! Then
//	im_PopMenu.m_action.m_lineupicons.Enabled = False
//Else
//	im_PopMenu.m_action.m_lineupicons.Enabled = True
//End If
//
//im_PopMenu.m_action.PopMenu(Parent.PointerX(), Parent.PointerY())

end event

event columnclick;// Sort the list based on the column clicked.
// If the same column is clicked twice, sort descending.

If column <> ii_SortCol Then
	igrs_Sort = ascending!
	ii_SortCol = column
Else
	If igrs_Sort = ascending! Then
		igrs_Sort = descending!
	Else
		igrs_Sort = ascending!
	End if
End if

// Since all columns are strings, numeric values will not sort
// properly.  So call userdefined sort for Quantity and Unit Price.
// This will execute the "sort" event for each item comparison.

If column < 6 Then
	This.Sort(igrs_Sort, column)
Else
	This.Sort(userdefinedsort!, column)
End If

end event

event sort;// Sort by Quantity or Unit Price.  Convert the data
// to numbers before comparing.

String	ls_Item1, ls_Item2
Double	ldb_Item1, ldb_Item2

GetItem(index1, column, ls_Item1)
GetItem(index2, column, ls_Item2)

If column = 7 Then
	// Strip off the "$"
	ls_Item1 = Right(ls_Item1, (Len(ls_Item1) - 1))
	ls_Item2 = Right(ls_Item2, (Len(ls_Item2) - 1))
End If	

ldb_Item1 = Double(ls_Item1)
ldb_Item2 = Double(ls_Item2)

// This event returns:
// 0 - the two items are equal
// -1 - Item1 should be placed before Item2
// 1 - Item2 should be placed before Item1

If ldb_Item1 = ldb_Item2 Then Return 0

If igrs_Sort = ascending! Then
	If ldb_Item1 < ldb_Item2 Then
		Return -1
	Else
		Return 1
	End If
Else
	If ldb_Item1 < ldb_Item2 Then
		Return 1
	Else
		Return -1
	End If
End if

end event

