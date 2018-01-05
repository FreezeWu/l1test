$PBExportHeader$w_button_report170322.srw
$PBExportComments$Window displaying DataWindow report using buttons
forward
global type w_button_report170322 from w_base_case
end type
type dw_1 from datawindow within w_button_report170322
end type
end forward

global type w_button_report170322 from w_base_case
integer width = 2779
integer height = 1964
string title = "Report With DataWindow Buttons"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79741120
boolean center = false
dw_1 dw_1
end type
global w_button_report170322 w_button_report170322

type prototypes
Function boolean SetCursorPos(int cx, int cy) LIBRARY  "User32.dll" 
Subroutine mouse_event(Ulong dwflag, Ulong dx, Ulong dy, Ulong cbutton, Ulong dwextra) LIBRARY "user32.dll" 
end prototypes

type variables
int il_can_close
boolean ib_clicked
end variables

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();// 由于有些reporting button 测试结果无法通过代码获取，所以只能测试retrieve, preview，自定义按钮功能

long ll_x, ll_y
ulong MOUSEEVENTF_LEFTDOWN, MOUSEEVENTF_LEFTUP
boolean lb_mouse


// 测试retrieve(2)
ll_x = ( dw_1.x + 130 )
ll_y = ( dw_1.y + 20 + 100 )
ll_x = unitstopixels(ll_x, xunitstopixels!)   
ll_y = unitstopixels(ll_y, yunitstopixels!)
lb_mouse = setcursorpos(ll_x, ll_y)
sleep(0.1)

//MOUSEEVENTF_MOVE = 1 MOUSEEVENTF_LEFTDOWN = 2  MOUSEEVENTF_LEFTUP = 4    MOUSEEVENTF_CLICKED = 7
MOUSEEVENTF_LEFTDOWN = 2
mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)  
sleep(0.1)
MOUSEEVENTF_LEFTUP = 4
mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
sleep(0.1)
//yield()

// 测试Preview(16)

ll_x = ( dw_1.x + 530 )
ll_y = ( dw_1.y + 20 + 100 )
ll_x = unitstopixels(ll_x, xunitstopixels!)   
ll_y = unitstopixels(ll_y, yunitstopixels!)
lb_mouse = setcursorpos(ll_x, ll_y)
sleep(0.1)

//MOUSEEVENTF_MOVE = 1 MOUSEEVENTF_LEFTDOWN = 2  MOUSEEVENTF_LEFTUP = 4    MOUSEEVENTF_CLICKED = 7
MOUSEEVENTF_LEFTDOWN = 2
mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)  
sleep(0.1)
MOUSEEVENTF_LEFTUP = 4
mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
sleep(0.1)
//yield()


//自定义按钮事件可以通过代码触发
dw_1.event buttonclicked(1,0,  dw_1.object.cb_help)


	


end subroutine

on w_button_report170322.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_button_report170322.destroy
call super::destroy
destroy(this.dw_1)
end on

event ue_preopen;call super::ue_preopen;dw_1.SetTransObject(sqlca)
//dw_1.Retrieve()

end event

event ue_execute;//choose case as_testcasename 
//	case 	is_testcasename				
//		is_resultlog = ''
//		of_testcase_point_module( )
//		of_testcase_point_module1( )
//		of_testcase_point_module2( )		
//		of_testcase_point_module3( )		
//		of_testcase_point_module4( )				
//		of_testcase_point_module5( )				
//		of_testcase_point_module6( )
//		of_testcase_point_module7( )		
//		of_testcase_point_module8( )		
//		of_testcase_point_module9( )				
//		of_testcase_point_module10( )				
//end choose

Post of_testcase_point_module( )

Timer (1 , this)
		 

end event

event resize;//
end event

event timer;call super::timer;if il_can_close > 1 then
	is_resultlog += wf_result_add("testcasepoint1","Retrieve(2) trigger", dw_1.rowcount() > 0)
	is_resultlog += wf_result_add("testcasepoint1","Preview(16) trigger", dw_1.Describe("DataWindow.Print.Preview") = 'yes')
	is_resultlog += wf_result_add("testcasepoint1","User define button trigger",ib_clicked)
	gf_returnresult(is_resultlog)
	close(this)
//elseif il_can_close= 0 then
	//of_testcase_point_module( )
//	il_can_close ++
else
	il_can_close ++
end if


end event

type dw_1 from datawindow within w_button_report170322
integer width = 2725
integer height = 1736
integer taborder = 1
string dataobject = "d_button_report170322"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;string	ls_Object
string	ls_win

ls_Object = String(dwo.name)

if  ls_Object = "cb_help" Then
	ib_clicked = true
end if
//If ls_Object = "cb_exit" Then
//	Close(Parent)
//ElseIf ls_Object = "cb_help" Then
//	ls_win = parent.ClassName()
//	f_open_help(ls_win)
//End If

end event

event clicked;//messagebox(string(xpos), string(ypos))
end event

