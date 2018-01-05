$PBExportHeader$w_system_function.srw
forward
global type w_system_function from w_base_case
end type
type cb_print_false from commandbutton within w_system_function
end type
type cb_print_true from commandbutton within w_system_function
end type
type lv_1 from listview within w_system_function
end type
type tv_1 from treeview within w_system_function
end type
type p_clothes from picture within w_system_function
end type
type cb_show from commandbutton within w_system_function
end type
type cb_print_window from commandbutton within w_system_function
end type
type cb_print_screen from commandbutton within w_system_function
end type
type cb_print_object from commandbutton within w_system_function
end type
type cb_3 from commandbutton within w_system_function
end type
type st_2 from statictext within w_system_function
end type
type em_1 from editmask within w_system_function
end type
type cb_print_setup from commandbutton within w_system_function
end type
type cb_print from commandbutton within w_system_function
end type
type dw_employee_roster from datawindow within w_system_function
end type
end forward

global type w_system_function from w_base_case
integer width = 3648
integer height = 1716
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_print_false cb_print_false
cb_print_true cb_print_true
lv_1 lv_1
tv_1 tv_1
p_clothes p_clothes
cb_show cb_show
cb_print_window cb_print_window
cb_print_screen cb_print_screen
cb_print_object cb_print_object
cb_3 cb_3
st_2 st_2
em_1 em_1
cb_print_setup cb_print_setup
cb_print cb_print
dw_employee_roster dw_employee_roster
end type
global w_system_function w_system_function

type variables
boolean ib_window_parm, ib_OpenSheet, ib_ArrangeSheets, ib_SetMicroHelp , ib_OpenSheet2
boolean ib_OpenSheetwithparm, ib_OpenSheetwithparm2
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
public subroutine of_testcase_point_module4 ()
public subroutine of_testcase_point_module5 ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module6 ()
public function string of_right_adjust_dec (decimal arg_amt, string arg_format)
public subroutine of_testcase_point_module7 ()
public function integer of_readblob (string as_filename, ref blob ab_picture)
public subroutine of_testcase_point_module8 ()
public subroutine of_testcase_point_module9 ()
public subroutine of_testcase_point_module10 ()
public subroutine of_testcase_point_module11 ()
public subroutine of_testcase_point_module12 ()
public subroutine of_testcase_point_module13 ()
public subroutine of_setvalue (integer ai_case, boolean ab_case[])
end prototypes

public subroutine of_testcase_point_module ();//测试CPU()函数获得的运行时间，测试yield()函数的返回值(true/false)
long ll_start,ll_end
int i,j
boolean lb_yeild


is_resultlog += wf_result_add("testcasepoint1", "Yield()", &
                                             yield() = true)
ll_start = cpu()
sleep(1)
ll_end = cpu()

is_resultlog += wf_result_add("testcasepoint2", "CPU()", &
                                             isnumber(string(ll_start)) and ( ll_end - ll_start ) > 900)


end subroutine

public subroutine of_testcase_point_module2 ();//测试PB函数Year() ,Month() ,Day() ,String(ldt_default, 'mm/dd/yy') ,Mod()
date ldt_year, ldt_month, ldt_day,ldt_a,ldt_b,ldt_default

ldt_a = Today()
ldt_default = date(2017-03-19)

is_resultlog += wf_result_add("testcasepoint4", "Year()", &
                                             isnumber(string(Year(ldt_a))) and Year(ldt_a) >=2017)

is_resultlog += wf_result_add("testcasepoint5", "Month()", &
                                             isnumber(string(Month(ldt_a))) and Month(ldt_a) >=1 and  Month(ldt_a) <=12)

is_resultlog += wf_result_add("testcasepoint6", "Day()", &
                                             isnumber(string(Day(ldt_a))) and Day(ldt_a) <= 31  and Day(ldt_a) >= 1)

is_resultlog += wf_result_add("testcasepoint7", "String(ldt_default, 'mm/dd/yy')", &
                                             String(ldt_default, 'mm/dd/yy') = '03/19/17')

is_resultlog += wf_result_add("testcasepoint8", "Mod()", &
                                             Mod(9,2) = 1)


end subroutine

public subroutine of_testcase_point_module3 ();//测试PB函数DayName() ,DayNumber() ,RelativeDate() ,DaysAfter()
date ldt_today
string ls_dName 
int li_dNumber

ldt_today = date(2017-03-19)
ls_dName = DayName(ldt_today)
li_dNumber = DayNumber(ldt_today)

is_resultlog += wf_result_add("testcasepoint9", "DayName()", &
                                             ls_dName = 'Sunday')

is_resultlog += wf_result_add("testcasepoint10", "DayNumber()", &
                                             li_dNumber = 1)

is_resultlog += wf_result_add("testcasepoint11", "RelativeDate()", &
                                             year(RelativeDate(2017-01-31, 10)) = 2017 &
										and month(RelativeDate(2017-01-31, 10)) = 2 &
										and day(RelativeDate(2017-01-31, 10)) = 10 )
							
is_resultlog += wf_result_add("testcasepoint12", "DaysAfter()", &
                                             DaysAfter(2002-12-20, 2002-12-24) = 4 and DaysAfter(2002-12-24, 2002-12-20) = -4)


end subroutine

public subroutine of_testcase_point_module4 ();//测试PB函数getenvironment(env),以及获得的参数
environment env
integer resp
string ls_cputype, ls_ostype, ls_pbtype
resp = getenvironment(env)

choose case env.cputype
	case alpha!
		ls_cputype = 'Alpha'
	case hppa!
		ls_cputype = 'HPPA'
	case i286!
		ls_cputype = '286'
	case i386!
		ls_cputype = '386'
	case i486!
		ls_cputype = '486'
	case m68000!
		ls_cputype = '68000'
	case m68020!
		ls_cputype = '68020'
	case m68030!
		ls_cputype = '68030'
	case m68040!
		ls_cputype = '68040'
	case mips!
		ls_cputype = 'MIPS'
	case pentium!
		ls_cputype = 'Pentium'
	case powerpc!
		ls_cputype = 'PowerPC'
	case sparc!
		ls_cputype = 'Sparc'
end choose
is_resultlog += wf_result_add("testcasepoint13", "getenvironment(env),Parm env.cputype", &
                                             len(ls_cputype) > 0)


choose case env.ostype
	case aix!
		ls_ostype = 'AIX'
	case hpux!
		ls_ostype = 'HPUX'
	case osf1!
		ls_ostype = 'OSF1'
	case sol2!
		ls_ostype = 'Solaris 2'
	case Windows!
		ls_ostype = 'Windows'
	case Windowsnt!
		ls_ostype = 'Windows NT'
end choose
is_resultlog += wf_result_add("testcasepoint13", "getenvironment(env),Parm env.ostype", &
                                             len(ls_ostype) > 0)

choose case env.pbtype
	case enterprise!
		ls_pbtype = 'Enterprise'
	case desktop!
		ls_pbtype = 'Desktop'
end choose
is_resultlog += wf_result_add("testcasepoint13", "getenvironment(env),Parm env.pbtype", &
                                             len(ls_pbtype) > 0)

is_resultlog += wf_result_add("testcasepoint13", "getenvironment(env),Parm env.pbmajorrevision", &
                                             isnumber(string(env.pbmajorrevision)))

is_resultlog += wf_result_add("testcasepoint13", "getenvironment(env),Parm env.pbminorrevision", &
                                             isnumber(string(env.pbminorrevision)))

is_resultlog += wf_result_add("testcasepoint13", "getenvironment(env),Parm env.pbfixesrevision", &
                                             isnumber(string(env.pbfixesrevision)))

is_resultlog += wf_result_add("testcasepoint13", "getenvironment(env),Parm env.numberofcolors", &
                                             isnumber(string(env.numberofcolors)))

is_resultlog += wf_result_add("testcasepoint13", "getenvironment(env),Parm env.screenheight", &
                                             isnumber(string(env.screenheight)))

is_resultlog += wf_result_add("testcasepoint13", "getenvironment(env),Parm env.screenwidth", &
                                             isnumber(string(env.screenwidth)))




end subroutine

public subroutine of_testcase_point_module5 ();//测试PB函数PopulateError()，SignalError()

is_type = 'PopulateError'
timer(1)

is_resultlog += wf_result_add("testcasepoint14", "PopulateError()", &
                                             PopulateError(2, "The letter must be between 'A' and 'L'.") = 1)

is_resultlog += wf_result_add("testcasepoint15", "SignalError()", &
                                             SignalError() = 1)
															
sleep(1)


end subroutine

public subroutine of_testcase_point_module1 ();//测试Run()函数
string ls_select[], ls_name, ls_name2,ls_titlename
windowstate lw_state[]
int i, j
boolean lb_test

ls_select[1] = "calc"
ls_select[2] = "notepad"
ls_select[3] = "taskmgr"
ls_select[4] = "write"
ls_select[5] = "mspaint"
ls_select[6] = "dvdplay"

lw_state[1] = maximized!
lw_state[2] = minimized!
lw_state[3] = normal!

for i = 1 to 6
	for j = 1 to 3
	  choose case ls_select[i]
		case "calc"
			ls_name = "Calculator"
			ls_titlename = "Calculator"
		case "notepad"
			ls_name = "Notepad"
			ls_titlename = "Untitled - Notepad"
		case "taskmgr"
			ls_name = "Task Manager"
			ls_titlename = "Windows Task Manager"
		case "write"
			ls_name = "Word Pad"
			ls_titlename = "Document - WordPad"
		case "mspaint"
			ls_name = "Paint"
			ls_titlename = "Untitled - Paint"
		case "dvdplay"
			ls_name = "DVD Player"
			ls_titlename = "Windows Media Player"
	  end choose
	  
	  choose case lw_state[j]
		case maximized!
			ls_name2 = "maximized!"
		case minimized!
			ls_name2 = "minimized!"
		case normal!
			ls_name2 = "normal!"
	  end choose
	  
	  if Run(ls_select[i], lw_state[j]) = 1 then
      	is_resultlog += wf_result_add("testcasepoint3", "Run(" + string(ls_select[i])+ ", " + ls_name2 +")", &
			                                         True)
		is_type = "CloseWindow"
		sleep(0.5)
		wf_closepopwindow(ls_titlename, '')
	  else
      	is_resultlog += wf_result_add("testcasepoint3", "Run(" + string(ls_select[i])+ ", " + ls_name2 +")", &
			                                         False)
	  end if
	  
    next
next
end subroutine

public subroutine of_testcase_point_module6 ();//测试函数PrintOpen(), PrintDefineFont(), PrintSetFont(),
//               Print(), PrintClose(), PrintText(), Object.print() ,PrintPage()
yield()
dw_employee_roster.settransobject(sqlca)
dw_employee_roster.retrieve()
This.visible = true

Timer(1)

is_type = 'PrinterSetup'
cb_print_setup.triggerevent("clicked")

sleep(1)
is_type = "PrintCancel"
cb_print.triggerevent("clicked")

sleep(1)
is_type = 'PrintCancel'
cb_print_object.triggerevent("clicked")		

sleep(1)
is_type = 'PrintCancel'
cb_print_screen.triggerevent("clicked")

sleep(1)
is_type = 'PrintCancel'
cb_print_window.triggerevent("clicked")	

//新增案例CodeExample -> Object Communication -> Cancel Retrieval & Printing
sleep(1)
is_type = 'PrintCancel'
cb_print_true.triggerevent("clicked")	

//新增案例CodeExample -> Object Communication -> Cancel Retrieval & Printing
sleep(1)
is_type = 'PrintCancel'
cb_print_false.triggerevent("clicked")	

//Clear File PrintCancelTest1.xps
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps")
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps")
sleep(1)

This.visible = false
		

end subroutine

public function string of_right_adjust_dec (decimal arg_amt, string arg_format);// Function f_right_adjust_dec(dec arg_amt, string arg_format)

// Right-adjusts arg_amount in a string whose length is
// the same as that of arg_format

string	right_string

right_string = String(arg_amt,arg_format)
right_string = Left("     ",Len(arg_format)-Len(right_string)) &
					 + right_string

return right_string
end function

public subroutine of_testcase_point_module7 ();//测试注册表的增删查改RegistrySet(), RegistryGet(), RegistryValues(), RegistryDelete()
string ls_Values[], ls_Name[]
string  ls_test, ls_regedit, ls_regedit_key , ls_result, ls_file , ls_fullname
boolean lb_set, lb_Values, lb_delete
ulong lul_Val
blob lb_Val
boolean lb_reg

ls_file = 'Regedit_test.bmp'
ls_fullname = gs_cachedir+gs_dirseparator+ls_file
if not FileExists(ls_fullname)  then 
	if isvalid(w_controller) then 					
		w_controller.of_createfile(ls_fullname, sqlca) 
		if not FileExists(ls_fullname)  then 
			ls_result +=" testcasepoint31 environment file Regedit_test.bmp Exists = "+String ( "Fail!" ) +"~r~n"
		end if 
	else
		ls_result +=" testcasepoint31 environment file Regedit_test.bmp Exists = "+String ( "Fail!" ) +"~r~n"
	end if 
end if 

ls_regedit = 'HKEY_CURRENT_USER' + gs_dirseparator + 'Software\Sybase'
lb_set = true
lb_Values = true
lb_delete = true

if RegistrySet(ls_regedit + gs_dirseparator + 'key1' ,'Value1' , 'test1') <> 1 then lb_set = false
if RegistrySet(ls_regedit + gs_dirseparator + 'key2' ,'Value2' , 'test2') <> 1 then lb_set = false
if RegistrySet(ls_regedit + gs_dirseparator + 'key1' ,'Value1' , 'test2') <> 1 then lb_set = false
is_resultlog += wf_result_add("testcasepoint27", "RegistrySet()", &
                                             lb_set = true)


RegistryValues(ls_regedit+ gs_dirseparator + 'key1', ls_Values) 
if ls_Values[1] <> 'Value1'  then lb_Values = false

	
RegistryGet(ls_regedit + gs_dirseparator + 'key2' ,'Value2' , ls_test)   
is_resultlog += wf_result_add("testcasepoint28", "RegistryGet()", &
                                             ls_test = 'test2')


if RegistryDelete(ls_regedit + gs_dirseparator + 'key1' ,'Value1' ) <> 1 then lb_delete = false
if RegistryDelete(ls_regedit + gs_dirseparator + 'key2' ,'Value2' ) <> 1 then lb_delete = false

RegistryValues(ls_regedit + gs_dirseparator + 'key1', ls_Values) 
if Upperbound(ls_Values[]) <> 0 then lb_Values = false
is_resultlog += wf_result_add("testcasepoint29", "RegistryValues()", &
                                             lb_Values = true)

if RegistryDelete(ls_regedit + gs_dirseparator + 'key1' ,'') <> 1 then lb_delete = false
if RegistryDelete(ls_regedit + gs_dirseparator + 'key2' ,'') <> 1 then lb_delete = false
is_resultlog += wf_result_add("testcasepoint30", "RegistryDelete()", &
                                             lb_delete = true)


///////////////////////////测试5种不同风格的RegistrySet()
lb_reg = true 
ls_Name[1] = 'TestCase1'
ls_Name[2] = 'TestCase2'
ls_Name[3] = 'TestCase3'
ls_Name[4] = 'TestCase4'
ls_Name[5] = 'TestCase5'
lul_Val = 457
of_readblob(gs_cachedir+gs_dirseparator + 'Regedit_test.bmp', lb_Val)

if RegistrySet(ls_regedit + gs_dirseparator + 'key', ls_Name[1], RegString!, 'test') <> 1 then lb_reg = false
if RegistrySet(ls_regedit + gs_dirseparator + 'key', ls_Name[2], RegExpandString!, 'testtest') <> 1 then lb_reg = false
if RegistrySet(ls_regedit + gs_dirseparator + 'key', ls_Name[3], RegMultiString!, ls_Name) <> 1 then lb_reg = false
if RegistrySet(ls_regedit + gs_dirseparator + 'key', ls_Name[4], ReguLong!, lul_Val) <> 1 then lb_reg = false
if RegistrySet(ls_regedit + gs_dirseparator + 'key', ls_Name[5], RegBinary!, lb_Val) <> 1 then lb_reg = false
is_resultlog += wf_result_add("testcasepoint31", "RegistrySet(),five different RegStyle", &
                                             lb_reg = true)

RegistryDelete(ls_regedit + gs_dirseparator + 'key' ,'')

is_resultlog +=	ls_result  //环境文件日志



end subroutine

public function integer of_readblob (string as_filename, ref blob ab_picture);Long		ll_FileNo

ll_FileNo = FileOpen(as_FileName, StreamMode!)
If ll_FileNo = -1 Then
	Return -1
End If

FileRead(ll_FileNo, ab_Picture)

FileClose(ll_FileNo)

Return 1

end function

public subroutine of_testcase_point_module8 ();//测试系统工作目录与文件的复制剪切与粘贴CreateDirectory(), GetCurrentDirectory(), DirectoryExists(), ChangeDirectory()
//    RemoveDirectory(), FileCopy(), FileMove(), FileDelete()
string ls_Directory_test, ls_Directory, ls_file,ls_fullname ,ls_result
boolean lb_Dir

ls_file = 'Regedit_test.bmp'
ls_fullname = gs_cachedir+gs_dirseparator+ls_file
if not FileExists(ls_fullname)  then 
	if isvalid(w_controller) then 					
		w_controller.of_createfile(ls_fullname, sqlca)
		if not FileExists(ls_fullname)  then 
			ls_result +=" testcasepoint31 environment file Regedit_test.bmp Exists = "+String ( "Fail!" ) +"~r~n"
		end if 
	else
		ls_result +=" testcasepoint31 environment file Regedit_test.bmp Exists = "+String ( "Fail!" ) +"~r~n"
	end if 
end if 

			
is_resultlog += wf_result_add("testcasepoint32", "CreateDirectory()", &
                                             CreateDirectory(gs_cachedir + gs_dirseparator + 'Copy_test') = 1 &
										and CreateDirectory(gs_cachedir + gs_dirseparator + 'Move_test') = 1)

ls_Directory = GetCurrentDirectory()
is_resultlog += wf_result_add("testcasepoint33", "GetCurrentDirectory()", &
                                             len(ls_Directory) > 0)

is_resultlog += wf_result_add("testcasepoint34", "DirectoryExists()", &
                                             DirectoryExists(ls_Directory) =true )
															
lb_Dir = true
if ChangeDirectory(ls_Directory + gs_dirseparator + 'Copy_test' ) <> 1 then lb_Dir = false
if ChangeDirectory(ls_Directory) <> 1 then lb_Dir = false
is_resultlog += wf_result_add("testcasepoint35", "ChangeDirectory()", &
                                             lb_Dir = true )
															
is_resultlog += wf_result_add("testcasepoint36", "FileCopy()", &
                                             FileCopy ( gs_cachedir + gs_dirseparator + ls_file,&
															gs_cachedir + gs_dirseparator + 'Copy_test' + gs_dirseparator + ls_file, True ) = 1 )

is_resultlog += wf_result_add("testcasepoint37", "FileMove()", & 
										FileMove ( gs_cachedir + gs_dirseparator + 'Copy_test' + gs_dirseparator + ls_file, &
										                       gs_cachedir + gs_dirseparator + 'Move_test' + gs_dirseparator + ls_file ) = 1 )

is_resultlog += wf_result_add("testcasepoint38", "FileDelete()", & 
                                             FileDelete(gs_cachedir + gs_dirseparator + 'Move_test' + gs_dirseparator + ls_file) = true )
															
is_resultlog += wf_result_add("testcasepoint39", "RemoveDirectory()", &
                                             RemoveDirectory(gs_cachedir + gs_dirseparator + 'Copy_test') = 1 &
										and RemoveDirectory(gs_cachedir + gs_dirseparator + 'Move_test') = 1)
										
is_resultlog +=	ls_result  //环境文件日志
															
end subroutine

public subroutine of_testcase_point_module9 ();//测试打印机配置的几个函数PrintGetPrinters(), PrintGetPrinter(), PrintSetPrinter(), PrintSetupPrinter()
string ls_Printers, ls_Printer ,ls_place ,ls_Printer1
long ll_place, i

ls_Printers = PrintGetPrinters ( ) 
ls_Printer = PrintGetPrinter ( )

is_resultlog += wf_result_add("testcasepoint40", "PrintGetPrinter()", &
                                             POS(ls_Printers , ls_Printer) > 0)

is_resultlog += wf_result_add("testcasepoint41", "PrintGetPrinters()", &
                                             POS(ls_Printers , ls_Printer) > 0)

															
//*******************************此函数PrintSetPrinter()存在bug
For i = 1 to 2
ll_place=pos (ls_Printers, "~n") 
ls_Printer1 = left(ls_Printers, ll_place - 2)

if ls_Printer1 <> ls_Printer then 
	if PrintSetPrinter (ls_Printer1 ) = 1 then
		is_resultlog += wf_result_add("testcasepoint42", "PrintSetPrinter()", &
                                             true)
		PrintSetPrinter (ls_Printer )									
	else
	    is_resultlog += wf_result_add("testcasepoint42", "PrintSetPrinter()", &
                                             false)
     end if
	exit
else
	ls_Printers = right(ls_Printers, len(ls_Printers) - ll_place)
end if

Next
//********************************此函数PrintSetPrinter()存在bug


is_type = 'PrinterSetup2'
Timer(1)
is_resultlog += wf_result_add("testcasepoint43", "PrintSetupPrinter()", &
                                             PrintSetupPrinter() = 1)



end subroutine

public subroutine of_testcase_point_module10 ();//测试四个函数WordCap(), LastPos(), GetFolder(), ChooseColor()
string ls_folder
long ll_color, ll_customcolors[]

cb_show.triggerevent( "clicked")

is_resultlog += wf_result_add("testcasepoint45", "WordCap()", &
                                             WordCap('abc') = 'Abc')
															
is_resultlog += wf_result_add("testcasepoint46", "LastPos()", &
                                             LastPos('This is a test.', 's') = 13)
															
is_type = 'BrowseFolder'
Timer(1)
is_resultlog += wf_result_add("testcasepoint47", "GetFolder()", &
                                             GetFolder( "Browse for Folder", ls_folder) <> -1  )

is_type = 'Color'
is_resultlog += wf_result_add("testcasepoint48", "ChooseColor()", &
                                             ChooseColor(ll_color, ll_customcolors[] ) <> -1)
															

															
															
//测试图片重绘函数Draw()
int li_x, li_y
picture lp_train

li_x = dw_employee_roster.x + dw_employee_roster.width + 50
li_y = dw_employee_roster.y + dw_employee_roster.height + 50
lp_train = p_clothes
lp_train.PictureName = gs_cachedir+gs_dirseparator + 'Regedit_test.bmp'

is_resultlog += wf_result_add("testcasepoint49", "Draw()", &
                                             lp_train.Draw(li_x, li_y) = 1)
															
															

//测试函数POS(), Replace(), Upper(), Lower()
string ls_Source ,ls_Source1
int li_pos, li_pos1
string ls_Upper,ls_Lower

ls_Source = 'The Code Examples provide a demonstration of the functionality of PowerBuilder. '
ls_Source1 = 'The Code examples provide a demonstration of the functionality of PowerBuilder. '
li_pos = POS(ls_Source, 'Examples', 1)
li_pos1 = POS(ls_Source1, 'Examples', 1)
is_resultlog += wf_result_add("testcasepoint50", "POS()", &
                                             li_pos = 10 and li_pos1 = 0)

ls_Source = Replace(ls_Source, li_pos, len('Examples'), 'Test')
is_resultlog += wf_result_add("testcasepoint51", "Replace()", &
                                             ls_Source = 'The Code Test provide a demonstration of the functionality of PowerBuilder. ' )
															
is_resultlog += wf_result_add("testcasepoint52", "Upper()", &
                                             Upper('uPpEr') = 'UPPER' and Upper('u1P2p3E4r') = 'U1P2P3E4R')
															
is_resultlog += wf_result_add("testcasepoint53", "Lower()", &
                                             Lower('LoWeR') = 'lower' and Lower('L5o6W7e8R') = 'l5o6w7e8r' )




//测试函数GetSQLSelect(), SetSQLSelect()
string ls_SQL
boolean lb_set

lb_set = true
ls_SQL = dw_employee_roster.GetSQLSelect()
if ls_SQL= 'SELECT employee.emp_id, employee.dept_id, employee.emp_lname,' & 
                         + ' employee.emp_fname, employee.salary FROM employee ORDER BY ' & 
							+ 'employee.dept_id ASC,employee.emp_lname ASC, employee.emp_fname ASC ' then
	lb_set = false
end if

ls_SQL = 'SELECT employee.emp_id, employee.dept_id, employee.emp_lname, employee.emp_fname, employee.salary FROM employee ' 
is_resultlog += wf_result_add("testcasepoint54", "SetSQLSelect()", &
                                             dw_employee_roster.SetSQLSelect(ls_SQL) = 1)
															
if dw_employee_roster.GetSQLSelect() <> ls_SQL then lb_set = false

is_resultlog += wf_result_add("testcasepoint55", "GetSQLSelect()", &
                                              lb_set = true)
															 

															 
	
	
//测试获得window内class的Definition函数  FindClassDefinition() ,FindMatchingFunction()
//注：函数FindMatchingFunction()获得不成功！
ClassDefinition	lcd_Object1 , lcd_Object2
String				ls_ArgTypes[]

// Find class definition
lcd_Object1 = FindClassDefinition("w_system_function`" + 'tv_1')
lcd_Object2 = FindClassDefinition("w_system_function`" + 'lv_1')


is_resultlog += wf_result_add("testcasepoint56", "FindClassDefinition()", &
                                              IsValid(lcd_Object1) = true and IsValid(lcd_Object2) = true)

//is_resultlog += wf_result_add("Function FindMatchingFunction()", "testcasepoint57", &
//                                              IsValid(lcd_Object1.FindMatchingFunction('copy', ls_ArgTypes[])) = true &
//										 and IsValid(lcd_Object2.FindMatchingFunction('copy', ls_ArgTypes[])) = true)




//测试Move()
li_x = p_clothes.x
li_y = p_clothes.y


p_clothes.Move(li_x + 100, li_y +100)

is_resultlog += wf_result_add("testcasepoint58", "Move()", &
                                              p_clothes.x = (li_x + 100) and p_clothes.y = (li_y + 100))
	

															
															




end subroutine

public subroutine of_testcase_point_module11 ();//测试动态数据交换DDE
string ls_data
String ls_ddeappl = "DDE_Demo",ls_ddetopic="DDE"
string ls_item1="Data1",ls_item2="Data2",ls_item3="Data3"

open(w_dde_test1)
is_resultlog += wf_result_add("testcasepoint59", "StartServerDDE()", &
                                              StartServerDDE(w_dde_test1, ls_ddeappl, ls_ddetopic, ls_item1, ls_item2, ls_item3) = 1)


//********************************无法执行成功															 
//w_dde_test1.cb_2.triggerevent("clicked")	
//
//is_resultlog += wf_result_add("StartHotLink()", "testcasepoint60", &
//                                              gi_StartHotLink = 1)
//
//is_resultlog += wf_result_add("GetRemote()", "testcasepoint60", &
//                                              gi_GetRemote = 1)
//															 
//is_resultlog += wf_result_add("ExecRemote()", "testcasepoint61", &
//                                              gi_ExecRemote = 1)
//															 
//is_resultlog += wf_result_add("StopHotLink()", "testcasepoint61", &
//                                              gi_StopHotLink = 1)	
//**********************************无法执行成功


is_resultlog += wf_result_add("testcasepoint62", "StopServerDDE()", &
                                              StopServerDDE(w_dde_test1, ls_ddeappl, ls_ddetopic) = 1)
															 
w_dde_test1.cb_2.triggerevent("clicked")	
															 

									 
//测试Dec{}
dec{0}	lc_0
dec{2}	lc_2
dec{4}	lc_4
dec{6}	lc_6
dec{8}	lc_8
dec{10}	lc_10
dec lc_a

lc_a = 9.012345678765

lc_0 = lc_a
lc_2 = lc_a
lc_4 = lc_a
lc_6 = lc_a
lc_8 = lc_a
lc_10 = lc_a


is_resultlog += wf_result_add("testcasepoint63", "Dec{}", &
                                             lc_0 = 9 and lc_2 = 9.01 and lc_4 = 9.0123  &
										and lc_6 = 9.012346 and lc_8 = 9.01234568 and lc_10 = 9.0123456788 )


//垃圾回收GarbageCollectSetTimeLimit(),返回值为未重新设置时当前的值
u_parent 	luo_Object[]
Integer    	li_Obj
boolean lb_gcst

GarbageCollectSetTimeLimit(500)
															 
GarbageCollect()

For li_Obj = 1 To 100
	luo_Object[li_Obj] = Create u_parent
Next

is_resultlog += wf_result_add("testcasepoint64", "GarbageCollectSetTimeLimit()", &
                                              GarbageCollectSetTimeLimit(10) = 500 and GarbageCollectSetTimeLimit(1000000) = 10)
															 
GarbageCollectSetTimeLimit(500)





end subroutine

public subroutine of_testcase_point_module12 ();//测试接收邮件**********************************
mailReturnCode			mRet
mailMessage			mMsg[], mMsg2
mailSession		lms_mSes, lms_mSes2
int      li_msgs
string    ls_result
boolean lb_logoff

is_type = "MailSend"
Timer(1)
//Pop  Title='选择配置文件'   Button='确定'

lms_mSes = create mailSession
mRet = lms_mSes.mailLogon ( mailNewSession! )
is_resultlog += wf_result_add("testcasepoint65", "mailSession.MailLogon()", &
                                              mRet = mailreturnsuccess!)

mRet = lms_mSes.mailGetMessages ( )
li_msgs = UpperBound(lms_mSes.MessageID)

If li_msgs = 0 then ls_result +=" testcasepoint66 environment Email file Exists = "+String ( "Fail!" ) +"~r~n"

If li_msgs > 0 Then
mRet = lms_mSes.mailReadMessage ( lms_mSes.MessageID[1], mMsg[1], mailEnvelopeOnly!, FALSE )
is_resultlog += wf_result_add("testcasepoint66", "mailSession.mailReadMessage()", &
                                              mRet = mailreturnsuccess! and len(mMsg[1].Recipient[1].Name) > 0)
															 
End If

mRet = lms_mSes.mailLogoff()
If mRet = mailreturnsuccess! then lb_logoff = true

is_resultlog +=	ls_result  //环境文件日志

destroy lms_mSes




//测试发送邮件**************************************
sleep(1)
lms_mSes2 = create mailSession
mRet = lms_mSes2.mailLogon ( mailNewSession! )

mMsg2.Subject = 'SubjectTest'
mMsg2.notetext = 'MessageTest'

//mRet = lms_mSes2.mailAddress ( mMsg2 )      //弹窗选择收件人
mMsg2.Recipient[1].Name = 'testa'       //收件人

mRet = lms_mSes2.mailResolveRecipient(mMsg2.Recipient[1].Name)
is_resultlog += wf_result_add("testcasepoint67", "mailSession.MailResolveRecipient()", &
                                              mRet = mailreturnsuccess!)
															 
mRet = lms_mSes2.mailsend ( mMsg2 )
is_resultlog += wf_result_add("testcasepoint68", "mailSession.Mailsend()", &
                                              mRet = mailreturnsuccess!)
															 
mRet = lms_mSes2.mailLogoff ( )
is_resultlog += wf_result_add("testcasepoint69", "mailSession.MailLogoff()", &
                                              mRet = mailreturnsuccess! and lb_logoff = true)
														
destroy lms_mSes2




end subroutine

public subroutine of_testcase_point_module13 ();//测试OpenWithParm以及CloseWithReturn
str_testcase lstr_testcase

ib_window_parm = false
lstr_testcase.value_int = 11
lstr_testcase.value_string = 'Test'
lstr_testcase.value_boolean = true
gw_setvalue = this

OpenWithParm(w_parm_test, lstr_testcase)

is_resultlog += wf_result_add("testcasepoint70", "OpenWithParm()", &
                                              ib_window_parm = true)

lstr_testcase = message.powerobjectparm

is_resultlog += wf_result_add("testcasepoint71", "CloseWithReturn()", &
                                             lstr_testcase.value_int = 33 &
                                             and lstr_testcase.value_string = 'Case' &
                                             and lstr_testcase.value_boolean = false )




//测试OpenSheet(w_opensheet_test,ParentWindow, 4,layered!), MDIframe.ArrangeSheets(arrangetype), SetMicroHelp()
//测试OpenSheet(w_opensheet_test  , this, 2, original!), OpenSheetwithparm()
ib_OpenSheet = false
ib_ArrangeSheets = false
ib_SetMicroHelp = false
ib_OpenSheet2 = false
ib_OpenSheetwithparm = false
ib_OpenSheetwithparm2 = false

Open(w_sheet_test)
is_resultlog += wf_result_add("testcasepoint72", "OpenSheet()", &
                                             ib_OpenSheet= true and ib_OpenSheet2= true )

is_resultlog += wf_result_add("testcasepoint73", "ArrangeSheets()", &
                                             ib_ArrangeSheets = true )
													
is_resultlog += wf_result_add("testcasepoint74", "SetMicroHelp()", &
                                             ib_SetMicroHelp = true )
																										
is_resultlog += wf_result_add("testcasepoint75", "OpenSheetwithparm()", &
                                             ib_OpenSheetwithparm= true and  ib_OpenSheetwithparm2 = true) 
															  

															 

															
															








end subroutine

public subroutine of_setvalue (integer ai_case, boolean ab_case[]);choose case ai_case
	case 1  //test OpenWithParm
		ib_window_parm = ab_case[1]
		
	case 2  //test OpenSheet ,OpenSheetwithparm
		ib_OpenSheet   = ab_case[1]
	     ib_OpenSheetwithparm = ab_case[2]
		  
	case 6 //OpenSheetwithparm2
		  ib_OpenSheetwithparm2 = ab_case[1]  
		  
	case 3  //test OpenSheet2
		  ib_OpenSheet2 = ab_case[1]
		  
	case 4  //test ArrangeSheets
		ib_ArrangeSheets = ab_case[1]
		
	case 5 //test SetMicroHelp
		ib_SetMicroHelp = ab_case[1]
end choose


end subroutine

on w_system_function.create
int iCurrent
call super::create
this.cb_print_false=create cb_print_false
this.cb_print_true=create cb_print_true
this.lv_1=create lv_1
this.tv_1=create tv_1
this.p_clothes=create p_clothes
this.cb_show=create cb_show
this.cb_print_window=create cb_print_window
this.cb_print_screen=create cb_print_screen
this.cb_print_object=create cb_print_object
this.cb_3=create cb_3
this.st_2=create st_2
this.em_1=create em_1
this.cb_print_setup=create cb_print_setup
this.cb_print=create cb_print
this.dw_employee_roster=create dw_employee_roster
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print_false
this.Control[iCurrent+2]=this.cb_print_true
this.Control[iCurrent+3]=this.lv_1
this.Control[iCurrent+4]=this.tv_1
this.Control[iCurrent+5]=this.p_clothes
this.Control[iCurrent+6]=this.cb_show
this.Control[iCurrent+7]=this.cb_print_window
this.Control[iCurrent+8]=this.cb_print_screen
this.Control[iCurrent+9]=this.cb_print_object
this.Control[iCurrent+10]=this.cb_3
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.em_1
this.Control[iCurrent+13]=this.cb_print_setup
this.Control[iCurrent+14]=this.cb_print
this.Control[iCurrent+15]=this.dw_employee_roster
end on

on w_system_function.destroy
call super::destroy
destroy(this.cb_print_false)
destroy(this.cb_print_true)
destroy(this.lv_1)
destroy(this.tv_1)
destroy(this.p_clothes)
destroy(this.cb_show)
destroy(this.cb_print_window)
destroy(this.cb_print_screen)
destroy(this.cb_print_object)
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.em_1)
destroy(this.cb_print_setup)
destroy(this.cb_print)
destroy(this.dw_employee_roster)
end on

event timer;call super::timer;
if lower(is_type) = lower("Print Timer") then 
	wf_closepopwindow( "Save the file as", 'Cancel')
	wf_closepopwindow( "Save Print Output As", 'Cancel')			//for win10 print machine
	wf_closepopwindow( "Print to File", 'Cancel')
	wf_closepopwindow( "Print", 'Cancel')
elseif lower(is_type) = lower("Saveas Timer") then 
	wf_closepopwindow( "Save the file as", 'Cancel')
	wf_closepopwindow( "Save Print Output As", 'Cancel')			//for win10 print machine
elseif lower(is_type) = lower("Child Print Timer") then 
	wf_closepopwindow( "Save the file as", 'Cancel')
	wf_closepopwindow( "Save Print Output As", 'Cancel')			//for win10 print machine
elseif lower(is_type) = lower("PrintCancel") then 
	wf_closepopwindow( "Save the file as", 'Save')
	wf_closepopwindow( "Print to File", 'OK')
	wf_closepopwindow( "Save Print Output As", 'Save')			//for win10 print machine
	
elseif lower(is_type) = lower("PrinterSetup") then 
	wf_closepopwindow( 'Printer Setup', 'OK')
elseif lower(is_type) = lower("PrinterSetup2") then 
	wf_closepopwindow('Microsoft XPS Document Writer Document Properties', 'OK')
elseif lower(is_type) = lower("BrowseFolder") then 
	wf_closepopwindow( 'Browse for Folder', 'Cancel')  //默认窗口打开时焦点不在文件夹上，所以不能点击OK
elseif lower(is_type) = lower("Color") then 
	wf_closepopwindow( 'Color', 'OK')
elseif lower(is_type) = lower("PopulateError") then   //关闭PopulateError弹窗
    wf_closepopwindow('No cathed Error', 'OK')
    wf_closepopwindow('System Error', 'Continue')
elseif lower(is_type) = lower("MailSend") then 
	wf_closepopwindoww( '选择配置文件', '确定') 
	wf_closepopwindow( 'Choose Profile', 'OK')
end if  






end event

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"Regedit_test.bmp") then
	FileDelete(ls_filepath+"Regedit_test.bmp")
end if

//Clear File PrintCancelTest1.xps
if FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps") then
	FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps")
end if
if FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps") then  //win10
	FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps")
end if
end event

type cb_print_false from commandbutton within w_system_function
integer x = 1234
integer y = 1472
integer width = 549
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "dw.Print(False)"
end type

event clicked;//Clear File PrintCancelTest1.xps
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps")
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps")
sleep(1)

is_resultlog += wf_result_add("testcasepoint20", "dw.Print(False)", &
		                                    dw_employee_roster.Print(False) = 1)
end event

type cb_print_true from commandbutton within w_system_function
integer x = 622
integer y = 1468
integer width = 539
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "dw.Print(True)"
end type

event clicked;//Clear File PrintCancelTest1.xps
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps")
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps")
sleep(1)

is_resultlog += wf_result_add("testcasepoint20", "dw.Print(True)", &
		                                    dw_employee_roster.Print(True) = 1)
end event

type lv_1 from listview within w_system_function
integer x = 3154
integer y = 772
integer width = 279
integer height = 476
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long largepicturemaskcolor = 536870912
long smallpicturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

type tv_1 from treeview within w_system_function
integer x = 3131
integer y = 256
integer width = 315
integer height = 412
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

type p_clothes from picture within w_system_function
integer x = 2510
integer y = 1256
integer width = 293
integer height = 256
boolean originalsize = true
string picturename = "C:\Users\appeon\Desktop\SVN Code\Regedit_test.bmp"
boolean focusrectangle = false
end type

type cb_show from commandbutton within w_system_function
integer x = 2400
integer y = 124
integer width = 594
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ShowPopupHelp"
end type

event clicked;
is_resultlog += wf_result_add("testcasepoint44", "ShowPopupHelp()", &
                                             ShowPopupHelp('exampl126.chm',this,101) = 1)
end event

type cb_print_window from commandbutton within w_system_function
integer x = 50
integer y = 1468
integer width = 498
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print Window"
end type

event clicked;// Script for printing a screen

Long	ll_Job
boolean lb_print

//Clear File PrintCancelTest1.xps
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps")
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps")
sleep(1)


// Open a print job and give it a title
ll_Job = PrintOpen("Print Screen Example")
If ll_Job = -1 Then return

// Prints the screen image at the location specified by x and y and in the size specified by 
// width and height. If you do not specify the width and height, PowerBuilder uses the original 
// size of the screen.

if Parent.Print(ll_Job, 10, 10, 2000, 2000) = 1 then lb_print = true
is_resultlog += wf_result_add("testcasepoint26", "Parent.Print()", &
                                            lb_print = true )

// Close the print job which will send the data to the printer
PrintClose(ll_Job)

end event

type cb_print_screen from commandbutton within w_system_function
integer x = 1477
integer y = 1308
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print Screen"
end type

event clicked;// Script for printing a screen

Long	ll_Job

//Clear File PrintCancelTest1.xps
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps")
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps")
sleep(1)


// Open a print job and give it a title
ll_Job = PrintOpen("Print Screen Example")
If ll_Job = -1 Then return

// Prints the screen image at the location specified by x and y and in the size specified by 
// width and height. If you do not specify the width and height, PowerBuilder uses the original 
// size of the screen.

is_resultlog += wf_result_add("testcasepoint25", "PrintScreen()", &
                                             PrintScreen(ll_Job, 10, 10, 8000, 5000) = 1)

// Close the print job which will send the data to the printer
PrintClose(ll_Job)

end event

type cb_print_object from commandbutton within w_system_function
integer x = 997
integer y = 1304
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print Object"
end type

event clicked;Integer	li_Index, li_Pos
Long		ll_Job
String	    ls_Header
DragObject ldo_Object
boolean lb_a,lb_b

//Clear File PrintCancelTest1.xps
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps")
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps")
sleep(1)

// Open a print job and give it a title
ll_Job = PrintOpen("Print Object Example")
if ll_Job = -1 then return

lb_a = true
lb_b = true

For li_Index = 1 To 3
     ldo_Object = cb_3
	ls_Header = "Object:  " + ldo_Object.ClassName() + "    Width = " + &
					String(ldo_Object.Width) + "    Height = " + String(ldo_Object.Height)

	if not isnumber(string(PrintText(ll_Job, ls_Header, 10, li_Pos))) then lb_a = false
	
	if ldo_Object.Print (ll_Job, 10, li_Pos + 50) <> 1 then lb_b = false
				
	li_Pos = li_Pos + 200
	If li_Index = 3 Then
		is_resultlog += wf_result_add("testcasepoint22", "PrintText()", &
		                                             lb_a = true )
	    is_resultlog += wf_result_add("testcasepoint23", "Object.print()", &
		                                             lb_b = true )
		is_resultlog += wf_result_add("testcasepoint24", "PrintPage()", &
		                                             PrintPage(ll_Job) = 1)
	End If
Next

PrintClose (ll_Job)
end event

type cb_3 from commandbutton within w_system_function
integer x = 2551
integer y = 972
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "print test"
boolean default = true
end type

type st_2 from statictext within w_system_function
integer x = 2523
integer y = 736
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "print test"
boolean focusrectangle = false
end type

type em_1 from editmask within w_system_function
integer x = 2542
integer y = 540
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "8000"
borderstyle borderstyle = stylelowered!
string mask = "###,###."
boolean spin = true
end type

type cb_print_setup from commandbutton within w_system_function
integer x = 41
integer y = 1308
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print Setup"
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for cb_pr_setup
////////////////////////////////////////////////////////////////////////////////////////////////////////


is_resultlog += wf_result_add("testcasepoint16", "PrintSetup()", &
                                             PrintSetup( ) = 1)


      	
end event

type cb_print from commandbutton within w_system_function
integer x = 512
integer y = 1304
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Print"
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for cb_print
////////////////////////////////////////////////////////////////////////////////////////////////////////

int			li_print_ret
int			li_current_dept, li_new_dept
int			li_font_height
long			ll_print_job
long			ll_dw_row, ll_max_row
string		ls_current_name
string		ls_font_facename

decimal{2}	lc_current_salary, lc_department_total_salary , lc_grand_total_salary
boolean lb_PrintDefineFont, lb_PrintSetFont, lb_Print

//Clear File PrintCancelTest1.xps
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.xps")
if   FileExists(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps") then FileDelete(gs_cachedir + gs_dirseparator + "PrintCancelTest1.oxps")
sleep(1)

ll_max_row = dw_employee_roster.RowCount( )

// Open print job and assign job number
ll_print_job = PrintOpen( )				
if ll_print_job < 0 then
	is_resultlog += wf_result_add("testcasepoint17", "PrintOpen()", &
                                                 	false)
	return
else
	is_resultlog += wf_result_add("testcasepoint17", "PrintOpen()",  &
	                                             true)
end if

// Define font #1 as Bold with default printer font 
lb_PrintDefineFont = true
ls_font_facename = "Arial"				// Change font to Arial
li_font_height = 0						// current height remains the same
li_print_ret = PrintDefineFont(ll_print_job,1, &
					ls_font_facename, &
					li_font_height,   &
					700,           &
					Default!,      &
					AnyFont!,      &
					False,         	/* Italic */	&
					False)				/* Underline */
if li_print_ret <> 1 then lb_PrintDefineFont = false

// Define font #2 as Bold/Underline with default printer font 
li_print_ret = PrintDefineFont(ll_print_job,2, &
					ls_font_facename, &
					li_font_height,   &
					700,           &
					Default!,      &
					AnyFont!,      &
					False,         	/* Italic */	&
					True)					/* Underline */
if li_print_ret <> 1 then lb_PrintDefineFont = false
is_resultlog += wf_result_add("testcasepoint18", "PrintDefineFont()", &
                                             lb_PrintDefineFont)

// Initialize loop counter
ll_dw_row  = 1						

// Initialize grand total	
lc_grand_total_salary = 0.00			


////////////////////////////////////////////////////////////////////////////////////////////////////////
// Print Report Title and Current Date 
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Set Bold font
lb_PrintSetFont = True
lb_Print = True
li_print_ret = PrintSetFont(ll_print_job,1)
if li_print_ret = -1 then lb_PrintSetFont = false

li_print_ret = Print(ll_print_job, "Employee Compensation Report", 4500)
if li_print_ret<> 1 then lb_Print = false

li_print_ret = Print(ll_print_job, String(Today( ),"mmmm d, yyyy"))
if li_print_ret<> 1 then lb_Print = false

// Restore default font
li_print_ret = PrintSetFont(ll_print_job,0)	
if li_print_ret = -1 then lb_PrintSetFont = false

// Print 2 blank lines
li_print_ret = Print(ll_print_job, " ")	
if li_print_ret<> 1 then lb_Print = false
li_print_ret = Print(ll_print_job, " ")
if li_print_ret<> 1 then lb_Print = false

do While ll_dw_row <= ll_max_row

	// Begin processing a Department 
	li_print_ret = PrintSetFont(ll_print_job,2)
	if li_print_ret = -1 then lb_PrintSetFont = false
	li_print_ret = Print(ll_print_job, 2200, "Department Number:  ", 1)
	if li_print_ret<> 1 then lb_Print = false

	li_current_dept = dw_employee_roster.Object.dept_id[ll_dw_row]
	li_print_ret = Print(ll_print_job, String(li_current_dept))
	if li_print_ret<> 1 then lb_Print = false

	// Restore default font
	li_print_ret = PrintSetFont(ll_print_job,0)	
	if li_print_ret = -1 then lb_PrintSetFont = false

	// Print a blank line
	li_print_ret = Print(ll_print_job," ")		
	if li_print_ret<> 1 then lb_Print = false

	// Begin loop for employees within this department 
	li_new_dept = li_current_dept
	lc_department_total_salary = 0.00			// Initialize group total
	Do While li_new_dept = li_current_dept

		// Concatenate Lastname, Firstname 
		string ls_fname, ls_lname
		ls_fname = dw_employee_roster.Object.emp_fname[ll_dw_row] 
		ls_lname = dw_employee_roster.Object.emp_lname[ll_dw_row]
		ls_current_name = ls_fname + ', ' + ls_lname

		//update status display

		lc_current_salary = dw_employee_roster.Object.salary[ll_dw_row]
		lc_department_total_salary = lc_department_total_salary + lc_current_salary
		li_print_ret = Print(ll_print_job, ls_current_name, 5000)
		if li_print_ret<> 1 then lb_Print = false
		li_print_ret = Print(ll_print_job, &
							of_right_adjust_dec(lc_current_salary,"$###,###"))
		if li_print_ret<> 1 then lb_Print = false
		
		ll_dw_row = ll_dw_row + 1
		if ll_dw_row > ll_max_row then exit
		li_new_dept = dw_employee_roster.Object.dept_id[ll_dw_row]
	loop	// Loop for employees within this department 

	li_print_ret = Print(ll_print_job, " ")
	if li_print_ret<> 1 then lb_Print = false
	li_print_ret = Print(ll_print_job, 3000, "Department total:", 5000)
	if li_print_ret<> 1 then lb_Print = false
		li_print_ret = Print(ll_print_job, &
							of_right_adjust_dec(lc_department_total_salary,"$###,###"))
	if li_print_ret<> 1 then lb_Print = false
	li_print_ret = Print(ll_print_job, " ")
	if li_print_ret<> 1 then lb_Print = false
	li_print_ret = Print(ll_print_job, " ")
	if li_print_ret<> 1 then lb_Print = false
	li_current_dept = li_new_dept
	lc_grand_total_salary = lc_grand_total_salary + lc_department_total_salary

loop	// Loop for each department 

// Now print grand total 
li_print_ret = Print(ll_print_job, " ")
if li_print_ret<> 1 then lb_Print = false
li_print_ret = Print(ll_print_job, 3400, "Grand total:", 5000)
if li_print_ret<> 1 then lb_Print = false
li_print_ret = Print(ll_print_job, &
					of_right_adjust_dec(lc_grand_total_salary,"$###,###"))
if li_print_ret<> 1 then lb_Print = false

is_resultlog += wf_result_add("testcasepoint19", "PrintSetFont()", & 
                                             lb_PrintSetFont)
is_resultlog += wf_result_add("testcasepoint20", "Print(job)", &
                                             lb_Print)

// Close print job
li_print_ret = PrintClose(ll_print_job)
if li_print_ret < 0 then
	is_resultlog += wf_result_add("testcasepoint21", "PrintClose()", &
	                                             false)
	return
else
	is_resultlog += wf_result_add("testcasepoint21", "PrintClose()", &
	                                             true)
end if


end event

type dw_employee_roster from datawindow within w_system_function
integer x = 82
integer y = 68
integer width = 2217
integer height = 1196
integer taborder = 10
string title = "none"
string dataobject = "d_employees_by_dept"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

