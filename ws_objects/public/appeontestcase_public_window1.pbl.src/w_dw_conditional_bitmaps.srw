$PBExportHeader$w_dw_conditional_bitmaps.srw
forward
global type w_dw_conditional_bitmaps from w_base_case
end type
type cb_1 from commandbutton within w_dw_conditional_bitmaps
end type
type dw_employee_compensation from datawindow within w_dw_conditional_bitmaps
end type
end forward

global type w_dw_conditional_bitmaps from w_base_case
integer width = 2757
integer height = 1088
cb_1 cb_1
dw_employee_compensation dw_employee_compensation
end type
global w_dw_conditional_bitmaps w_dw_conditional_bitmaps

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();long ll_count, ll_find
string ls_bmp, ls_column
string ls_fullname, ls_file = "indicat2.bmp"
dw_employee_compensation.SetTransObject(sqlca)
ll_count = dw_employee_compensation.Retrieve( )
ls_column = dw_employee_compensation.describe("#2.name")
ll_find =  dw_employee_compensation.find( "#3 > " + string(dw_employee_compensation.object.compute_3[1]), 1 , ll_count)


ls_fullname = gs_cachedir+gs_dirseparator+ls_file
if not FileExists(ls_fullname)  then 
	if isvalid(w_controller) then 					
		w_controller.of_createfile(ls_fullname, sqlca)
		if not FileExists(ls_fullname)  then
			is_resultlog += wf_result_add("testcasepoint1", "Get resource file" + ls_file, False )
			return
		end if 
	else
		is_resultlog += wf_result_add("testcasepoint1", "Get resource file" + ls_file, False )
		return
	end if 
 end if 
 
if ll_find > 0 then
	ls_bmp = string(dw_employee_compensation.object.compute_1[ll_find])
	if isnull(ls_bmp) then ls_bmp= ''
	is_resultlog += wf_result_add("testcasepoint1", "Datawindow Bitmap(string) function", len(ls_bmp) > 0 and ls_bmp ='indicat2.bmp'  )
else
	is_resultlog += wf_result_add("testcasepoint1", "Datawindow retrieve data1", False  )
end if

ll_find =  dw_employee_compensation.find( "#3 < " + string(dw_employee_compensation.object.compute_3[1]), 1 , ll_count)

if ll_find > 0 then
	ls_bmp = string(dw_employee_compensation.object.compute_1[ll_find])
	if isnull(ls_bmp) then ls_bmp= ''
	is_resultlog += wf_result_add("testcasepoint1", "Datawindow Bitmap('') function", len(ls_bmp) = 0 )
else
	is_resultlog += wf_result_add("testcasepoint1", "Datawindow retrieve data2", False  )
end if
end subroutine

on w_dw_conditional_bitmaps.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_employee_compensation=create dw_employee_compensation
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_employee_compensation
end on

on w_dw_conditional_bitmaps.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_employee_compensation)
end on

event ue_cleantempfile;call super::ue_cleantempfile;string ls_filepath
ls_filepath = gs_cachedir+gs_dirseparator + "indicat2.bmp"

if FileExists(ls_filepath) then
	FileDelete(ls_filepath)
end if
end event

type cb_1 from commandbutton within w_dw_conditional_bitmaps
integer x = 2002
integer y = 48
integer width = 649
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

type dw_employee_compensation from datawindow within w_dw_conditional_bitmaps
integer x = 64
integer y = 44
integer width = 1801
integer height = 868
integer taborder = 10
string dataobject = "d_employee_salary"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

