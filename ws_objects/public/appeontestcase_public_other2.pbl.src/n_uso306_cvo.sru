$PBExportHeader$n_uso306_cvo.sru
forward
global type n_uso306_cvo from userobject
end type
type cb_1 from commandbutton within n_uso306_cvo
end type
type st_1 from statictext within n_uso306_cvo
end type
end forward

global type n_uso306_cvo from userobject
integer width = 773
integer height = 444
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event of_function_user ( )
cb_1 cb_1
st_1 st_1
end type
global n_uso306_cvo n_uso306_cvo

type variables
String	is_str = 'Create'
Integer	il_int1 = 1, il_int2
Date	id_date1 = 2000-01-01, id_date2
n_cst_uso306_autouo iuo_autouo
String	is_same = 'This is Object n_uso306_cvo.is_same'
end variables

forward prototypes
public function string of_intinstance ()
public function string of_dateinstance ()
public function string of_objectinstance ()
public function string of_this_string ()
public function string of_string ()
public function string of_same ()
end prototypes

public function string of_intinstance ();Return 'il_int1 = ' + String(il_int1) + ', il_int2 = ' + String(il_int2)

end function

public function string of_dateinstance ();Return 'id_date1 = ' + String(id_date1) + ', id_date2 = ' + String(id_date2)
end function

public function string of_objectinstance ();Return iuo_autouo.is_str
end function

public function string of_this_string ();Return This.is_str
end function

public function string of_string ();Return is_str
end function

public function string of_same ();Return is_same
end function

on n_uso306_cvo.create
this.cb_1=create cb_1
this.st_1=create st_1
this.Control[]={this.cb_1,&
this.st_1}
end on

on n_uso306_cvo.destroy
destroy(this.cb_1)
destroy(this.st_1)
end on

type cb_1 from commandbutton within n_uso306_cvo
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

type st_1 from statictext within n_uso306_cvo
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

