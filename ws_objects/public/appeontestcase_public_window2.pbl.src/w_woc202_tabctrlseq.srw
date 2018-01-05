$PBExportHeader$w_woc202_tabctrlseq.srw
forward
global type w_woc202_tabctrlseq from window
end type
type tab_1 from tab within w_woc202_tabctrlseq
end type
type tabpage_1 from userobject within tab_1
end type
type cb_page_1 from commandbutton within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_page_1 cb_page_1
end type
type tabpage_2 from userobject within tab_1
end type
type cb_page_2 from commandbutton within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_page_2 cb_page_2
end type
type tabpage_3 from userobject within tab_1
end type
type cb_page_3 from commandbutton within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cb_page_3 cb_page_3
end type
type tab_1 from tab within w_woc202_tabctrlseq
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type cb_close from commandbutton within w_woc202_tabctrlseq
end type
type mle_describe from multilineedit within w_woc202_tabctrlseq
end type
type gb_1 from groupbox within w_woc202_tabctrlseq
end type
end forward

global type w_woc202_tabctrlseq from window
integer width = 3456
integer height = 1824
boolean titlebar = true
string title = "tabctrl2"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
tab_1 tab_1
cb_close cb_close
mle_describe mle_describe
gb_1 gb_1
end type
global w_woc202_tabctrlseq w_woc202_tabctrlseq

type variables
//OutPut Index 
Integer ii_index = 0
end variables

forward prototypes
public subroutine wf_describe ()
end prototypes

public subroutine wf_describe ();//You must Define this Function for call
////////////////////////////////////////////////////////////////
//Function : wf_describe ; Output Describe
//Argument : none
//Output   : none
//Designer : 
//Date     :
////////////////////////////////////////////////////////////////

mle_describe.text  = '1.Appeon Window	: '
mle_describe.text +=  ClassName() + '~r~n' 
mle_describe.text += '2.Open Method	: '
mle_describe.text += gs_method+'~r~n'
mle_describe.text += '3.Testing Purpose	: '
mle_describe.text += gs_purpose+'~r~n'
mle_describe.text += '4.Operation Step	: '
mle_describe.text += gs_step+'~r~n'
mle_describe.text += '5.information: gs_tabctrlseq = ' + gs_tabctrlseq + '~r~n'
Return
end subroutine

on w_woc202_tabctrlseq.create
this.tab_1=create tab_1
this.cb_close=create cb_close
this.mle_describe=create mle_describe
this.gb_1=create gb_1
this.Control[]={this.tab_1,&
this.cb_close,&
this.mle_describe,&
this.gb_1}
end on

on w_woc202_tabctrlseq.destroy
destroy(this.tab_1)
destroy(this.cb_close)
destroy(this.mle_describe)
destroy(this.gb_1)
end on

event open;//Add Describe
Wf_Describe()

gs_main += 'Open Event in Sheet Window --> '
end event

event close;//gs_main += 'Close Event in Sheet Window --> '
end event

type tab_1 from tab within w_woc202_tabctrlseq
integer x = 73
integer y = 636
integer width = 2798
integer height = 1028
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

event constructor;if len(trim(gs_tabctrlseq)) < 1 then
	gs_tabctrlseq = this.classname()
else
	gs_tabctrlseq = gs_tabctrlseq + ' --> ' + this.classname()
end if
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 120
integer width = 2761
integer height = 892
long backcolor = 67108864
string text = "tabpage_1"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_page_1 cb_page_1
end type

on tabpage_1.create
this.cb_page_1=create cb_page_1
this.Control[]={this.cb_page_1}
end on

on tabpage_1.destroy
destroy(this.cb_page_1)
end on

event constructor;if len(trim(gs_tabctrlseq)) < 1 then
	gs_tabctrlseq = this.classname()
else
	gs_tabctrlseq = gs_tabctrlseq + ' --> ' + this.classname()
end if
end event

type cb_page_1 from commandbutton within tabpage_1
integer x = 137
integer y = 252
integer width = 457
integer height = 128
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "btn_page_1"
end type

event constructor;if len(trim(gs_tabctrlseq)) < 1 then
	gs_tabctrlseq = this.classname()
else
	gs_tabctrlseq = gs_tabctrlseq + ' --> ' + this.classname()
end if
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 120
integer width = 2761
integer height = 892
long backcolor = 67108864
string text = "tabpage_2"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_page_2 cb_page_2
end type

on tabpage_2.create
this.cb_page_2=create cb_page_2
this.Control[]={this.cb_page_2}
end on

on tabpage_2.destroy
destroy(this.cb_page_2)
end on

event constructor;if len(trim(gs_tabctrlseq)) < 1 then
	gs_tabctrlseq = this.classname()
else
	gs_tabctrlseq = gs_tabctrlseq + ' --> ' + this.classname()
end if
end event

type cb_page_2 from commandbutton within tabpage_2
integer x = 338
integer y = 288
integer width = 457
integer height = 128
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "btn_page_2"
end type

event constructor;if len(trim(gs_tabctrlseq)) < 1 then
	gs_tabctrlseq = this.classname()
else
	gs_tabctrlseq = gs_tabctrlseq + ' --> ' + this.classname()
end if
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 120
integer width = 2761
integer height = 892
long backcolor = 67108864
string text = "tabpage_3"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_page_3 cb_page_3
end type

on tabpage_3.create
this.cb_page_3=create cb_page_3
this.Control[]={this.cb_page_3}
end on

on tabpage_3.destroy
destroy(this.cb_page_3)
end on

event constructor;if len(trim(gs_tabctrlseq)) < 1 then
	gs_tabctrlseq = this.classname()
else
	gs_tabctrlseq = gs_tabctrlseq + ' --> ' + this.classname()
end if
end event

type cb_page_3 from commandbutton within tabpage_3
integer x = 782
integer y = 280
integer width = 457
integer height = 128
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "btn_page_3"
end type

event constructor;if len(trim(gs_tabctrlseq)) < 1 then
	gs_tabctrlseq = this.classname()
else
	gs_tabctrlseq = gs_tabctrlseq + ' --> ' + this.classname()
end if
end event

type cb_close from commandbutton within w_woc202_tabctrlseq
integer x = 3013
integer y = 588
integer width = 370
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
end type

event clicked;close(parent)
end event

type mle_describe from multilineedit within w_woc202_tabctrlseq
integer x = 64
integer y = 76
integer width = 3278
integer height = 460
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_woc202_tabctrlseq
integer x = 27
integer width = 3360
integer height = 576
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Description"
end type

