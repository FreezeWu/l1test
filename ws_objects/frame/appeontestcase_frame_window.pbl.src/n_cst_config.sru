$PBExportHeader$n_cst_config.sru
forward
global type n_cst_config from nonvisualobject
end type
end forward

global type n_cst_config from nonvisualobject autoinstantiate
end type

type variables
// Profile
string  is_Profile = "config.ini"

// Case database
constant string EN_SQL2000 = "EN_SQL2000"
constant string EN_ORA9I   = "EN_ORA9I"
constant string EN_ASE1253 = "EN_ASE1253"
constant string EN_ASA80   = "EN_ASA80"
constant string JP_SQL2000 = "JP_SQL2000"
constant string JP_ORA9I   = "JP_ORA9I"
constant string JP_ASE1253 = "JP_ASE1252"
constant string JP_ASA80   = "JP_ASA80"

// Transaction properties
string  Database
string  DBMS
string  ServerName
string  LogPass
string  LogID
string  DBParm
string  DBPass
string  Lock
string  UserID
boolean AutoCommit

// CacheName and ODBCDSN
string  CacheName
string  ODBCDSN

// Application path
string  is_ApplicationPath

// COTPBAutoRun
boolean ib_COTPBAutoRun = false
end variables

forward prototypes
public function integer of_getdbinfo (string as_database)
public function integer of_connect (ref transaction atr_transobject, string as_database)
public function string of_getapppath ()
public subroutine of_initproperty ()
public function integer of_settransproperty (transaction atr_transobject)
public function integer of_connectex (ref transaction atr_transobject, string as_database, string as_flags)
public function boolean of_iscotpbautorun ()
public function integer of_getcotvalidate (transaction atr_cotdb, ref boolean ab_saveresult, ref boolean ab_updateexpvalue)
public function string of_keycode (string as_key, string as_type)
public function boolean of_createfile (string as_filename, string as_text)
public function boolean of_createfile (string as_filename, transaction at_trans)
end prototypes

public function integer of_getdbinfo (string as_database);//====================================================================
// Function: of_getdbinfo()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments:  String    as_database
//--------------------------------------------------------------------
// Returns:    Integer
//--------------------------------------------------------------------
// Author: 	Caifangpeng		Date: 2005/11/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string ls_AutoCommit

// Get transaction properties
Database      = ProfileString(is_Profile, as_Database, "Database",   "")
DBMS          = ProfileString(is_Profile, as_Database, "DBMS",       "")
ServerName    = ProfileString(is_Profile, as_Database, "ServerName", "")
LogPass       = ProfileString(is_Profile, as_Database, "LogPass",    "")
LogID         = ProfileString(is_Profile, as_Database, "LogID",      "")
DBParm        = ProfileString(is_Profile, as_Database, "DBParm",     "")
DBPass        = ProfileString(is_Profile, as_Database, "DBPass",     "")
Lock          = ProfileString(is_Profile, as_Database, "Lock",       "")
UserID        = ProfileString(is_Profile, as_Database, "UserID",     "")
ls_AutoCommit = ProfileString(is_Profile, as_Database, "AutoCommit", "")

if ls_AutoCommit="true" then
	AutoCommit = true
else
	AutoCommit = false
end if

// Get CacheName and ODBCDSN
ODBCDSN   = ProfileString(is_Profile, as_Database, "ODBCDSN", "")
CacheName = ProfileString(is_Profile, as_Database, "CacheName", "")

Return 1
end function

public function integer of_connect (ref transaction atr_transobject, string as_database);//====================================================================
// Function: of_connect()
//--------------------------------------------------------------------
// Description: Connect database
//--------------------------------------------------------------------
// Arguments:  Transaction    atr_transobject
//					String   		as_database
//--------------------------------------------------------------------
// Returns:    Integer
//--------------------------------------------------------------------
// Author: 	Caifangpeng		Date: 2005/11/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
if IsValid(atr_TransObject) then
	Disconnect using atr_TransObject;
else
	atr_TransObject = Create Transaction	
end if

of_GetDBInfo(as_Database)
of_SetTransProperty(atr_TransObject)

if CacheName<>"" then
	if DBParm="" then
		atr_TransObject.DBParm = "CacheName='" + CacheName + "'"
	else
		atr_TransObject.DBParm += ",CacheName='" + CacheName + "'"
	end if
end if

Connect using atr_TransObject;

Return atr_TransObject.SQLCode
end function

public function string of_getapppath ();//====================================================================
// Function: of_getapppath()
//--------------------------------------------------------------------
// Description: Get File Path
//--------------------------------------------------------------------
// Arguments:  (N/A)
//--------------------------------------------------------------------
// Returns:    String
//--------------------------------------------------------------------
// Author: 	Caifangpeng		Date: 2005/11/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
is_ApplicationPath = ProfileString(is_Profile, "PATH", "ApplicationPath", "")

Return is_ApplicationPath
end function

public subroutine of_initproperty ();//====================================================================
// Function: of_initproperty()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments:  (N/A)
//--------------------------------------------------------------------
// Returns:    (None)
//--------------------------------------------------------------------
// Author: 	Caifangpeng		Date: 2005/11/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
Database = ""
DBMS = ""
ServerName = ""
LogPass = ""
LogID = ""
DBParm = ""
DBPass = ""
Lock = ""
UserID = ""
AutoCommit = false

CacheName = ""
ODBCDSN = ""

is_ApplicationPath = ""
end subroutine

public function integer of_settransproperty (transaction atr_transobject);//====================================================================
// Function: of_settransproperty()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments:  transaction   atr_transobject
//--------------------------------------------------------------------
// Returns:    integer
//--------------------------------------------------------------------
// Author: 	Caifangpeng		Date: 2005/11/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================

if Database<>""   then atr_TransObject.Database   = Database
if DBMS<>""       then atr_TransObject.DBMS       = DBMS
if ServerName<>"" then atr_TransObject.ServerName = ServerName
if LogPass<>""    then atr_TransObject.LogPass    = LogPass
if LogID<>""      then atr_TransObject.LogID      = LogID
if DBParm<>""     then atr_TransObject.DBParm     = DBParm
if DBPass<>""     then atr_TransObject.DBPass     = DBPass
if Lock<>""       then atr_TransObject.Lock       = Lock
if UserID<>""     then atr_TransObject.UserID     = UserID
atr_TransObject.AutoCommit = AutoCommit

Return 1
end function

public function integer of_connectex (ref transaction atr_transobject, string as_database, string as_flags);//====================================================================
// Function: of_connectex()
//--------------------------------------------------------------------
// Description: Connect database
//--------------------------------------------------------------------
// Arguments:  Transaction    atr_transobject
//					String   		as_database
//					String			as_flags
//--------------------------------------------------------------------
// Returns:    Integer
//--------------------------------------------------------------------
// Author: 	Caifangpeng		Date: 2005/11/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
as_Flags = Upper(as_Flags)

// Connection default database
if as_Flags="DEFAULT" then
   Return of_Connect(atr_TransObject, as_Database)
end if

// Create transaction if invalidation
if IsValid(atr_TransObject) then
	Disconnect using atr_TransObject;
else
	atr_TransObject = Create Transaction
end if

// Connection database with different drives
of_GetDBInfo(as_Database)
choose case as_Flags
	case "OLE DB"
		atr_TransObject.DBMS    = "OLE DB"
		atr_TransObject.LogPass = LogPass
		atr_TransObject.LogId   = LogId
		atr_TransObject.AutoCommit = AutoCommit
		atr_TransObject.DBParm = "PROVIDER='SQLOLEDB',DATASOURCE='" + ServerName + "',PROVIDERSTRING='database=" + Database + "'"
	case "ODBC"
		atr_TransObject.DBMS = "ODBC"
		atr_TransObject.AutoCommit = AutoCommit
		if Pos(DBParm, ODBCDSN)>0 then
			atr_TransObject.DBParm = DBParm
		else
			atr_TransObject.DBParm = "ConnectString='DSN=" + ODBCDSN + ";UID=" + LogId + ";PWD=" + LogPass + "'"
		end if
	case else
		Return -2
end choose

// Set cache name
if CacheName<>"" then
	if atr_TransObject.DBParm="" then
		atr_TransObject.DBParm = "CacheName='" + CacheName + "'"
	else
		atr_TransObject.DBParm += ",CacheName='" + CacheName + "'"
	end if
end if
Connect using atr_TransObject;

Return atr_TransObject.SQLCode
end function

public function boolean of_iscotpbautorun ();//====================================================================
// Function: of_iscotpbautorun()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments:  (N/A)
//--------------------------------------------------------------------
// Returns:    boolean
//--------------------------------------------------------------------
// Author: 	Caifangpeng		Date: 2005/11/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string ls_COTPBAutoRun

ls_COTPBAutoRun = ProfileString(is_Profile, "COTPBAutoRun", "AutoRun", "")
if Upper(ls_COTPBAutoRun)="TRUE" then
	ib_COTPBAutoRun = true
else
	ib_COTPBAutoRun = false
end if

Return ib_COTPBAutoRun
end function

public function integer of_getcotvalidate (transaction atr_cotdb, ref boolean ab_saveresult, ref boolean ab_updateexpvalue);//====================================================================
// Function: of_getcotvalidate()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments:  Transaction    atr_cotdb
//					boolean   		ab_saveresult
//					boolean			ab_updateexpvalue
//--------------------------------------------------------------------
// Returns:    Integer
//--------------------------------------------------------------------
// Author: 	Caifangpeng		Date: 2005/11/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string ls_UserName,ls_Password,ls_Upower,ls_SResult,ls_DBPassword

ab_SaveResult = false
ab_UpdateExpValue = false
if not IsValid(atr_COTDB) then Return -1

ls_UserName = Lower(ProfileString(is_Profile, "COTValidate", "UserName", ""))
ls_Password = ProfileString(is_Profile, "COTValidate", "Password", "")
if IsNull(ls_UserName) then ls_UserName = ""
if IsNull(ls_Password) then ls_Password = ""
if ls_UserName="" then	Return -1

SELECT Passwd, Is_Upower, Is_SResult 
INTO  :ls_DBPassword, :ls_Upower, :ls_SResult
FROM  TUser
WHERE Lower(LoginName) = :ls_UserName using atr_COTDB;
if IsNull(ls_DBPassword) then ls_DBPassword = ""
if IsNull(ls_SResult) then ls_SResult = ""
if IsNull(ls_Upower) then ls_Upower = ""

if atr_COTDB.SQLCode=100 then Return -1
ls_Password = of_KeyCode(ls_Password, "1")
if ls_Password<>ls_DBPassword then Return -1
if Upper(ls_SResult)="T" then ab_SaveResult = true
if Upper(ls_Upower)="T" then ab_UpdateExpValue = true

if ab_SaveResult or ab_UpdateExpValue then 
	Return 1
else
	Return -1
end if
end function

public function string of_keycode (string as_key, string as_type);//====================================================================
// Function: of_keycode()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments:  String   as_key
//					String	as_type
//--------------------------------------------------------------------
// Returns:    string
//--------------------------------------------------------------------
// Author: 	Caifangpeng		Date: 2005/11/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
string  ls_key,ls_word
integer li_i,li_j,li_len


li_len = len(as_key)
If as_type = '1' Then
	for li_i = li_len to 1 step -1
		ls_word = mid(as_key,li_i,1)
		ls_key += String(char(ASC(ls_word) + li_i))
		as_key = mid(as_key,1,li_i - 1)
	next	
End If

return ls_key
end function

public function boolean of_createfile (string as_filename, string as_text);//====================================================================
// Function: of_createfile()
//--------------------------------------------------------------------
// Description: Write Text File
//--------------------------------------------------------------------
// Arguments:  String   as_filename
//					String   as_text
//--------------------------------------------------------------------
// Returns:    Boolean
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/11/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
integer li_FileNum

if FileLength(as_text) > 32765 then return false
if FileExists(as_filename) then FileDelete(as_Filename)


li_FileNum = FileOpen(as_filename,LineMode!,Write!,LockWrite!,Append!)
IF FileWrite(li_FileNum,as_text) < 0 then Return False
FileClose(li_FileNum)

return true
end function

public function boolean of_createfile (string as_filename, transaction at_trans);//====================================================================
// Function: of_createfile()
//--------------------------------------------------------------------
// Description: Write Text File
//--------------------------------------------------------------------
// Arguments:  String   		as_filename
//					Transaction    at_trans
//--------------------------------------------------------------------
// Returns:    Boolean
//--------------------------------------------------------------------
// Author: 	zhouchaoqun		Date: 2005/11/28
//--------------------------------------------------------------------
// CopyRight 2003----???? Appeon Inc.
//====================================================================
integer li_FileNum,li_Writes,li_Cnt
blob    lb_blob,lblb_Data
string  ls_name
long    ll_BlobLen,ll_CurrentPos

if FileExists(as_filename) then
	FileDelete(as_Filename)
end if

//Get File Name
if pos(as_filename,'\') > 0 then	
	ls_name = mid(as_filename,lastpos(as_filename,'\') + 1)
else
	ls_name = as_filename
end if

//Get File
selectblob fileres into :lb_blob from caseresfile where filename = :ls_name using at_trans;
if at_trans.sqlcode <> 0 then return false

//Write File
li_FileNum = FileOpen(as_filename,StreamMode!,Write!,LockReadWrite!, Append!)
If li_FileNum < 0 Then Return False
ll_BlobLen = len(lb_blob) 

// Determine the number of writes required to write the entire blob
If ll_BlobLen > 32765 Then
	 If Mod(ll_BlobLen, 32765) = 0 Then
		 li_Writes = ll_BlobLen / 32765
	 Else
		 li_Writes = (ll_BlobLen / 32765) + 1
	 End if
Else
 	li_Writes = 1
End if 

ll_CurrentPos = 1 
For li_Cnt = 1 To li_Writes
    lblb_Data = BlobMid(lb_blob, ll_CurrentPos, 32765)
    ll_CurrentPos += 32765
	 
	 If FileWrite(li_FileNum, lblb_Data) = -1 Then
		 Return False
	 End if
Next

FileClose(li_FileNum)
return true
end function

on n_cst_config.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_config.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

