$PBExportHeader$w_graph2.srw
forward
global type w_graph2 from w_base_case
end type
type dw_2 from datawindow within w_graph2
end type
type dw_customer from datawindow within w_graph2
end type
type gr_test from graph within w_graph2
end type
type dw_graph3 from datawindow within w_graph2
end type
type dw_graph2 from datawindow within w_graph2
end type
type dw_primary from datawindow within w_graph2
end type
type dw_graph1 from datawindow within w_graph2
end type
type dw_1 from datawindow within w_graph2
end type
type dw_salaries from datawindow within w_graph2
end type
type dw_headcount from datawindow within w_graph2
end type
type st_popup from statictext within w_graph2
end type
end forward

global type w_graph2 from w_base_case
integer width = 3808
integer height = 2244
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
dw_2 dw_2
dw_customer dw_customer
gr_test gr_test
dw_graph3 dw_graph3
dw_graph2 dw_graph2
dw_primary dw_primary
dw_graph1 dw_graph1
dw_1 dw_1
dw_salaries dw_salaries
dw_headcount dw_headcount
st_popup st_popup
end type
global w_graph2 w_graph2

type variables
boolean ib_creategraph
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine of_testcase_point_module3 ()
public subroutine of_testcase_point_module4 ()
public subroutine of_testcase_point_module5 ()
public subroutine of_testcase_point_module6 ()
end prototypes

public subroutine of_testcase_point_module ();//测试Graph控件内的函数 control.CategoryName() ， control.GetData() 
//以及Graph控件内系统事件pbm_dwngraphcreate
// control.ObjectAtPointer() 由于需要外部点击触发没有记录日志

dw_headcount.SetTransObject (sqlca)
dw_salaries.SetTransObject (sqlca)
dw_headcount.Retrieve ()

dw_headcount.triggerevent("clicked")

dw_salaries.triggerevent("ue_graphcreate")
is_resultlog += wf_result_add("testcasepoint2", "pbm_dwngraphcreate", &
                                             ib_creategraph = true )
															
dw_headcount.triggerevent("rbuttondown")

end subroutine

public subroutine of_testcase_point_module1 ();//测试Dw.Modify()设置graph内的series是否成功
boolean lb_graph

lb_graph = true 
if dw_headcount.Modify("gr_1.series = 'dept_id' ") <> '' then lb_graph = false

if dw_headcount.Modify("gr_1.series = '~"noseries ~" ' ") <> '' then lb_graph = false

is_resultlog += wf_result_add("testcasepoint4", "Dw.Modify('graph.series = ** ')", &
                                             lb_graph = true  )


end subroutine

public subroutine of_testcase_point_module2 ();//测试GrapgStyle = Pie即圆形的Graph是否检索数据成功
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()


is_resultlog += wf_result_add("testcasepoint5", "GrapgStyle:Pie Retrieve()", &
                                             dw_1.retrieve() = 10  )
end subroutine

public subroutine of_testcase_point_module3 ();//测试GraphStyle = Pie的Graph函数SetDataPieExplode()是否执行成功


dw_1.SetDataPieExplode("gr_1",1,1,50)
dw_1.SetDataPieExplode("gr_1",1,1,100)

is_resultlog += wf_result_add("testcasepoint6", "Function SetDataPieExplode()", &
                                             dw_1.SetDataPieExplode("gr_1",1,1,0) = 1 and &
										dw_1.SetDataPieExplode("gr_1",1,1,50) = 1 and &		
										dw_1.SetDataPieExplode("gr_1",1,1,100) = 1 )
end subroutine

public subroutine of_testcase_point_module4 ();//测试数据源ShareData()到三种不同GraphStyle: Pie,Col3D,Bar是否成功
boolean lb_share

//retrieve data into the primary datawindow
dw_primary.SetTransObject(sqlca)	
dw_primary.Retrieve()	
lb_share = True

		
IF dw_primary.ShareData(dw_graph1) <> 1 THEN lb_share = false

IF  dw_primary.ShareData(dw_graph2) <> 1 THEN lb_share = false

IF dw_primary.ShareData(dw_graph3) <> 1 THEN lb_share = false

is_resultlog += wf_result_add("testcasepoint7", "GraphStyle Dw.ShareData()", &
                                             lb_share = true)
end subroutine

public subroutine of_testcase_point_module5 ();//测试改变Dw.object.Graph 与Graph控件的17种不同风格的GraphStyle
grgraphtype lgr_type[]
int li_style[] , i
string ls_style[]

ls_style[1] = 'area3d!'
lgr_type[1] = area3d!
li_style[1] = 15

ls_style[2] = 'areagraph!'
lgr_type[2] = areagraph!
li_style[2] = 1

ls_style[3] = 'bar3dobjgraph!'
lgr_type[3] = bar3dobjgraph!
li_style[3] = 4

ls_style[4] = 'barstack3dobjgraph!'
lgr_type[4] = barstack3dobjgraph!
li_style[4] = 6

ls_style[5] = 'bargraph!'
lgr_type[5] = bargraph!
li_style[5] = 2

ls_style[6] = 'bar3dgraph!'
lgr_type[6] = bar3dgraph!
li_style[6] = 3

ls_style[7] = 'barstackgraph!'
lgr_type[7] = barstackgraph!
li_style[7] = 5

ls_style[8] = 'col3dgraph!'
lgr_type[8] = col3dgraph!
li_style[8] = 8

ls_style[9] = 'col3dobjgraph!'
lgr_type[9] = col3dobjgraph!
li_style[9] = 9

ls_style[10] = 'colgraph!'
lgr_type[10] = colgraph!
li_style[10] = 7

ls_style[11] = 'colstack3dobjgraph!'
lgr_type[11] = colstack3dobjgraph!
li_style[11] = 11

ls_style[12] = 'colstackgraph!'
lgr_type[12] = colstackgraph!
li_style[12] = 10

ls_style[13] = 'line3d!'
lgr_type[13] = line3d!
li_style[13] = 16

ls_style[14] = 'linegraph!'
lgr_type[14] = linegraph!
li_style[14] = 12

ls_style[15] = 'pie3d!'
lgr_type[15] = pie3d!
li_style[15] = 17

ls_style[16] = 'piegraph!'
lgr_type[16] = piegraph!
li_style[16] = 13

ls_style[17] = 'scattergraph!'
lgr_type[17] = scattergraph!
li_style[17] = 14

For i = 1 to 17
dw_headcount.object.gr_1.graphtype = li_style[i]
gr_test.graphtype = lgr_type[i]


is_resultlog += wf_result_add("testcasepoint8", "Dw.object.graph.GraphStyle-> " + ls_style[i] + " ,Graph.GraphStyle-> " + string(li_style[i]) ,&
	                                        string(li_style[i]) = dw_headcount.describe("gr_1.graphtype") and lgr_type[i] = gr_test.graphtype )

Next 



//测试改变Dw.object.Graph 与Graph控件的title
dw_headcount.object.gr_1.title = 'Test'
gr_test.title = 'Test'

is_resultlog += wf_result_add("testcasepoint9", "Dw.object.graph.Title and Graph.Title", &
	                                        'Test' = dw_headcount.describe("gr_1.title") and 'Test' = gr_test.title )


//测试改变Dw.object.Graph 与Graph控件的spacing
dw_headcount.object.gr_1.spacing = 300
gr_test.spacing = 300


is_resultlog += wf_result_add("testcasepoint10", "Dw.object.graph.spacing and Graph.spacing", &
	                                        string(300) = dw_headcount.describe("gr_1.spacing") and 300 = gr_test.spacing )






end subroutine

public subroutine of_testcase_point_module6 ();//测试DW.object.Graph与Graph控件内的颜色调整，包含函数GetSeriesStyle(), SetSeriesStyle()
//注：SetSeriesStyle()返回值等于-1 ,但是实际产生设置效果
long ll_grcolor , ll_grcolor2
long ll_color 
string ls_series , ls_series2 ,ls_new_color
boolean lb_get ,lb_get2
boolean lb_background , lb_background2
boolean lb_SetSeriesStyle , lb_SetSeriesStyle2
int li_row, li_index, li_cnt, li_cnt2
long ll_background_gr, ll_foreground_gr,ll_background_dw,ll_foreground_dw

//***************************Win.Graph
gr_test.addseries ( "Total Orders" )
dw_customer.SetTransObject (sqlca)
dw_customer.Retrieve ()
li_row = RowCount (dw_customer)
for li_index = 1 to li_row
	gr_test.adddata ( 1, dw_customer.getitemnumber (li_index, 2), &
					GetItemString (dw_customer, li_index, 1 ))
next

gr_test.setredraw(false)
gr_test.backcolor = RGB (200, 0, 0)
gr_test.textcolor = RGB (210, 0, 0)

is_resultlog += wf_result_add("testcasepoint11", "GraphControl.backcolor", &
											  RGB (200, 0, 0) = gr_test.backcolor )
											  
is_resultlog += wf_result_add("testcasepoint12", "GraphControl.textcolor", &
											  RGB (210, 0, 0) = gr_test.textcolor )


gr_test.SetSeriesStyle ( "Total Orders", background!, RGB (220, 0, 0))  
li_cnt = gr_test.GetSeriesStyle ( "Total Orders", background!, ll_background_gr)

gr_test.SetSeriesStyle ( "Total Orders", foreground!, RGB (230, 0, 0))   
li_cnt2 = gr_test.GetSeriesStyle ( "Total Orders", foreground!, ll_foreground_gr) 

is_resultlog += wf_result_add("testcasepoint13", "GraphControl.SetSeriesStyle('',background!,'')", &
	                                         ll_background_gr = RGB (220, 0, 0) )

is_resultlog += wf_result_add("testcasepoint14", "GraphControl.SetSeriesStyle('',foreground!,'')", &
										ll_foreground_gr = RGB (230, 0, 0) )
										
is_resultlog += wf_result_add("testcasepoint15", "GraphControl.GetSeriesStyle('',background!,'')", &
	                                         li_cnt = 1 )

is_resultlog += wf_result_add("testcasepoint16", "GraphControl.GetSeriesStyle('',foreground!,'')", &
										li_cnt2 = 1 )

gr_test.setredraw(true)
//******************************Win.Graph




//*******************************Dw.Graph
dw_2.SetTransObject (sqlca)
dw_2.Retrieve ()

ls_new_color = string (RGB (100, 0, 0))
dw_2.Object.gr_1.backcolor = ls_new_color

is_resultlog += wf_result_add("testcasepoint17", "DwControl.Object.graph.backcolor", &
	                                         string(RGB (100, 0, 0)) = dw_2.describe("gr_1.backcolor") )
	

dw_2.SetSeriesStyle ( "gr_1", ls_series, background!, RGB (110, 0, 0)) 
li_cnt = dw_2.GetSeriesStyle ( "gr_1", ls_series, background!, ll_background_dw)
 

is_resultlog += wf_result_add("testcasepoint18", "DWControl.SetSeriesStyle('gr','',background!,'')", &
	                                         ll_background_dw = RGB (110, 0, 0) )
										
is_resultlog += wf_result_add("testcasepoint19", "DWControl.GetSeriesStyle('gr','',background!,'')", &
	                                         li_cnt = 1 )
//****************************** Dw.Graph







end subroutine

on w_graph2.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.dw_customer=create dw_customer
this.gr_test=create gr_test
this.dw_graph3=create dw_graph3
this.dw_graph2=create dw_graph2
this.dw_primary=create dw_primary
this.dw_graph1=create dw_graph1
this.dw_1=create dw_1
this.dw_salaries=create dw_salaries
this.dw_headcount=create dw_headcount
this.st_popup=create st_popup
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.dw_customer
this.Control[iCurrent+3]=this.gr_test
this.Control[iCurrent+4]=this.dw_graph3
this.Control[iCurrent+5]=this.dw_graph2
this.Control[iCurrent+6]=this.dw_primary
this.Control[iCurrent+7]=this.dw_graph1
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.dw_salaries
this.Control[iCurrent+10]=this.dw_headcount
this.Control[iCurrent+11]=this.st_popup
end on

on w_graph2.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.dw_customer)
destroy(this.gr_test)
destroy(this.dw_graph3)
destroy(this.dw_graph2)
destroy(this.dw_primary)
destroy(this.dw_graph1)
destroy(this.dw_1)
destroy(this.dw_salaries)
destroy(this.dw_headcount)
destroy(this.st_popup)
end on

type dw_2 from datawindow within w_graph2
integer x = 2738
integer y = 60
integer width = 850
integer height = 496
integer taborder = 20
string title = "none"
string dataobject = "d_total_employee_salary_with_graph"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_customer from datawindow within w_graph2
integer x = 2651
integer y = 640
integer width = 983
integer height = 200
integer taborder = 30
string title = "none"
string dataobject = "d_total_customer_orders"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gr_test from graph within w_graph2
integer x = 2642
integer y = 884
integer width = 1033
integer height = 720
grgraphtype graphtype = col3dobjgraph!
long textcolor = 33554432
long backcolor = 12632256
long shadecolor = 12632256
integer spacing = 100
string title = "Total Salary by Department"
integer elevation = 20
integer rotation = -20
integer perspective = 2
integer depth = 100
grlegendtype legend = atbottom!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

on gr_test.create
TitleDispAttr = create grDispAttr
LegendDispAttr = create grDispAttr
PieDispAttr = create grDispAttr
Series = create grAxis
Series.DispAttr = create grDispAttr
Series.LabelDispAttr = create grDispAttr
Category = create grAxis
Category.DispAttr = create grDispAttr
Category.LabelDispAttr = create grDispAttr
Values = create grAxis
Values.DispAttr = create grDispAttr
Values.LabelDispAttr = create grDispAttr
TitleDispAttr.TextSize=12
TitleDispAttr.Weight=700
TitleDispAttr.FaceName="Tahoma"
TitleDispAttr.FontCharSet=DefaultCharSet!
TitleDispAttr.FontFamily=Swiss!
TitleDispAttr.FontPitch=Variable!
TitleDispAttr.Alignment=Center!
TitleDispAttr.BackColor=536870912
TitleDispAttr.Format="[General]"
TitleDispAttr.DisplayExpression="title"
Category.Label="(None)"
Category.AutoScale=true
Category.ShadeBackEdge=true
Category.SecondaryLine=transparent!
Category.MajorGridLine=transparent!
Category.MinorGridLine=transparent!
Category.DropLines=transparent!
Category.OriginLine=transparent!
Category.MajorTic=Straddle!
Category.DataType=adtText!
Category.DispAttr.Weight=400
Category.DispAttr.FaceName="Tahoma"
Category.DispAttr.FontCharSet=DefaultCharSet!
Category.DispAttr.FontFamily=Swiss!
Category.DispAttr.FontPitch=Variable!
Category.DispAttr.Alignment=Center!
Category.DispAttr.BackColor=536870912
Category.DispAttr.Format="[General]"
Category.DispAttr.DisplayExpression="category"
Category.DispAttr.AutoSize=true
Category.LabelDispAttr.Weight=400
Category.LabelDispAttr.FaceName="Tahoma"
Category.LabelDispAttr.FontCharSet=DefaultCharSet!
Category.LabelDispAttr.FontFamily=Swiss!
Category.LabelDispAttr.FontPitch=Variable!
Category.LabelDispAttr.Alignment=Center!
Category.LabelDispAttr.BackColor=536870912
Category.LabelDispAttr.Format="[General]"
Category.LabelDispAttr.DisplayExpression="categoryaxislabel"
Category.LabelDispAttr.AutoSize=true
Values.Label="(None)"
Values.AutoScale=true
Values.SecondaryLine=transparent!
Values.MajorGridLine=transparent!
Values.MinorGridLine=transparent!
Values.DropLines=transparent!
Values.MajorTic=Outside!
Values.DataType=adtDouble!
Values.DispAttr.Weight=400
Values.DispAttr.FaceName="Tahoma"
Values.DispAttr.FontCharSet=DefaultCharSet!
Values.DispAttr.FontFamily=Swiss!
Values.DispAttr.FontPitch=Variable!
Values.DispAttr.Alignment=Right!
Values.DispAttr.BackColor=536870912
Values.DispAttr.Format="[General]"
Values.DispAttr.DisplayExpression="value"
Values.DispAttr.AutoSize=true
Values.LabelDispAttr.Weight=400
Values.LabelDispAttr.FaceName="Tahoma"
Values.LabelDispAttr.FontCharSet=DefaultCharSet!
Values.LabelDispAttr.FontFamily=Swiss!
Values.LabelDispAttr.FontPitch=Variable!
Values.LabelDispAttr.Alignment=Center!
Values.LabelDispAttr.BackColor=536870912
Values.LabelDispAttr.Format="[General]"
Values.LabelDispAttr.DisplayExpression="valuesaxislabel"
Values.LabelDispAttr.AutoSize=true
Values.LabelDispAttr.Escapement=900
Series.Label="(None)"
Series.AutoScale=true
Series.SecondaryLine=transparent!
Series.MajorGridLine=transparent!
Series.MinorGridLine=transparent!
Series.DropLines=transparent!
Series.OriginLine=transparent!
Series.MajorTic=Outside!
Series.DataType=adtText!
Series.DispAttr.Weight=400
Series.DispAttr.FaceName="Tahoma"
Series.DispAttr.FontCharSet=DefaultCharSet!
Series.DispAttr.FontFamily=Swiss!
Series.DispAttr.FontPitch=Variable!
Series.DispAttr.BackColor=536870912
Series.DispAttr.Format="[General]"
Series.DispAttr.DisplayExpression="series"
Series.DispAttr.AutoSize=true
Series.LabelDispAttr.Weight=400
Series.LabelDispAttr.FaceName="Tahoma"
Series.LabelDispAttr.FontCharSet=DefaultCharSet!
Series.LabelDispAttr.FontFamily=Swiss!
Series.LabelDispAttr.FontPitch=Variable!
Series.LabelDispAttr.Alignment=Center!
Series.LabelDispAttr.BackColor=536870912
Series.LabelDispAttr.Format="[General]"
Series.LabelDispAttr.DisplayExpression="seriesaxislabel"
Series.LabelDispAttr.AutoSize=true
LegendDispAttr.Weight=400
LegendDispAttr.FaceName="Tahoma"
LegendDispAttr.FontCharSet=DefaultCharSet!
LegendDispAttr.FontFamily=Swiss!
LegendDispAttr.FontPitch=Variable!
LegendDispAttr.BackColor=536870912
LegendDispAttr.Format="[General]"
LegendDispAttr.DisplayExpression="series"
LegendDispAttr.AutoSize=true
PieDispAttr.Weight=400
PieDispAttr.FaceName="Tahoma"
PieDispAttr.FontCharSet=DefaultCharSet!
PieDispAttr.FontFamily=Swiss!
PieDispAttr.FontPitch=Variable!
PieDispAttr.BackColor=536870912
PieDispAttr.Format="[General]"
PieDispAttr.DisplayExpression="if(seriescount > 1, series,string(percentofseries,~"0.00%~"))"
PieDispAttr.AutoSize=true
end on

on gr_test.destroy
destroy TitleDispAttr
destroy LegendDispAttr
destroy PieDispAttr
destroy Series.DispAttr
destroy Series.LabelDispAttr
destroy Series
destroy Category.DispAttr
destroy Category.LabelDispAttr
destroy Category
destroy Values.DispAttr
destroy Values.LabelDispAttr
destroy Values
end on

type dw_graph3 from datawindow within w_graph2
integer x = 2313
integer y = 1732
integer width = 686
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "d_graph_average_employee_age_by_dept"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_graph2 from datawindow within w_graph2
integer x = 1554
integer y = 1736
integer width = 686
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "d_graph_employee_status_by_dept"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_primary from datawindow within w_graph2
integer x = 41
integer y = 1728
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "d_graph_primary"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_graph1 from datawindow within w_graph2
integer x = 814
integer y = 1732
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "d_graph_salaries_by_department"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_graph2
integer x = 3022
integer y = 1736
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "d_other_category"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_salaries from datawindow within w_graph2
event ue_graphcreate pbm_dwngraphcreate
event ue_rbuttonup pbm_rbuttonup
integer x = 82
integer y = 836
integer width = 2510
integer height = 828
integer taborder = 10
string title = "none"
string dataobject = "d_empl_salaries_in_dept"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_graphcreate;// GraphCreate script for dw_salaries

/****************************************************************
	GraphCreate is a user-defined event assigned to the
	Event ID pbm_dwngraphcreate.
 ****************************************************************/


string 	ls_seriesname
string 	ls_grgraphname = "gr_1"
int    	li_result, li_count, li_index

/****************************************************************
	Now that the graph has been populated by the DataWindow, we
	can get the name of its series and set the color of that
	series to blue. Also set the average line to red
 ****************************************************************/

ib_creategraph = true

//average line
ls_seriesname = dw_salaries.SeriesName (ls_grgraphname,1)
li_result       =    dw_salaries.SetSeriesStyle ( ls_grgraphname, ls_seriesname, &
    				Foreground!, Rgb (255, 0,0) )
dw_salaries.SetSeriesStyle (ls_grgraphname, ls_seriesname,NoSymbol!)

//bars
ls_seriesname = dw_salaries.SeriesName (ls_grgraphname,2)

li_result       = dw_salaries.SetSeriesStyle ( ls_grgraphname, ls_seriesname, &
    				Shade!, Rgb (0, 0, 128) )
li_result       = dw_salaries.SetSeriesStyle ( ls_grgraphname, ls_seriesname, &
    				Foreground!, Rgb (0, 0, 255) )



end event

event ue_rbuttonup;//hide the popup again
st_popup.visible = false

end event

event doubleclicked;// Clicked script for dw_headcount
//This will open up a responce window containing the detail of the employee that
//was double clicked on


grObjectType	ClickedObject
string			ls_empl , ls_grgraphname="gr_1"
int				li_series, li_category,li_pos
s_employee      lst_employee
/************************************************************
	Find out where the user clicked in the graph
 ***********************************************************/

SetPointer (Hourglass!)

ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, &
						li_category)

/************************************************************
	If user clicked on data or category, find out which one
 ***********************************************************/
If ClickedObject = TypeData!  or &
	ClickedObject = TypeCategory!  then
		ls_empl = this.CategoryName (ls_grgraphname, li_category)
//get the employee #
		lst_employee.employee_id = integer( ls_empl )
		lst_employee.no_edit = true
		//openwithparm(w_empl_detail, lst_employee)
Else
		//MessageBox (Parent.Title, "Click on an employee to see employee detail")
End If

end event

event rbuttondown;// Clicked script for dw_headcount
// This will cause the acutal salary to appear in a text box next to the pointer
// when the user right mouse button clicks on a bar column.

grObjectType	ClickedObject
string			ls_grgraphname="gr_1"
int				li_series, li_category

/************************************************************
	Find out where the user clicked in the graph
 ***********************************************************/
ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, &
						li_category)

/************************************************************
	If user clicked on data or category, find out which one
 ***********************************************************/

If ClickedObject = TypeData! Then
//fill the text box with data  
	st_popup.text = string(this.GetData(ls_grgraphname, li_series, li_category)*1000,"$###,##0")
//move the box to the pointer location
	st_popup.x = parent.PointerX()
	st_popup.y = parent.PointerY() - 65
//make the box visible
	st_popup.visible = true
End If

end event

type dw_headcount from datawindow within w_graph2
event ue_rbuttonup pbm_rbuttonup
integer x = 69
integer y = 32
integer width = 2528
integer height = 772
integer taborder = 10
string title = "none"
string dataobject = "d_dept_headcount"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_rbuttonup;//hide the popup box again
st_popup.visible = false
end event

event clicked;// Clicked script for dw_headcount
// This will cause the employee datawindow to populate based
// on which bar column you clicked on.

grObjectType	ClickedObject
string			ls_dept, ls_grgraphname="gr_1" 
int				li_series, li_category
li_series =1
li_category = 1

/************************************************************
	Find out where the user clicked in the graph
 ***********************************************************/
//ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, &
//						li_category)

//is_resultlog += wf_result_add("Function control.ObjectAtPointer()", "testcasepoint1", &
//                                             ClickedObject = TypeGraph! )

/************************************************************
	If user clicked on data or category, find out which one
 ***********************************************************/
 
 // ObjectAtPointer() 需要外部点击触发，直接把参数设置为 li_series =1 & li_category = 1
If ClickedObject = TypeGraph!  or &
	ClickedObject = TypeCategory!  then
		ls_dept = this.CategoryName (ls_grgraphname, li_category)

		is_resultlog += wf_result_add("testcasepoint1", "Control.CategoryName()", &
                                             		ls_dept = 'Finance' )
		
		dw_salaries.Modify (ls_grgraphname + ".title=" + &
				"'Employees in " + ls_dept + " Department ' ")

		dw_salaries.Retrieve (ls_dept)
		

Else

	//MessageBox (Parent.Title, "Click on a department to see employees")

End If

end event

event rbuttondown;// Clicked script for dw_headcount
// This will cause a static text box to appear next to the pointer where the user
// is using right mouse button down. The acutal value for the data item will
// be displayed in the text box.

grObjectType	ClickedObject
string			ls_grgraphname="gr_1"
int				li_series, li_category
li_series = 1
li_category =1 

/************************************************************
	Find out where the user clicked in the graph
 ***********************************************************/
//ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, &
//						li_category)

/************************************************************
	If user clicked on data or category, find out which one
 ***********************************************************/
If ClickedObject = TypeGraph! Then
	st_popup.text = string(this.GetData(ls_grgraphname, 1, 1)) &
		+ " Employee(s)"
		
	is_resultlog += wf_result_add("testcasepoint3", "Control.GetData()", &
                                             	this.GetData(ls_grgraphname, 1, 1) = 9 )	
	
	st_popup.x = parent.PointerX()
	st_popup.y = parent.PointerY() - 65
	st_popup.visible = true
End If

end event

type st_popup from statictext within w_graph2
integer x = 2830
integer y = 148
integer width = 457
integer height = 112
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

