$PBExportHeader$w_object_json.srw
forward
global type w_object_json from w_base_case
end type
type cb_1 from commandbutton within w_object_json
end type
end forward

global type w_object_json from w_base_case
cb_1 cb_1
end type
global w_object_json w_object_json

type variables
eon_cjsonnode		iec_node
end variables

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
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
string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col
boolean		lbn_flag 
Date			ld_date
Datetime		ldt_datatime
time			lt_time
Decimal		ldc_data
Double		ldb_digit
eon_cjsonnode		lec_node01, lec_node
eon_cjsonnodearray	lecd_nodearray, lecd_nodearray01

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "of_load_and_tostring"
ls_array[Upperbound(ls_array) + 1 ] = "of_valuestring"
ls_array[Upperbound(ls_array) + 1 ] = "add_key_value"
ls_array[Upperbound(ls_array) + 1 ] = "keyName_tostring"
ls_array[Upperbound(ls_array) + 1 ] = "delete_by_key"
ls_array[Upperbound(ls_array) + 1 ] = "SetValuce"
ls_array[Upperbound(ls_array) + 1 ] = "EmptyNode"
ls_array[Upperbound(ls_array) + 1 ] = "of_getnodebyindex"
ls_array[Upperbound(ls_array) + 1 ] = "complex"
ls_array[Upperbound(ls_array) + 1 ] = "of_value_type"
ls_array[Upperbound(ls_array) + 1 ] = "of_insertatindex"		
ls_array[Upperbound(ls_array) + 1 ] = "gettypebyindex"
ls_array[Upperbound(ls_array) + 1 ] = "array.of_load"
ls_array[Upperbound(ls_array) + 1 ] = "of_append"

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
	ldb_digit = 0
	lbn_flag = false
	choose case lower(ls_item)
		case lower("of_load_and_tostring")	
//			try
//				lbn_flag = lec_node01.of_load(	'{key:True}'	) 				//测试没有create前执行函数 会崩溃不再执行下面的语句
//			catch(Exception e)
//				   MessageBox( "Exception in Lookup", e.getMessage() )   
//			end try
//			
//			if not isnull(lbn_flag) or lbn_flag = false then 			 
//				ls_result += " "+is_testcasename+" "+ls_item + " of_load(no create) = "+String ( "Success!" ) +"~r~n"
//			else
//				ls_result += " "+is_testcasename+" "+ls_item + " of_load(no create) = "+String ( "Fail!" ) +"~r~n"				
//			end if 			


//			ls_temp = lec_node01.of_tostring()							//未create执行会崩溃
			
			lbn_flag = false
			ls_temp = ""
			lec_node01	=	Create	eon_cjsonnode
			lbn_flag	=	lec_node01.of_load(	''	)						//测试load 空字符串
			if not isnull(lbn_flag) and lbn_flag = false then 			 
				ls_result += " "+is_testcasename+" "+ls_item + " of_load(empty) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_load(empty) = "+String ( "Fail!" ) +"~r~n"				
			end if 
			
			ls_temp	=	lec_node01.of_tostring()
			if not isnull(ls_temp) and ls_temp = "{}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(empty) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(empty) = "+String ( "Fail!" ) +"~r~n"
			end if 	
			
			lbn_flag = false
			ls_temp = ""
			lbn_flag	=	lec_node01.of_load(	ls_Null	) //测试load null字符串
			if not isnull(lbn_flag) and lbn_flag = false then 			 
				ls_result += " "+is_testcasename+" "+ls_item + " of_load(null) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_load(null) = "+String ( "Fail!" ) +"~r~n"				
			end if 
			
			ls_temp	=	lec_node01.of_tostring()
			if not isnull(ls_temp) and ls_temp = "{}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring({}) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring({}) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			lbn_flag = false
			ls_temp = ""
			lbn_flag	=	lec_node01.of_load(	'35434364'	) //测试任一写字符串
			if not isnull(lbn_flag) and lbn_flag = false then 			 
				ls_result += " "+is_testcasename+" "+ls_item + " of_load(random number) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_load(random number) = "+String ( "Fail!" ) +"~r~n"				
			end if 
			
			ls_temp	=	lec_node01.of_tostring()
			if not isnull(ls_temp) and ls_temp = "{}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(random number) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(random number) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			lbn_flag = false
			ls_temp = ""
			lbn_flag	=	lec_node01.of_load('"",[;;;]') //测试任一写字符串
			if not isnull(lbn_flag) and lbn_flag = false then 			 
				ls_result += " "+is_testcasename+" "+ls_item + " of_load([;;;]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_load([;;;]) = "+String ( "Fail!" ) +"~r~n"				
			end if 
			
			ls_temp	=	lec_node01.of_tostring()
			if not isnull(ls_temp) and ls_temp = "{}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring([;;;]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring([;;;]) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			lbn_flag = false
			ls_temp = ""
			lbn_flag	=	lec_node01.of_load('"{}"') //测试任一写字符串
			if not isnull(lbn_flag) and lbn_flag = false then 			 
				ls_result += " "+is_testcasename+" "+ls_item + " of_load({}) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_load({}) = "+String ( "Fail!" ) +"~r~n"				
			end if 
			
			ls_temp	=	lec_node01.of_tostring()
			if not isnull(ls_temp) and ls_temp = "{}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring({} 2) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring({} 2) = "+String ( "Fail!" ) +"~r~n"
			end if 

			lbn_flag = false
			ls_temp = ""
			lbn_flag	=	lec_node01.of_load('{"key":"value","key":"value",...}') //格式测试
			if not isnull(lbn_flag) and lbn_flag = false then 			 
				ls_result += " "+is_testcasename+" "+ls_item + " of_load(key:value...) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_load(key:value...) = "+String ( "Fail!" ) +"~r~n"				
			end if 
			
			ls_temp	=	lec_node01.of_tostring()
			if not isnull(ls_temp) and ls_temp = "{}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(key:value...) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(key:value...) = "+String ( "Fail!" ) +"~r~n"
			end if 

			lbn_flag = false
			ls_temp = ""
			lbn_flag	=	lec_node01.of_load(	'{key:value,key:value,key:value,key:value,key:value,key:value,key:value,key:value,&
				key:value,key:value,key:value,key:value,key:value,key:value,key:value,key:value,key:value,key:value,key:value,key:value,&
				key:value,key:value,key:value,key:value,key:value,key:value,key:value,key:value,key:value,key:value,key:value,key:value,&
				key:value,key:value,key:value,key:value,key:value,key:value,key:value,key:value}'	) //格式测试
			if not isnull(lbn_flag) and lbn_flag = false then 			 
				ls_result += " "+is_testcasename+" "+ls_item + " of_load(more[key:value]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_load(more[key:value]) = "+String ( "Fail!" ) +"~r~n"				
			end if 
			
			ls_temp	=	lec_node01.of_tostring()
			if not isnull(ls_temp) and ls_temp = "{}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(more[key:value]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(more[key:value]) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			If	IsValid(lec_node01)	Then	Destroy	lec_node01
		case lower("of_valuestring")			
			lec_node01	=	Create	eon_cjsonnode
			
			ls_temp	=	lec_node01.of_ValueString( "key")
			if isnull(ls_temp) then
				ls_result += " "+is_testcasename+" "+ls_item + " key = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " key = "+String ( "Fail!" ) +"~r~n"
			end if 
								
			lbn_flag = false
			ls_temp = ""			
			lbn_flag	=	lec_node01.of_load(	'{"key":"value1","key":"value2"}'	) //格式测试
			if not isnull(lbn_flag) and lbn_flag = true then 			 
				ls_result += " "+is_testcasename+" "+ls_item + " of_load([key:value2]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_load([key:value2]) = "+String ( "Fail!" ) +"~r~n"				
			end if
			
			ls_temp	=	lec_node01.of_ValueString( "key")
			if not isnull(ls_temp) and ls_temp = "value1" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring([key:value2]) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring([key:value2]) = "+String ( "Fail!" ) +"~r~n"
			end if 
		
			If	IsValid(lec_node01)	Then	Destroy	lec_node01			
		case lower("add_key_value")
			if not isvalid(lec_node01)  then lec_node01	=	Create	eon_cjsonnode
			ls_temp = lec_node01.of_tostring()
			if not isnull(ls_temp) and ls_temp = "{}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(empty) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(empty) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			lec_node01.of_addkey( "True","123456789987654321")
			ls_temp = ""
			ls_temp = lec_node01.of_tostring()
			if not isnull(ls_temp) and ls_temp = '{"True":"123456789987654321"}' then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(True) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(True) = "+String ( "Fail!" ) +"~r~n"
			end if 
				
			If	IsValid(lec_node01)	Then	Destroy	lec_node01		
			
			//reset
			if not isvalid(lec_node01)  then lec_node01	=	Create	eon_cjsonnode
			ls_temp = ""
			lec_node01.of_addkey( "True",False)
			lec_node01.of_addkey( "True",False)
			lec_node01.of_addkey( "True",True)
			lec_node01.of_addkey( "True","123456789987654321")
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{"True":"123456789987654321"}' then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_addkey(two)) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_addkey(two)) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ""
			lec_node01.of_addkey( "_value",9123456789.123456789)
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{"True":"123456789987654321","_value":9123456789.123457}' then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_addkey(two,_value)) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_addkey(two,_value)) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ""
			lec_node01.of_addkey( "this",lec_node01) //添加node节点做value
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{"True":"123456789987654321","_value":9123456789.123457,"this":{"True":"123456789987654321","_value":9123456789.123457}}' then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_addkey(lec_node01)) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_addkey(lec_node01)) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ""
			if not isvalid(lecd_nodearray)  then  lecd_nodearray	=	Create	eon_cjsonnodearray
			lec_node01.of_addkey( " ",lecd_nodearray) //添加nodearray节点做value
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{"True":"123456789987654321","_value":9123456789.123457,"this":{"True":"123456789987654321","_value":9123456789.123457}," ":[]}' then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_addkey(nodearray)) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_addkey(nodearray)) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ""
			lec_node01.of_addkey( "boolean",False)
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{"True":"123456789987654321","_value":9123456789.123457,"this":{"True":"123456789987654321","_value":9123456789.123457}," ":[],"boolean":false}' then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(nodearray, boolean) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(nodearray, boolean) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			If	IsValid(lec_node01)	Then	Destroy	lec_node01		
			If	IsValid(lecd_nodearray)	Then	Destroy	lecd_nodearray
		case lower("keyName_tostring")		
			//string
			iec_node.of_addkey( "_Set_keyName","if ~r~n then \r\n else~r~n end if~'")
			ls_temp	=	iec_node.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{"_Set_keyName":"if \r\n then \\r\\n else\r\n end if~'"}' then
				ls_result += " "+is_testcasename+" "+ls_item + " string() = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " string() = "+String ( "Fail!" ) +"~r~n"
			end if 
			//boolean			
			iec_node.of_addkey( "_Set_keyName",true)
			ls_temp	=	iec_node.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{"_Set_keyName":true}' then
				ls_result += " "+is_testcasename+" "+ls_item + " boolean(true) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " boolean(true) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			iec_node.of_addkey( "_Set_keyName",false)
			ls_temp	=	iec_node.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{"_Set_keyName":false}' then
				ls_result += " "+is_testcasename+" "+ls_item + " boolean(false) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " boolean(false) = "+String ( "Fail!" ) +"~r~n"
			end if 

			//Digit
			iec_node.of_addkey( "_Set_keyName",double(10))
			ls_temp	=	iec_node.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{"_Set_keyName":10}' then
				ls_result += " "+is_testcasename+" "+ls_item + " Digit() = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " Digit() = "+String ( "Fail!" ) +"~r~n"
			end if 
			
		case lower("delete_by_key")		
			if not isvalid(lec_node01)  then lec_node01	=	Create	eon_cjsonnode			
			lec_node01.of_deletekey( '' )			
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = "{}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_deletekey(emtpy) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_deletekey(emtpy) = "+String ( "Fail!" ) +"~r~n"
			end if 

			ls_temp = ""
			lec_node01.of_addkey('test','test')
			lec_node01.of_deletekey( 'test' ) //用单引号
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = "{}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_deletekey(single quotes) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_deletekey(single quotes) = "+String ( "Fail!" ) +"~r~n"
			end if 

			ls_temp = ""
			lec_node01.of_addkey( 'test',	'test'	)
			lec_node01.of_addkey('_test',lec_node01)		
			if not isvalid(lecd_nodearray) then lecd_nodearray	=	Create	eon_cjsonnodearray
			lecd_nodearray.of_append( lec_node01)
			lec_node01.of_addkey('_testarray',lecd_nodearray)
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{"test":"test","_test":{"test":"test"},"_testarray":[{"test":"test","_test":{"test":"test"}}]}' then
				ls_result += " "+is_testcasename+" "+ls_item + " of_addkey(nodearray) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_addkey(nodearray) = "+String ( "Fail!" ) +"~r~n"
			end if 

			ls_temp = ""
			lec_node01.of_deletekey( "test")
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{"_test":{"test":"test"},"_testarray":[{"test":"test","_test":{"test":"test"}}]}' then
				ls_result += " "+is_testcasename+" "+ls_item + " of_deletekey(single key) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_deletekey(single key) = "+String ( "Fail!" ) +"~r~n"
			end if 

			ls_temp = ""
			lec_node01.of_deletekey( "_test")
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{"_testarray":[{"test":"test","_test":{"test":"test"}}]}' then
				ls_result += " "+is_testcasename+" "+ls_item + " of_deletekey(node) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_deletekey(node) = "+String ( "Fail!" ) +"~r~n"
			end if 

			ls_temp = ""
			lec_node01.of_deletekey( "_testarray")
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = "{}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_deletekey(_testarray) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_deletekey(_testarray) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			If	IsValid(lec_node01)	Then	Destroy	lec_node01		
			If	IsValid(lecd_nodearray)	Then	Destroy	lecd_nodearray
			
			iec_node.of_deletekey("_Set_keyName")
			ls_temp	=	iec_node.of_tostring( )
			if not isnull(ls_temp) and ls_temp = "{}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_deletekey(iec_node) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_deletekey(iec_node) = "+String ( "Fail!" ) +"~r~n"
			end if 

		case lower("SetValuce")
			if not isvalid(lec_node01)  then lec_node01	=	Create	eon_cjsonnode			
			
			lec_node01.of_SetValue("ClassName","w_json_basic") //没有add直接Set设置是会失败，输出空
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = "{}" then
				ls_result += " "+is_testcasename+" "+ls_item + " SetValuce(ClassName w_json_basic) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " SetValuce(ClassName w_json_basic) = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ls_temp = ""
			lec_node01.of_addkey("Visible",True)
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = "{~"Visible~":true}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_addkey(iec_node)) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_addkey(iec_node)) = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ls_temp = ""
			lec_node01.of_Setvalue( "visible", "test")			// 区分大小写所以设置会失败
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp =  "{~"Visible~":true}" then
				ls_result += " "+is_testcasename+" "+ls_item + " SetValuce(visible lower) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " SetValuce(visible lower) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ""
			lec_node01.of_Setvalue( "Visible", "test")
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = "{~"Visible~":~"test~"}" then
				ls_result += " "+is_testcasename+" "+ls_item + " SetValuce(Visible upper) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " SetValuce(Visible upper) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ""
			lec_node01.of_Setvalue( "Visible", False)
			ls_temp	=	lec_node01.of_tostring( )		
			if not isnull(ls_temp) and ls_temp = "{~"Visible~":false}" then
				ls_result += " "+is_testcasename+" "+ls_item + " SetValuce(Visible,False) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " SetValuce(Visible,False) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ""
			lec_node01.of_addkey("ClassName", "w_json_basic" )
			lec_node01.of_addkey("Width", 3342 )
			lec_node01.of_addkey("X", 0)
			lec_node01.of_addkey("Accessiblerole", "Defaultrole!" )
	//		lec_node01.of_addkey("Data", Today() )//unsupport
	//		lec_node01.of_addkey("Time", now() ) //unsupport
			lec_node01.of_addkey("node", lec_node01)
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = "{~"Visible~":false,~"ClassName~":~"w_json_basic~",~"Width~":3342,~"X~":0,~"Accessiblerole~":~"Defaultrole!~",~"node~":{~"Visible~":false,~"ClassName~":~"w_json_basic~",~"Width~":3342,~"X~":0,~"Accessiblerole~":~"Defaultrole!~"}}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(node w_json_basic) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(node w_json_basic) = "+String ( "Fail!" ) +"~r~n"
			end if 
			
			ls_temp = ""
			lec_node01.of_Setvalue( "visible", False) //区分大小写，会修改失败
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = "{~"Visible~":false,~"ClassName~":~"w_json_basic~",~"Width~":3342,~"X~":0,~"Accessiblerole~":~"Defaultrole!~",~"node~":{~"Visible~":false,~"ClassName~":~"w_json_basic~",~"Width~":3342,~"X~":0,~"Accessiblerole~":~"Defaultrole!~"}}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_Setvalue(visible lower)) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_Setvalue(visible lower)) = "+String ( "Fail!" ) +"~r~n"
			end if 

			ls_temp = ""
			lec_node01.of_addkey("Columns", 9000)
			ls_temp	=	lec_node01.of_tostring( )
			if not isnull(ls_temp) and ls_temp = "{~"Visible~":false,~"ClassName~":~"w_json_basic~",~"Width~":3342,~"X~":0,~"Accessiblerole~":~"Defaultrole!~",~"node~":{~"Visible~":false,~"ClassName~":~"w_json_basic~",~"Width~":3342,~"X~":0,~"Accessiblerole~":~"Defaultrole!~"},~"Columns~":9000}" then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_addkey(Columns)) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring(of_addkey(Columns)) = "+String ( "Fail!" ) +"~r~n"
			end if 
		
			if not isvalid(lecd_nodearray) then lecd_nodearray	=	Create	eon_cjsonnodearray
			lecd_nodearray	=	lec_node01.of_valuearray("node")		
			if not isvalid(lecd_nodearray) then lecd_nodearray	=	Create	eon_cjsonnodearray
			//...................................................................................................................
			li_rtn = lecd_nodearray.of_size()	
			if not isnull(li_rtn) and li_rtn = 0 then
				ls_result += " "+is_testcasename+" "+ls_item + " of_size(0) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_size(0) = "+String ( "Fail!" ) +"~r~n"
			end if
			
		
			lbn_flag = false
			lbn_flag	=	lec_node01	.of_Valueboolean("visible") //区分大小写导致获取不到值返回null
			if isnull(lbn_flag) then
				ls_result += " "+is_testcasename+" "+ls_item + " of_Valueboolean(visible null) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_Valueboolean(visible null) = "+String ( "Fail!" ) +"~r~n"
			end if
			
			lbn_flag = false
			lbn_flag	=	lec_node01.of_Valueboolean("Visible")
			if not isnull(lbn_flag) and lbn_flag = false then
				ls_result += " "+is_testcasename+" "+ls_item + " of_Valueboolean(Visible) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_Valueboolean(Visible) = "+String ( "Fail!" ) +"~r~n"
			end if
		
			lec_node01.of_addkey("Digit", 0.00000015)
			ldb_digit	=	lec_node01.of_ValueDouble("Digit")
			if not isnull(ldb_digit) and  ldb_digit =	0.00000015  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueDouble(Digit 15) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueDouble(Digit 15) = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			ldb_digit = 0
			lec_node01.of_Setvalue("Digit", 0.0000099)
			ldb_digit	=	lec_node01.of_ValueDouble("Digit")
			if not isnull(ldb_digit) and  ldb_digit =	0.0000099  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueDouble(Digit 99) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueDouble(Digit 99) = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			ldb_digit = 0
			lec_node01.of_Setvalue("Digit",true)
			ldb_digit	=	lec_node01.of_ValueDouble("Digit")
			if isnull(ldb_digit)  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueDouble(of_Setvalue(Digit true)) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueDouble(of_Setvalue(Digit true)) = "+String ( "Fail!" ) +"~r~n"
			end if	

			lbn_flag = false
			lbn_flag	=	lec_node01.of_Valueboolean("Digit")
			if not isnull(lbn_flag) and lbn_flag = true  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_Valueboolean(Digit true) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_Valueboolean(Digit true) = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			ldb_digit = 0
			lec_node01.of_Setvalue("Digit", "3.0009")
			ldb_digit	=	lec_node01.of_ValueDouble("Digit")
			if isnull(ldb_digit)   then
				ls_result += " "+is_testcasename+" "+ls_item + " of_Valueboolean(Digit 3.0009) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_Valueboolean(Digit 3.0009) = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			ls_temp = ""
			ls_temp = lec_node01.of_ValueString("Digit")
			if not isnull(ls_temp) and ls_temp = "3.0009"  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueString(Digit 3.0009) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueString(Digit 3.0009) = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			ldb_digit = 0
			ldb_digit =	lec_node01.of_ValueLong("Digit")
			if isnull(ldb_digit)  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueLong(Digit null) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueLong(Digit null) = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			ls_temp = ""
			ls_temp = lec_node01.of_tostring()
			if not isnull(ls_temp) and ls_temp = '{"Visible":false,"ClassName":"w_json_basic","Width":3342,"X":0,"Accessiblerole":"Defaultrole!","node":{"Visible":false,"ClassName":"w_json_basic","Width":3342,"X":0,"Accessiblerole":"Defaultrole!"},"Columns":9000,"Digit":"3.0009"}'  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring() 10 = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring() 10 = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			ls_temp = ""
			lec_node01	=	lec_node01.of_ValueNode("node")
			ls_temp	=	lec_node01.of_toString()
			if not isnull(ls_temp) and ls_temp = '{"Visible":false,"ClassName":"w_json_basic","Width":3342,"X":0,"Accessiblerole":"Defaultrole!"}'  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring() node = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_tostring() node = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			ls_temp = ""
			ls_temp	=	lec_node01.of_ValueString("ClassName")
			if not isnull(ls_temp) and ls_temp = 'w_json_basic'  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueString(ClassName) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueString(ClassName) = "+String ( "Fail!" ) +"~r~n"
			end if	

			ls_temp = ""
			ls_temp	=	String(lec_node01.of_ValueLong("width"))
			if isnull(ls_temp)  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueLong(width) null = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueLong(width) null = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			If	IsValid(lec_node01)	Then	Destroy	lec_node01		
			If	IsValid(lecd_nodearray)	Then	Destroy	lecd_nodearray
			
			//SetValue of node
			ls_temp = ""
			if not isvalid(lec_node)  then lec_node	=	Create	eon_cjsonnode			
			if not isvalid(lec_node01)  then lec_node01	=	Create	eon_cjsonnode			
			lec_node01.of_addkey( "ClassName","w_json_basic")
			lec_node01.of_addkey( "Enabled",	True	)
			lec_node01.of_addkey(	"Protect",	1		)
			lec_node01.of_addkey(	"version",		1.09	)
			lec_node.of_addkey(	"AddNode", lec_node01	)
			lec_node.of_addkey(	"This.Name",	"lec_node"	)
			ls_temp	=	lec_node.of_toString()
			if not isnull(ls_temp) and ls_temp = '{"AddNode":{"ClassName":"w_json_basic","Enabled":true,"Protect":1,"version":1.09},"This.Name":"lec_node"}'  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(of_addkey lec_node ) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(of_addkey lec_node) = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			ls_temp = ""
			lec_node01.of_Setvalue( "Enabled",	False	)
			lec_node01.of_Setvalue(	"Protect",	0		)
			lec_node01.of_Setvalue(	"version",	2.0	)
			lec_node.of_SetValue("AddNode",	lec_node01)
			ls_temp	=	lec_node.of_toString()
			if not isnull(ls_temp) and ls_temp = '{"AddNode":{"ClassName":"w_json_basic","Enabled":false,"Protect":0,"version":2},"This.Name":"lec_node"}'  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(of_Setvalue lec_node01) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(of_Setvalue lec_node01) = "+String ( "Fail!" ) +"~r~n"
			end if				
			
			If	IsValid(lec_node)	Then	Destroy	lec_node		
			If	IsValid(lec_node01)	Then	Destroy	lec_node01		
			
			//setvalue the specified value
			lbn_flag = false 
			iec_node.of_Setvalue( "_Set_keyName",true)
			lbn_flag	=	iec_node.of_ValueBoolean("_Set_keyName")
			if isnull(lbn_flag)  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueBoolean(of_Setvalue true) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueBoolean(of_Setvalue true) = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			lbn_flag = false 
			iec_node.of_Setvalue( "_Set_keyName",false)
			lbn_flag	=	iec_node.of_ValueBoolean("_Set_keyName")
			if   isnull(lbn_flag)   then
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueBoolean(of_Setvalue false) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueBoolean(of_Setvalue false) = "+String ( "Fail!" ) +"~r~n"
			end if	
				 
			ldb_digit = 0 
			iec_node.of_Setvalue( "_Set_keyName",	double(0)	)
			ldb_digit=	iec_node.of_Valuedouble("_Set_keyName")
			if   isnull(ldb_digit)   then
				ls_result += " "+is_testcasename+" "+ls_item + " of_Valuedouble(of_Setvalue 0) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_Valuedouble(of_Setvalue 0) = "+String ( "Fail!" ) +"~r~n"
			end if	
			 
			ls_temp = ""
			iec_node.of_Setvalue("_Set_keyName","if ~r~n then \r\n else~r~n end if~'")
			ls_temp=	iec_node.of_ValueString("_Set_keyName")
			if   isnull(ls_temp)  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueString(of_Setvalue if ) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_ValueString(of_Setvalue if ) = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			//SDKAPIJSONW01P015
			if not isvalid(lec_node)  then lec_node	=	Create	eon_cjsonnode			
			lec_node.of_addkey( "visible", True)
			lec_node.of_addkey( "ClassName", "Test")
			lec_node.of_addkey( "width", 3489)
			lec_node.of_addkey( "node", lec_node)
			ls_temp = "" 
			ls_temp = lec_node.of_tostring()
			ls_result += wf_result_add(ls_item, "of_addkey  of_tostring Test ", not isnull(ls_temp) and ls_temp = '{"visible":true,"ClassName":"Test","width":3489,"node":{"visible":true,"ClassName":"Test","width":3489}}')
			
			lec_node.of_setvalue( "visible",	"className")
			lec_node.of_setvalue("ClassName",	True	)
			lec_node.of_setvalue("width",	"Test"	)
			lec_node.of_setvalue("node",	false	)

			ls_temp = "" 
			ls_temp = lec_node.of_tostring()
			ls_result += wf_result_add(ls_item, "error of_setvalue of_tostring Test ", not isnull(ls_temp) and ls_temp = '{"visible":"className","ClassName":true,"width":"Test","node":false}')
			
			lec_node.of_setvalue( "visible",	lec_node)
			ls_temp = "" 
			ls_temp = lec_node.of_tostring()
			ls_result += wf_result_add(ls_item, " error node of_setvalue in boolean Test ", not isnull(ls_temp) and ls_temp = '{"visible":{"visible":"className","ClassName":true,"width":"Test","node":false},"ClassName":true,"width":"Test","node":false}')
			If	IsValid(lec_node)	Then	Destroy	lec_node		
			 
		case lower("EmptyNode")
			if not isvalid(lec_node) then lec_node = Create	 eon_cjsonnode
			if not isvalid(lecd_nodearray) then lecd_nodearray = Create	 eon_cjsonnodearray
			
			If isvalid(lec_node)	Then
				ls_result += " "+is_testcasename+" "+ls_item + " the node object Is Vialid = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " the node object Is Vialid = "+String ( "Fail!" ) +"~r~n"
			end if 			
				
			lecd_nodearray.of_append(lec_node)//添加一个空node节点
			lecd_nodearray.of_append(lecd_nodearray)//添加一个空arraynode节点
			
			ls_temp = ""
			lec_node.of_addkey( 'test array', lecd_nodearray)
			ls_temp	=	lec_node.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{"test array":[{},[{}]]}'  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(of_addkey lecd_nodearray ) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(of_addkey lecd_nodearray ) = "+String ( "Fail!" ) +"~r~n"
			end if			
					
			li_rtn = 0 		
			li_rtn	=	lecd_nodearray.of_Size( )
			if not isnull(li_rtn) and li_rtn = 2  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(of_Size 2) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(of_Size 2) = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			lec_node	=	lecd_nodearray.of_getnodebyindex(1) //获取数组第一个元素
			If Not isvalid(lec_node)	Then
				ls_result += " "+is_testcasename+" "+ls_item + " Not isvalid(lec_node) = "+String ( "Fail!" ) +"~r~n"
			End	If
			
			ls_temp = ""
			ls_temp	=	lec_node.of_tostring( )
			if not isnull(ls_temp) and ls_temp = '{}'  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(of_getnodebyindex '{}' ) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(of_getnodebyindex '{}' ) = "+String ( "Fail!" ) +"~r~n"
			end if
			
			lecd_nodearray	=	lecd_nodearray.of_getarraynodebyindex(2) //获取数组中第二个元素
			li_rtn = 0 		
			li_rtn	=	lecd_nodearray.of_Size( )
			if not isnull(li_rtn) and li_rtn = 1  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(of_getarraynodebyindex of_Size 1) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(of_getarraynodebyindex of_Size 1) = "+String ( "Fail!" ) +"~r~n"
			end if	
			
			If	IsValid(lec_node)	Then	Destroy	lec_node		
			If	IsValid(lecd_nodearray)	Then	Destroy	lecd_nodearray	
		case lower("of_getnodebyindex")			
			if not isvalid(lec_node) then lec_node	=	Create	eon_cjsonnode				
			if not isvalid(lec_node01) then lec_node01	=	Create	eon_cjsonnode		
			if not isvalid(lecd_nodearray) then lecd_nodearray	=	Create	eon_cjsonnodearray
			if not isvalid(lecd_nodearray01) then lecd_nodearray01	=	Create	eon_cjsonnodearray
			
			//初始化节点值
			lec_node.of_addkey( "ClassName", "w_json_basic")
			lec_node.of_addkey( "Enabled", True)
			lec_node.of_addkey( "Long", 3)
			lecd_nodearray.of_append( lec_node) //向数组中添加节点值
			lec_node	=	lecd_nodearray.of_getnodebyindex(1) //获取数组中第一个元素值
			if Isvalid(lec_node)  then
				ls_result += " "+is_testcasename+" "+ls_item + " node object is valid = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " node object is valid = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ls_temp	=	lec_node.of_tostring()
			if not isnull(ls_temp) and ls_temp = '{"ClassName":"w_json_basic","Enabled":true,"Long":3}'  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(init data) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(init data) = "+String ( "Fail!" ) +"~r~n"
			end if
			
			lec_node.of_addkey("output",	lecd_nodearray)			
			ls_temp = ""
			ls_temp	=	lec_node.of_tostring()
			if not isnull(ls_temp) and ls_temp = '{"ClassName":"w_json_basic","Enabled":true,"Long":3,"output":[{"ClassName":"w_json_basic","Enabled":true,"Long":3}]}'  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(addkey node output) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_toString(addkey node output) = "+String ( "Fail!" ) +"~r~n"
			end if
			
			lec_node.of_deletekey( "output"	)			
			lec_node.of_addkey( "Type", "Node")
			lec_node.of_setvalue( "Long", 4)
			
			lecd_nodearray01.of_insertatindex( 1, lec_node)//将节点插入到leca_nodearray112数组中
			lecd_nodearray.of_insertatindex( 1, lec_node) //将节点插入到leca_nodearray11数组中
			lecd_nodearray.of_insertatindex( 2, lecd_nodearray01) //将leca_nodearray112数组插入到leca_nodearray11数组中
			lec_node.of_addkey( "output", lecd_nodearray) //在node节点中添加输出数组节点
			
			ls_temp = ""
			ls_temp	=	lec_node.of_toString()
			if not isnull(ls_temp) and ls_temp = '{"ClassName":"w_json_basic","Enabled":true,"Long":4,"Type":"Node","output":[{"ClassName":"w_json_basic","Enabled":true,"Long":4,"Type":"Node"},[{"ClassName":"w_json_basic","Enabled":true,"Long":4,"Type":"Node"}],{"ClassName":"w_json_basic","Enabled":true,"Long":3}]}'  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_insertatindex(addkey node output) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_insertatindex(addkey node output) = "+String ( "Fail!" ) +"~r~n"
			end if
			
			lecd_nodearray01	=	lecd_nodearray.of_Getarraynodebyindex(2) //获取leca_nodearray11数组中的第二个元素值即leca_nodearray112数组
			lec_node.of_deletekey( "output"	)
			lec_node.of_addkey( "output", lecd_nodearray01)
			
			ls_temp = ""
			ls_temp	=	lec_node.of_toString()			
			if not isnull(ls_temp) and ls_temp = '{"ClassName":"w_json_basic","Enabled":true,"Long":4,"Type":"Node","output":[{"ClassName":"w_json_basic","Enabled":true,"Long":4,"Type":"Node"}]}'  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_Getarraynodebyindex(addkey node output) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_Getarraynodebyindex(addkey node output) = "+String ( "Fail!" ) +"~r~n"
			end if
			
			lecd_nodearray.of_Removebyindex( 1	) //移除数组中第一个元素值
			lec_node.of_deletekey( "output"	)
			lec_node.of_addkey( "output", lecd_nodearray)
			
			ls_temp = ""
			ls_temp	=	lec_node.of_toString()
			if not isnull(ls_temp) and ls_temp = '{"ClassName":"w_json_basic","Enabled":true,"Long":4,"Type":"Node","output":[[{"ClassName":"w_json_basic","Enabled":true,"Long":4,"Type":"Node"}],{"ClassName":"w_json_basic","Enabled":true,"Long":3}]}'  then
				ls_result += " "+is_testcasename+" "+ls_item + " of_Removebyindex(addkey node output) = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " of_Removebyindex(addkey node output) = "+String ( "Fail!" ) +"~r~n"
			end if
			
			lec_node01	=	lecd_nodearray.of_getnodebyindex(1) //获取一个非node节点的值返回node,这时候应该返回null
			If	Not	Isvalid(lec_node01)	Then
				ls_result += " "+is_testcasename+" "+ls_item + " Get node use error index return Invalid correct = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " Get node use error index return Invalid correct = "+String ( "Fail!" ) +"~r~n"
			End	If
			
			lecd_nodearray.of_cleararray( ) //清空leca_nodearray11数组
			ls_temp = ""
			ls_temp = lecd_nodearray.of_tostring()
			if not isnull(ls_temp) and ls_temp = '[]'  then			//??			[]
				ls_result += " "+is_testcasename+" "+ls_item + " Clean array = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " Clean array = "+String ( "Fail!" ) +"~r~n"
			end if
			
			ls_temp = ""
			li_rtn	=	lecd_nodearray.of_size( )
			if not isnull(li_rtn) and li_rtn = 0 then
				ls_result += " "+is_testcasename+" "+ls_item + " Clean array and of_size = "+String ( "Success!" ) +"~r~n"
			else
				ls_result += " "+is_testcasename+" "+ls_item + " Clean array and of_size = "+String ( "Fail!" ) +"~r~n"
			end if
			
			if isvalid(lec_node) then Destroy	lec_node	
			if isvalid(lec_node01) then Destroy	lec_node01	
			if isvalid(lecd_nodearray) then Destroy	lecd_nodearray	
			if isvalid(lecd_nodearray01) then Destroy	lecd_nodearray01	
		case lower("complex")		
			if not isvalid(lec_node) then lec_node	=	Create	eon_cjsonnode				
			if not isvalid(lec_node01) then lec_node01	=	Create	eon_cjsonnode		
			if not isvalid(lecd_nodearray) then lecd_nodearray	=	Create	eon_cjsonnodearray
			if not isvalid(lecd_nodearray01) then lecd_nodearray01	=	Create	eon_cjsonnodearray
			
			lecd_nodearray.of_append( True)
			lecd_nodearray.of_append( False)
			lecd_nodearray.of_append( 123456789)
			lecd_nodearray.of_append(  lec_node)
			
			lbn_flag	=	lec_node.of_load( "{Width:3256,Height:2365,X:1,Y:1}" )
			ls_result += wf_result_add(ls_item, "of_load(of_append) is false", not isnull(lbn_flag) and lbn_flag = false)
			lecd_nodearray.of_insertatindex( 3, lec_node) //插入一个node节点在第三个元素前面
//			lec_node01.of_addkey( "Output", lecd_nodearray)				
			ls_temp = ""
			ls_temp	=	lecd_nodearray.of_toString()
			ls_result += wf_result_add(ls_item, "of_toString(of_insertatindex 3)", not isnull(ls_temp) and ls_temp = '[true,false,{},123456789,{}]')
			
			li_rtn	=	lec_node.of_Valuedouble( "Width"	)
			ls_result += wf_result_add(ls_item, "of_Valuedouble(Width) is null ", isnull(li_rtn) )
			
			lecd_nodearray01.of_append(lecd_nodearray)
			lecd_nodearray01.of_append(False)
			lecd_nodearray01.of_append(0.0000000019)
					
			lbn_flag	=	lecd_nodearray01.of_Getboolbyindex( 2 )
			ls_result += wf_result_add(ls_item, "Get boolean False is False ", not isnull(lbn_flag)  and  lbn_flag = false )
			
			ldb_digit = 0
			ldb_digit	=	lecd_nodearray01.of_Getdoublebyindex( 3 )
			ls_result += wf_result_add(ls_item, "Get double ", (not isnull(ldb_digit)  and ldb_digit = 0.0000000019) )

			lecd_nodearray01.of_insertatindex(1,lec_node) //插入一个node				//bug
			lecd_nodearray	=	lecd_nodearray01.of_getarraynodebyindex( 2) //获取array元素，由于前面插入了一个节点索引值从1变2

			lec_node01.of_deletekey( "output")
			lec_node01.of_addkey( "Output", lecd_nodearray)

			ls_temp = ""
			ls_temp	=	lec_node01.of_toString()

			ls_result += wf_result_add(ls_item, "getarraynode value ", (not isnull(ls_temp) and ls_temp = '{"Output":[true,false,{},123456789,{}]}') )

			ll_tmp = 0
			ll_tmp	=	lecd_nodearray.of_GetLongbyindex( 4)
			ls_result += wf_result_add(ls_item, "Get Long ", (not isnull(ll_tmp) and ll_tmp = 123456789) )
			
			lecd_nodearray.of_append("Point:SDKAPIJSONW01P012")
			ls_temp = ""
			ls_temp	=	lecd_nodearray.of_GetStringbyindex( lecd_nodearray.of_size() )
			ls_result += wf_result_add(ls_item, "Get Long ", (not isnull(ls_temp) and ls_temp = 'Point:SDKAPIJSONW01P012' ))

			ls_temp = ""
			ls_temp = lecd_nodearray01.of_tostring()
			ls_result += wf_result_add(ls_item, "Get arraynode of_tostring", not isnull(ls_temp) and ls_temp = '[{},[true,false,{},123456789,{}],false,0]' )
			
			lbn_flag = false
			lbn_flag	=	lecd_nodearray01.of_Getboolbyindex( 3	)
			ls_result += wf_result_add(ls_item, "Get boolean is not null ", not isnull(lbn_flag) and lbn_flag = false )

			ls_temp = ""
			ls_temp =lecd_nodearray.of_ToString()
			ls_result += wf_result_add(ls_item, "lecd_nodearray.toString() ", not isnull(ls_temp) and ls_temp = '[true,false,{},123456789,{},"Point:SDKAPIJSONW01P012"]' )
			
			ll_tmp = 0 
			ll_tmp	=	lecd_nodearray.of_GetLongbyindex( 1 )
			ls_result += wf_result_add(ls_item, "Get Long by error index return Is null correct ", isnull(ll_tmp) )
			
			lecd_nodearray	=	lecd_nodearray01.of_getarraynodebyindex( 1)
			ls_result += wf_result_add(ls_item, "Get arraynode by error index return Is Invalid correct ", Not Isvalid(lecd_nodearray) )

			if isvalid(lec_node) then Destroy	lec_node	
			if isvalid(lec_node01) then Destroy	lec_node01	
			if isvalid(lecd_nodearray) then Destroy	lecd_nodearray	
			if isvalid(lecd_nodearray01) then Destroy	lecd_nodearray01	
		case lower("of_value_type")		
//			'SDKAPIJSONW01P013' //测试of_load()是否能区分类型添加节点
			if not isvalid(lec_node) then lec_node	=	Create	eon_cjsonnode				
			if not isvalid(lec_node01) then lec_node01	=	Create	eon_cjsonnode		
 
			lec_node.of_load( '{"boolean":True,"String":"test","Long":123456789,"double":0.0009}')
			ls_temp = lec_node.of_toString()
			ls_result += wf_result_add(ls_item, "1.normal all type", not isnull(ls_temp) and ls_temp = '{"boolean":True,"String":"test","Long":123456789,"double":0.0009}' )
			
			lbn_flag	=	lec_node.of_valueboolean( "boolean")
			ls_result += wf_result_add(ls_item, "2.of_valueboolean null ", isnull(lbn_flag) )			
			
			ll_tmp	=	lec_node.of_valueLong( "Long")
			ls_result += wf_result_add(ls_item, "3.of_valueLong Long ", not isnull(ll_tmp) and ll_tmp = 123456789 )			
			
			ldb_digit=	lec_node.of_valuedouble( "double")
			ls_result += wf_result_add(ls_item, "4.of_valuedouble double ", not isnull(ldb_digit) and ldb_digit = 0.0009 )
			ls_temp = ""
			ls_temp=	lec_node.of_valuestring( "double")
			ls_result += wf_result_add(ls_item, "5.of_valuestring double ",  isnull(ls_temp) )

			lec_node.of_addkey( "boolean2", True)
			ls_temp = ""
			ls_temp	=	lec_node.of_tostring()
			ls_result += wf_result_add(ls_item, "6.olec_node.f_tostring ", not isnull(ls_temp) and ls_temp = '{"boolean":null,"String":"test","Long":123456789,"double":0.0009,"boolean2":true}' )
			lbn_flag = false
			lbn_flag	=	lec_node.of_valueboolean( "boolean2")
			ls_result += wf_result_add(ls_item, "7.of_valueboolean.boolean2 ", not isnull(lbn_flag) and lbn_flag = true )
			
			lbn_flag = false
			lbn_flag	=	lec_node.of_valueboolean( "boolean")
			ls_result += wf_result_add(ls_item, "8.of_valueboolean.boolean3 ", isnull(lbn_flag) )

			lbn_flag = false		
			lbn_flag	=	lec_node.of_load( "{key:value,key:value}")
			ls_result += wf_result_add(ls_item, "9.of_load more key:value ", not isnull(lbn_flag) and lbn_flag = false )
			
			ls_temp = "" 
			ls_temp = lec_node.of_toString()
			ls_result += wf_result_add(ls_item, "10.of_toString more key:value ", not isnull(ls_temp) and ls_temp = "{}" )
			
			ls_temp = ""
			ls_temp	=	lec_node.of_valuestring("key")
			ls_result += wf_result_add(ls_item, "11.of_valuestring key ", isnull(ls_temp) )
			
			lec_node.of_load( '{"boolean":true,"String":"test","Long":123456789,"double":0.0009,"node":{"node1":false,"node2":0.045,"node3":"1.test Load string output"}}')
			ls_temp = ""
			ls_temp = lec_node.of_toString()
			ls_result += wf_result_add(ls_item, "12.of_load all node ", not isnull(ls_temp) and ls_temp = '{"boolean":true,"String":"test","Long":123456789,"double":0.0009,"node":{"node1":false,"node2":0.045,"node3":"1.test Load string output"}}' )
			
			lbn_flag = false
			lbn_flag	=	lec_node.of_valueboolean( "boolean")
			ls_result += wf_result_add(ls_item, "13.of_valueboolean boolean4 ", not isnull(lbn_flag) and lbn_flag = true)
			ll_tmp = 0 
			ll_tmp	=	lec_node.of_valueLong( "Long")
			ls_result += wf_result_add(ls_item, "14.of_valueLong long ", not isnull(ll_tmp) and ll_tmp = 123456789)
			
			ldb_digit = 0
			ldb_digit=	lec_node.of_valuedouble( "double")
			ls_result += wf_result_add(ls_item, "15.of_valuedouble double ", not isnull(ldb_digit) and ldb_digit = 0.0009)
			
			ls_temp = ""
			ls_temp=	lec_node.of_valuestring( "double")
			ls_result += wf_result_add(ls_item, "16.of_valuestring double ",  isnull(ls_temp) )
					
			lec_node01	=	lec_node.of_valuenode( "node")
			ls_temp = ""
			ls_temp=	lec_node01.of_tostring( )
			ls_result += wf_result_add(ls_item, "17.of_valuestring double ", not isnull(ls_temp) and ls_temp = '{"node1":false,"node2":0.045,"node3":"1.test Load string output"}')
			
			lbn_flag = false
			lbn_flag	=	lec_node01.of_valueboolean( "node1")
			ls_result += wf_result_add(ls_item, "18.of_valueboolean node1 ", not isnull(lbn_flag) and lbn_flag =false )

			ldb_digit = 0
			ldb_digit	=	lec_node01.of_valuedouble( "node2")
			ls_result += wf_result_add(ls_item, "19.of_valuedouble node2 ", not isnull(ldb_digit) and ldb_digit = 0.045)
			
			ldb_digit = 0
			ldb_digit	=	lec_node01.of_valuedouble( "node3")
			ls_result += wf_result_add(ls_item, "20.of_valuedouble node3 ", isnull(ldb_digit) )
			
			ls_temp = ""
			ls_temp	=	lec_node01.of_valueString( "node3")
			ls_result += wf_result_add(ls_item, "21.of_valuestring node3 ", not isnull(ls_temp) and ls_temp = '1.test Load string output')
			
			if isvalid(lec_node) then Destroy	lec_node	
			if isvalid(lec_node01) then Destroy	lec_node01	
		case lower("of_insertatindex")
			//'SDKAPIJSONW01P016' //array.insert
			if not isvalid(lec_node) then lec_node	=	Create	eon_cjsonnode				
			if not isvalid(lecd_nodearray) then lecd_nodearray	=	Create	eon_cjsonnodearray

			lecd_nodearray.of_insertatindex( 5, "Test Insert") //插入位置为一个没有的位置
			lec_node.of_addkey( "output", lecd_nodearray)
			
			ls_temp	=	lec_node.of_tostring()
			ls_result += wf_result_add(ls_item, "1.of_addkey output ", not isnull(ls_temp) and ls_temp = '{"output":["Test Insert"]}')
			
			lecd_nodearray.of_insertatindex( 1, true)
			lec_node.of_SetValue( "output", lecd_nodearray)
			ls_temp = ""
			ls_temp	=	lec_node.of_tostring()
			ls_result += wf_result_add(ls_item, "2.of_SetValue output ", not isnull(ls_temp) and ls_temp = '{"output":[true,"Test Insert"]}')
						
			lecd_nodearray.of_insertatindex( 1, true) //连续插入相同值
			lec_node.of_SetValue( "output", lecd_nodearray)
			ls_temp = ""
			ls_temp	=	lec_node.of_tostring()
			ls_result += wf_result_add(ls_item, "3.of_SetValue output  same too", not isnull(ls_temp) and ls_temp = '{"output":[true,true,"Test Insert"]}')
			
			li_rtn = lecd_nodearray.of_size()
			ls_result += wf_result_add(ls_item, "4.array.size()", not isnull(li_rtn) and li_rtn = 3)
			
			lecd_nodearray.of_insertatindex( 0, 0) //插入一个无效位置
			lec_node.of_SetValue( "output", lecd_nodearray)
			ls_temp = ""
			ls_temp	=	lec_node.of_tostring()
			ls_result += wf_result_add(ls_item, "5.of_insertatindex(0,0)", not isnull(ls_temp) and ls_temp = '{"output":[true,true,"Test Insert"]}')
			
			lecd_nodearray.of_insertatindex( -1, "test -1 index") //插入一个无效位置
			ls_temp = ""
			ls_temp	=	lecd_nodearray.of_tostring()
			ls_result += wf_result_add(ls_item, "6.nodearray of_insertatindex( -1,'')", not isnull(ls_temp) and ls_temp = '[true,true,"Test Insert"]')
			
			lecd_nodearray.of_insertatindex( 6, lec_node)
			ls_temp = ""
			ls_temp	=	lecd_nodearray.of_tostring()
			ls_result += wf_result_add(ls_item, "7.nodearray of_insertatindex( 6,lec_node)", not isnull(ls_temp) and ls_temp = '[true,true,"Test Insert",{"output":[true,true,"Test Insert"]}]')
			
			if isvalid(lec_node) then Destroy	lec_node	
			if isvalid(lecd_nodearray) then Destroy	lecd_nodearray	
		case lower("gettypebyindex")		
			//'SDKAPIJSONW01P017','SDKAPIJSONW01P018' //测试array object of_load函数及类型获取接口			
			if not isvalid(lec_node) then lec_node	=	Create	eon_cjsonnode				
			if not isvalid(lecd_nodearray) then lecd_nodearray	=	Create	eon_cjsonnodearray
			if not isvalid(lecd_nodearray01) then lecd_nodearray01	=	Create	eon_cjsonnodearray
			SetNull(lbn_flag)
			lbn_flag	=	lecd_nodearray.of_Load('[0.095,"Test",true,{"key1":"Array Load()","key2":123456789},[{"key1":"Array Load()","key2":123456789},false,"test load array"],"",false,False, '+&
											'True, "string","boolean",0.0000059,987562154565,"If 1=1	Then~r~nElse~r~n end	If"]')							

			ls_result += wf_result_add(ls_item, "1.of_Load array return value", not isnull(lbn_flag) and lbn_flag = true)
			
			For	ll_position	=	1	To	lecd_nodearray.of_size( )
				li_rtn	=	lecd_nodearray.of_gettypebyindex(ll_position)
				Choose	Case	li_rtn
					Case	0
						ls_result += wf_result_add(ls_item, string(1+ ll_position )+ ". array is null ", ll_position = 8 or ll_position = 9)					
					Case	1
						ls_temp = ""
						ls_temp	=	lecd_nodearray.of_GetStringbyIndex(	ll_position	)
						ls_result += wf_result_add(ls_item, string(1+ ll_position )+ ". array  is String (, Test) ", not isnull(ls_temp) and ((ll_position = 2 and ls_temp = "Test") or (ll_position = 6 and ls_temp = '') or (ll_position = 14 and ls_temp = 'If 1=1	Then~r~nElse~r~n end	If') or (ll_position = 10 and ls_temp = 'string') or (ll_position = 11 and ls_temp = 'boolean') ) )					
					Case	2
						ldb_digit	=	lecd_nodearray.of_getdoublebyindex( ll_position	)
						ls_result += wf_result_add(ls_item, string(1+ ll_position)+ ". array  is double (0.095, 0.0000059, 987562154565)", not isnull(ldb_digit) and (ldb_digit = 0.095 or ldb_digit = 0.0000059 or ldb_digit= 987562154565 ))					
					Case	3
						lbn_flag = false
						lbn_flag	=	lecd_nodearray.of_GetBoolbyIndex(	ll_position	)
						ls_result += wf_result_add(ls_item, string(1+ ll_position)+ ". array  is Bool (true, false)"+string(lbn_flag), (ll_position = 3 and lbn_flag = true) or (ll_position =7 and lbn_flag = false)  )					
					Case	4
						lecd_nodearray01	=	lecd_nodearray.of_Getarraynodebyindex(	ll_position	)
						ls_temp = ""
						ls_temp = lecd_nodearray01.of_ToString()
						ls_result += wf_result_add(ls_item, string(1+ ll_position)+ ". array  is arraynode ", not isnull(ls_temp) and ls_temp = '[{"key1":"Array Load()","key2":123456789},false,"test load array"]' and ll_position = 5)					
					Case	5
						lec_node	=	lecd_nodearray.of_GetNodebyIndex(	ll_position	)
						ls_temp = ""
						ls_temp = lec_node.of_ToString()
						ls_result += wf_result_add(ls_item, string(1+ ll_position)+ ". array  is Node ",    not isnull(ls_temp) and ls_temp='{"key1":"Array Load()","key2":123456789}' and ll_position = 4)					
					Case	else
						//Messagebox('failed','Get the array type failed!')
						ls_result += wf_result_add(ls_item, string(1+ ll_position)+ ". Get the array type failed ",    isnull(li_rtn) or li_rtn < 5 )					
				End	Choose
			Next
		
			
			if isvalid(lec_node) then Destroy	lec_node	
			if isvalid(lecd_nodearray) then Destroy	lecd_nodearray	
			if isvalid(lecd_nodearray01) then Destroy	lecd_nodearray01				
			
			//18
			if not isvalid(lec_node) then lec_node	=	Create	eon_cjsonnode				
			if not isvalid(lecd_nodearray) then lecd_nodearray	=	Create	eon_cjsonnodearray
			if not isvalid(lecd_nodearray01) then lecd_nodearray01	=	Create	eon_cjsonnodearray
			
			SetNull(lbn_flag)
			lbn_flag	=	lecd_nodearray.of_Load('[0.095,"Test",true,{"key1":"Array Load()","key2":123456789},[{"key1":"Array Load()","key2":123456789},false,"test load array"],""]')
			ls_result += wf_result_add(ls_item, "16.of_Load array return value", not isnull(lbn_flag) and lbn_flag = true)
			
			For	ll_position	=	1	To	lecd_nodearray.of_size( )
				li_rtn	=	lecd_nodearray.of_gettypebyindex(ll_position)
				Choose	Case	li_rtn
					Case	0
						ls_result += wf_result_add(ls_item, string(16+ ll_position )+ ". array is null ", ll_position = 8 or ll_position = 9)					
					Case	1
						ls_temp = ""
						ls_temp	=	lecd_nodearray.of_GetStringbyIndex(	ll_position	)
						ls_result += wf_result_add(ls_item, string(16+ ll_position )+ ". array  is String (, Test) ", not isnull(ls_temp) and ((ll_position = 2 and ls_temp = "Test") or (ll_position = 6 and ls_temp = '') ) )					
					Case	2
						ldb_digit	=	lecd_nodearray.of_getdoublebyindex( ll_position	)
						ls_result += wf_result_add(ls_item, string(16+ ll_position)+ ". array  is double (0.095)", not isnull(ldb_digit) and (ldb_digit = 0.095 ))					
					Case	3
						lbn_flag = false
						lbn_flag	=	lecd_nodearray.of_GetBoolbyIndex(	ll_position	)
						ls_result += wf_result_add(ls_item, string(16+ ll_position)+ ". array  is Bool (true)", (ll_position = 3 and lbn_flag = true) )					
					Case	4
						lecd_nodearray01	=	lecd_nodearray.of_Getarraynodebyindex(	ll_position	)
						ls_temp = ""
						ls_temp = lecd_nodearray01.of_ToString()
						ls_result += wf_result_add(ls_item, string(16+ ll_position)+ ". array  is arraynode ", not isnull(ls_temp) and ls_temp = '[{"key1":"Array Load()","key2":123456789},false,"test load array"]' and ll_position = 5)					
					Case	5
						lec_node	=	lecd_nodearray.of_GetNodebyIndex(	ll_position	)
						ls_temp = ""
						ls_temp = lec_node.of_ToString()
						ls_result += wf_result_add(ls_item, string(16+ ll_position)+ ". array  is Node ",    not isnull(ls_temp) and ls_temp='{"key1":"Array Load()","key2":123456789}' and ll_position = 4)					
					Case	else
						//Messagebox('failed','Get the array type failed!')
						ls_result += wf_result_add(ls_item, string(16+ ll_position)+ ". Get the array type failed ",    isnull(li_rtn) or li_rtn < 22 )					
				End	Choose
			Next
			
			if isvalid(lec_node) then Destroy	lec_node	
			if isvalid(lecd_nodearray) then Destroy	lecd_nodearray	
			if isvalid(lecd_nodearray01) then Destroy	lecd_nodearray01		
			
		case lower("array.of_load")		
			//'SDKAPIJSONW01P019'	//array.of_load()&array.of_tostring
			if not isvalid(lecd_nodearray) then lecd_nodearray	=	Create	eon_cjsonnodearray	
			setnull(ls_temp)
			lbn_flag	=	lecd_nodearray.of_Load(ls_temp) //null parameter
			ls_result += wf_result_add(ls_item, "1. of_Load(Null) return value false",    not isnull(lbn_flag) and lbn_flag = false )					
			ls_temp = ''
			ls_temp = lecd_nodearray.of_ToString()
			ls_result += wf_result_add(ls_item, "2. of_Load(Null) lecd_nodearray.of_ToString",    not isnull(ls_temp) and ls_temp = '[]' )					
			
			setnull(lbn_flag)
			ls_temp = ''
			lbn_flag	=	lecd_nodearray.of_Load(ls_temp) //空长度参数
			ls_result += wf_result_add(ls_item, "3. of_Load('') return value false",    not isnull(lbn_flag) and lbn_flag = false )					
			ls_temp = ''
			ls_temp = lecd_nodearray.of_ToString()
			ls_result += wf_result_add(ls_item, "4. of_Load('') lecd_nodearray.of_ToString",    not isnull(ls_temp) and ls_temp = '[]' )								

			setnull(lbn_flag)
			ls_temp	=	'[]'
			lbn_flag	=	lecd_nodearray.of_Load(ls_temp) //没有元素字符串导入
			ls_result += wf_result_add(ls_item, "5. of_Load([]) return value true",    not isnull(lbn_flag) and lbn_flag = true )					
			ls_temp = ''
			ls_temp = lecd_nodearray.of_ToString()
			ls_result += wf_result_add(ls_item, "6. of_Load([]) lecd_nodearray.of_ToString",    not isnull(ls_temp) and ls_temp = '[]' )								
			li_rtn = 0 
			li_rtn = lecd_nodearray.of_Size()
			ls_result += wf_result_add(ls_item, "7. of_Load([]) lecd_nodearray.of_Size",    not isnull(li_rtn) and li_rtn =0 )								
			
			setnull(lbn_flag)
			ls_temp	=	'[{"":true,"2":2}]'
			lbn_flag	=	lecd_nodearray.of_Load(ls_temp)
			ls_result += wf_result_add(ls_item, '8. of_Load(array) return value true',    not isnull(lbn_flag) and lbn_flag = true )					
			ls_temp = ''
			ls_temp = lecd_nodearray.of_ToString()
			ls_result += wf_result_add(ls_item, '9. of_Load(array) lecd_nodearray.of_ToString',    not isnull(ls_temp) and ls_temp = '[{"":true,"2":2}]' )					
			setnull(lbn_flag)
			lbn_flag	=	lecd_nodearray.of_Getboolbyindex( 1)
			ls_result += wf_result_add(ls_item, '10. of_Load(array) lecd_nodearray.of_Getboolbyindex',    isnull(lbn_flag) )					
			
			setnull(lbn_flag)
			ls_temp	=	'[{"":true,"2":2}' //不正确格式
			lbn_flag	=	lecd_nodearray.of_Load(ls_temp)
			ls_result += wf_result_add(ls_item, '11. of_Load([not correct array) return value false',    not isnull(lbn_flag) and lbn_flag = false )					
			ls_temp = ''
			ls_temp = lecd_nodearray.of_ToString()
			ls_result += wf_result_add(ls_item, '12. of_Load([not correct array) lecd_nodearray.of_ToString',    not isnull(ls_temp) and ls_temp = '[]' )					
			
			setnull(lbn_flag)
			ls_temp	=	'{"":true,"2":2}]' //不正确格式
			lbn_flag	=	lecd_nodearray.of_Load(ls_temp)
			ls_result += wf_result_add(ls_item, '13. of_Load(not correct array]) return value false',    not isnull(lbn_flag) and lbn_flag = false )					
			ls_temp = ''
			ls_temp = lecd_nodearray.of_ToString()
			ls_result += wf_result_add(ls_item, '14. of_Load(not correct array]) lecd_nodearray.of_ToString',    not isnull(ls_temp) and ls_temp = '[]' )					
			
			setnull(lbn_flag)
			ls_temp	=	'{"":true,"2":2}' //不正确格式
			lbn_flag	=	lecd_nodearray.of_Load(ls_temp)
			ls_result += wf_result_add(ls_item, '15. of_Load(not correct array no []) return value false',    not isnull(lbn_flag) and lbn_flag = false )					
			ls_temp = ''
			ls_temp = lecd_nodearray.of_ToString()
			ls_result += wf_result_add(ls_item, '16. of_Load(not correct array no []) lecd_nodearray.of_ToString',    not isnull(ls_temp) and ls_temp = '[]' )					
			
			setnull(lbn_flag)
			ls_temp	=	'[0.095,"Test",true,{"key1":"Array Load()","key2":123456789},[{"key1":"Array Load()","key2":123456789},false,"test load array"],"",false,0.000000059,"If	1=1	Then~r~nElse~r~nEnd	If"]'
			lbn_flag	=	lecd_nodearray.of_Load(ls_temp)
			ls_result += wf_result_add(ls_item, '17. of_Load() return value true',    not isnull(lbn_flag) and lbn_flag = true )					
			ls_temp = ''
			ls_temp = lecd_nodearray.of_ToString()			
			ls_result += wf_result_add(ls_item, '18. of_Load() lecd_nodearray.of_ToString',    not isnull(ls_temp) and ls_temp = '[0.095,"Test",true,{"key1":"Array Load()","key2":123456789},[{"key1":"Array Load()","key2":123456789},false,"test load array"],"",false,0.000000059,"If	1=1	Then~r~nElse~r~nEnd	If"]' )					
			
			lecd_nodearray.of_cleararray( )
			ls_temp = ''
			ls_temp = lecd_nodearray.of_ToString()	
			ls_result += wf_result_add(ls_item, '19. cleararray and Then lecd_nodearray.of_ToString',    not isnull(ls_temp) and ls_temp = '[]' )					
		
			if isvalid(lecd_nodearray) then Destroy	lecd_nodearray	
		case lower("of_append")
//			'SDKAPIJSONW01P020' //通过appeon()添加的节点获取其类型，长度
			if not isvalid(lec_node) then lec_node	=	Create	eon_cjsonnode				
			if not isvalid(lecd_nodearray) then lecd_nodearray	=	Create	eon_cjsonnodearray
			if not isvalid(lecd_nodearray01) then lecd_nodearray01	=	Create	eon_cjsonnodearray
			
			If	Not	Isvalid(lecd_nodearray)	Then
				Messagebox ('warning','the create NodeArray	object not is valid')
			Else
				lecd_nodearray.of_append( lecd_nodearray) //自己添加自己
			End	If
			If	Not	Isvalid(lec_node)	Then
				Messagebox ('warning','the create Node object not is valid')
			Else
				lecd_nodearray.of_append( lec_node)
			End	If
			lec_node.of_addkey( "boolean", True)
			lecd_nodearray.of_append( lec_node)
			lecd_nodearray.of_append( 0.0000019)
			lecd_nodearray.of_append( 0.000019)
			lecd_nodearray.of_append( 0.19)
			lecd_nodearray.of_append( SetNull(lbn_flag))
			
			ls_temp	=	"If	1=1	Then~r~n~r~nElseIf	~r~nls_Return=Error~r~nEnd	If"
			lecd_nodearray.of_append( ls_temp	)
			SetNull(ls_temp)
			lecd_nodearray.of_append( ls_temp	)
			lecd_nodearray.of_append( lecd_nodearray	)
			lecd_nodearray.of_append( '')
			SetNull(	li_rtn	)
			lecd_nodearray.of_append( li_rtn	)
			li_rtn	=	32767
			lecd_nodearray.of_append( li_rtn	)
			ls_temp = ''
			ls_temp = lecd_nodearray.of_ToString()
			ls_result += wf_result_add(ls_item, '1. all of append() of_ToString',    not isnull(ls_temp) and ls_temp = '[[],{},{"boolean":true},0,0.000019,0.19,,"If\t1=1\tThen\r\n\r\nElseIf\t\r\nls_Return=Error\r\nEnd\tIf",,[[],{},{"boolean":true},0,0.000019,0.19,,"If\t1=1\tThen\r\n\r\nElseIf\t\r\nls_Return=Error\r\nEnd\tIf",],"",,32767]' )					
			ll_position = 1						
			For	li_col	=	1	To	lecd_nodearray.of_size( )
				li_rtn	=	lecd_nodearray.of_gettypebyindex(li_col)
				Choose	Case	li_rtn
					Case	0 //分别用支持的不同类型变量去接收返回的null值
						ll_position ++
						ls_result += wf_result_add(ls_item, string(ll_position)+ '.array is null ', not isnull(li_col) and (li_col = 7 or li_col = 9 or li_col = 12 ))					
						ldb_digit	=	lecd_nodearray.of_Getdoublebyindex( li_col)
						ll_position ++
						ls_result += wf_result_add(ls_item, string(ll_position)+ '.array get null double',  not isnull(li_col) and (li_col = 7 or li_col = 9 or li_col = 12 ))					
						ls_temp = ""
						ls_temp	=	lecd_nodearray.of_Getstringbyindex( li_col)
						ll_position ++
						ls_result += wf_result_add(ls_item, string(ll_position)+ '.array get null string',  not isnull(li_col) and (li_col = 7 or li_col = 9  or li_col = 12) )					
						setnull(lbn_flag)
						ll_position ++
						lbn_flag	=	lecd_nodearray.of_Getboolbyindex( li_col)
						ls_result += wf_result_add(ls_item, string(ll_position)+ '.array get null bool',  not isnull(li_col) and (li_col = 7 or li_col = 9  or li_col = 12) )					
						
						lec_node	=	lecd_nodearray.of_GetNodebyindex( li_col)
						If	Not	Isvalid(lec_node)	Then
							ll_position ++
							ls_result += wf_result_add(ls_item, string(ll_position)+ '.node get null node, object is not valid. ',   not isnull(li_col) and (li_col = 7 or li_col = 9  or li_col = 12) )					
						Else
							ll_position ++
							ls_temp = ""
							ls_temp = lec_node.of_ToString()
							ls_result += wf_result_add(ls_item, string(ll_position)+ '.node get lec_node.of_ToString(). '+string(li_col),  not isnull(ls_temp) and ls_temp = "" )					
						End	If
											
						lecd_nodearray01	=	lecd_nodearray.of_Getarraynodebyindex( li_col	)
						If	Not	Isvalid(lecd_nodearray01)	Then
							ll_position ++
							ls_result += wf_result_add(ls_item, string(ll_position)+ '.lecd_nodearray01 get null array, object is not valid. ',   not isnull(li_col) and (li_col = 7 or li_col = 9  or li_col = 12) )					
						Else
							ll_position ++
							ls_temp = ""
							ls_temp = lecd_nodearray01.of_ToString()
							ls_result += wf_result_add(ls_item, string(ll_position)+ '.lecd_nodearray01 get lecd_nodearray01.of_ToString(). '+string(li_col),  not isnull(ls_temp) and ls_temp = "" )					
						End	If
					Case	1
						ls_temp = ""
						ls_temp	=	lecd_nodearray.of_GetStringbyIndex(	li_col	)
						ll_position ++
						ls_result += wf_result_add(ls_item, string(ll_position)+ '.array of_GetStringbyIndex' ,  (not isnull(ls_temp) and ls_temp ="If	1=1	Then~r~n~r~nElseIf	~r~nls_Return=Error~r~nEnd	If" and li_col =  8) or (not isnull(ls_temp) and ls_temp = '' and li_col =  11))					
					Case	2
						ldb_digit = 0 
						ldb_digit	=	lecd_nodearray.of_getdoublebyindex( li_col	)
						ll_position ++
						ls_result += wf_result_add(ls_item, string(ll_position)+ '.array of_getdoublebyindex',  (not isnull(ldb_digit) and ldb_digit = 32767 and li_col =  13) or (not isnull(ldb_digit) and ldb_digit = .0000019 and li_col =  4) or (not isnull(ldb_digit) and ldb_digit = .000019 and li_col =  5) or (not isnull(ldb_digit) and ldb_digit = .19 and li_col =  6) )					
					Case	3
						setnull(lbn_flag)
						lbn_flag	=	lecd_nodearray.of_GetBoolbyIndex(	li_col	)
						ll_position ++
						ls_result += wf_result_add(ls_item, string(ll_position)+ '.array of_GetBoolbyIndex',  not isnull(lbn_flag) and lbn_flag = true  )					
					Case	4
						ls_temp = ""
						ll_position ++
						lecd_nodearray01	=	lecd_nodearray.of_Getarraynodebyindex(	li_col	)
						ls_temp = lecd_nodearray01.of_ToString()
						ls_result += wf_result_add(ls_item, string(ll_position)+ '.array of_Getarraynodebyindex',  (not isnull(ls_temp) and ls_temp ='[[],{},{"boolean":true},0,0.000019,0.19,,"If\t1=1\tThen\r\n\r\nElseIf\t\r\nls_Return=Error\r\nEnd\tIf",]' and li_col =  10) or (not isnull(ls_temp) and ls_temp = '[]' and li_col =1))					
					Case	5
						lec_node	=	lecd_nodearray.of_GetNodebyIndex(	li_col	)
						ll_position ++
						ls_temp = ""
						ls_temp = lec_node.of_ToString()
						ls_result += wf_result_add(ls_item, string(ll_position)+ '.array of_GetNodebyIndex',  (not isnull(ls_temp) and ls_temp = "{}" and li_col =  2) or (not isnull(ls_temp) and ls_temp = '{"boolean":true}' and li_col =  3) )					
					Case	else
						Messagebox('failed','Get the array type failed!')
				End	Choose
			Next
				
			if isvalid(lec_node) then Destroy	lec_node	
			if isvalid(lecd_nodearray) then Destroy	lecd_nodearray	
			if isvalid(lecd_nodearray01) then Destroy	lecd_nodearray01		
		case lower("")					
		case lower("")		
		case lower("")
		case lower("")								
			//Maximum script size exceeded. 		//2100
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
Double		ldb_digit
eon_cjsonnode		lec_node01, lec_node
eon_cjsonnodearray	lecd_nodearray, lecd_nodearray01

is_log = ''
ls_result = ''
ll_bound =0 
setnull(ll_null)
SetNull(ls_null)

ls_array[Upperbound(ls_array) + 1 ] = "node_Value"
ls_array[Upperbound(ls_array) + 1 ] = "of_Getkeybyindex"
ls_array[Upperbound(ls_array) + 1 ] = "arraytype"
ls_array[Upperbound(ls_array) + 1 ] = "of_torawstring"										//edit you test case point name

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
	ldb_digit = 0
	lbn_flag = false
	choose case lower(ls_item)
		case lower("node_Value")	
		// all 	//			'SDKAPIJSONW01P021','SDKAPIJSONW01P022' //node.of_size(), node.of_gettypebyindex, node.of_gettypebykey,node.of_getkeybyindex
			if not isvalid(lec_node)  then lec_node	=	Create	eon_cjsonnode			
			if not isvalid(lec_node01)  then lec_node01	=	Create	eon_cjsonnode		
			if not isvalid(lecd_nodearray) then lecd_nodearray	=	Create	eon_cjsonnodearray
			
			ls_temp	=	'{"Node1":{},"Node2":{"Key1":"value1"},"boolean":True,"String":"Test~r~nTestsecondRow","Number":9.000014,"Array":[True,False,"String",0.01,{"key1":"valuearray"}]}'
			
			li_rtn	=	lec_node.of_size( )//未加节点时
			ls_result += wf_result_add(ls_item, "1. array size Return value ", not isnull(li_rtn) and li_rtn = 0)
			
			lbn_flag	=	lec_node.of_Load(ls_temp)
			ls_result += wf_result_add(ls_item, "2. of_Load Return value ", not isnull(lbn_flag) and lbn_flag = true)
			
			ll_tmp	=	lec_node.of_size( )//load 节点后
			ls_result += wf_result_add(ls_item, "3. array size Return value ", not isnull(ll_tmp) and ll_tmp = 6)
			
			If	ll_tmp	>	0	Then
				ll_position = 3
				For	li_rtn	=	1	To	lec_node.of_size( )
					ls_temp2	=	lec_node.of_GetkeybyIndex(li_rtn)
					li_col	=	lec_node.of_Gettypebykey( ls_temp2)
					If	lec_node.of_GettypebyIndex( li_rtn	)	<>	li_col	Then
						Messagebox ('error', 'the keyType Getbykey not equal to getbyindex')
						Return
					End	If
					Choose	Case	li_col
						Case	0							
							ll_position ++
							ls_result += wf_result_add(ls_item, string(ll_position)+". lec_node value is null ", not isnull(li_rtn) and li_rtn = 3)
							
							ls_temp = ""
							ls_temp = lec_node.of_valuestring( ls_temp2)
							ll_position ++
							ls_result += wf_result_add(ls_item, string(ll_position)+". lec_node key of_valuestring ", isnull(ls_temp) and  li_rtn = 3)
							
							setnull(lbn_flag)
							lbn_flag	=	lec_node.of_valueboolean( ls_temp2)
							ll_position ++				
							ls_result += wf_result_add(ls_item, string(ll_position)+". lec_node key of_valueboolean ", isnull(lbn_flag) and  li_rtn = 3 )
							
							ldb_digit = 0 
							ldb_digit	=	lec_node.of_valueDouble( ls_temp2)
							ll_position ++				
							ls_result += wf_result_add(ls_item, string(ll_position)+". lec_node key of_valueDouble ", isnull(ldb_digit) and li_rtn = 3 )
							
							lecd_nodearray	=	lec_node.of_valuearray(	ls_temp2	)
							If	Not	IsValid(lecd_nodearray)	Then
								ll_position ++
								ls_result += wf_result_add(ls_item, string(ll_position)+". array lec_node key of_valuearray is not valid object ", not isnull(li_rtn) and li_rtn = 3)
							Else
								ls_temp = ""
								ls_temp = lecd_nodearray.of_ToString()
								ll_position ++
								ls_result += wf_result_add(ls_item, string(ll_position)+". array lec_node key of_valuearray .of_ToString() "+string(li_rtn), not isnull(ls_temp) and ls_temp = '' and  li_rtn = 3)
							End	If
							
							lec_node01	=	lec_node.of_valuenode(	ls_temp2	)
							If	Not	IsValid(lec_node01)	Then
								ll_position ++
								ls_result += wf_result_add(ls_item, string(ll_position)+". lec_node key of_valuenode is not valid object ", not isnull(li_rtn) and li_rtn = 3)
							Else
								ls_temp = ""
								ls_temp = lec_node01.of_ToString()
								ll_position ++
								ls_result += wf_result_add(ls_item, string(ll_position)+". lec_node key of_valuenode .of_ToString() "+string(li_rtn), not isnull(ls_temp) and ls_temp = '' and  li_rtn = 3 )								
							End	If							
						Case	1
							ls_temp = ""
							ls_temp	=	lec_node.of_valuestring( ls_temp2)
							ll_position ++
							ls_result += wf_result_add(ls_item, string(ll_position)+". lec_node key type of_valuestring ", (not isnull(ls_temp) and ls_temp = '[True,False,"String",0.01,{"key1":"valuearray"}]' and li_rtn = 6 ) or (not isnull(ls_temp) and ls_temp = 'Test~r~nTestsecondRow' and li_rtn = 4 ))
						Case	2
							ldb_digit = 0 
							ldb_digit	=	lec_node.of_valueDouble( ls_temp2)
							ll_position ++				
							ls_result += wf_result_add(ls_item, string(ll_position)+". lec_node key type of_valueDouble ", not isnull(ldb_digit) and ldb_digit =9.000014 and li_rtn = 5 )
						Case	3
							setnull(lbn_flag)
							lbn_flag	=	lec_node.of_valueboolean( ls_temp2)
							ll_position ++				
							ls_result += wf_result_add(ls_item, string(ll_position)+". lec_node key  type  of_valueboolean ", not isnull(lbn_flag) and lbn_flag =true )							
						Case	4
							lecd_nodearray	=	lec_node.of_valuearray(	ls_temp2	)
							ls_temp = ""
							ls_temp = lecd_nodearray.of_ToString()
							ll_position ++
							ls_result += wf_result_add(ls_item, string(ll_position)+". array lec_node key type of_valuearray .of_ToString() ", not isnull(ls_temp) and ls_temp = '[True,False,"String",0.01,{"key1":"valuearray"}]' and li_rtn = 6)
						Case	5
							lec_node01	=	lec_node.of_valuenode(	ls_temp2	)
							ls_temp = ""
							ls_temp = lec_node01.of_ToString()
							ll_position ++
							ls_result += wf_result_add(ls_item, string(ll_position)+". lec_node key type of_valuenode .of_ToString() ", (not isnull(ls_temp) and ls_temp = '{}' and li_rtn = 1) or (not isnull(ls_temp) and ls_temp = '{"Key1":"value1"}' and li_rtn = 2) )								
						Case	Else
							Messagebox('Error','Get type error please check type')
					End	Choose
				Next				
			End	If
		
			if isvalid(lec_node) then Destroy	lec_node	
			if isvalid(lec_node01) then Destroy	lec_node01	
			if isvalid(lecd_nodearray) then Destroy	lecd_nodearray				
		case lower("of_Getkeybyindex")			
//			'SDKAPIJSONW01P023'	//获取用户输入的节点的所有key
			if not isvalid(lec_node)  then lec_node	=	Create	eon_cjsonnode			
			if not isvalid(lecd_nodearray) then lecd_nodearray	=	Create	eon_cjsonnodearray
			
			ls_temp	=	lec_node.of_Getkeybyindex( 1	) //异常索引测试 返回值
			ls_result += wf_result_add(ls_item, "1. the node not  have node lec_node.of_Getkeybyindex ", isnull(ls_temp) )
			
			lec_node.of_addkey( "", "\node\test\dim\2014-012-23.jpeg")
			lec_node.of_addkey( " ", "232")
			lec_node.of_addkey( " ", "123")
			lec_node.of_addkey( "true", "123")
			lec_node.of_addkey( "double", 0.1234569)
			lec_node.of_addkey( "Node", lec_node)
			lec_node.of_addkey( "NodeArray", lecd_nodearray)
			ls_temp = ""
			ls_temp = lec_node.of_tostring()
			ls_result += wf_result_add(ls_item, "2. lec_node.of_tostring ", not isnull(ls_temp) and ls_temp = '{"":"\\node\\test\\dim\\2014-012-23.jpeg"," ":"123","true":"123","double":0.123457,"Node":{"":"\\node\\test\\dim\\2014-012-23.jpeg"," ":"123","true":"123","double":0.123457},"NodeArray":[]}' )
			For	li_rtn	=	1	To	lec_node.of_size( )
				ls_temp = ""
				ls_temp = lec_node.of_GetKeyByIndex(li_rtn)
				choose case li_rtn 
					case 1
						ls_result += wf_result_add(ls_item, string(2 + li_rtn)+". lec_node.of_GetKeyByindex ", not isnull(ls_temp) and ls_temp = '' and li_rtn = 1 )
					case 2 
						ls_result += wf_result_add(ls_item, string(2 + li_rtn)+". lec_node.of_GetKeyByindex ", not isnull(ls_temp) and ls_temp = ' ' and li_rtn = 2 )						
					case 3
						ls_result += wf_result_add(ls_item, string(2 + li_rtn)+". lec_node.of_GetKeyByindex ", not isnull(ls_temp) and ls_temp = 'true' and li_rtn = 3 )
					case 4
						ls_result += wf_result_add(ls_item, string(2 + li_rtn)+". lec_node.of_GetKeyByindex ", not isnull(ls_temp) and ls_temp = 'double' and li_rtn = 4 )
					case 5
						ls_result += wf_result_add(ls_item, string(2 + li_rtn)+". lec_node.of_GetKeyByindex ", not isnull(ls_temp) and ls_temp = 'Node' and li_rtn = 5 )
					case 6
						ls_result += wf_result_add(ls_item, string(2 + li_rtn)+". lec_node.of_GetKeyByindex ", not isnull(ls_temp) and ls_temp = 'NodeArray' and li_rtn = 6 )
					case else
						
				end choose 
			Next
			
			ls_temp = ""
			ls_temp	=	lec_node.of_Getkeybyindex( lec_node.of_size() +	1	) //异常索引测试 返回值
			ls_result += wf_result_add(ls_item, "9. the index is large than node size lec_node.of_Getkeybyindex(	size	+	1	) ", isnull(ls_temp) )
			lec_node.of_clearnode( )
			ls_temp = ""
			ls_temp = lec_node.of_tostring()
			ls_result += wf_result_add(ls_item, "10. the lec_node.of_clearnode output node ", not isnull(ls_temp) and ls_temp = "{}")		
			if isvalid(lec_node) then Destroy	lec_node	
			if isvalid(lecd_nodearray) then Destroy	lecd_nodearray		
		case lower("arraytype")			
			//	'SDKAPIJSONW01P026'
			if not isvalid(lec_node)  then lec_node	=	Create	eon_cjsonnode			
			if not isvalid(lec_node01)  then lec_node01	=	Create	eon_cjsonnode		
			if not isvalid(lecd_nodearray) then lecd_nodearray	=	Create	eon_cjsonnodearray
			
			ls_temp	=	'{"boolean":true,"digit":2343894,"node":{"key1":"Array Load()","key2":123456789},"array":[{"key1":"Array Load()","key2":123456789},false,"test load array"],"null":""}'
			lbn_flag	=	lec_node.of_Load(ls_temp)
			ls_result += wf_result_add(ls_item, "1. of_Load array return value", not isnull(lbn_flag) and lbn_flag =true)		
			SetNull(lbn_flag)	
			ls_temp = "" 
			ls_temp = lec_node.of_toString()
			ls_result += wf_result_add(ls_item, "2. of_Load node.tostring()", not isnull(ls_temp) and ls_temp ='{"boolean":true,"digit":2343894,"node":{"key1":"Array Load()","key2":123456789},"array":[{"key1":"Array Load()","key2":123456789},false,"test load array"],"null":""}')		
			
			ll_position = 2 
			For	li_rtn	=	1	To	lec_node.of_size( )
				li_col	=	lec_node.of_gettypebyindex(li_rtn)
				ls_temp2	=	lec_node.of_Getkeybyindex(li_rtn)
				Choose	Case	li_col
					Case	0
						ll_position ++
						ls_result += wf_result_add(ls_item, string(ll_position)+". node type = 0 ", not isnull(li_rtn) and li_rtn = 0)		
					Case	1
						ls_temp = ""
						ls_temp	=	lec_node.of_valuestring(	ls_temp2	)
						ll_position ++
						ls_result += wf_result_add(ls_item, string(ll_position)+". node of_valuestring", not isnull(ls_temp) and ls_temp = '' and li_rtn = 5 )		
					Case	2
						ldb_digit = 0
						ldb_digit	=	lec_node.of_Valuedouble( ls_temp2	)
						ll_position ++
						ls_result += wf_result_add(ls_item, string(ll_position)+". node of_Valuedouble", not isnull(ldb_digit) and ldb_digit = 2343894 and li_rtn = 2 )		
					Case	3
						setnull(lbn_flag)
						lbn_flag	=	lec_node.of_valueboolean(	ls_temp2	)
						ll_position ++
						ls_result += wf_result_add(ls_item, string(ll_position)+". node of_valueboolean", not isnull(lbn_flag) and lbn_flag = true and li_rtn = 1 )		
					Case	4
						lecd_nodearray	=	lec_node.of_valuearray(	ls_temp2	)
						ll_position ++
						ls_temp = ""
						ls_temp = lecd_nodearray.of_ToString()
						ls_result += wf_result_add(ls_item, string(ll_position)+". node of_valuearray of_ToString", not isnull(ls_temp) and ls_temp = '[{"key1":"Array Load()","key2":123456789},false,"test load array"]' and li_rtn = 4 )		
					Case	5
						lec_node01	=	lec_node.of_valuenode(	ls_temp2	)
						ll_position ++
						ls_temp = ""
						ls_temp = lec_node01.of_ToString()
						ls_result += wf_result_add(ls_item, string(ll_position)+". node of_valuenode of_ToString", not isnull(ls_temp) and ls_temp = '{"key1":"Array Load()","key2":123456789}' and li_rtn = 3 )		
					Case	else
						Messagebox('failed','Get the array type failed!')
				End	Choose
			Next
		
			if isvalid(lec_node) then Destroy	lec_node	
			if isvalid(lec_node01) then Destroy	lec_node01	
			if isvalid(lecd_nodearray) then Destroy	lecd_nodearray		
			
			//'SDKAPIJSONW01P027'
			//donot need it .			
		case lower("of_torawstring")					//不能用单引号
			if not isvalid(lec_node)  then lec_node	=	Create	eon_cjsonnode			
//			lec_node.of_clearnode( )
			lec_node.of_addkey( "calendarId", 1 )
			lec_node.of_addkey( "calendarName", "MyCreatedCalendar")
			lec_node.of_addkey( "firstReminderMinutes", 60)
			lec_node.of_addkey( "recurrence", "monthly")
			lec_node.of_addkey( "recurrenceEndDate","new Date(2016,10,1,0,0,0,0,0);")
			lec_node.of_addkey( "recurrenceInterval", 2)
			lec_node.of_addkey( "secondReminderMinutes",5)
			lec_node.of_addkey( "url", "https://www.appeon.com")
			ls_temp = ""
			ls_temp = lec_node.of_tostring( )			
			ls_result += wf_result_add(ls_item, "1. node.of_ToString ", not isnull(ls_temp) and ls_temp = '{"calendarId":1,"calendarName":"MyCreatedCalendar","firstReminderMinutes":60,"recurrence":"monthly","recurrenceEndDate":"new Date(2016,10,1,0,0,0,0,0);","recurrenceInterval":2,"secondReminderMinutes":5,"url":"https:\/\/www.appeon.com"}' )		
//			messagebox("ls_temp1",ls_temp)
			ls_temp = ""
			ls_temp = lec_node.of_torawstring( )		
			ls_result += wf_result_add(ls_item, "2. node.of_torawstring ", not isnull(ls_temp) and ls_temp = '{"calendarId":1,"calendarName":MyCreatedCalendar,"firstReminderMinutes":60,"recurrence":monthly,"recurrenceEndDate":new Date(2016,10,1,0,0,0,0,0);,"recurrenceInterval":2,"secondReminderMinutes":5,"url":https://www.appeon.com}' )	
//			messagebox("ls_temp2",ls_temp)
			if isvalid(lec_node) then Destroy	lec_node	
						
			if not isvalid(lec_node)  then lec_node	=	Create	eon_cjsonnode		
//			lec_node.of_clearnode( )
			lec_node.of_addkey( "calendarId", 1 )
			lec_node.of_addkey( "calendarName", "~"MyCreatedCalendar~"")
			lec_node.of_addkey( "firstReminderMinutes", 60)
			lec_node.of_addkey( "recurrence", "~"monthly~"")
			lec_node.of_addkey( "recurrenceEndDate","new Date(2016,10,1,0,0,0,0,0);")
			lec_node.of_addkey( "recurrenceInterval", 2)
			lec_node.of_addkey( "secondReminderMinutes",5)
			lec_node.of_addkey( "url", "~"https://www.appeon.com~"")
			ls_temp = ""
			ls_temp = lec_node.of_tostring( )			
			ls_result += wf_result_add(ls_item, "3. node.of_ToString " , not isnull(ls_temp) and ls_temp = '{"calendarId":1,"calendarName":"\"MyCreatedCalendar\"","firstReminderMinutes":60,"recurrence":"\"monthly\"","recurrenceEndDate":"new Date(2016,10,1,0,0,0,0,0);","recurrenceInterval":2,"secondReminderMinutes":5,"url":"\"https:\/\/www.appeon.com\""}' )		
//			messagebox("ls_temp3",ls_temp)
			ls_temp = ""
			ls_temp = lec_node.of_torawstring( )		
			ls_result += wf_result_add(ls_item, "4. node.of_torawstring ", not isnull(ls_temp) and ls_temp = '{"calendarId":1,"calendarName":"MyCreatedCalendar","firstReminderMinutes":60,"recurrence":"monthly","recurrenceEndDate":new Date(2016,10,1,0,0,0,0,0);,"recurrenceInterval":2,"secondReminderMinutes":5,"url":"https://www.appeon.com"}' )	
//			messagebox("ls_temp4",ls_temp)	
			if isvalid(lec_node) then Destroy	lec_node	
		case lower("")		
		case lower("")					
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_object_json.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_object_json.destroy
call super::destroy
destroy(this.cb_1)
end on

event close;call super::close;If	Isvalid(iec_node)	Then	Destroy	iec_node	
end event

event ue_preopen;call super::ue_preopen;iec_node	=	Create	eon_cjsonnode
end event

type cb_1 from commandbutton within w_object_json
integer x = 73
integer y = 124
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Execute"
end type

event clicked;of_testcase_point_module()
end event

