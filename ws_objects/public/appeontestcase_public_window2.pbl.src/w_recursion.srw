$PBExportHeader$w_recursion.srw
forward
global type w_recursion from w_base_case
end type
type cb_print from commandbutton within w_recursion
end type
type dw_print from datawindow within w_recursion
end type
type cb_expand from commandbutton within w_recursion
end type
type lb_file from listbox within w_recursion
end type
type cb_scan from commandbutton within w_recursion
end type
type cbx_dw from checkbox within w_recursion
end type
type tv_1 from treeview within w_recursion
end type
type dw_1 from datawindow within w_recursion
end type
type rr_1 from roundrectangle within w_recursion
end type
end forward

global type w_recursion from w_base_case
cb_print cb_print
dw_print dw_print
cb_expand cb_expand
lb_file lb_file
cb_scan cb_scan
cbx_dw cbx_dw
tv_1 tv_1
dw_1 dw_1
rr_1 rr_1
end type
global w_recursion w_recursion

type variables
Long  il_Row, il_RootItem
Boolean  ib_Cancel 
boolean  ib_lbfile_Reset, ib_lbfile_DirList, ib_tv_DeleteItem, ib_tv_ExpandItem
boolean  ib_dw_SetDetailHeight, ib_tv_ExpandAll,ib_dw_ImportString, ib_dw_Print
end variables

forward prototypes
public function long of_add_item (string as_path, string as_filename, long al_parent)
public function string of_build_dw_tree (long al_handle)
public function long of_recurse_dir_list (string as_path, integer al_parent)
public function integer wf_collapse_rows (datawindow adw_datawindow, long al_startrow)
public function integer wf_expand_row (datawindow adw_datawindow, long al_startrow)
public function integer wf_get_drive_index (string as_drive)
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
end prototypes

public function long of_add_item (string as_path, string as_filename, long al_parent);// Add a directory entry to the DataWindow or TreeView

Long					ll_NewItem
TreeViewItem		ltvi_Item

If cbx_dw.checked = true Then
	// Add a row to the DataWindow
	ll_NewItem = dw_1.Insertrow(0)
	dw_1.Object.fullname[ll_NewItem] = as_Path
	dw_1.Object.name[ll_NewItem] = as_FileName
	dw_1.Object.bmpname[ll_NewItem] = "folder.bmp"
	dw_1.Object.selectedbmpname[ll_NewItem] = "foldopen.bmp"
	dw_1.Object.selected[ll_NewItem] = 0
	dw_1.Object.open[ll_NewItem] = 0
	dw_1.Object.children[ll_NewItem] = 0
	dw_1.Object.siblings[ll_NewItem] =  0
	dw_1.Object.level[ll_NewItem] = al_Parent

	Return al_Parent + 1

Else
	// Add an item to the TreeView
	ltvi_Item.Label = as_FileName
	ltvi_Item.PictureIndex = 1
	ltvi_Item.SelectedPictureIndex = 2
	ll_NewItem = tv_1.InsertItemLast(al_Parent, ltvi_Item)

	Return ll_NewItem
End if

end function

public function string of_build_dw_tree (long al_handle);String				ls_Return
Long					ll_Next
TreeViewItem		ltvi_Item

If al_Handle <= 0 Then Return ""

tv_1.GetItem(al_Handle, ltvi_Item)

ls_Return = " ~t" + ltvi_Item.Label + "~t" + "folder.bmp" + "~t" + "foldopen.bmp"
If ltvi_Item.Selected Then
	ls_Return = ls_Return + "~t1"
Else
	ls_Return = ls_Return + "~t0"
End if
	
If ltvi_Item.Expanded Then
	ls_Return = ls_Return + "~t1"
Else
	ls_Return = ls_Return + "~t0"
End if

If ltvi_Item.Children Then
	ls_Return = ls_Return + "~t1~t0"
Else
	ls_Return = ls_Return + "~t0"
	If tv_1.FindItem(NextTreeItem!, al_Handle) > 0 Then
		ls_Return = ls_Return + "~t1" 
	Else
		ls_Return = ls_Return + "~t0"
	End if
End if

ls_Return = ls_Return + "~t" + String(ltvi_Item.Level) + "~r~n"

If ltvi_Item.Expanded And ltvi_Item.Children Then
	ll_Next = tv_1.FindItem(ChildTreeItem!, al_Handle)
	ls_Return = ls_Return + of_build_dw_tree(ll_Next)
End if

ll_Next = tv_1.FindItem(NextTreeItem!, al_Handle)
ls_Return = ls_Return + of_build_dw_tree(ll_Next)

Return ls_Return


end function

public function long of_recurse_dir_list (string as_path, integer al_parent);// This is the recurrsive procedure
// Scan all subdirectories of the selected directory

Integer	li_NumDirectories, li_Index , li_Pos1 ,li_Pos2, li_Pos, li_Len, li_Items
Long		ll_New
String	ls_FileName, ls_DirName, ls_SubDirectory[], ls_Delimeter, ls_AllFiles

// Allow other windows processing to continue during this recursive process
Do While Yield()
Loop

// Test if the user has canceled the scan
If ib_cancel Then Return 0

  //Set directory delimeter based on OS type
Choose Case ge_Environment.OSType
	Case Sol2!, HPUX!, AIX!
		ls_Delimeter = "/"
		ls_AllFiles = "*"
	Case Else
		ls_Delimeter = "\"
		ls_AllFiles = "*.*"
End Choose

If Right(as_Path, 1) <> ls_Delimeter Then
	as_Path = as_Path + ls_Delimeter
End if

// Get a listing of  sub directories from the directory passed
if lb_file.Reset() <> 1 then ib_lbfile_Reset = false   //testcase1
if lb_file.DirList(as_Path + ls_AllFiles, 32784) <> true then ib_lbfile_DirList = false  //testcase2


// Get just the last directory name ie skip the path
li_Pos = 1
li_Len = Len(as_Path) - 1
For li_Pos = li_Len to 1 Step -1
	If Mid(as_Path, li_Pos, 1) = ls_Delimeter Then Exit
Next

// Insert name, level. open is to allow collapsing of the structure			
ls_FileName = Mid(as_Path, li_Pos + 1, (Len(as_Path) - (li_Pos + 1)))

If ls_FileName = "" Then
	ls_FileName = as_Path
End if

// Insert the current directory working on into the datawindow. 
ll_New = of_add_item(as_Path, ls_FileName, al_Parent)

// Keep a local copy of the lb directories only
li_Items = lb_file.TotalItems()
li_NumDirectories = 0

Do While li_Index <= li_Items
	If left(lb_file.Text(li_Index), 1) = "[" Then
		li_NumDirectories++
		ls_SubDirectory[li_NumDirectories] = lb_file.Text(li_Index)
	End If
	li_Index++
Loop

// Call next level sub directories
li_Index = 1 
Do While  li_Index <=  li_NumDirectories
	If (ls_SubDirectory[li_Index] <> "[..]") And (ls_SubDirectory[li_Index] <> "[.]") Then
		ls_DirName = as_Path + ls_SubDirectory[li_Index] + ls_Delimeter

		// Strip the [ ] from the dir name	
		li_Pos1 = Pos(ls_dirname, "[")
		li_Pos2 = Pos(ls_dirname, "]")
		ls_DirName = Left(ls_DirName, li_Pos1 - 1) + &
						Mid(ls_DirName, li_Pos1 + 1, li_Pos2 - li_Pos1 - 1) + &
						Right (ls_DirName, Len(ls_DirName) - li_Pos2)
		
		// Here is the recurrsive call
		of_recurse_dir_list(ls_DirName, ll_New)
	End If
	li_Index++
Loop

Return 1

end function

public function integer wf_collapse_rows (datawindow adw_datawindow, long al_startrow);// This function is used for the DataWindow only
// Collapse all the rows that make up a level

Long		ll_Total, ll_Index, ll_EndRow
Integer	li_StartLevel

// Set the row open status back to closed
adw_DataWindow.object.open[al_StartRow] = 0

// Find out which level is being collapsed
li_StartLevel = adw_DataWindow.object.level[al_StartRow]

ll_Total = adw_DataWindow.RowCount()
If ll_Total = al_StartRow Then Return 0

SetPointer(hourglass!)

ll_EndRow = ll_Total

al_StartRow++
For ll_Index = al_StartRow  To ll_Total
	If adw_DataWindow.object.level[ll_Index] <= li_StartLevel Then
		ll_EndRow = ll_Index - 1
		Exit
	Else	
		adw_DataWindow.object.open[ll_Index] = 0
	End If
Next

adw_DataWindow.SetDetailHeight(al_StartRow, ll_EndRow, 0)

Return 0

end function

public function integer wf_expand_row (datawindow adw_datawindow, long al_startrow);// This function is used for the DataWindow only
// Expand all the rows for a level

Long		ll_Total, ll_EndRow, ll_Index
Integer	li_StartLevel

// Mark this row as open
adw_DataWindow.Object.open[al_StartRow] = 1

ll_Total = adw_DataWindow.RowCount()

If ll_Total = al_StartRow Then Return 0

SetPointer(hourglass!)

// Start with the row passed to begin exapanding
// Find out which level this is and search for the next level that is > = to this one

li_StartLevel = adw_DataWindow.Object.level[al_StartRow]

ll_EndRow = adw_DataWindow.Find("level <= " + String(li_StartLevel), al_StartRow + 1, ll_Total)
If ll_EndRow <=0 Then ll_EndRow = ll_Total

li_StartLevel ++

ll_Index = adw_DataWindow.Find("level = " + String(li_StartLevel), al_StartRow + 1, ll_EndRow)
// Set the rowheight to normal size for this selected range

Do While ll_Index > 0 
		adw_DataWindow.SetDetailHeight(ll_Index, ll_Index, 19)
		ll_Index++
		If ll_Index > ll_EndRow Then Exit
		ll_Index = adw_DataWindow.Find("level = " + String(li_StartLevel), ll_Index, ll_EndRow)
Loop	

adw_DataWindow.Sort()

Return 0

end function

public function integer wf_get_drive_index (string as_drive);//// Determine drive description based on return value from external function.
//
//UInt		lui_RC
//
//lui_RC = gu_ext_func.uf_GetDriveType (Asc (as_drive) - 97)
//
//Choose Case lui_RC
//		Case 2
//			Return 1
//
//		Case 3
//			Return 2
//
//		Case 4
//			Return 3
//
//		Case 5
//			Return 4
//
//		Case Else
//			Return 0
//End Choose
//
return 0
end function

public subroutine of_testcase_point_module ();ib_lbfile_Reset = true
ib_lbfile_DirList = true
ib_tv_DeleteItem = true
ib_tv_ExpandItem = true
ib_dw_SetDetailHeight = true
ib_tv_ExpandAll = true
ib_dw_Print = true

cbx_dw.checked = true  //dw scanf
cb_scan.triggerevent("clicked")

cbx_dw.checked = false  //tv scanf
cb_scan.triggerevent("clicked")

is_resultlog += wf_result_add("testcasepoint1", "ListBox.Reset()", &
                                             ib_lbfile_Reset = true)

is_resultlog += wf_result_add("testcasepoint2", "ListBox.DirList()", &
                                             ib_lbfile_DirList = true)

is_resultlog += wf_result_add("testcasepoint3", "TreeView.DeleteItem()", &
                                             ib_tv_DeleteItem = true)

is_resultlog += wf_result_add("testcasepoint4", "TreeView.ExpandItem()", &
                                             ib_tv_ExpandItem = true)

cbx_dw.checked = true  //dw expand all
cb_expand.triggerevent("clicked")

cbx_dw.checked = false  //tv expand all
cb_expand.triggerevent("clicked")

is_resultlog += wf_result_add("testcasepoint5", "DW.SetDetailHeight()", &
                                             ib_dw_SetDetailHeight = true)

is_resultlog += wf_result_add("testcasepoint6", "TreeView.ExpandAll()", &
                                             ib_tv_ExpandAll = true)



//dw&tv print
is_type = 'PrintCancel'
Timer(1)
cb_print.triggerevent("clicked")
is_resultlog += wf_result_add("testcasepoint7", "treeviewStyleDW.Print()", &
                                             ib_dw_Print = true)
															




end subroutine

public subroutine of_testcase_point_module1 ();
is_resultlog += wf_result_add("testcasepoint8", "RoundRectangle.Show()", &
                                             rr_1.show() = 1)
															
															
is_resultlog += wf_result_add("testcasepoint9", "ListBox.SetTop()", &
                                             lb_file.SetTop(1) = 1)
end subroutine

on w_recursion.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.dw_print=create dw_print
this.cb_expand=create cb_expand
this.lb_file=create lb_file
this.cb_scan=create cb_scan
this.cbx_dw=create cbx_dw
this.tv_1=create tv_1
this.dw_1=create dw_1
this.rr_1=create rr_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.dw_print
this.Control[iCurrent+3]=this.cb_expand
this.Control[iCurrent+4]=this.lb_file
this.Control[iCurrent+5]=this.cb_scan
this.Control[iCurrent+6]=this.cbx_dw
this.Control[iCurrent+7]=this.tv_1
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.rr_1
end on

on w_recursion.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.dw_print)
destroy(this.cb_expand)
destroy(this.lb_file)
destroy(this.cb_scan)
destroy(this.cbx_dw)
destroy(this.tv_1)
destroy(this.dw_1)
destroy(this.rr_1)
end on

event timer;call super::timer;if lower(is_type) = lower("PrintCancel") then 
	wf_closepopwindow( "Save the file as", 'Save')
	wf_closepopwindow( "Print to File", 'OK')
	wf_closepopwindow( "Save Print Output As", 'Save')			//for win10 print machine
end if
end event

event ue_cleantempfile;call super::ue_cleantempfile;//Clear File PrintCancelTest1.xps
if FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps") then
	FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps")
end if

//Clear File PrintCancelTest1.xps on WIN10
if FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps") then
	FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps")
end if

//移除测试环境文件夹
ChangeDirectory(gs_cachedir)
RemoveDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testA' + gs_dirseparator + 'testAA')
RemoveDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testA' + gs_dirseparator + 'testAA2')
RemoveDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testA' + gs_dirseparator + 'testAA3')
RemoveDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testA')
RemoveDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testB' + gs_dirseparator + 'testBB2' + gs_dirseparator + 'testBBB')
RemoveDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testB' + gs_dirseparator + 'testBB')
RemoveDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testB' + gs_dirseparator + 'testBB2')
RemoveDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testB')
RemoveDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testC')
RemoveDirectory(gs_cachedir + gs_dirseparator + 'test')
end event

type cb_print from commandbutton within w_recursion
integer x = 210
integer y = 1404
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print"
end type

event clicked;//Clear File PrintCancelTest1.xps
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps")
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps")

dw_print.Reset()
if dw_print.ImportString(of_build_dw_tree(il_RootItem)) <> 4 then ib_dw_ImportString = false
if dw_print.Print() <> 1 then ib_dw_Print = false


end event

type dw_print from datawindow within w_recursion
boolean visible = false
integer x = 1120
integer y = 1184
integer width = 795
integer height = 364
integer taborder = 10
string title = "none"
string dataobject = "d_dir_tree"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;//used for drill down

If row > 0 And Not IsNull(dwo) Then
	This.SetRedraw(False)
	
	If This.Object.open[row] = 1 Then
		wf_collapse_rows(This, row)
	Else
		wf_expand_row(This, row)
	End If
	
	This.SetRedraw(True)
End If

end event

event clicked;// Used for drill down

if row <= 0 then return

This.SetRedraw(False)

If il_Row > 0 And il_Row <> row Then
	This.Object.selected[il_Row] = 0
End If

If Not IsNull(dwo) Then
	This.Object.selected[row] = 1
	il_Row = row

	If dwo.name = "clickbox" Then
		If This.Object.showbox[row] = 1 Then
			
			If This.Object.open[row] = 1 Then
				wf_collapse_rows(This, row)
			Else
				wf_expand_row(This, row)
			End if
		End if
	End if
End If
			
This.SetRedraw(True)

end event

type cb_expand from commandbutton within w_recursion
integer x = 677
integer y = 1240
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Expand All"
end type

event clicked;Long		ll_Rows, ll_Cnt

SetPointer(HourGlass!)

If cbx_dw.checked = true Then
	// Expand all datawindow rows
	dw_1.SetRedraw(False)
	ll_Rows = dw_1.RowCount()
	For ll_Cnt = 1 To ll_Rows
		dw_1.Object.open[ll_Cnt] = 1
		if dw_1.SetDetailHeight(ll_Cnt, ll_Cnt, 19) <> 1 then ib_dw_SetDetailHeight = false
	Next
	dw_1.SetRedraw(True)
Else
	// Expand the treeview
	if tv_1.ExpandAll(il_RootItem) <> 1 then ib_tv_ExpandAll = false
End If

end event

type lb_file from listbox within w_recursion
integer x = 2098
integer y = 1220
integer width = 411
integer height = 324
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
boolean border = false
borderstyle borderstyle = stylelowered!
end type

type cb_scan from commandbutton within w_recursion
integer x = 219
integer y = 1236
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Scan"
end type

event clicked;// This button will display Scan normally.. 
// During a scan, the text changes to Cancel.

String	ls_CurPath, ls_result

// Test if this is a scan or cancel button
If This.text = "C&ancel" Then
	ib_Cancel = True
	Return
End If	

// Here down is Scan button only

// 创建测试环境文件夹
ls_CurPath = gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator
if CreateDirectory(gs_cachedir + gs_dirseparator + 'test') <> 1 then
    ls_result +=" testcasepoint31 environment test directory Create= "+String ( "Fail!" ) +"~r~n"
else
	CreateDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testA')
	CreateDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testA' + gs_dirseparator + 'testAA')
	CreateDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testA' + gs_dirseparator + 'testAA2')
	CreateDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testA' + gs_dirseparator + 'testAA3')
	CreateDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testB')
	CreateDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testB' + gs_dirseparator + 'testBB')
	CreateDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testB' + gs_dirseparator + 'testBB2')
	CreateDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testB' + gs_dirseparator + 'testBB2' + gs_dirseparator + 'testBBB')
	CreateDirectory(gs_cachedir + gs_dirseparator + 'test' + gs_dirseparator + 'testC')
end if



dw_1.SetRedraw(False)
tv_1.SetRedraw(False)

// Allow cancel out of recursive process
This.Text = "C&ancel"
ib_Cancel = False

// Reset the datawindow or treeview and start the recursion process
// by calling the local window function.
If cbx_dw.checked = true Then
	// Use DataWindow
	dw_1.Reset( )
	of_recurse_dir_list(ls_CurPath, 1)
	wf_collapse_rows(dw_1, 1)
	wf_expand_row(dw_1,1)
Else
	// Use TreeView
	if tv_1.DeleteItem(il_RootItem) <> 1 then ib_tv_DeleteItem = false  //testcase 
	il_RootItem = of_recurse_dir_list(ls_CurPath, 0)
	if tv_1.ExpandItem(il_RootItem) <> 1 then ib_tv_ExpandItem = false 
End if


This.Text = "Scan"

// Reset the current working directory
//lb_1.DirList(st_curr_path.Text + "\*.*",0)    //测试默认路径

dw_1.SetRedraw(True)
tv_1.SetRedraw(True)



end event

type cbx_dw from checkbox within w_recursion
integer x = 1024
integer y = 60
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "check dw"
end type

type tv_1 from treeview within w_recursion
integer x = 1294
integer y = 164
integer width = 1253
integer height = 968
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 12632256
long statepicturemaskcolor = 536870912
end type

type dw_1 from datawindow within w_recursion
integer x = 73
integer y = 160
integer width = 1106
integer height = 972
integer taborder = 10
string title = "none"
string dataobject = "d_dir_tree"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;// Used for drill down

if row <= 0 then return

This.SetRedraw(False)

If il_Row > 0 And il_Row <> row Then
	This.Object.selected[il_Row] = 0
End If

If Not IsNull(dwo) Then
	This.Object.selected[row] = 1
	il_Row = row

	If dwo.name = "clickbox" Then
		If This.Object.showbox[row] = 1 Then
			
			If This.Object.open[row] = 1 Then
				wf_collapse_rows(This, row)
			Else
				wf_expand_row(This, row)
			End if
		End if
	End if
End If
			
This.SetRedraw(True)

end event

event buttonclicked;//used for drill down

If row > 0 And Not IsNull(dwo) Then
	This.SetRedraw(False)
	
	If This.Object.open[row] = 1 Then
		wf_collapse_rows(This, row)
	Else
		wf_expand_row(This, row)
	End If
	
	This.SetRedraw(True)
End If

end event

type rr_1 from roundrectangle within w_recursion
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 134217856
integer x = 649
integer y = 1400
integer width = 320
integer height = 96
integer cornerheight = 40
integer cornerwidth = 46
end type

