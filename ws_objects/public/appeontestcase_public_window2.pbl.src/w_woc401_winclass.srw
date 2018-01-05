$PBExportHeader$w_woc401_winclass.srw
forward
global type w_woc401_winclass from window
end type
type cb_close from commandbutton within w_woc401_winclass
end type
type mle_describe from multilineedit within w_woc401_winclass
end type
type gb_1 from groupbox within w_woc401_winclass
end type
end forward

global type w_woc401_winclass from window
integer width = 3456
integer height = 848
boolean titlebar = true
string title = "winclass1"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_close cb_close
mle_describe mle_describe
gb_1 gb_1
end type
global w_woc401_winclass w_woc401_winclass

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
Return
end subroutine

on w_woc401_winclass.create
this.cb_close=create cb_close
this.mle_describe=create mle_describe
this.gb_1=create gb_1
this.Control[]={this.cb_close,&
this.mle_describe,&
this.gb_1}
end on

on w_woc401_winclass.destroy
destroy(this.cb_close)
destroy(this.mle_describe)
destroy(this.gb_1)
end on

event open;//Add Describe
post Wf_Describe()

gs_main += 'Open Event in Sheet Window --> '


end event

event close;//gs_main += 'Close Event in Sheet Window --> '

end event

type cb_close from commandbutton within w_woc401_winclass
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

type mle_describe from multilineedit within w_woc401_winclass
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

type gb_1 from groupbox within w_woc401_winclass
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

