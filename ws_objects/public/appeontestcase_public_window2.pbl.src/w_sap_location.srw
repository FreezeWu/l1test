$PBExportHeader$w_sap_location.srw
forward
global type w_sap_location from w_base_case
end type
type em_datetime from editmask within w_sap_location
end type
type em_1 from editmask within w_sap_location
end type
type em_date from editmask within w_sap_location
end type
type ole_2 from olecontrol within w_sap_location
end type
type ole_1 from olecontrol within w_sap_location
end type
type dw_1 from datawindow within w_sap_location
end type
type rte_1 from richtextedit within w_sap_location
end type
type cb_1 from commandbutton within w_sap_location
end type
type cb_rte from commandbutton within w_sap_location
end type
end forward

global type w_sap_location from w_base_case
integer width = 3136
integer height = 1996
string title = "localization"
em_datetime em_datetime
em_1 em_1
em_date em_date
ole_2 ole_2
ole_1 ole_1
dw_1 dw_1
rte_1 rte_1
cb_1 cb_1
cb_rte cb_rte
end type
global w_sap_location w_sap_location

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: of_testcase_point_module
//------------------------------------------------------------------------------
// Description:
//
//------------------------------------------------------------------------------
// Arguments:
//
//------------------------------------------------------------------------------
// Returns:  (None)
//
//------------------------------------------------------------------------------
// Author:         Mark            Date: 2017-03
//------------------------------------------------------------------------------
// Revision History:
//                                       1.0   Initial version
//==============================================================================
string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_temp3, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position,ll_rtn,ll_file,rtncode
string 		ls_path, ls_file, ls_fullname
integer 		li_rtn, li_col,li_1
boolean		lbn_flag 
Date			ld_date,date1,date2
Datetime		ldt_datetime
time			lt_time
Decimal		ldc_data
double        ldb_d1,ldb_d2
string 		ls_date1, ls_date2, ls_date3, ls_date4, ls_date5, ls_date6, ls_date7,ls_date8, ls_date9, ls_date10, ls_date11, ls_date12, ls_res
long			rowsretrieved,red, blue,custom[ ]
integer 		li_FileNum,i_color

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "FileRead"			                           //测试RTE control文本读取功能
ls_array[Upperbound(ls_array) + 1 ] = "RTE DataWindow Retrieve"			//测试RTE datawindow retrieve功能
ls_array[Upperbound(ls_array) + 1 ] = "Grid DataWindow Retrieve"			//测试grid datawindow retrieve功能
ls_array[Upperbound(ls_array) + 1 ] = "OLE InsertObject"                         //测试ole控件的对象插入功能
ls_array[Upperbound(ls_array) + 1 ] = "OLE Paste Object"                         //测试ole控件的插入剪贴板对象功能
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow Qsort"                       //测试datawindow 快速排序功能
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow CrosstabDialog"         //测试datawindow CrosstabDialog功能
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 1. SetFilter"               //测试datawindow设置筛选条件功能
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 2. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 3. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 4. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 5. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 6. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 7. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 8. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 9. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 10. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 11. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 12. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 13. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 14. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 15. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 16. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 17. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 18. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 19. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "DataWindow 20. SetFilter"
ls_array[Upperbound(ls_array) + 1 ] = "1. EditMask Control"                      //测试EditMask控件
ls_array[Upperbound(ls_array) + 1 ] = "2. EditMask Control"
ls_array[Upperbound(ls_array) + 1 ] = "3. EditMask Control"
ls_array[Upperbound(ls_array) + 1 ] = "1. Day Names"                              //测试日期函数
ls_array[Upperbound(ls_array) + 1 ] = "2. Day Names"
ls_array[Upperbound(ls_array) + 1 ] = "DW Retrieval Criteria"                    //测试datawindow设置检索条件
ls_array[Upperbound(ls_array) + 1 ] = "DW Sort"                                      //测试datawindow排序
ls_array[Upperbound(ls_array) + 1 ] = "OLE UpdateLinksDialog"                  //测试OLE对象UpdateLinksDialog功能
ls_array[Upperbound(ls_array) + 1 ] = "DW Print Preview"                         //测试datawindow打印预览
ls_array[Upperbound(ls_array) + 1 ] = "Month Names"                              //测试月份名字格式
ls_array[Upperbound(ls_array) + 1 ] = "Prompt for Criteria"                       //测试datawindow检索条件提示
ls_array[Upperbound(ls_array) + 1 ] = "DW SaveAS"                                 //测试datawindow saveas功能
ls_array[Upperbound(ls_array) + 1 ] = "DW Import File"                            //测试datawindow 导入文件数据功能
ls_array[Upperbound(ls_array) + 1 ] = "DBMS Error1"                               //测试DBMS异常提示
ls_array[Upperbound(ls_array) + 1 ] = "DBMS Error2"
ls_array[Upperbound(ls_array) + 1 ] = "DBMS Error3"
ls_array[Upperbound(ls_array) + 1 ] = "DBMS Error4"
ls_array[Upperbound(ls_array) + 1 ] = "Runtime Error"                              //测试runtime异常提示
ls_array[Upperbound(ls_array) + 1 ] = "Control Accessability"                     //测试控件设置accessability功能
ls_array[Upperbound(ls_array) + 1 ] = "Choose Color"                               //测试自定义颜色选择
ls_array[Upperbound(ls_array) + 1 ] = "Folder Dialog"                               //测试文件夹管理器




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
	is_type = ''
	choose case lower(ls_item)
		case lower("FileRead")
			ls_path = gs_cachedir			
			ls_file = "ImportFile.txt"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ "ImportFile.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " ImportFile.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if	
			ll_rtn = rte_1.insertdocument(ls_fullname, True,FileTypeText!)			
			rte_1.selecttextAll()
			rte_1.copy()
			ls_temp3 = Clipboard()
			ls_temp=mid(ls_temp3,1,5)
			ls_temp2 = "Jones"
			if match(ls_temp,ls_temp2) = TRUE then
				li_rtn = 1
			end if	  
			
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("RTE DataWindow Retrieve")			
             dw_1.dataobject = "d_rte"
             dw_1.settransobject(sqlca)
             dw_1.retrieve()
			ls_temp=dw_1.object.datawindow.data
			ls_temp2=mid(ls_temp,1,4)			
			if match(ls_temp2,"Jane") = TRUE then
				li_rtn = 1
			end if			
		
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("Grid DataWindow Retrieve")			
             dw_1.dataobject = "d_dummy"
		    dw_1.settransobject(sqlca)
             dw_1.Retrieve()
			ls_temp=dw_1.object.datawindow.data
			ls_temp2=mid(ls_temp,1,3)			
			if match(ls_temp2,"101") = TRUE then
				li_rtn = 1
			end if
			
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("OLE InsertObject")			
			is_type= "OLE"
			timer(1)                                   //插入空白对象
			ll_tmp = ole_1.insertobject()			
			
			ls_result += wf_result_add(ls_item, " ", not isnull(ll_tmp) and ll_tmp = 0)
			
		case lower("OLE Paste Object")	
			ls_path = gs_cachedir			
			ls_file = "ImportFile.txt"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ "ImportFile.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " ImportFile.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if
			
			ole_2.copy()
			is_type= "OLE"
			timer(1)
			rtncode = ole_1.pastespecial()		             //将ImportFile.txt复制到剪贴板
			
			ls_result += wf_result_add(ls_item, " ", not isnull(rtncode) and rtncode = 0)
			
		case lower("DataWindow Qsort")			
             dw_1.dataobject = "d_default"
             dw_1.settransobject(sqlca)             
		    dw_1.retrieve()
		    dw_1.Object.DataWindow.QueryMode='No'
			ls_temp=dw_1.object.datawindow.data
			ls_temp2=mid(ls_temp,1,3)			
			if match(ls_temp2,"100") = TRUE then
				li_rtn = 1
			end if			
			
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
		case lower("DataWindow CrosstabDialog")
             dw_1.dataobject = "d_crosstab"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    is_type= "OLE"
			timer(1)
			li_1 = dw_1.CrossTabDialog()			
			
			ls_result += wf_result_add(ls_item, " ", not isnull(li_1) and li_1 = 1)
			
		case lower("DataWindow 1. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "dept_id   >= 300")                 //filter case1:显示dept_id大于或等于300的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)			 
		
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "300")
			
		case lower("DataWindow 2. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "abs(dept_id)  = 500")            //filter case2:显示dept_id的绝对值为500的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)			 
			
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "500")
			
		case lower("DataWindow 3. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "ceiling(dept_id)  = 200")         //filter case3:显示dept_id的最小取整值为200的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)			 
			
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "200")
			
		case lower("DataWindow 4. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "getrow() >= 4")                     //filter case4:显示行号大于或等于4的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)			 
			
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "400")
			
		case lower("DataWindow 5. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "dec(dept_name) = 100")           //filter case5:显示dept_name的decimal值等于100的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)			 
		
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "")
			
		case lower("DataWindow 6. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "left(dept_name,7) = 'support'")           //filter case6:显示dept_name的头7个字符等于"support"的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)			 
	
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "666")
			
		case lower("DataWindow 7. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "len(dept_name) = 5")           //filter case7:显示dept_name的字符串长度等于5的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)			 
		
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "100")
			
		case lower("DataWindow 8. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "long(dept_name) = 666")           //filter case8:显示dept_name的long等于666的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)			 

			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "505")
			
		case lower("DataWindow 9. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "lookupdisplay(dept_name) = 'Sales'")           //filter case9:显示dept_name的display值等于Sales的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)	

			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "200")
			
		case lower("DataWindow 10. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "lower(dept_name) = 'r & d'")           //filter case10:显示dept_name的字符取小写值等于r & d的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)

			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "100")
			
		case lower("DataWindow 11. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "mid(dept_name,2,4) = 'uppo'")           //filter case11:显示dept_name的字符取子串值等于uppo的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)

			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "666")
			
		case lower("DataWindow 12. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "mod(dept_id,10) = 5")           //filter case12:显示dept_id的取余值等于5的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)

			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "505")
			
		case lower("DataWindow 13. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "number(dept_name) = 666")           //filter case13:显示dept_name的number值等于666的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)

			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "505")
			
		case lower("DataWindow 14. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "page() = 1")           //filter case14:显示第一页所有的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)

			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "100")
			
		case lower("DataWindow 15. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "pageabs() = 1")           //filter case15:显示页码绝对值为1的所有的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)

			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "100")
			
		case lower("DataWindow 16. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "pos(dept_name,'a') = 2")           //filter case16:显示dept_name的第二个字符为a的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)

			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "200")
			
		case lower("DataWindow 17. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "isnull(dept_head_id)")           //filter case17:显示dept_head_id为空值的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)

			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "800")
			
		case lower("DataWindow 18. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "right(dept_name,4)='ding'")           //filter case18:显示dept_name以ding结尾的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)

			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "800")
			
		case lower("DataWindow 19. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "round(dept_id,2)=100.00")           //filter case19:显示dept_id保留两位小数后值为100.00的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)
			 
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "100")
			
		case lower("DataWindow 20. SetFilter")
			ls_temp=''
			ls_temp2=''
             dw_1.dataobject = "d_default"
             dw_1.SetTransObject(SQLCA)
             dw_1.retrieve()
		    dw_1.setfilter( "sqrt(dept_id)=20")           //filter case20:显示dept_id开方后为20的dept
		    dw_1.filter()
		    ls_temp = dw_1.object.datawindow.data	
		    ls_temp2=mid(ls_temp,1,3)

			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2 = "400")
			
		case lower("1. EditMask Control")			
			this.em_date.text=string(today(),'dd-mmm-yy')
			em_date.getdata(date1)
			date2=today()
	
			ls_result += wf_result_add(ls_item, " ", not isnull(date1) and date1 = date2)
			
		case lower("2. EditMask Control")			
			this.em_1.text='666.66'
			em_1.getdata(ldb_d1)
			ldb_d2=666.66	
			ls_result += wf_result_add(ls_item, " ", not isnull(ldb_d1) and ldb_d1 = ldb_d2)
			
		case lower("3. EditMask Control")			
			this.em_datetime.text='25/MAR/17 11:29:17'
			em_datetime.getdata(ldt_datetime)
			date1=date(ldt_datetime)
			lt_time=time(ldt_datetime)	
			ls_result += wf_result_add(ls_item, " ", not isnull(ldt_datetime) and year(date1)=2017 and month(date1)=3 and day(date1)=25 and string(lt_time)='11:29:17')
			
		case lower("1. Day Names")			
			dw_1.dataobject = "d_dates"
			ls_date1 = String(2000-01-01, "DDD")
			ls_date2 = String(2000-01-02, "DDD")
			ls_date3 = String(2000-01-03, "DDD")
			ls_date4 = String(2000-01-04, "DDD")
			ls_date5 = String(2000-01-05, "DDD")
			ls_date6 = String(2000-01-06, "DDD")
			ls_date7 = String(2000-01-07, "DDD")
			ls_res = ls_date1 + " - " + ls_date2 + " - " +ls_date3 + " - " +ls_date4 + " - " +ls_date5 + " - " +ls_date6 + " - " +ls_date7
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_res) and ls_res='Sat - Sun - Mon - Tue - Wed - Thu - Fri')
			
		case lower("2. Day Names")
			setnull(ls_res)
			ls_date1 = DayName(2000-01-01)
			ls_date2 = DayName(2000-01-02)
			ls_date3 = DayName(2000-01-03)
			ls_date4 = DayName(2000-01-04)
			ls_date5 = DayName(2000-01-05)
			ls_date6 = DayName(2000-01-06)
			ls_date7 = DayName(2000-01-07)
			ls_res = ls_date1 + " - " + ls_date2 + " - " +ls_date3 + " - " +ls_date4 + " - " +ls_date5 + " - " +ls_date6 + " - " +ls_date7
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_res) and ls_res='Saturday - Sunday - Monday - Tuesday - Wednesday - Thursday - Friday')
			
		case lower("DW Retrieval Criteria")
			
			dw_1.dataobject = "d_retrieval"
			dw_1.SetTransObject(SQLCA)
			rowsretrieved = dw_1.retrieve(500)
			ls_result += wf_result_add(ls_item, " ", not isnull(rowsretrieved) and rowsretrieved = 9)
			
		case lower("DW Sort")
			ls_temp=''
			ls_temp2=''
			dw_1.Dataobject = "d_default"
			dw_1.SetTransObject(SQLCA)
			dw_1.Retrieve()
			dw_1.setsort('dept_name')
			dw_1.sort()
			ls_temp = dw_1.object.datawindow.data	
			ls_temp2=mid(ls_temp,1,3)
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2="505")
			
		case lower("OLE UpdateLinksDialog")
			setnull(li_1)
			li_1=ole_1.updatelinksdialog()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_1) and li_1=0)
			
		case lower("DW Print Preview")
			setnull(rowsretrieved)
			dw_1.dataobject = "d_emps"
			dw_1.SetTransObject(SQLCA)
			dw_1.Modify("DataWindow.Print.Preview='Yes'")
			rowsretrieved = dw_1.retrieve()
			ls_result += wf_result_add(ls_item, " ", not isnull(rowsretrieved) and rowsretrieved=73)
			
		case lower("Month Names")			
			ls_res=''
			dw_1.dataobject = "d_dates"
			ls_date1 = String(2000-01-01, "MMM")
 			ls_date2 = String(2000-02-01, "MMM")
 			ls_date3 = String(2000-03-01, "MMM")
 			ls_date4 = String(2000-04-01, "MMM")
 			ls_date5 = String(2000-05-01, "MMM")
 			ls_date6 = String(2000-06-01, "MMM")
			ls_date7 = String(2000-07-01, "MMM")
 			ls_date8 = String(2000-08-01,"MMM")
 			ls_date9 = String(2000-09-01, "MMM")
 			ls_date10= String(2000-10-01, "MMM")
 			ls_date11= String(2000-11-01, "MMM")
 			ls_date12= String(2000-12-01, "MMM")
			ls_res = ls_date1 + " - " + ls_date2 + " - " +ls_date3 + " - " +ls_date4 + " - " +ls_date5 + " - " +ls_date6 + " - " +ls_date7 + " - " +ls_date8 + " - " +ls_date9 + " - " +ls_date10 + " - " +ls_date11 + " - " +ls_date12
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_res) and ls_res='Jan - Feb - Mar - Apr - May - Jun - Jul - Aug - Sep - Oct - Nov - Dec')
			
		case lower("Prompt for Criteria")
			setnull(rowsretrieved)
			dw_1.dataobject = "d_criteria"
			dw_1.SetTransObject(SQLCA)
			is_type= "OLE"
			timer(1)                                   
			rowsretrieved = dw_1.retrieve()
			ls_result += wf_result_add(ls_item, " ", not isnull(rowsretrieved) and rowsretrieved=73)
			
		case lower("DW SaveAS")
			ls_temp=''
			ls_temp2=''
			ls_path = gs_cachedir			
			ls_file = "DWdates_saveas.txt"
			ls_fullname = ls_path+gs_dirseparator+ls_file			
			dw_1.dataobject = "d_dates"
			ls_temp = dw_1.object.datawindow.data
			dw_1.SaveAs(ls_fullname,Text!,true)
			if FileExists(ls_fullname)  then
				li_1=1
			end if
			li_FileNum=fileopen(ls_fullname,StreamMode!,write!)
			fileread(li_FileNum,ls_temp)
			ls_temp2=mid(ls_temp,1,10)
			fileclose(li_FileNum)
			ls_result += wf_result_add(ls_item, " ", li_1=1 and  pos(ls_temp2,'2000') > 0)
			
		case lower("DW Import File")
			ls_temp=''
			ls_temp2=''
			ls_path = gs_cachedir			
			ls_file = "ImportFile2.txt"
			ls_fullname = ls_path+gs_dirseparator+ls_file
			if not FileExists(ls_fullname)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_fullname, sqlca)
					if not FileExists(ls_fullname)  then 
						ls_result +=" "+is_testcasename+" "+ls_item+" function "+ "ImportFile2.FileExists = "+String ( "Fail!" ) +"~r~n"
					end if 
				else
					ls_result +=" "+is_testcasename+" "+ls_item+" function "+ " ImportFile2.FileExists = "+String ( "Fail!" ) +"~r~n"
				end if 
			end if	
			dw_1.dataobject = "d_import"
			dw_1.SetTransObject(SQLCA)
			dw_1.importfile(ls_fullname)
			ls_temp = dw_1.object.datawindow.data	
			ls_temp2=mid(ls_temp,1,3)
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp2) and ls_temp2='666')
			
		case lower("DBMS Error1")         //Invalid DBMS (DBMS is not supported error)
			transaction SQL2
			SQL2 = create transaction			
			SQL2.DBMS       = "XYZ"
			CONNECT USING SQL2;
			
			IF sql2.sqlcode =0 THEN			
				Disconnect using SQL2;
			END IF
			
			ls_result += wf_result_add(ls_item, " ", sql2.sqlcode = -1 and sql2.sqlerrtext='DBMS XYZ is not supported in your current installation.')
					
		case lower("DBMS Error2")         //Invalid user/password
			is_type= "OLE"
			timer(1)  
			SQL2.DBMS       = "ODBC"			
			SQL2.DBParm     = "ConnectString='DSN=PB Demo DB V2017R2;UID=no;PWD=good'"
			CONNECT USING SQL2;
			
			IF sql2.sqlcode =0 THEN			
				Disconnect using SQL2;
			END IF
			
			ls_result += wf_result_add(ls_item, " ", sql2.sqlcode = -1 and mid(sql2.sqlerrtext,1,16)='SQLSTATE = 28000')
			
		case lower("DBMS Error3")         //Database trace is enabled
			is_type= "OLE"
			timer(1)  
			SQL2.DBMS       = "Trace ODBC"			
			SQL2.DBParm     = "ConnectString='DSN=PB Demo DB V2017R2;UID=dba;PWD=sql'"
			CONNECT USING SQL2;
			
			IF sql2.sqlcode =0 THEN			
				Disconnect using SQL2;
			END IF
			
			ls_result += wf_result_add(ls_item, " ", sql2.sqlcode = 0)		
			
		case lower("DBMS Error4")         //Transaction already connected			
			SQL2.DBMS       = "ODBC"			
			SQL2.DBParm     = "ConnectString='DSN=PB Demo DB V2017R2;UID=dba;PWD=sql'"
			CONNECT USING SQL2;
			CONNECT USING SQL2;				//force a Transaction already connected	 error
			rtncode=sql2.sqlcode
			IF sql2.sqlcode =0 THEN			
				Disconnect using SQL2;
			END IF
			ls_temp=sql2.sqlerrtext
			ls_result += wf_result_add(ls_item, " ", sql2.sqlcode = -1 and sql2.sqlerrtext= 'Transaction already connected')
			
		case lower("Runtime Error")
			ls_temp=''
			Try 
				acos(2)				//force a runtime error
			Catch (runtimeerror er)
				ls_temp=er.GetMessage()
			End try			
			ls_result += wf_result_add(ls_item, " ", mid(ls_temp,1,24)= 'Argument is out of range')
			
		case lower("Control Accessability")
			ls_temp=''
			cb_1.accessiblename = "Accessability" 
			cb_1.accessibledescription = "Accessability Demo"
			cb_1.accessiblerole = pushbuttonrole!
			ls_temp=cb_1.accessibledescription
			ls_result += wf_result_add(ls_item, " ", ls_temp= 'Accessability Demo')
		
		case lower("Choose Color")
			is_type= "OLE"
			timer(1)
			red =134217742
			blue =192
			custom[1]=rgb(12,200,blue)
			custom[2]=8344736
			custom[3]=134217742
			i_color = ChooseColor(red, custom)			
			ls_result += wf_result_add(ls_item, " ", i_color=1 and red=134217742)
			
		case lower("Folder Dialog")
			is_type= "OLE"
			timer(1)
			ls_path = gs_cachedir
			li_1 = GetFolder( "my targets", ls_path )
			ls_result += wf_result_add(ls_item, " ", li_1=1)
		
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_sap_location.create
int iCurrent
call super::create
this.em_datetime=create em_datetime
this.em_1=create em_1
this.em_date=create em_date
this.ole_2=create ole_2
this.ole_1=create ole_1
this.dw_1=create dw_1
this.rte_1=create rte_1
this.cb_1=create cb_1
this.cb_rte=create cb_rte
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_datetime
this.Control[iCurrent+2]=this.em_1
this.Control[iCurrent+3]=this.em_date
this.Control[iCurrent+4]=this.ole_2
this.Control[iCurrent+5]=this.ole_1
this.Control[iCurrent+6]=this.dw_1
this.Control[iCurrent+7]=this.rte_1
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.cb_rte
end on

on w_sap_location.destroy
call super::destroy
destroy(this.em_datetime)
destroy(this.em_1)
destroy(this.em_date)
destroy(this.ole_2)
destroy(this.ole_1)
destroy(this.dw_1)
destroy(this.rte_1)
destroy(this.cb_1)
destroy(this.cb_rte)
end on

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator

if FileExists(ls_filepath+"ImportFile.txt") then
	FileDelete(ls_filepath+"ImportFile.txt")
end if

if FileExists(ls_filepath+"ImportFile2.txt") then
	FileDelete(ls_filepath+"ImportFile2.txt")
end if

if FileExists(ls_filepath+"DWdates_saveas.txt") then
	FileDelete(ls_filepath+"DWdates_saveas.txt")
end if

end event

event timer;call super::timer;if lower(is_type) = lower("OLE") then 
	wf_closepopwindow( "Insert Object", 'OK')
	wf_closepopwindow( "Paste Special", 'OK')
	wf_closepopwindow( "Crosstab Definition", 'OK')
	wf_closepopwindow( "Specify Retrieval Criteria", 'OK')
	wf_closepopwindow( "Connect to SQL Anywhere", 'OK')
	wf_closepopwindow( "Database Trace", 'OK')
	wf_closepopwindoww( "连接到 SQL Anywhere", 'OK')
	wf_closepopwindoww( "Color", 'OK')
	wf_closepopwindoww( "Browse for Folder", 'OK')
end if
end event

type em_datetime from editmask within w_sap_location
integer x = 1966
integer y = 104
integer width = 754
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mmm/yy hh:mm:ss"
end type

type em_1 from editmask within w_sap_location
integer x = 2368
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "[currency(7)]"
end type

type em_date from editmask within w_sap_location
integer x = 1947
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mmm/yy"
end type

type ole_2 from olecontrol within w_sap_location
integer x = 1541
integer width = 402
integer height = 216
integer taborder = 40
borderstyle borderstyle = stylelowered!
long backcolor = 16777215
boolean focusrectangle = false
string binarykey = "w_sap_location.win"
omactivation activation = activateondoubleclick!
omdisplaytype displaytype = displayascontent!
omcontentsallowed contentsallowed = containsany!
end type

type ole_1 from olecontrol within w_sap_location
integer x = 1029
integer width = 471
integer height = 224
integer taborder = 30
boolean focusrectangle = false
string binarykey = "w_sap_location.win"
integer binaryindex = 1
omactivation activation = activateondoubleclick!
omdisplaytype displaytype = displayascontent!
omcontentsallowed contentsallowed = containsany!
omlinkupdateoptions linkupdateoptions = linkupdatemanual!
end type

type dw_1 from datawindow within w_sap_location
integer x = 425
integer width = 530
integer height = 216
integer taborder = 20
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type rte_1 from richtextedit within w_sap_location
integer width = 402
integer height = 216
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_sap_location
integer x = 599
integer y = 396
integer width = 521
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Accessability"
end type

type cb_rte from commandbutton within w_sap_location
integer x = 18
integer y = 400
integer width = 535
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "module"
end type

event clicked;of_testcase_point_module()
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
09w_sap_location.bin 
2800000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010003000c00000000000000c0460000000000000000000000000000008e53ab6001d372ed00000003000002c000000000004f00010065006c003000310061004e0069007400650076000000000000000000000000000000000000000000000000000000000000000000000000000000000102001a00000002ffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000002000002160000000000430001006d006f004f0070006a006200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000004c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001fffffffe000000030000000400000005000000060000000700000008000000090000000afffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe000100000a03ffffffff0003000c00000000000000c0460000000000000c20454c4f6b6361500065676100000000000000086b6361500065676171b239f400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002126d49000274726f70656c69467478742e5c3a43007265735570615c736e6f65707365445c706f746b20314c5c65646f63706d495c4674726f2e656c69007478740003000000000036555c3a43737265737070615c5c6e6f65447070415c61746161636f4c65545c6c495c706d726f706d6c6946743528206578742e2900a200746f4a00000973656e43093151696d736f0d3509636e6f4a0a51097365614709317463616c320963696f4a0a0d0973656e530931516c6c6574310972614a0a0d3873656e6f093251096d736f43330963694a0a0d3673656e6f09325109616c6147636974630a0d3609656e6f4a325109736574530972616c6c0d3531096e6f4a0a510973656f43093363696d730d3834096e6f4a0a51097365614709337463616c3209636900000035003a00430055005c00650073007300720061005c00700070006f0065005c006e007000410044007000740061005c0061006f004c00610063005c006c006500540070006d0049005c0070006d0072006f00460074006c00690020006500350028002e002900780074000e0074004900000070006d0072006f00460074006c0069002e006500780074002e007400430000005c003a0073005500720065005c00730070006100650070006e006f0044005c007300650074006b0070006f004c005c00200031006f0063006500640049005c0070006d0072006f00460074006c0069002e0065007800740000007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd0000000cfffffffe0000000d00000005000000060000000700000008000000090000000a0000000bfffffffe0000001efffffffe0000000f000000100000001100000012000000130000001400000015fffffffe0000001700000018000000190000001a0000001b0000001c0000001dfffffffefffffffe00000020000000210000002200000023000000240000002500000026fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
25ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000040002090600000000000000c0460000000000000000000000000000008e53d27001d372ed000000030000024000000000004f00010065006c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000102000affffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000140000000000540031006200610065006c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000e0000000100000003ffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000004000010000000000000430001006d006f004f0070006a006200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000010000006b00000000fffffffe00000002fffffffe0000000400000005000000060000000700000008fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff02000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe000100000a03ffffffff0002090600000000000000c0460000000000001975636f44746e656d694d206f736f72632074666f64726f5700000a0057534d004464726f1000636f570000002e64726f75636f44746e656df400382e0071b2390000000000000000000000000000000000000000000000000000000000000000ffffffff000000030000000400000001ffffffff00000002000000000000393b000001e70000011e00090001008f030000020000000000200014000006260000001e000fffffffff001400046f570000000e64727263694d666f736f6f57207400056472020b000000000000000000050045020c0013081d02fb0000000000000000000000000000000000006f43010065697275654e207200000077000000040000012d000000040001010200000015ffc402fb00000000019000000000000012004004656d6954654e20736f522077006e616d00040000012d0000002000010a320000000000000004000e000000000045081d61647373646173666664736600176473001e00170014001b001b00170014001e001e001700170014000d001e0a320000015d000000040001000000000045081d001b0020000000040000012d000f00140001000a000f0069000000030000000000380000fff14000003800020006000c006f004e006d0072006c0061000200000018000000184a430401485f00184a610c0a486d0c0a48730c0a48740000000000000000000000000000000000460000fff24041004600a1001b000c00750046006e006500650074006400200020006500e1007000720072006600610020006f007200700064006500740065007200650000002e000000000000000000000000000f00000004000000000c00ffff00030001ffff200400000001ffff00a3262200000000000000000000000f0000000000000000001100000098000030000000000000008000000080000000000004000000040f00000003000004000000040f00000004000004000000040f00000005000000000000000e0000001100070004000000000000000e0000001100070005800040ff000e0001000e000089f8000000010064000e0001
2A00000000000000000000000010020000000000000f0000004000000000080000ff000040000001ff550007006b006e006f006e006e00770001ffff0000000800000000000000000001ffff000000000000ffff00ff000200000000ff00ffff00ff000200000000ff00000300901647000200000105030602030205040000030400000000000000000000000000000100000000006900540065006d002000730065004e00200077006f00520061006d0000006e00901635000500020101020105050206070000000700000000000000100000000000000000000000807900530062006d006c006f003300000000019026060b02000202020403040202000000000000000000000000010000000000000041000000690072006c0061002200000031000400001888080002c4f00001a9008400000086264372004643720200000000000200000000000000000001000100040000000110030000000000000000000100000000000100000001000000000000032400000010f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a5000000b407c0068100b4000030128100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000028e000100000000000000080010f000000000000000000000000000000000000000000000000000000000ff000000000012ff00000000000000000000000041000e0061006c00740073006900610020007200720042006d0061000e0065006c004100730061006100740072006900420020006100720065006d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062004f0065006a00740063006f0050006c006f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010100160000000200000006ffffffff00000000000000000000000000000000000000008e53ab6001d372ed8e53ab6001d372ed000000000000000000000000004f00020065006c007200500073006500300030000000300000000000000000000000000000000000000000000000000000000000000000000000000000000001020018ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000
2A000000030000015800000000006f005700640072006f0044007500630065006d0074006e000000000000000000000000000000000000000000000000000000000000000000000000000000000002001a0000000500000007ffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000e000010000000000000530005006d00750061006d00790072006e0049006f0066006d007200740061006f00690000006e00000000000000000000000000000000000000000000000001020028ffffffff00000008ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000160000100000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c1a5ec0409203912f00000000000bf1000000000000000000004000000040f6a62000ecffd6a620000cffd0000000000000000000000000000000000160c0a00000c220000a59f0000a59f0000000f00000000000000000000000000000000000000000000000000000000000fffff0000000000000000000fffff0000000000000000000fffff000000000000000000000000000000000000006c00b200000000000000b2000000b200000000000000b200000000000000b200000000000000b200000000000000b2000000140000000000000000000000e600000000000001000000000000000100000000000000010000000000000001000000000c0000010c0000000c000000e600000000000001c5000000b60000012400000000000001240000000000000124000000000000012400000000000001240000000000000124000000000000012400000000000001240000000000000144000000020000014600000000000001460000000000000146000000000000014600000000000001460000000000000146000000240000027b000002200000049b000000620000016a0000001500000000000000000000000000000000000000b20000000000000124000000000000000000000000000000000000000000000124000000000000012400000000000001240000000000000124000000000000016a000000000000014400000000000000b200000000000000b2000000000000012400000000000000000000000000000124000000000000017f000000160000014400000000000001440000000000000144000000000000012400000010000000b2000000000000012400000000000000b2000000000000012400000000000001440000000000000000000000000000014400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001240000000000000144000000000000014400000000000001440000000000000000000000000000014400000000000000b200000000000000b200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000144000000000000012400000000000001180000000c0000b76000008d94891c00e601bf001a000001000000000000000134000000000000014400000000000000000000000000000144000000000000019500000030000001c5000000000000014400000000000004fd000000000000013400000010000004fd0000000000000144000000000000014400000000000000c600000012000000d80000000e000000b200000000000000b200000000000000b200000000000000b200000000000000020000000000d9616473736461736666647366000d64730000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
270000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000040f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000004000000040f000000fd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000001000000000004000000040f000000fd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040400000101010090310020b01f0168b0202e82b02141c6b022070890230708902405a0b02505a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020a040000000000000000000000000000000000000001f29f85e010684ff9000891abd9b3272b0000003000000178000000110000000100000090000000020000009800000003000000a400000004000000b000000005000000c800000006000000d400000007000000e000000008000000f4000000090000010c00000012000001180000000a000001340000000c000001400000000d0000014c0000000e000001580000000f000001600000001000000168000000130000017000000002000004e40000001e00000001007300000000001e00000001007300000000001e0000000f73616c4172696174617242200000656d0000001e0000000173616c000000001e0000000173616c000000001e0000000b6d726f4e642e6c616100746f0000001e0000000f73616c4172696174617242200000656d0000001e00000002736100320000001e000000137263694d666f736f6f572074392064720000302e0000004047868c0000000000000000403c89c00001bf8d940000004084104c0001bf8d94000000030000000100000003000000000000000300000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004400050063006f006d0075006e006500530074006d00750061006d00790072006e0049006f0066006d007200740061006f00690000006e000000000000000000020038ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000001f00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020a040000000000000000000000000000000000000001d5cdd502101b2e9c00089793aef92c2b00000030000000f00000000c00000001000000680000000f000000700000000500000084000000060000008c0000001100000094000000170000009c0000000b000000a400000010000000ac00000013000000b400000016000000bc0000000d000000c40000000c000000d100000002000004e40000001e0000000b20455350616279536f0065730000000300000001000000030000000100000003000000000000000300090afc0000000b000000000000000b000000000000000b000000000000000b000000000000101e000000010000000100100c000000020000001e000000070074ed5400006f6c75000000030000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19w_sap_location.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
