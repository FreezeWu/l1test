$PBExportHeader$w_changpass.srw
forward
global type w_changpass from window
end type
type cb_2 from commandbutton within w_changpass
end type
type cb_1 from commandbutton within w_changpass
end type
type sle_3 from singlelineedit within w_changpass
end type
type sle_2 from singlelineedit within w_changpass
end type
type sle_1 from singlelineedit within w_changpass
end type
type st_3 from statictext within w_changpass
end type
type st_2 from statictext within w_changpass
end type
type st_1 from statictext within w_changpass
end type
type gb_1 from groupbox within w_changpass
end type
end forward

global type w_changpass from window
integer width = 1541
integer height = 1008
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
st_3 st_3
st_2 st_2
st_1 st_1
gb_1 gb_1
end type
global w_changpass w_changpass

on w_changpass.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.gb_1}
end on

on w_changpass.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
end on

type cb_2 from commandbutton within w_changpass
integer x = 841
integer y = 736
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "取消"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_changpass
integer x = 178
integer y = 736
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "确认"
end type

event clicked;string ls_password,ls_error
if sle_1.text <> gs_pass then
	messagebox("Error","原有密码错误")
	return
end if

if len(sle_2.text) > 8 then
	messagebox("Error","密码不要超过8个字符")
	return
end if

if sle_2.text <> sle_3.text then
	messagebox("Error","两次输入的密码不一致")
	return
end if

ls_password = gf_simple_encode(sle_2.text,'1')

update t_user set userpass = :ls_password where userid = :gi_userid;

if gf_testdb(true,ls_error) = 0 then
	commit;
	messagebox("Success","Change Password success")
	close(parent)
else
	rollback;
end if

end event

type sle_3 from singlelineedit within w_changpass
integer x = 654
integer y = 460
integer width = 622
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
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_changpass
integer x = 654
integer y = 272
integer width = 622
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_changpass
integer x = 654
integer y = 92
integer width = 622
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_changpass
integer x = 160
integer y = 488
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "确认密码："
boolean focusrectangle = false
end type

type st_2 from statictext within w_changpass
integer x = 160
integer y = 300
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "新密码："
boolean focusrectangle = false
end type

type st_1 from statictext within w_changpass
integer x = 160
integer y = 108
integer width = 457
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "原密码："
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_changpass
integer width = 1527
integer height = 996
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "修改密码"
end type

