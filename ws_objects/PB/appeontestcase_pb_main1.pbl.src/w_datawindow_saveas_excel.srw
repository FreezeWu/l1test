$PBExportHeader$w_datawindow_saveas_excel.srw
forward
global type w_datawindow_saveas_excel from w_base
end type
type dw_1 from datawindow within w_datawindow_saveas_excel
end type
type cb_1 from commandbutton within w_datawindow_saveas_excel
end type
end forward

global type w_datawindow_saveas_excel from w_base
dw_1 dw_1
cb_1 cb_1
end type
global w_datawindow_saveas_excel w_datawindow_saveas_excel

forward prototypes
public function string wf_dwsaveasexcel2007 (string as_filename, integer ai_type, boolean abn_header)
public subroutine wf_dwchangedataobejct (string as_dataobject)
public function string wf_sync_saveas2007 (string as_title)
end prototypes

public function string wf_dwsaveasexcel2007 (string as_filename, integer ai_type, boolean abn_header);
string 	ls_path, ls_file
integer	li_return
String		ls_result 

ls_result = ''
ls_path =  GetCurrentDirectory( )
//messagebox("ls_path",ls_path)

//ls_file = ls_path+'\textexecl1.xlsx'
ls_file = ls_path+'\'+as_filename
if FileExists ( ls_file ) then FileDelete ( ls_file )

choose case ai_type
	case 1
		li_return = dw_1.saveas( ls_file,XLSX!,abn_header )
	case 2 
		li_return = dw_1.saveas( ls_file,XLSB!,abn_header )	
end choose 

if not isnull(li_return) and  li_return = 1  then 
	ls_result +=  "  Datawindow.saveas("+as_filename+") = "+ String ( "Success!" ) +"~r~n"
	if FileExists ( ls_file ) then 
		ls_result +=  "  The saveas("+as_filename+") exists = "+ String ( "Success!" ) +"~r~n"
		FileDelete ( ls_file )
	else
		ls_result +=  "  The saveas("+as_filename+") exists = "+ String ( "Fail!" ) +"~r~n"
	end if 
else
	ls_result +=  "  Datawindow.saveas("+as_filename+") = "+ String ( "Fail!" ) +"~r~n"
end if 


return ls_result
end function

public subroutine wf_dwchangedataobejct (string as_dataobject);dw_1.Dataobject=as_dataobject
dw_1.settransobject(sqlca)
dw_1.retrieve()

end subroutine

public function string wf_sync_saveas2007 (string as_title);integer	 i 
String		ls_result, ls_return 

ls_result = ''

for i = 1 to 4 
	choose case i 
		case 1 
			ls_return = wf_dwsaveasexcel2007( as_title+string(i)+'.xlsx', 1, false)
		case 2 
			ls_return = wf_dwsaveasexcel2007( as_title+string(i)+'.xlsx', 1, true)
		case 3 
			ls_return = wf_dwsaveasexcel2007( as_title+string(i)+'.xlsb', 2, false)
		case 4 
			ls_return = wf_dwsaveasexcel2007( as_title+string(i)+'.xlsb', 2, true)
	end choose 

	ls_result  +=ls_return
next 

return ls_result
end function

on w_datawindow_saveas_excel.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
end on

on w_datawindow_saveas_excel.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
end on

event ue_execute;call super::ue_execute;choose case as_testcasename 
	case 'excel_dw_saveas'
		cb_1.triggerevent( clicked!)
end choose

close(this)


end event

type dw_1 from datawindow within w_datawindow_saveas_excel
integer x = 681
integer width = 1961
integer height = 1524
integer taborder = 10
string title = "none"
string dataobject = "d_dwexample_group"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve( )
end event

type cb_1 from commandbutton within w_datawindow_saveas_excel
integer x = 69
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
string text = "excel 12"
end type

event clicked;string 	ls_path, ls_file
integer	li_return, i 
String		ls_result, ls_return 

ls_result = ''

ls_return = parent.wf_sync_saveas2007( 'dwsaveasexcel2007test')
ls_result  +=ls_return

//graph 
wf_dwchangedataobejct( 'd_products_line')
ls_return = parent.wf_sync_saveas2007( 'graphsaveasexcel2007linetest')
ls_result  +=ls_return

wf_dwchangedataobejct( 'd_products_pie3d_graph')
ls_return = parent.wf_sync_saveas2007( 'graphsaveasexcel2007graphtest')
ls_result  +=ls_return
 
wf_dwchangedataobejct( 'd_products_pie3d_graph2')
ls_return = parent.wf_sync_saveas2007( 'graphsaveasexcel2007graph2test')
ls_result  +=ls_return


gf_returnresult(ls_result)


end event

