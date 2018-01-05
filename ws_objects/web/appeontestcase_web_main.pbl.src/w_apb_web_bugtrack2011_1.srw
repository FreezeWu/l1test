$PBExportHeader$w_apb_web_bugtrack2011_1.srw
forward
global type w_apb_web_bugtrack2011_1 from w_base_case
end type
type dw_5 from datawindow within w_apb_web_bugtrack2011_1
end type
type lb_1 from listbox within w_apb_web_bugtrack2011_1
end type
type ddlb_1 from dropdownlistbox within w_apb_web_bugtrack2011_1
end type
type dw_4 from datawindow within w_apb_web_bugtrack2011_1
end type
type gr_1 from graph within w_apb_web_bugtrack2011_1
end type
type dw_3 from datawindow within w_apb_web_bugtrack2011_1
end type
type dw_2 from datawindow within w_apb_web_bugtrack2011_1
end type
type dw_1 from datawindow within w_apb_web_bugtrack2011_1
end type
end forward

global type w_apb_web_bugtrack2011_1 from w_base_case
dw_5 dw_5
lb_1 lb_1
ddlb_1 ddlb_1
dw_4 dw_4
gr_1 gr_1
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
end type
global w_apb_web_bugtrack2011_1 w_apb_web_bugtrack2011_1

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
end prototypes

public subroutine of_testcase_point_module ();//==============================================================================
// 
// Copyright © 2017 Appeon Limited and its subsidiaries.  All rights reserved.
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
string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

//ls_array[Upperbound(ls_array) + 1 ] = "testcasepoint_example1"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "bugid11036"
ls_array[Upperbound(ls_array) + 1 ] = "bugid10717"
ls_array[Upperbound(ls_array) + 1 ] = "bugid10658"
ls_array[Upperbound(ls_array) + 1 ] = "bugid9935"
ls_array[Upperbound(ls_array) + 1 ] = "bugid9912"
ls_array[Upperbound(ls_array) + 1 ] = "bugid9709"
ls_array[Upperbound(ls_array) + 1 ] = "bugid8860"
ls_array[Upperbound(ls_array) + 1 ] = "bugid8756"

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
	lbn_flag = false
	choose case lower(ls_item)
//		case lower("testcasepoint_example1")	
			//			... your test case code...
			//	ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
		case lower("bugid11036")
			//UseObject-DataStore Don't Trigger Destructor Event
			boolean lbn_rtn
			n_ds lnv_ds
			lnv_ds = create n_ds
			lbn_rtn = isvalid(lnv_ds)
			destroy lnv_ds
			
			if lbn_rtn = true and gs_output = 'destructor' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, " UseObject-DataStore Don't Trigger Destructor Event ", lbn_flag)
		
		case lower("bugid10717")
			//The Result is Error When  The String Function Format Date Type
			string ls_time1,ls_time2
			ls_time1 = string(02:02:02,'hh')
			ls_time2 = string(02:02:02,'s')
			
			if ls_time1 = '02' and ls_time2 = '2' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, " The Result is Error When  The String Function Format Date Type ", lbn_flag)
			
		case lower("bugid10658")
			//SqldbCode Value is InCorrent When Execute ESQL
			string ls_sql
			ls_sql = 'select * from t_notexist;'
			execute immediate:ls_sql;
			
			if sqlca.sqldbcode = 208 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "SqldbCode Value is InCorrent When Execute ESQL", lbn_flag)
			
		case lower("bugid9935")
			//The Return Value Lost Double Quotation Marks When Describe DataWindow Object's Pointer
			string ls_pointer
			dw_1.object.datawindow.pointer = 'HyperLink!'
			ls_pointer = dw_1.describe("datawindow.pointer")			
			
			if ls_pointer = '"HyperLink!"' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "The Return Value Lost Double Quotation Marks When Describe DataWindow Object's Pointer", lbn_flag)
			
		case lower("bugid9912")
			//Don't Set Text Property for DDLB Control  When it Have no Items and AllowEdit Property is False
			ddlb_1.text = "Appeon"
			
			if ddlb_1.text = "Appeon" then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "Don't Set Text Property for DDLB Control  When it Have no Items and AllowEdit Property is False", lbn_flag)
			
		case lower("bugid9709")
			//Pop Up Error When the DataWindow's Function--SetItem's Argument is Null
			datetime ldt_null
			integer li_set
			setnull(ldt_null)
			dw_5.dataobject = 'd_dt33287'
			dw_5.settransobject(sqlca)
			dw_5.retrieve()
			li_set = dw_5.setitem(1,1,ldt_null)
			
			if li_set = 1 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "Pop Up Error When the DataWindow's Function--SetItem's Argument is Null", lbn_flag)
			
		case lower("bugid8860")
			//Object's Property use LowerBound(UpperBound) Function Error
			integer li_lb
			li_lb = LowerBound(lb_1.item)
			
			if li_lb = 1 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "Object's Property use LowerBound(UpperBound) Function Error", lbn_flag)
			
		case lower("bugid8756")
			//Transferred Meaning Error
			string ls_trans
			ls_trans = '~~1'
			
			if ls_trans = '~~1' and len(ls_trans) = 2 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "Transferred Meaning Error", lbn_flag)
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col,li_fnum
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
Decimal{0}		ldc_num

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "bugid28846"			//edit you test case point name
ls_array[Upperbound(ls_array) + 1 ] = "bugid28717"
ls_array[Upperbound(ls_array) + 1 ] = "bugid26921"
ls_array[Upperbound(ls_array) + 1 ] = "bugid26903"
//ls_array[Upperbound(ls_array) + 1 ] = "bugid26770"
ls_array[Upperbound(ls_array) + 1 ] = "bugid24727"
ls_array[Upperbound(ls_array) + 1 ] = "bugid23329"
ls_array[Upperbound(ls_array) + 1 ] = "bugid22048"
ls_array[Upperbound(ls_array) + 1 ] = "bugid21933"
ls_array[Upperbound(ls_array) + 1 ] = "bugid21434"
ls_array[Upperbound(ls_array) + 1 ] = "bugid21434"
ls_array[Upperbound(ls_array) + 1 ] = "bugid21326"
ls_array[Upperbound(ls_array) + 1 ] = "bugid21304"
ls_array[Upperbound(ls_array) + 1 ] = "bugid21177"

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
	lbn_flag = false
	choose case lower(ls_item)
		case lower("bugid28846")	
			//UTF16BE's have a problem when write or saveas
			li_fnum = FileOpen("EncodingUTF16BE.txt", LineMode!, Write!, LockReadWrite!, Append!, EncodingUTF16BE!)
			li_rtn = FileWriteEX(li_fnum, "中国")
			FileClose(li_fnum)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 4)
		case lower("bugid28717")            
			//The float data of 15 digits is rounded by Appeon.This behavior is different from a PowerBuilder.
			string ls_sql
			transaction         tran3_SQLCA
			tran3_SQLCA = Create transaction
			ls_fullname = "ODBC2"
			f_db_connect (tran3_SQLCA, ls_fullname, '') 
			execute immediate "drop TABLE saison_test" USING tran3_SQLCA;
			ls_sql ="create table saison_test(dig varchar(5), f_data float(53));"
			ls_sql += "insert saison_test(dig, f_data) values('15', 999999999999999);"
			execute immediate :ls_sql  using tran3_SQLCA;
			if tran3_SQLCA.sqlcode= 0 then
				commit using tran3_SQLCA;	
				dw_1.SetTransObject(tran3_SQLCA)
				dw_1.Retrieve()
				ldc_num = dw_1.GetItemDecimal ( 1, 'f_data' )
				disconnect using tran3_SQLCA;
				destroy tran3_SQLCA;
				ls_result += wf_result_add(ls_item, " ", not isnull(ldc_num) and ldc_num = 999999999999999)
			else
				rollback using tran3_SQLCA;
				ls_result += wf_result_add(ls_item, " Connect to DB failed! ", false)				
			end if					
			
	   case lower("bugid26921")	
			//Getfocus() function will trigger data verification for datawindow.
			dw_1.dataobject ='d_t33010'
			li_rtn = dw_1.setfocus()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			
	   case lower("bugid26903")	
			// Dynamic created Datawindow can't update data.
			string ls_SQLSelect,ls_Syntax,ls_Error
			ls_SQLSelect = " SELECT id, name  FROM test26903 "
			ls_Syntax = SQLCA.SyntaxFromSQL(ls_SQLSelect, "style(type=grid)", ls_Error)
			
			dw_1.Create(ls_Syntax, ls_Error)
			dw_1.SetTransObject(SQLCA)
			delete from test26903 where id=762;
			ll_tmp = dw_1.InsertRow(0)
			dw_1.object.name[ll_tmp] = "CFPCompany"
			dw_1.object.id[ll_tmp] = 762
			li_rtn = dw_1.update()
              ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
				  
//		case lower("bugid26770")			  
//			li_rtn = dw_1.Rowsmove(0,0,primary!,dw_2,1000,primary!)
//			ls_result += wf_result_add(ls_item, " +"+ls_temp, not isnull(li_rtn) and li_rtn = 1)

	   case lower("bugid24727")	
			//datawindow sort is incorrect when sort expression include mid function
			dw_1.setsort("mid(id,2) A")
 		     li_rtn =  dw_1.Sort()
		     ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)
			  
		 case lower("bugid23329")	
			//"evaluate" function of Datawindow expression is invalid
			dw_1.dataobject ='d_t23329'
			dw_1.SetTransObject(SQLCA)
			dw_1.retrieve( )
          	ls_temp = dw_1.Describe("evaluate('if(compute_1>200,255,0)',1)")
    	         ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp) and ls_temp = '0')
	
     	 case lower("bugid22048")	
				//Filter expression is invalid when it include computed field
			dw_1.dataobject ='d_t22048'
			dw_1.SetTransObject(SQLCA)
			dw_1.retrieve( )
			dw_1.setfilter("compute_1=1")
              li_rtn = dw_1.filter()
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = 1)	  
			
		case lower("bugid21933")	
			//Row's height is difference with PB
			dw_1.dataobject ='d_t23329'
			dw_1.SetTransObject(SQLCA)
			dw_1.retrieve( )
			ls_temp = dw_1.Describe("Evaluate('RowHeight()',0)")
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp) and ls_temp = '84')
			
		case lower("bugid21434")
			//Return value of getdatastyle function is incorrect when datapointnumber isn't exist
			FillPattern  lf_Pattern
			li_rtn = gr_1.GetDataStyle(1,100,lf_Pattern)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = -1)	 
			
			 case lower("bugid21434")
				
		case lower("bugid21326")
			//New category's position is incorrect when execute insertdata function
			integer li_seriesnbr,li_category
			dec{2} ldc_1,ldc_2,ldc_3
			ldc_1 = 15
			ldc_2 = 20
			ldc_3 = 35
			gr_1.reset(all!)
			li_seriesnbr = gr_1.addseries("生鲜")
			
			gr_1.addcategory("生鲜")
			gr_1.addcategory("食品")
			gr_1.addcategory("百货")
						
			gr_1.adddata(li_seriesnbr,ldc_1,"生鲜")
			gr_1.adddata(li_seriesnbr,ldc_2,"食品")
			gr_1.adddata(li_seriesnbr,ldc_3,"百货")
			ls_temp = string(gr_1.InsertData(1,1,340,'Appeon'))
			ls_result += wf_result_add(ls_item, " ", not isnull(ls_temp) and ls_temp = '1')	
			
		case lower("bugid21304")
			//Retuen value is incorrect when importclipboard-data's type is not match graph control
			li_rtn = gr_1.ImportClipboard(text!,1,3,3)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = -2)  
			
			case lower("bugid21177")
				//Return value is incorrect when execute settaborder function for graph datawindow
			dw_1.dataobject ='d_t21177'
			dw_1.SetTransObject(SQLCA)
			dw_1.retrieve( )
			li_rtn = dw_1.SetTabOrder('salary',100)
			ls_result += wf_result_add(ls_item, " ", not isnull(li_rtn) and li_rtn = -1)  
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_web_bugtrack2011_1.create
int iCurrent
call super::create
this.dw_5=create dw_5
this.lb_1=create lb_1
this.ddlb_1=create ddlb_1
this.dw_4=create dw_4
this.gr_1=create gr_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_5
this.Control[iCurrent+2]=this.lb_1
this.Control[iCurrent+3]=this.ddlb_1
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.gr_1
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.dw_2
this.Control[iCurrent+8]=this.dw_1
end on

on w_apb_web_bugtrack2011_1.destroy
call super::destroy
destroy(this.dw_5)
destroy(this.lb_1)
destroy(this.ddlb_1)
destroy(this.dw_4)
destroy(this.gr_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
end on

type dw_5 from datawindow within w_apb_web_bugtrack2011_1
integer x = 928
integer y = 1256
integer width = 686
integer height = 400
integer taborder = 30
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type lb_1 from listbox within w_apb_web_bugtrack2011_1
integer x = 23
integer y = 208
integer width = 549
integer height = 476
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"item1"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_1 from dropdownlistbox within w_apb_web_bugtrack2011_1
integer x = 18
integer y = 60
integer width = 549
integer height = 476
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_4 from datawindow within w_apb_web_bugtrack2011_1
integer x = 2167
integer y = 312
integer width = 562
integer height = 360
integer taborder = 20
string title = "none"
string dataobject = "d_t21177"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gr_1 from graph within w_apb_web_bugtrack2011_1
integer x = 2007
integer y = 984
integer width = 539
integer height = 300
boolean border = true
grgraphtype graphtype = colgraph!
long textcolor = 33554432
integer spacing = 100
string title = "(None)"
integer elevation = 20
integer rotation = -20
integer perspective = 2
integer depth = 100
grlegendtype legend = atbottom!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
grsorttype seriessort = ascending!
grsorttype categorysort = ascending!
end type

on gr_1.create
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
TitleDispAttr.Weight=700
TitleDispAttr.FaceName="Tahoma"
TitleDispAttr.FontCharSet=DefaultCharSet!
TitleDispAttr.FontFamily=Swiss!
TitleDispAttr.FontPitch=Variable!
TitleDispAttr.Alignment=Center!
TitleDispAttr.BackColor=536870912
TitleDispAttr.Format="[General]"
TitleDispAttr.DisplayExpression="title"
TitleDispAttr.AutoSize=true
Category.Label="(None)"
Category.AutoScale=true
Category.ShadeBackEdge=true
Category.SecondaryLine=transparent!
Category.MajorGridLine=transparent!
Category.MinorGridLine=transparent!
Category.DropLines=transparent!
Category.OriginLine=transparent!
Category.MajorTic=Outside!
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

on gr_1.destroy
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

type dw_3 from datawindow within w_apb_web_bugtrack2011_1
integer x = 178
integer y = 880
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "d_t23329"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_apb_web_bugtrack2011_1
integer x = 1074
integer y = 808
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_apb_web_bugtrack2011_1
integer x = 581
integer y = 228
integer width = 1349
integer height = 532
integer taborder = 10
string title = "none"
string dataobject = "d_test28717"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

