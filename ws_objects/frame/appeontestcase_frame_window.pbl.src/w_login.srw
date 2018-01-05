$PBExportHeader$w_login.srw
forward
global type w_login from window
end type
type cb_2 from commandbutton within w_login
end type
type cb_1 from commandbutton within w_login
end type
type cbx_1 from checkbox within w_login
end type
type sle_2 from singlelineedit within w_login
end type
type sle_1 from singlelineedit within w_login
end type
type st_2 from statictext within w_login
end type
type st_1 from statictext within w_login
end type
type gb_1 from groupbox within w_login
end type
end forward

global type w_login from window
integer width = 1934
integer height = 1108
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
cbx_1 cbx_1
sle_2 sle_2
sle_1 sle_1
st_2 st_2
st_1 st_1
gb_1 gb_1
end type
global w_login w_login

type variables
string is_ini_username
string is_ini_password
end variables

forward prototypes
public subroutine wf_readini ()
public subroutine wf_writeini (string as_username, string as_password)
end prototypes

public subroutine wf_readini ();//

is_ini_username = profilestring("testcase.ini","userinfo","username","")
is_ini_password = profilestring("testcase.ini","userinfo","password","")
end subroutine

public subroutine wf_writeini (string as_username, string as_password);//

setprofilestring("testcase.ini","userinfo","username",as_username)
setprofilestring("testcase.ini","userinfo","password",as_password)
end subroutine

on w_login.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cbx_1=create cbx_1
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.cbx_1,&
this.sle_2,&
this.sle_1,&
this.st_2,&
this.st_1,&
this.gb_1}
end on

on w_login.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cbx_1)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
end on

event open;string ls_password
wf_readini()

if len(trim(is_ini_password)) > 0 then
	ls_password = gf_simple_encode(is_ini_password,"2")
end if

sle_1.text = is_ini_username
sle_2.text = ls_password
end event

type cb_2 from commandbutton within w_login
integer x = 347
integer y = 684
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Exit"
end type

event clicked;halt
end event

type cb_1 from commandbutton within w_login
integer x = 1047
integer y = 688
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Login"
boolean default = true
end type

event clicked;string ls_enpass,ls_username

if len(trim(sle_1.text)) = 0 then
	messagebox("Error","Please input username")
	sle_1.setfocus( )
	return
end if

if len(trim(sle_2.text)) = 0 then
	messagebox("Error","Please input password")
	sle_2.setfocus( )
	return
end if
ls_username = sle_1.text
ls_enpass = gf_simple_encode(sle_2.text,'1')

if gf_checkpass(ls_username,ls_enpass) then
	gs_username = ls_username
	gs_pass = sle_2.text
	if cbx_1.checked then
		wf_writeini(ls_username,ls_enpass)
	else
		wf_writeini(ls_username,"")
	end if
	close(parent)
else
	messagebox("Error","Username or Password is error")
end if

end event

type cbx_1 from checkbox within w_login
integer x = 1344
integer y = 952
integer width = 425
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "记住密码"
boolean checked = true
end type

type sle_2 from singlelineedit within w_login
integer x = 901
integer y = 420
integer width = 549
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
end type

event getfocus;this.selecttext(1,len(this.text))
end event

type sle_1 from singlelineedit within w_login
integer x = 901
integer y = 224
integer width = 558
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
end type

type st_2 from statictext within w_login
integer x = 288
integer y = 448
integer width = 329
integer height = 140
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "密码："
boolean focusrectangle = false
end type

type st_1 from statictext within w_login
integer x = 288
integer y = 264
integer width = 329
integer height = 140
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "姓名："
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_login
integer width = 1920
integer height = 1096
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Login"
end type

