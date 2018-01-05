$PBExportHeader$w_highlight_dw_rows.srw
forward
global type w_highlight_dw_rows from w_base_case
end type
type cb_1 from commandbutton within w_highlight_dw_rows
end type
type dw_highlight from datawindow within w_highlight_dw_rows
end type
end forward

global type w_highlight_dw_rows from w_base_case
integer width = 3045
integer height = 1592
string title = "Row Selection Techniques"
cb_1 cb_1
dw_highlight dw_highlight
end type
global w_highlight_dw_rows w_highlight_dw_rows

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();long ll_count, ll_find, i 
integer li_return, li_cou
boolean lb_flag
dw_highlight.SetTransObject(sqlca)
ll_count = dw_highlight.Retrieve( )

// 主要测试两个函数SelectRow, IsSelected

if ll_count < 10 then
	is_resultlog += wf_result_add("testcasepoint1", "The data retrieved too little to test!", False )
	return
end if

li_return = dw_highlight.SelectRow(0,FALSE)
is_resultlog +=  wf_result_add("testcasepoint1", "Datawindow.SelectRow(0,FALSE)", li_return = 1 )
for i = 1 to 10
	if mod(i, 2) = 0 then
		li_return = dw_highlight.SelectRow(i,True)
		if li_return <> 1 then 
			lb_flag = true
			exit
		end if
	end if
next
is_resultlog += wf_result_add("testcasepoint1", "Datawindow.SelectRow(row,TRUE)", Not lb_flag )
lb_flag = false

li_cou =  0 
for i = 1 to ll_count
	if dw_highlight.IsSelected(i) then li_cou +=1
next
is_resultlog += wf_result_add("testcasepoint1", "Datawindow.IsSelected(row)", li_cou = 5  )


li_return = dw_highlight.SelectRow(0,FALSE)
li_cou =  0 
for i = 1 to ll_count
	if dw_highlight.IsSelected(i) then li_cou +=1
next

is_resultlog +=  wf_result_add("testcasepoint1", "Datawindow.SelectRow(0,FALSE), there is not row selected", li_cou = 0 )
end subroutine

on w_highlight_dw_rows.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_highlight=create dw_highlight
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_highlight
end on

on w_highlight_dw_rows.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_highlight)
end on

event ue_cleantempfile;call super::ue_cleantempfile;string ls_filepath
ls_filepath = gs_cachedir+gs_dirseparator + "indicat2.bmp"

if FileExists(ls_filepath) then
	FileDelete(ls_filepath)
end if
end event

type cb_1 from commandbutton within w_highlight_dw_rows
integer x = 2363
integer y = 44
integer width = 608
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

type dw_highlight from datawindow within w_highlight_dw_rows
integer x = 64
integer y = 44
integer width = 2240
integer height = 1412
integer taborder = 10
string dataobject = "d_contact_list_protected"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

