$PBExportHeader$w_longtrans.srw
forward
global type w_longtrans from w_base_case
end type
type dw_2 from datawindow within w_longtrans
end type
type dw_1 from datawindow within w_longtrans
end type
end forward

global type w_longtrans from w_base_case
integer width = 2921
integer height = 1952
long il_recordfile = 0
dw_2 dw_2
dw_1 dw_1
end type
global w_longtrans w_longtrans

type variables
appeon_nvo_db_update  ieon_update

transaction itr_sql
end variables

forward prototypes
public subroutine of_testcase_point_module ()
end prototypes

public subroutine of_testcase_point_module ();string 		ls_array[], ls_item, ls_result, ls_temp, ls_temp2, ls_null
long			ll_bound, i , ll_tmp, ll_null, ll_position
string 		ls_file, ls_fullname,ls_name
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

this.event ue_init_data()
//ls_array[Upperbound(ls_array) + 1 ] = "testcasepoint_example1"			//edit you test case point name
//ls_array[Upperbound(ls_array) + 1 ] = ""
ls_array = {"001_queue","002_queue","003_queue","004_queue","005_queue","006_queue","007_queue","008_queue","009_queue","010_queue"}
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
		case "001_queue"
			ieon_update.of_StartQueue()
			dw_1.SetItem(1, 'dec_salary', 456.9)
			dw_1.update()
			commit;
			update v30_f174_1 set v_name = 'name11' where c_id = '001';
			Insert into v30_f174_1 values ('011', 'name11', '1980-11-11', 29, 'M', 1234.56);
			select v_name into :ls_name from v30_f174_1 where c_id='011';
			delete from v30_f174_1 where c_id = '010';
			commit;
			ieon_update.of_CommitQueue()		
			ls_result+= "The v_name of 011 is "+ls_name+"~r~n"
		case "002_queue"
			ieon_update.of_StartQueue()
			dw_1.SetItem(1, 'dec_salary', 2346.9)
			dw_1.update()
			commit;
			ieon_update.of_AutoCommit()	
			dw_2.SetTransObject(itr_sql)
			dw_2.SetItem(2, 'dec_salary', 2888.9)
			if dw_2.update() = 1 then	
				commit using itr_sql;
			else	
				rollback using itr_sql;
			end if
			ieon_update.of_AutoCommit()
			update v30_f174_1 set v_name = 'name22' where c_id = '002';
			if sqlca.sqlcode=0 then	
				commit;
			else	
				rollback;
			end if
			Insert into v30_f174_1 values ('012', 'name12', '1980-11-11', 29, 'M', 1234.56);
			commit;
			ieon_update.of_CommitQueue()
			select v_name into :ls_name from v30_f174_1 where c_id = '002';
			ls_result+= "The v_name of 002 is "+ls_name+"~r~n"
		case "003_queue"		
			ieon_update.of_StartQueue()
			ieon_update.of_AutoRollback()
			dw_1.SetItem(1, 'dec_salary', 239.18)
			if dw_1.update() <> 1 then	
				rollback;
			end if
			ieon_update.of_AutoRollback()
			update v30_f174_1 set v_name = 'name33' where c_id = '003';
			if sqlca.sqlcode <> 0 then	
				rollback;
			end if
			commit;
			ieon_update.of_CommitQueue()	
			select v_name into :ls_name from v30_f174_1 where c_id = '003';
			ls_result+= "The v_name of 003 is "+ls_name+"~r~n"
		case "004_queue"
			ieon_update.of_StartQueue()
			ieon_update.of_AutoCommitRollback()
			Insert into v30_f174_1 values ('014', 'name14', '1980-11-11', 29, 'M', 1234.56);
			if sqlca.sqlcode=0 then	
				commit;
			else        
				rollback;
			end if
			ieon_update.of_AutoCommitRollback()
			update v30_f174_1 set v_name = 'name44' where c_id = '004';
			if sqlca.sqlcode=0 then	
				commit;
			else        
				rollback;
			end if
			ieon_update.of_AutoCommitRollback()
			update v30_f174_1 set c_id = '001', c_sex = 'Woman' where c_id = '006' ;
			if sqlca.sqlcode = -1 then	
				rollback;
			else        
				commit;
			end if
			ieon_update.of_CommitQueue()	
			select v_name into :ls_name from v30_f174_1 where c_id = '004';
			ls_result+= "The v_name of 004 is "+ls_name+"~r~n"
		case "005_queue"
			ieon_update.of_StartQueue()
			dw_1.SetItem(1, 'dec_salary', 6843.18)
			dw_1.update()
			ieon_update.of_StartQueue()
			update v30_f174_1 set v_name = 'name55' where c_id = '005';
			Insert into v30_f174_1 values ('015', 'name15', '1980-11-11', 29, 'M', 1234.56);
			ieon_update.of_CommitQueue()
			commit;
			ieon_update.of_CommitQueue()
			select v_name into :ls_name from v30_f174_1 where c_id = '005';
			ls_result+= "The v_name of 005 is "+ls_name+"~r~n"
		case "006_queue"
			ieon_update.of_StartQueue()
			dw_1.retrieve()
			Declare thecurs cursor for select v_name from v30_f174_1;
			Open thecurs;
			ieon_update.of_CommitQueue()
			fetch thecurs into :ls_name;
			ls_result+='v_name=' + ls_name+"~r~n"
			do while SQLCA.SQLCODE = 0		
				fetch thecurs into :ls_name;
				if SQLCA.SQLCODE =  100 then exit;
				ls_result+='v_name=' + ls_name+"~r~n"
			loop
			close thecurs;			
			rollback;
		case "007_queue"
			ieon_update.of_StartQueue()	
			dw_1.SetItem(1, 'dec_salary', 9432.98)
			dw_1.update()
			commit;
			update v30_f174_1 set v_name = 'name77' where c_id = '007';
			if sqlca.sqlcode = 0 then			
				commit;	
				ieon_update.of_CommitQueue()	
			end if
			Insert into v30_f174_1 values ('017', 'name17', '1980-11-11', 29, 'M', 1234.56);
			commit;
			ieon_update.of_CommitQueue()	
			select v_name into :ls_name from v30_f174_1 where c_id = '007';
			ls_result+= "The v_name of 007 is "+ls_name+"~r~n"
		case "008_queue"
			ieon_update.of_StartQueue()
			dw_1.SetItem(1, 'dec_salary', 3159.2)
			dw_1.update()
			update v30_f174_1 set v_name = 'name88' where c_id = '008';
			if sqlca.sqlcode = 0  then		
				ieon_update.of_CommitQueue()	
				dw_1.retrieve( )
				return
			end if
			ieon_update.of_StartQueue()
			Insert into v30_f174_1 values ('018', 'name18', '1980-11-11', 29, 'M', 1234.56);
			commit;
			ieon_update.of_CommitQueue()
			ieon_update.of_CommitQueue()
			select v_name into :ls_name from v30_f174_1 where c_id = '008';
			ls_result+= "The v_name of 008 is "+ls_name+"~r~n"
		case "009_queue"
			ieon_update.of_StartQueue()
			ieon_update.of_AutoCommitRollback()
			update v30_f174_1 set v_name = 'name99' where c_id = '009';
			if sqlca.sqlcode = 0 then 
				commit;
			else
				rollback;
			end If 
			ieon_update.of_ImdCall ()
			update v30_f174_1 set i_arg = 23 where c_id = '009';
			ieon_update.of_AutoCommit ()
			if dw_1.update(true, true) = 1 then 
				commit;
			end If
			ieon_update.of_AutoRollback()
			update v30_f174_1 set v_name = 'name9A' where c_id = '009';
			if sqlca.sqlcode <> 0 then 
				rollback;
			end If
			commit;
			ieon_update.of_CommitQueue()	
			select v_name into :ls_name from v30_f174_1 where c_id = '009';
			ls_result+= "The v_name of 009 is "+ls_name+"~r~n"
		case "010_queue"
			ieon_update.of_StartQueue()
			update v30_f174_1 set v_name = 'name11' where c_id = '001';
			Insert into v30_f174_1 values ('001', 'name11', '1980-11-11', 29, 'M', 1234.56);
			ieon_update.of_CommitQueue()
			If sqlca.sqlcode = 0 then 
				commit;
			else
				rollback;
			End If 
			select v_name into :ls_name from v30_f174_1 where c_id = '001';
			ls_result+= "The v_name of 001 is "+ls_name+"~r~n"
	end choose 
next 

is_resultlog += ls_result
end subroutine

on w_longtrans.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.dw_1
end on

on w_longtrans.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.dw_1)
end on

event ue_init_data;call super::ue_init_data;delete from v30_f174_1;


INSERT INTO v30_f174_1 VALUES (
	'001',
	'name1',
	{ts '1980-01-01 00:00:00.000'},
	20,
	'M',
	1111.11);
INSERT INTO v30_f174_1 VALUES (
	'002',
	'name2',
	{ts '1980-02-01 00:00:00.000'},
	20,
	'W',
	2222.22);
INSERT INTO v30_f174_1 VALUES (
	'003',
	'name3',
	{ts '1980-03-01 00:00:00.000'},
	20,
	'W',
	3333.33);
INSERT INTO v30_f174_1 VALUES (
	'004',
	'name4',
	{ts '1980-04-01 00:00:00.000'},
	20,
	'W',
	4444.44);
INSERT INTO v30_f174_1 VALUES (
	'005',
	'name5',
	{ts '1980-05-01 00:00:00.000'},
	20,
	'M',
	5555.55);
INSERT INTO v30_f174_1 VALUES (
	'006',
	'name6',
	{ts '1980-06-01 00:00:00.000'},
	20,
	'M',
	6666.66);
INSERT INTO v30_f174_1 VALUES (
	'007',
	'name7',
	{ts '1980-07-01 00:00:00.000'},
	20,
	'W',
	7777.77);
INSERT INTO v30_f174_1 VALUES (
	'008',
	'name8',
	{ts '1980-08-01 00:00:00.000'},
	20,
	'W',
	8888.88);
INSERT INTO v30_f174_1 VALUES (
	'009',
	'name9',
	{ts '1980-09-01 00:00:00.000'},
	20,
	'M',
	9999.99);
INSERT INTO v30_f174_1 VALUES (
	'010',
	'name10',
	{ts '1980-10-01 00:00:00.000'},
	20,
	'M',
	1010.10);
	
	commit;
end event

event open;call super::open;itr_sql = create transaction

itr_sql.DBMS = "OLE DB"
itr_sql.LogPass = "admin"
itr_sql.LogId = "sa"
itr_sql.AutoCommit = false
itr_sql.DBParm = "PROVIDER='SQLOLEDB',DATASOURCE='192.0.2.254',PROVIDERSTRING='database=appeontestcase',TrimSpaces=0"


connect using itr_sql;

if itr_sql.sqlcode<> 0 then
	messagebox("Error","Itr_sql.sqlerrtext = "+itr_sql.sqlerrtext)
	return
end if

dw_2.SetTransObject(sqlca)
dw_2.Retrieve()
end event

event close;call super::close;disconnect using itr_sql;
end event

type dw_2 from datawindow within w_longtrans
integer y = 584
integer width = 1765
integer height = 468
integer taborder = 20
string title = "none"
string dataobject = "d_f174a06_2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_longtrans
integer width = 1774
integer height = 544
integer taborder = 10
string title = "none"
string dataobject = "d_f174a06_1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

