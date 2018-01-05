$PBExportHeader$w_shared_dw_graph.srw
$PBExportComments$Shared DW/Diff Graph Views
forward
global type w_shared_dw_graph from w_base_case
end type
type cb_3 from commandbutton within w_shared_dw_graph
end type
type dw_pie from datawindow within w_shared_dw_graph
end type
type dw_3dcolumn from datawindow within w_shared_dw_graph
end type
type dw_bar from datawindow within w_shared_dw_graph
end type
type cb_2 from commandbutton within w_shared_dw_graph
end type
type cb_1 from commandbutton within w_shared_dw_graph
end type
type dw_raw_data from datawindow within w_shared_dw_graph
end type
end forward

global type w_shared_dw_graph from w_base_case
integer x = 41
integer width = 3634
integer height = 1960
string title = "Graphs using Shared DataWindows"
windowstate windowstate = maximized!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
cb_3 cb_3
dw_pie dw_pie
dw_3dcolumn dw_3dcolumn
dw_bar dw_bar
cb_2 cb_2
cb_1 cb_1
dw_raw_data dw_raw_data
end type
global w_shared_dw_graph w_shared_dw_graph

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();int li_rc
long ll_count



//sharedata
//Shares data between a primary DataWindow control and a secondary DataWindow control. The 
//controls do not share formatting; only the data is shared, including data in the primary buffer, the 
//delete buffer, the filter buffer, and the sort order. Therefore, when you call a function in either the 
//primary or secondary DataWindow control that changes the data in a primary or secondary 
//DataWindow control, the data in the primary and all secondary DataWindow controls are affected. 

//set up the 2Dpie graph secondary
li_rc = dw_raw_data.ShareData(dw_pie)		
is_resultlog += wf_result_add("testcasepoint1", "Share DW 2Dpie graph", li_rc = 1 )

//set up the 2Dbar graph secondary
li_rc = dw_raw_data.ShareData(dw_bar)		
is_resultlog += wf_result_add("testcasepoint1", "Share 2Dbar graph", li_rc = 1 )


//set up the 2Dbar graph secondary
li_rc = dw_raw_data.ShareData(dw_3dcolumn)	

is_resultlog += wf_result_add("testcasepoint1", "Share 3Dbar graph", li_rc = 1 )

//retrieve data into the primary datawindow
dw_raw_data.SetTransObject(sqlca)	
ll_count = dw_raw_data.Retrieve()

is_resultlog += wf_result_add("testcasepoint1", "Share DW retrieved", ll_count= dw_3dcolumn.rowcount() and   ll_count = dw_bar.rowcount() and   ll_count = dw_pie.rowcount())

// changeitem

li_rc =dw_raw_data.setitem(1, 'employee_status', 'T')

is_resultlog += wf_result_add("testcasepoint1", "Share DW changed item", li_rc = 1 )

// ScrollNextPage
li_rc = dw_raw_data.ScrollNextPage()
is_resultlog += wf_result_add("testcasepoint1", "Share DW ScrollNextPage", li_rc > 0  )

// ScrollPriorPage
li_rc = dw_raw_data.ScrollPriorPage()
is_resultlog += wf_result_add("testcasepoint1", "Share DW ScrollPriorPage", li_rc = 1 )









end subroutine

on w_shared_dw_graph.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.dw_pie=create dw_pie
this.dw_3dcolumn=create dw_3dcolumn
this.dw_bar=create dw_bar
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_raw_data=create dw_raw_data
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.dw_pie
this.Control[iCurrent+3]=this.dw_3dcolumn
this.Control[iCurrent+4]=this.dw_bar
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.dw_raw_data
end on

on w_shared_dw_graph.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.dw_pie)
destroy(this.dw_3dcolumn)
destroy(this.dw_bar)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_raw_data)
end on

type cb_3 from commandbutton within w_shared_dw_graph
integer x = 2930
integer y = 132
integer width = 626
integer height = 132
integer taborder = 60
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

type dw_pie from datawindow within w_shared_dw_graph
integer x = 9
integer y = 800
integer width = 951
integer height = 920
integer taborder = 60
boolean titlebar = true
string title = "Total Salary By Dept."
string dataobject = "d_graph_salaries_by_department"
boolean minbox = true
boolean maxbox = true
boolean resizable = true
string icon = "None!"
boolean livescroll = true
end type

on getfocus;// make sure that this datawindow comes to the top as soon as it gets focus
this.BringToTop=True
end on

type dw_3dcolumn from datawindow within w_shared_dw_graph
integer x = 1925
integer y = 800
integer width = 978
integer height = 920
integer taborder = 80
boolean titlebar = true
string title = "Total Employees By Dept. By Status"
string dataobject = "d_graph_employee_status_by_dept"
boolean minbox = true
boolean maxbox = true
boolean resizable = true
string icon = "None!"
boolean livescroll = true
end type

on getfocus;// make sure that this datawindow comes to the top as soon as it gets focus
this.BringToTop=True
end on

type dw_bar from datawindow within w_shared_dw_graph
integer x = 969
integer y = 800
integer width = 951
integer height = 920
integer taborder = 70
boolean titlebar = true
string title = "Average Age By Dept."
string dataobject = "d_graph_average_employee_age_by_dept"
boolean minbox = true
boolean maxbox = true
boolean resizable = true
string icon = "None!"
boolean livescroll = true
end type

on getfocus;// make sure that this datawindow comes to the top as soon as it gets focus
this.BringToTop=True
end on

type cb_2 from commandbutton within w_shared_dw_graph
integer x = 1074
integer y = 1732
integer width = 370
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Prior Page"
end type

on clicked;dw_raw_data.ScrollPriorPage()
end on

type cb_1 from commandbutton within w_shared_dw_graph
integer x = 681
integer y = 1732
integer width = 370
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Next Page"
end type

on clicked;dw_raw_data.ScrollNextPage()
end on

type dw_raw_data from datawindow within w_shared_dw_graph
integer x = 9
integer y = 12
integer width = 2885
integer height = 772
integer taborder = 50
string dataobject = "d_graph_primary"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

