$PBExportHeader$u_cst_woc202_uoseq.sru
forward
global type u_cst_woc202_uoseq from userobject
end type
type mle_mleofuo from multilineedit within u_cst_woc202_uoseq
end type
type cb_btnofuo from commandbutton within u_cst_woc202_uoseq
end type
type gb_gbofuo from groupbox within u_cst_woc202_uoseq
end type
end forward

global type u_cst_woc202_uoseq from userobject
integer width = 1170
integer height = 672
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
mle_mleofuo mle_mleofuo
cb_btnofuo cb_btnofuo
gb_gbofuo gb_gbofuo
end type
global u_cst_woc202_uoseq u_cst_woc202_uoseq

type variables
string ls_ksm = 'appeon'
end variables

on u_cst_woc202_uoseq.create
this.mle_mleofuo=create mle_mleofuo
this.cb_btnofuo=create cb_btnofuo
this.gb_gbofuo=create gb_gbofuo
this.Control[]={this.mle_mleofuo,&
this.cb_btnofuo,&
this.gb_gbofuo}
end on

on u_cst_woc202_uoseq.destroy
destroy(this.mle_mleofuo)
destroy(this.cb_btnofuo)
destroy(this.gb_gbofuo)
end on

event constructor;if len(trim(gs_uoctrlseq)) < 1 then
	gs_uoctrlseq = this.classname()
else
	gs_uoctrlseq = gs_uoctrlseq + ' --> ' + this.classname()
end if
end event

type mle_mleofuo from multilineedit within u_cst_woc202_uoseq
integer x = 46
integer y = 92
integer width = 1061
integer height = 408
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event constructor;if len(trim(gs_uoctrlseq)) < 1 then
	gs_uoctrlseq = this.classname()
else
	gs_uoctrlseq = gs_uoctrlseq + ' --> ' + this.classname()
end if
end event

type cb_btnofuo from commandbutton within u_cst_woc202_uoseq
integer x = 695
integer y = 524
integer width = 297
integer height = 96
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "button"
end type

event constructor;if len(trim(gs_uoctrlseq)) < 1 then
	gs_uoctrlseq = this.classname()
else
	gs_uoctrlseq = gs_uoctrlseq + ' --> ' + this.classname()
end if
end event

type gb_gbofuo from groupbox within u_cst_woc202_uoseq
integer x = 14
integer y = 12
integer width = 1134
integer height = 640
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Userobject"
end type

event constructor;if len(trim(gs_uoctrlseq)) < 1 then
	gs_uoctrlseq = this.classname()
else
	gs_uoctrlseq = gs_uoctrlseq + ' --> ' + this.classname()
end if
end event

