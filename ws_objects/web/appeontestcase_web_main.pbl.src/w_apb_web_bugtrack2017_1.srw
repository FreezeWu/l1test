$PBExportHeader$w_apb_web_bugtrack2017_1.srw
forward
global type w_apb_web_bugtrack2017_1 from w_base_case
end type
type dw_4 from datawindow within w_apb_web_bugtrack2017_1
end type
type gr_1 from graph within w_apb_web_bugtrack2017_1
end type
type p_1 from picture within w_apb_web_bugtrack2017_1
end type
type dw_3 from datawindow within w_apb_web_bugtrack2017_1
end type
type dw_2 from datawindow within w_apb_web_bugtrack2017_1
end type
type em_3 from editmask within w_apb_web_bugtrack2017_1
end type
type em_2 from editmask within w_apb_web_bugtrack2017_1
end type
type em_1 from editmask within w_apb_web_bugtrack2017_1
end type
type dw_1 from datawindow within w_apb_web_bugtrack2017_1
end type
type sle_1 from singlelineedit within w_apb_web_bugtrack2017_1
end type
type cb_1 from commandbutton within w_apb_web_bugtrack2017_1
end type
type tab_1 from tab within w_apb_web_bugtrack2017_1
end type
type tabpage_1 from userobject within tab_1
end type
type tabpage_1 from userobject within tab_1
end type
type tab_1 from tab within w_apb_web_bugtrack2017_1
tabpage_1 tabpage_1
end type
end forward

global type w_apb_web_bugtrack2017_1 from w_base_case
integer width = 2766
dw_4 dw_4
gr_1 gr_1
p_1 p_1
dw_3 dw_3
dw_2 dw_2
em_3 em_3
em_2 em_2
em_1 em_1
dw_1 dw_1
sle_1 sle_1
cb_1 cb_1
tab_1 tab_1
end type
global w_apb_web_bugtrack2017_1 w_apb_web_bugtrack2017_1

type variables
long il_count
integer ii_ret
string is_datetime
string is_date
string is_time
end variables

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
ls_array[Upperbound(ls_array) + 1 ] = "bugid34706"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34689"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34675"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34673"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34672"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34669"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34658"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34657"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34648"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34642"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34638"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34632"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34629"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34621"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34592"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34584"
ls_array[Upperbound(ls_array) + 1 ] = "bugid34577"

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
			//Maximum script size exceeded. 		//2100
		case lower("bugid34706")
			//Upper replace ascii 223 with 'SS'
			string ls_chac1 = char(223)
			string ls_chac2 = char(228)
			string ls_chac3 = char(246)
			string ls_chac4 = char(252)
			string ls_upchac1, ls_upchac2, ls_upchac3, ls_upchac4
			ls_upchac1 = upper(ls_chac1)
			ls_upchac2 = upper(ls_chac2)
			ls_upchac3 = upper(ls_chac3)
			ls_upchac4 = upper(ls_chac4)
			
			if ls_upchac1= 'ß' and ls_upchac2 = 'Ä' and ls_upchac3 = 'Ö' and ls_upchac4 = 'Ü' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, " Upper replace ascii 223 with 'SS' ", lbn_flag)
			
		case lower("bugid34689")
			//crosstab DW rounds values if using compute column in SQL
			decimal ldc_temp1,ldc_temp2
			dw_1.dataobject = 'd_test34689'
			dw_1.settransobject(sqlca)
			dw_1.retrieve()
			
			ldc_temp1 = dw_1.getitemdecimal(2,"valor")
			ldc_temp2 = dw_1.getitemdecimal(2,"grand_sum_valor")				
			
			if ldc_temp1 = 10.001 and ldc_temp2 = 569.164 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, " crosstab DW display decimals normally using compute column in SQL ", lbn_flag)
			
		case lower("bugid34675")
			//Insert error will cause DB error again
			long ll_row
			int li_id,li_temp
			time lt_time_now
			string ls_sql
			dw_1.dataobject = 'd_time34675'
			dw_1.settransobject(sqlca)				
				
			for li_temp = 1 to 2		//cause primary key conflict error
 				select max(c_id) into :li_id from t_time;
				if isnull(li_id) then li_id = 0
			
				li_id = li_id + 1
				lt_time_now = now()
				ll_row = dw_1.insertrow(0)
				dw_1.setitem(ll_row, 1, li_id)
				dw_1.setitem(ll_row, 2, lt_time_now)
			next
			is_type = "dw_error"
			timer(1)
			dw_1.update()		
				
			dw_1.retrieve()
				
			select max(c_id) into :li_id from t_time;
			if isnull(li_id) then li_id = 0				
			li_id = li_id + 1
			lt_time_now = now()
			ll_row = dw_1.insertrow(0)
			dw_1.setitem(ll_row, 1, li_id)
			dw_1.setitem(ll_row, 2, lt_time_now)
				
			li_temp = dw_1.update()			
				
			if li_temp = 1 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
				
			ls_sql = "delete from t_time where c_id > 10"
			execute immediate:ls_sql;
				
			ls_result += wf_result_add(ls_item, " Insert error will not cause DB error again ", lbn_flag)

		case lower("bugid34673")
			//GetItem function in itemchange event return last value			
			dw_2.dataobject = 'd_time34675'
			dw_2.settransobject(sqlca)
			dw_2.retrieve()
			dw_2.setitem(1,'c_id',3)
			dw_2.setitem(1,'c_id',5)
			dw_2.setrow(2)
			dw_2.triggerevent(itemchanged!)
				
			if ii_ret = 5 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
				
			ls_result += wf_result_add(ls_item, " GetItem function in itemchange event return current value ", lbn_flag)

		case lower("bugid34672")
			//switch Datawindow focus may cause input data lost
			int li_num
			dw_2.dataobject = 'd_time34675'
			dw_2.settransobject(sqlca)
			dw_2.retrieve()
			dw_2.setitem(1,'c_id',8)
			sle_1.text = "TEST"
			li_num = dw_2.getitemnumber(1,1)
			
			if li_num = 8 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, " Switch Datawindow focus will not cause input data lost ", lbn_flag)
		
		case lower("bugid34669")
			//the tab order cannot move to front of the ancestor tabpage in web
			open(w_tabs)
			if gs_output = 'none' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, " the tab order can move to front of the ancestor tabpage ", lbn_flag)		
			
		case lower("bugid34658")
			//filewrite/filewriteex return -1 when write empry string
			integer li_FileNum
			long ll_rtn = -1
			string ls_text			
			ls_file =  gs_cachedir+ gs_dirseparator + "34658.txt"
			ls_text = ''
			li_FileNum = FileOpen(ls_file,    LineMode!, Write!, LockWrite!, Append!)
			ll_rtn = FileWrite(li_FileNum, ls_text)
			fileclose(li_FileNum)
			if ll_rtn = 0 then
				lbn_flag = true
			else
				lbn_flag = false
			end if

			ls_result += wf_result_add(ls_item, " filewrite/filewriteex return -1 when write empry string ", lbn_flag)
			
		case lower("bugid34657")
			//dw_2.describe ( "Evaluate('currentrow()' ,1)" ) return 1 on web
			string ls_ret			
			dw_2.dataobject = 'd_test34657'
			ls_ret = dw_2.describe ( "Evaluate('currentrow()' ,1)" )
			
			if ls_ret = "" then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "dw.describe function return correct value on web", lbn_flag)
		
		case lower("bugid34648")
			//Classname fucntion on variable of type any return 'string' when no value fill it
			any la_any1,la_any2
			integer li_int
			long ll_long
			string ls_classname1,ls_classname2,ls_classname3
			ls_classname3 = classname ( la_any1 )
			la_any1 = li_int
			ls_classname1 = classname ( la_any1 )
			la_any2 = ll_long
			ls_classname2 = classname ( la_any2 )
			
			if ls_classname1 = 'integer' and ls_classname2 = 'long' and ls_classname3 = 'any' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "Classname fucntion on variable of type any return 'string' when no value fill it", lbn_flag)
			
		case lower("bugid34642")
			//Picture control: OriginalSize propertry does not work with PNG image
			ls_file =  gs_cachedir+ gs_dirseparator + "a.png"
			if not FileExists(ls_file)  then 
				if isvalid(w_controller) then 					
					w_controller.of_createfile(ls_file, sqlca)
					if not FileExists(ls_file)  then 
						ls_result += wf_result_add(ls_item, "create temp file", false)
					end if 
				else
					ls_result += wf_result_add(ls_item, "create temp file", false)
				end if 
			end if
			p_1.picturename = 'a.png'
			
			if p_1.width = 571 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "OriginalSize propertry does not work with PNG image", lbn_flag)
			
		case lower("bugid34632")
			//saveasascii save a text file with incorrect column order in Appeon 2016
			string ls_asc1,ls_asc2			
			ls_file = gs_cachedir+ gs_dirseparator + "34632.txt"
			dw_2.dataobject = 'd_cust34632'
			dw_2.settransobject(sqlca)
			dw_2.retrieve()
			dw_2.saveasascii(ls_file)
			if not FileExists(ls_file)  then 
				ls_result += wf_result_add(ls_item, "create temp file", false)
			end if 
			li_filenum=fileopen(ls_file,LineMode!,read!)
			fileread(li_filenum,ls_asc1)
			fileread(li_filenum,ls_asc2)
			fileclose(li_filenum)
			if mid(ls_asc2,1,2) = '~"~"' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "saveasascii save a text file with incorrect column order in Appeon 2016", lbn_flag)
			
		case lower("bugid34629")
			//columns order is not correct when there is column width over 3200
			string ls_a5,ls_a6			
			dw_4.dataobject = 'd_test34629'
			dw_4.settransobject(sqlca)
			dw_4.insertrow(0)
			dw_4.setitem(1,5,'aaa')
			dw_4.setitem(1,6,'bbb')
			ls_a5 = dw_4.getitemstring(1,'A5')
			ls_a6 = dw_4.getitemstring(1,'A6')
			
			if ls_a5 = 'aaa' and ls_a6 = 'bbb' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "columns order is not correct when there is column width over 3200", lbn_flag)
			
		case lower("bugid34621")
			//getseriesstyle always return 0 on IWA
			int li_sel 
			string ls_cat
			long ll_datapoint1,ll_datapoint2,ll_datapoint3,ll_rgb

			gr_1.addseries( "Value")
			GR_1.TItleDISPATTR.TEXTCOLOR = RGB(0,179,224)
			gr_1.series.dispattr.textcolor = rgb(255,255,255)
			gr_1.legenddispattr.textcolor =  rgb(79,129,189)
			gr_1.legenddispattr.textsize = 15
			li_sel = gr_1.FindSeries("Value")
			ll_datapoint1 = 50
			ll_datapoint2 = 60
			ll_datapoint3 = 70
			gr_1.adddata(li_sel , ll_datapoint1 ,"A")
			gr_1.adddata(li_sel , ll_datapoint2 ,"B")
			gr_1.adddata(li_sel , ll_datapoint3 ,"C")
			gr_1.getseriesstyle('Value', linecolor!, ll_rgb)
			
			if ll_rgb = 255 then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "getseriesstyle always return 0 on IWA", lbn_flag)
			
		case lower("bugid34592")
			//The 'data' argument of itemchanged event is strange when datetiem column use edit.editmask
			datetime ldt_temp
			date ld_temp
			time lt_temp
			string ls_datetime
			dw_3.dataobject = 'd_test34592'
			dw_3.settransobject(sqlca)
			dw_3.retrieve()
			ld_temp = 2017-01-01
			lt_temp = 12:00:00
			ldt_temp = datetime(ld_temp,lt_temp)
			ls_datetime = string(ldt_temp, 'yyyy-mm-dd hh:mm:ss')
			dw_3.setitem(1,3,ldt_temp)
			dw_3.Event itemchanged( 1, dw_3.object.update_dtm, ls_datetime)
			
			if is_datetime = '2017-01-01 12:00:00' and is_date = '2017-01-01' and is_time = '12:00:00' then
				lbn_flag = true
			else
				lbn_flag = false
			end if
			
			ls_result += wf_result_add(ls_item, "The 'data' argument of itemchanged event is strange when datetiem column use edit.editmask", lbn_flag)
		
		case lower("bugid34584")
			//with the focus changing between SLE and datawindow row, data disappears in datawindow.
			dw_1.dataobject = 'd_test34584'
			dw_1.settransobject(SQLCA)
			dw_1.retrieve()
			dw_1.setitem(1,"Text", "First")
			sle_1.text = "Third"
			dw_1.setrow(2)
			dw_1.setitem(2,"Text", "Second")
			ls_temp = dw_1.getitemstring(1,"Text")
			if ls_temp = "First" then 
				lbn_flag = true
			else
				lbn_flag = false
			end if
			ls_result += wf_result_add(ls_item, " Data disappears after focus changing ", lbn_flag)
			
		case lower("bugid34577")	
			tab_1.Resize(3900, 1500)
			ls_result += wf_result_add(ls_item, " ", not isnull(il_count) and il_count = 1)
	end choose 
next 

is_resultlog += ls_result

end subroutine

public subroutine of_testcase_point_module1 ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
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

//ls_array[Upperbound(ls_array) + 1 ] = ""			//edit you test case point name
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
	lbn_flag = false
	choose case lower(ls_item)
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_apb_web_bugtrack2017_1.create
int iCurrent
call super::create
this.dw_4=create dw_4
this.gr_1=create gr_1
this.p_1=create p_1
this.dw_3=create dw_3
this.dw_2=create dw_2
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.dw_1=create dw_1
this.sle_1=create sle_1
this.cb_1=create cb_1
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_4
this.Control[iCurrent+2]=this.gr_1
this.Control[iCurrent+3]=this.p_1
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.dw_2
this.Control[iCurrent+6]=this.em_3
this.Control[iCurrent+7]=this.em_2
this.Control[iCurrent+8]=this.em_1
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.sle_1
this.Control[iCurrent+11]=this.cb_1
this.Control[iCurrent+12]=this.tab_1
end on

on w_apb_web_bugtrack2017_1.destroy
call super::destroy
destroy(this.dw_4)
destroy(this.gr_1)
destroy(this.p_1)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.dw_1)
destroy(this.sle_1)
destroy(this.cb_1)
destroy(this.tab_1)
end on

event timer;call super::timer;if lower(is_type) = lower("dw_error") then 
	wf_closepopwindow( 'DataWindow Error', 'OK')
end if
end event

event ue_cleantempfile;call super::ue_cleantempfile;string		ls_filepath

ls_filepath = gs_cachedir+gs_dirseparator

if FileExists(ls_filepath+"34658.txt") then
	FileDelete(ls_filepath+"34658.txt")
end if

if FileExists(ls_filepath+"a.png") then
	FileDelete(ls_filepath+"a.png")
end if

if FileExists(ls_filepath+"34632.txt") then
	FileDelete(ls_filepath+"34632.txt")
end if



end event

type dw_4 from datawindow within w_apb_web_bugtrack2017_1
integer x = 105
integer y = 624
integer width = 1326
integer height = 688
integer taborder = 30
string title = "none"
string dataobject = "d_test34629"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gr_1 from graph within w_apb_web_bugtrack2017_1
integer x = 1865
integer y = 864
integer width = 229
integer height = 252
boolean border = true
grgraphtype graphtype = piegraph!
long textcolor = 16777215
integer spacing = 100
string title = "PieTest"
integer depth = 100
grlegendtype legend = atbottom!
boolean focusrectangle = false
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
TitleDispAttr.FaceName="Verdana"
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
LegendDispAttr.Weight=700
LegendDispAttr.FaceName="Tahoma"
LegendDispAttr.FontCharSet=DefaultCharSet!
LegendDispAttr.FontFamily=Swiss!
LegendDispAttr.FontPitch=Variable!
LegendDispAttr.BackColor=536870912
LegendDispAttr.Format="[General]"
LegendDispAttr.DisplayExpression="series"
LegendDispAttr.AutoSize=true
PieDispAttr.FaceName="Tahoma"
PieDispAttr.FontCharSet=DefaultCharSet!
PieDispAttr.FontFamily=Swiss!
PieDispAttr.FontPitch=Variable!
PieDispAttr.BackColor=536870912
PieDispAttr.Format="[General]"
PieDispAttr.DisplayExpression="~"~""
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

type p_1 from picture within w_apb_web_bugtrack2017_1
integer x = 1829
integer y = 68
integer width = 192
integer height = 168
boolean originalsize = true
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_apb_web_bugtrack2017_1
integer x = 919
integer y = 260
integer width = 329
integer height = 284
integer taborder = 30
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;CHOOSE CASE dwo.name
		
CASE 'update_dtm'
is_datetime = data
is_date = left(data, 10)
is_time = mid(data, 12, 8)

END CHOOSE
end event

type dw_2 from datawindow within w_apb_web_bugtrack2017_1
integer x = 494
integer y = 260
integer width = 334
integer height = 280
integer taborder = 30
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.AcceptText()
ii_ret = this.GetItemNumber(1,1)



end event

type em_3 from editmask within w_apb_web_bugtrack2017_1
integer x = 2075
integer y = 428
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = " "
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type em_2 from editmask within w_apb_web_bugtrack2017_1
integer x = 2075
integer y = 264
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type em_1 from editmask within w_apb_web_bugtrack2017_1
integer x = 2075
integer y = 84
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type dw_1 from datawindow within w_apb_web_bugtrack2017_1
integer x = 96
integer y = 256
integer width = 338
integer height = 284
integer taborder = 20
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_apb_web_bugtrack2017_1
integer x = 635
integer y = 72
integer width = 1102
integer height = 132
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_apb_web_bugtrack2017_1
integer x = 82
integer y = 60
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute"
end type

event clicked;of_testcase_point_module()
end event

type tab_1 from tab within w_apb_web_bugtrack2017_1
integer x = 1454
integer y = 216
integer width = 283
integer height = 368
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
event test pbm_size
integer x = 18
integer y = 124
integer width = 247
integer height = 228
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type

event test;//
il_count ++
end event

