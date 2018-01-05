$PBExportHeader$w_powerscript_in_validation.srw
$PBExportComments$DW that calls PowerScript function in a validation formula.  Also has examples of complex validation rules.
forward
global type w_powerscript_in_validation from w_base_case
end type
type cb_1 from commandbutton within w_powerscript_in_validation
end type
type st_8 from statictext within w_powerscript_in_validation
end type
type st_7 from statictext within w_powerscript_in_validation
end type
type st_6 from statictext within w_powerscript_in_validation
end type
type st_5 from statictext within w_powerscript_in_validation
end type
type st_4 from statictext within w_powerscript_in_validation
end type
type st_3 from statictext within w_powerscript_in_validation
end type
type dw_1 from datawindow within w_powerscript_in_validation
end type
type st_2 from statictext within w_powerscript_in_validation
end type
type st_1 from statictext within w_powerscript_in_validation
end type
end forward

global type w_powerscript_in_validation from w_base_case
integer x = 192
integer y = 260
integer width = 3045
integer height = 1204
string title = "DataWindow Validation Rules"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
dw_1 dw_1
st_2 st_2
st_1 st_1
end type
global w_powerscript_in_validation w_powerscript_in_validation

type variables
integer ii_flag
end variables

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();dw_1.SetTransObject (sqlca)
dw_1.Retrieve ()

is_type = "messagebox"
timer(1)


// "All employee #'s are greater than 100."
ii_flag = 1
dw_1.setfocus()
dw_1.scrolltorow(1)
dw_1.setcolumn("emp_id")
dw_1.settext("1")
dw_1.accepttext()
is_resultlog += wf_result_add("testcasepoint1", "datawindow validation:All employee #'s are greater than 100", ii_flag = 1 and pos(is_log, "DataWindow Error") > 0)

// 'The department you entered does not exist in the department table.  Please enter another department.'
ii_flag = 2
dw_1.Retrieve ()
dw_1.setfocus()
dw_1.scrolltorow(1)
dw_1.setcolumn("dept_id")
dw_1.settext("101")
dw_1.accepttext()
is_resultlog += wf_result_add("testcasepoint1", "datawindow validation:The department you entered does not exist in the department table", ii_flag = 2 and pos(is_log, "DataWindow Error") > 0)

// "Name must only contain alphabetic characters.  The first character of Name must be capitalized."
ii_flag = 3
dw_1.Retrieve ()
dw_1.setfocus()
dw_1.scrolltorow(1)
dw_1.setcolumn("name")
dw_1.settext("AppeoN")
dw_1.accepttext()
is_resultlog += wf_result_add("testcasepoint1", "datawindow validation:Name must only contain alphabetic characters.  The first character of Name must be capitalized", ii_flag = 3 and pos(is_log, "DataWindow Error") > 0)

//'The salary for dept ' + dept_id + ' must be less than ' + if (dept_id = 100 , '$65,000', if (dept_id = 200, '$60,000', '$90,000'))
ii_flag = 4
dw_1.Retrieve ()
dw_1.setfocus()
dw_1.scrolltorow(1)
dw_1.setcolumn("salary")
dw_1.settext("99000")
dw_1.accepttext()
is_resultlog += wf_result_add("testcasepoint1", "datawindow validation:The salary for dept ' + dept_id + ' must be less than ' + if (dept_id = 100 , '$65,000', if (dept_id = 200, '$60,000', '$90,000')", ii_flag = 4 and pos(is_log, "DataWindow Error") > 0)


end subroutine

on w_powerscript_in_validation.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.dw_1=create dw_1
this.st_2=create st_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_8
this.Control[iCurrent+3]=this.st_7
this.Control[iCurrent+4]=this.st_6
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.st_1
end on

on w_powerscript_in_validation.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.st_1)
end on

event timer;call super::timer;is_log =  ""
wf_closepopwindow( "DataWindow Error", 'OK')
//wf_closepopwindow( "DataWindow", 'OK')
//
//
//
//if len(is_log) > 0 then
//	messagebox('kill', is_log)
//end if
//if pos(is_log, "DataWindow Error") > 0 then ib_datawindow_error = true
//if pos(is_log, "DataWindow") > 0 then ib_datawindow = true
//
end event

type cb_1 from commandbutton within w_powerscript_in_validation
integer x = 2478
integer y = 116
integer width = 526
integer height = 132
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.Testcasepoint"
end type

event clicked;of_testcase_point_module()
end event

type st_8 from statictext within w_powerscript_in_validation
integer y = 808
integer width = 462
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = " Other    < 90,000"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_powerscript_in_validation
integer y = 752
integer width = 462
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = " 200       < 60,000"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_powerscript_in_validation
integer y = 692
integer width = 462
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = " 100       < 65,000"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_powerscript_in_validation
integer x = 18
integer y = 52
integer width = 453
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Validation Rule"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_powerscript_in_validation
integer y = 624
integer width = 448
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Dept       Salary"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_powerscript_in_validation
integer x = 14
integer y = 332
integer width = 613
integer height = 236
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Name consists of alphabetic characters only.  The first character of Name must be uppercase."
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_powerscript_in_validation
integer x = 645
integer y = 116
integer width = 1792
integer height = 740
integer taborder = 10
string dataobject = "d_powerscript_function_validation"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_powerscript_in_validation
integer x = 14
integer y = 220
integer width = 448
integer height = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "ID is in the dept table"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_powerscript_in_validation
integer x = 14
integer y = 132
integer width = 448
integer height = 68
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "ID is > 100"
alignment alignment = center!
boolean focusrectangle = false
end type

