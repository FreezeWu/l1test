$PBExportHeader$w_resize_windows170305.srw
forward
global type w_resize_windows170305 from w_base_case
end type
type cb_1 from commandbutton within w_resize_windows170305
end type
type sle_height from singlelineedit within w_resize_windows170305
end type
type sle_width from singlelineedit within w_resize_windows170305
end type
type st_1 from statictext within w_resize_windows170305
end type
type st_2 from statictext within w_resize_windows170305
end type
type cb_2 from commandbutton within w_resize_windows170305
end type
type sle_x from singlelineedit within w_resize_windows170305
end type
type sle_y from singlelineedit within w_resize_windows170305
end type
type st_3 from statictext within w_resize_windows170305
end type
type st_4 from statictext within w_resize_windows170305
end type
end forward

global type w_resize_windows170305 from w_base_case
integer width = 1170
integer height = 968
cb_1 cb_1
sle_height sle_height
sle_width sle_width
st_1 st_1
st_2 st_2
cb_2 cb_2
sle_x sle_x
sle_y sle_y
st_3 st_3
st_4 st_4
end type
global w_resize_windows170305 w_resize_windows170305

type variables
long il_height, il_width

end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
end prototypes

public subroutine of_testcase_point_module ();
il_height = This.height
sle_height.text = string(il_height)

il_width = This.width
sle_width.text = string(il_width)


sle_x.text = string(This.x)

sle_y.text = string(This.y)


//resize

This.resize( long(sle_width.text), long(sle_height.text) )


If This.height = il_height and This.width = il_width then
//	is_resultlog += wf_result_add("testcasepoint1","original height = " + string(il_height)+ " resized height =  " + string(This.height), True)
//	is_resultlog += wf_result_add("testcasepoint1","original width = " + string(il_width)+ " resized width =  " + string(This.width), True)
	is_resultlog += wf_result_add("testcasepoint1","resize function", True)
else
//	If This.height <> il_height then
//		is_resultlog += wf_result_add("testcasepoint1","original height = " + string(il_height)+ " resized height =  " + string(This.height), False)
//	else
//		is_resultlog += wf_result_add("testcasepoint1","original height = " + string(il_height)+ " resized height =  " + string(This.height), True)
//	end if
//	If This.width <> il_width then
//		is_resultlog += wf_result_add("testcasepoint1","original width = " + string(il_width)+ " resized width =  " + string(This.width), False)
//	else
//		is_resultlog += wf_result_add("testcasepoint1","original width = " + string(il_width)+ " resized width =  " + string(This.width), True)
//	end if
	is_resultlog += wf_result_add("testcasepoint1","resize function", False)
end if

end subroutine

public subroutine of_testcase_point_module1 ();
This.height =  long(sle_height.text) 
This.width =  long(sle_width.text) 



If This.height = il_height and This.width = il_width then
//	is_resultlog += wf_result_add("testcasepoint2","original height = " + string(il_height)+ " resized height =  " + string(This.height), True)
//	is_resultlog += wf_result_add("testcasepoint2","original width = " + string(il_width)+ " resized width =  " + string(This.width), True)
	is_resultlog += wf_result_add("testcasepoint1","resize result", True)
else
//	If This.height <> il_height then
//		is_resultlog += wf_result_add("testcasepoint2","original height = " + string(il_height)+ " resized height =  " + string(This.height), False)
//	else
//		is_resultlog += wf_result_add("testcasepoint2","original height = " + string(il_height)+ " resized height =  " + string(This.height), True)
//	end if
//	If This.width <> il_width then
//		is_resultlog += wf_result_add("testcasepoint2","original width = " + string(il_width)+ " resized width =  " + string(This.width), False)
//	else
//		is_resultlog += wf_result_add("testcasepoint2","original width = " + string(il_width)+ " resized width =  " + string(This.width), True)
//	end if
	is_resultlog += wf_result_add("testcasepoint1","resize result", True)
end if


end subroutine

on w_resize_windows170305.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.sle_height=create sle_height
this.sle_width=create sle_width
this.st_1=create st_1
this.st_2=create st_2
this.cb_2=create cb_2
this.sle_x=create sle_x
this.sle_y=create sle_y
this.st_3=create st_3
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.sle_height
this.Control[iCurrent+3]=this.sle_width
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.sle_x
this.Control[iCurrent+8]=this.sle_y
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.st_4
end on

on w_resize_windows170305.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.sle_height)
destroy(this.sle_width)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cb_2)
destroy(this.sle_x)
destroy(this.sle_y)
destroy(this.st_3)
destroy(this.st_4)
end on

event resize;// 测试resize功能，所以需要将继承窗口的resize的代码移除，以免影响测试结果
end event

type cb_1 from commandbutton within w_resize_windows170305
integer x = 46
integer y = 548
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.resize"
end type

event clicked;of_testcase_point_module()
end event

type sle_height from singlelineedit within w_resize_windows170305
integer x = 46
integer y = 152
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event getfocus;this.selectedtext( )
end event

type sle_width from singlelineedit within w_resize_windows170305
integer x = 46
integer y = 400
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_resize_windows170305
integer x = 46
integer y = 300
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "width"
boolean focusrectangle = false
end type

type st_2 from statictext within w_resize_windows170305
integer x = 46
integer y = 52
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "height"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_resize_windows170305
integer x = 50
integer y = 676
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2.resize"
end type

event clicked;of_testcase_point_module1()
end event

type sle_x from singlelineedit within w_resize_windows170305
integer x = 521
integer y = 152
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type sle_y from singlelineedit within w_resize_windows170305
integer x = 521
integer y = 400
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type st_3 from statictext within w_resize_windows170305
integer x = 521
integer y = 52
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "X"
boolean focusrectangle = false
end type

type st_4 from statictext within w_resize_windows170305
integer x = 521
integer y = 300
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Y"
boolean focusrectangle = false
end type

