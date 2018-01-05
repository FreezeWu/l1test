$PBExportHeader$w_datawindow_methods.srw
forward
global type w_datawindow_methods from w_base_case
end type
type cb_3 from commandbutton within w_datawindow_methods
end type
type dw_2 from datawindow within w_datawindow_methods
end type
type cb_2 from commandbutton within w_datawindow_methods
end type
type dw_1 from datawindow within w_datawindow_methods
end type
type cb_1 from commandbutton within w_datawindow_methods
end type
type st_1 from statictext within w_datawindow_methods
end type
end forward

global type w_datawindow_methods from w_base_case
integer width = 2843
integer height = 1688
string title = "DataWindow Methods Test"
boolean minbox = false
cb_3 cb_3
dw_2 dw_2
cb_2 cb_2
dw_1 dw_1
cb_1 cb_1
st_1 st_1
end type
global w_datawindow_methods w_datawindow_methods

type variables
string is_result
Boolean 		ib_Retrieve, ib_Other, ib_Printpage
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
public subroutine wf_init_data ()
end prototypes

public subroutine of_testcase_point_module ();Long 			ll_Row
dw_1.SetTransObject ( SQLCA )
dw_1.Retrieve()

//Find
ll_Row = dw_1.Find( "emp_fname = 'Matthew' ", 1, dw_1.RowCount ()  )
is_result += " dw_1.Find( emp_fname = 'Matthew' )  = "+ String ( ll_Row ) +"~r~n"
ll_Row = dw_1.FindNext()
is_result += " dw_1.dw_1.FindNext()  = "+ String ( ll_Row ) +"~r~n"
//AcceptText()
ll_Row = dw_1.AcceptText () 
is_result += " dw_1.AcceptTextt ()  = "+ String ( ll_Row ) +"~r~n"
is_result += " dw_1.CanUndo ()  = "+ String ( dw_1.CanUndo () ) +"~r~n"
is_result += " dw_1.ClassName ()  = "+ String ( dw_1.ClassName () ) +"~r~n"
is_result += " dw_1.DeleteRow (1)  = "+ String ( dw_1.DeleteRow (1) ) +"~r~n"
is_result += " dw_1.DeletedCount ()  = "+ String ( dw_1.DeletedCount () ) +"~r~n"
is_result += " dw_1.Describe('emp_fname.ColType')  = "+ String ( dw_1.Describe("emp_fname.ColType") ) +"~r~n"
is_result += " dw_1.Drag (Begin!)  = "+ String ( dw_1.Drag (Begin!) ) +"~r~n"
//is_result += " dw_1.Drag (Cancel!)  = "+ String ( dw_1.Drag (Cancel!) ) +"~r~n"
is_result += " dw_1.Drag (End!)  = "+ String ( dw_1.Drag (End!) ) +"~r~n"
ll_Row  = dw_1.SetFilter( "emp_id > 200" )
is_result += " dw_1.SetFilter( 'emp_id > 200' )  = "+ String ( ll_Row ) +"~r~n"
dw_1.Filter()
is_result += " dw_1.FilteredCount()  = "+ String ( dw_1.FilteredCount() ) +"~r~n"
ll_Row = dw_1.GetColumn()
is_result += " dw_1.GetColumn( )  = "+ String ( ll_Row ) +"~r~n"
is_result += " dw_1.GetColumnName ()  = "+ String ( dw_1.GetColumnName () ) +"~r~n"
is_result += " dw_1.GetFormat('salary') = "+ String ( dw_1.GetFormat('salary') ) +"~r~n"
is_result += " dw_1.GetItemNumber(1,'salary') = "+ String ( dw_1.GetItemNumber(1,'salary') ) +"~r~n"
is_result += " dw_1.GetItemDateTime(1,'birth_date') = "+ String ( dw_1.GetItemDateTime(1,'birth_date'), 'yyyy-mm-dd' ) +"~r~n"
is_result += " dw_1.GetItemString(1,'city') = "+ String ( dw_1.GetItemString(1,'city') ) +"~r~n"
is_result += " dw_1.SetItem(1,'start_date', today()) = "+ String ( dw_1.SetItem(1,'start_date',  today()) ) +"~r~n"
is_result += " dw_1.ModifiedCount() = "+ String ( dw_1.ModifiedCount() ) +"~r~n"
is_result += " dw_1.GetNextModified(1, Primary!) = "+ String ( dw_1.GetNextModified(1,Primary!) ) +"~r~n"
is_result += " dw_1.GetParent().ClassName() = "+ String ( dw_1.GetParent().ClassName() ) +"~r~n"
is_result += " dw_1.GetRow() = "+ String ( dw_1.GetRow() ) +"~r~n"
is_result += " dw_1.GetRowFromRowId(1) = "+ String ( dw_1.GetRowFromRowId(1) ) +"~r~n"
is_result += " dw_1.GetRowIDFromRow(1) = "+ String ( dw_1.GetRowIDFromRow(1) ) +"~r~n"
is_result += " dw_1.SelectRow(2,True) = "+ String ( dw_1.SelectRow(2,True) ) +"~r~n"
is_result += " dw_1.GetSelectedRow(2) = "+ String ( dw_1.GetSelectedRow(2) ) +"~r~n"
is_result += " dw_1.IsSelected(2) = "+ String ( dw_1.IsSelected(2) ) +"~r~n"
//is_result += " dw_1.GetSQLSelect() = "+ String ( dw_1.GetSQLSelect() ) +"~r~n"
is_result += " dw_1.GetText() = "+ String ( dw_1.GetText() ) +"~r~n"
string Rule2 = "datetime(gettext()) > datetime ( '1900-1-1' )"
is_result += " dw_1.SetValidate('start_date', datetime(gettext()) > datetime ( '1900-1-1' ) ) = "+ String ( dw_1.SetValidate('start_date',Rule2) ) +"~r~n"
is_result += " dw_1.GetValidate('start_date') = "+ String ( dw_1.GetValidate('start_date') ) +"~r~n"
is_result += " dw_1.InsertRow(0) = "+ String ( dw_1.InsertRow(0) ) +"~r~n"
is_result += " dw_1.Modify('city.Alignment=2') = "+ String ( dw_1.Modify('city.Alignment=2') ) +"~r~n"
is_result += " dw_1.Describe('city.Alignment') = "+ String ( dw_1.Describe('city.Alignment') ) +"~r~n"
is_result += " dw_1.Move(1300,260) = "+ String ( dw_1.Move(1300,260) ) +"~r~n"
is_result += " dw_1.RowCount() = "+ String ( dw_1.RowCount() ) +"~r~n"
is_result += " dw_1.RowsCopy(2,2,Primary!,dw_1,1,Deleted!) = "+ String ( dw_1.RowsCopy(2,2,Primary!,dw_1,1,Delete!) ) +"~r~n"
is_result += " dw_1.RowsMove(2,2,Primary!,dw_1,1,Deleted!) = "+ String ( dw_1.RowsMove(2,2,Primary!,dw_1,1,Delete!) ) +"~r~n"
is_result += " dw_1.RowCount() = "+ String ( dw_1.RowCount() ) +"~r~n"
is_result += " dw_1.DeletedCount() = "+ String ( dw_1.DeletedCount() ) +"~r~n"
is_result += " dw_1.RowsDiscard(1,1,Delete!) = "+ String ( dw_1.RowsDiscard(1,1,Delete!) ) +"~r~n"
is_result += " dw_1.DeletedCount() = "+ String ( dw_1.DeletedCount() ) +"~r~n"
is_result += " dw_1.SaveAs('test.pdf', PDF!, false) = "+ String ( dw_1.SaveAs("test.pdf", PDF!, false) ) +"~r~n"
is_result += " dw_1.Clear ()  = "+ String ( dw_1.Clear () ) +"~r~n"
is_result += " dw_1.Copy ()  = "+ String ( dw_1.Copy () ) +"~r~n"
is_result += " dw_1.Cut ()  = "+ String ( dw_1.Cut () ) +"~r~n"

//gf_returnresult(is_result)
is_resultlog += is_result
end subroutine

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null,ls_rtn
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname,ls_gra
integer 		li_rtn, li_col,li_null
boolean		lbn_flag 
Date			ld_date
DateTime	ldt_datetime
time			lt_time
Decimal		ldc_data
Double		ld_Double,ld_rtn

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "Clipboard"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "CategoryCount"
ls_array[Upperbound(ls_array) + 1 ] = "CategoryName"
ls_array[Upperbound(ls_array) + 1 ] = "DataCount"
ls_array[Upperbound(ls_array) + 1 ] = "FindCategory"
ls_array[Upperbound(ls_array) + 1 ] = "FindSeries"
ls_array[Upperbound(ls_array) + 1 ] = "GetData"
ls_array[Upperbound(ls_array) + 1 ] = "GetDataPieExplode"
ls_array[Upperbound(ls_array) + 1 ] = "GetDataStyle"
ls_array[Upperbound(ls_array) + 1 ] = "GetDataValue"
ls_array[Upperbound(ls_array) + 1 ] = "GetSeriesStyle"
ls_array[Upperbound(ls_array) + 1 ] = ""

ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	Yield ( )
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")	
	is_log = ''
	ls_temp = ''
	li_rtn = 0 
	ls_temp2 = ''
	ll_tmp = 0
	choose case lower(ls_item)
		case lower("Clipboard")	
			
			//参数为Null
			setnull(ls_gra)
			li_rtn = dw_2.Clipboard (ls_gra)
			ls_result += wf_result_add(ls_item, "1.NULL ", isnull(li_rtn))	
			
			//copies the graph(圆图)
			ls_gra = 'gr_1'
			dw_2.dataobject = 'dwgrfnu1_clipboard'
			dw_2.settransobject(sqlca)
			dw_2.retrieve( )
			li_rtn =  dw_2.Clipboard (ls_gra)
			ls_result += wf_result_add(ls_item, "2.copies the graph(Circle Graph) ", not isnull(li_rtn) and li_rtn >0 )
		
			//copies the graph(线图)
			ls_gra = 'gr_1'
			dw_2.dataobject = 'dwgrfnu1_line_clipboard'
			dw_2.settransobject(sqlca)
			dw_2.retrieve( )
			li_rtn = dw_2.Clipboard (ls_gra)
			ls_result += wf_result_add(ls_item, "3.copies the graph(Line Graph) ", not isnull(li_rtn) and li_rtn >0 )
			
			//两Graph重叠
			ls_gra = 'gr_1'
			dw_2.dataobject = 'dwgrfnu1_two_clipboard'
			dw_2.settransobject(sqlca)
			dw_2.retrieve( )
			li_rtn = dw_2.clipboard(ls_gra)		
			ls_result += wf_result_add(ls_item, "4.copies the graph(Two Graph) ", not isnull(li_rtn) and li_rtn >0 )
		
					
		case lower("CategoryCount")
			dw_2.dataobject = 'dwgrfun1_d01_grid'
			dw_2.settransobject(sqlca)
			dw_2.retrieve( )
			
			//NULL
			SetNull(ls_null)
			li_rtn = dw_2.CategoryCount(ls_null)
			ls_result += wf_result_add(ls_item, "1 .NULL", isnull(li_rtn) )
			
			
			//normal
			li_rtn = dw_2.CategoryCount("gr_1")
			ls_result += wf_result_add(ls_item, "2.normal ", not isnull(li_rtn) and li_rtn >0 )
		
		case lower("CategoryName")
			dw_2.dataobject = 'dwgrfun1_d01_freeform'
			dw_2.settransobject(sqlca)
			dw_2.Retrieve()
			
			//null
			
			SetNull(ls_null)
			ls_rtn = dw_2.CategoryName(ls_null,1)
			ls_result += wf_result_add(ls_item, "(ls_null,1) ", isnull(ls_rtn))
			
			SetNull(li_null)
			ls_rtn = dw_2.CategoryName('gr_1',li_null)
			ls_result += wf_result_add(ls_item, "('gr_1',li_null) ", isnull(ls_rtn))
			
			SetNull(ls_null)
			SetNull(li_null)
			ls_rtn = dw_2.CategoryName(ls_null,li_null)
			ls_result += wf_result_add(ls_item, "(ls_null,li_null) ", isnull(ls_rtn))
			
			//number 0
		
			ls_rtn = dw_2.CategoryName('gr_1',0)
			ls_result += wf_result_add(ls_item, "('gr_1',0) ", not isnull(ls_rtn) and ls_rtn = "" )
			
			//normal
			
			ls_rtn = dw_2.CategoryName('gr_1',2)
			ls_result += wf_result_add(ls_item, "('gr_1',2) ", not isnull(ls_rtn) and not ls_rtn = "" )
			
			//参数大于CategoryCount
			
			ls_rtn = dw_2.CategoryName('gr_1',8)
			ls_result += wf_result_add(ls_item, "('gr_1',max + ) ", not isnull(ls_rtn) and ls_rtn = "" )
			
		case lower("DataCount")
			dw_2.dataobject = 'dwgrfun1_d02_grid'
			dw_2.settransobject(sqlca)
			dw_2.Retrieve()
			
			//null
			
			SetNull(ls_null)
			li_rtn = dw_2.DataCount(ls_null,'77')         //'77' is a data already in the table
			ls_result += wf_result_add(ls_item, "(ls_null,'77') ", isnull(li_rtn))
			
			
			li_rtn = dw_2.DataCount('gr_1',ls_null)
			ls_result += wf_result_add(ls_item, "('gr_1',ls_null) ", isnull(li_rtn))
			
			
			li_rtn = dw_2.DataCount(ls_null,ls_null)
			ls_result += wf_result_add(ls_item, "(ls_null,ls_null) ", isnull(li_rtn))
			
			//normal
			li_rtn = dw_2.DataCount ('gr_1','77')       
			ls_result += wf_result_add(ls_item, "('gr_1','77' ) ", not isnull(li_rtn) and li_rtn > 0 )
			
			//无效值
			li_rtn = dw_2.DataCount ('gr_2','77')       
			ls_result += wf_result_add(ls_item, "(NoValid,'77' ) ", not isnull(li_rtn) and li_rtn = -1 )
			
			li_rtn = dw_2.DataCount ('gr_1','Q1')       
			ls_result += wf_result_add(ls_item, "('gr_1',NoValid )  ", not isnull(li_rtn) and li_rtn = -1  )
			
			li_rtn = dw_2.DataCount ('gr_2','Q1')       
			ls_result += wf_result_add(ls_item, "(NoValid,NoValid ) ", not isnull(li_rtn) and li_rtn = -1  )
			
		case lower("FindCategory")
			dw_2.dataobject = 'dwgrfun1_d03_grid'
			dw_2.settransobject(sqlca)
			dw_2.Retrieve()
			
			//null
			
			SetNull(ls_null)
			li_rtn = dw_2.FindCategory(ls_null,'1986')         //'1986' is a data already in the table
			ls_result += wf_result_add(ls_item, "(ls_null,'1986') ", isnull(li_rtn))
			
			
			li_rtn = dw_2.FindCategory('gr_1',ls_null)
			ls_result += wf_result_add(ls_item, "('gr_1',ls_null) ", isnull(li_rtn))
			
			
			li_rtn = dw_2.FindCategory(ls_null,ls_null)
			ls_result += wf_result_add(ls_item, "(ls_null,ls_null) ", isnull(li_rtn))
			
			//normal
			li_rtn = dw_2.FindCategory ('gr_1','1986')       
			ls_result += wf_result_add(ls_item, "('gr_1','1986' ) ", not isnull(li_rtn) and li_rtn > 0 )
			
			//无效值
			li_rtn = dw_2.FindCategory ('gr_2','1986')       
			ls_result += wf_result_add(ls_item, "(NoValid,'1986' ) ", not isnull(li_rtn) and li_rtn = -1 )
			
			li_rtn = dw_2.FindCategory ('gr_1','Q1')       
			ls_result += wf_result_add(ls_item, "('gr_1',NoValid )  ", not isnull(li_rtn) and li_rtn = -1  )
			
			li_rtn = dw_2.FindCategory ('gr_2','Q1')       
			ls_result += wf_result_add(ls_item, "(NoValid,NoValid ) ", not isnull(li_rtn) and li_rtn = -1  )
			
			//categoryvalue 参数不同类型
			//data
			ld_date = 1996-01-01
			li_rtn = dw_2.FindCategory ('gr_1',ld_date)       
			ls_result += wf_result_add(ls_item, "('gr_1',ld_date ) ", not isnull(li_rtn) and li_rtn = -1  )
			
			//DateTime
			ldt_datetime = DateTime(1996-01-01,00:00:00)
			li_rtn = dw_2.FindCategory ('gr_1',ldt_datetime)       
			ls_result += wf_result_add(ls_item, "('gr_1',ldt_datetime ) ", not isnull(li_rtn) and li_rtn = -1  )
			
			//Double
			ld_Double = 123.456
			li_rtn = dw_2.FindCategory ('gr_1',ld_Double)       
			ls_result += wf_result_add(ls_item, "('gr_1',ld_Double ) ", not isnull(li_rtn) and li_rtn = -1  )
			
		case lower("FindSeries")
			dw_2.dataobject = 'dwgrfun1_d04_grid'
			dw_2.settransobject(sqlca)
			dw_2.Retrieve()
			
			//null
			
			SetNull(ls_null)
			li_rtn = dw_2.FindSeries(ls_null,'77')         //'66' is a data already in the table
			ls_result += wf_result_add(ls_item, "(ls_null,'77') ", isnull(li_rtn))
			
			
			li_rtn = dw_2.FindSeries('gr_1',ls_null)
			ls_result += wf_result_add(ls_item, "('gr_1',ls_null) ", isnull(li_rtn))
			
			
			li_rtn = dw_2.FindSeries(ls_null,ls_null)
			ls_result += wf_result_add(ls_item, "(ls_null,ls_null) ", isnull(li_rtn))
			
			//normal
			li_rtn = dw_2.FindSeries ('gr_1','66')       
			ls_result += wf_result_add(ls_item, "('gr_1','66' ) ", not isnull(li_rtn) and li_rtn > 0 )
			
			//无效值
			li_rtn = dw_2.FindSeries ('gr_2','77')       
			ls_result += wf_result_add(ls_item, "(NoValid,'77' ) ", not isnull(li_rtn) and li_rtn = -1 )
			
			li_rtn = dw_2.FindSeries ('gr_1','Q1')       
			ls_result += wf_result_add(ls_item, "('gr_1',NoValid )  ", not isnull(li_rtn) and li_rtn = -1  )
			
			li_rtn = dw_2.FindSeries ('gr_2','Q1')       
			ls_result += wf_result_add(ls_item, "(NoValid,NoValid ) ", not isnull(li_rtn) and li_rtn = -1  )
			
		case lower("GetData")
			dw_2.dataobject = 'dwgrfun1_d05_grid'
			dw_2.settransobject(sqlca)
			dw_2.Retrieve()
			
			//测试参数均有效的返回值
			ld_rtn = dw_2.GetData ('gr_1',1,1)       
			ls_result += wf_result_add(ls_item, "('gr_1',1,1) ", not isnull(ld_rtn) and ld_rtn >0 )
			
			//测试无效的GraphControl参数
			ld_rtn = dw_2.GetData ('gr_2',1,1)       
			ls_result += wf_result_add(ls_item, "(NoValid,1,1) ", not isnull(ld_rtn) and ld_rtn = -1 )
			
			//测试GraphControl参数为Null
			SetNull(ls_null)
			ld_rtn = dw_2.GetData (ls_null,1,1)       
			ls_result += wf_result_add(ls_item, " (ls_null,1,1) ", isnull(ld_rtn) )
			
			//测试SeriesNumber参数为0
			ld_rtn = dw_2.GetData ('gr_1',0,1)       
			ls_result += wf_result_add(ls_item, "('gr_1',0,1) ", not isnull(ld_rtn) and ld_rtn = 0 )
			
			//测试SeriesNumber参数大于Series个数
			ld_rtn = dw_2.GetData ('gr_1',10,1)       
			ls_result += wf_result_add(ls_item, "('gr_1',10,1) ", not isnull(ld_rtn) and ld_rtn =0 )
			
			//测试SeriesNumber参数为Null
			SetNull(li_null)
			ld_rtn = dw_2.GetData ('gr_1',li_null,1)       
			ls_result += wf_result_add(ls_item, "('gr_1',li_null,1)  ",  isnull(ld_rtn) )
			
			//测试DataPoint 参数为0
			ld_rtn = dw_2.GetData ('gr_1',1,0)       
			ls_result += wf_result_add(ls_item, "('gr_1',1,0) ", not isnull(ld_rtn) and ld_rtn =0 )
			
			//测试DataPoint参数大于轴点个数
			ld_rtn = dw_2.GetData ('gr_1',1,8)       
			ls_result += wf_result_add(ls_item, "('gr_1',1,8) ", not isnull(ld_rtn) and ld_rtn =0 )
			
			// 测试DataPoint参数为Null
			SetNull(li_null)
			ld_rtn = dw_2.GetData ('gr_1',1,li_null)       
			ls_result += wf_result_add(ls_item, " ('gr_1',1,li_null) ", isnull(ld_rtn) )
			
			//测试GraphType的默认值
			ld_rtn = dw_2.GetData ('gr_1',1,1)       
			ls_result += wf_result_add(ls_item, "('gr_1',1,1)  ", not isnull(ld_rtn) and ld_rtn >0 )
			
			//测试GraphType为xValue!
			ld_rtn = dw_2.GetData ('gr_1',1,1,xValue!)    
			ls_result += wf_result_add(ls_item, " ('gr_1',1,1,xValue!) ", not isnull(ld_rtn) and ld_rtn >0 )
			
			//测试GraphType为yValue!
			ld_rtn = dw_2.GetData ('gr_1',1,1,yValue!)      
			ls_result += wf_result_add(ls_item, " ('gr_1',1,1,yValue!)  ", not isnull(ld_rtn) and ld_rtn >0 )
			
			//测试GraphType为Null
			grDataType	lgr_DataType
			SetNull(lgr_DataType)
			ld_rtn = dw_2.GetData ('gr_1',1,1,lgr_DataType)       
			ls_result += wf_result_add(ls_item, " ('gr_1',1,1,lgr_DataType) ", isnull(ld_rtn) )
			
			
		case lower("GetDataPieExplode")
			dw_2.dataobject = 'dwgrfun1_d09_grid'
			dw_2.settransobject(sqlca)
			dw_2.Retrieve()
			
			//测试所有参数均有效的返回值
			
			//测试无效的GraphControl参数
			
			//测试GraphControl参数为Null
			
			//测试Series参数为0
			
			//测试Series参数大于Series个数
			
			//测试Series参数为Null
			
			//测试DataPoint参数为0
			
			//测试DataPoint参数大于轴点个数
			
			//测试DataPoint参数为NUll
			
			// 测试percentage参数
			
			//测试Percentage参数为Null
			
			
		case lower("GetDataStyle")
			dw_2.dataobject = 'dwgrfun1_d07_grid'
			dw_2.settransobject(sqlca)
			dw_2.Retrieve()
			
			
			dw_2.dataobject = 'dwgrfun1_d01_grid'
			dw_2.settransobject(sqlca)
			dw_2.Retrieve()
			
			
			
		case lower("GetDataValue")
			dw_2.dataobject = 'dwgrfun1_d05_grid'
			dw_2.settransobject(sqlca)
			dw_2.Retrieve()
			
		case lower("GetSeriesStyle")
			dw_2.dataobject = 'dwgrfun1_d08_grid'
			dw_2.settransobject(sqlca)
			dw_2.Retrieve()
			
			
			dw_2.dataobject = 'dwgrfun1_d02_grid'
			dw_2.settransobject(sqlca)
			dw_2.Retrieve()
			
			
			
		case lower("")
			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module2 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_tmp1,ll_null, ll_position
long 			ll_startrow,ll_endrow,ll_height
string 		ls_file, ls_fullname,ls_rtn,ls_data
integer 		li_rtn, li_col
border 		lb_border,lb_rtn,lb_bdarr[]
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
Long        	ll_row = 3
Integer     	li_colnbr = 3
String      	ls_colname = "emp_id"

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "SetValue"
ls_array[Upperbound(ls_array) + 1 ] = "GetValue"
ls_array[Upperbound(ls_array) + 1 ] = "ClearValues"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "FindRequired"
ls_array[Upperbound(ls_array) + 1 ] = "GetChild"
ls_array[Upperbound(ls_array) + 1 ] = "Hide"
ls_array[Upperbound(ls_array) + 1 ] = "InsertRow"
ls_array[Upperbound(ls_array) + 1 ] = "Print"                      //manual test
ls_array[Upperbound(ls_array) + 1 ] = "Reset"
ls_array[Upperbound(ls_array) + 1 ] = "Resize"
ls_array[Upperbound(ls_array) + 1 ] = "SaveAs"                //manual test
ls_array[Upperbound(ls_array) + 1 ] = "ScrollNextPage"
ls_array[Upperbound(ls_array) + 1 ] = "ScrollPriorPage"
ls_array[Upperbound(ls_array) + 1 ] = "ScrollToRow"
ls_array[Upperbound(ls_array) + 1 ] = "ScrollPriorRow"
ls_array[Upperbound(ls_array) + 1 ] = "ScrollNextRow"
ls_array[Upperbound(ls_array) + 1 ] = "SetBorderStyle"
ls_array[Upperbound(ls_array) + 1 ] = "SetDetailHeight"
ls_array[Upperbound(ls_array) + 1 ] = "SetFocus"
ls_array[Upperbound(ls_array) + 1 ] = "Show"
ls_array[Upperbound(ls_array) + 1 ] = "Sort"
ls_array[Upperbound(ls_array) + 1 ] = "TypeOf"
//
ll_bound  = Upperbound(ls_array)
for i = 1 to ll_bound
	Yield ( )
	ls_item = ls_array[i]
	of_recordtestpoint(is_testcasename+ " "+ ls_array[i]+" today: "+string(today())+" now:"+string(now())+" ~r~n")	
	is_log = ''
	ls_temp = ''
	li_rtn = 0 
	ls_temp2 = ''
	ll_tmp = 0
	choose case lower(ls_item)
		case lower("SetValue")	
			dw_2.dataobject = 'd_dcf_clearvalues'
			dw_2.settransobject(sqlca)
			dw_2.retrieve( )
			
			//Edit
			ls_temp = "n_year"
			li_rtn = dw_2.SetValue(ls_temp,1,"2017")
			ls_rtn = dw_2.GetValue("n_year",1)
			ls_result += wf_result_add(ls_item, " 1.Edit", not isnull(ls_rtn) and li_rtn =1 and ls_rtn = "2017	2017")
			
			//DropDownListBox
			li_rtn = dw_2.SetValue("n_month",1,"03")
			ls_rtn = dw_2.GetValue("n_month",1)
			ls_result += wf_result_add(ls_item, " 2.DropDownListBox", not isnull(ls_rtn) and li_rtn =1 and ls_rtn = "03	03")
			
			
			//RadioButton
			li_rtn = dw_2.SetValue("n_salary",1,"test")
			ls_rtn = dw_2.GetValue("n_salary",1)
			ls_result += wf_result_add(ls_item, " 3.RadioButton", not isnull(ls_rtn) and li_rtn =1 and ls_rtn = "test	test")
			
		case lower("GetValue")	
			dw_2.retrieve( )
			//Edit
			ls_temp = "n_year"
			ls_rtn = dw_2.GetValue(ls_temp,1)
			ls_result += wf_result_add(ls_item, " 1.Edit", not isnull(ls_rtn) and not ls_rtn = "")
			
			//DropDownListBox
			ls_rtn = dw_2.GetValue("n_month",1)
			ls_result += wf_result_add(ls_item, " 2.DropDownListBox", not isnull(ls_rtn) and not ls_rtn = "")
			
			
			//RadioButton
			ls_rtn = dw_2.GetValue("n_salary",1)
			ls_result += wf_result_add(ls_item, " 3.RadioButton", not isnull(ls_rtn) and not ls_rtn = "")
			
		case lower("ClearValues")
			//Edit
			ls_temp = "n_year"
			li_rtn = dw_2.clearvalues( ls_temp)
			ls_result += wf_result_add(ls_item, " 1.Edit", not isnull(li_rtn) and li_rtn = 1)
			
			//DropDownListBox
			li_rtn=dw_2.clearvalues("n_month")
			ls_result += wf_result_add(ls_item, " 2.DropDownListBox", not isnull(li_rtn) and li_rtn = 1)
			
			
			//RadioButton
			li_rtn=dw_2.clearvalues("n_salary")
			ls_result += wf_result_add(ls_item, " 3.RadioButton", not isnull(li_rtn) and li_rtn = 1)
			
			
		case lower("FindRequired")	
			dw_2.dataobject = 'd_dwstyle_tabular3'
			dw_2.settransobject(sqlca)
			dw_2.retrieve( )
			
			IF dw_2.AcceptText() = -1 THEN
				dw_2.SetFocus()
			END IF
			
			li_rtn = dw_2.FindRequired(Primary!, ll_row,li_colnbr, ls_colname, False)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)		
			
		case lower("GetChild")	
			dw_2.dataobject = 'd_dcf504_getchild'
			dw_2.settransobject(sqlca)
			dw_2.retrieve( )
			
			DataWindowChild ldec_1
			li_rtn = dw_2.GetChild('v_name', ldec_1)
			ldec_1.SetTransObject(Sqlca);
			ldec_1.Retrieve()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
				
		case lower("Hide")	
			li_rtn = dw_2.Hide()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			li_rtn = dw_2.Show()
			ls_result += wf_result_add(ls_item, " then show", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("InsertRow")	
			dw_2.dataobject = 'd_dwstyle_tabular3'
			dw_2.settransobject(sqlca)
			dw_2.retrieve( )
			
			//InsertRow,Get initial Status
			li_rtn = dw_2.InsertRow(2)
			dwItemStatus ldis_status
			ldis_status = dw_2.GetItemStatus(li_rtn, 0, Primary!)
			ls_result += wf_result_add(ls_item, " 1.Get initial Status ", not isnull(li_rtn) and li_rtn = 2 and ldis_status = New!)
			
			//InsertRow(arg=0)  when dw without rows
			dw_2.Reset()
			li_rtn = dw_2.InsertRow(0)
			ls_result += wf_result_add(ls_item, " 2.arg=0, when dw without rows ", not isnull(li_rtn) and li_rtn = 1 )
			//InsertRow(arg=0)  when dw with rows
			dw_2.Reset()
			dw_2.retrieve()
			ll_tmp = dw_2.rowcount()
			li_rtn = dw_2.InsertRow(0)
			ls_result += wf_result_add(ls_item, " 3.arg=0, when dw with rows ", not isnull(li_rtn) and li_rtn = ll_tmp +1 )
			
			//InsertRow(arg>0) when dw without rows
			dw_2.Reset()
			li_rtn = dw_2.InsertRow(2)
			ls_result += wf_result_add(ls_item, " 4.arg=2, when dw without rows ", not isnull(li_rtn) and li_rtn = 1 )
			
			//InsertRow(arg>rowcount) when dw without rows
			dw_2.Reset()
			li_rtn = dw_2.InsertRow(dw_2.Rowcount() +1)
			ls_result += wf_result_add(ls_item, " 5.arg>rowcount, when dw without rows ", not isnull(li_rtn) and li_rtn = 1 )
			
			
	
		case lower("Print")	
		case lower("Reset")	
			//After Reset() , Retrieve()
			li_rtn = dw_2.Reset()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			dw_2.Retrieve()
		case lower("Resize")	
			If dw_2.Width <> 1701 then
				li_rtn = dw_2.Resize(1701,596)
			else
				li_rtn = dw_2.Resize(1600,596)
			end if
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
		
		case lower("SaveAs")	
		case lower("ScrollNextPage")	
			//No Data in DataWindow
			dw_2.Reset()
			li_rtn = dw_2.ScrollNextPage()
			ls_result += wf_result_add(ls_item, " 1.No Data in DataWindow ", not isnull(li_rtn) and li_rtn = 0)
			//Over one Page
			dw_2.Retrieve()
			li_rtn = dw_2.ScrollNextPage()
			ls_result += wf_result_add(ls_item, " 2.Over one Page ", not isnull(li_rtn) and  li_rtn <> 0)
			
		case lower("ScrollPriorPage")	
			//No Data in DataWindow
			dw_2.Reset()
			li_rtn = dw_2.ScrollPriorPage()
			ls_result += wf_result_add(ls_item, " 1.No Data in DataWindow ", not isnull(li_rtn) and li_rtn = 0)
			//Over one Page
			dw_2.Retrieve()
			li_rtn = dw_2.ScrollPriorPage()
			ls_result += wf_result_add(ls_item, " 2.Over one Page ", not isnull(li_rtn) and  li_rtn <> 0)
		case lower("ScrollToRow")	
			//NULL
			dw_2.Retrieve()
			setnull(ll_tmp)
			li_rtn = dw_2.ScrollToRow(ll_tmp)
//			ls_result += wf_result_add(ls_item, " 1.NULL ", isnull(li_rtn))  //help上面写的是返回NULL，但是实际返回却是-1
			ls_result += wf_result_add(ls_item, " 1.NULL ", li_rtn = -1)
			
			//ScrollToRow Argument < 0
			dw_2.Retrieve()
			li_rtn = dw_2.ScrollToRow(- 3)
			ls_result += wf_result_add(ls_item, " 2. Argument < 0 ", not isnull(li_rtn) and li_rtn = 1)
			
			//ScrollToRow Argument > Rowcount
			dw_2.Retrieve()
			li_rtn = dw_2.ScrollToRow(dw_2.Rowcount() + 1)
			ls_result += wf_result_add(ls_item, " 3. Argument > Rowcount ", not isnull(li_rtn) and li_rtn <> -1)
			
		case lower("ScrollNextRow")	
			//ScrollNextRow when currentrow = 1
			dw_2.Retrieve()
			dw_2.SetRow(1)
			ll_tmp = dw_2.getrow()
			li_rtn = dw_2.ScrollNextRow()
			ll_tmp1 = dw_2.getrow()
			ls_result += wf_result_add(ls_item, " 1. when currentrow = 1 ", not isnull(li_rtn) and ll_tmp1 = ll_tmp + 1)
			
			//ScrollNextRow when currentrow = rowcount
			dw_2.Retrieve()
			ll_tmp = dw_2.rowcount()
			dw_2.SetRow(ll_tmp)
			li_rtn = dw_2.ScrollNextRow()
			ll_tmp1= dw_2.getrow()
			ls_result += wf_result_add(ls_item, " 2. when currentrow = rowcount ", not isnull(li_rtn) and ll_tmp1 = ll_tmp)
			
		case lower("ScrollPriorRow")
			//ScrollPriorRow when currentrow = 1
			dw_2.Retrieve()
			dw_2.SetRow(1)
			li_rtn = dw_2.ScrollPriorRow()
			ls_result += wf_result_add(ls_item, " 1. when currentrow = 1 ", not isnull(li_rtn) and li_rtn = 1)
			
			//ScrollPriorRow when currentrow = rowcount
			dw_2.Retrieve()
			ll_tmp = dw_2.rowcount()
			dw_2.SetRow(ll_tmp)
			li_rtn = dw_2.ScrollPriorRow()      
			ll_tmp1 = dw_2.getrow()
			ls_result += wf_result_add(ls_item, " 2. when currentrow = rowcount ", not isnull(li_rtn) and ll_tmp1 = ll_tmp - 1)
			
			
		case lower("SetBorderStyle")
			dw_2.dataobject = 'd_dcf_setdetailheight'
			dw_2.settransobject(sqlca)
			dw_2.retrieve( )
			
			//column NULL
			setnull(li_col)
			lb_border = ShadowBox!
			li_rtn = dw_2.setborderstyle(li_col,lb_border)
			ls_result += wf_result_add(ls_item, " 1. column NULL ", isnull(li_rtn) )
			
			//borderstyle NULL
			li_col = 1
			Setnull(lb_border)
			li_rtn = dw_2.setborderstyle(li_col,lb_border)
			ls_result += wf_result_add(ls_item, " 2. borderstyle NULL ", isnull(li_rtn) )
			
			// Both NULL
			setnull(li_col)
			setnull(lb_border)
			li_rtn = dw_2.setborderstyle(li_col,lb_border)
			ls_result += wf_result_add(ls_item, " 3. Both NULL ", isnull(li_rtn) )
			
			//NoBorder!
			li_col = 1
			lb_border = NoBorder!
			li_rtn = dw_2.setborderstyle(li_col,lb_border)
			lb_rtn =dw_2.getborderstyle( li_col )
			ls_result += wf_result_add(ls_item, " 4. NoBorder!", not isnull(li_rtn) and li_rtn = 1 and lb_rtn = lb_border)
			
			//ShadowBox!
			li_col = 1
			lb_border = ShadowBox!
			li_rtn = dw_2.setborderstyle(li_col,lb_border)
			lb_rtn =dw_2.getborderstyle( li_col )
			ls_result += wf_result_add(ls_item, " 5. ShadowBox!", not isnull(li_rtn) and li_rtn = 1 and lb_rtn = lb_border)
			
			
			//Box!
			li_col = 1
			lb_border = Box!
			li_rtn = dw_2.setborderstyle(li_col,lb_border)
			lb_rtn =dw_2.getborderstyle( li_col )
			ls_result += wf_result_add(ls_item, " 6. Box!", not isnull(li_rtn) and li_rtn = 1 and lb_rtn = lb_border)
			
			//ResizeBorder!
			li_col = 1
			lb_border = ResizeBorder!
			li_rtn = dw_2.setborderstyle(li_col,lb_border)
			lb_rtn =dw_2.getborderstyle( li_col )
			ls_result += wf_result_add(ls_item, " 7. ResizeBorder!", not isnull(li_rtn) and li_rtn = 1 and lb_rtn = lb_border)
			
			//Underline!
			li_col = 1
			lb_border = Underline!
			li_rtn = dw_2.setborderstyle(li_col,lb_border)
			lb_rtn =dw_2.getborderstyle( li_col )
			ls_result += wf_result_add(ls_item, " 8. Underline!", not isnull(li_rtn) and li_rtn = 1 and lb_rtn = lb_border)
			
			//Lowered!
			li_col = 1
			lb_border = Lowered!
			li_rtn = dw_2.setborderstyle(li_col,lb_border)
			lb_rtn =dw_2.getborderstyle( li_col )
			ls_result += wf_result_add(ls_item, " 9. Lowered!", not isnull(li_rtn) and li_rtn = 1 and lb_rtn = lb_border)
			
			//Raised!
			li_col = 1
			lb_border = Raised!
			li_rtn = dw_2.setborderstyle(li_col,lb_border)
			lb_rtn =dw_2.getborderstyle( li_col )
			ls_result += wf_result_add(ls_item, " 10. Raised!", not isnull(li_rtn) and li_rtn = 1 and lb_rtn = lb_border)
			
			
		case lower("SetDetailHeight")	
			dw_2.retrieve( )
			
			//NULL
			setnull(ll_startrow)
			ll_endrow= 2
			ll_height = 10
			li_rtn=dw_2.SetDetailHeight (ll_startrow,ll_endrow,ll_height)
			ls_result += wf_result_add(ls_item, " 1.Null startrow ",  isnull(li_rtn))
			
			ll_startrow = 2
			setnull(ll_endrow)			
			ll_height = 10
			li_rtn=dw_2.SetDetailHeight (ll_startrow,ll_endrow,ll_height)
			ls_result += wf_result_add(ls_item, " 2.null endrow",  isnull(li_rtn))
			
			ll_startrow = 2
			ll_endrow = 3			
			Setnull(ll_height)
			li_rtn=dw_2.SetDetailHeight (ll_startrow,ll_endrow,ll_height)
			ls_result += wf_result_add(ls_item, " 3.null height",  isnull(li_rtn))
			
			
			//Autoheight＝true      return -1
			dw_2.object.datawindow.Detail.Height.AutoSize = true
			ll_startrow = 2
			ll_endrow = 3			
			ll_height = 100
			li_rtn=dw_2.SetDetailHeight (ll_startrow,ll_endrow,ll_height)
			ls_result += wf_result_add(ls_item, " 4.Autoheight＝true", not isnull(li_rtn) and li_rtn = -1)
			
			
			//Autoheight＝false时，若参数height为零    return 0
			dw_2.object.datawindow.Detail.Height.AutoSize = false
			ll_startrow = 1
			ll_endrow = dw_2.rowcount( )			
			ll_height = 0
			li_rtn=dw_2.SetDetailHeight (ll_startrow,ll_endrow,ll_height)
			ls_data = dw_2.Describe("Evaluate('rowheight()',1)")
			ls_result += wf_result_add(ls_item, " 5.Autoheight＝false, height=0", not isnull(li_rtn) and li_rtn = 1 and ls_data = "0")
			
			
			//Autoheight＝false时，参数height为小数,需要做隐性转换成整型值
			ll_startrow = 2
			ll_endrow = 3			
			li_rtn=dw_2.SetDetailHeight (ll_startrow,ll_endrow,66.66)
			ls_data = dw_2.Describe("Evaluate('rowheight()',3)")
			ls_result += wf_result_add(ls_item, " 6.Autoheight＝false, height=66.66",  not isnull(li_rtn) and li_rtn = 1 and ls_data = "67")
			
			
			//detail的Autoheight＝false时，参数height为正数
			ll_startrow = 3
			ll_endrow = 5	
			li_rtn=dw_2.SetDetailHeight (ll_startrow,ll_endrow,3000)
			ls_data = dw_2.Describe("Evaluate('rowheight()',4)")
			ls_result += wf_result_add(ls_item, " 5.Autoheight＝false, height=3000", not isnull(li_rtn) and li_rtn = 1 and ls_data = "3000")
			
			
		case lower("SetFocus")
			li_rtn = dw_2.SetFocus()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
	
		case lower("Show")
			li_rtn = dw_2.Show()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
		case lower("Sort")	
			////SetSort Only with column name(dw_2)
			dw_2.SetSort('emp_id')
			li_rtn = dw_2.Sort()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("TypeOf")
			ls_result += wf_result_add(ls_item, " ", dw_2.TypeOf()=DataWindow!)
			
			
		case lower("")	
	
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine wf_init_data ();int i
dw_1.dataobject = 'd_dcf601_findrequired'
dw_1.settransobject(sqlca);
dw_1.retrieve()
for i = 3 to 0 step -1
	dw_1.insertrow(0)
next
end subroutine

on w_datawindow_methods.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.dw_2=create dw_2
this.cb_2=create cb_2
this.dw_1=create dw_1
this.cb_1=create cb_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.st_1
end on

on w_datawindow_methods.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.st_1)
end on

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator
if FileExists(ls_filepath+"test.pdf") then
	FileDelete(ls_filepath+"test.pdf")
end if
end event

type cb_3 from commandbutton within w_datawindow_methods
integer x = 96
integer y = 536
integer width = 457
integer height = 112
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Method Add"
end type

event clicked;of_testcase_point_module2()
end event

type dw_2 from datawindow within w_datawindow_methods
integer x = 1001
integer y = 588
integer width = 1390
integer height = 396
integer taborder = 40
string title = "none"
string dataobject = "dwgrfnu1_clipboard"
boolean livescroll = true
end type

type cb_2 from commandbutton within w_datawindow_methods
integer x = 96
integer y = 404
integer width = 457
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Graph Method"
end type

event clicked;of_testcase_point_module1()
end event

type dw_1 from datawindow within w_datawindow_methods
integer x = 997
integer y = 252
integer width = 1394
integer height = 300
integer taborder = 20
string title = "none"
string dataobject = "d_dwstyle_tabular3"
boolean livescroll = true
end type

type cb_1 from commandbutton within w_datawindow_methods
integer x = 96
integer y = 272
integer width = 457
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Methods Test"
end type

event clicked;of_testcase_point_module()
end event

type st_1 from statictext within w_datawindow_methods
integer x = 361
integer y = 108
integer width = 910
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "DataWindow Methods Test"
boolean focusrectangle = false
end type

