$PBExportHeader$w_scroll_2_datawindows.srw
$PBExportComments$Simultaneous scrolling of 2 DWs
forward
global type w_scroll_2_datawindows from w_base_case
end type
type dw_data from datawindow within w_scroll_2_datawindows
end type
type dw_names from datawindow within w_scroll_2_datawindows
end type
type st_2 from statictext within w_scroll_2_datawindows
end type
type st_1 from statictext within w_scroll_2_datawindows
end type
end forward

global type w_scroll_2_datawindows from w_base_case
integer x = 9
integer y = 276
integer width = 2949
integer height = 1404
string title = "Synchronized Vertical Scrolling of Two DataWindows"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
dw_data dw_data
dw_names dw_names
st_2 st_2
st_1 st_1
end type
global w_scroll_2_datawindows w_scroll_2_datawindows

type variables
boolean ib_vertical, ib_horizontal
end variables

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();long ll_count, ll_count2, ll_positionv, ll_positionh, ll_positionv2
SetTransObject (dw_names, sqlca)
SetTransObject (dw_data, sqlca)

ll_count = Retrieve (dw_names)
ll_count2 = Retrieve (dw_data)

if ll_count < 1 or ll_count2< 1 then
	is_resultlog += wf_result_add("testcasepoint1", "Datawindow retrieved", False)
end if

dw_data.Object.datawindow.verticalscrollposition = 240
dw_data.Object.datawindow.HorizontalScrollPosition = 242

ll_positionv = long(dw_data.Object.datawindow.verticalscrollposition)
ll_positionv2 = long(dw_names.Object.datawindow.verticalscrollposition)
ll_positionh = long(dw_data.Object.datawindow.HorizontalScrollPosition)


is_resultlog += wf_result_add("testcasepoint1", "Datawindow scrollposition",  ib_vertical and  ib_horizontal and ll_positionv> 0 and ll_positionh> 0 and ll_positionv2 = ll_positionv )

end subroutine

on w_scroll_2_datawindows.create
int iCurrent
call super::create
this.dw_data=create dw_data
this.dw_names=create dw_names
this.st_2=create st_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_data
this.Control[iCurrent+2]=this.dw_names
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_1
end on

on w_scroll_2_datawindows.destroy
call super::destroy
destroy(this.dw_data)
destroy(this.dw_names)
destroy(this.st_2)
destroy(this.st_1)
end on

event resize;//不作resize, 以防止datawindow 滚动条位置不正确
end event

type dw_data from datawindow within w_scroll_2_datawindows
integer x = 626
integer y = 248
integer width = 2167
integer height = 816
integer taborder = 30
string dataobject = "d_employee_data_list"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event scrollvertical;////////////////////////////////////////////////////////////////////////////////////////////////////////
// scrollvertical script for dw_data
////////////////////////////////////////////////////////////////////////////////////////////////////////

//Syncronize the names datawindow to match the scroll position from this datawindow.
dw_names.Object.datawindow.verticalscrollposition = scrollpos






end event

event scrollhorizontal;ib_horizontal = true
end event

type dw_names from datawindow within w_scroll_2_datawindows
integer x = 73
integer y = 248
integer width = 549
integer height = 816
integer taborder = 20
string dataobject = "d_employee_name_list"
boolean hscrollbar = true
end type

event scrollvertical;ib_vertical = true
end event

type st_2 from statictext within w_scroll_2_datawindows
integer x = 37
integer y = 68
integer width = 2231
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Use Vertical Scroll Bar to view different employees."
end type

type st_1 from statictext within w_scroll_2_datawindows
integer x = 37
integer y = 8
integer width = 2231
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Use Horizontal Scroll Bar to view more data for the employees displayed."
end type

