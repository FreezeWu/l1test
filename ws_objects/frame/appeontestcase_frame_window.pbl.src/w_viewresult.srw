$PBExportHeader$w_viewresult.srw
forward
global type w_viewresult from w_base
end type
type st_2 from statictext within w_viewresult
end type
type cbx_1 from checkbox within w_viewresult
end type
type cb_6 from commandbutton within w_viewresult
end type
type rb_2 from radiobutton within w_viewresult
end type
type rb_1 from radiobutton within w_viewresult
end type
type cb_5 from commandbutton within w_viewresult
end type
type sle_1 from singlelineedit within w_viewresult
end type
type st_1 from statictext within w_viewresult
end type
type cb_4 from commandbutton within w_viewresult
end type
type cb_3 from commandbutton within w_viewresult
end type
type cb_2 from commandbutton within w_viewresult
end type
type cb_1 from commandbutton within w_viewresult
end type
type dw_1 from datawindow within w_viewresult
end type
type gb_1 from groupbox within w_viewresult
end type
type gb_2 from groupbox within w_viewresult
end type
end forward

global type w_viewresult from w_base
integer width = 5294
integer height = 2660
string title = "viewresult"
windowstate windowstate = maximized!
st_2 st_2
cbx_1 cbx_1
cb_6 cb_6
rb_2 rb_2
rb_1 rb_1
cb_5 cb_5
sle_1 sle_1
st_1 st_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_viewresult w_viewresult

type variables
string is_filter
datastore ids_share
end variables

forward prototypes
public subroutine wf_setenabled ()
public subroutine wf_setflag ()
end prototypes

public subroutine wf_setenabled ();if gi_rightmode <> 3 then
	cb_4.enabled = true
end if
end subroutine

public subroutine wf_setflag ();//重新resize控件
ieon_resize.of_setflag( dw_1,"0022")

ieon_resize.of_setflag( gb_1,"2000")
ieon_resize.of_setflag( st_1,"2000")
ieon_resize.of_setflag( sle_1,"2000")
ieon_resize.of_setflag( rb_1,"2000")
ieon_resize.of_setflag( rb_2,"2000")
ieon_resize.of_setflag( cb_5,"2000")

ieon_resize.of_setflag( gb_2,"2002")
ieon_resize.of_setflag( cb_1,"2100")
ieon_resize.of_setflag( Cb_2,"2100")
ieon_resize.of_setflag( cb_3,"2100")
ieon_resize.of_setflag( cb_4,"2100")
ieon_resize.of_setflag( cb_6,"2100")
ieon_resize.of_setflag( st_2,"2100")
ieon_resize.of_setflag( cbx_1,"2100")



end subroutine

on w_viewresult.create
int iCurrent
call super::create
this.st_2=create st_2
this.cbx_1=create cbx_1
this.cb_6=create cb_6
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_5=create cb_5
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.cbx_1
this.Control[iCurrent+3]=this.cb_6
this.Control[iCurrent+4]=this.rb_2
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.cb_5
this.Control[iCurrent+7]=this.sle_1
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.cb_4
this.Control[iCurrent+10]=this.cb_3
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.dw_1
this.Control[iCurrent+14]=this.gb_1
this.Control[iCurrent+15]=this.gb_2
end on

on w_viewresult.destroy
call super::destroy
destroy(this.st_2)
destroy(this.cbx_1)
destroy(this.cb_6)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_5)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;string ls_filter
string ls_flag,ls_testcaseid,ls_file,ls_temp1,ls_temp2,ls_temp3
long ll_file,ll_row,ll_pos1,ll_pos2
ids_share = create datastore
ids_share.dataobject = "d_testcase_result_bak"
ids_share.settransobject(sqlca)
ids_share.retrieve()
 
 ls_filter = message.stringparm
 
 ls_flag = right(ls_filter,1)
 is_filter = left(ls_filter,len(ls_filter) - 1)
 
 ids_share.setfilter( is_filter)
 ids_share.filter( )
 if ls_flag = '1' then

else
	ll_file = fileopen("testresult.log",textmode!,read!,shared!)
	filereadex(ll_file,ls_file)
	for ll_row = 1 to dw_1.rowcount( )
		ls_testcaseid = dw_1.getitemstring(ll_row,'testcaseid')
		ls_temp1 = "begin testcase"+ls_testcaseid+":"
		ls_temp2 = "end testcase"+ls_testcaseid
		ll_pos1 = pos(ls_file,ls_temp1)+len(ls_temp1)
		ll_pos2 = pos(ls_file,ls_temp2)
		ls_temp3 = mid(ls_file,ll_pos1,ll_pos2 - ll_pos1 )
		ids_share.setitem(ll_row,'realvalue',ls_temp3)
	next
	fileclose(ll_file)
end if

cbx_1.triggerevent( clicked!)
end event

type st_2 from statictext within w_viewresult
integer x = 4503
integer y = 904
integer width = 672
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "开启或关闭自动行高"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_viewresult
integer x = 4594
integer y = 1004
integer width = 485
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
string text = "AutoHeight"
end type

event clicked;if this.checked then
	dw_1.dataobject = "d_testcase_result"
else
	dw_1.dataobject = "d_testcase_result_bak"
end if
dw_1.settransobject(sqlca)
ids_share.sharedata(dw_1)
end event

type cb_6 from commandbutton within w_viewresult
integer x = 4576
integer y = 1812
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Compare"
end type

event clicked;string ls_exp,ls_real,ls_expfile,ls_realfile
long ll_exp,ll_real,ll_row
string ls_run,ls_tmp1,ls_tmp2,ls_path
string ls_testcaseid,ls_win

if appeongetclienttype() = "PB" then
	ls_path = getcurrentdirectory()
else
	ls_path = appeongetcachedir()
end if

ls_expfile = ls_path+"\exp.txt"
ls_realfile = ls_path+"\real.txt"

for ll_row = 1 to dw_1.rowcount( )
	ls_testcaseid = dw_1.getitemstring(ll_row,"testcaseid")
	ls_tmp1 = dw_1.getitemstring(ll_row,"expectvalue")
	if isnull(ls_tmp1) then
		ls_tmp1 = ''
	end if
	ls_tmp2 = dw_1.getitemstring(ll_row,"realvalue")
	if isnull(ls_tmp2) then
		ls_tmp2 = ''
	end if
	ls_exp +="TestPointid:"+string(ls_testcaseid) +"~r~n"+ls_tmp1+"~r~n"
	ls_real +="TestPointid:"+string(ls_testcaseid) +"~r~n"+ls_tmp2+"~r~n"
next

if fileexists(ls_expfile) then
	filedelete(ls_expfile)
end if
if fileexists(ls_realfile) then
	filedelete(ls_realfile)
end if

ll_real = fileopen(ls_realfile,textmode!,write!,shared!)
ll_exp = fileopen(ls_expfile,textmode!,write!,shared!)

filewriteex(ll_real,ls_real)
filewriteex(ll_exp,ls_exp)

fileclose(ll_real)
fileclose(ll_exp)
if appeongetclienttype() <> 'MOBILE' then
	ls_run = "C:\Program Files\Beyond~~1"
	run("~""+ls_run+"\BCompare.exe~" "+"~""+ls_expfile+"~" "+"~""+ls_realfile+"~"")
end if
end event

type rb_2 from radiobutton within w_viewresult
integer x = 4850
integer y = 428
integer width = 242
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter"
end type

type rb_1 from radiobutton within w_viewresult
integer x = 4535
integer y = 428
integer width = 288
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Find"
boolean checked = true
end type

type cb_5 from commandbutton within w_viewresult
integer x = 4567
integer y = 572
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Execute"
end type

event clicked;string ls_filter
long ll_row

//modified by zhoujunwei at 2017-11-29 加入重新过滤出所有数据的情况
if sle_1.text = "" then
	ls_filter = ""
else
	ls_filter = "testcaseid = '"+sle_1.text+"' or testcasename like '%"+sle_1.text+"%'"
end if

if rb_1.checked then
	ll_row = dw_1.find( ls_filter, 1, dw_1.rowcount())
	if ll_row > 0 then
		dw_1.scrolltorow( ll_row)
		dw_1.selectrow( 0, false)
		dw_1.selectrow(ll_row,true)
	else
		dw_1.selectrow( 0, false)
	end if
else
	dw_1.setfilter( ls_filter)
	dw_1.filter( )
end if
end event

type sle_1 from singlelineedit within w_viewresult
integer x = 4485
integer y = 272
integer width = 704
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_viewresult
integer x = 4466
integer y = 144
integer width = 722
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Testcase Name OR ID"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_viewresult
integer x = 4576
integer y = 1248
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Updateexp"
end type

event clicked;//
string ls_real,ls_testcasename
long ll_row

ll_row = dw_1.getrow( )

if ll_row = 0 then return 

ls_real = dw_1.getitemstring(ll_row,'realvalue')
ls_testcasename = dw_1.getitemstring(ll_row,'testcasename')

if messagebox("Question","Are you sure to update the expectvalue of "+ls_testcasename+" ?",question!,yesno!,1) = 1 then
	dw_1.setitem(ll_row,'expectvalue',ls_real)
	
	if dw_1.update( ) = 1 then
		commit;
		messagebox("Success","Update expectvalue Success")
	else
		messagebox("Failed","Update expectvalue Failed : "+sqlca.sqlerrtext)
		rollback;
	end if
end if

end event

type cb_3 from commandbutton within w_viewresult
integer x = 4576
integer y = 2352
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;close(parent)
end event

type cb_2 from commandbutton within w_viewresult
integer x = 4576
integer y = 2076
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Export"
end type

event clicked;dw_1.saveas()
end event

type cb_1 from commandbutton within w_viewresult
integer x = 4576
integer y = 1536
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ShowError"
end type

event clicked;string ls_filter

if lower(this.text) = "showerror" then
	if len(is_filter) > 2 then
		ls_filter = is_filter+" and compute_1 = 'Failed'"
	else
		ls_filter = "compute_1 = 'Failed'"
	end if
	
	dw_1.setfilter( ls_filter)
	dw_1.filter( )
	this.text = "ShowAll"
else
	dw_1.setfilter( is_filter)
	dw_1.filter( )
	this.text = "ShowError"
end if
end event

type dw_1 from datawindow within w_viewresult
integer y = 8
integer width = 4393
integer height = 2540
integer taborder = 10
string title = "none"
string dataobject = "d_testcase_result"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;//
str_testcase_result  lstr_1

if row = 0 then return 

lstr_1.s_exp = this.getitemstring(row,'expectvalue')
lstr_1.s_real = this.getitemstring(row,'realvalue')

openwithparm(w_viewresult_detail,lstr_1)

end event

type gb_1 from groupbox within w_viewresult
integer x = 4425
integer y = 4
integer width = 814
integer height = 756
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Find"
end type

type gb_2 from groupbox within w_viewresult
integer x = 4425
integer y = 764
integer width = 814
integer height = 1780
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operate"
end type

