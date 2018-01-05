$PBExportHeader$w_rte_mail_merge.srw
$PBExportComments$Mail merge form letter using RTE style DataWindow
forward
global type w_rte_mail_merge from w_base_case
end type
type cb_1 from commandbutton within w_rte_mail_merge
end type
type cb_printprev from commandbutton within w_rte_mail_merge
end type
type cb_prev from commandbutton within w_rte_mail_merge
end type
type cb_next from commandbutton within w_rte_mail_merge
end type
type cb_print from commandbutton within w_rte_mail_merge
end type
type dw_1 from datawindow within w_rte_mail_merge
end type
end forward

global type w_rte_mail_merge from w_base_case
integer y = 4
integer width = 2944
integer height = 1848
string title = "RTE DataWindow Mail Merge"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_1 cb_1
cb_printprev cb_printprev
cb_prev cb_prev
cb_next cb_next
cb_print cb_print
dw_1 dw_1
end type
global w_rte_mail_merge w_rte_mail_merge

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();long ll_count, ll_rc
string ls_text, ls_text2, ls_text3

dw_1.settransobject(sqlca)
ll_count = dw_1.retrieve(datetime('2006/09/01'))

is_resultlog += wf_result_add("testcasepoint1", "Richtext datawindow retrieved", ll_count > 0 )

// 不比较rtf语法，因为rtf语法有很多种都能正常解析
//ScrollNextPage, ScrollPriorPage, Return Values:Integer. Returns 1 if it succeeds and -1 if an error occurs.
// 帮助文档不正确，ScrollNextPage, ScrollPriorPage都是返回当前页码
ls_text =  dw_1.CopyRTF(false)
ll_rc = dw_1.ScrollNextPage()
is_resultlog += wf_result_add("testcasepoint1", "Richtext datawindow ScrollNextPage function", ll_rc = 2 )
ls_text2 =  dw_1.CopyRTF(false)
ll_rc = dw_1.ScrollNextPage()

ll_rc =dw_1.ScrollPriorPage()

ll_rc =dw_1.ScrollPriorPage()

is_resultlog += wf_result_add("testcasepoint1", "Richtext datawindow ScrollPriorPage function", ll_rc = 1 )

ls_text3 =  dw_1.CopyRTF(false)
is_resultlog += wf_result_add("testcasepoint1", "Richtext datawindow value", ls_text = ls_text3 and ls_text <> ls_text2 )

// 第一页检索到的记录包括Pete Elkins，第二面检索到的记录包括Jen-Chang Chin, 主要检查是否从数据库中检索到相关记录
is_resultlog += wf_result_add("testcasepoint1", "Richtext datawindow retrieved data", pos(ls_text, 'Pete') > 0  and pos( ls_text2, 'Chang') > 0  )


end subroutine

on w_rte_mail_merge.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_printprev=create cb_printprev
this.cb_prev=create cb_prev
this.cb_next=create cb_next
this.cb_print=create cb_print
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_printprev
this.Control[iCurrent+3]=this.cb_prev
this.Control[iCurrent+4]=this.cb_next
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.dw_1
end on

on w_rte_mail_merge.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_printprev)
destroy(this.cb_prev)
destroy(this.cb_next)
destroy(this.cb_print)
destroy(this.dw_1)
end on

type cb_1 from commandbutton within w_rte_mail_merge
integer x = 2117
integer y = 20
integer width = 626
integer height = 132
integer taborder = 50
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

type cb_printprev from commandbutton within w_rte_mail_merge
integer x = 1097
integer y = 28
integer width = 334
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print Preview"
end type

event clicked;If This.Text = "Print Preview" Then
	dw_1.Object.DataWindow.Print.Preview="yes"
	This.Text = "Display"
Else
	dw_1.Object.DataWindow.Print.Preview="no"
	This.Text = "Print Preview"
End If

end event

type cb_prev from commandbutton within w_rte_mail_merge
integer x = 1870
integer y = 28
integer width = 64
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "<"
end type

event clicked;dw_1.ScrollPriorPage()

end event

type cb_next from commandbutton within w_rte_mail_merge
integer x = 1957
integer y = 28
integer width = 64
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = ">"
end type

event clicked;dw_1.ScrollNextPage()

end event

type cb_print from commandbutton within w_rte_mail_merge
integer x = 1490
integer y = 28
integer width = 334
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print"
end type

event clicked;dw_1.Print()

end event

type dw_1 from datawindow within w_rte_mail_merge
integer x = 18
integer y = 164
integer width = 2880
integer height = 1572
integer taborder = 90
string dataobject = "d_rte_mail_merge"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

