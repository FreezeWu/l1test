$PBExportHeader$w_pb_graphdw.srw
forward
global type w_pb_graphdw from w_base_case
end type
type cb_2 from commandbutton within w_pb_graphdw
end type
type cb_1 from commandbutton within w_pb_graphdw
end type
type dw_1 from datawindow within w_pb_graphdw
end type
end forward

global type w_pb_graphdw from w_base_case
integer width = 4512
integer height = 2500
string title = "Graphdw GroupA"
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_pb_graphdw w_pb_graphdw

type variables
string is_ResourcePath
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
end prototypes

public subroutine of_testcase_point_module ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null,ls_rtn
long			ll_bound, i , ll_tmp, ll_null, ll_position, ll_CorValue ,ll_ColorVar 
string 		ls_file, ls_fullname,ls_gra
integer 		li_rtn, li_col,li_null,li_Percent,li_LWidth
boolean		lbn_flag 
Date			ld_date
DateTime	ldt_datetime
time			lt_time
Decimal		ldc_data
Double		ld_Double,ld_rtn

grDataType	lgr_DataType
grColorType lgr_CoType
LineStyle ll_Style
FillPattern	lf_FillVar
grSymbolType lsy_SymbolVar

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
//ls_array[Upperbound(ls_array) + 1 ] = ""

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
			li_rtn = dw_1.Clipboard (ls_gra)
			ls_result += wf_result_add(ls_item, "1.NULL ", isnull(li_rtn))	
			
			//copies the graph(圆图)
			ls_gra = 'gr_1'
			dw_1.dataobject = 'dwgrfnu1_clipboard'
			dw_1.settransobject(sqlca)
			dw_1.retrieve( )
			li_rtn =  dw_1.Clipboard (ls_gra)
			ls_result += wf_result_add(ls_item, "2.copies the graph(Circle Graph) ", not isnull(li_rtn) and li_rtn >0 )
		
			//copies the graph(线图)
			ls_gra = 'gr_1'
			dw_1.dataobject = 'dwgrfnu1_line_clipboard'
			dw_1.settransobject(sqlca)
			dw_1.retrieve( )
			li_rtn = dw_1.Clipboard (ls_gra)
			ls_result += wf_result_add(ls_item, "3.copies the graph(Line Graph) ", not isnull(li_rtn) and li_rtn >0 )
			
			//两Graph重叠
			ls_gra = 'gr_1'
			dw_1.dataobject = 'dwgrfnu1_two_clipboard'
			dw_1.settransobject(sqlca)
			dw_1.retrieve( )
			li_rtn = dw_1.clipboard(ls_gra)		
			ls_result += wf_result_add(ls_item, "4.copies the graph(Two Graph) ", not isnull(li_rtn) and li_rtn >0 )
		
					
		case lower("CategoryCount")
			dw_1.dataobject = 'dwgrfun1_d01_grid'
			dw_1.settransobject(sqlca)
			dw_1.retrieve( )
			
			//NULL
			SetNull(ls_null)
			li_rtn = dw_1.CategoryCount(ls_null)
			ls_result += wf_result_add(ls_item, "1 .NULL", isnull(li_rtn) )
			
			
			//normal
			li_rtn = dw_1.CategoryCount("gr_1")
			ls_result += wf_result_add(ls_item, "2.normal ", not isnull(li_rtn) and li_rtn >0 )
		
		case lower("CategoryName")
			dw_1.dataobject = 'dwgrfun1_d01_freeform'
			dw_1.settransobject(sqlca)
			dw_1.Retrieve()
			
			//null
			
			SetNull(ls_null)
			ls_rtn = dw_1.CategoryName(ls_null,1)
			ls_result += wf_result_add(ls_item, "(ls_null,1) ", isnull(ls_rtn))
			
			SetNull(li_null)
			ls_rtn = dw_1.CategoryName('gr_1',li_null)
			ls_result += wf_result_add(ls_item, "('gr_1',li_null) ", isnull(ls_rtn))
			
			SetNull(ls_null)
			SetNull(li_null)
			ls_rtn = dw_1.CategoryName(ls_null,li_null)
			ls_result += wf_result_add(ls_item, "(ls_null,li_null) ", isnull(ls_rtn))
			
			//number 0
		
			ls_rtn = dw_1.CategoryName('gr_1',0)
			ls_result += wf_result_add(ls_item, "('gr_1',0) ", not isnull(ls_rtn) and ls_rtn = "" )
			
			//normal
			
			ls_rtn = dw_1.CategoryName('gr_1',2)
			ls_result += wf_result_add(ls_item, "('gr_1',2) ", not isnull(ls_rtn) and not ls_rtn = "" )
			
			//参数大于CategoryCount
			
			ls_rtn = dw_1.CategoryName('gr_1',8)
			ls_result += wf_result_add(ls_item, "('gr_1',max + ) ", not isnull(ls_rtn) and ls_rtn = "" )
			
		case lower("DataCount")
			dw_1.dataobject = 'dwgrfun1_d02_grid'
			dw_1.settransobject(sqlca)
			dw_1.Retrieve()
			
			//null
			
			SetNull(ls_null)
			li_rtn = dw_1.DataCount(ls_null,'77')         //'77' is a data already in the table
			ls_result += wf_result_add(ls_item, "(ls_null,'77') ", isnull(li_rtn))
			
			
			li_rtn = dw_1.DataCount('gr_1',ls_null)
			ls_result += wf_result_add(ls_item, "('gr_1',ls_null) ", isnull(li_rtn))
			
			
			li_rtn = dw_1.DataCount(ls_null,ls_null)
			ls_result += wf_result_add(ls_item, "(ls_null,ls_null) ", isnull(li_rtn))
			
			//normal
			li_rtn = dw_1.DataCount ('gr_1','77')       
			ls_result += wf_result_add(ls_item, "('gr_1','77' ) ", not isnull(li_rtn) and li_rtn > 0 )
			
			//无效值
			li_rtn = dw_1.DataCount ('gr_2','77')       
			ls_result += wf_result_add(ls_item, "(NoValid,'77' ) ", not isnull(li_rtn) and li_rtn = -1 )
			
			li_rtn = dw_1.DataCount ('gr_1','Q1')       
			ls_result += wf_result_add(ls_item, "('gr_1',NoValid )  ", not isnull(li_rtn) and li_rtn = -1  )
			
			li_rtn = dw_1.DataCount ('gr_2','Q1')       
			ls_result += wf_result_add(ls_item, "(NoValid,NoValid ) ", not isnull(li_rtn) and li_rtn = -1  )
			
		case lower("FindCategory")
			dw_1.dataobject = 'dwgrfun1_d03_grid'
			dw_1.settransobject(sqlca)
			dw_1.Retrieve()
			
			//null
			
			SetNull(ls_null)
			li_rtn = dw_1.FindCategory(ls_null,'1986')         //'1986' is a data already in the table
			ls_result += wf_result_add(ls_item, "(ls_null,'1986') ", isnull(li_rtn))
			
			
			li_rtn = dw_1.FindCategory('gr_1',ls_null)
			ls_result += wf_result_add(ls_item, "('gr_1',ls_null) ", isnull(li_rtn))
			
			
			li_rtn = dw_1.FindCategory(ls_null,ls_null)
			ls_result += wf_result_add(ls_item, "(ls_null,ls_null) ", isnull(li_rtn))
			
			//normal
			li_rtn = dw_1.FindCategory ('gr_1','1986')       
			ls_result += wf_result_add(ls_item, "('gr_1','1986' ) ", not isnull(li_rtn) and li_rtn > 0 )
			
			//无效值
			li_rtn = dw_1.FindCategory ('gr_2','1986')       
			ls_result += wf_result_add(ls_item, "(NoValid,'1986' ) ", not isnull(li_rtn) and li_rtn = -1 )
			
			li_rtn = dw_1.FindCategory ('gr_1','Q1')       
			ls_result += wf_result_add(ls_item, "('gr_1',NoValid )  ", not isnull(li_rtn) and li_rtn = -1  )
			
			li_rtn = dw_1.FindCategory ('gr_2','Q1')       
			ls_result += wf_result_add(ls_item, "(NoValid,NoValid ) ", not isnull(li_rtn) and li_rtn = -1  )
			
			//categoryvalue 参数不同类型
			//data
			ld_date = 1996-01-01
			li_rtn = dw_1.FindCategory ('gr_1',ld_date)       
			ls_result += wf_result_add(ls_item, "('gr_1',ld_date ) ", not isnull(li_rtn) and li_rtn = -1  )
			
			//DateTime
			ldt_datetime = DateTime(1996-01-01,00:00:00)
			li_rtn = dw_1.FindCategory ('gr_1',ldt_datetime)       
			ls_result += wf_result_add(ls_item, "('gr_1',ldt_datetime ) ", not isnull(li_rtn) and li_rtn = -1  )
			
			//Double
			ld_Double = 123.456
			li_rtn = dw_1.FindCategory ('gr_1',ld_Double)       
			ls_result += wf_result_add(ls_item, "('gr_1',ld_Double ) ", not isnull(li_rtn) and li_rtn = -1  )
			
		case lower("FindSeries")
			dw_1.dataobject = 'dwgrfun1_d04_grid'
			dw_1.settransobject(sqlca)
			dw_1.Retrieve()
			
			//null
			
			SetNull(ls_null)
			li_rtn = dw_1.FindSeries(ls_null,'77')         //'66' is a data already in the table
			ls_result += wf_result_add(ls_item, "(ls_null,'77') ", isnull(li_rtn))
			
			
			li_rtn = dw_1.FindSeries('gr_1',ls_null)
			ls_result += wf_result_add(ls_item, "('gr_1',ls_null) ", isnull(li_rtn))
			
			
			li_rtn = dw_1.FindSeries(ls_null,ls_null)
			ls_result += wf_result_add(ls_item, "(ls_null,ls_null) ", isnull(li_rtn))
			
			//normal
			li_rtn = dw_1.FindSeries ('gr_1','66')       
			ls_result += wf_result_add(ls_item, "('gr_1','66' ) ", not isnull(li_rtn) and li_rtn > 0 )
			
			//无效值
			li_rtn = dw_1.FindSeries ('gr_2','77')       
			ls_result += wf_result_add(ls_item, "(NoValid,'77' ) ", not isnull(li_rtn) and li_rtn = -1 )
			
			li_rtn = dw_1.FindSeries ('gr_1','Q1')       
			ls_result += wf_result_add(ls_item, "('gr_1',NoValid )  ", not isnull(li_rtn) and li_rtn = -1  )
			
			li_rtn = dw_1.FindSeries ('gr_2','Q1')       
			ls_result += wf_result_add(ls_item, "(NoValid,NoValid ) ", not isnull(li_rtn) and li_rtn = -1  )
			
		case lower("GetData")
			dw_1.dataobject = 'dwgrfun1_d05_grid'
			dw_1.settransobject(sqlca)
			dw_1.Retrieve()
			
			//测试参数均有效的返回值
			ld_rtn = dw_1.GetData ('gr_1',1,1)       
			ls_result += wf_result_add(ls_item, "('gr_1',1,1) ", not isnull(ld_rtn) and ld_rtn >0 )
			
			//测试无效的GraphControl参数
			ld_rtn = dw_1.GetData ('gr_2',1,1)       
			ls_result += wf_result_add(ls_item, "(NoValid,1,1) ", not isnull(ld_rtn) and ld_rtn = -1 )
			
			//测试GraphControl参数为Null
			SetNull(ls_null)
			ld_rtn = dw_1.GetData (ls_null,1,1)       
			ls_result += wf_result_add(ls_item, " (ls_null,1,1) ", isnull(ld_rtn) )
			
			//测试SeriesNumber参数为0
			ld_rtn = dw_1.GetData ('gr_1',0,1)       
			ls_result += wf_result_add(ls_item, "('gr_1',0,1) ", not isnull(ld_rtn) and ld_rtn = 0 )
			
			//测试SeriesNumber参数大于Series个数
			ld_rtn = dw_1.GetData ('gr_1',10,1)       
			ls_result += wf_result_add(ls_item, "('gr_1',10,1) ", not isnull(ld_rtn) and ld_rtn =0 )
			
			//测试SeriesNumber参数为Null
			SetNull(li_null)
			ld_rtn = dw_1.GetData ('gr_1',li_null,1)       
			ls_result += wf_result_add(ls_item, "('gr_1',li_null,1)  ",  isnull(ld_rtn) )
			
			//测试DataPoint 参数为0
			ld_rtn = dw_1.GetData ('gr_1',1,0)       
			ls_result += wf_result_add(ls_item, "('gr_1',1,0) ", not isnull(ld_rtn) and ld_rtn =0 )
			
			//测试DataPoint参数大于轴点个数
			ld_rtn = dw_1.GetData ('gr_1',1,8)       
			ls_result += wf_result_add(ls_item, "('gr_1',1,8) ", not isnull(ld_rtn) and ld_rtn =0 )
			
			// 测试DataPoint参数为Null
			SetNull(li_null)
			ld_rtn = dw_1.GetData ('gr_1',1,li_null)       
			ls_result += wf_result_add(ls_item, " ('gr_1',1,li_null) ", isnull(ld_rtn) )
			
			//测试GraphType的默认值
			ld_rtn = dw_1.GetData ('gr_1',1,1)       
			ls_result += wf_result_add(ls_item, "('gr_1',1,1)  ", not isnull(ld_rtn) and ld_rtn >0 )
			
			//测试GraphType为xValue!
			ld_rtn = dw_1.GetData ('gr_1',1,1,xValue!)    
			ls_result += wf_result_add(ls_item, " ('gr_1',1,1,xValue!) ", not isnull(ld_rtn) and ld_rtn >0 )
			
			//测试GraphType为yValue!
			ld_rtn = dw_1.GetData ('gr_1',1,1,yValue!)      
			ls_result += wf_result_add(ls_item, " ('gr_1',1,1,yValue!)  ", not isnull(ld_rtn) and ld_rtn >0 )
			
			//测试GraphType为Null
			
			SetNull(lgr_DataType)
			ld_rtn = dw_1.GetData ('gr_1',1,1,lgr_DataType)       
			ls_result += wf_result_add(ls_item, " ('gr_1',1,1,lgr_DataType) ", isnull(ld_rtn) )
			
			
		case lower("GetDataPieExplode")
			dw_1.dataobject = 'dwgrfun1_d09_grid'
			dw_1.settransobject(sqlca)
			dw_1.Retrieve()
			
				
			
			//测试所有参数均有效的返回值
			
			li_rtn= dw_1.GetDataPieExplode ('gr_1',1,1, li_Percent )
			ls_result += wf_result_add(ls_item, "('gr_1',1,1,li_Percent ) ", not isnull(li_rtn) and li_rtn >0 )
			
			//测试无效的GraphControl参数
			
			 li_rtn=dw_1.GetDataPieExplode('gr_2',1,1, li_Percent)
			 ls_result += wf_result_add(ls_item, "('gr_1',1,1,li_Percent ) ", not isnull(li_rtn) and li_rtn =-1 )
			 
			
			//测试GraphControl参数为Null
			
			setnull(ls_null)
			 li_rtn=dw_1.GetDataPieExplode(ls_null,1,1,li_Percent)
			 ls_result += wf_result_add(ls_item, "(ls_null,1,1,li_Percent ) ",  isnull(li_rtn))
			 
			
			//测试Series参数为0
			
			li_rtn=dw_1.GetDataPieExplode ('gr_1',0,1, li_Percent )
		    ls_result += wf_result_add(ls_item, "('gr_1',0,1,li_Percent ) ", not isnull(li_rtn) and li_rtn =-1 )
			
			
			//测试Series参数大于Series个数
			
			li_rtn=dw_1.GetDataPieExplode('gr_1',8,1,li_Percent)
			ls_result += wf_result_add(ls_item, "('gr_1',8,1,li_Percent ) ", not isnull(li_rtn) and li_rtn =-1 )
			
			//测试Series参数为Null
			
			setnull(li_null)
			li_rtn=dw_1.GetDataPieExplode('gr_1',li_null,1,li_Percent)
			ls_result += wf_result_add(ls_item, "('gr_1',li_null,1,li_Percent ) ",  isnull(li_rtn))
			
			//测试DataPoint参数为0
			
			li_rtn= dw_1.GetDataPieExplode ('gr_1',1,0, li_Percent )
			ls_result += wf_result_add(ls_item, "('gr_1',1,0,li_Percent ) ", not isnull(li_rtn) and li_rtn =-1 )
			
			//测试DataPoint参数大于轴点个数
			
			li_rtn= dw_1.GetDataPieExplode ('gr_1',1,8, li_Percent )
			ls_result += wf_result_add(ls_item, "('gr_1',1,8,li_Percent ) ", not isnull(li_rtn) and li_rtn =-1 )
			
			//测试DataPoint参数为NUll
			
			setnull(li_null)
			li_rtn=dw_1.GetDataPieExplode('gr_1',1,li_null,li_Percent)
			ls_result += wf_result_add(ls_item, "('gr_1',1,li_null,li_Percent ) ",  isnull(li_rtn))
			
			
			// 测试percentage参数
			
			li_Percent = 200
			li_rtn = dw_1.GetDataPieExplode ('gr_1',1,1,li_Percent )
			ls_result += wf_result_add(ls_item, "('gr_1',1,1,li_Percent ) ", not isnull(li_rtn) and li_rtn >0 )
			
			//测试Percentage参数为Null
			
			setnull(li_null)
			li_rtn=dw_1.GetDataPieExplode('gr_1',1,1,li_null)
			ls_result += wf_result_add(ls_item, "('gr_1',1,1,li_null) ",  isnull(li_rtn))
			
		case lower("GetDataStyle")
			dw_1.dataobject = 'dwgrfun1_d07_grid'
			dw_1.settransobject(sqlca)
			dw_1.Retrieve()
			
			
			//测试语法1
			
//			所有参数均有效
             
			li_rtn=dw_1.GetDataStyle('gr_1',1,1,Background!,ll_CorValue)
			ls_result += wf_result_add(ls_item, "('gr_1',1,1,Background!,ll_CorValue) ",  not isnull(li_rtn) and li_rtn>0)
		
//		    graphcontrol参数无效
		    
			li_rtn=dw_1.GetDataStyle('gr_2',1,1,Background!,ll_CorValue)
			ls_result += wf_result_add(ls_item, "('gr_2',1,1,Background!,ll_CorValue) ", not isnull(li_rtn) and li_rtn=-1)
		
//		    graphcontrol参数为Null
			 
			 setnull(ls_null)
			 li_rtn=dw_1.GetDataStyle(ls_null,1,1,Background!,ll_CorValue)
			 ls_result += wf_result_add(ls_item, "(ls_null,1,1,Background!,ll_CorValue) ",  isnull(li_rtn) )


//			 seriesnumber参数为0
			
			li_rtn=dw_1.GetDataStyle('gr_1',0,1,Background!,ll_CorValue)
			ls_result += wf_result_add(ls_item, "('gr_1',0,1,Background!,ll_CorValue) ",  not isnull(li_rtn) and li_rtn=-1)
			
//			 seriesnumber参数大于Series个数

			 li_rtn=dw_1.GetDataStyle('gr_1',8,1,Background!,ll_CorValue)
			ls_result += wf_result_add(ls_item, "('gr_1',8,1,Background!,ll_CorValue) ",  not isnull(li_rtn) and li_rtn=-1)
			
//			 seriesnumber参数为Null
			 
			 setnull(li_null)
			  li_rtn=dw_1.GetDataStyle('gr_1',li_null,1,Background!,ll_CorValue)
			 ls_result += wf_result_add(ls_item, "('gr_1',li_null,1,Background!,ll_CorValue) ",  isnull(li_rtn) )
			

//			 datapointnumber参数为0
			
			li_rtn=dw_1.GetDataStyle('gr_1',1,0,Background!,ll_CorValue)
			ls_result += wf_result_add(ls_item, "('gr_1',1,0,Background!,ll_CorValue) ",  not isnull(li_rtn) and li_rtn=-1)
			 

//			 datapointnumber参数大于轴数据点个数
			 
              li_rtn=dw_1.GetDataStyle('gr_1',1,8,Background!,ll_CorValue)
			ls_result += wf_result_add(ls_item, "('gr_1',1,8,Background!,ll_CorValue) ", not  isnull(li_rtn) and li_rtn=-1)

//			 datapointnumber参数为Null
			 
               setnull(li_null)
			  li_rtn=dw_1.GetDataStyle('gr_1',1,li_null,Background!,ll_CorValue)
			  ls_result += wf_result_add(ls_item, "('gr_1',1,li_null,Background!,ll_CorValue) ", isnull(li_rtn))


//			   colortype参数为Shade!
			
			 li_rtn=dw_1.GetDataStyle('gr_1',1,1,Shade!,ll_CorValue)
			 ls_result += wf_result_add(ls_item, "('gr_1',1,1,Background!,ll_CorValue) ",  not isnull(li_rtn) and li_rtn>0)
                	
//			colortype参数为Null

			 setnull(lgr_CoType)
			 li_rtn=dw_1.GetDataStyle('gr_1',1,1,lgr_CoType,ll_CorValue)
			 ls_result += wf_result_add(ls_item, "('gr_1',1,1,lgr_CoType,ll_CorValue) ", isnull(li_rtn))
			 
//				colorvariable参数为Null
                  setnull(ll_null)
				li_rtn=dw_1.GetDataStyle('gr_1',1,1,Background!,ll_null)		 
			     ls_result += wf_result_add(ls_item, "('gr_1',1,1,Background!,ll_null) ",not isnull(li_rtn) and li_rtn>0)
			 

		           //测试语法 2

//				LiteStyle为Continuous!

				ll_Style = Continuous!
				li_rtn= dw_1.GetDataStyle ('gr_1',1,1,ll_Style,li_LWidth)
			    ls_result += wf_result_add(ls_item, " ('gr_1',1,1,ll_Style,li_LWidth)",not  isnull(li_rtn) and li_rtn>0)
				

//				LiteStyle为DashDot!
				
                 ll_Style = DashDot!
			   li_rtn = dw_1.GetDataStyle ('gr_1',1,1,ll_Style,li_LWidth)
			   ls_result += wf_result_add(ls_item, " ('gr_1',1,1,ll_Style,li_LWidth)",not  isnull(li_rtn) and li_rtn>0)
			
			

//				LineStyle参数为Null
				
                   setnull( ll_Style)
				li_rtn=dw_1.GetDataStyle ('gr_1',1,1, ll_Style,li_LWidth)		//bug, li_rtn = 1
				ls_result += wf_result_add(ls_item, " ('gr_1',1,1,ll_null,li_LWidth)",  isnull(li_rtn))

//				linewidth参数为Null
				
				 setnull(li_null)
				li_rtn=dw_1.GetDataStyle ('gr_1',1,1,ll_Style,li_null)		//1
				ls_result += wf_result_add(ls_item, "('gr_1',1,1,ll_Style,li_null)",  isnull(li_rtn))
			     
				dw_1.dataobject = 'dwgrfun1_d01_grid'
			    dw_1.settransobject(sqlca)
			    dw_1.Retrieve()
			
			     //测试语法3
			
			     // fillvariable为 Solid!
				  
				 lf_FillVar = Solid!
			     li_rtn = dw_1.GetDataStyle('gr_1',1,1,lf_FillVar)
			     ls_result += wf_result_add(ls_item, "('gr_1',1,1,lf_FillVar)",not  isnull(li_rtn) and li_rtn>0)
				  
			//    fillvariable为Diamond!

			    lf_FillVar = Diamond!
			    li_rtn = dw_1.GetDataStyle('gr_1',1,1,lf_FillVar)
			    ls_result += wf_result_add(ls_item, "('gr_1',1,1,lf_FillVar)",not  isnull(li_rtn) and li_rtn>0)
			
			// FillVariable参数为Null
			   
				SetNull(lf_FillVar)
			    li_rtn = dw_1.GetDataStyle('gr_1',1,1,lf_FillVar)
			    ls_result += wf_result_add(ls_item, "('gr_1',1,1,lf_FillVar)", not  isnull(li_rtn) and li_rtn>0)
				  
			//测试语法4
			
			//symbolvariable为NoSymbol!
			
			  lsy_SymbolVar = NoSymbol!
			  li_rtn = dw_1.GetDataStyle('gr_1',1,1,lsy_SymbolVar)
			  ls_result += wf_result_add(ls_item,"('gr_1',1,1,lsy_SymbolVar)" ,not  isnull(li_rtn) and li_rtn>0)
				
		//	symbolvariable为SymbolHollowBox!
		    
			 lsy_SymbolVar = SymbolHollowBox!
			li_rtn = dw_1.GetDataStyle('gr_1',1,1,lsy_SymbolVar)
			 ls_result += wf_result_add(ls_item,"('gr_1',1,1,lsy_SymbolVar)" ,not  isnull(li_rtn) and li_rtn>0)
			 
			 // symbolvariable参数为Null
			 SetNull(lsy_SymbolVar)
			li_rtn = dw_1.GetDataStyle('gr_1',1,1,lsy_SymbolVar)
			 ls_result += wf_result_add(ls_item,"('gr_1',1,1,lsy_SymbolVar)" ,not  isnull(li_rtn) and li_rtn>0)
			
			
		case lower("GetDataValue")
			dw_1.dataobject = 'dwgrfun1_d05_grid'
			dw_1.settransobject(sqlca)
			dw_1.Retrieve()
			
			//参数均为有效值
			
			li_rtn=dw_1.GetDataValue('gr_1',1,1,ld_Double)
		    ls_result += wf_result_add(ls_item, " ('gr_1',1,1,ld_Double)",not  isnull(li_rtn) and li_rtn>0)
			 
			 //测试GraphControl参数为无效值
			 
			 li_rtn=dw_1.GetDataValue('gr_2',1,1,ld_Double)
		    ls_result += wf_result_add(ls_item, " ('gr_2',1,1,ld_Double)",not  isnull(li_rtn) and li_rtn=-1)
			
			//测试GraphControl参数为Null
			setnull(ls_null)
			li_rtn=dw_1.GetDataValue(ls_null,1,1,ld_Double)
			 ls_result += wf_result_add(ls_item,"(ls_null,1,1,ld_Double)",isnull(li_rtn))
			 
			 //测试SeriesNumber参数为0
			 
			 li_rtn = dw_1.GetDataValue('gr_1',0,1,ld_Double)
			 ls_result += wf_result_add(ls_item, "('gr_1',0,1,ld_Double)",not  isnull(li_rtn) and li_rtn>0)
			 
			 //测试SeriesNumber参数大于Series个数
			 
			  li_rtn = dw_1.GetDataValue('gr_1',8,1,ld_Double)
			 ls_result += wf_result_add(ls_item, " ('gr_1',8,1,ld_Double)",not  isnull(li_rtn) and li_rtn>0)
			 
			 //测试SeriesNumber参数为Null
			 
			 setnull(li_null)
			 li_rtn = dw_1.GetDataValue('gr_1',li_null,1,ld_Double)
			 ls_result += wf_result_add(ls_item, "('gr_1',li_null,1,ld_Double)", isnull(li_rtn))
			
			//测试DataPoint 参数为0
			li_rtn = dw_1.GetDataValue('gr_1',1,0,ld_Double)
			ls_result += wf_result_add(ls_item, " ('gr_1',1,0,ld_Double)",not  isnull(li_rtn) and li_rtn>0)
			
			//测试DataPoint参数大于轴点个数
			
			li_rtn = dw_1.GetDataValue('gr_1',1,8,ld_Double)
			ls_result += wf_result_add(ls_item, " ('gr_1',1,8,ld_Double)",not  isnull(li_rtn) and li_rtn>0)
			
			// 测试DataPoint参数为Null
			
			setnull(li_null)
			 li_rtn = dw_1.GetDataValue('gr_1',1,li_null,ld_Double)
			 ls_result += wf_result_add(ls_item, "('gr_1',1,li_null,ld_Double)", isnull(li_rtn))
			 
			 //测试 grDataType为xValue!
			 
			 li_rtn = dw_1.GetDataValue('gr_1',1,1,ld_Double,xValue!)
			 ls_result += wf_result_add(ls_item, " ('gr_1',1,1,ld_Data,xValue!)",not  isnull(li_rtn) and li_rtn>0)
			 
			 //测试 grDataType为yValue!
			 
			  li_rtn = dw_1.GetDataValue('gr_1',1,1,ld_Double,yValue!)
			 ls_result += wf_result_add(ls_item, " ('gr_1',1,1,ld_Data,yValue!)",not  isnull(li_rtn) and li_rtn>0)
			
			//测试 grDataType为Null
			
			SetNull(lgr_DataType)
			li_rtn = dw_1.GetDataValue('gr_1',1,1,ld_Double,lgr_DataType)
		    ls_result += wf_result_add(ls_item, "('gr_1',1,1,ld_Double,lgr_DataType)", isnull(li_rtn))
			
			//测试datavariable参数使用Date类型
			
			li_rtn=dw_1.GetDataValue('gr_1',1,1,ld_date)
		    ls_result += wf_result_add(ls_item, "('gr_1',1,1,ld_date)",not  isnull(li_rtn) and li_rtn=-1)
			 
			 //测试datavariable参数使用Time类型
			 
			li_rtn=dw_1.GetDataValue('gr_1',1,1,lt_time)
		    ls_result += wf_result_add(ls_item, "('gr_1',1,1,lt_time)",not  isnull(li_rtn) and li_rtn=-1)
			 
			 //测试datavariable参数使用DateTime类型
			 
			 li_rtn=dw_1.GetDataValue('gr_1',1,1,ldt_datetime)
		    ls_result += wf_result_add(ls_item, "('gr_1',1,1,ldt_datetime)",not  isnull(li_rtn) and li_rtn=-1)
			 
			//测试datavariable参数使用String类型
			
			 li_rtn=dw_1.GetDataValue('gr_1',1,1,ls_temp)
		    ls_result += wf_result_add(ls_item, "('gr_1',1,1,ls_temp)",not  isnull(li_rtn) and li_rtn=-1)
			 
			 //  测试datavariable参数为Null
			 
			 setnull(ld_Double)
			 li_rtn=dw_1.GetDataValue('gr_1',1,1,ld_Double)
			ls_result += wf_result_add(ls_item, " ('gr_1',1,1,ld_Double)",isnull(li_rtn))
			
			
		case lower("GetSeriesStyle")
			dw_1.dataobject = 'dwgrfun1_d08_grid'
			dw_1.settransobject(sqlca)
			dw_1.Retrieve()
			
			// 测试语法1
			
			//所有参数均有效的返回值
			
			li_rtn= dw_1.GetSeriesStyle('gr_1','77',Background!, ll_ColorVar )
			ls_result += wf_result_add(ls_item, "('gr_1','77',Background!,ll_ColorVar )",not  isnull(li_rtn) and li_rtn>0)
			
			// graphcontrol参数无效
			
			li_rtn= dw_1.GetSeriesStyle('gr_2','77',Background!, ll_ColorVar )
			ls_result += wf_result_add(ls_item, "('gr_2','77',Background!, ll_ColorVar )",not  isnull(li_rtn) and li_rtn=-1)
			
			//graphcontrol参数为Null
			
			  setnull(ls_gra)
			  li_rtn= dw_1.GetSeriesStyle(ls_gra,'77',Background!, ll_ColorVar )
			  ls_result += wf_result_add(ls_item, "(ls_gra,'77',Background!,ll_ColorVar )", isnull(li_rtn))
			  
			  //seriesname参数为无效的Series名
			  
			  li_rtn = dw_1.GetSeriesStyle('gr_1','Q1',Background!,ll_ColorVar)
		      ls_result += wf_result_add(ls_item, "('gr_1','Q1',Background!,ll_ColorVar)",not  isnull(li_rtn) and li_rtn=-1)
			
			//SeriesName参数为Null
			
			setnull(ls_null)
			li_rtn = dw_1.GetSeriesStyle('gr_1',ls_null,Background!,ll_ColorVar)
		    ls_result += wf_result_add(ls_item, "('gr_1',ls_null,Background!,ll_ColorVar)", isnull(li_rtn))
			 
			 //colortype为Foreground!
			
			li_rtn= dw_1.GetSeriesStyle('gr_1','77',Foreground!, ll_ColorVar )
			ls_result += wf_result_add(ls_item, "('gr_1','77',Foreground!, ll_ColorVar )",not  isnull(li_rtn) and li_rtn>0)
			 
			// colortype为Null
			
			setnull(lgr_CoType)
			li_rtn= dw_1.GetSeriesStyle('gr_1','77',lgr_CoType,ll_ColorVar)
			ls_result += wf_result_add(ls_item, "('gr_1','77',lgr_CoType,ll_ColorVar)", isnull(li_rtn))
			
			//colorvariable参数为Null
			
			setnull(ll_ColorVar)			
			li_rtn= dw_1.GetSeriesStyle('gr_1','77',Background!,ll_ColorVar)	//1
			ls_result += wf_result_add(ls_item, "('gr_1','77',lgr_CoType,ll_ColorVar)", isnull(li_rtn))
			
			
//			dw_1.dataobject = 'dwgrfun1_d02_grid'
//			dw_1.settransobject(sqlca)
//			dw_1.Retrieve()
			
			
			
//		case lower("")
			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null,ls_rtn
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname,ls_SavePath
integer 		li_rtn, li_col,li_null
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data

SaveAsType	lsa_SaveType
Boolean	lb_ColHead
grColorType	lgr_ColorType

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)
is_type = ""			

//ls_array[Upperbound(ls_array) + 1 ] = "testcasepoint_example1"			//edit you test case point name
//ls_array[Upperbound(ls_array) + 1 ] = "ObjectAtPointor"
//ls_array[Upperbound(ls_array) + 1 ] = "Reset"
ls_array[Upperbound(ls_array) + 1 ] = "ResetDataColors"
ls_array[Upperbound(ls_array) + 1 ] ="SeriesCount"
ls_array[Upperbound(ls_array) + 1 ] ="SeriesName"
ls_array[Upperbound(ls_array) + 1 ] = "SaveAs"
ls_array[Upperbound(ls_array) + 1 ] = "SetDataPieExplode"
ls_array[Upperbound(ls_array) + 1 ] ="SetDataStyle"
ls_array[Upperbound(ls_array) + 1 ] ="SetSeriesStyle"


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
//		case lower("testcasepoint_example1")	
			//			... your test case code...
			//	ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
//		case lower("ObjectAtPointor")		
//		case lower("Reset")


         case lower("ResetDataColors")
			dw_1.dataobject='dwgrfun1_d03_grid'
			dw_1.settransobject(sqlca)
			dw_1.retrieve( )
			
//			  测试所有参数均有效的返回值
			li_rtn= dw_1.ResetDataColors('gr_1',1,1)
			ls_result += wf_result_add(ls_item, "('gr_1',1,1) ", not isnull(li_rtn) and li_rtn = 1)
			
//		    测试无效的graphcontrol参数
			li_rtn= dw_1.ResetDataColors('gr_2',1,1)
			ls_result += wf_result_add(ls_item, "('gr_2',1,1) ", not isnull(li_rtn) and li_rtn = -1)
			
//			测试graphcontrol参数为Null
			SetNull(ls_null)
			li_rtn = dw_1.ResetDataColors (ls_null,1,1)       
			ls_result += wf_result_add(ls_item, " (ls_null,1,1) ", isnull(li_rtn) )
			
//			测试无效的SeriesNumber参数
			li_rtn= dw_1.ResetDataColors('gr_1',0,1)
			ls_result += wf_result_add(ls_item, "('gr_1',0,1) ", not isnull(li_rtn) and li_rtn = -1)
			
//			测试SeriesNumber参数为Null
			SetNull(li_null)
			li_rtn= dw_1.ResetDataColors('gr_1',li_null,1)
			ls_result += wf_result_add(ls_item, " ('gr_1',li_null,1) ", isnull(li_rtn) )
			
//			测试DataPointerNumber参数值为红色
			 ll_tmp = RGB(255,0,0)
			 li_rtn= dw_1.ResetDataColors('gr_1',1,ll_tmp)
			 ls_result += wf_result_add(ls_item, "('gr_1',1,ll_tmp) ", not isnull(li_rtn) and li_rtn = -1)

			
//			 测试DataPointerNumber参数值为Null
			 SetNull(ll_null)
			 li_rtn= dw_1.ResetDataColors('gr_1',1,ll_null)
			ls_result += wf_result_add(ls_item, " ('gr_1',1,ll_null) ", isnull(li_rtn) )
			
		case lower("SeriesCount")	
			  
		    dw_1.dataobject='dwgrfun1_d02_grid'
			dw_1.settransobject(sqlca)
			dw_1.retrieve( )
			
//			  测试参数有效的返回值
			  li_rtn=dw_1.SeriesCount('gr_1')
			  ls_result += wf_result_add(ls_item, "('gr_1') ", not isnull(li_rtn) and li_rtn >0)
			  
//			   测试使用无效的graphcontrol参数的返回值
			    li_rtn=dw_1.SeriesCount('gr_2')	
			    ls_result += wf_result_add(ls_item, "('gr_2') ", not isnull(li_rtn) and li_rtn =-1)
				 
//			  测试graphcontrol参数为Null
			     setnull(ls_null)
				 li_rtn=dw_1.SeriesCount(ls_null)	 
				 ls_result += wf_result_add(ls_item, "(ls_null) ", isnull(li_rtn))
				 
				 
		 case lower("SeriesName")	
			dw_1.dataobject='dwgrfun1_d03_grid'
			dw_1.settransobject(sqlca)
			dw_1.retrieve( )
			
//			测试所有参数均有效的返回值
			ls_rtn=dw_1.SeriesName('gr_1',1)
			ls_result += wf_result_add(ls_item, "('gr_1',1) ", not isnull(ls_rtn))
			
//			 测试使用无效的graphcontrol参数
			 ls_rtn=dw_1.SeriesName('gr_2',1)
			 ls_result += wf_result_add(ls_item, "('gr_2',1) ", ls_rtn="")
			 
//			 测试graphcontrol参数为Null
			 setnull(ls_null)
			 ls_rtn=dw_1.SeriesName(ls_null,1)
			 ls_result += wf_result_add(ls_item,"(ls_null,1)",isnull(ls_rtn))
			 
//			 测试使用无效的seriesnumber参数
			 ls_rtn=dw_1.SeriesName('gr_1',0)
			 ls_result += wf_result_add(ls_item,"('gr_1',0)",ls_rtn="")
			 
//			 测试seriesnumber参数为Null
			 setnull(li_null)
			 ls_rtn=dw_1.SeriesName('gr_1',li_null)
			 ls_result += wf_result_add(ls_item,"('gr_1',li_null)",isnull(ls_rtn))
			 
		case lower("SaveAs")	 
			
			dw_1.dataobject='dwgrfun1_d01_grid'
			dw_1.settransobject(sqlca)
			dw_1.retrieve( )
			
			is_type = "PrintCancel"
			yield()
			timer(1)
			
           //保存文件用到的变量 ls_file, ls_fullname,gs_cachedir, gs_dirseparator
//			is_ResourcePath = 'C:\'
			
//			测试所有参数均有效的返回值
             
              ls_file="dw_graph_txt_P01.txt"
			ls_fullname=gs_cachedir+gs_dirseparator+ls_file	  
//			ls_SavePath = is_ResourcePath + "dw_graph_txt_P01.txt"
			li_rtn=dw_1.SaveAs('gr_1',ls_fullname,Text!,true)
			ls_result += wf_result_add(ls_item,"1.('gr_1',ls_fullname,Text!,true)",not isnull(li_rtn) and li_rtn=1)
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			
//			测试所有参数均有效的返回值
			
//			ls_SavePath = is_ResourcePath + "P02.xls"
			ls_file="dw_graph_xls_P02.xls"
			ls_fullname=gs_cachedir+gs_dirseparator+ls_file
			li_rtn=dw_1.SaveAs('gr_1',ls_fullname,Excel!,false)
			ls_result += wf_result_add(ls_item,"2.('gr_1',ls_fullname,Excel!,false)",not isnull(li_rtn) and li_rtn=1)
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			
//			FileName目录不存在
			
//			if DirectoryExists("C:\grfunw23p03") then
//				RemoveDirectory("C:\grfunw23p03")
//			end if
//           ls_SavePath = "C:\grfunw23p03\P03.txt"

			if DirectoryExists("gs_cachedir+gs_dirseparator") then
				RemoveDirectory("gs_cachedir+gs_dirseparator")
			end if
			ls_file="dw_graph_txt_P03.txt"
			ls_fullname=gs_cachedir+gs_dirseparator+ls_file
			li_rtn=dw_1.SaveAs('gr_1',ls_fullname,Text!,false)
			ls_result += wf_result_add(ls_item,"3.('gr_1',ls_fullname,Text!,false)",not isnull(li_rtn) and li_rtn=1)
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			
//			 FileName参数为空字符("")
//			ls_SavePath = is_ResourcePath + "P04.txt"
			ls_file="dw_graph_txt_P04.txt"
			ls_fullname=gs_cachedir+gs_dirseparator+ls_file
			li_rtn=dw_1.SaveAs('gr_1','',Text!,false)
			ls_result += wf_result_add(ls_item,"4.('gr_1','',Text!,false)",not isnull(li_rtn) and li_rtn=1)
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)	
			
//			 FileName参数为Null
			 setnull(ls_null)
			 li_rtn=dw_1.SaveAs('gr_1',ls_null,Text!,false)
			 ls_result += wf_result_add(ls_item,"5.('gr_1',ls_null,Text!,false)", isnull(li_rtn))
			 if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			 
//			 SaveAsType参数为非Text!
//			ls_SavePath = is_ResourcePath + "P06.txt"
			ls_file="dw_graph_txt_P06.txt"
			ls_fullname=gs_cachedir+gs_dirseparator+ls_file
			li_rtn=dw_1.SaveAs('gr_1',ls_SavePath,CSV!,true)
			ls_result += wf_result_add(ls_item,"6.('gr_1',ls_fullname,CSV!,true)",not isnull(li_rtn) and li_rtn=1)
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			
//			 SaveAsType参数为Null
			 SetNull(lsa_SaveType)
//			 ls_SavePath = is_ResourcePath + "P07.txt"
			 ls_file="dw_graph_txt_P07.txt"
			 ls_fullname=gs_cachedir+gs_dirseparator+ls_file
			 li_rtn=dw_1.SaveAs('gr_1',ls_SavePath,lsa_SaveType,true)
			 ls_result += wf_result_add(ls_item,"7.('gr_1',ls_fullname,lsa_SaveType,true)", isnull(li_rtn))
			 if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			 
//			 测试colheading 参数的值为false
//			 ls_SavePath = is_ResourcePath + "P08.txt"
			 ls_file="dw_graph_txt_P08.txt"
			 ls_fullname=gs_cachedir+gs_dirseparator+ls_file
			 li_rtn=dw_1.SaveAs('gr_1',ls_SavePath,text!,false)
			 ls_result += wf_result_add(ls_item,"8.('gr_1', ls_fullname,text!,false)",not isnull(li_rtn) and li_rtn=1)
			 if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			 
//			 测试colheading 参数的值为Null
			 SetNull(lb_ColHead)
//			 ls_SavePath = is_ResourcePath + "P09.txt"
			 ls_file="dw_graph_txt_P09.txt"
			 ls_fullname=gs_cachedir+gs_dirseparator+ls_file
			 li_rtn=dw_1.SaveAs('gr_1',ls_fullname,text!,lb_ColHead)
			 ls_result += wf_result_add(ls_item,"9.('gr_1',ls_fullname,text!,lb_ColHead)", isnull(li_rtn))
			 if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			 
//			 GraphControl参数无效
//			 ls_SavePath = is_ResourcePath + "P10.txt"
			 ls_file="dw_graph_txt_P10.txt"
			 ls_fullname=gs_cachedir+gs_dirseparator+ls_file
		     li_rtn=dw_1.SaveAs('gr_2',ls_fullname,Text!,true)
		     ls_result += wf_result_add(ls_item,"10.('gr_2',ls_fullname,Text!,true)",not isnull(li_rtn) and li_rtn=-1) 
			 if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			 
//			GraphControl参数为Null
			setnull(ls_null)
//			ls_SavePath = is_ResourcePath + "P11.txt"
			ls_file="dw_graph_txt_P11.txt"
		     ls_fullname=gs_cachedir+gs_dirseparator+ls_file
			li_rtn=dw_1.SaveAs(ls_null, ls_fullname,Text!,true)
			ls_result += wf_result_add(ls_item,"11.(ls_null, ls_fullname,Text!,true)", isnull(li_rtn))
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)
			  
//			 Graph控件本身没有数据
			dw_1.reset()
//			ls_SavePath = is_ResourcePath + "P12.txt"
			ls_file="dw_graph_txt_P12.txt"
		     ls_fullname=gs_cachedir+gs_dirseparator+ls_file
			li_rtn=dw_1.SaveAs('gr_1', ls_fullname,Text!,true)
			ls_result += wf_result_add(ls_item,"12.('gr_1', ls_fullname,Text!,true)",not isnull(li_rtn) and li_rtn=1) 
			if   FileExists(ls_fullname) then FileDelete(ls_fullname)
		    dw_1.Retrieve()
			 
			is_type = ""			
			 
	case lower( "SetDataPieExplode")
		    
			dw_1.dataobject= 'dwgrfun1_d04_grid'
			dw_1.settransobject(sqlca)
			dw_1.retrieve( )
		
//		测试所有参数均有效的返回值
		     
	 		li_rtn=dw_1.SetDataPieExplode('gr_1',2,1,80)	//-1
			ls_result += wf_result_add(ls_item,"('gr_1',2,1,80)",not isnull(li_rtn) and li_rtn=1) 
			
//			 测试使用无效的graphcontrol参数的返回值
			 li_rtn=dw_1.SetDataPieExplode('gr_2',2,1,80)
			 ls_result += wf_result_add(ls_item,"('gr_2',2,1,80)",not isnull(li_rtn) and li_rtn=-1) 
			
//			测试graphcontrol参数为Null
			setnull(ls_null)
			li_rtn=dw_1.SetDataPieExplode(ls_null,2,1,80)
			ls_result += wf_result_add(ls_item,"(ls_null,2,1,80)",isnull(li_rtn))
			
//			测试无效的seriesnumber参数
			li_rtn=dw_1.SetDataPieExplode('gr_1',0,1,80)
			ls_result += wf_result_add(ls_item,"('gr_1',0,1,80)",not isnull(li_rtn) and li_rtn=-1) 
			
//			测试seriesnumber为Null
			setnull(li_null)
			li_rtn=dw_1.SetDataPieExplode('gr_1',li_null,1,80)
			ls_result += wf_result_add(ls_item,"('gr_1',li_null,1,80)",isnull(li_rtn))
			
//			测试无效的DataPoint参数
			li_rtn=dw_1.SetDataPieExplode('gr_1',2,9,80)
			ls_result += wf_result_add(ls_item,"('gr_1',2,9,80)",not isnull(li_rtn) and li_rtn=-1) 
			
//			测试DataPoint为Null
			setnull(li_null)
			li_rtn=dw_1.SetDataPieExplode('gr_1',2,li_null,80)
			ls_result += wf_result_add(ls_item,"('gr_1',2,li_null,80)",isnull(li_rtn))
			
//			设置无效的Percentage 参数
			li_rtn=dw_1.SetDataPieExplode('gr_1',2,1,200)
			ls_result += wf_result_add(ls_item,"('gr_1',2,1,200)",not isnull(li_rtn) and li_rtn=-1) 
			
//			测试Percentage为Null
			setnull(li_null)
			li_rtn=dw_1.SetDataPieExplode('gr_1',2,1,li_null)
			ls_result += wf_result_add(ls_item,"('gr_1',2,1,li_null)",isnull(li_rtn))
			
//		    测试GraphType使用非Pie类型

			dw_1.dataobject= 'dwgrfun1_d01_grid'
			dw_1.settransobject(sqlca)
			dw_1.retrieve( )
			
			li_rtn=dw_1.SetDataPieExplode('gr_1',2,1,80)	//-1
			ls_result += wf_result_add(ls_item,"('gr_1',2,1,80)",not isnull(li_rtn) and li_rtn=1)
			  
			
		case lower("SetDataStyle")
			
//			测试语法1:integer dwcontrol.SetDataStyle ( string graphcontrol, integer seriesnumber, integer datapointnumber, grColorType colortype, long color )
			
			dw_1.dataobject= 'dwgrfun1_d09_grid'
			dw_1.settransobject(sqlca)
			dw_1.retrieve( )
			
//			测试所有参数均有效的返回值
			li_rtn=dw_1.SetDataStyle('gr_1',1,1,Background!,128)
			ls_result += wf_result_add(ls_item,"('gr_1',1,1,Background!,128)",not isnull(li_rtn) and li_rtn=1)
			
//			测试使用无效的graphcontrol参数
			li_rtn=dw_1.SetDataStyle('gr_2',1,1,Background!,128)
			ls_result += wf_result_add(ls_item,"('gr_2',1,1,Background!,128)",not isnull(li_rtn) and li_rtn=-1)
			
//			graphcontrol参数为Null
			setnull(ls_null)
			li_rtn=dw_1.SetDataStyle(ls_null,1,1,Background!,128)
			ls_result += wf_result_add(ls_item,"(ls_null,1,1,Background!,128)",isnull(li_rtn))
			
//			测试使用无效的seriesnumber参数
			li_rtn=dw_1.SetDataStyle('gr_1',0,1,Background!,128)
			ls_result += wf_result_add(ls_item,"('gr_1',0,1,Background!,128)",not isnull(li_rtn) and li_rtn=-1)
			
//			seriesnumber参数为Null
			setnull(li_null)
			li_rtn=dw_1.SetDataStyle('gr_1',li_null,1,Background!,128)
			ls_result += wf_result_add(ls_item,"('gr_1',li_null,1,Background!,128)",isnull(li_rtn))
			
//			测试使用无效的datapointnumber参数
			li_rtn=dw_1.SetDataStyle('gr_1',1,9,Background!,128)
			ls_result += wf_result_add(ls_item,"('gr_1',1,9,Background!,128)",not isnull(li_rtn) and li_rtn=-1)
			
//			datapointnumber参数为Null
			setnull(li_null)
			li_rtn=dw_1.SetDataStyle('gr_1',1,li_null,Background!,128)
			ls_result += wf_result_add(ls_item,"('gr_1',1,li_null,Background!,128)",isnull(li_rtn))
			
//			colortype使用Shade!
             lgr_ColorType = Shade!        
			li_rtn=dw_1.SetDataStyle('gr_1',4,1,lgr_ColorType,128)	//-1
			ls_result += wf_result_add(ls_item,"('gr_1',4,1,lgr_ColorType,128)",not isnull(li_rtn) and li_rtn=1)
			
//			colortype为Null
             SetNull(lgr_ColorType)
			li_rtn=dw_1.SetDataStyle('gr_1',4,1,lgr_ColorType,128)
			ls_result += wf_result_add(ls_item,"('gr_1',4,1,lgr_ColorType,128)",isnull(li_rtn))
			
			
		case lower("SetSeriesStyle")	
			
//			测试语法1:integer dwcontrol.SetSeriesStyle ( string graphcontrol, string seriesname, grColorType colortype, long color )

			dw_1.dataobject= 'dwgrfun1_d07_grid'
			dw_1.settransobject(sqlca)
			dw_1.retrieve( )
			 
 //			测试所有参数均有效的返回值
			 
			 li_rtn=dw_1.SetSeriesStyle('gr_1','55',Foreground!,128)	//-1
			 ls_result +=wf_result_add(ls_item,"('gr_1','55',Foreground!,128)",not isnull(li_rtn) and li_rtn=1)
			 
//			 测试使用无效的graphcontrol参数
			 li_rtn=dw_1.SetSeriesStyle('gr_2','55',Foreground!,128)
			 ls_result +=wf_result_add(ls_item,"('gr_2','55',Foreground!,128)",not isnull(li_rtn) and li_rtn=-1)
			 
//			 测试graphcontrol参数为Null
			 setnull(ls_null)
			 li_rtn=dw_1.SetSeriesStyle(ls_null,'55',Foreground!,128)
			 ls_result +=wf_result_add(ls_item,"(ls_null,'55',Foreground!,128)",isnull(li_rtn))
			 
//			 测试使用无效的seriesname参数
			 li_rtn=dw_1.SetSeriesStyle('gr_1','88',Foreground!,128)
			 ls_result +=wf_result_add(ls_item,"('gr_1','88',Foreground!,128)",not isnull(li_rtn) and li_rtn=-1)
			 
//			 测试seriesname参数为NUll
			 setnull(ls_null)
			 li_rtn=dw_1.SetSeriesStyle('gr_1',ls_null,Foreground!,128)
			 ls_result +=wf_result_add(ls_item,"('gr_1',ls_null,Foreground!,128)",isnull(li_rtn))
			 
//			 测试colortype为Null
			 setnull(	lgr_ColorType)
			  li_rtn=dw_1.SetSeriesStyle('gr_1','55',lgr_ColorType,128)
			  ls_result +=wf_result_add(ls_item,"('gr_1','55',lgr_ColorType,128)",isnull(li_rtn))
			  
//			  测试color为Null
               setnull( ll_tmp)
			  li_rtn=dw_1.SetSeriesStyle('gr_1','55',Foreground!,ll_tmp)
			  ls_result +=wf_result_add(ls_item,"('gr_1','55',Foreground!,ll_tmp)",isnull(li_rtn))

	
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_pb_graphdw.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
end on

on w_pb_graphdw.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event timer;call super::timer;if lower(is_type) = lower("PrintCancel") then 
	wf_closepopwindow( "Save Graph Data As", 'Cancel')			//for win10 print machine
end if 
end event

type cb_2 from commandbutton within w_pb_graphdw
integer x = 169
integer y = 416
integer width = 901
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Execute Graphdw GroupCD"
end type

event clicked;of_testcase_point_module1()

end event

type cb_1 from commandbutton within w_pb_graphdw
integer x = 174
integer y = 128
integer width = 901
integer height = 132
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Execute Graphdw GroupAB"
end type

event clicked;of_testcase_point_module()
end event

type dw_1 from datawindow within w_pb_graphdw
integer x = 1216
integer y = 64
integer width = 3173
integer height = 2216
integer taborder = 10
string title = "none"
string dataobject = "dwgrfnu1_clipboard"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

