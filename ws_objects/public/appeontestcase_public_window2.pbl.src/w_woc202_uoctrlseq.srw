$PBExportHeader$w_woc202_uoctrlseq.srw
forward
global type w_woc202_uoctrlseq from window
end type
type uo_userobject from u_cst_woc202_uoseq within w_woc202_uoctrlseq
end type
type cb_close from commandbutton within w_woc202_uoctrlseq
end type
type mle_describe from multilineedit within w_woc202_uoctrlseq
end type
type gb_1 from groupbox within w_woc202_uoctrlseq
end type
end forward

global type w_woc202_uoctrlseq from window
integer width = 3456
integer height = 1592
boolean titlebar = true
string title = "tabctrl3"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_close ( )
uo_userobject uo_userobject
cb_close cb_close
mle_describe mle_describe
gb_1 gb_1
end type
global w_woc202_uoctrlseq w_woc202_uoctrlseq

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
mle_describe.text += '5.information: gs_uoctrlseq = ' + gs_uoctrlseq + '~r~n'
Return
end subroutine

on w_woc202_uoctrlseq.create
this.uo_userobject=create uo_userobject
this.cb_close=create cb_close
this.mle_describe=create mle_describe
this.gb_1=create gb_1
this.Control[]={this.uo_userobject,&
this.cb_close,&
this.mle_describe,&
this.gb_1}
end on

on w_woc202_uoctrlseq.destroy
destroy(this.uo_userobject)
destroy(this.cb_close)
destroy(this.mle_describe)
destroy(this.gb_1)
end on

event open;//Add Describe
Wf_Describe()

gs_main += 'Open Event in Sheet Window --> '
end event

event close;//gs_main += 'Close Event in Sheet Window --> '
post event ue_close()
end event

type uo_userobject from u_cst_woc202_uoseq within w_woc202_uoctrlseq
integer x = 745
integer width = 1221
integer height = 692
integer taborder = 40
borderstyle borderstyle = stylelowered!
end type

on uo_userobject.destroy
call u_cst_woc202_uoseq::destroy
end on

type cb_close from commandbutton within w_woc202_uoctrlseq
integer x = 3017
integer y = 1296
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

type mle_describe from multilineedit within w_woc202_uoctrlseq
integer x = 69
integer y = 784
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

type gb_1 from groupbox within w_woc202_uoctrlseq
integer x = 32
integer y = 708
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

