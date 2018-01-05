$PBExportHeader$w_assembly.srw
forward
global type w_assembly from w_base
end type
type cb_1 from commandbutton within w_assembly
end type
type st_1 from statictext within w_assembly
end type
end forward

global type w_assembly from w_base
integer width = 2843
integer height = 1688
string title = "Assembly Test"
cb_1 cb_1
st_1 st_1
end type
global w_assembly w_assembly

type variables
//string is_result
//Boolean 		ib_Retrieve, ib_Other, ib_Printpage
end variables

on w_assembly.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_1
end on

on w_assembly.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_1)
end on

event ue_execute;call super::ue_execute;choose case as_testcasename 
	case 'Assembly_call'
		cb_1.triggerevent( clicked!)
	
end choose

close(this)



end event

type cb_1 from commandbutton within w_assembly
integer x = 96
integer y = 272
integer width = 457
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Assembly Test"
end type

event clicked;String ls_result
int return_code 
OleObject example
example = create OleObject

String 	ls_value,ls_path
ls_path = gs_cachedir+"\PB"

return_code = RegistryGet( "HKEY_CLASSES_ROOT\demo_test.Class1\CLSID","", RegString!, ls_value)
If IsNull ( ls_value ) Or Trim ( ls_value ) = "" Or return_code <> 1 Then
	Run ( "PB\regasmdll.bat ~""+ls_path+'"',Minimized! )
	sleep(5)
End If

//"{E97845CE-00A8-315A-980F-C9BC3C525AD1}"
return_code = example.connecttoobject("","demo_test.Class1")
return_code = example.connecttoobject("",ls_value)
if return_code <> 0 then
	return_code = example.ConnectToNewObject("demo_test.Class1")
//	return_code = example.ConnectToNewObject("excel.application")
//	return_code = example.ConnectToNewObject(ls_value)
end if

if return_code <> 0 then
	
//	ls_result += " Connect To Assembly  = "+ String ( "Fail!" ) +"~r~n"
	
	Choose Case return_code
		case -1
			ls_result += " Connect To Assembly = "+ String ( "Invalid Call!" ) +"~r~n"
		Case -2
			ls_result += " Connect To Assembly = "+ String ( "Class name not found!" ) +"~r~n"
		Case -3
			ls_result += " Connect To Assembly = "+ String ( "Object could not be created!" ) +"~r~n"
		Case -4
			ls_result += " Connect To Assembly = "+ String ( "Could not connect to object!" ) +"~r~n"
		Case -9
			ls_result += " Connect To Assembly = "+ String ( "Other error!" ) +"~r~n"
		Case -15
			ls_result += " Connect To Assembly = "+ String ( "COM+ is not loaded!" ) +"~r~n"
		Case -16
			ls_result += " Connect To Assembly = "+ String ( "This function not applicable!" ) +"~r~n"
	End Choose
	ls_result += " Assembly Call SayAppeon() = "+ String ( "Fail!" ) +"~r~n"
else
	ls_result += " Connect To Assembly = "+ String ( "Success!" ) +"~r~n"
	ls_result += " Assembly Call SayAppeon() = "+ String ( example.sayAppeon() ) +"~r~n"
	example.DisconnectObject()
end if

If IsValid (example) Then Destroy ( example )

gf_returnresult(ls_result)

end event

type st_1 from statictext within w_assembly
integer x = 361
integer y = 108
integer width = 910
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "Assembly Test"
boolean focusrectangle = false
end type

