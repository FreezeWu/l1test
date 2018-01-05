$PBExportHeader$w_systemfunction.srw
forward
global type w_systemfunction from w_base
end type
type cb_register from commandbutton within w_systemfunction
end type
type cb_profile from commandbutton within w_systemfunction
end type
type cb_filefunctions from commandbutton within w_systemfunction
end type
type cb_externaldll from commandbutton within w_systemfunction
end type
type cb_blob from commandbutton within w_systemfunction
end type
type cb_miscellaneous from commandbutton within w_systemfunction
end type
type cb_numeric from commandbutton within w_systemfunction
end type
type cb_string from commandbutton within w_systemfunction
end type
type cb_checkingandconversion from commandbutton within w_systemfunction
end type
type cb_returnvaluenotsame from commandbutton within w_systemfunction
end type
type lb_listbox from listbox within w_systemfunction
end type
type cb_array from commandbutton within w_systemfunction
end type
type st_1 from statictext within w_systemfunction
end type
type cb_datetime from commandbutton within w_systemfunction
end type
end forward

global type w_systemfunction from w_base
string title = "System Function Test"
cb_register cb_register
cb_profile cb_profile
cb_filefunctions cb_filefunctions
cb_externaldll cb_externaldll
cb_blob cb_blob
cb_miscellaneous cb_miscellaneous
cb_numeric cb_numeric
cb_string cb_string
cb_checkingandconversion cb_checkingandconversion
cb_returnvaluenotsame cb_returnvaluenotsame
lb_listbox lb_listbox
cb_array cb_array
st_1 st_1
cb_datetime cb_datetime
end type
global w_systemfunction w_systemfunction

type prototypes
Function uint GetSystemDirectory(ref string lpBuffer,uint uSize) alias for "GetSystemDirectoryA;Ansi" Library "kernel32.dll"
Function ulong GetCurrentDirectoryA(ulong nBufferLength,ref string lpBuffer) alias for "GetCurrentDirectoryA;Ansi" Library 'kernel32.dll'
Function boolean GetUserName(ref string lpBuffer, ref ulong nSize) alias for "GetUserNameA;Ansi" library 'advapi32.dll'

end prototypes

type variables
string is_CurrentDirectory
end variables

forward prototypes
public subroutine wf_init_data ()
end prototypes

public subroutine wf_init_data ();string ls_path,ls_file
int li
boolean lb

//Set Current Directory
li = ChangeDirectory ( is_CurrentDirectory )
//Delete test file
ls_file = is_CurrentDirectory +'\My Folder\test.txt'
IF FileExists(ls_file) Then
	lb = FileDelete ( ls_file )
End If
//Delete Empty Directory
ls_path = is_CurrentDirectory +'\My Folder'
If DirectoryExists (ls_path) Then
	li = RemoveDirectory ( ls_path )
End If

//Delete test file
ls_file = is_CurrentDirectory +'\test.txt'
IF FileExists(ls_file) Then
	lb = FileDelete ( ls_file )
End If

////Create file
//ls_file = is_CurrentDirectory+'\file.txt'
//IF not FileExists(ls_file) Then
//	li = FileOpen ( ls_file,LineMode!,Write!)
//	FileClose(li)
//End If

end subroutine

on w_systemfunction.create
int iCurrent
call super::create
this.cb_register=create cb_register
this.cb_profile=create cb_profile
this.cb_filefunctions=create cb_filefunctions
this.cb_externaldll=create cb_externaldll
this.cb_blob=create cb_blob
this.cb_miscellaneous=create cb_miscellaneous
this.cb_numeric=create cb_numeric
this.cb_string=create cb_string
this.cb_checkingandconversion=create cb_checkingandconversion
this.cb_returnvaluenotsame=create cb_returnvaluenotsame
this.lb_listbox=create lb_listbox
this.cb_array=create cb_array
this.st_1=create st_1
this.cb_datetime=create cb_datetime
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_register
this.Control[iCurrent+2]=this.cb_profile
this.Control[iCurrent+3]=this.cb_filefunctions
this.Control[iCurrent+4]=this.cb_externaldll
this.Control[iCurrent+5]=this.cb_blob
this.Control[iCurrent+6]=this.cb_miscellaneous
this.Control[iCurrent+7]=this.cb_numeric
this.Control[iCurrent+8]=this.cb_string
this.Control[iCurrent+9]=this.cb_checkingandconversion
this.Control[iCurrent+10]=this.cb_returnvaluenotsame
this.Control[iCurrent+11]=this.lb_listbox
this.Control[iCurrent+12]=this.cb_array
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.cb_datetime
end on

on w_systemfunction.destroy
call super::destroy
destroy(this.cb_register)
destroy(this.cb_profile)
destroy(this.cb_filefunctions)
destroy(this.cb_externaldll)
destroy(this.cb_blob)
destroy(this.cb_miscellaneous)
destroy(this.cb_numeric)
destroy(this.cb_string)
destroy(this.cb_checkingandconversion)
destroy(this.cb_returnvaluenotsame)
destroy(this.lb_listbox)
destroy(this.cb_array)
destroy(this.st_1)
destroy(this.cb_datetime)
end on

event ue_execute;call super::ue_execute;
is_CurrentDirectory = GetCurrentDirectory ( )
//
choose case as_testcasename 
	case 'SF_Array'
		cb_array.triggerevent( clicked!)
	case 'SF_CheckingAndConversion'
		cb_checkingandconversion.triggerevent( clicked!)
	case 'SF_Datetime'
		cb_datetime.triggerevent( clicked!)
	case 'SF_Miscellaneous'
		cb_miscellaneous.triggerevent( clicked!)
	case 'SF_Numeric'
		cb_numeric.triggerevent( clicked!)
	case 'SF_String'
		cb_string.triggerevent( clicked!)	
	case 'SF_ReturnValueNotSame'
		cb_ReturnValueNotSame.triggerevent( clicked!)
	case 'SF_blob'
		cb_blob.triggerevent( clicked!)
	Case 'SF_Externaldll'
		cb_Externaldll.TriggerEvent ( clicked! )
	Case 'SF_FileFunctions'	
		cb_filefunctions.TriggerEvent ( clicked! )
	Case 'SF_ProfileFunctions'
		cb_Profile.TriggerEvent ( clicked! )
	Case 'SF_RegisterFunctions'
		cb_Register.TriggerEvent ( clicked! )
end choose

close(this)
end event

type cb_register from commandbutton within w_systemfunction
integer x = 1294
integer y = 728
integer width = 997
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Register functions"
end type

event clicked;string  ls_result, ls_Keypath, ls_data
Integer 	li_rtn,li_upper,li
string ls_valuearray[]

ls_Keypath = 'HKEY_LOCAL_MACHINE\Software\Appeon PB Example\ADT'

////RegistrySet
li_rtn =  RegistrySet(ls_Keypath,'Test',RegString!, 'Appeon')
ls_result += "RegistrySet(KEY, 'Test',RegString!, 'Appeon') = " + string(li_rtn) + "~r~n"
//RegistrySet(is_CurrentDirectory,'DEL', RegString!, '11')

//RegistryGet
String 	ls_Value
li_rtn =  RegistryGet(ls_Keypath,'Test',RegString!, ls_Value )
ls_result += "RegistryGet(KEY, 'Test',RegString!) = " + string(ls_Value) + "~r~n"

////RegistrySet
li_rtn =  RegistrySet(ls_Keypath,'Test',RegExpandString!, 'Appeon1')
ls_result += "RegistrySet(KEY, 'Test',RegExpandString!, 'Appeon1') = " + string(li_rtn) + "~r~n"

//RegistryGet
li_rtn =  RegistryGet(ls_Keypath,'Test',RegExpandString!, ls_Value )
ls_result += "RegistryGet(KEY, 'Test',RegExpandString!) = " + string(ls_Value) + "~r~n"

////RegistrySet
li_rtn =  RegistrySet(ls_Keypath,'Test',ReguLong!, 2017)
ls_result += "RegistrySet(KEY, 'Test',ReguLong!,2017) = " + string(li_rtn) + "~r~n"
//RegistrySet(is_CurrentDirectory,'DEL', RegString!, '11')

//RegistryGet
ulong lul_pl
li_rtn =  RegistryGet(ls_Keypath,'Test',ReguLong!, lul_pl )
ls_result += "RegistryGet(KEY, 'Test',ReguLong!) = " + string(lul_pl) + "~r~n"

//RegistryValues
li_rtn = RegistryValues(ls_Keypath,ls_valuearray)
 li_upper = UpperBound(ls_valuearray)
 for li = 1 to li_upper
	  ls_data += ls_valuearray[li]
 next
ls_result += "RegistryValues(KEY) = " + string(ls_data) + "~r~n"

//RegistryDelete
li_rtn = RegistryDelete( ls_Keypath, "Test")
ls_result += "RegistryDelete(KEY, 'Test') = " + string(li_rtn) + "~r~n"

gf_returnresult(ls_result)



end event

type cb_profile from commandbutton within w_systemfunction
integer x = 1294
integer y = 560
integer width = 997
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Profile Functions"
end type

event clicked;string  ls_result, ls_Filepath, ls_data
Integer 	li_rtn

ls_Filepath = is_CurrentDirectory + "\profile.ini"


////SetProfileString
li_rtn = SetProfileString(ls_Filepath, 'User Info', 'Name', 'James Smith')
ls_result += "SetProfileString('profile.ini', 'User Info', 'Name', 'James Smith') = " + string(li_rtn) + "~r~n"

//ProfileString
ls_data = ProfileString(ls_Filepath, 'User Info', 'Name', '')
ls_result += "ProfileString('profile.ini', 'User Info', 'Name', '') = " + string(ls_data) + "~r~n"

//ProfileInt
li_rtn = SetProfileString(ls_Filepath, 'User Info', 'Security', '9')
li_rtn = ProfileInt(ls_Filepath, 'User Info', 'Security', 0)
ls_result += "ProfileInt('profile.ini', 'User Info', 'Security', 0) = " + string(li_rtn) + "~r~n"

gf_returnresult(ls_result)



end event

type cb_filefunctions from commandbutton within w_systemfunction
integer x = 1294
integer y = 404
integer width = 997
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "File functions"
end type

event clicked;string  ls_result

string ls_fun,ls_p1,ls_p2,ls_p3,ls_p4,ls_p5,ls_upath,ls_fill,ls_tpath,ls_spath,ls_docname, ls_named,ls_title,ls_directory
integer li_FileNum,li_rtn
boolean lb_bool
long ll_length,ll_seek
filemode lfm
fileaccess lfa
filelock lfl
writemode lwm
String ls_docname2
//initialize data
wf_init_data()


////File Functions

//CreateDirectory
ls_upath = is_CurrentDirectory + "\My Folde"
IF DirectoryExists(ls_upath) then RemoveDirectory(ls_upath)
li_rtn =CreateDirectory ( ls_upath )

ls_result += "CreateDirectory('\My Folde') = " + string(li_rtn) + "~r~n"

//DirectoryExists
ls_result += "DirectoryExists('\My Folde') = " + string(DirectoryExists(ls_upath)) + "~r~n"

//ChangeDirectory
 li_rtn = ChangeDirectory ( ls_upath )
 ls_result += "ChangeDirectory('\My Folde') = " + string(li_rtn) + "~r~n"
//GetCurrentDirectory
ls_p1 = GetCurrentDirectory()
ls_result += "GetCurrentDirectory() = " + string(ls_p1) + "~r~n"
ChangeDirectory ( is_CurrentDirectory )
//GetFileOpenName
//li_rtn = GetFileOpenName (ls_p1,ls_docname, ls_named,ls_p4,ls_p5)
//GetFileSaveName
//li_rtn = GetFileSaveName (ls_p1,ls_docname, ls_named,ls_p4,ls_p5)
//GetFolder
//li_rtn = GetFolder(ls_title,ls_directory)
ls_docname = ls_upath + "\test.txt"
ls_docname2 = ls_upath + "\test2.txt"
//FileOpen
if (not FileExists(ls_docname)) then
	li_FileNum = FileOpen(ls_docname,StreamMode!,Write!)
	FileClose(li_FileNum)
end if
li_FileNum = FileOpen(ls_docname,StreamMode!,Write!,Shared!,Replace!)
ls_result += "FileOpen ('\My Folde\test.tx') = " + string(li_FileNum) + "~r~n"

//FileWrite
ls_fill = 'Appeon PB'
li_rtn = FileWrite ( li_FileNum, ls_fill)
ls_result += "FileWrite ('Appeon PB') = " + string(li_rtn) + "~r~n"
FileClose(li_FileNum)

//FileRead
li_FileNum = FileOpen(ls_docname,StreamMode!,Read!,Shared!)
string ls_data
li_rtn = FileRead(li_FileNum,ls_data)
ls_result += "FileRead ('\My Folde\test.tx') = " + string(ls_data) + "~r~n"

 //FileSeek
ll_length = FileSeek(li_FileNum,3,FromBeginning!)
ls_result += "FileSeek ('\My Folde\test.tx',3,FromBeginning!) = " + string(ll_length) + "~r~n"
FileClose(li_FileNum)

//fileWriteEx
li_FileNum = FileOpen(ls_docname,TextMode!, Write!, Shared!, Replace!)
ls_fill = 'Appeon PB2017'
li_rtn = fileWriteEx ( li_FileNum, ls_fill)
ls_result += "fileWriteEx ('\My Folde\test.tx','Appeon PB2017') = " + string(li_rtn) + "~r~n"
FileClose(li_FileNum)

//FileReadEx
li_FileNum = FileOpen(ls_docname,TextMode!,Read!,Shared!)
li_rtn = FileReadEx(li_FileNum,ls_data)
ls_result += "FileReadEx ('\My Folde\test.tx') = " + string(ls_data) + "~r~n"

//FileClose
 li_rtn = FileClose(li_FileNum)	
 ls_result += "FileClose ('\My Folde\test.tx') = " + string(li_rtn) + "~r~n"
 
//FileLength
ll_length = FileLength(ls_docname)
ls_result += "FileLength ('\My Folde\test.tx') = " + string(ll_length) + "~r~n"

//FileCopy
ls_spath = ls_docname
ls_tpath = ls_docname2
li_rtn = FileCopy(ls_spath,ls_tpath,True)
ls_result += "FileCopy ('test.txt','test2.txt') = " + string(li_rtn) + "~r~n"

//FileExists
lb_bool = FileExists ( ls_tpath )
ls_result += "FileExists ('\My Folde\test2.txt') = " + string(lb_bool) + "~r~n"

//FileDelete
lb_bool = FileDelete ( ls_docname2 )
ls_result += "FileDelete ('\My Folde\test2.txt') = " + string(lb_bool) + "~r~n"

//FileMove
ls_spath = ls_docname
ls_tpath = is_CurrentDirectory + "\test.txt"
IF FileExists(ls_tpath) then FileDelete(ls_tpath)
li_rtn = FileMove(ls_spath,ls_tpath)
ls_result += "FileMove ('test.txt','..\test.txt') = " + string(li_rtn) + "~r~n"

FileDelete ( ls_tpath )

//RemoveDirectory
li_rtn = RemoveDirectory ( ls_upath )	
ls_result += "RemoveDirectory('\My Folde') = "+string(li_rtn)+"~r~n"

//lb_bool = DirectoryExists ( ls_upath) 


gf_returnresult(ls_result)



end event

type cb_externaldll from commandbutton within w_systemfunction
integer x = 1294
integer y = 256
integer width = 997
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "External dll"
end type

event clicked;string  ls_result

string ls_rv
ulong lul_length = 255
ls_rv=space(255)

////External Dll
//GetSystemDirectory
GetSystemDirectory(ls_rv,lul_length)
ls_result += "GetSystemDirectory() = "+string(ls_rv)+"~r~n"
//--------------------------------

//GetCurrentDirectory
GetCurrentDirectoryA(lul_length,ls_rv)
ls_result += "GetCurrentDirectory() = "+string(ls_rv)+"~r~n"
//--------------------------------

//GetUserName
GetUserName(ls_rv,lul_length)
ls_result += "GetUserName() = "+string(ls_rv)+"~r~n"
//--------------------------------




gf_returnresult(ls_result)



end event

type cb_blob from commandbutton within w_systemfunction
integer x = 160
integer y = 1292
integer width = 997
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "blob"
end type

event clicked;string  ls_result
Long 	ll_i
Blob	lblb_bb,lblb_temp, lb_Null
String  ls_String
SetNull ( lb_Null )

//Blob、BlobEdit、BlobMid、Byte、DateTime、Dec、Double、FromAnsi、FromUnicode、GetByte、
//GetByteArray、Integer、Len、LenA、Long、LongLong、Real、SetByte、String、ToAnsi、ToUnicode、

////Blob Functions
//Blob
//If IsNull ( Blob ( lb_Null ) ) Then
//	ls_result += "Blob(lb_Null) = "+string('NULL')+"~r~n"
//End If
lblb_bb = Blob( "Any Text" )
ls_result += "Blob('Any Text') = "+string(lblb_bb)+"~r~n"

Blob lblb_1
byte lbyte_array[],lbyte_array2[]
lbyte_array[] = {1,10,100,200,255} 
lblb_1 = Blob(lbyte_array) 

lbyte_array2[] = GetByteArray(lblb_1)
ls_String = ''
For ll_i = 1 To UpperBound(lbyte_array2)
	ls_String = ls_String + string ( lbyte_array2[ll_i] )
Next
ls_result += "Blob({1,10,100,200,255} ) = "+string(ls_String)+"~r~n"
//--------------------------------

//BlobEdit
ls_result += "BlobEdit (lblb_bb, 1, blob('Hello'),EncodingANSI!) = "+string(BlobEdit (lblb_bb, 1, blob('Hello'),EncodingANSI!))+"~r~n"
//--------------------------------

//BlobMid
ls_result += "BlobMid (lblb_bb, 1, 8) = "+string(BlobMid (lblb_bb, 1, 8))+"~r~n"
//--------------------------------

//Byte
ls_result += "Byte(lblb_bb) = "+string(Char(Byte(lblb_bb)))+"~r~n"

//DateTime
ls_result += "DateTime(Blob('2016-12-01 12:13:14')) = "+string(DateTime(Blob('2016-12-01  12:13:14')), 'yyyy-mm-dd hh:mm:ss')+"~r~n"

//Dec
blob{20} lb_blob
Dec r1
integer len1,len2
len1 = BlobEdit(lb_blob, 1, 2016)

r1 = Dec(lb_blob)
ls_result += "Dec(BlobEdit(lb_blob, 1, 2016)) = "+string(r1) +"~r~n"

//Double
//len2 = BlobEdit(lb_blob, len1, 43750E0)
ls_result += "Double(lb_blob) = "+string(Double(lb_blob))+"~r~n"

//FromAnsi obsolete    
//ls_result += "FromAnsi(lblb_bb) = "+string(FromAnsi(lblb_bb))+"~r~n" //=String(blob, EncodingANSI!) 

//FromUnicode  obsolete
//ls_result += "FromUnicode(lblb_bb) = "+string(FromUnicode(lblb_bb))+"~r~n" //=String(blob) 

//GetByte
Int li_rtn
Byte lb_byte
li_rtn = GetByte(lblb_bb, 3, lb_byte)
ls_result += "GetByte(lblb_bb,3, lb_byte) = "+string(li_rtn)+"~r~n"
ls_result += "String(lb_byte) = "+string(char(lb_byte))+"~r~n"

//GetByteArray
Byte ly_byte[]
ls_String = ''
ly_byte[] = GetByteArray(lblb_bb)
For ll_i = 1 To UpperBound(ly_byte)
	ls_String = ls_String + char (ly_byte[ll_i])
Next
ls_result += "GetByteArray(lblb_bb) = "+string(ls_String)+"~r~n"

//Integer
ls_result += "Integer(lb_blob) = "+string(Integer(lb_blob))+"~r~n"

//Len
ls_result += "Len(lblb_bb) = "+string(Len(lblb_bb))+"~r~n"
//--------------------------------

//LenA
ls_result += "LenA(lblb_bb) = "+string(LenA(lblb_bb))+"~r~n"

//Long
ls_result += "Long(lb_blob) = "+string(Long(lb_blob))+"~r~n"

//LongLong
ls_result += "LongLong(lb_blob) = "+string(LongLong(lb_blob))+"~r~n"

//Real
ls_result += "Real(lb_blob) = "+string(Real(lb_blob))+"~r~n"

//SetByte
blob  {100} emp_photo
byte b1 = byte (65)

li_rtn = SetByte(emp_photo, 1, b1)
ls_result += "SetByte(emp_photo, 1, byte(65)) = "+string(emp_photo)+"~r~n"

//String
ls_result += "String(lblb_bb,EncodingANSI!) = "+string(String(lblb_bb,EncodingANSI!))+"~r~n"
//--------------------------------

//ToAnsi  obsolete
//ls_result += "ToAnsi('test') = "+string(ToAnsi('test'))+"~r~n"
//ToUnicode obsolete
//ls_result += "ToUnicode('test') = "+string(ToUnicode('test'))+"~r~n"

gf_returnresult(ls_result)



end event

type cb_miscellaneous from commandbutton within w_systemfunction
integer x = 160
integer y = 700
integer width = 997
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Miscellaneous"
end type

event clicked;string  ls_result


////Miscellaneous
//ClassName
String 	StrVar
Integer 	IntVar
Long 		LongVar
Int 		li_Null

SetNull ( li_Null )

ls_result += "ClassName(StrVar) = "+string(ClassName(StrVar))+"~r~n"
ls_result += "ClassName(IntVar) = "+string(ClassName(IntVar))+"~r~n"
ls_result += "ClassName(LongVar) = "+string(ClassName(LongVar))+"~r~n"
ls_result += "ClassName(lb_ListBox) = "+string(ClassName(lb_ListBox))+"~r~n"
ls_result += "ClassName(cb_array) = "+string(ClassName(cb_Array))+"~r~n"
//--------------------------------

//IntHigh
If IsNull ( IntHigh ( li_Null ) ) Then
	ls_result += "IntHigh(li_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "IntHigh(255) = "+string(IntHigh(255))+"~r~n"
ls_result += "IntHigh(16777215) = "+string(IntHigh(16777215))+"~r~n"
//--------------------------------

//IntLow
If IsNull ( IntLow ( li_Null ) ) Then
	ls_result += "IntLow(li_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "IntLow(255) = "+string(IntLow(255))+"~r~n"
ls_result += "IntLow(16777215) = "+string(IntLow(16777215))+"~r~n"
//--------------------------------

//IsValid
window 	w_null
ls_result += "IsValid(cb_array) = "+string(IsValid(cb_Array))+"~r~n"
ls_result += "IsValid(w_null) = "+string(IsValid(w_null))+"~r~n"
//--------------------------------

//SetNull	
ls_result += "SetNull(StrVar) = "+string(SetNull(StrVar))+"~r~n"
ls_result += "SetNull(IntVar) = "+string(SetNull(IntVar))+"~r~n"
//--------------------------------

//SetPointer	
pointer p1, p2
string 	ls_var

p1 = SetPointer(Arrow!)
p1 = SetPointer(Arrow!)
if p1 = Arrow! then
	 ls_var = 'Arrow!'
Else
	ls_var = 'error'
End If
ls_result += "SetPointer(Arrow!) = "+ls_var+"~r~n"
p2 = SetPointer(Cross!)
p2 = SetPointer(Cross!)
if p2 = Cross! then
	 ls_var = 'Cross!'
Else
	ls_var = 'error'
End If
ls_result += "SetPointer(Cross!) = "+ls_var+"~r~n"
//--------------------------------


////System and Environment
//GetApplication
ls_result += "GetApplication() = "+string(GetApplication().AppName)+"~r~n"
//--------------------------------

//CommandParm
ls_result += "CommandParm() = "+Trim(string(CommandParm()))+"~r~n"
//--------------------------------

//ClipBoard
ClipBoard('Appeon Test')
ls_result += "ClipBoard('Appeon Test') = "+string(ClipBoard('Appeon Test'))+"~r~n"
ClipBoard('Employee Data')
ls_result += "ClipBoard('Employee Data') = "+string(ClipBoard('Employee Data'))+"~r~n"
//--------------------------------

////GetEnvironment
//environment env
//integer rtn
//string ls_Rtn, ls_Rtn2
//rtn = GetEnvironment(env)
//CHOOSE CASE env.OSType
//	CASE aix!
//		ls_Rtn = 'aix'
//	CASE Windows!
//		ls_Rtn = 'Windows'
//	CASE WindowsNT!
//		ls_Rtn = 'WindowsNT'
//	CASE ELSE
//		ls_Rtn = 'Other'
//END CHOOSE
//
//CHOOSE CASE env.CharSet
//	CASE CharSetAnsi!
//		ls_Rtn2 = 'CharSetAnsi'
//	CASE CharSetUnicode!
//		ls_Rtn2 = 'CharSetUnicode'
//	CASE CharSetDBCSJapanese!
//		ls_Rtn2 = 'CharSetDBCSJapanese'
//END CHOOSE
//ls_result += "GetEnvironment()  = "+string(ls_Rtn)+' ' +string(ls_Rtn2) + "~r~n"
//
////--------------------------------

//PixelsToUnits
ls_result += "PixelsToUnits(520,XPixelsToUnits!) = "+string(PixelsToUnits(520,XPixelsToUnits!))+"~r~n"
ls_result += "PixelsToUnits(520,YPixelsToUnits!) = "+string(PixelsToUnits(520,YPixelsToUnits!))+"~r~n"
//--------------------------------

//UnitsToPixels
ls_result += "UnitsToPixels(520,XUnitsToPixels!) = "+string(UnitsToPixels(520,XUnitsToPixels!))+"~r~n"
ls_result += "UnitsToPixels(520,YUnitsToPixels!) = "+string(UnitsToPixels(520,YUnitsToPixels!))+"~r~n"
//--------------------------------

////Run
//ls_result += "Run('Notepad.exe') = "+string(Run('Notepad.exe'))+"~r~n"
////--------------------------------

////Cpu
//ls_result += "Cpu() = "+string(Cpu())+"~r~n"
////--------------------------------
//

//RGB
ls_result += "RGB(192,192,192) = "+string(RGB(192,192,192))+"~r~n"
//--------------------------------

//TypeOf
if parent.TypeOf() = window! Then
	ls_result += "parent.TypeOf() = "+"window!"+"~r~n"
Else
	ls_result += "parent.TypeOf() = "+"not window!"+"~r~n"
End If

//--------------------------------



gf_returnresult(ls_result)



end event

type cb_numeric from commandbutton within w_systemfunction
integer x = 160
integer y = 848
integer width = 997
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Numeric"
end type

event clicked;string  	ls_result
Dec 		ldc_Null

SetNull ( ldc_Null )
////Numeric
//Abs	
If IsNull ( Abs ( ldc_Null ) )  Then
	ls_result += "Abs(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Abs(125.78) = "+string(Abs(125.78))+"~r~n"
ls_result += "Abs(-34.12) = "+string(Abs(-34.12))+"~r~n"
//--------------------------------

//ACos	
If IsNull ( ACos ( ldc_Null ) )  Then
	ls_result += "ACos(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "ACos(1) = "+string(ACos(1))+"~r~n"
ls_result += "ACos(-0.6335) = "+string(ACos(-0.6335))+"~r~n"
//--------------------------------

//ASin
If IsNull ( ASin ( ldc_Null ) )  Then
	ls_result += "ASin(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "ASin(1) = "+string(ASin(1))+"~r~n"
ls_result += "ASin(-0.19170) = "+string(ASin(-0.19170))+"~r~n"
//--------------------------------

//ATan
If IsNull ( ATan ( ldc_Null ) )  Then
	ls_result += "ATan(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "ATan(1) = "+string(ATan(1))+"~r~n"
ls_result += "ATan(-0.070) = "+string(ATan(-0.070))+"~r~n"
//--------------------------------

//Ceiling
If IsNull ( Ceiling ( ldc_Null ) )  Then
	ls_result += "Ceiling(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Ceiling(1.1234) = "+string(Ceiling(1.1234))+"~r~n"
ls_result += "Ceiling(20) = "+string(Ceiling(20))+"~r~n"
//--------------------------------

//Cos
If IsNull ( Cos ( ldc_Null ) )  Then
	ls_result += "Cos(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Cos(1) = "+string(Cos(1))+"~r~n"
ls_result += "Cos(0) = "+string(Cos(0))+"~r~n"
//--------------------------------

//Exp
If IsNull ( Exp ( ldc_Null ) )  Then
	ls_result += "Exp(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Exp(1) = "+string(Exp(1))+"~r~n"
ls_result += "Exp(0) = "+string(Exp(0))+"~r~n"
//--------------------------------

//Fact
If IsNull ( Fact ( ldc_Null ) )  Then
	ls_result += "Fact(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Fact(1) = "+string(Fact(1))+"~r~n"
ls_result += "Fact(65) = "+string(Fact(65))+"~r~n"
//--------------------------------

//Int
If IsNull ( Int ( ldc_Null ) )  Then
	ls_result += "Int(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Int(125.78) = "+string(Int(125.78))+"~r~n"
ls_result += "Int(9999.99) = "+string(Int(9999.99))+"~r~n"
//--------------------------------

//Log
If IsNull ( Log ( ldc_Null ) )  Then
	ls_result += "Log(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Log(10) = "+string(Log(10))+"~r~n"
ls_result += "Log(2.718) = "+string(Log(2.718))+"~r~n"
//--------------------------------

//LogTen
If IsNull ( LogTen ( ldc_Null ) )  Then
	ls_result += "LogTen(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "LogTen(10) = "+string(LogTen(10))+"~r~n"
ls_result += "LogTen(2.718) = "+string(LogTen(2.718))+"~r~n"
//--------------------------------

//Max
If IsNull ( Max ( ldc_Null, 1 ) )  Then
	ls_result += "Max(ldc_Null,1) = "+string('NULL')+"~r~n"
End If
ls_result += "Max(10,12) = "+string(Max(10,12))+"~r~n"
ls_result += "Max(-2.718, -3.44) = "+string(Max(-2.718, -3.44))+"~r~n"
//--------------------------------

//Min
If IsNull ( Min ( ldc_Null, 2 ) )  Then
	ls_result += "Min(ldc_Null,2) = "+string('NULL')+"~r~n"
End If
ls_result += "Min(10,12) = "+string(Min(10,12))+"~r~n"
ls_result += "Min(-2.718, -3.44) = "+string(Min(-2.718, -3.44))+"~r~n"
//--------------------------------

//Mod
If IsNull ( Mod ( ldc_Null, 3 ) )  Then
	ls_result += "Mod(ldc_Null, 3) = "+string('NULL')+"~r~n"
End If
ls_result += "Mod(100,12) = "+string(Mod(100,12))+"~r~n"
ls_result += "Mod(-2, -3) = "+string(Mod(-2, -3))+"~r~n"
//--------------------------------

//Pi
If IsNull ( Pi ( ldc_Null ) )  Then
	ls_result += "Pi(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Pi(1) = "+string(Pi(1))+"~r~n"
ls_result += "Pi(-2) = "+string(Pi(-2))+"~r~n"
//--------------------------------

////Rand
//ls_result += "Rand(1000) >= "+string(Rand(1000))+"~r~n"
////--------------------------------

//Round
If IsNull ( Round ( ldc_Null,2 ) )  Then
	ls_result += "Round(ldc_Null,2) = "+string('NULL')+"~r~n"
End If
ls_result += "Round(23.2356,3) = "+string(Round(23.2356,3))+"~r~n"
ls_result += "Round(3.14159,2) = "+string(Round(3.14159,2))+"~r~n"
//--------------------------------

//Sign
If IsNull ( Sign ( ldc_Null ) )  Then
	ls_result += "Sign(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Sign(5) = "+string(Sign(5))+"~r~n"
ls_result += "Sign(0) = "+string(Sign(0))+"~r~n"
ls_result += "Sign(-10.5) = "+string(Sign(-10.5))+"~r~n"
//--------------------------------

//Sin
If IsNull ( Sin ( ldc_Null ) )  Then
	ls_result += "Sin(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Sin(5) = "+string(Sin(5))+"~r~n"
ls_result += "Sin(0) = "+string(Sin(0))+"~r~n"
ls_result += "Sin(-10.5) = "+string(Sin(-10.5))+"~r~n"
//--------------------------------

//Sqrt
If IsNull ( Sqrt ( ldc_Null ) )  Then
	ls_result += "Sqrt(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Sqrt(2) = "+string(Sqrt(2))+"~r~n"
ls_result += "Sqrt(36) = "+string(Sqrt(36))+"~r~n"
//--------------------------------

//Tan
If IsNull ( Tan ( ldc_Null ) )  Then
	ls_result += "Tan(ldc_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Tan(1) = "+string(Tan(1))+"~r~n"
ls_result += "Tan(36) = "+string(Tan(36))+"~r~n"
//--------------------------------

//Truncate
If IsNull ( Truncate ( ldc_Null,3 ) )  Then
	ls_result += "Truncate(ldc_Null,3) = "+string('NULL')+"~r~n"
End If
ls_result += "Truncate(3.1415926,3) = "+string(Truncate(3.1415926,3))+"~r~n"
ls_result += "Truncate(-253.123,2) = "+string(Truncate(-253.123,2))+"~r~n"
//--------------------------------




gf_returnresult(ls_result)



end event

type cb_string from commandbutton within w_systemfunction
integer x = 160
integer y = 996
integer width = 997
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "String"
end type

event clicked;string  ls_result, ls_Null

Long 	ll_Null

SetNull ( ls_Null )
SetNull ( ll_Null )
////String
//Fill
If IsNull ( Fill ( ls_Null,2 ) ) Then
	ls_result += "Fill(ls_Null,2) = "+string('NULL')+"~r~n"
End If
ls_result += "Fill('A',2) = "+string(Fill('A',2))+"~r~n"
ls_result += "Fill('-+',10) = "+string(Fill('-+',10))+"~r~n"
//--------------------------------

//FillA
If IsNull ( FillA ( ls_Null,5 ) ) Then
	ls_result += "FillA(ls_Null,5) = "+string('NULL')+"~r~n"
End If
ls_result += "FillA('E',5) = "+string(FillA('E',5))+"~r~n"
ls_result += "FillA('*',10) = "+string(FillA('*',10))+"~r~n"
//--------------------------------

//LastPos
If IsNull ( LastPos ( ls_Null,'Ap',2 ) ) Then
	ls_result += "LastPos(ls_Null,'Ap',2) = "+string('NULL')+"~r~n"
End If
ls_result += "LastPos('Appeon Appeon','Ap',2) = "+string(LastPos('Appeon Appeon','Ap',2))+"~r~n"
ls_result += "LastPos('Software','EAServer') = "+string(LastPos('Software','EAServer'))+"~r~n"
//--------------------------------

//Left
If IsNull ( Left ( ls_Null,2 ) ) Then
	ls_result += "Left(ls_Null,2) = "+string('NULL')+"~r~n"
End If
ls_result += "Left('Appeon',2) = "+string(Left('Appeon',2))+"~r~n"
//--------------------------------

//LeftA
If IsNull ( LeftA ( ls_Null,5 ) ) Then
	ls_result += "LeftA(ls_Null,5) = "+string('NULL')+"~r~n"
End If
ls_result += "LeftA('Appeon',5) = "+string(LeftA('Appeon',5))+"~r~n"
//--------------------------------

//LeftTrim
If IsNull ( LeftTrim ( ls_Null ) ) Then
	ls_result += "LeftTrim(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "LeftTrim('Appeon ') = "+string(LeftTrim('Appeon '))+"~r~n"
ls_result += "LeftTrim(' Appeon') = "+string(LeftTrim(' Appeon'))+"~r~n"
//--------------------------------

//Len
If IsNull ( Len ( ls_Null ) ) Then
	ls_result += "Len(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Len('Appeon 1') = "+string(Len('Appeon 1'))+"~r~n"
ls_result += "Len(' Appeon') = "+string(Len(' Appeon'))+"~r~n"
//--------------------------------

//LenA
If IsNull ( LenA ( ls_Null ) ) Then
	ls_result += "LenA(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "LenA('Database 1') = "+string(LenA('Database 1'))+"~r~n"
ls_result += "LenA('Database') = "+string(LenA('Database'))+"~r~n"
//--------------------------------

//Lower
If IsNull ( Lower ( ls_Null ) ) Then
	ls_result += "Lower(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Lower('Database 1') = "+string(Lower('Database 1'))+"~r~n"
ls_result += "Lower('Appeon') = "+string(Lower('Appeon'))+"~r~n"
//--------------------------------

//Match
If IsNull ( Match ( ls_Null, ls_Null ) ) Then
	ls_result += "Match(ls_Null, ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Match('Appeon', 'Appeon') = "+string(Match('Appeon', 'Appeon'))+"~r~n"
ls_result += "Match('jafa;ewjddf','^[A-Za-z]') = "+string(Match('jafa;ewjddf','^[A-Za-z]'))+"~r~n"
ls_result += "Match('1232849348','^[0-9][0-9][0-9]$') = "+string(Match('1232849348','^[0-9][0-9][0-9]$'))+"~r~n"
//--------------------------------

//Mid
If IsNull ( Mid ( ls_Null, 4 ) ) Then
	ls_result += "Mid(ls_Null, 4) = "+string('NULL')+"~r~n"
End If
ls_result += "Mid('Appeon', 4) = "+string(Mid('Appeon',4))+"~r~n"
ls_result += "Mid('Appeon Appeon',5,2) = "+string(Mid('Appeon Appeon',5,2))+"~r~n"
//--------------------------------

//MidA
If IsNull ( MidA ( ls_Null, 4 ) ) Then
	ls_result += "MidA(ls_Null, 4) = "+string('NULL')+"~r~n"
End If
ls_result += "MidA('Appeon', 4) = "+string(MidA('Appeon',4))+"~r~n"
ls_result += "MidA('Appeon Appeon',5,2) = "+string(MidA('Appeon Appeon',5,2))+"~r~n"
//--------------------------------

//Pos
If IsNull ( Pos( ls_Null, 'pp',3 ) ) Then
	ls_result += "Pos(ls_Null, 'pp',3) = "+string('NULL')+"~r~n"
End If
ls_result += "Pos('Appeon Appeon','pp',3) = "+string(Pos('Appeon Appeon','pp',3))+"~r~n"
ls_result += "Pos('Appeon Appeon','peon',4) = "+string(Pos('Appeon Appeon','peon',4))+"~r~n"
//--------------------------------

//PosA
If IsNull ( PosA( ls_Null, 'pp',3 ) ) Then
	ls_result += "PosA(ls_Null, 'pp',3) = "+string('NULL')+"~r~n"
End If
ls_result += "PosA('Appeon Appeon','pp',3) = "+string(PosA('Appeon Appeon','pp',3))+"~r~n"
ls_result += "PosA('Appeon Appeon','peon',4) = "+string(PosA('Appeon Appeon','peon',4))+"~r~n"
//--------------------------------

//Replace
If IsNull ( Replace( ls_Null, 4, 2,' e' ) ) Then
	ls_result += "Replace(ls_Null,4, 2,' e') = "+string('NULL')+"~r~n"
End If
ls_result += "Replace('Software',1,20,'Appeon') = "+string(Replace('Software',1,20,'Appeon'))+"~r~n"
ls_result += "Replace('Davis', 4, 2,' e') = "+string(Replace('Davis', 4, 2,' e'))+"~r~n"
//--------------------------------

//ReplaceA
If IsNull ( ReplaceA( ls_Null, 4, 2,' e' ) ) Then
	ls_result += "ReplaceA(ls_Null,4, 2,' e') = "+string('NULL')+"~r~n"
End If
ls_result += "ReplaceA('Software',1,20,'Appeon') = "+string(ReplaceA('Software',1,20,'Appeon'))+"~r~n"
ls_result += "ReplaceA('Davis', 4, 2,' e') = "+string(ReplaceA('Davis', 4, 2,' e'))+"~r~n"
//--------------------------------

//Reverse
If IsNull ( Reverse( ls_Null ) ) Then
	ls_result += "Reverse(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Reverse('Appeon') = "+string(Reverse('Appeon'))+"~r~n"
ls_result += "Reverse('Software') = "+string(Reverse('Software'))+"~r~n"
//--------------------------------

//Right
If IsNull ( Right( ls_Null,3 ) ) Then
	ls_result += "Right(ls_Null,3) = "+string('NULL')+"~r~n"
End If
ls_result += "Right('Appeon',3) = "+string(Right('Appeon',3))+"~r~n"
ls_result += "Right('Software',7) = "+string(Right('Software',7))+"~r~n"
//--------------------------------

//RightA
If IsNull ( RightA( ls_Null,3 ) ) Then
	ls_result += "RightA(ls_Null,3) = "+string('NULL')+"~r~n"
End If
ls_result += "RightA('Appeon',3) = "+string(RightA('Appeon',3))+"~r~n"
ls_result += "RightA('Software',7) = "+string(RightA('Software',7))+"~r~n"
//--------------------------------

//RightTrim
If IsNull ( RightTrim( ls_Null ) ) Then
	ls_result += "RightTrim(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "RightTrim(' Appeon ') = "+string(RightTrim(' Appeon '))+"~r~n"
ls_result += "RightTrim(' Software ') = "+string(RightTrim(' Software ' ))+"~r~n"
//--------------------------------

//Space
If IsNull ( Space( ll_Null ) ) Then
	ls_result += "Space(ll_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Space(3) = "+string(Space(3))+"~r~n"
ls_result += "Space(10) = "+string(Space(10 ))+"~r~n"
//--------------------------------

//Trim
If IsNull ( Trim( ls_Null ) ) Then
	ls_result += "Trim(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Trim(' Appeon ') = "+string(Trim(' Appeon '))+"~r~n"
ls_result += "Trim(' Software ') = "+string(Trim(' Software ' ))+"~r~n"
//--------------------------------

//WordCap
If IsNull ( WordCap( ls_Null ) ) Then
	ls_result += "WordCap(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "WordCap('Appeon') = "+string(WordCap('Appeon'))+"~r~n"
ls_result += "WordCap('how do you do?') = "+string(WordCap('how do you do?' ))+"~r~n"
//--------------------------------

//Upper
If IsNull ( Upper( ls_Null ) ) Then
	ls_result += "Upper(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Upper('Appeon') = "+string(Upper('Appeon'))+"~r~n"
ls_result += "Upper('Software') = "+string(Upper('Software' ))+"~r~n"
//--------------------------------





gf_returnresult(ls_result)



end event

type cb_checkingandconversion from commandbutton within w_systemfunction
integer x = 160
integer y = 404
integer width = 997
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Checking and Conversion"
end type

event clicked;string  ls_result, ls_Null

////Test NUll Value as a Argument;
Int li_null
DateTime 	ldt_Null
Date 			ld_Null
Time 			lt_Null


SetNull ( ls_Null )
SetNull ( li_null )
SetNull ( ldt_Null )
SetNull ( ld_Null )
SetNull ( lt_Null )

////DataType Checking and Conversion
//Asc & AscA
If IsNull ( Asc( ls_Null ) ) Then
	ls_result += "Asc(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Asc('A') = "+string(Asc('A'))+"~r~n"
ls_result += "Asc('?') = "+string(Asc('?'))+"~r~n"
ls_result += "AscA('A') = "+string(AscA('A'))+"~r~n"
ls_result += "AscA('?') = "+string(AscA('?'))+"~r~n"
//--------------------------------

//Char & CharA
If IsNull ( Char( ls_Null ) ) Then
	ls_result += "Char(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Char(65) = "+string(Char(65))+"~r~n"
ls_result += "Char(63) = "+string(Char(63))+"~r~n"
ls_result += "CharA(65) = "+string(CharA(65))+"~r~n"
ls_result += "CharA(63) = "+string(CharA(63))+"~r~n"
//--------------------------------

//Date
If IsNull ( Date( ld_Null ) ) Then
	ls_result += "Date(ld_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Date('1900-01-01') = "+string(Date('1900-01-01'))+"~r~n"
ls_result += "Date('99-08-13') = "+string(Date('99-08-13'))+"~r~n"
ls_result += "Date('1978.09.18') = "+string(Date('1978.09.18'))+"~r~n"
ls_result += "Date('97.09.18') = "+string(Date('97.09.18'))+"~r~n"
ls_result += "Date('2050/02/12') = "+string(Date('2050/02/12'))+"~r~n"
ls_result += "Date('50/02/12') = "+string(Date('50/02/12'))+"~r~n"
ls_result += "Date('99/07/03') = "+string(Date('99/07/03'))+"~r~n"
ls_result += "Date('1993.Mar.08') = "+string(Date('1993.Mar.08'))+"~r~n"
If IsNull ( Date('93.Mar.08') ) Then
	ls_result += "Date('93.Mar.08') = "+string('NULL')+"~r~n"
Else
	ls_result += "Date('93.Mar.08') = "+string(Date('93.Mar.08'))+"~r~n"
End If
ls_result += "Date('Nov/28/2016') = "+string(Date('Nov/28/2016'))+"~r~n"
ls_result += "Date('Nov/28/16') = "+string(Date('Nov/28/16'))+"~r~n"
ls_result += "Date('28/Nov/2016') = "+string(Date('28/Nov/2016'))+"~r~n"
ls_result += "Date('1987 3 6') = "+string(Date('1987 3 6'))+"~r~n"
ls_result += "Date('87 3 6') = "+string(Date('87 3 6'))+"~r~n"
ls_result += "Date('1986,07,12') = "+string(Date('1986,07,12'))+"~r~n"
ls_result += "Date('86,07,12') = "+string(Date('86,07,12'))+"~r~n"
ls_result += "Date('1986-13-07') = "+string(Date('13-07-1986'))+"~r~n"
ls_result += "Date('86-13-07') = "+string(Date('13-07-86'))+"~r~n"
ls_result += "Date('07-12-1986') = "+string(Date('07-12-1986'))+"~r~n"
ls_result += "Date('07-12-86') = "+string(Date('07-12-86'))+"~r~n"
ls_result += "Date('13-07-1986') = "+string(Date('13-07-1986'))+"~r~n"
ls_result += "Date('13-07-86') = "+string(Date('13-07-86'))+"~r~n"
ls_result += "Date('12-07-1986') = "+string(Date('12-07-1986'))+"~r~n"
ls_result += "Date('12-07-86') = "+string(Date('12-07-86'))+"~r~n"
ls_result += "Date('1986年7月12日') = "+string(Date('1986年7月12日'))+"~r~n"
ls_result += "Date('86年7月12日') = "+string(Date('86年7月12日'))+"~r~n"
ls_result += "Date('November/28/2016') = "+string(Date('November/28/2016'))+"~r~n"
ls_result += "Date('28/November/2016') = "+string(Date('28/November/2016'))+"~r~n"
ls_result += "Date('Monday,November 28,2016') = "+string(Date('Monday,November 28,2016'))+"~r~n"
ls_result += "Date('November 28,Monday,2016') = "+string(Date('November 28,Monday,2016'))+"~r~n"
//ls_result += "Date('平成15年1月1日') = "+string(Date('平成15年1月1日'))+"~r~n"

//--------------------------------

//DateTime
If IsNull ( DateTime( ldt_Null ) ) Then
	ls_result += "DateTime(ldt_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "DateTime('1900-01-01,03:23:31') = "+string(DateTime('1900-01-01,03:23:31'))+"~r~n"
ls_result += "DateTime('1978.09.18,8:23:45') = "+string(DateTime('1978.09.18,8:23:45'))+"~r~n"
ls_result += "DateTime('2000.02.29,14:23:58') = "+string(DateTime('2000.02.29,14:23:58'))+"~r~n"
ls_result += "DateTime('2050/02/12,21:23:02') = "+string(DateTime('2050/02/12,21:23:02'))+"~r~n"
If IsNull ( DateTime('03/15/2080,23:59:59')  ) Then
	ls_result += "DateTime('03/15/2080,23:59:59') = "+string('NUll')+"~r~n"
Else
	ls_result += "DateTime('03/15/2080,23:59:59') = "+string(DateTime('03/15/2080,23:59:59'))+"~r~n"
End If
//--------------------------------

//Dec
If IsNull ( Dec( ls_Null ) ) Then
	ls_result += "Dec(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Dec('Appeon') = "+string(Dec('Appeon'))+"~r~n"
ls_result += "Dec('4.35') = "+string(Dec('4.35'))+"~r~n"
ls_result += "Dec('46.0') = "+string(Dec('46.0'))+"~r~n"
//--------------------------------

//Double
If IsNull ( Double( ls_Null ) ) Then
	ls_result += "Double(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Double('4.353') = "+string(Double('4.353'))+"~r~n"
ls_result += "Double('46.034') = "+string(Double('46.034'))+"~r~n"
ls_result += "Double('141592653589496') = "+string(Double('141592653589496'))+"~r~n"
//--------------------------------

//Integer
If IsNull ( Integer( ls_Null ) ) Then
	ls_result += "Integer(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Integer('3.1415') = "+string(Integer('3.1415'))+"~r~n"
ls_result += "Integer('32767') = "+string(Integer('32767'))+"~r~n"
ls_result += "Integer('-32768') = "+string(Integer('-32768'))+"~r~n"
//--------------------------------

//Long
If IsNull ( Long( ls_Null ) ) Then
	ls_result += "Long(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Long('3.1415') = "+string(Long('3.1415'))+"~r~n"
ls_result += "Long('20,20') = "+string(Long(20,20))+"~r~n"
ls_result += "Long('2147483648') = "+string(Long('2147483648'))+"~r~n"
ls_result += "Long('-2147483648') = "+string(Long('-2147483648'))+"~r~n"
//--------------------------------

//IsDate
If IsNull ( IsDate( ls_Null ) ) Then
	ls_result += "IsDate(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "IsDate('1978.09.18') = "+string(IsDate('1978.09.18'))+"~r~n"
ls_result += "IsDate('99/07/03') = "+string(IsDate('99/07/03'))+"~r~n"
ls_result += "IsDate('1993.Mar.08') = "+string(IsDate('1993.Mar.08'))+"~r~n"
ls_result += "IsDate('19000101') = "+string(IsDate('19000101'))+"~r~n"
//--------------------------------

//IsNull
ls_result += "IsNull(NullVariable) = "+string(IsNull(li_null))+"~r~n"
ls_result += "IsNull(NotNullVariable) = "+string(IsNull(ls_result))+"~r~n"
//--------------------------------

//IsNumber
If IsNull ( IsNumber( ls_Null ) ) Then
	ls_result += "IsNumber(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "IsNumber('645') = "+string(IsNumber('645'))+"~r~n"
ls_result += "IsNumber('Appeon') = "+string(IsNumber('Appeon'))+"~r~n"
//--------------------------------

//IsTime
If IsNull ( IsTime( ls_Null ) ) Then
	ls_result += "IsTime(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "IsTime('03:23:31') = "+string(IsTime('03:23:31'))+"~r~n"
ls_result += "IsTime('23:59') = "+string(IsTime('23:59'))+"~r~n"
ls_result += "IsTime('2359') = "+string(IsTime('2359'))+"~r~n"
//--------------------------------

//Real
If IsNull ( Real( ls_Null ) ) Then
	ls_result += "Real(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Real('3.1415') = "+string(Real('3.1415'))+"~r~n"
ls_result += "Real('2359') = "+string(Real('2359'))+"~r~n"
//--------------------------------

//String
If IsNull ( String( ls_Null ) ) Then
	ls_result += "String(ls_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "String(3.1415) = "+string(String(3.1415))+"~r~n"
ls_result += "String(23:59:59) = "+string(String(23:59:59))+"~r~n"
ls_result += "String(1993-05-17) = "+string(String(1993-05-17))+"~r~n"
//--------------------------------

//Time
If IsNull ( Time( lt_Null ) ) Then
	ls_result += "Time(lt_Null) = "+string('NULL')+"~r~n"
End If
ls_result += "Time('23:59:59') = "+string(Time('23:59:59'))+"~r~n"
ls_result += "Time('1993-05-17') = "+string(Time('1993-05-17'))+"~r~n"
ls_result += "Time(Datetime ( 1993-05-17,12:13:14)) = "+string(Time(Datetime(1993-05-17,12:13:14)))+"~r~n"
//--------------------------------



gf_returnresult(ls_result)



end event

type cb_returnvaluenotsame from commandbutton within w_systemfunction
integer x = 160
integer y = 1144
integer width = 997
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ReturnValueNotSame"
end type

event clicked;string  	ls_result
Long 		ll_Null

SetNull ( ll_Null )
//Rand
If IsNull ( Rand( ll_Null ) ) Then
	ls_result += "Rand(ll_Null) >= "+string('NULL')+"~r~n"
End If
ls_result += "Rand(1000) >= "+string(Rand(1000))+"~r~n"
//--------------------------------

//Today
ls_result += "Today() = "+string(Today())+"~r~n"
ls_result += "String(Today(),'yyyy-MM-dd hh:mm:ss') = "+string(Today(),'yyyy-MM-dd hh:mm:ss')+"~r~n"
ls_result += "String(Today(),'yyyy-MMMM-dd hh:mm:ss') = "+string(Today(),'yyyy-MMMM-dd hh:mm:ss')+"~r~n"
ls_result += "String(Today(),'yyyy-MM-dd dddd hh:mm:ss') = "+string(Today(),'yyyy-MM-dd dddd hh:mm:ss')+"~r~n"
ls_result += "String(Today(),'yyyy-MMMM-dd dddd hh:mm:ss') = "+string(Today(),'yyyy-MMMM-dd dddd hh:mm:ss')+"~r~n"
//--------------------------------

//Now
ls_result += "Now() = "+string(Now())+"~r~n"
//--------------------------------

//GetEnvironment
environment env
integer rtn
string ls_Rtn, ls_Rtn2
rtn = GetEnvironment(env)
CHOOSE CASE env.OSType
	CASE aix!
		ls_Rtn = 'aix'
	CASE Windows!
		ls_Rtn = 'Windows'
	CASE WindowsNT!
		ls_Rtn = 'WindowsNT'
	CASE ELSE
		ls_Rtn = 'Other'
END CHOOSE

CHOOSE CASE env.CharSet
	CASE CharSetAnsi!
		ls_Rtn2 = 'CharSetAnsi'
	CASE CharSetUnicode!
		ls_Rtn2 = 'CharSetUnicode'
	CASE CharSetDBCSJapanese!
		ls_Rtn2 = 'CharSetDBCSJapanese'
END CHOOSE
ls_result += "GetEnvironment()  = "+string(ls_Rtn)+' ' +string(ls_Rtn2) + "~r~n"
//--------------------------------

//Cpu
ls_result += "Cpu() = "+string(Cpu())+"~r~n"
//--------------------------------
//MessageBox ()
//Beep()
//Sleep()
//ChooseColor()
//Run()

gf_returnresult(ls_result)

end event

type lb_listbox from listbox within w_systemfunction
integer x = 2331
integer y = 40
integer width = 229
integer height = 140
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_array from commandbutton within w_systemfunction
integer x = 160
integer y = 256
integer width = 997
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Array"
end type

event clicked;string  ls_result

integer a[5], b[2,5],c[]
integer d[-10 to 50]
integer li_arrNull[]
string arr_string[3],arr_string1[]
str_user 		lstr_arr[10]

SetNull ( li_arrNull )

////Array
//lowerbound & upperbound
If IsNull ( lowerbound ( li_arrNull ) ) Then
	ls_result = "lowerbound( li_ArrNull ) = "+string('Null')+"~r~n"
End If

If IsNull ( upperbound ( li_arrNull ) ) Then
	ls_result = "upperbound( li_ArrNull ) = "+string('Null')+"~r~n"
End If

ls_result = "lowerbound(a[5]) = "+string(lowerbound(a))+"~r~n"
ls_result += "upperbound(a[5]) = "+string(upperbound(a))+"~r~n"
ls_result += "lowerbound(a,1) = "+string(lowerbound(a,1))+"~r~n"
ls_result += "upperbound(a,1) = "+string(upperbound(a,1))+"~r~n"
ls_result += "lowerbound(a,2) = "+string(lowerbound(a,2))+"~r~n"
ls_result += "upperbound(a,2) = "+string(upperbound(a,2))+"~r~n"
ls_result += "lowerbound(b,2) = "+string(lowerbound(b,2))+"~r~n"
ls_result += "upperbound(b,1) = "+string(upperbound(b,1))+"~r~n"
ls_result += "upperbound(b,2) = "+string(upperbound(b,2))+"~r~n"
ls_result += "lowerbound(c) = "+string(lowerbound(c))+"~r~n"
ls_result += "upperbound(c) = "+string(upperbound(c))+"~r~n"

c[50] = 100
ls_result += "upperbound(c[50] = 100) = "+string(upperbound(c))+"~r~n"
ls_result += "lowerbound(d) = "+string(lowerbound(d))+"~r~n"
ls_result += "upperbound(d) = "+string(upperbound(d))+"~r~n"

ls_result += "lowerbound(arr_string) = "+string(lowerbound(arr_string))+"~r~n"
ls_result += "upperbound(arr_string) = "+string(upperbound(arr_string))+"~r~n"

ls_result += "lowerbound(lstr_arr) = "+string(lowerbound(lstr_arr))+"~r~n"
ls_result += "upperbound(lstr_arr) = "+string(upperbound(lstr_arr))+"~r~n"
//--------------------------------


gf_returnresult(ls_result)



end event

type st_1 from statictext within w_systemfunction
integer x = 197
integer y = 92
integer width = 759
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "System Function Test"
boolean focusrectangle = false
end type

type cb_datetime from commandbutton within w_systemfunction
integer x = 160
integer y = 552
integer width = 997
integer height = 132
integer taborder = 40
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Date,Day and Time"
end type

event clicked;string  ls_result
DateTime 	ldt_null
Date 			ld_null
Time 			lt_null

SetNull ( ldt_null )
SetNull ( ld_null )
SetNull ( lt_null )

////Date,Day and Time
//Day
If IsNull ( Day(ld_null) ) Then
	ls_result += "Day(ld_null) = "+string('NULL')+"~r~n"
End If
ls_result += "Day(Date('1978.09.18')) = "+string(Day(Date('1978.09.18')))+"~r~n"
ls_result += "Day(1993-05-17) = "+string(Day(1993-05-17))+"~r~n"
ls_result += "Day(Date('93-05-17')) = "+string(Day(Date('93-05-17')))+"~r~n"
ls_result += "Day(Date ('1999-April-25')) = "+string(Day(Date('1999-April-25')))+"~r~n"
ls_result += "Day(Date('1993年5月17日')) = "+string(Day(Date('1993年5月17日')))+"~r~n"
ls_result += "Day(Date('05-17-1993')) = "+string(Day(Date('05-17-1993')))+"~r~n"
ls_result += "Day(Date('05-17-93')) = "+string(Day(Date('05-17-93')))+"~r~n"
ls_result += "Day(Date('17-05-1993')) = "+string(Day(Date('17-05-1993')))+"~r~n"
ls_result += "Day(Date('17-05-93')) = "+string(Day(Date('17-05-93')))+"~r~n"
//MessageBox ( "", String ( today(),'dddd, dd MMMM, yyyy' ) )
//ls_result += "Day(Date('"+'2016-November-28 Monday'+"')) = "+string(Day(Date('2016-November-28 Monday')))+"~r~n"
//‎Monday, ‎28 ‎November, ‎2016
//--------------------------------

//Month
If IsNull ( Month(ld_null) ) Then
	ls_result += "Month(ld_null) = "+string('NULL')+"~r~n"
End If
ls_result += "Month(Date('1978.09.18')) = "+string(Month(Date('1978.09.18')))+"~r~n"
ls_result += "Month(1993-05-17) = "+string(Month(1993-05-17))+"~r~n"
ls_result += "Month(Date('93-05-17')) = "+string(Month(Date('93-05-17')))+"~r~n"
ls_result += "Month(Date ('1999-April-25')) = "+string(Month(Date('1999-April-25')))+"~r~n"
ls_result += "Month(Date('1993年5月17日')) = "+string(Month(Date('1993年5月17日')))+"~r~n"
ls_result += "Month(Date('05-17-1993')) = "+string(Month(Date('05-17-1993')))+"~r~n"
ls_result += "Month(Date('05-17-93')) = "+string(Month(Date('05-17-93')))+"~r~n"
ls_result += "Month(Date('17-05-1993')) = "+string(Month(Date('17-05-1993')))+"~r~n"
ls_result += "Month(Date('17-05-93')) = "+string(Month(Date('17-05-93')))+"~r~n"
//--------------------------------

//Year
If IsNull ( Year(ld_null) ) Then
	ls_result += "Year(ld_null) = "+string('NULL')+"~r~n"
End If
ls_result += "Year(Date('1978.09.18')) = "+string(Year(Date('1978.09.18')))+"~r~n"
ls_result += "Year(1993-05-17) = "+string(Year(1993-05-17))+"~r~n"
ls_result += "Year(Date('93-05-17')) = "+string(Year(Date('93-05-17')))+"~r~n"
ls_result += "Year(Date ('1999-April-25')) = "+string(Year(Date('1999-April-25')))+"~r~n"
ls_result += "Year(Date('1993年5月17日')) = "+string(Year(Date('1993年5月17日')))+"~r~n"
ls_result += "Year(Date('05-17-1993')) = "+string(Year(Date('05-17-1993')))+"~r~n"
ls_result += "Year(Date('05-17-93')) = "+string(Year(Date('05-17-93')))+"~r~n"
ls_result += "Year(Date('17-05-1993')) = "+string(Year(Date('17-05-1993')))+"~r~n"
ls_result += "Year(Date('17-05-93')) = "+string(Year(Date('17-05-93')))+"~r~n"
//--------------------------------


//DayName
If IsNull ( DayName(ld_null) ) Then
	ls_result += "DayName(ld_null) = "+string('NULL')+"~r~n"
End If
ls_result += "DayName(Date('1978.09.18')) = "+string(DayName(Date('1978.09.18')))+"~r~n"
ls_result += "DayName(1993-05-17) = "+string(DayName(1993-05-17))+"~r~n"
ls_result += "DayName(Date('93-05-17')) = "+string(DayName(Date('93-05-17')))+"~r~n"
ls_result += "DayName(Date ('1999-April-25')) = "+string(DayName(Date('1999-April-25')))+"~r~n"
ls_result += "DayName(Date('1993年5月17日')) = "+string(DayName(Date('1993年5月17日')))+"~r~n"
ls_result += "DayName(Date('05-18-1993')) = "+string(DayName(Date('05-18-1993')))+"~r~n"
ls_result += "DayName(Date('05-18-93')) = "+string(DayName(Date('05-18-93')))+"~r~n"
ls_result += "DayName(Date('18-05-1993')) = "+string(DayName(Date('18-05-1993')))+"~r~n"
ls_result += "DayName(Date('18-05-93')) = "+string(DayName(Date('18-05-93')))+"~r~n"
//--------------------------------

//DayNumber
If IsNull ( DayNumber(ld_null) ) Then
	ls_result += "DayNumber(ld_null) = "+string('NULL')+"~r~n"
End If
ls_result += "DayNumber(Date('1978.09.18')) = "+string(DayNumber(Date('1978.09.18')))+"~r~n"
ls_result += "DayNumber(1993-05-17) = "+string(DayNumber(1993-05-17))+"~r~n"
ls_result += "DayNumber(Date('93-05-17')) = "+string(DayNumber(Date('93-05-17')))+"~r~n"
ls_result += "DayNumber(Date ('1999-April-25')) = "+string(DayNumber(Date('1999-April-25')))+"~r~n"
ls_result += "DayNumber(Date('1993年5月17日')) = "+string(DayNumber(Date('1993年5月17日')))+"~r~n"
ls_result += "DayNumber(Date('05-18-1993')) = "+string(DayNumber(Date('05-18-1993')))+"~r~n"
ls_result += "DayNumber(Date('05-18-93')) = "+string(DayNumber(Date('05-18-93')))+"~r~n"
ls_result += "DayNumber(Date('18-05-1993')) = "+string(DayNumber(Date('18-05-1993')))+"~r~n"
ls_result += "DayNumber(Date('18-05-93')) = "+string(DayNumber(Date('18-05-93')))+"~r~n"
//--------------------------------

//DaysAfter
If IsNull ( DaysAfter(ld_null, ld_null) ) Then
	ls_result += "DaysAfter(ld_null,ld_null) = "+string('NULL')+"~r~n"
End If
If IsNull ( DaysAfter(Date('1978.09.18'), ld_null) ) Then
	ls_result += "DaysAfter(Date('1978.09.18'),ld_null) = "+string('NULL')+"~r~n"
End If
If IsNull ( DaysAfter(ld_null, Date ( '1978.09.18' )) ) Then
	ls_result += "DaysAfter(ld_null,Date ( '1978.09.18' )) = "+string('NULL')+"~r~n"
End If
ls_result += "DaysAfter(Date('1978.09.18'), Date ( '1978.09.18' )) = "+string(DaysAfter(Date('1978.09.18'),Date('1978.09.18')))+"~r~n"
ls_result += "DaysAfter(1993-05-17,1992-05-17) = "+string(DaysAfter(1993-05-17,1992-05-17))+"~r~n"
ls_result += "DaysAfter(Date('05-17-1993'),1992-05-17) = "+string(DaysAfter(Date('05-17-1993'),1992-05-17))+"~r~n"
ls_result += "DaysAfter(Date('05-17-93'),1992-05-17) = "+string(DaysAfter(Date('05-17-93'),1992-05-17))+"~r~n"
ls_result += "DaysAfter(Date('17-05-1993'),1992-05-17) = "+string(DaysAfter(Date('17-05-1993'),1992-05-17))+"~r~n"
ls_result += "DaysAfter(Date('17-05-93'),1992-05-17) = "+string(DaysAfter(Date('17-05-93'),1992-05-17))+"~r~n"
ls_result += "DaysAfter(Date('1993年5月17日'),1992-05-17) = "+string(DaysAfter(Date('1993年5月17日'),1992-05-17))+"~r~n"
//--------------------------------

//Hour
If IsNull ( Hour(lt_null) ) Then
	ls_result += "Hour(lt_null) = "+string('NULL')+"~r~n"
End If
ls_result += "Hour(23:59:59) = "+string(Hour(23:59:59))+"~r~n"
ls_result += "Hour(time('12:13:14')) = "+string(Hour(time('12:13:14')))+"~r~n"
ls_result += "Hour(time('32:13:14')) = "+string(Hour(time('32:13:14')))+"~r~n"
//--------------------------------

//Minute
If IsNull ( Minute(lt_null) ) Then
	ls_result += "Minute(lt_null) = "+string('NULL')+"~r~n"
End If
ls_result += "Minute(23:59:59) = "+string(Minute(23:59:59))+"~r~n"
ls_result += "Minute(time('12:13:14')) = "+string(Minute(time('12:13:14')))+"~r~n"
ls_result += "Minute(time('32:13:14')) = "+string(Minute(time('32:13:14')))+"~r~n"
//--------------------------------

//Second
If IsNull ( Second(lt_null) ) Then
	ls_result += "Second(lt_null) = "+string('NULL')+"~r~n"
End If
ls_result += "Second(23:59:59) = "+string(Second(23:59:59))+"~r~n"
ls_result += "Second(time('12:13:14')) = "+string(Second(time('12:13:14')))+"~r~n"
ls_result += "Second(time('32:13:14')) = "+string(Second(time('32:13:14')))+"~r~n"
//--------------------------------

////Today
//ls_result += "Today() = "+string(Today())+"~r~n"
////--------------------------------
//
////Now
//ls_result += "Now() = "+string(Now())+"~r~n"
////--------------------------------

//RelativeDate
If IsNull ( RelativeDate(ld_null, 2) ) Then
	ls_result += "RelativeDate(ld_null, 2) = "+string('NULL')+"~r~n"
End If
ls_result += "RelativeDate(Date('1978.09.18'), 365) = "+string(RelativeDate(Date('1978.09.18'),365))+"~r~n"
ls_result += "RelativeDate(1993-05-17,-30) = "+string(RelativeDate(1993-05-17,-30))+"~r~n"
ls_result += "RelativeDate(Date ('1999-April-25'), 120) = "+string(RelativeDate(Date('1999-April-25'),120))+"~r~n"
ls_result += "RelativeDate(Date('05-17-1993'),-30) = "+string(RelativeDate(Date('05-17-1993'),-30))+"~r~n"
ls_result += "RelativeDate(Date('05-17-93'),-30) = "+string(RelativeDate(Date('05-17-93'),-30))+"~r~n"
ls_result += "RelativeDate(Date('17-05-1993'),-30) = "+string(RelativeDate(Date('17-05-1993'),-30))+"~r~n"
ls_result += "RelativeDate(Date('17-05-93'),-30) = "+string(RelativeDate(Date('17-05-93'),-30))+"~r~n"
ls_result += "RelativeDate(Date('1993年5月17日'),-30) = "+string(RelativeDate(Date('1993年5月17日'),-30))+"~r~n"
//--------------------------------

//RelativeTime
If IsNull ( RelativeTime(lt_null, 2) ) Then
	ls_result += "RelativeTime(lt_null, 2) = "+string('NULL')+"~r~n"
End If
ls_result += "RelativeTime(23:59:00,20) = "+string(RelativeTime(23:59:00,20))+"~r~n"
ls_result += "RelativeTime(14:23:58,-100) = "+string(RelativeTime(14:23:58,-100))+"~r~n"
ls_result += "RelativeTime(23:59:59,20) = "+string(RelativeTime(23:59:59,20))+"~r~n"
ls_result += "RelativeTime(time('32:13:14'),80) = "+string(RelativeTime(Time('32:13:14'),80))+"~r~n"
//--------------------------------

//SecondsAfter
If IsNull ( SecondsAfter(lt_null, lt_null) ) Then
	ls_result += "SecondsAfter(lt_null,lt_null) = "+string('NULL')+"~r~n"
End If
If IsNull ( SecondsAfter(22:59:59, lt_null) ) Then
	ls_result += "SecondsAfter(22:59:59,lt_null) = "+string('NULL')+"~r~n"
End If
If IsNull ( SecondsAfter(lt_null, 22:59:59) ) Then
	ls_result += "SecondsAfter(lt_null,22:59:59) = "+string('NULL')+"~r~n"
End If
ls_result += "SecondsAfter(23:59:59,22:59:59) = "+string(SecondsAfter(23:59:59,22:59:59))+"~r~n"
ls_result += "SecondsAfter(14:23:58,14:33:58) = "+string(SecondsAfter(14:23:58,14:33:58))+"~r~n"
ls_result += "SecondsAfter(time('34:23:58'),14:33:58) = "+string(SecondsAfter(time('34:23:58'),14:33:58))+"~r~n"
//--------------------------------




gf_returnresult(ls_result)



end event

