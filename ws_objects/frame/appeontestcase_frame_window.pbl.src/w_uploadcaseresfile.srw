$PBExportHeader$w_uploadcaseresfile.srw
forward
global type w_uploadcaseresfile from w_base
end type
type cb_4 from commandbutton within w_uploadcaseresfile
end type
type cb_save from commandbutton within w_uploadcaseresfile
end type
type cb_1 from commandbutton within w_uploadcaseresfile
end type
type dw_1 from datawindow within w_uploadcaseresfile
end type
end forward

global type w_uploadcaseresfile from w_base
integer width = 3250
string title = "Update load the CaseResFile"
windowstate windowstate = maximized!
cb_4 cb_4
cb_save cb_save
cb_1 cb_1
dw_1 dw_1
end type
global w_uploadcaseresfile w_uploadcaseresfile

forward prototypes
public function integer wf_uploadfile (string as_filename, string as_fullpath)
public function integer wf_uploadfiletext (string as_filename, string as_fullpath)
end prototypes

public function integer wf_uploadfile (string as_filename, string as_fullpath);//rtdwfuncspw01html_drawcontrol.html
string 	ls_txt, ls_data
blob 		lb_blob, lblb_Data
integer 	li_FileNum, li_Writes, li_Cnt, li_Reads
long 		ll_BlobLen, ll_CurrentPos, ll_FileLen

//Write File
ll_FileLen = FileLength(as_fullpath)
//li_FileNum = FileOpen(ls_filename,StreamMode!,Read!)
li_FileNum = FileOpen(as_fullpath,TextMode!)
If li_FileNum < 0 Then Return  0

// Determine the number of reads required to read the entire file
//IF ll_FileLen > 32765 THEN
//	IF Mod(ll_FileLen, 32765) = 0 THEN
//		li_Reads = ll_FileLen / 32765
//	ELSE
//		li_Reads = (ll_FileLen / 32765) + 1
//	END IF
//ELSE
//	li_Reads = 1
//END IF

filereadex(li_filenum,lblb_data)

 
 

// Read the file and build the string with data from the file
//FOR li_Cnt = 1 TO li_Reads
//	IF FileReadex(li_FileNum, lb_blob) = -1 THEN
//		RETURN -1
//	ELSE
//		lblb_Data = lblb_Data + lb_blob
//	END IF
//NEXT
//
FileClose(li_FileNum)

updateblob caseresfile set fileres = :lblb_Data 
where filename = :as_filename using sqlca;
 
 if sqlca.sqlcode = 0 then
	messagebox("Upload File ","Success")
else
	messagebox("Upload File Error",sqlca.sqlerrtext )
 end if 
 
 
return 1 
end function

public function integer wf_uploadfiletext (string as_filename, string as_fullpath);string 	ls_txt, ls_data
blob 		lb_blob, lblb_Data
integer 	li_FileNum, li_Writes, li_Cnt, li_Reads
long 		ll_BlobLen, ll_CurrentPos, ll_FileLen

ls_data = ""
ls_txt = ""
//Write File
ll_FileLen = FileLength(as_fullpath)
li_FileNum = FileOpen(as_fullpath,TextMode!)
If li_FileNum < 0 Then Return  0

// Determine the number of reads required to read the entire file
IF ll_FileLen > 32765 THEN
	IF Mod(ll_FileLen, 32765) = 0 THEN
		li_Reads = ll_FileLen / 32765
	ELSE
		li_Reads = (ll_FileLen / 32765) + 1
	END IF
ELSE
	li_Reads = 1
END IF

// Read the file and build the string with data from the file
FOR li_Cnt = 1 TO li_Reads
	IF FileReadex(li_FileNum, ls_txt) = -1 THEN
		RETURN -1
	ELSE
		ls_data = ls_data + ls_txt
	END IF
NEXT

FileClose(li_FileNum)

updateblob caseresfile set filestring = :ls_data 
where filename = :as_filename using sqlca;
 
 if sqlca.sqlcode = 0 then
	messagebox("Upload File ","Success")
else
	messagebox("Upload File Error",sqlca.sqlerrtext )
 end if 
 
 
return 1 
end function

on w_uploadcaseresfile.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.cb_save=create cb_save
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.cb_save
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_1
end on

on w_uploadcaseresfile.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.cb_save)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;call super::open;
dw_1.retrieve()

end event

type cb_4 from commandbutton within w_uploadcaseresfile
integer x = 2048
integer y = 1428
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Close"
end type

event clicked;close(parent)
end event

type cb_save from commandbutton within w_uploadcaseresfile
integer x = 1079
integer y = 1428
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;dw_1.accepttext( )

dw_1.update( )
end event

type cb_1 from commandbutton within w_uploadcaseresfile
integer x = 110
integer y = 1428
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Insert"
end type

event clicked;long 	ll_row

dw_1.accepttext()
ll_row = dw_1.insertrow(0)
dw_1.scrolltorow( ll_row)


end event

type dw_1 from datawindow within w_uploadcaseresfile
integer x = 23
integer y = 16
integer width = 3163
integer height = 1352
integer taborder = 10
string title = "none"
string dataobject = "d_caseresfile"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_1.SettransObject(sqlca)
end event

event buttonclicked;string 	ls_name, ls_fullpath, ls_filename
integer 	li_rtn
if row <= 0 then return 0 

if dwo.name = 'b_upload' then 
	ls_name = this.getItemString( row, "filename")
	if isnull(ls_name) or trim(ls_name) = "" then 
		return 0
	else
		this.accepttext( )
		
		if this.modifiedcount( )  + this.deletedcount( ) >  0 then Parent.cb_save.event clicked( )
		
		if GetFileOpenName ("Open", ls_fullpath, ls_filename,"*.*") < 1 then return
		li_rtn = Parent.wf_uploadfile( ls_name, ls_fullpath)		
		if li_rtn > 0 then 
			this.retrieve( )
			Messagebox("Information","Upload the file Success.")
		else
		end if 
	end if 
elseif dwo.name = 'b_uploadtext' then 
	ls_name = this.getItemString( row, "filename")
	if isnull(ls_name) or trim(ls_name) = "" then 
		return 0
	else
		this.accepttext( )
		
		if this.modifiedcount( )  + this.deletedcount( ) >  0 then Parent.cb_save.event clicked( )
		
		if GetFileOpenName ("Open", ls_fullpath, ls_filename,"*.*") < 1 then return
		li_rtn = Parent.wf_uploadfiletext( ls_name, ls_fullpath)		
		if li_rtn > 0 then 
			this.retrieve( )
			Messagebox("Information","Upload the file Success.")
		else
		end if 
	end if 
end if 


end event

