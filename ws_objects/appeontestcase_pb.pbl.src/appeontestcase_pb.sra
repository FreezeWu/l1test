$PBExportHeader$appeontestcase_pb.sra
$PBExportComments$Generated Application Object
forward
global type appeontestcase_pb from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
string 			gs_username,gs_pass
integer  			gi_userid,gi_rightmode

string				gs_cachedir, gs_dirseparator
environment 	ge_environment
boolean			gb_64bit =false
integer 			gi_major, gi_minor
window  			gw_setvalue

//begin xionghuping  2017-5-13
String	gs_str = "None"

n_cst_uso101_autouo guo_autouo, guo_multiautouo
n_cst_uso104_autouo	guo4_autouo
n_cst_uso109_l1_nvo guo_nvo
n_cst_uso109_l1_nvo guo_nvo1, guo_nvo2
n_cst_uso111_nvo	guo11_nvo
Boolean	gb_close = False
u_cst_tab001_tabpage	guo_tabpage
//end xionghuping  2017-5-13  

//2017.5.13 wukaichen add begin
string	gs_output=''
string gs_output2=''
//2017.5.13 wukaichen add end


//2017.5.25 ouyangzhaochun add
string gs_method,gs_tabctrlseq,gs_step,gs_purpose,gs_uoctrlseq,gs_main
w_sheet_main gw_winobj

w_control 		gw_active


end variables
global type appeontestcase_pb from application
string appname = "appeontestcase_pb"
end type
global appeontestcase_pb appeontestcase_pb

type variables
n_cst_uso101_autouo iuo_autouo1
end variables

forward prototypes
public function string of_setinstance ()
end prototypes

public function string of_setinstance ();//设置实例变量的名称

 // this.iuo_autouo1.is_str= "Create"
  
  return this.iuo_autouo1.is_str
  
 


end function

on appeontestcase_pb.create
appname="appeontestcase_pb"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on appeontestcase_pb.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Profile eon_appeoncase
string 			as_error , ls_clienttype
integer 			li_rtn
ContextInformation 		lcx_key

ls_clienttype = 	AppeonGetClientType()
if ls_clienttype = 'PB' then 
	gs_cachedir = GetCurrentDirectory( )	
	gs_dirseparator = "\"
elseif ls_clienttype = 'WEB' then 
	gs_cachedir = appeongetcachedir()+"\plugin"
	gs_dirseparator = "\"
elseif ls_clienttype = 'MOBILE' then 
	gs_cachedir = appeongetcachedir()+"/plugin"
	gs_dirseparator = "/"
end if 

//init
GetContextService ( "ContextInformation", lcx_key)
lcx_key.GetMajorVersion ( gi_major )
lcx_key.GetMinorVersion ( gi_minor )

li_rtn = GetEnvironment(ge_environment)
if not isnull(li_rtn) and li_rtn = 1 then 
	li_rtn = ge_environment.ProcessBitness 
	if li_rtn = 64 then gb_64bit = true
end if 

// Profile testcase
SQLCA.DBMS = "SNC SQL Native Client(OLE DB)"
SQLCA.LogPass ="admin"
SQLCA.ServerName = "192.0.2.254"
SQLCA.LogId = "sa"
SQLCA.AutoCommit = False
SQLCA.DBParm = "Database='appeontestcase',PBMaxTextSize=2147483647,TrimSpaces=0"

connect using sqlca;

if gf_testdb(true,as_error) = -1 then return

open(w_mdi)




end event

