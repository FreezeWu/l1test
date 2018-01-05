$PBExportHeader$n_cst_uso101_composite.sru
forward
global type n_cst_uso101_composite from userobject
end type
type cb_1 from u_cst_uso101_standardvisual within n_cst_uso101_composite
end type
type uo_1 from u_cst_uso101_customvisual within n_cst_uso101_composite
end type
end forward

global type n_cst_uso101_composite from userobject
integer width = 1253
integer height = 744
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_1 cb_1
uo_1 uo_1
end type
global n_cst_uso101_composite n_cst_uso101_composite

type variables
n_cst_uso101_customclass ino_customclass
n_cst_uso101_standardclass ino_standardclass
n_cst_uso101_autouo iuo_autouo
end variables

forward prototypes
public function integer f_create ()
public function string f_nvo_custom ()
public function integer f_destroy ()
public function string f_nvo_standard ()
end prototypes

public function integer f_create ();ino_customclass = create n_cst_uso101_customclass
ino_standardclass = create n_cst_uso101_standardclass
return 1
end function

public function string f_nvo_custom ();return ino_customclass.classname()
end function

public function integer f_destroy ();destroy ino_customclass
destroy ino_standardclass
return 1
end function

public function string f_nvo_standard ();return ino_standardclass.classname()
end function

on n_cst_uso101_composite.create
this.cb_1=create cb_1
this.uo_1=create uo_1
this.Control[]={this.cb_1,&
this.uo_1}
end on

on n_cst_uso101_composite.destroy
destroy(this.cb_1)
destroy(this.uo_1)
end on

type cb_1 from u_cst_uso101_standardvisual within n_cst_uso101_composite
integer x = 37
integer y = 160
integer taborder = 20
end type

type uo_1 from u_cst_uso101_customvisual within n_cst_uso101_composite
integer taborder = 10
end type

on uo_1.destroy
call u_cst_uso101_customvisual::destroy
end on

