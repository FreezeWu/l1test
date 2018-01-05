$PBExportHeader$w_base.srw
forward
global type w_base from window
end type
end forward

global type w_base from window
integer width = 2752
integer height = 1740
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_postopen ( )
event ue_execute ( string as_testcasename )
event ue_preopen ( )
event ue_init_data ( )
event ue_cleantempfile ( )
end type
global w_base w_base

type prototypes

end prototypes

type variables
eon_appeon_resize  ieon_resize

string 	is_runtimeresult
boolean 	ib_auto
string 	is_testcasename
end variables

forward prototypes
public subroutine wf_setflag ()
public function string wf_result (string as_testcase)
public subroutine wf_setenabled ()
end prototypes

event ue_postopen();// 执行测试点

wf_setenabled()
end event

event ue_preopen();//初始化数据

end event

event ue_init_data();//test case init data
end event

event ue_cleantempfile();//
end event

public subroutine wf_setflag ();// 当需要特殊处理resize逻辑时，设置控件的flag标志
end subroutine

public function string wf_result (string as_testcase);// 返回运行时结果值，供controller窗体更新数据，提高性能

return is_runtimeresult
end function

public subroutine wf_setenabled ();//在子窗口界面，根据权限设置按钮的可执行状态
end subroutine

on w_base.create
end on

on w_base.destroy
end on

event open;string ls_testcasename
ieon_resize = create eon_appeon_resize

is_testcasename = message.stringparm
ieon_resize.of_init(this,true)

ieon_resize.of_zoom(true,3)

ieon_resize.of_fontresize(true,3)

this.triggerevent('ue_preopen')

this.triggerevent('ue_init_data')

wf_setflag()

this.postevent("ue_postopen")

this.event ue_execute(is_testcasename)
end event

event resize;ieon_resize.of_resize( this, newwidth, newheight, true)
end event

