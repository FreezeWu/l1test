$PBExportHeader$w_mobile_device.srw
forward
global type w_mobile_device from w_base_case
end type
type cb_1 from commandbutton within w_mobile_device
end type
type dw_1 from datawindow within w_mobile_device
end type
end forward

global type w_mobile_device from w_base_case
cb_1 cb_1
dw_1 dw_1
end type
global w_mobile_device w_mobile_device

type variables
oleobject ieon_ole
eon_mobile_awsex ieon_aws
eon_mobile_deviceex ieon_device

string 			is_separator_dwresize="@"
end variables

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname
integer 		li_rtn, li_col, li_height, li_width
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

ls_array[Upperbound(ls_array) + 1 ] = "mobile_device_info"			//edit you test case point name
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
		case lower("mobile_device_info")	
			ieon_aws  = create eon_mobile_awsex
			ieon_device = create eon_mobile_deviceex
			ieon_ole = create oleobject
			
			if AppeonGetClientType() = "MOBILE" then  
				ieon_ole.connecttonewobject( "AppeonMobile.CordovaPlugin")
				ieon_ole.AssociateJSwithPB("window.device",this)				
				ls_temp2 = ieon_ole.ExecJavaScriptWithReturn("typeof "+"window.device")
			
				ls_result += wf_result_add(ls_item, "0. connect to window.device ", not isnull(ls_temp2) and ls_temp2 = 'object')
				if not isnull(ls_temp2) and ls_temp2 = 'object' then
					//
				else
	//				messagebox("connect to window.device Failed",ls_temp)
					return
				end if
			end if 
			
			li_rtn = 0
			ls_temp = ""
			li_rtn = ieon_device.of_getname( ls_temp)
			if dw_1.rowcount( ) = 0 then dw_1.insertrow( 0)
			dw_1.SetItem( dw_1.getrow( ) , "name",ls_temp )
			ls_result += wf_result_add(ls_item, "1. device name ", not isnull(ls_temp) and trim(ls_temp) <> "" and li_rtn = 1)
			
			ls_temp = ""
			ls_temp = string(ieon_ole.model)
			dw_1.SetItem( dw_1.getrow( ) , "model",ls_temp )
			ls_result += wf_result_add(ls_item, "2. device model ", not isnull(ls_temp) and trim(ls_temp) <> "")

			ls_temp = ""
			ls_temp = string(ieon_ole.platform)
			dw_1.SetItem( dw_1.getrow( ) , "platform",ls_temp )
			ls_result += wf_result_add(ls_item, "3. device platform ", not isnull(ls_temp) and trim(ls_temp) <> "")

			ls_temp = ""
			ls_temp = string(trim(ieon_ole.version))
			dw_1.SetItem( dw_1.getrow( ) , "osversion",ls_temp )
			ls_result += wf_result_add(ls_item, "4. device osversion ", not isnull(ls_temp) and trim(ls_temp) <> "")
			
			li_rtn = 0
			li_height = 0
			li_width = 0 
			li_rtn = ieon_device.of_getresolution( li_height, li_width)
			dw_1.SetItem( dw_1.getrow( ) , "resolution",string(li_height)+"*"+string(li_width) )				//height * width
			ls_result += wf_result_add(ls_item, "5. device resolution ", not isnull(li_height) and not isnull(li_width) and li_height > 0 and li_width > 0 and li_rtn = 1)

			li_rtn =0 
			ls_temp = ""
			li_rtn = ieon_aws.of_getversion( ls_temp)
			dw_1.SetItem( dw_1.getrow( ) , "awsversion",  "Build "+ls_temp)
			ls_result += wf_result_add(ls_item, "6. device awsversion ", not isnull(ls_temp) and trim(ls_temp) <> "" and li_rtn = 1)
			
			ll_tmp = 0
			ll_tmp = ieon_device.of_gettotalmemory( )
			dw_1.SetItem( dw_1.getrow( ) , "memory", string(ll_tmp /1024,"##.00")+"MB")
			ls_result += wf_result_add(ls_item, "7. device memory ", not isnull(ll_tmp) and ll_tmp > 0)
			
			ls_temp = ""
			ls_temp = ieon_ole.Manufacturer
			dw_1.SetItem( dw_1.getrow( ) , "manufacturer",ls_temp)
			ls_result += wf_result_add(ls_item, "8. device manufacturer ", not isnull(ls_temp) and trim(ls_temp) <> "" )
			
			ls_temp = ""
			ls_temp = ieon_ole.uuid
			dw_1.SetItem( dw_1.getrow( ) , "uuid", ls_temp)
			ls_result += wf_result_add(ls_item, "9. device uuid ", not isnull(ls_temp) and trim(ls_temp) <> "" )
			
			ls_temp = ""
			ieon_device.of_getdeviceid(ls_temp)
			dw_1.SetItem( dw_1.getrow( ) , "awsid",mid(ls_temp,1,8)+'-'+mid(ls_temp,9,4)+'-'+mid(ls_temp,13,4)+"-"+mid(ls_temp,17,4)+"-"+mid(ls_temp,21) )
			ls_result += wf_result_add(ls_item, "10. device awsid ", not isnull(ls_temp) and trim(ls_temp) <> "" and len(ls_temp) >= 21 )
			
//			//dw_1.SetItem( dw_1.getrow( ) , "serial", ieon_ole.Serial)
			
		case lower("")			
			//Maximum script size exceeded. 		//2100
	end choose 
next 

is_resultlog += ls_result

end subroutine

on w_mobile_device.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_1
end on

on w_mobile_device.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

event close;call super::close;if isvalid(ieon_aws) then  destroy ieon_aws
if isvalid(ieon_device) then  destroy ieon_device
if isvalid(ieon_ole) then  destroy ieon_ole
end event

type cb_1 from commandbutton within w_mobile_device
integer x = 46
integer y = 184
integer width = 530
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "GetInfomation"
end type

event clicked;of_testcase_point_module()
end event

type dw_1 from datawindow within w_mobile_device
integer x = 631
integer y = 12
integer width = 2062
integer height = 1508
integer taborder = 10
string title = "none"
string dataobject = "d_mobile_device"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

