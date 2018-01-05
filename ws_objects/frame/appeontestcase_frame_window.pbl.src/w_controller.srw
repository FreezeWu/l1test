$PBExportHeader$w_controller.srw
forward
global type w_controller from w_base
end type
type st_2 from statictext within w_controller
end type
type rb_2 from radiobutton within w_controller
end type
type rb_1 from radiobutton within w_controller
end type
type cbx_4 from checkbox within w_controller
end type
type cbx_3 from checkbox within w_controller
end type
type cbx_2 from checkbox within w_controller
end type
type cb_7 from commandbutton within w_controller
end type
type sle_1 from singlelineedit within w_controller
end type
type st_1 from statictext within w_controller
end type
type cb_6 from commandbutton within w_controller
end type
type cb_5 from commandbutton within w_controller
end type
type cb_3 from commandbutton within w_controller
end type
type cbx_1 from checkbox within w_controller
end type
type cb_2 from commandbutton within w_controller
end type
type cb_1 from commandbutton within w_controller
end type
type dw_1 from datawindow within w_controller
end type
type gb_1 from groupbox within w_controller
end type
type gb_2 from groupbox within w_controller
end type
end forward

global type w_controller from w_base
integer width = 3799
integer height = 2004
windowstate windowstate = maximized!
st_2 st_2
rb_2 rb_2
rb_1 rb_1
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cb_7 cb_7
sle_1 sle_1
st_1 st_1
cb_6 cb_6
cb_5 cb_5
cb_3 cb_3
cbx_1 cbx_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_controller w_controller

type variables
long 		il_find

string 	is_testcase

string 	is_choosecaseid
string 	is_savetoposition
end variables

forward prototypes
public subroutine wf_filter ()
public subroutine wf_setflag ()
public subroutine wf_runtimeresult (ref string as_result)
public subroutine wf_update (integer ai_row)
public subroutine wf_find ()
public subroutine wf_selecteditem ()
public function boolean of_createfile (string as_filename, string as_text)
public function boolean of_createfile (string as_filename, transaction at_trans)
public function integer wf_writefile (string as_filename, blob ablb_data)
end prototypes

public subroutine wf_filter ();//
string ls_filter
string ls_runmode

if cbx_1.checked then
	choose case appeongetclienttype()
		case 'PB'
			ls_runmode = "00100"
			ls_filter = "l1flag=1 and mid(runmode,3,1)='1'"
		case 'WEB'
			ls_runmode = "10000"
			ls_filter = "l1flag=1 and mid(runmode,1,1)='1'"
		case "MOBILE"
			ls_runmode = "01000"
			ls_filter = "l1flag=1 and mid(runmode,2,1)='1'"
	end choose
else
	choose case appeongetclienttype()
		case 'PB'
			ls_runmode = "00100"
			ls_filter = "mid(runmode,3,1)='1'"
		case 'WEB'
			ls_runmode = "10000"
			ls_filter = "mid(runmode,1,1)='1'"
		case "MOBILE"
			ls_runmode = "01000"
			ls_filter = "mid(runmode,2,1)='1'"
	end choose
end if
//setnull(ls_filter)
dw_1.setfilter(ls_filter)
dw_1.filter( )

end subroutine

public subroutine wf_setflag ();if gi_rightmode = 3 then
	cbx_2.enabled = false
end if

//重新resize控件
ieon_resize.of_setflag(dw_1,"0022")


ieon_resize.of_setflag(gb_1,"2000")
ieon_resize.of_setflag(cbx_1,"2000")
ieon_resize.of_setflag(cb_5,"2000")
ieon_resize.of_setflag(st_2,"2000")
ieon_resize.of_setflag(cb_6,"2000")
ieon_resize.of_setflag(st_1,"2000")
ieon_resize.of_setflag(sle_1,"2000")

ieon_resize.of_setflag(gb_2,"2200")
ieon_resize.of_setflag(rb_1,"2200")
ieon_resize.of_setflag(rb_2,"2200")
ieon_resize.of_setflag(cb_1,"2200")
ieon_resize.of_setflag(cb_2,"2200")
ieon_resize.of_setflag(cb_3,"2200")
ieon_resize.of_setflag(cb_7,"2200")
end subroutine

public subroutine wf_runtimeresult (ref string as_result);//
is_runtimeresult = as_result
end subroutine

public subroutine wf_update (integer ai_row);//
dw_1.setitem(ai_row,"realvalue",is_runtimeresult)
dw_1.setitem(ai_row,"executeuser",gi_userid)
dw_1.setitem(ai_row,"executetime",today())

if cbx_2.checked then
	dw_1.setitem(ai_row,"expectvalue",is_runtimeresult)
end if



end subroutine

public subroutine wf_find ();long ll_end
string ls_find


ll_end = dw_1.rowcount( )

if il_find >= ll_end then
	il_find = 0
end if

ls_find = "testcasename like'%"+sle_1.text+"%'"

il_find = dw_1.find(ls_find,il_find+1,ll_end)

if il_find > 0 then
	dw_1.selectrow( 0,false)
	dw_1.selectrow( il_find,true)
end if
end subroutine

public subroutine wf_selecteditem (); long ll_row
 string ls_flag
 string ls_testcasename,ls_testcaseid
 is_testcase = ''
 for ll_row = 1 to dw_1.rowcount( )
	ls_flag = dw_1.getitemstring(ll_row,'ccheck')
	if ls_flag = '1' then
		ls_testcaseid = dw_1.getitemstring(ll_row,"testcaseid")
//		ls_testcasename = dw_1.getitemstring(ll_row,"testcasename")
//		gf_exetestcase(ls_testcasename)
//		//设置runtime数据
//		wf_update(ll_row)
		is_testcase += "'"+ls_testcaseid+"',"
	end if
next
end subroutine

public function boolean of_createfile (string as_filename, string as_text);//====================================================================
// Function: of_createfile()
//--------------------------------------------------------------------
// Description: Write Text File
//--------------------------------------------------------------------
// Arguments:  String   as_filename
//					String   as_text
//--------------------------------------------------------------------
// Returns:    Boolean
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/11/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
integer li_FileNum

// Set a wait cursor
SetPointer(HourGlass!)

if FileLength(as_text) > 32765 then return false
if FileExists(as_filename) then FileDelete(as_Filename)


li_FileNum = FileOpen(as_filename,LineMode!,Write!,LockWrite!,Append!)
IF FileWrite(li_FileNum,as_text) < 0 then Return False
FileClose(li_FileNum)

SetPointer(Arrow!)


return true
end function

public function boolean of_createfile (string as_filename, transaction at_trans);//====================================================================
// Function: of_createfile()
//--------------------------------------------------------------------
// Description: Write Text File
//--------------------------------------------------------------------
// Arguments:  String   		as_filename
//					Transaction    at_trans
//--------------------------------------------------------------------
// Returns:    Boolean
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/11/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
integer li_FileNum,li_Writes,li_Cnt
blob    lb_blob,lblb_Data
string  ls_name
long    ll_BlobLen,ll_CurrentPos

// Set a wait cursor
SetPointer(HourGlass!)

if FileExists(as_filename) then
	FileDelete(as_Filename)
end if

//Get File Name
if pos(as_filename,'\') > 0 then	
	ls_name = mid(as_filename,lastpos(as_filename,'\') + 1)
else
	ls_name = as_filename
end if

//Get File
selectblob fileres into :lb_blob from caseresfile where filename = :ls_name using at_trans;
if at_trans.sqlcode <> 0 then return false

//Write File
li_FileNum = FileOpen(as_filename,StreamMode!,Write!,LockReadWrite!, Append!)
If li_FileNum < 0 Then Return False
ll_BlobLen = len(lb_blob) 

// Determine the number of writes required to write the entire blob
If ll_BlobLen > 32765 Then
	 If Mod(ll_BlobLen, 32765) = 0 Then
		 li_Writes = ll_BlobLen / 32765
	 Else
		 li_Writes = (ll_BlobLen / 32765) + 1
	 End if
Else
 	li_Writes = 1
End if 

ll_CurrentPos = 1 
For li_Cnt = 1 To li_Writes
    lblb_Data = BlobMid(lb_blob, ll_CurrentPos, 32765)
    ll_CurrentPos += 32765
	 
	 If FileWrite(li_FileNum, lblb_Data) = -1 Then
		 Return False
	 End if
Next

FileClose(li_FileNum)
SetPointer(Arrow!)
return true
end function

public function integer wf_writefile (string as_filename, blob ablb_data);integer li_FileNo, li_Writes, li_Cnt
long ll_BlobLen, ll_CurrentPos
blob lblb_Data

//if isNULL(as_filename) or isNULL(ablb_Data) then 
//	setNULL(li_Cnt)
//	return li_Cnt
//end if

if fileexists(as_filename) then filedelete(as_filename)

li_FileNo = FileOpen(as_filename, StreamMode!, &
						    Write!, LockReadWrite!, Append!)

If li_FileNo < 0 Then Return -1
ll_BlobLen = Len(ablb_Data)
// Determine the number of writes required 
// to write the entire blob
If ll_BlobLen > 32765 Then
   If Mod(ll_BlobLen, 32765) = 0 Then
      li_Writes = ll_BlobLen / 32765
   Else
      li_Writes = (ll_BlobLen / 32765) + 1
   End if
Else
   li_Writes = 1
End if
ll_CurrentPos = 1
For li_Cnt = 1 To li_Writes
   lblb_Data = BlobMid(ablb_Data, ll_CurrentPos, 32765)
   ll_CurrentPos += 32765
   If FileWrite(li_FileNo, lblb_Data) = -1 Then
      Return -1
   End if
Next
FileClose(li_FileNo)

Return 1
end function

on w_controller.create
int iCurrent
call super::create
this.st_2=create st_2
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cb_7=create cb_7
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_3=create cb_3
this.cbx_1=create cbx_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.cbx_4
this.Control[iCurrent+5]=this.cbx_3
this.Control[iCurrent+6]=this.cbx_2
this.Control[iCurrent+7]=this.cb_7
this.Control[iCurrent+8]=this.sle_1
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.cb_6
this.Control[iCurrent+11]=this.cb_5
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.cbx_1
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.dw_1
this.Control[iCurrent+17]=this.gb_1
this.Control[iCurrent+18]=this.gb_2
end on

on w_controller.destroy
call super::destroy
destroy(this.st_2)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cb_7)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_3)
destroy(this.cbx_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;dw_1.settransobject( sqlca)
dw_1.retrieve( )

//不再展开所有测试点
//dw_1.ExpandAll( )
//add by zhoujunwei at 2017-11-29 加入排序功能
dw_1.setsort( "compute_1 A,testcasename A")
dw_1.sort( )


string 		ls_arrayid[], ls_testcaseid, ls_flag, ls_global_path
n_string		ln_string
long 			i, ll_count

ls_global_path = 	gs_cachedir + gs_dirseparator + "testcase.ini"
is_choosecaseid = profilestring(ls_global_path,"settings","choosecaseid","")
is_savetoposition = profilestring(ls_global_path,"settings","savetoposition","file")

if not isnull(is_choosecaseid) and is_choosecaseid <> "" then
	ln_string = create n_string	
	ln_string.of_parsetoarray(is_choosecaseid, ",", ls_arrayid)
	if dw_1.rowcount( ) >  0 then 
		ll_count = dw_1.rowcount( )
		for i = 1 to ll_count
			ls_testcaseid = dw_1.getitemstring(i,"testcaseid")
			if ln_string.of_isexists( ls_arrayid, ls_testcaseid) then
				ls_flag = dw_1.getitemstring(i,"ccheck")
				if isnull(ls_flag) or ls_flag <> "1"  then 
					ls_flag = '1'
					dw_1.SetItem(i,"ccheck", ls_flag)
				end if
			end if 
		next			
	end if 
	destroy ln_string	
end if 

if is_savetoposition = "file" then
	rb_2.checked = true 
	rb_1.checked = false
	
	cb_3.enabled = false
else
	rb_2.checked = false 
	rb_1.checked = true
	
//	cb_3.enabled = true			// default flase 
end if 
cb_5.triggerevent( clicked!)
end event

type st_2 from statictext within w_controller
integer x = 3150
integer y = 116
integer width = 535
integer height = 260
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "请根据运行环境和L1标注过滤测试点"
boolean focusrectangle = false
end type

type rb_2 from radiobutton within w_controller
integer x = 3195
integer y = 984
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
string text = "SaveTofile"
boolean checked = true
end type

event clicked;cb_3.enabled = false
end event

type rb_1 from radiobutton within w_controller
integer x = 2601
integer y = 984
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
string text = "SaveTodw"
end type

event clicked;cb_3.enabled = true
end event

type cbx_4 from checkbox within w_controller
boolean visible = false
integer x = 3214
integer y = 1000
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
string text = "Auto"
boolean checked = true
end type

type cbx_3 from checkbox within w_controller
boolean visible = false
integer x = 2597
integer y = 1000
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
string text = "Saveresult"
boolean checked = true
end type

type cbx_2 from checkbox within w_controller
boolean visible = false
integer x = 2642
integer y = 1652
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
string text = "UpdateEXP"
end type

type cb_7 from commandbutton within w_controller
integer x = 2592
integer y = 1440
integer width = 457
integer height = 132
integer taborder = 30
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

type sle_1 from singlelineedit within w_controller
integer x = 3168
integer y = 568
integer width = 521
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_controller
integer x = 3154
integer y = 472
integer width = 475
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "TestcaseName"
boolean focusrectangle = false
end type

type cb_6 from commandbutton within w_controller
integer x = 2597
integer y = 568
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Find"
end type

event clicked;wf_find()
end event

type cb_5 from commandbutton within w_controller
integer x = 2597
integer y = 256
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Filter"
end type

event clicked;wf_filter()

//dw_1.ExpandAll( )
end event

type cb_3 from commandbutton within w_controller
integer x = 3195
integer y = 1440
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "ViewResult"
end type

event clicked;string ls_filter
string ls_flag

//this.enabled  = false
wf_selecteditem()

if len(is_testcase) < 3 then
	messagebox("Error","没有选择测试点")
	return
end if
if rb_1.checked then
	ls_flag = '1'
else
	ls_flag = '2'
end if

ls_filter = "testcaseid in ("+left(is_testcase,len(is_testcase) - 1)+")"+ls_flag

opensheetwithparm(w_viewresult,ls_filter,w_mdi,0,original!)


end event

type cbx_1 from checkbox within w_controller
integer x = 2606
integer y = 124
integer width = 370
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "L1 Test"
end type

type cb_2 from commandbutton within w_controller
integer x = 3195
integer y = 1204
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Execute"
end type

event clicked;long 		ll_row,ll_file, ll_l1flag
string 	ls_flag,ls_temp, ls_filepath, ls_global_path
string 	ls_testcasename,ls_testcaseid
string 	ls_testname, ls_windowname
string 	ls_runmode, ls_clienttype
integer	li_rtn
 
 if rb_2.checked then
	ls_filepath = 	gs_cachedir + gs_dirseparator + "testresult.log"
	 if fileexists(ls_filepath) then
		filedelete(ls_filepath)
	end if
 	ll_file = fileopen(ls_filepath,streammode!,write!,lockwrite!,append!)
end if

cb_3.italic = true
ls_clienttype = 	AppeonGetClientType()
is_choosecaseid = ''
is_savetoposition = ''

 for ll_row = 1 to dw_1.rowcount( )
	ls_flag = dw_1.getitemstring(ll_row,'ccheck')
	if ls_flag = '1' then
		ls_testcaseid = dw_1.getitemstring(ll_row,"testcaseid")
		ls_testcasename = dw_1.getitemstring(ll_row,"testcasename")
		ls_runmode = dw_1.getitemstring(ll_row,"runmode")
		ls_windowname = dw_1.getitemstring(ll_row,"windowname")
		ll_l1flag = dw_1.getitemnumber(ll_row, "l1flag")

		// l1 
//		if not isnull(ll_l1flag ) and ll_l1flag = 1 then 
//			if not cbx_1.checked  then continue
//		else
//			continue 
//		end if 
		
		if ls_clienttype = 'PB' then 
			if mid(ls_runmode, 3, 1) <> '1' then continue
		elseif ls_clienttype = 'WEB' then 
			if mid(ls_runmode, 1, 1) <> '1' then continue
		elseif ls_clienttype = 'MOBILE' then 
			if mid(ls_runmode, 2, 1) <> '1' then continue	
		end if 

		is_choosecaseid += ls_testcaseid+","
		gf_exetestcase(ls_testcasename,ls_windowname)
		//设置runtime数据
		if rb_2.checked then
			ls_temp = "begin testcase"+ls_testcaseid+":"+is_runtimeresult+"end testcase"+ls_testcaseid
			filewrite(ll_file,ls_temp)
		else
			wf_update(ll_row)
		end if
//		is_testcase += "'"+ls_testcaseid+"',"
	end if
next

cb_3.italic = false

if rb_1.checked then
	if dw_1.update( ) = 1 then
		commit;		
	else
		messagebox("Error","Save runtime result Failed : "+sqlca.sqlerrtext)
		rollback;
	end if	
else
	fileclose(ll_file)
end if

if cb_3.enabled = false then cb_3.enabled = true

if rb_2.checked then 
	is_savetoposition = 'file'
elseif rb_1.checked then 
	is_savetoposition = 'dw'
end if 

if right(is_choosecaseid, 1)  = ',' then 
	is_choosecaseid = left(is_choosecaseid, len(is_choosecaseid) - 1)
end if 

ls_global_path = 	gs_cachedir + gs_dirseparator + "testcase.ini"
li_rtn = SetProfileString(ls_global_path , "settings", "savetoposition", is_savetoposition)
li_rtn = SetProfileString(ls_global_path , "settings", "choosecaseid", is_choosecaseid)
end event

type cb_1 from commandbutton within w_controller
integer x = 2592
integer y = 1204
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SelectAll"
end type

event clicked;long ll_row

if lower(this.text) = "selectall" then
	for ll_row = 1 to dw_1.rowcount( )
		dw_1.setitem(ll_row,'ccheck',"1")
	next
	this.text = "UnSelectAll"
else
	for ll_row = 1 to dw_1.rowcount( )
		dw_1.setitem(ll_row,'ccheck',"0")
	next
	this.text = "SelectAll"
end if
end event

type dw_1 from datawindow within w_controller
integer y = 8
integer width = 2491
integer height = 1884
integer taborder = 10
string title = "none"
string dataobject = "d_testcase_tree"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;//

string ls_parentid,ls_tmp,ls_error,ls_modify,ls_ccheck
long ll_row

if row =  0 then return

ls_parentid = this.getitemstring(row,"parentid")

ls_ccheck = this.getitemstring(row,"ccheck")
if ls_ccheck = '0' or len(trim(ls_ccheck)) = 0 then
	for ll_row = 1 to dw_1.rowcount( )
		ls_tmp = this.getitemstring(ll_row,"parentid")
		if ls_tmp = ls_parentid then
			this.setitem(ll_row,'ccheck',"1")
		end if
	next
else
	for ll_row = 1 to dw_1.rowcount( )
		ls_tmp = this.getitemstring(ll_row,"parentid")
		if ls_tmp = ls_parentid then
			this.setitem(ll_row,'ccheck',"0")
		end if
	next
end if




end event

event clicked;//string ls_pch
//string ls_parentid,ls_tmp,ls_error,ls_modify,ls_ccheck
//long ll_row
//
//if row =  0 then return
//if dwo.name = 'pcheck' then
//	ls_parentid = this.getitemstring(row,"parentid")
//	ls_pch = this.getitemstring( row, 'pcheck')
//	if ls_pch = '0' or len(ls_pch) = 0 then
//		this.setitem(row,'pcheck',1)
//		for ll_row = 1 to dw_1.rowcount( )
//			ls_tmp = this.getitemstring(ll_row,"parentid")
//			if ls_tmp = ls_parentid then
//				this.setitem(ll_row,'ccheck',"1")
//			end if
//		next
//	else
//		this.setitem(row,'pcheck',0)
//		for ll_row = 1 to dw_1.rowcount( )
//			ls_tmp = this.getitemstring(ll_row,"parentid")
//			if ls_tmp = ls_parentid then
//				this.setitem(ll_row,'ccheck',"0")
//			end if
//		next
//	end if
//	
//end if
end event

event doubleclicked;
if row <= 0 then return 

//parent.cb_2.event clicked( )
end event

type gb_1 from groupbox within w_controller
integer x = 2505
integer width = 1248
integer height = 812
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Retrieve"
end type

type gb_2 from groupbox within w_controller
integer x = 2505
integer y = 832
integer width = 1248
integer height = 1060
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operation"
end type

