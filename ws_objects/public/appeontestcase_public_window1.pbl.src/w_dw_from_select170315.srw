$PBExportHeader$w_dw_from_select170315.srw
$PBExportComments$Create DW from user-selected table & columns
forward
global type w_dw_from_select170315 from w_base_case
end type
type uo_style from u_style_bar170315 within w_dw_from_select170315
end type
type dw_1 from datawindow within w_dw_from_select170315
end type
type uo_color from u_color_bar170315 within w_dw_from_select170315
end type
type cb_4 from commandbutton within w_dw_from_select170315
end type
type cb_ok from commandbutton within w_dw_from_select170315
end type
type mle_comments from multilineedit within w_dw_from_select170315
end type
type cb_2 from commandbutton within w_dw_from_select170315
end type
type st_12 from statictext within w_dw_from_select170315
end type
type st_13 from statictext within w_dw_from_select170315
end type
type st_14 from statictext within w_dw_from_select170315
end type
type st_15 from statictext within w_dw_from_select170315
end type
type st_16 from statictext within w_dw_from_select170315
end type
type cb_3 from commandbutton within w_dw_from_select170315
end type
type cb_1 from commandbutton within w_dw_from_select170315
end type
type st_4 from statictext within w_dw_from_select170315
end type
type st_3 from statictext within w_dw_from_select170315
end type
type rb_dwsyntax from radiobutton within w_dw_from_select170315
end type
type rb_sql from radiobutton within w_dw_from_select170315
end type
type dw_new from datawindow within w_dw_from_select170315
end type
type dw_columns from datawindow within w_dw_from_select170315
end type
type dw_tables from datawindow within w_dw_from_select170315
end type
type cb_create from commandbutton within w_dw_from_select170315
end type
type rb_grid from radiobutton within w_dw_from_select170315
end type
type rb_freeform from radiobutton within w_dw_from_select170315
end type
type rb_tabular from radiobutton within w_dw_from_select170315
end type
type cb_close from commandbutton within w_dw_from_select170315
end type
type st_2 from statictext within w_dw_from_select170315
end type
type st_1 from statictext within w_dw_from_select170315
end type
type mle_1 from multilineedit within w_dw_from_select170315
end type
type gb_1 from groupbox within w_dw_from_select170315
end type
type gb_dwtype from groupbox within w_dw_from_select170315
end type
type dw_criteria from datawindow within w_dw_from_select170315
end type
type ln_1 from line within w_dw_from_select170315
end type
type ln_2 from line within w_dw_from_select170315
end type
end forward

global type w_dw_from_select170315 from w_base_case
integer width = 5893
integer height = 2508
string title = "Create DataWindow from SQL or dwSyntax"
windowtype windowtype = popup!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
uo_style uo_style
dw_1 dw_1
uo_color uo_color
cb_4 cb_4
cb_ok cb_ok
mle_comments mle_comments
cb_2 cb_2
st_12 st_12
st_13 st_13
st_14 st_14
st_15 st_15
st_16 st_16
cb_3 cb_3
cb_1 cb_1
st_4 st_4
st_3 st_3
rb_dwsyntax rb_dwsyntax
rb_sql rb_sql
dw_new dw_new
dw_columns dw_columns
dw_tables dw_tables
cb_create cb_create
rb_grid rb_grid
rb_freeform rb_freeform
rb_tabular rb_tabular
cb_close cb_close
st_2 st_2
st_1 st_1
mle_1 mle_1
gb_1 gb_1
gb_dwtype gb_dwtype
dw_criteria dw_criteria
ln_1 ln_1
ln_2 ln_2
end type
global w_dw_from_select170315 w_dw_from_select170315

type variables
string is_report_type, is_table
string is_visiblecolumns[]
string is_object_name []
string is_hold_color []
string is_hold_backcolor []
string is_hold_backmode []
boolean is_text
boolean ib_updating



end variables

forward prototypes
public function string wf_build_sql_syntax ()
public function string wf_build_dw_syntax ()
public function integer wf_set_table_select (datawindow adw_datawindow)
public function integer wf_set_column_select (datawindow adw_datawindow, string as_tablename)
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public function string wf_replace_underscores_with_spaces (string a_instring)
public function integer wf_parse_obj_string (ref datawindow dw_arg, ref string obj_list[], string obj_type, string band)
public function string wf_update_item (datawindow adw_parm, string adw_type)
public function string wf_convert_height_to_points (datawindow adw_parm, string as_height)
public function string wf_get_token (string source, string separator)
public function integer wf_create_dw_criteria_syntax (string as_table, string as_criteria)
end prototypes

public function string wf_build_sql_syntax ();// This will build a sql syntax string based on the selected items in 
// the dw_columns and dw_tables datawindows.

// The function will return a string 

string	ls_columns, ls_column, ls_sql_syntax
long	ll_rows, ll_index

//Scan the columns datawindow and find all the selected columns. 
//Build a string of columns based on the selected rows.
ll_rows = dw_columns.RowCount ( )

For ll_index = 1 to ll_rows
	If dw_columns.IsSelected(ll_index) Then 
		If ls_columns <> "" Then ls_columns = ls_columns + ", "
//		ls_column = dw_columns.object.data[ll_index, 1]
		ls_column = dw_columns.GetItemString(ll_index, 1)
		ls_columns = ls_columns + ls_column
	End If
Next

//contsruct the sql string 
If ls_columns <> "" Then		
	// Construct the Select statement
	ls_sql_syntax = "Select " + ls_columns + " from " + is_table
	return ls_sql_syntax
Else
	return ""
End If
end function

public function string wf_build_dw_syntax ();//This function will build the datawindow syntax based on the columns, and rows
//selected and the radio button for datawindow style.

//The function returns a string with the syntax in it.

string	ls_dw_err,	ls_dw_syntax, ls_style,	ls_sql_syntax

// Construct the style options
ls_style = "style(type=" + is_report_type + ") datawindow(units=2 )"

// Create the DW syntax from the select
ls_dw_err = ""

//If there is now sql then do not build a syntax string
ls_sql_syntax =  wf_build_sql_syntax()
If ls_sql_syntax = "" Then
	return ""
Else
	ls_dw_syntax = SyntaxFromSQL(sqlca, wf_build_sql_syntax(), ls_style, ls_dw_err)
	if ls_dw_err <> "" then
		//MessageBox("Error!", ls_dw_err)
		is_resultlog += wf_result_add("wf_build_dw_syntax", ls_dw_err, False)
	end if
	return ls_dw_syntax
End If

end function

public function integer wf_set_table_select (datawindow adw_datawindow);//**********************************************************************
//		Function Declaration
// Integer FUNCTION f_set_table_select (REF adw_datawindow)
//
//		Passing adw_datawindow by reference is necessary because it's sql statement
//		is going to be changed adw_datawindow, sets appropriate
//		SQL Select statement for selecting  tablenames from system catalog
//***********************************************************************

string	ls_sql
integer	li_PosUid, li_PosEqual, li_PosSemiColon

choose case Upper(Left(sqlca.dbms,3) )

	case "GUP"		// Gupta SQLBase
		ls_sql = "SELECT DISTINCT SYSADM.PBCATTBL.PBT_TNAM, SYSADM.PBCATTBL.PBT_CMNT " &  
			   + " FROM SYSADM.PBCATTBL " &  
			   + " WHERE SYSADM.PBCATTBL.PBT_OWNR = '" &
				+ Upper(sqlca.userid) + "' order by 1 ASC"   ;
	
	case "ODB"		// ODBC
		//******************************************************************
		//	since UserId can be blank for ODBC, we will have to 
		// Look at the DBPARM values  This code may be specific to 
		// the values that watcom uses in the DBPARAM and may need to be
		// Updated for other ODBC interfaces
		//******************************************************************
		If sqlca.userid = "" then
			li_posuid = Pos(sqlca.dbparm, "UID", 1)
			li_posequal = Pos(sqlca.dbparm, "=", li_posuid)
			li_possemicolon = Pos(sqlca.dbparm, ";", li_posequal)
			sqlca.userid = Mid(sqlca.dbparm, li_posequal + 1, li_possemicolon - &
				 (li_posequal +1 ))
		End If

		ls_sql = 'SELECT DISTINCT "DBA"."PBCATTBL"."PBT_TNAM", "DBA"."PBCATTBL"."PBT_CMNT" ' &  
			   + ' FROM "DBA"."PBCATTBL" ' &  
			   + ' WHERE "DBA"."PBCATTBL"."PBT_OWNR" = ~'' &
				+ Upper(sqlca.userid) + '~' order by 1 ASC'   ;

	case "XDB"		// XDB
		ls_sql = "Select DISTINCT PBCATTBL.PBT_TNAM, PBCATTBL.PBT_CMNT " &
				+ " from PBCATTBL where PBT_OWNR = '" & 
				+ Upper(sqlca.userid) + "' order by 1 ASC"

	case "SYB", "SYC", "OLE"	// Sybase SQL Server
	   ls_sql = "SELECT DISTINCT pbcattbl.pbt_tnam, pbcattbl.pbt_cmnt " &  
	         + " FROM pbcattbl order by 1 ASC"

	case "ORA", "OR6", "OR7"	// ORACLE
		ls_sql = "SELECT DISTINCT SYSTEM.PBCATTBL.PBT_TNAM, SYSTEM.PBCATTBL.PBT_CMNT " &  
			   + " FROM SYSTEM.PBCATTBL " &  
			   + " WHERE system.PBCATTBL.PBT_OWNR = '" &
				+ Upper(sqlca.logid) + "' order by 1 ASC"   ;

	case "HPA"		// ALLBASE/SQL
		ls_sql = "SELECT DISTINCT SYSSQL.PBCATTBL.PBT_TNAM, SYSSQL.PBCATTBL.PBT_CMNT " &  
			   + " FROM SYSSQL.PBCATTBL " &  
			   + " WHERE syssql.PBCATTBL.PBT_OWNR = '" &
				+ Upper(sqlca.userid) + "' order by 1 ASC"   ;

	case "INF"		// INFORMIX
		ls_sql = "Select DISTINCT PBT_TNAM, PBT_CMNT " &
				+ "from 'informix'.PBCATTBL " &
				+ "where PBT_OWNR = '" + sqlca.logid &
				+ "' order by 1 ASC"

	case ELSE
		is_resultlog += wf_result_add("wf_set_table_select","Unknown Database Name!", False)
end choose

if Len(ls_sql) > 0 then
	Return adw_datawindow.SetSQLSelect(ls_sql)
else
	return -1
end if

end function

public function integer wf_set_column_select (datawindow adw_datawindow, string as_tablename);// Integer Function F_SET_COLUMN_SELECT (dw_arg, as_tablename)

// In adw_datawindow, sets appropriate SQL Select statement for selecting 
// column names and labels for a specified table from system catalog

string	ls_sql
integer	li_ReturnCode

choose case Upper(Left(sqlca.dbms,3) )

	case "SYB", "SYC" 	// Sybase SQL Server
		ls_sql = 'Select pbc_cnam,' &
				+ ' pbc_cmnt ' &
				+ 'from pbcatcol ' &
				+ 'where (object_id(~'' + as_tablename + '~')' &
				+ ' = pbc_tid) order by pbc_cnam ASC'

	case "GUP"		// SQLBase
		ls_sql = "Select PBC_CNAM, PBC_CMNT " &
				+ "from sysadm.PBCATCOL " &
				+ "where PBC_TNAM = '" + Upper(as_tablename) &
				+ "' and PBC_OWNR = '" + Upper(sqlca.userid) &
				+ "' order by 1 ASC"

	case "ODB"		// ODBC
		ls_sql = "Select PBC_CNAM, PBC_CMNT " &
				+ "from PBCATCOL " &
				+ "where PBC_TNAM = '" + Upper(as_tablename) &
				+ "' and PBC_OWNR = '" + Upper(sqlca.userid) &
				+ "' order by 1 ASC"

	case "XDB"		// XDB
		ls_sql = "Select PBC_CNAM, PBC_CMNT " &
				+ "from PBCATCOL " &
				+ "where PBC_TNAM = '" + Upper(as_tablename) &
				+ "' and PBC_OWNR = '" + Upper(sqlca.userid) &
				+ "' order by 1 ASC"

	case "ORA", "OR6", "OR7"	// ORACLE
		ls_sql = "Select PBC_CNAM, PBC_CMNT " &
				+ "from system.PBCATCOL " &
				+ "where PBC_TNAM = '" + Upper(as_tablename) &
				+ "' and PBC_OWNR = '" + Upper(sqlca.logid) &
				+ "' order by 1 ASC"

	case "HPA"		// ALLBASE/SQL
		ls_sql = "Select PBC_CNAM, PBC_CMNT " &
				+ "from syssql.PBCATCOL " &
				+ "where PBC_TNAM = '" + Upper(as_tablename) &
				+ "' and PBC_OWNR = '" + Upper(sqlca.userid) &
				+ "' order by 1 ASC"

	case "INF"		// INFORMIX
		ls_sql = "Select PBC_CNAM, PBC_CMNT " &
				+ "from 'informix'.PBCATCOL " &
				+ "where PBC_TNAM = '" + as_tablename &
				+ "' and PBC_OWNR = '" + sqlca.logid &
				+ "' order by 1 ASC"
	case "OLE","SNC"		// Sqlserver
		ls_sql = "Select pbc_cnam," &
				+ " pbc_cmnt " &
				+ "from pbcatcol " &
				+ "where  PBC_TNAM = '" + Upper(as_tablename) &
				+ "' order by 1 ASC"

end choose

if Len(ls_sql) > 0 then
	li_ReturnCode = adw_datawindow.SetSQLSelect(ls_sql)
	return li_ReturnCode
else
	return -1
end if

end function

public subroutine of_testcase_point_module ();//Datawindows-->Dynamic Creation-->Create from SQL or DWSyntax
//Clicked script for cb_syntax
string 	ls_sql_syntax, ls_style, ls_dw_syntax, ls_dw_err, ls_classname, ls_filename, ls_dw_data
long i, j, ll_count, ll_row
n_resource_manager ln_resource_manager

ls_classname = this.classname()
// select table :employee

for  i = 1 to 2
	if i = 1 then
		is_table =  "employee"
	elseif i = 2 then
		is_table =  "product"
	end if
	dw_tables.selectrow(0, False)
	ll_row = dw_tables.find("tname = '" +is_table +"'", 1, dw_tables.rowcount())
	if ll_row > 0 then
		dw_tables.selectrow(ll_row, True)
		If wf_set_column_select(dw_columns,is_table) < 0 Then
			is_resultlog += wf_result_add("testcasepoint1","Unable to Set SQL Select statement For Columns list", False)
		End If
		ll_row = dw_columns.Retrieve( )	
		if ll_row <= 0 then
			is_resultlog += wf_result_add("testcasepoint1","Unable to Get Columns list from table " + is_table, False)
		end if
		dw_columns.selectrow(0, True) 
	Else
		is_resultlog += wf_result_add("testcasepoint1","Unable to get table " + is_table , False)
	end if
	
	// 拼接sql语法
	ls_sql_syntax = wf_build_sql_syntax ()
	is_resultlog += wf_result_add("testcasepoint1","sql syntax " + ls_sql_syntax, Len(ls_sql_syntax) > 0 )
	
	// 动态生成form格式datawindow
	is_report_type = "form"
	ls_filename = ls_classname +"_" + is_table + "_" + is_report_type
	ls_style = "style(type=" + is_report_type + ")"
	ls_dw_syntax = SyntaxFromSQL(sqlca, ls_sql_syntax, ls_style, ls_dw_err)
	If ls_dw_err <> "" Then
		is_resultlog += wf_result_add("testcasepoint1", ls_filename + " SyntaxFromSQL error:" +ls_dw_err, False)
		Return
	Else
		is_resultlog += wf_result_add("testcasepoint1", ls_filename + " SyntaxFromSQL", True)
	End If
	dw_new.Create(ls_dw_syntax)
	// 比较生成的syntax是否相等，比较时先将头部的版本(release 12.6;)信息清除
	ls_dw_data = ln_resource_manager.f_get_resource(ls_filename+ ".txt")
	ls_dw_data = mid(ls_dw_data, pos(ls_dw_data, ";") + 1 )
	ls_dw_syntax = mid(ls_dw_syntax, pos(ls_dw_syntax, ";") + 1 )
	is_resultlog += wf_result_add("testcasepoint1", ls_filename + " Datawindow syntax equal", ls_dw_data = ls_dw_syntax )
	//Retrieve into the new datawindow
	dw_new.SetTransObject(sqlca)
	ll_count = dw_new.Retrieve( )
	is_resultlog += wf_result_add("testcasepoint1", ls_filename + " Datawindow retrieved", ll_count > 0 )
	
	// 动态生成tabular格式datawindow
	is_report_type = "tabular"
	ls_filename = ls_classname +"_" + is_table + "_" + is_report_type
	ls_style = "style(type=" + is_report_type + ")"
	ls_dw_syntax = SyntaxFromSQL(sqlca, ls_sql_syntax, ls_style, ls_dw_err)
	If ls_dw_err <> "" Then
		is_resultlog += wf_result_add("testcasepoint1", ls_filename + " SyntaxFromSQL error:" +ls_dw_err, False)
		Return
	Else
		is_resultlog += wf_result_add("testcasepoint1", ls_filename + " SyntaxFromSQL", True)
	End If
	dw_new.Create(ls_dw_syntax)
	// 比较生成的syntax是否相等，比较时先将头部的版本(release 12.6;)信息清除
	ls_dw_data = ln_resource_manager.f_get_resource(ls_filename+ ".txt")
	ls_dw_data = mid(ls_dw_data, pos(ls_dw_data, ";") + 1 )
	ls_dw_syntax = mid(ls_dw_syntax, pos(ls_dw_syntax, ";") + 1 )
	is_resultlog += wf_result_add("testcasepoint1", ls_filename + " Datawindow syntax equal", ls_dw_data = ls_dw_syntax )
	//Retrieve into the new datawindow
	dw_new.SetTransObject(sqlca)
	ll_count = dw_new.Retrieve( )
	is_resultlog += wf_result_add("testcasepoint1", ls_filename + " Datawindow retrieved", ll_count > 0 )
	
	// 动态生成grid格式datawindow
	is_report_type = "grid"
	ls_filename = ls_classname +"_" + is_table + "_" + is_report_type
	ls_style = "style(type=" + is_report_type + ")"
	ls_dw_syntax = SyntaxFromSQL(sqlca, ls_sql_syntax, ls_style, ls_dw_err)
	If ls_dw_err <> "" Then
		is_resultlog += wf_result_add("testcasepoint1", ls_filename + " SyntaxFromSQL error:" +ls_dw_err, False)
		Return
	Else
		is_resultlog += wf_result_add("testcasepoint1", ls_filename + " SyntaxFromSQL", True)
	End If
	dw_new.Create(ls_dw_syntax)
	// 比较生成的syntax是否相等，比较时先将头部的版本(release 12.6;)信息清除
	ls_dw_data = ln_resource_manager.f_get_resource(ls_filename+ ".txt")
	ls_dw_data = mid(ls_dw_data, pos(ls_dw_data, ";") + 1 )
	ls_dw_syntax = mid(ls_dw_syntax, pos(ls_dw_syntax, ";") + 1 )
	is_resultlog += wf_result_add("testcasepoint1", ls_filename + " Datawindow syntax equal", ls_dw_data = ls_dw_syntax )
	//Retrieve into the new datawindow
	dw_new.SetTransObject(sqlca)
	ll_count = dw_new.Retrieve( )
	is_resultlog += wf_result_add("testcasepoint1", ls_filename + " Datawindow retrieved", ll_count > 0 )
next
end subroutine

public subroutine of_testcase_point_module1 ();//Datawindows-->Dynamic Creation-->Runtime Datawindow Painter
/*
This example uses the SyntaxFromSQL function to dynamically build a DataWindow from an SQL Statement. 
Once the DataWindow has been created, the Describe( ) function is used to display some of the attribute values of columns in the DataWindow.  
The Modify( ) function is used to change the values of these attributes.  
*/

//测试动态生成department表
//select * from department where dept_id < 600 order by dept_id desc;

string 	ls_sql_syntax, ls_style, ls_dw_syntax, ls_dw_err, ls_classname, ls_filename, ls_dw_data, ls_modify, ls_colname
long i, j, ll_count, ll_row
n_resource_manager ln_resource_manager

ls_classname = this.classname()
// select table :department
ls_filename = ls_classname + "_dw_criteria2_grid"

// 选择表
is_table = "department"
dw_tables.selectrow(0, False)
ll_row = dw_tables.find("tname = '" +is_table +"'", 1, dw_tables.rowcount())
if ll_row > 0 then
	dw_tables.selectrow(ll_row, True)
	If wf_set_column_select(dw_columns,is_table) < 0 Then
		is_resultlog += wf_result_add("testcasepoint2","Unable to Set SQL Select statement For Columns list", False)
	End If
	ll_row = dw_columns.Retrieve( )	
	if ll_row <= 0 then
		is_resultlog += wf_result_add("testcasepoint2","Unable to Get Columns list from table " + is_table, False)
	end if
	dw_columns.selectrow(0, True) 
Else
	is_resultlog += wf_result_add("testcasepoint2","Unable to get table " + is_table , False)
end if

// 创建dw_criteria
wf_create_dw_criteria_syntax(is_Table, "where dept_id < 600 order by dept_id desc")

// 选择列
for i = 1 to ll_row
	ls_colname = dw_columns.getitemstring(i, 'cname')
	is_VisibleColumns[UpperBound(is_VisibleColumns) + 1 ] = ls_colname
	ls_modify += ls_colname + '.visible="1" '
next
ls_modify += "DataWindow.QuerySort=yes"
dw_criteria.Modify ( ls_modify )
cb_ok.enabled = TRUE

// 判断dw_criteria modify后语法是否正确
ls_dw_data = ln_resource_manager.f_get_resource(ls_filename+ ".txt")
ls_dw_data = mid(ls_dw_data, pos(ls_dw_data, ";") + 1 )
ls_dw_syntax = dw_criteria.Describe("DataWindow.Syntax")
ls_dw_syntax = mid(ls_dw_syntax, pos(ls_dw_syntax, ";") + 1 )
is_resultlog += wf_result_add("testcasepoint2", ls_filename + " Datawindow syntax equal", ls_dw_data = ls_dw_syntax )


//// 在dw_criteria中设置查询条件
//// 当DataWindow.QuerySort=yes时，没有找到方法通过代码赋值到dw_criteria，所以无法动态指定值


// 动态生成grid格式datawindow
is_report_type = "grid"
ls_sql_syntax = "select * from department where dept_id < 600 order by dept_id desc";
ls_filename= ls_classname+"_" + is_table + "_" + is_report_type
ls_style = 'style(type=grid)' + &
			'Text(background.mode=0 background.color=1073741824 color=0 ' +&
			'font.face = "MS Sans Serif"  font.height = -10  font.weight = 400 font.family = 2 ' + &
					'font.pitch=2  ) ' + &
			'Column(background.mode=0 background.color=1073741824 color=0 ' +&
			'font.face = "MS Sans Serif"  font.height = -8  font.weight = 400 font.family = 2 ' + &
					'font.pitch = 2 ) ' 

ls_dw_syntax = SyntaxFromSQL(sqlca, ls_sql_syntax, ls_style, ls_dw_err)
If ls_dw_err <> "" Then
	is_resultlog += wf_result_add("testcasepoint2", ls_filename + " SyntaxFromSQL error:" +ls_dw_err, False)
	Return
Else
	is_resultlog += wf_result_add("testcasepoint2", ls_filename + " SyntaxFromSQL", True)
End If
dw_1.Create(ls_dw_syntax)
// 比较生成的syntax是否相等，比较时先将头部的版本(release 12.6;)信息清除
ls_dw_data = ln_resource_manager.f_get_resource(ls_filename+ ".txt")
ls_dw_data = mid(ls_dw_data, pos(ls_dw_data, ";") + 1 )
ls_dw_syntax = mid(ls_dw_syntax, pos(ls_dw_syntax, ";") + 1 )
is_resultlog += wf_result_add("testcasepoint2", ls_filename + " Datawindow syntax equal", ls_dw_data = ls_dw_syntax )
//Retrieve into the dw_1 datawindow
dw_1.SetTransObject(sqlca)
ll_count = dw_1.Retrieve( )
is_resultlog += wf_result_add("testcasepoint2", ls_filename + " Datawindow retrieved rows:" + string(ll_count), ll_count > 0 )


// modify 语法暂时就不作比较，不是这个案例的测试点

end subroutine

public function string wf_replace_underscores_with_spaces (string a_instring);// string Function wf_replace_underscores_with_spaces (string a_instring)

// Returns value of a_instring with each underscore replaced by a space character

int		p
string	s_in, s_out

s_in = a_instring
p = Pos ( s_in, '_' )

do while p > 0
	s_out =	s_out + Left ( s_in, p -1 ) + ' '
	s_in   = Mid ( s_in, p +1)	
	p = Pos (s_in, '_' )
loop

s_out = s_out + s_in

return  s_out

end function

public function integer wf_parse_obj_string (ref datawindow dw_arg, ref string obj_list[], string obj_type, string band);string obj_string, obj_holder
int obj_count, start_pos=1, tab_pos, count = 0

obj_string = dw_arg.Describe("datawindow.objects")

tab_pos =  Pos(obj_string,"~t",start_pos)
DO WHILE tab_pos > 0
	obj_holder = Mid(obj_string,start_pos,(tab_pos - start_pos))
	IF (dw_arg.Describe(obj_holder+".type") = obj_type or obj_type = "*") AND &
		 (dw_arg.Describe(obj_holder+".band") = band or band = "*") THEN
			count = count + 1
			obj_list[count] = obj_holder
	END IF
start_pos = tab_pos + 1
tab_pos =  Pos(obj_string,"~t",start_pos)	
LOOP 
obj_holder = Mid(obj_string,start_pos,Len(obj_string))
IF (dw_arg.Describe(obj_holder+".type") = obj_type or obj_type = "*") AND &
		 (dw_arg.Describe(obj_holder+".band") = band or band = "*") THEN
	count = count + 1
	obj_list[count] = obj_holder
END IF

Return count
end function

public function string wf_update_item (datawindow adw_parm, string adw_type);//This is called from the User Object Style Bar or User Object Color bar when its values
//are changed
object_style170315 lstr_style
string	ls_f_color, ls_b_color, ls_mod_string, ls_rc, ls_change_type
int		li_index

//If setting items, dont want to trigger updates
If ib_updating Then Return ""

SetPointer(HourGlass!)

// Set up modIfy string and execute Modify For all selected objects
For li_index = 1 to UpperBound(is_object_name)
	If is_object_name [li_index] = "" then continue

	//set colors
	If adw_type = "fore_color" then
		//get attributes from color bar
		uo_color.uf_get_colors(ls_f_color, ls_b_color)
		is_hold_color[li_index] = ls_f_color
		ls_mod_string = ls_mod_string + is_object_name[li_index] + ".color=~"" + ls_f_color + "~" "
	ElseIf adw_type = "back_color" then
		uo_color.uf_get_colors(ls_f_color, ls_b_color)
		is_hold_backcolor[li_index] = ls_b_color

		// If mode is transparent, reset to transparent (may have been Forced
		// to opaque when selected); otherwise set background color
		If is_hold_backmode[li_index] = "1" then
			ls_mod_string = ls_mod_string + is_object_name[li_index] + '.background.mode="1" '
		else
			ls_mod_string = ls_mod_string + is_object_name[li_index] + ".background.color=~"" + ls_b_color + "~" "
		end If

		//set font
	ElseIf adw_type = "font" then
		// get attributes from style bar
		ls_change_type = uo_style.uf_get_style(lstr_style)

		//This will change the appropriate font attribute
		Choose Case lower(ls_change_type)
		
		Case "font"
			ls_mod_string = ls_mod_string + is_object_name[li_index] + ".font.face=~"" + lstr_style.font_face + "~" "
		Case "bold"
			ls_mod_string = ls_mod_string + is_object_name[li_index] + ".font.weight=~"" + lstr_style.font_weight + "~" "
		Case "italic"
			ls_mod_string = ls_mod_string + is_object_name[li_index] +".font.italic=~"" + lstr_style.italic + "~" "
		Case "underline"
			ls_mod_string = ls_mod_string + is_object_name[li_index] +".font.underline=~"" + lstr_style.underline + "~" "
		Case "border"
			ls_mod_string = ls_mod_string + is_object_name[li_index] + ".border=~"" + lstr_style.border + "~" "
		Case "size"
			lstr_style.font_height = String(Integer(lstr_style.font_height) * -1)
			ls_mod_string = ls_mod_string + is_object_name[li_index] + ".font.height=~"" + lstr_style.font_height + "~" "
		Case "left", "right", "center"
			ls_mod_string = ls_mod_string + is_object_name[li_index] + ".alignment=~"" + lstr_style.alignment + "~" "
		Case "text"
			If is_text then 
				//check For nested quotes
				lstr_style.text = f_remove_char170315 ( lstr_style.text, "~"" )
				ls_mod_string = ls_mod_string + is_object_name[li_index] + ".text=~"" + lstr_style.text + "~" "
			End If
		End Choose

	End If
Next


//Apply the change
If ls_mod_string <> "" Then
	ls_rc = dw_1.Modify(ls_mod_string)
End If


return ls_rc
end function

public function string wf_convert_height_to_points (datawindow adw_parm, string as_height);string 	ls_units
int		li_converted

li_converted = Integer(as_height)

ls_units = adw_parm.describe ("datawindow.units")
choose case ls_units
	case "0" //pb units
		li_converted = li_converted / 4
	case "1" //pixels
		li_converted = li_converted 
	case "2" //inches
		li_converted = li_converted / 12
	case "3" //cm
		li_converted = li_converted / 31
end choose

Return String(li_converted)
end function

public function string wf_get_token (string source, string separator);// String Function GET_TOKEN (ref string Source, string Separator)

// The function Get_Token receive, as arguments, the string from which
// the token is to be stripped off, from the left, and the separator
// character.  If the separator character does not appear in the string,
// it returns the entire string.  Otherwise, it returns the token, not
// including the separator character.  In either case, the source string
// is truncated on the left, by the length of the token and separator
// character, if any.


int 		p
string 	ret

p = Pos(source, separator)	// Get the position of the separator

if p = 0 then					// if no separator, 
	ret = source				// return the whole source string and
	source = ""					// make the original source of zero length
else
	ret = Mid(source, 1, p - 1)	// otherwise, return just the token and
	source = Right(source, Len(source) - p)	// strip it & the separator
end if

return ret
end function

public function integer wf_create_dw_criteria_syntax (string as_table, string as_criteria);
Integer		li_index, li_num_of_gobs, li_rc
String		ls_name, ls_tname , ls_sql_syntax , ls_dw_syntax , ls_errors, ls_filename, ls_dw_data
String		dw_style , ls_hdgs[] , ls_cols[] , cols_no_underscores[]
String 		ls_emptyarray []
n_resource_manager ln_resource_manager

/******************************************************************************************************
	Clear out DataObject name (if any), in case user has already selected a table, and
	now is selecting a different one
 ******************************************************************************************************/
ls_filename = this.classname() + "_dw_criteria1_grid"

is_visiblecolumns[] = ls_emptyarray[]
/******************************************************************************************************
	Note that the Repository definitions for fonts prevail over the parameters specified
	in dw_style, below.  Thus, the several Modify commands after the Create, below.
******************************************************************************************************/
dw_style =	'style(Type=grid) ' + &
				'Text(font.face="MS Sans Serif"  font.Height=12  font.weight=400 font.family=2 ' + &
						'font.pitch=2 font.charset=0) ' + &
				'Column(font.face="MS Sans Serif"  font.Height=12  font.weight=400 font.family=2 ' + &
						'font.pitch=2 font.charset=0) ' 


mle_comments.Text = '~tRetrieving Column NameS For table ' + Lower ( as_table ) + '...'



//	Build generic SELECT statement and generate DataWindow syntax
ls_sql_syntax = 'SELECT * FROM ' + as_table + " " + as_criteria
ls_dw_syntax = SQLCA.SyntaxFromSQL( ls_sql_syntax, dw_style, ls_errors)


If ls_errors <> "" Then
	is_resultlog += wf_result_add("testcasepoint2", ls_filename + " SyntaxFromSQL error:" +ls_errors, False)
Else
	is_resultlog += wf_result_add("testcasepoint2", ls_filename + " SyntaxFromSQL", True)
End If

// If no ls_errors (there shouldn't be any), create the Criteria grid-style DataWindow
If Len(ls_errors) = 0 Then
	If dw_criteria.Create (ls_dw_syntax) > 0 Then
		dw_criteria.Modify ('datawindow.Detail.Height=70 ')

		//  Insert 6 rows for Sort & Criteria
		For li_index = 1 to 6						
			dw_criteria.InsertRow ( 0 )
		Next

 		//	Get names of heading-text items into hdgs[ ] array, 
		// and names of column items into cols[ ] array.
		li_num_of_gobs= wf_parse_obj_string(dw_criteria, ls_hdgs, "text", "header")
		li_num_of_gobs= wf_parse_obj_string(dw_criteria, ls_cols, "column", "detail")

		//	For each column (and its heading), set font and other attributes.  Also, make
		//	each of them invisible for now.
 
		For li_index = 1 to li_num_of_gobs
			//	Substitute spaces for underscores in column names.
			cols_no_underscores[li_index] = wf_replace_underscores_with_spaces( ls_cols[li_index] )

			//	Build the Modify command string
			ls_name = 'datawindow.header.Height=70 ' + &
			ls_hdgs[li_index] + '.Text="***~tWordcap(~'' + cols_no_underscores[li_index] + '~' )" ' + &
			ls_hdgs[li_index] + '.Font.Face="MS Sans Serif" ' + &
			ls_hdgs[li_index] + '.Font.Height="60" ' + &
			ls_hdgs[li_index] + '.Height="60" ' + &
			ls_hdgs[li_index] + '.Font.Weight="400" ' + &
			ls_hdgs[li_index] + '.Font.Family="0" ' + &
			ls_hdgs[li_index] + '.Font.Pitch="2" ' + &
			ls_hdgs[li_index] + '.Font.Charset="0" ' + &
			ls_cols[li_index]  + '.y="4" ' + &
			ls_cols[li_index] + '.Font.Face="MS Sans Serif" ' + &
			ls_cols[li_index] + '.Font.Height="52" ' + &
			ls_cols[li_index] + '.Height="60" ' + &
			ls_cols[li_index] + '.Font.Weight="400" ' + &
			ls_cols[li_index] + '.Font.Family="0" ' + &
			ls_cols[li_index] + '.Font.Pitch="2" ' + &
			ls_cols[li_index] + '.Font.Charset="0" ' + &
			ls_cols[li_index] + '.Visible="0" ' + &
			' '
			dw_criteria.Modify (ls_name)
		Next
	else
		is_resultlog += wf_result_add("testcasepoint2", "dw_criteria Create", False)
		return -1
	End If
else
	return -1
End If
mle_comments.Text = ''
dw_criteria.setTransObject(sqlca)
cb_ok.enabled = false

// 比较生成的syntax是否相等，比较时先将头部的版本(release 12.6;)信息清除
ls_dw_data = ln_resource_manager.f_get_resource(ls_filename+ ".txt")
ls_dw_data = mid(ls_dw_data, pos(ls_dw_data, ";") + 1 )
ls_dw_syntax = dw_criteria.Describe("DataWindow.Syntax")
ls_dw_syntax = mid(ls_dw_syntax, pos(ls_dw_syntax, ";") + 1 )
is_resultlog += wf_result_add("testcasepoint2", ls_filename + " Datawindow syntax equal", ls_dw_data = ls_dw_syntax )

return 1
end function

on w_dw_from_select170315.create
int iCurrent
call super::create
this.uo_style=create uo_style
this.dw_1=create dw_1
this.uo_color=create uo_color
this.cb_4=create cb_4
this.cb_ok=create cb_ok
this.mle_comments=create mle_comments
this.cb_2=create cb_2
this.st_12=create st_12
this.st_13=create st_13
this.st_14=create st_14
this.st_15=create st_15
this.st_16=create st_16
this.cb_3=create cb_3
this.cb_1=create cb_1
this.st_4=create st_4
this.st_3=create st_3
this.rb_dwsyntax=create rb_dwsyntax
this.rb_sql=create rb_sql
this.dw_new=create dw_new
this.dw_columns=create dw_columns
this.dw_tables=create dw_tables
this.cb_create=create cb_create
this.rb_grid=create rb_grid
this.rb_freeform=create rb_freeform
this.rb_tabular=create rb_tabular
this.cb_close=create cb_close
this.st_2=create st_2
this.st_1=create st_1
this.mle_1=create mle_1
this.gb_1=create gb_1
this.gb_dwtype=create gb_dwtype
this.dw_criteria=create dw_criteria
this.ln_1=create ln_1
this.ln_2=create ln_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_style
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.uo_color
this.Control[iCurrent+4]=this.cb_4
this.Control[iCurrent+5]=this.cb_ok
this.Control[iCurrent+6]=this.mle_comments
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.st_12
this.Control[iCurrent+9]=this.st_13
this.Control[iCurrent+10]=this.st_14
this.Control[iCurrent+11]=this.st_15
this.Control[iCurrent+12]=this.st_16
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_1
this.Control[iCurrent+15]=this.st_4
this.Control[iCurrent+16]=this.st_3
this.Control[iCurrent+17]=this.rb_dwsyntax
this.Control[iCurrent+18]=this.rb_sql
this.Control[iCurrent+19]=this.dw_new
this.Control[iCurrent+20]=this.dw_columns
this.Control[iCurrent+21]=this.dw_tables
this.Control[iCurrent+22]=this.cb_create
this.Control[iCurrent+23]=this.rb_grid
this.Control[iCurrent+24]=this.rb_freeform
this.Control[iCurrent+25]=this.rb_tabular
this.Control[iCurrent+26]=this.cb_close
this.Control[iCurrent+27]=this.st_2
this.Control[iCurrent+28]=this.st_1
this.Control[iCurrent+29]=this.mle_1
this.Control[iCurrent+30]=this.gb_1
this.Control[iCurrent+31]=this.gb_dwtype
this.Control[iCurrent+32]=this.dw_criteria
this.Control[iCurrent+33]=this.ln_1
this.Control[iCurrent+34]=this.ln_2
end on

on w_dw_from_select170315.destroy
call super::destroy
destroy(this.uo_style)
destroy(this.dw_1)
destroy(this.uo_color)
destroy(this.cb_4)
destroy(this.cb_ok)
destroy(this.mle_comments)
destroy(this.cb_2)
destroy(this.st_12)
destroy(this.st_13)
destroy(this.st_14)
destroy(this.st_15)
destroy(this.st_16)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.rb_dwsyntax)
destroy(this.rb_sql)
destroy(this.dw_new)
destroy(this.dw_columns)
destroy(this.dw_tables)
destroy(this.cb_create)
destroy(this.rb_grid)
destroy(this.rb_freeform)
destroy(this.rb_tabular)
destroy(this.cb_close)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_1)
destroy(this.gb_1)
destroy(this.gb_dwtype)
destroy(this.dw_criteria)
destroy(this.ln_1)
destroy(this.ln_2)
end on

event close;//Close script for w_dw_from_select

sqlca.AutoCommit = False


end event

event ue_preopen;call super::ue_preopen;//Open script for w_dw_from_select

long	ll_ret

// For new datawindows, the default units will be inches, the default
// style will be tabular.
is_report_type = "tabular"


sqlca.AutoCommit = True

dw_columns.SetTransObject(sqlca)
dw_tables.SetTransObject(sqlca)

// f_set_table_select is a user function to modify the select used by
// the table selection data window, based on which DBMS we're connected
// to; This function adjusts to the differences in catalog structures
// between the DBMS's

if wf_set_table_select(dw_tables) < 0 then
	is_resultlog += wf_result_add("ue_preopen","Unable to set SQL select statement for tables list", False)
	//this.TriggerEvent(Close!)
end if

ll_ret = dw_tables.Retrieve( )
if ll_ret < 1 then
	is_resultlog += wf_result_add("ue_preopen","Retrieve return code is:"+ string(ll_ret), False)
	//MessageBox ("Retrieve return code is:", ll_ret)
end if


end event

type uo_style from u_style_bar170315 within w_dw_from_select170315
event destroy ( )
integer x = 2912
integer y = 784
integer taborder = 120
end type

on uo_style.destroy
call u_style_bar170315::destroy
end on

event ue_style_changed;call super::ue_style_changed;string	ls_rc 
ls_rc = wf_update_item(dw_1,"font")
If ls_rc <> "" then 
	messagebox("dwmodify err",ls_rc)
end if

end event

type dw_1 from datawindow within w_dw_from_select170315
event ue_leftbuttonup pbm_lbuttonup
integer x = 2926
integer y = 944
integer width = 2807
integer height = 1168
integer taborder = 120
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_leftbuttonup;//left button up on datawindow
object_style170315 lstr_style
string ls_mod_string, ls_obj_name, ls_backcolor
int li_index

// If previous objects were selected and the cntl key is not down,
// this is not a multi-select and we must de-select all prior selected
// objects by resetting the Foreground and background colors 
// to the old values

If KeyDown(keycontrol!) = false and UpperBound(is_object_name) > 0 then
	For li_index = 1 to UpperBound(is_object_name)
		If is_object_name[li_index] <> "" then
			// Original background transparent? Set it back to transparent
			If is_hold_backmode [li_index] = "1" then
				ls_backcolor = is_object_name [li_index] + ".background.mode=~"1~"" 
			else
				ls_backcolor = is_object_name [li_index] + ".background.color=~"" + &
								is_hold_backcolor[li_index] + "~""
			end If
			ls_mod_string = is_object_name[li_index] + ".color=~"" + is_hold_color[li_index] + &
							"~" " + ls_backcolor
			dw_1.Modify(ls_mod_string)
			is_object_name[li_index] = ""
		end If
	next
end If

// Get the is_object_name of the object selected;
ls_obj_name = dw_1.GetObjectAtPointer( )
If ls_obj_name = "" then Return
ls_obj_name = wf_get_token(ls_obj_name, "~t")

// find the next available slot and leave its index in i
If UpperBound(is_object_name) = 0 then
	li_index = 1
else
	For li_index = 1 to UpperBound(is_object_name)
		// If this object is already selected, do nothing
		If is_object_name [li_index] = ls_obj_name then return
		If is_object_name [li_index] = "" then exit
	next
end If

// Put the object name in the selected list
is_object_name[li_index] = ls_obj_name

// Remember its current Foreground and background colors
is_hold_color[li_index] = dw_1.Describe(ls_obj_name + ".color")
is_hold_backcolor [li_index] = dw_1.Describe(ls_obj_name + ".background.color")
is_hold_backmode [li_index] = dw_1.Describe(ls_obj_name + ".background.mode")


// For now, If no text color was specIfied in the create, Force it
// to black
If is_hold_color[li_index] = "?" then is_hold_color[li_index] = "0"

// If background is transparent, use the datawindow background color
If is_hold_backmode [li_index] = "1" then
	is_hold_backcolor [li_index] = dw_1.Describe("datawindow.color")
end If

// Get the current style bar attributes For the object
lstr_style.font_face = dw_1.Describe(ls_obj_name + ".font.face")
lstr_style.font_weight = dw_1.Describe(ls_obj_name + ".font.weight") 
lstr_style.italic = dw_1.Describe(ls_obj_name + ".font.italic")
lstr_style.underline = dw_1.Describe(ls_obj_name + ".font.underline")
lstr_style.border = dw_1.Describe(ls_obj_name + ".border")
lstr_style.alignment = dw_1.Describe(ls_obj_name + ".alignment")
lstr_style.font_height = dw_1.Describe(ls_obj_name + ".font.height")

//negative height means its already in points
If Integer(lstr_style.font_height) > 0 Then 
	lstr_style.font_height = 	wf_convert_height_to_points(dw_1,lstr_style.font_height)
else
	//strip negative sign
	lstr_style.font_height =  String(Abs(Integer(lstr_style.font_height)))
End If


// If its text and the only object selected, show the text edit box 
// with the current text value .  Strip any quotes out of the text string.
If dw_1.Describe(ls_obj_name + ".type") = "text" and li_index = 1 then
	lstr_style.text = f_remove_char170315 (dw_1.Describe(ls_obj_name + ".text"), "~"")
	is_text = true
else
	lstr_style.text = ""
	is_text = false
end If


// Set to white Foreground on black background to show its selected.
// Force to opaque mode so the black background showlstr_style.
ls_mod_string = ls_obj_name + ".background.mode=~"0~" " + &
				 ls_obj_name + ".color=~"" + string(rgb(255,255,255)) + "~" " + &
				 ls_obj_name + ".background.color=~"0~"" 
dw_1.Modify(ls_mod_string)


//set boolean true that a new column was selected and the style/color bar will
//be changed, but these are not user keyed changes
ib_updating = true

// Now, set the visible values to match the current object
uo_style.uf_set_style(lstr_style)

// Set the color bar attributes
uo_color.uf_set_Foreground(Long(is_hold_color[li_index]))
uo_color.uf_set_background(Long(is_hold_backcolor[li_index]))

//updating is over see above
ib_updating = false
end event

type uo_color from u_color_bar170315 within w_dw_from_select170315
event destroy ( )
integer x = 2912
integer y = 2120
integer taborder = 120
end type

on uo_color.destroy
call u_color_bar170315::destroy
end on

event rbuttondown;call super::rbuttondown;//Right_button_click(user defined) script for uo_color
//inherited from u_color_bar170315

string	ls_rc 
long ll_color
int li_xloc
li_xloc = PointerX( )
ll_color = uo_color.uf_get_rgb(li_xloc)
uo_color.uf_set_background(ll_color)


ls_rc = wf_update_item(dw_1,"back_color")
If ls_rc <> "" then messagebox("dwmodify err",ls_rc)

end event

event ue_lbuttondown;call super::ue_lbuttondown;//Left_button_click(user defined) script for uo_color
//inherited from u_color_bar170315

long ll_color
int li_xloc
string	ls_rc 

li_xloc = PointerX( )
ll_color = uo_color.uf_get_rgb(li_xloc)

// With control key down, change DataWindow background ll_color now.
// Otherwise, just set the ll_color.
If KeyDown(keycontrol!) then
	dw_1.Modify("datawindow.ll_color = " + String(ll_color))
else
	uo_color.uf_set_foreground(ll_color)
end if

ls_rc = wf_update_item(dw_1,"fore_color")
If ls_rc <> "" then messagebox("Modify err",ls_rc)
end event

type cb_4 from commandbutton within w_dw_from_select170315
integer x = 4878
integer y = 292
integer width = 512
integer height = 92
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update resource file2"
end type

event clicked;
Integer		li_index, li_num_of_gobs, li_rc
String		ls_name, ls_tname , ls_sql_syntax , ls_dw_syntax , ls_errors, ls_filename, ls_dw_data, ls_table, ls_criteria
String		dw_style , ls_hdgs[] , ls_cols[] , cols_no_underscores[]
String 		ls_emptyarray []
string 	ls_colname, ls_modify, ls_classname, ls_style
long 			ll_row, i
n_resource_manager ln_resource_manager

/******************************************************************************************************
	Clear out DataObject name (if any), in case user has already selected a table, and
	now is selecting a different one
 ******************************************************************************************************/
ls_classname = parent.classname()
ls_filename = ls_classname + "_dw_criteria1_grid"
ls_table =  "department"
ls_criteria =  "where dept_id < 600 order by dept_id desc"

is_table = ls_table
dw_tables.selectrow(0, False)
ll_row = dw_tables.find("tname = '" +is_table +"'", 1, dw_tables.rowcount())
if ll_row > 0 then
	dw_tables.selectrow(ll_row, True)
	If wf_set_column_select(dw_columns,is_table) < 0 Then
		//is_resultlog += wf_result_add("testcasepoint2","Unable to Set SQL Select statement For Columns list", False)
		Messagebox("Error!", "Unable to Set SQL Select statement For Columns list")
	End If
	ll_row = dw_columns.Retrieve( )	
	if ll_row <= 0 then
		//is_resultlog += wf_result_add("testcasepoint2","Unable to Get Columns list from table " + is_table, False)
		Messagebox("Error!", "Unable to Get Columns list from table " + is_table)
	end if
	dw_columns.selectrow(0, True) 
Else
	//is_resultlog += wf_result_add("testcasepoint2","Unable to get table " + is_table , False)
	Messagebox("Error!", "Unable to get table " + is_table)
end if


is_visiblecolumns[] = ls_emptyarray[]
/******************************************************************************************************
	Note that the Repository definitions for fonts prevail over the parameters specified
	in dw_style, below.  Thus, the several Modify commands after the Create, below.
******************************************************************************************************/

dw_style =	'style(Type=grid) ' + &
				'Text(font.face="MS Sans Serif"  font.Height=12  font.weight=400 font.family=2 ' + &
						'font.pitch=2 font.charset=0) ' + &
				'Column(font.face="MS Sans Serif"  font.Height=12  font.weight=400 font.family=2 ' + &
						'font.pitch=2 font.charset=0) ' 


mle_comments.Text = '~tRetrieving Column NameS For table ' + Lower ( ls_table ) + '...'



//	Build generic SELECT statement and generate DataWindow syntax
ls_sql_syntax = 'SELECT * FROM ' + ls_table + " " + ls_criteria
ls_dw_syntax = SQLCA.SyntaxFromSQL( ls_sql_syntax, dw_style, ls_errors)


If ls_errors <> "" Then
	Messagebox("Error!", ls_filename + " SyntaxFromSQL error:" +ls_errors)
	//is_resultlog += wf_result_add("testcasepoint2", ls_filename + " SyntaxFromSQL error:" +ls_errors, False)
Else
	//is_resultlog += wf_result_add("testcasepoint2", ls_filename + " SyntaxFromSQL", True)
End If

// If no ls_errors (there shouldn't be any), create the Criteria grid-style DataWindow
If Len(ls_errors) = 0 Then
	If dw_criteria.Create (ls_dw_syntax) > 0 Then
		dw_criteria.Modify ('datawindow.Detail.Height=70 ')

		//  Insert 6 rows for Sort & Criteria
		For li_index = 1 to 6						
			dw_criteria.InsertRow ( 0 )
		Next

 		//	Get names of heading-text items into hdgs[ ] array, 
		// and names of column items into cols[ ] array.
		li_num_of_gobs= wf_parse_obj_string(dw_criteria, ls_hdgs, "text", "header")
		li_num_of_gobs= wf_parse_obj_string(dw_criteria, ls_cols, "column", "detail")

		//	For each column (and its heading), set font and other attributes.  Also, make
		//	each of them invisible for now.
 
		For li_index = 1 to li_num_of_gobs
			//	Substitute spaces for underscores in column names.
			cols_no_underscores[li_index] = wf_replace_underscores_with_spaces( ls_cols[li_index] )

			//	Build the Modify command string
			ls_name = 'datawindow.header.Height=70 ' + &
			ls_hdgs[li_index] + '.Text="***~tWordcap(~'' + cols_no_underscores[li_index] + '~' )" ' + &
			ls_hdgs[li_index] + '.Font.Face="MS Sans Serif" ' + &
			ls_hdgs[li_index] + '.Font.Height="60" ' + &
			ls_hdgs[li_index] + '.Height="60" ' + &
			ls_hdgs[li_index] + '.Font.Weight="400" ' + &
			ls_hdgs[li_index] + '.Font.Family="0" ' + &
			ls_hdgs[li_index] + '.Font.Pitch="2" ' + &
			ls_hdgs[li_index] + '.Font.Charset="0" ' + &
			ls_cols[li_index]  + '.y="4" ' + &
			ls_cols[li_index] + '.Font.Face="MS Sans Serif" ' + &
			ls_cols[li_index] + '.Font.Height="52" ' + &
			ls_cols[li_index] + '.Height="60" ' + &
			ls_cols[li_index] + '.Font.Weight="400" ' + &
			ls_cols[li_index] + '.Font.Family="0" ' + &
			ls_cols[li_index] + '.Font.Pitch="2" ' + &
			ls_cols[li_index] + '.Font.Charset="0" ' + &
			ls_cols[li_index] + '.Visible="0" ' + &
			' '
			dw_criteria.Modify (ls_name)
		Next
	else
		Messagebox("Error!", "dw_criteria Create fail!")
		//is_resultlog += wf_result_add("testcasepoint2", "dw_criteria Create", False)
		return -1
	End If
else
	return -1
End If
mle_comments.Text = ''
dw_criteria.setTransObject(sqlca)
cb_ok.enabled = false

// 将syntax保存到数据库，比较时先将头部的版本(release 12.6;)信息清除
ls_dw_syntax = dw_criteria.Describe("DataWindow.Syntax")
//ls_dw_syntax = mid(ls_dw_syntax, pos(ls_dw_syntax, ";") + 1 )
ln_resource_manager.f_insert_resource(ls_filename+ ".txt", ls_dw_syntax)


// 选择列
for i = 1 to ll_row
	ls_colname = dw_columns.getitemstring(i, 'cname')
	is_VisibleColumns[UpperBound(is_VisibleColumns) + 1 ] = ls_colname
	ls_modify += ls_colname + '.visible="1" '
next
ls_modify += "DataWindow.QuerySort=yes"
dw_criteria.Modify ( ls_modify )
cb_ok.enabled = TRUE

// 判断dw_criteria modify后语法是否正确
//ls_filename

// select table :department
ls_filename = ls_classname + "_dw_criteria2_grid"

ls_dw_syntax = dw_criteria.Describe("DataWindow.Syntax")
//ls_dw_syntax = mid(ls_dw_syntax, pos(ls_dw_syntax, ";") + 1 )
ln_resource_manager.f_insert_resource(ls_filename+ ".txt", ls_dw_syntax)


// 动态生成grid格式datawindow
is_report_type = "grid"
ls_sql_syntax = "select * from department where dept_id < 600 order by dept_id desc";
ls_filename= ls_classname+"_" + is_table + "_" + is_report_type
ls_style = 'style(type=grid)' + &
			'Text(background.mode=0 background.color=1073741824 color=0 ' +&
			'font.face = "MS Sans Serif"  font.height = -10  font.weight = 400 font.family = 2 ' + &
					'font.pitch=2  ) ' + &
			'Column(background.mode=0 background.color=1073741824 color=0 ' +&
			'font.face = "MS Sans Serif"  font.height = -8  font.weight = 400 font.family = 2 ' + &
					'font.pitch = 2 ) ' 

ls_dw_syntax = SyntaxFromSQL(sqlca, ls_sql_syntax, ls_style, ls_errors)
If ls_errors <> "" Then
	//is_resultlog += wf_result_add("testcasepoint2", ls_filename + " SyntaxFromSQL error:" +ls_dw_err, False)
	messagebox("Error!", ls_filename + " SyntaxFromSQL error:" +ls_errors)
	Return
End If
dw_1.Create(ls_dw_syntax)
// 将syntax保存到数据库，比较时先将头部的版本(release 12.6;)信息清除

//ls_dw_syntax = mid(ls_dw_syntax, pos(ls_dw_syntax, ";") + 1 )
ln_resource_manager.f_insert_resource(ls_filename+ ".txt", ls_dw_syntax)
//Retrieve into the dw_1 datawindow
dw_1.SetTransObject(sqlca)
 dw_1.Retrieve( )



// modify 语法暂时就不作比较，不是这个案例的测试点

end event

type cb_ok from commandbutton within w_dw_from_select170315
integer x = 3310
integer y = 2256
integer width = 375
integer height = 96
integer taborder = 110
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Create &DW2"
end type

event clicked;/*************************************************************************
		 it 	use the syntax in the grid datawindow (dw_criteria) as the source 
		for the DataWindow control in this window.  
		The syntax for the datawindow will have to be modified to discover
		the visible fields, and then to build the Where statement by taking
		values out of the Grid DataWindow.  The Existing Grid DataWindow 
		Selects all columns from the table and then works depending on the 
		visible attributes.
*************************************************************************/
int 			li_createreturncode, li_arraybound, li_index, li_colcount
String 		ls_dwSyntax,  ls_dwerrorbuffer, ls_visiblecolumns[], ls_dwselectstmt
String		ls_tablename, ls_style, ls_whereclause, ls_criteriaselectstmt, ls_rc
String		ls_orderclause, ls_column, ls_report_type
DataWindow 	ldw_newdw
long		ll_start, ll_end, ll_rc

//*********************************************************************
//		Build the Select statement Based on the Visible columns
//		Copy the Grid DW from the Quick Select window to the local
//		DW here and the instance array of visible column names.
//*********************************************************************	
dw_Criteria.accepttext()
ldw_newdw = dw_Criteria
ls_criteriaselectstmt = ldw_newdw.getsqlselect()
ls_visiblecolumns = is_VisibleColumns
ls_tablename	= is_table

//get the type datawindow from the quick select menu
If rb_grid.checked Then
	ls_report_type = "grid"
ElseIf rb_freeform.checked Then
	ls_report_type = "form"
ElseIf  rb_tabular.checked Then
	ls_report_type = "tabular"
End if
ls_style = 'style(type=' + ls_report_type + ')' + &
			'Text(background.mode=0 background.color=1073741824 color=0 ' +&
			'font.face = "MS Sans Serif"  font.height = -10  font.weight = 400 font.family = 2 ' + &
					'font.pitch=2  ) ' + &
			'Column(background.mode=0 background.color=1073741824 color=0 ' +&
			'font.face = "MS Sans Serif"  font.height = -8  font.weight = 400 font.family = 2 ' + &
					'font.pitch = 2 ) ' 
//this.title = "Datawindow for table - " + ls_tablename

//*********************************************************************
//		Build the Select Statement
//*********************************************************************
ls_dwselectstmt = "Select " 
li_arraybound = UpperBound(ls_visiblecolumns)
For li_index = 1 to li_arraybound
		If ls_visiblecolumns[li_index] <> "" then
			ls_dwselectstmt = ls_dwselectstmt + ls_visiblecolumns[li_index]
			If li_index <> li_arraybound then
				ls_dwselectstmt = ls_dwselectstmt + ", "
			End If
		End If
end for	

// add the FROM clause 
ls_dwselectstmt = ls_dwselectstmt + " From " + ls_tablename

////////////////////////////////////////////////////////////////////////////////////
//build the where clause from the querymode datawindow
///////////////////////////////////////////////////////////////////////////////////
ll_start = pos(lower(ls_criteriaselectstmt)," where ")

If ll_start > 0 Then
//order of stmts after where are groub by, having, order by 
//however, in this example, only ORDER BY can occur
//check if this occurs, if so, this is the end of the where clause
	ll_end = Pos(lower(ls_criteriaselectstmt)," order by ")

	If ll_end = 0 Then 	// no order by
		ll_end = len (ls_criteriaselectstmt)
	End If

	ls_whereclause = Mid ( ls_criteriaselectstmt, ll_start, ll_end - ll_start +1)
	ls_dwselectstmt = ls_dwselectstmt + ls_whereclause	

End If 	//Get Where Clause


////////////////////////////////////////////////////////////////////////////////////
//build the order by clause from the querymode datawindow
//This routine will parse through the criteria order by statement
//converting the column #'s to database column names.
//This is because the column #'s do not match the new
//datawindow's column numbers.
///////////////////////////////////////////////////////////////////////////////////
ll_start = pos(lower(ls_criteriaselectstmt)," order by ")

If ll_start > 0 Then
	// there is an order by, now parse it out
	ll_end = len (ls_criteriaselectstmt)

	ls_orderclause = " Order By "

	ll_start = ll_start + 11 // skip past the order by
	ll_end = pos(ls_criteriaselectstmt, " ", ll_start)
	do while ll_end > 0
		If Lower(Mid(ls_criteriaselectstmt, ll_start, 1)) = "a" or  &
			Lower(Mid(ls_criteriaselectstmt, ll_start, 1)) = "d"  Then
			//This is the asc or desc stmt, just copy it
			ll_rc = pos (ls_criteriaselectstmt, ",", ll_end) + 1   // adjust for space after order sequence 
			If ll_rc > 1 Then ll_end = ll_rc    //no need to adjust if this was the last asc/desc 
			ls_orderclause = ls_orderclause + mid(ls_criteriaselectstmt, ll_start, ll_end - ll_start + 1)
			Else  			// must be a column # --- convert it to a column name
			ls_column = mid (ls_criteriaselectstmt, ll_start, ll_end - ll_start +1)
			ls_orderclause = ls_orderclause + &
				ldw_newdw.describe ("#" + ls_column + ".dbname") + " "
			End If				

		//move start to next token
		ll_start = ll_end + 1
		ll_end = pos(ls_criteriaselectstmt, " ", ll_start)
	loop
	
	//build it into main select statement
	ls_dwselectstmt = ls_dwselectstmt + ls_orderclause	

End If 	//Get Order Clause

ls_dwSyntax= Sqlca.SyntaxFromSQL( ls_dwselectstmt, ls_style, ls_dwerrorbuffer)

li_createreturncode = dw_1.Create(ls_dwSyntax)



ls_rc = dw_1.modify ("datawindow.selected.mouse=no")
if ls_rc <>"" then messagebox("hi",ls_rc)

If li_createreturncode > 0 then
	li_colcount = Integer (dw_1.Describe ("datawindow.column.count"))
	
	For li_index = 1 to li_colcount
		dw_1.SetTabOrder(li_index,0)
	Next

	dw_1.settransobject( sqlca)	
	dw_1.retrieve( )

	
Else
	messagebox("Creation of the DataWindow Failed",  "The return code is "+ string(li_createreturncode))
	dw_criteria.Modify("DataWindow.QuerySort = Yes")
End If

end event

type mle_comments from multilineedit within w_dw_from_select170315
integer x = 2912
integer y = 640
integer width = 2834
integer height = 128
integer taborder = 110
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_dw_from_select170315
integer x = 4878
integer y = 76
integer width = 512
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "2.testcasepoint2"
end type

event clicked;of_testcase_point_module1()
end event

type st_12 from statictext within w_dw_from_select170315
integer x = 2857
integer y = 152
integer width = 233
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Sort:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_13 from statictext within w_dw_from_select170315
integer x = 2857
integer y = 216
integer width = 233
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Criteria:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_14 from statictext within w_dw_from_select170315
integer x = 2848
integer y = 280
integer width = 247
integer height = 76
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Or:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_15 from statictext within w_dw_from_select170315
integer x = 2848
integer y = 356
integer width = 247
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Or:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_16 from statictext within w_dw_from_select170315
integer x = 2848
integer y = 424
integer width = 247
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Or:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_dw_from_select170315
integer x = 2267
integer y = 848
integer width = 512
integer height = 92
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update resource file"
end type

event clicked;//Clicked script for cb_syntax
string 	ls_sql_syntax, ls_style, ls_dw_syntax, ls_dw_err, ls_classname, ls_filename, ls_dw_data
long i, j, ll_count, ll_row
n_resource_manager ln_resource_manager

ls_classname = Parent.classname()
// select table :employee

for  i = 1 to 2
	if i = 1 then
		is_table =  "employee"
	elseif i = 2 then
		is_table =  "product"
	end if
	dw_tables.selectrow(0, False)
	ll_row = dw_tables.find("tname = '" +is_table +"'", 1, dw_tables.rowcount())
	if ll_row > 0 then
		dw_tables.selectrow(ll_row, True)
		If wf_set_column_select(dw_columns,is_table) < 0 Then
			//is_resultlog += wf_result_add("testcasepoint1","Unable to Set SQL Select statement For Columns list", False)
			messagebox("Error", "Unable to Set SQL Select statement For Columns list")
		End If
		ll_row = dw_columns.Retrieve( )	
		if ll_row <= 0 then
			//is_resultlog += wf_result_add("testcasepoint1","Unable to Get Columns list from table " + is_table, False)
			messagebox("Error", "Unable to Get Columns list from table")
		end if
		dw_columns.selectrow(0, True) 
	Else
		//is_resultlog += wf_result_add("testcasepoint1","Unable to get table " + is_table , False)
		messagebox("Error", "Unable to get table")
	end if
	
	// 拼接sql语法
	ls_sql_syntax = wf_build_sql_syntax ()
	//is_resultlog += wf_result_add("testcasepoint1","sql syntax " + ls_sql_syntax, Len(ls_sql_syntax) > 0 )
	
	// 动态生成form格式datawindow
	is_report_type = "form"
	ls_filename = ls_classname +"_" + is_table + "_" + is_report_type
	ls_style = "style(type=" + is_report_type + ")"
	ls_dw_syntax = SyntaxFromSQL(sqlca, ls_sql_syntax, ls_style, ls_dw_err)
	If ls_dw_err <> "" Then
		//is_resultlog += wf_result_add("testcasepoint1", ls_filename + "SyntaxFromSQL error:" +ls_dw_err, False)
		messagebox("Error", ls_filename + "SyntaxFromSQL error:" +ls_dw_err)
		Return
	End If
	dw_new.Create(ls_dw_syntax)
	ln_resource_manager.f_insert_resource(ls_filename+ ".txt", ls_dw_syntax)

	//Retrieve into the new datawindow
	dw_new.SetTransObject(sqlca)
	ll_count = dw_new.Retrieve( )
	
	// 动态生成tabular格式datawindow
	is_report_type = "tabular"
	ls_filename = ls_classname +"_" + is_table + "_" + is_report_type
	ls_style = "style(type=" + is_report_type + ")"
	ls_dw_syntax = SyntaxFromSQL(sqlca, ls_sql_syntax, ls_style, ls_dw_err)
	If ls_dw_err <> "" Then
		//is_resultlog += wf_result_add("testcasepoint1", ls_filename + "SyntaxFromSQL error:" +ls_dw_err, False)
		messagebox("Error", ls_filename + "SyntaxFromSQL error:" +ls_dw_err)
		Return
	End If
	dw_new.Create(ls_dw_syntax)
	ln_resource_manager.f_insert_resource(ls_filename+ ".txt", ls_dw_syntax)

	//Retrieve into the new datawindow
	dw_new.SetTransObject(sqlca)
	ll_count = dw_new.Retrieve( )

	
	// 动态生成grid格式datawindow
	is_report_type = "grid"
	ls_filename = ls_classname +"_" + is_table + "_" + is_report_type
	ls_style = "style(type=" + is_report_type + ")"
	ls_dw_syntax = SyntaxFromSQL(sqlca, ls_sql_syntax, ls_style, ls_dw_err)
	If ls_dw_err <> "" Then
		//is_resultlog += wf_result_add("testcasepoint1", ls_filename + "SyntaxFromSQL error:" +ls_dw_err, False)
		messagebox("Error", ls_filename + "SyntaxFromSQL error:" +ls_dw_err)
		Return
	End If
	dw_new.Create(ls_dw_syntax)
	ln_resource_manager.f_insert_resource(ls_filename+ ".txt", ls_dw_syntax)

	//Retrieve into the new datawindow
	dw_new.SetTransObject(sqlca)
	ll_count = dw_new.Retrieve( )
next
end event

type cb_1 from commandbutton within w_dw_from_select170315
integer x = 2267
integer y = 704
integer width = 512
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "1.testcasepoint1"
end type

event clicked;of_testcase_point_module()
end event

type st_4 from statictext within w_dw_from_select170315
integer x = 23
integer y = 1164
integer width = 357
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "DataWindow:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_dw_from_select170315
integer x = 23
integer y = 916
integer width = 247
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Syntax:"
boolean focusrectangle = false
end type

type rb_dwsyntax from radiobutton within w_dw_from_select170315
integer x = 1682
integer y = 540
integer width = 407
integer height = 68
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "DW Synta&x"
end type

on clicked;//call funtion to build datawindow syntax -- update mle to display result
mle_1.text = wf_build_dw_syntax()

end on

type rb_sql from radiobutton within w_dw_from_select170315
integer x = 1449
integer y = 544
integer width = 247
integer height = 68
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&SQL"
boolean checked = true
end type

on clicked;//call function to build sql syntax-- set mle to result

mle_1.text = wf_build_sql_syntax ()
end on

type dw_new from datawindow within w_dw_from_select170315
integer x = 23
integer y = 1480
integer width = 2775
integer height = 548
integer taborder = 110
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_columns from datawindow within w_dw_from_select170315
event rbuttonup pbm_rbuttonup
integer x = 722
integer y = 112
integer width = 658
integer height = 528
integer taborder = 20
string dataobject = "d_column_list170315"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rbuttonup;/*************************************************************************
		When the Minor mouse button is released:
			Remove the FocusIndicator
			Reset the current row to the proper table
			Force the repaint of the datawindow to remove the focus indicator
			Clear out the comments field
**************************************************************************/
SetRowFocusIndicator(Off!)

setredraw(TRUE)
mle_comments.text = ""

end event

event clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for dw_columns
//////////////////////////////////////////////////////////////////////////////////////////////////////////

// If user clicks on no row do not continue processing
If row = 0 Then Return	

// As a column is selected, add it to the list in the select
//If already selected, turn off selection
If dw_columns.IsSelected(row) then
	dw_columns.SelectRow(row, False)
Else
	dw_columns.SelectRow(row, True)
End If

//update the multilineedit to display the updated syntax
If rb_sql.checked Then
	mle_1.text = wf_build_sql_syntax()
else
	mle_1.text = wf_build_dw_syntax()
End If



/************************************************************************
	If the clicked column was previously selected, deselect it and make it 
		invisible in the criteria grid.
	If the clicked column was previoustly not selected, selected it and 
		make it visible in the criteria grid.
*************************************************************************/

Long		ll_ReturnCode
Integer	li_current_visibility, li_new_visibility, li_Index, li_ArrayBound
String	ls_name, ls_colname, ls_moderr


ls_colname = This.Object.cname[row]		/*****  Get name of column that was clicked	*****/
ls_name = ls_colname + '.visible'

/************************************************************************
	Find out If this column had already been chosen or not, by seeing 
	If it is presently visible in the Criteria grid.
*************************************************************************/
li_current_visibility = Integer ( dw_criteria.Describe ( ls_name ) )

/************************************************************************
	Set New Visibility to the opposite of Current Visibility
*************************************************************************/
li_new_visibility = 1 - li_current_visibility

/************************************************************************
	Select or deselect this column's name in the column list.
*************************************************************************/
If li_new_visibility = 1 Then
	selectRow ( Row , True )
	If cb_ok.enabled = False Then cb_ok.enabled = True
	is_VisibleColumns[UpperBound(is_VisibleColumns) + 1 ] = ls_colname
Else
	selectRow ( row, False )
	ll_returncode = GetSelectedRow(0)
	If ll_returncode < 1 Then cb_ok.enabled = False
	li_ArrayBound = UpperBound(is_VisibleColumns)
	For li_Index = 1 to li_ArrayBound
		If is_VisibleColumns[li_Index] = ls_colname Then
			is_VisibleColumns[li_Index] = ""
		End If 
	Next
End If

/************************************************************************
	Make this column visible or invisible in the Criteria grid.
*************************************************************************/
ls_name = ls_colname + '.visible="' + String ( li_new_visibility ) + '"'
ls_moderr = dw_criteria.Modify ( ls_name )
//dw_criteria.Object.DataWindow.QuerySort = 'YES'
dw_criteria.Modify("DataWindow.QuerySort=yes")	

end event

event rbuttondown;/***********************************************************************
		Get the row that has been 'clicked' and take the value out of 
		pbc_cmnt column for comments.  If there is no value in this column
		then display the default message - 'TThis column has no comments"

************************************************************************/

	integer lCurrentRow
	string 	lObjectAtPointer, lStrRow, lComments

	lObjectAtPointer = this.GetObjectAtPointer()

	If lObjectAtPointer = "" then return   // all done white space clicked

	lStrRow = Mid(lObjectATPointer, Pos(lObjectAtPointer, "~t") + 1, 2)
//**********************************************************************
//		Comments for the Column DataWindow are in Column 3 pbcatcol pbc_cmnt
//**********************************************************************
	lComments = this.Object.pbc_cmnt[integer(lStrRow)]

	this.setrowfocusindicator(FocusRect!)
	this.setrow(integer(lStrRow))
	
	If Trim(lComments) = "" or IsNull(lComments)  then
		mle_comments.text = "This column has no comments."
	else
		mle_comments.text = lComments
	end if

	this.setredraw(TRUE)
end event

type dw_tables from datawindow within w_dw_from_select170315
integer x = 23
integer y = 112
integer width = 658
integer height = 528
integer taborder = 10
string dataobject = "d_table_list170315"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for dw_tables
///////////////////////////////////////////////////////////////////////////////////////////////////////
integer li_rc
// if user clicks on no row do not continue processing
If row = 0 Then Return	

// Select the clicked row
dw_tables.SelectRow(0, False)
dw_tables.SelectRow(row, True)

// f_set_column_select is a user function to modify the select used by
// the column selection data window, based on which DBMS we're connected
// to; This function adjusts to the differences in catalog structures
// between the DBMS's

//is_Table = dw_tables.Object.data[row, 1]
is_Table = dw_tables.GetItemString(row, 1)

If wf_set_column_select(dw_columns,is_table) < 0 Then
	is_resultlog += wf_result_add("dw_tables.clicked","Unable to Set SQL Select statement For Columns list", False)
//	MessageBox("Error", &
//					"Unable to Set SQL Select statement For Columns list", &
//					StopSign!)
	Return
End If

dw_columns.Retrieve( )	  /* Note:  No Retrieve argument is used, 
									  since F_SET_COLUMN_SELECT inserts
									  the proper table name */

dw_columns.SelectRow(0, False)


// 创建dw_criteria语法
/////
li_rc = wf_create_dw_criteria_syntax(is_Table, "")
if li_rc < 0 then
	messagebox("Error", "Create dw_criteria syntax fail!")
end if


end event

type cb_create from commandbutton within w_dw_from_select170315
integer x = 526
integer y = 2136
integer width = 375
integer height = 96
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Create &DW1"
end type

event clicked;//Clicked script for cb_syntax
string 	ls_sql_syntax, ls_style, ls_dw_syntax, ls_dw_err

// Recreate the DW from the syntax; first, be sure there's 
// something there.
if mle_1.text = "" then
	is_resultlog += wf_result_add("cb_create.clicked","No Syntax Exists. Enter valid SQL or " &
	+ "DataWindow Syntax or Select Table and Columns and then click Create", False)
//	MessageBox("Sorry!", "No Syntax Exists. Enter valid SQL or " &
//	+ "DataWindow Syntax or Select Table and Columns and then click Create")
	Return
end if

// Construct the style options
//ls_style = "style(type=" + is_report_type + ") datawindow(units=2 color=12632256)"
ls_style = "style(type=" + is_report_type + ")"

// Create a datawindow from the MLE. If it displays SQL Syntax, then build
// datawindow from SQL syntax. If it displays DW Syntax, then build 
// from the datawindow syntax.
If rb_sql.checked Then
	ls_sql_syntax = mle_1.text
	ls_dw_err = ""
	ls_dw_syntax = SyntaxFromSQL(sqlca, ls_sql_syntax, ls_style, ls_dw_err)
	If ls_dw_err <> "" Then
		is_resultlog += wf_result_add("cb_create.clicked",ls_dw_err, False)
		//MessageBox("Sorry!", ls_dw_err)
		Return
	End If
	dw_new.Create(ls_dw_syntax)
Else
	dw_new.Create(mle_1.text)
End If



//Retrieve into the new datawindow
dw_new.SetTransObject(sqlca)
dw_new.Retrieve( )

end event

type rb_grid from radiobutton within w_dw_from_select170315
integer x = 1449
integer y = 348
integer width = 352
integer height = 80
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Grid"
end type

on clicked;//Clicked script for rb_3

// Set style of DW to be created to be 'grid'

if this.checked then is_report_type = "grid"

//If displaying the dwsyntax, need to update the box based on new display format
If rb_dwsyntax.checked Then
	rb_dwsyntax.triggerevent("clicked")
End If
end on

type rb_freeform from radiobutton within w_dw_from_select170315
integer x = 1449
integer y = 180
integer width = 389
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Free Form"
end type

on clicked;//Clicked script for rb_2

// Set style of DW to be created to be 'form'

if this.checked then is_report_type = "form"

//If displaying the dwsyntax, need to update the box based on new display format
If rb_dwsyntax.checked Then
	rb_dwsyntax.triggerevent("clicked")
End If
end on

type rb_tabular from radiobutton within w_dw_from_select170315
integer x = 1449
integer y = 260
integer width = 357
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Tabular"
boolean checked = true
end type

on clicked;//Clicked script for rb_1

// Set style of DW to be created to be 'tabular'

if this.checked then is_report_type = "tabular"

//If displaying the dwsyntax, need to update the box based on new display format
If rb_dwsyntax.checked Then
	rb_dwsyntax.triggerevent("clicked")
End If
end on

type cb_close from commandbutton within w_dw_from_select170315
integer x = 910
integer y = 2132
integer width = 375
integer height = 100
integer taborder = 120
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;//Clicked script for cb_close
Close(parent)
end on

type st_2 from statictext within w_dw_from_select170315
integer x = 754
integer y = 28
integer width = 613
integer height = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Select a Column"
alignment alignment = center!
end type

type st_1 from statictext within w_dw_from_select170315
integer x = 105
integer y = 28
integer width = 503
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Select a Table"
alignment alignment = center!
end type

type mle_1 from multilineedit within w_dw_from_select170315
integer x = 23
integer y = 984
integer width = 2775
integer height = 424
integer taborder = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "arrow!"
long textcolor = 41943040
long backcolor = 74481808
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_dw_from_select170315
integer x = 1426
integer y = 484
integer width = 681
integer height = 160
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Display"
end type

type gb_dwtype from groupbox within w_dw_from_select170315
integer x = 1426
integer y = 108
integer width = 681
integer height = 340
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "DataWindow Type"
end type

type dw_criteria from datawindow within w_dw_from_select170315
integer x = 3118
integer y = 84
integer width = 1742
integer height = 528
integer taborder = 60
boolean bringtotop = true
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ln_1 from line within w_dw_from_select170315
long linecolor = 33554432
integer linethickness = 7
integer beginx = 2834
integer beginy = 8
integer endx = 2830
integer endy = 2412
end type

type ln_2 from line within w_dw_from_select170315
long linecolor = 33554432
integer linethickness = 6
integer beginx = 14
integer beginy = 668
integer endx = 2830
integer endy = 672
end type

