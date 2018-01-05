$PBExportHeader$n_uso303_cvo.sru
forward
global type n_uso303_cvo from userobject
end type
type cb_1 from commandbutton within n_uso303_cvo
end type
type st_1 from statictext within n_uso303_cvo
end type
end forward

global type n_uso303_cvo from userobject
integer width = 773
integer height = 444
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_1 cb_1
st_1 st_1
end type
global n_uso303_cvo n_uso303_cvo

type variables
String	is_str = 'Create'

end variables

forward prototypes
public function string of_this_text ()
public function string of_text ()
end prototypes

public function string of_this_text ();Return String(this.BackColor)
end function

public function string of_text ();Return String(BackColor)
end function

on n_uso303_cvo.create
this.cb_1=create cb_1
this.st_1=create st_1
this.Control[]={this.cb_1,&
this.st_1}
end on

on n_uso303_cvo.destroy
destroy(this.cb_1)
destroy(this.st_1)
end on

type cb_1 from commandbutton within n_uso303_cvo
integer x = 78
integer y = 192
integer width = 599
integer height = 128
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "CommandButton"
end type

event clicked;If BackColor = 67108864 Then
	BackColor = Rgb(255,0,0)
Else
	backColor = 67108864
End If
end event

type st_1 from statictext within n_uso303_cvo
integer x = 146
integer y = 64
integer width = 457
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "StaticText"
boolean focusrectangle = false
end type

