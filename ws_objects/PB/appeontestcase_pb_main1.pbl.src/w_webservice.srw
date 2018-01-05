$PBExportHeader$w_webservice.srw
forward
global type w_webservice from w_base_case
end type
type cb_1 from commandbutton within w_webservice
end type
end forward

global type w_webservice from w_base_case
cb_1 cb_1
end type
global w_webservice w_webservice

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();//执行webservice
appeonservice  leon_service
string ls_version
long ll_rtn

authsoapheader leon_header
soapconnection  leon_soap
leon_header = create authsoapheader
leon_soap = create soapconnection
leon_service = create appeonservice

leon_header.username ="admin"
leon_header.password = "admin"

ll_rtn = leon_soap.createinstance( leon_service, 'appeonservice')
if ll_rtn = 0 then
	is_resultlog = "connect to service succeed!~r~n"
	is_resultlog += "只要正确获取server版本号即可~r~n"
else
	is_resultlog = "connect to service Failed:"+string(ll_rtn)+"~r~n"
end if
leon_service.setauthsoapheadervalue(leon_header)
ls_version = leon_service.getserverversion()

is_resultlog += "Server version = "+ls_version
end subroutine

on w_webservice.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_webservice.destroy
call super::destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_webservice
integer x = 320
integer y = 504
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "webservice"
end type

