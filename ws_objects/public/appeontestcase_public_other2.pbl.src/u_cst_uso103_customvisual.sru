$PBExportHeader$u_cst_uso103_customvisual.sru
forward
global type u_cst_uso103_customvisual from userobject
end type
type st_1 from statictext within u_cst_uso103_customvisual
end type
end forward

global type u_cst_uso103_customvisual from userobject
integer width = 608
integer height = 100
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
end type
global u_cst_uso103_customvisual u_cst_uso103_customvisual

type variables

end variables

forward prototypes
public subroutine uf_call ()
end prototypes

public subroutine uf_call ();n_cst_uso103_autouo	luo_autouo

gs_str = luo_autouo.is_str
end subroutine

on u_cst_uso103_customvisual.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on u_cst_uso103_customvisual.destroy
destroy(this.st_1)
end on

type st_1 from statictext within u_cst_uso103_customvisual
integer x = 9
integer y = 12
integer width = 617
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Custom Visual Object"
boolean focusrectangle = false
end type

