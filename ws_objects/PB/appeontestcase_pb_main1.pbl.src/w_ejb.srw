$PBExportHeader$w_ejb.srw
forward
global type w_ejb from w_base
end type
type cb_1 from commandbutton within w_ejb
end type
end forward

global type w_ejb from w_base
cb_1 cb_1
end type
global w_ejb w_ejb

on w_ejb.create
int iCurrent
call super::create
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
end on

on w_ejb.destroy
call super::destroy
destroy(this.cb_1)
end on

event ue_execute;call super::ue_execute;choose case as_testcasename 
	case 'EJB_client_connection'
		cb_1.triggerevent( clicked!)
end choose

close(this)


end event

type cb_1 from commandbutton within w_ejb
integer x = 114
integer y = 56
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "execute ejb"
end type

event clicked;//Classpath
//C:\EJB\pbejbclient126.jar;%JDK%\jre\lib\rt.jar;C:\EJB\Calc.jar;C:\EJB\wlfullclient.jar;
//
//path
//%JDK%\bin;%JDK%\jre\bin\classic;C:\Oracle\Middleware\jdk160_29\bin;
//
//need yourselft to set the JDK path...

//set path
string 	ls_envpath, ls_array[], ls_array2[], ls_newenv, ls_temppath
integer	li_return
n_string		ln_string
string 	classpath, ls_path
int li_rtn

string 	ls_result = ''
javavm 					g_jvm
ejbconnection 			g_EJBConn


ls_path =  GetCurrentDirectory( )
classpath =ls_path+'\PB\wlfullclient.jar'

ls_newenv = ''
ln_string = create n_string
li_return = RegistryGet(  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment",  "Classpath", ls_envpath)

if isnull(ls_envpath) then ls_envpath = ''
ln_string.of_parsetoarray( lower(ls_envpath), ';', ls_array)

ls_temppath = ls_path + '\PB\pbejbclient170.jar'
if ls_envpath = '' or not ln_string.of_isexists(ls_array, lower(ls_temppath)) then
	ls_newenv += ls_temppath+'; '
end if 

ls_temppath = '%JDK%\jre\lib\rt.jar'
if ls_envpath = '' or not ln_string.of_isexists(ls_array, lower(ls_temppath)) then
	ls_newenv += ls_temppath+'; '
end if 

ls_temppath = ls_path+'\PB\Calc.jar'
if ls_envpath = '' or not ln_string.of_isexists(ls_array, lower(ls_temppath)) then
	ls_newenv += ls_temppath+'; '
end if 

ls_temppath = ls_path+'\PB\wlfullclient.jar'
if ls_envpath = '' or not ln_string.of_isexists(ls_array, lower(ls_temppath)) then
	ls_newenv += ls_temppath+'; '
end if 

if left(ls_envpath,2) <>'.;' then ls_envpath = '.;'+ls_envpath
if right(trim(ls_envpath),1) <> ';' then ls_envpath = ls_envpath+';'
if ls_newenv <> "" then
	li_return = RegistrySet(  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment",   "Classpath", RegString!, ls_envpath+ls_newenv)
	if li_return <> 1 then 
		//ls_result += " RegistrySet Classpath Environment "+string(li_return)+" path: error = "+ String ( "Fail!" ) +"~r~n"	//因路径经常变化，请手工注册
	end if 
end if 
 
ls_envpath = '' 
ls_newenv = ''
li_return = RegistryGet(  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment",  "Path", ls_envpath)
if isnull(ls_envpath) then ls_envpath = ''
ln_string.of_parsetoarray( lower(ls_envpath), ';', ls_array2)

ls_temppath = '%JDK%\bin'
if ls_envpath = '' or  not ln_string.of_isexists(ls_array2, lower(ls_temppath)) then
	ls_newenv += ls_temppath+'; '
end if 

ls_temppath = '%JDK%\jre\bin\classic'
if ls_envpath = '' or  not ln_string.of_isexists(ls_array2, lower(ls_temppath)) then
	ls_newenv += ls_temppath+'; '
end if 

if right(trim(ls_envpath),1) <> ';' then ls_envpath = ls_envpath+';'
if ls_newenv <> "" then
	li_return = RegistrySet(  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment",   "Path", RegString!, ls_envpath+ls_newenv)
	if li_return <> 1 then 
		//ls_result += " RegistrySet Path Environment "+string(li_return)+" path: error = "+ String ( "Fail!" ) +"~r~n"	//因路径经常变化，请手工注册
	end if 
end if 

destroy ln_string

//ls_path =  GetCurrentDirectory( )
//classpath =ls_path+'\wlfullclient.jar'
//javam create
g_jvm = create javavm   
li_rtn = g_jvm.createjavavm(classpath, true)

choose case li_rtn
	case 0, 1
		ls_result += " createjavavm = "+ String ( "Success!" ) +"~r~n"
	case -1
		ls_result += " Failed to load JavaVM = "+ String ( "Fail!" ) +"~r~n"
	case -2
		ls_result += " Failed to load EJBLocator = "+ String ( "Fail!" ) +"~r~n"
	case else
		ls_result += " createjavavm "+string(li_rtn)+"= "+ String ( "Fail!" ) +"~r~n"
end choose


string ls_props[]
g_EJBConn = CREATE EJBConnection

// set initial context properties
//ls_props[1] = "javax.naming.Context.INITIAL_CONTEXT_FACTORY=weblogic.jndi.WLInitialContextFactory"
//ls_props[2] = "javax.naming.Context.PROVIDER_URL=t3://192.0.3.36:7001"
//ls_props[3] = "javax.naming.Context.SECURITY_PRINCIPAL=weblogic"
//ls_props[4] = "javax.naming.Context.SECURITY_CREDENTIALS=weblogic123"

ls_props[1] = "javax.naming.Context.INITIAL_CONTEXT_FACTORY="+ profilestring("database.ini","EJB_client","INITIAL_CONTEXT_FACTORY","weblogic.jndi.WLInitialContextFactory")
ls_props[2] = "javax.naming.Context.PROVIDER_URL="+ profilestring("database.ini","EJB_client","PROVIDER_URL","t3://192.0.1.74:7001")
ls_props[3] = "javax.naming.Context.SECURITY_PRINCIPAL="+ profilestring("database.ini","EJB_client","SECURITY_PRINCIPAL","weblogic")
ls_props[4] = "javax.naming.Context.SECURITY_CREDENTIALS="+ profilestring("database.ini","EJB_client","SECURITY_CREDENTIALS","appeon123")

try
	// connect to EJB server
	g_EJBConn.connectToServer(ls_props)

catch(exception e)
//	messagebox('exception', e.getmessage())
	ls_result += " connectToServer error = "+e.getmessage()+" = "+ String ( "Fail!" ) +"~r~n"
	//modified by zhoujunwei at 2017-11-28
	//连接server异常以后，不再往下执行
	return
end try


if not isvalid(g_EJBConn) then
//	messagebox('', 'invalid')
	ls_result += " connectToServer = "+ String ( "Fail!" ) +"~r~n"
else
//	messagebox('', 'valid')
	ls_result += " connectToServer = "+ String ( "Success!" ) +"~r~n"
end if


//
unsignedlong ul_val
unsignedlong ll_rtn
ul_val = 20000

calchome homeobj 
calc beanobj

try
	homeobj = g_EJBConn.lookup("calchome", 'Calc', "mytest.CalcHome")

catch(exception ex)
//	messagebox('exception', ex.getmessage())
	ls_result += " g_EJBConn.lookup error = "+ex.getmessage()+" = "+ String ( "Fail!" ) +"~r~n"
end try

ls_result += "  g_EJBConn.lookup = "+ String ( "Success!" ) +"~r~n"

try
	beanobj = homeobj.create()
catch (remoteexception re)
//	messagebox('remote exception', re.getmessage())
	ls_result += " homeobj.create() remote exception error = "+re.getmessage()+" "+ String ( "Fail!" ) +"~r~n"
catch (createexception ce)
//	messagebox('create exception', ce.getmessage())
	ls_result += " homeobj.create() create exception error = "+ce.getmessage()+" "+ String ( "Fail!" ) +"~r~n"
catch (Exception ecr)
	ls_result += " homeobj.create()  exception error = "+ecr.getmessage()+" "+ String ( "Fail!" ) +"~r~n"
catch (Throwable t)
	ls_result += " homeobj.create()  Throwable error = "+t.getmessage()+" "+ String ( "Fail!" ) +"~r~n"
FINALLY
	if not isvalid(beanobj) then 
		ls_result += " homeobj.create()  error = " + String ( "Fail!" ) +"~r~n"
		gf_returnresult(ls_result)
		Return
	end if 
end try

ls_result += " homeobj.create()  = "+ String ( "Success!" ) +"~r~n"

try

ll_rtn = beanobj.getULong(ul_val)

catch (remoteexception re2)
//	messagebox('remote exception', re2.getmessage())
	ls_result += " beanobj.getULong(ul_val) remoteexception error = "+re2.getmessage()+" "+ String ( "Fail!" ) +"~r~n"
catch (createexception ce2)
//	messagebox('create exception', ce2.getmessage())
	ls_result += " beanobj.getULong(ul_val) createexception error = "+ce2.getmessage()+" "+ String ( "Fail!" ) +"~r~n"
catch (Exception eg)
	ls_result +=  " beanobj.getULong(ul_val) createexception error = "+eg.getmessage()+" "+ String ( "Fail!" ) +"~r~n"
catch (Throwable tu)
		ls_result +=  " beanobj.getULong(ul_val) createexception error = "+tu.getmessage()+" "+ String ( "Fail!" ) +"~r~n"
FINALLY
	if isnull(ll_rtn) then 
		ls_result += " beanobj.getULong  error = " + String ( "Fail!" ) +"~r~n"
		gf_returnresult(ls_result)
		Return
	end if 
end try

ls_result += " beanobj.getULong(ul_val)  = "+ String ( "Success!" ) +"~r~n"

gf_returnresult(ls_result)

end event

