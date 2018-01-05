$PBExportHeader$w_dw_itemerror.srw
forward
global type w_dw_itemerror from w_base_case
end type
type cb_1 from commandbutton within w_dw_itemerror
end type
type dw_evaluate from datawindow within w_dw_itemerror
end type
end forward

global type w_dw_itemerror from w_base_case
integer width = 3442
integer height = 1516
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_1 cb_1
dw_evaluate dw_evaluate
end type
global w_dw_itemerror w_dw_itemerror

type variables
integer il_flag
boolean ib_datawindow_error, ib_datawindow

end variables

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();// set the transaction object
dw_evaluate.SetTransObject(sqlca)

//load the datawindow
dw_evaluate.retrieve()


//itemerror 四种返回值

//0 (Default) Reject the data value and show an error message box
//
//1 Reject the data value with no message box
//
//2 Accept the data value
//
//3 Reject the data value but allow focus to change






is_type = "messagebox"
timer(1)

//0 (Default) Reject the data value and show an error message box
dw_evaluate.setfocus()
dw_evaluate.scrolltorow(1)
dw_evaluate.setcolumn("employee_salary")
dw_evaluate.settext("-1")
dw_evaluate.accepttext()
//dw_evaluate.object.employee_salary[1] =  -1
is_resultlog += wf_result_add("testcasepoint1", "datawindow Itemerror:Return 0 (Default) Reject the data value and show an error message box", il_flag = -1 and ib_datawindow_error = true )

//1 Reject the data value with no message box
dw_evaluate.setfocus()
dw_evaluate.scrolltorow(1)
dw_evaluate.setcolumn("employee_salary")
dw_evaluate.settext("a")
dw_evaluate.accepttext()
//dw_evaluate.object.employee_salary[1] = 'a'
is_resultlog += wf_result_add("testcasepoint1", "datawindow Itemerror:Return 1 Reject the data value with no message box", il_flag = 1 )


//2 Accept the data value
dw_evaluate.setfocus()
dw_evaluate.scrolltorow(1)
dw_evaluate.setcolumn("employee_salary")
dw_evaluate.settext("-2")
dw_evaluate.accepttext()
//dw_evaluate.object.employee_salary[1] =  -2
is_resultlog += wf_result_add("testcasepoint1", "datawindow Itemerror:2 Accept the data value", il_flag = 2 )

//3 Reject the data value but allow focus to change
dw_evaluate.setfocus()
dw_evaluate.scrolltorow(1)
dw_evaluate.setcolumn("employee_salary")
dw_evaluate.settext("2 - 1")
dw_evaluate.accepttext()
//dw_evaluate.object.employee_salary[1] = '1 - 2'
is_resultlog += wf_result_add("testcasepoint1", "3 Reject the data value but allow focus to change", il_flag = 3)

end subroutine

on w_dw_itemerror.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_evaluate=create dw_evaluate
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_evaluate
end on

on w_dw_itemerror.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_evaluate)
end on

event timer;call super::timer;is_log =  ""
wf_closepopwindow( "DataWindow Error", 'OK')
wf_closepopwindow( "DataWindow", 'OK')



if pos(is_log, "DataWindow Error") > 0 then ib_datawindow_error = true
if pos(is_log, "DataWindow") > 0 then ib_datawindow = true

end event

type cb_1 from commandbutton within w_dw_itemerror
integer x = 2272
integer y = 88
integer width = 951
integer height = 132
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.Testcasepoint:item_error"
end type

event clicked;of_testcase_point_module()
end event

type dw_evaluate from datawindow within w_dw_itemerror
integer x = 101
integer y = 32
integer width = 2103
integer height = 1348
integer taborder = 10
string dataobject = "d_evaluate"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemerror;///////////////////////////////////////////////////////////////////////////////////////////////
//itemerror script for dw_evaluate
///////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////
//A datawindow field is evaluated in the following manner.
//		1) Is the new data a valid type for this field
//		2) Does it pass the validation rule in the datawindow for that field
//If 1 or 2 does not pass PowerBuilder will run the ItemError Datawindow Event.
///////////////////////////////////////////////////////////////////////////////////////////////

//Assumption: Only the numeric field is updatable in this datawindow.
//If other fields are editable, addition of logic is required to check them.

string	ls_result
string	ls_item
int		li_rc

//get the current text in the field that failed
ls_item = this.gettext()

If this.GetColumnName() = 'employee_salary' Then
	If isNumber(ls_item) Then
		if integer(ls_item) = - 2 then
			//data type is ok, but failed validation
			il_flag = 2
			Return 2  // 2 Accept the data value
		else
			//data type is ok, but failed validation
			il_flag = -1
			Return 0  // (Default) Reject the data value and show a system error screen.
		end if
	End If

	///////////////////////////////////////////////////////////////////////////////////////////////
	// data type is bad
	// Check to see if it is a formula that needs to be evaluated
	///////////////////////////////////////////////////////////////////////////////////////////////

	// evaluate possible formula
	ls_result = this.describe("evaluate('" + this.gettext() + "',0)")

	// check for result being a valid number
	If isNumber(ls_result) Then
		//its a formula that evaluates to a valid result
		//put result into the field replacing the formula the user typed in
		this.object.employee_salary[row] = long(ls_result)
		il_flag = 3
		return 3 //Replace the column value just entered with the value originally in the column.
					//The value just entered is the actual formula, in this case the original
					//  value is the result due to the previous line of code.
	End If

	il_flag = 1
	return 1  // Reject the data value but do not show a system error screen.
End If
end event

