$PBExportHeader$u_color_bar170315.sru
$PBExportComments$Color palette
forward
global type u_color_bar170315 from userobject
end type
type rc_background from rectangle within u_color_bar170315
end type
type rc_5 from rectangle within u_color_bar170315
end type
type rc_6 from rectangle within u_color_bar170315
end type
type rc_7 from rectangle within u_color_bar170315
end type
type rc_8 from rectangle within u_color_bar170315
end type
type rc_10 from rectangle within u_color_bar170315
end type
type rc_11 from rectangle within u_color_bar170315
end type
type rc_12 from rectangle within u_color_bar170315
end type
type rc_13 from rectangle within u_color_bar170315
end type
type rc_14 from rectangle within u_color_bar170315
end type
type rc_15 from rectangle within u_color_bar170315
end type
type rc_1 from rectangle within u_color_bar170315
end type
type rc_2 from rectangle within u_color_bar170315
end type
type rc_3 from rectangle within u_color_bar170315
end type
type rc_23 from rectangle within u_color_bar170315
end type
type rc_9 from rectangle within u_color_bar170315
end type
type rc_4 from rectangle within u_color_bar170315
end type
type rc_foreground from rectangle within u_color_bar170315
end type
type rc_16 from rectangle within u_color_bar170315
end type
type rc_17 from rectangle within u_color_bar170315
end type
type rc_18 from rectangle within u_color_bar170315
end type
type rc_19 from rectangle within u_color_bar170315
end type
type rc_20 from rectangle within u_color_bar170315
end type
type rc_21 from rectangle within u_color_bar170315
end type
type rc_22 from rectangle within u_color_bar170315
end type
end forward

global type u_color_bar170315 from userobject
integer width = 2715
integer height = 136
long backcolor = 78682240
long tabtextcolor = 33554432
event ue_lbuttondown pbm_lbuttondown
rc_background rc_background
rc_5 rc_5
rc_6 rc_6
rc_7 rc_7
rc_8 rc_8
rc_10 rc_10
rc_11 rc_11
rc_12 rc_12
rc_13 rc_13
rc_14 rc_14
rc_15 rc_15
rc_1 rc_1
rc_2 rc_2
rc_3 rc_3
rc_23 rc_23
rc_9 rc_9
rc_4 rc_4
rc_foreground rc_foreground
rc_16 rc_16
rc_17 rc_17
rc_18 rc_18
rc_19 rc_19
rc_20 rc_20
rc_21 rc_21
rc_22 rc_22
end type
global u_color_bar170315 u_color_bar170315

forward prototypes
public subroutine uf_get_colors (ref string as_foreground, ref string as_background)
public function long uf_get_rgb (int ai_xloc)
public subroutine uf_set_background (long al_rgb_parm)
public subroutine uf_set_foreground (long al_rgb_parm)
end prototypes

public subroutine uf_get_colors (ref string as_foreground, ref string as_background);as_foreground =  String(rc_foreground.fillcolor)
as_background =  String(rc_background.fillcolor)
end subroutine

public function long uf_get_rgb (int ai_xloc);//get the color of the color box selected

int li_ind
rectangle rect [23] 
rect [1] = rc_1
rect [2] = rc_2
rect [3] = rc_3
rect [4] = rc_4
rect [5] = rc_5
rect [6] = rc_6
rect [7] = rc_7
rect [8] = rc_8
rect [9] = rc_9
rect [10] = rc_10
rect [11] = rc_11
rect [12] = rc_12
rect [13] = rc_13
rect [14] = rc_14
rect [15] = rc_15
rect [16] = rc_16
rect [17] = rc_17
rect [18] = rc_18
rect [19] = rc_19
rect [20] = rc_20
rect [21] = rc_21
rect [22] = rc_22
rect [23] = rc_23

For li_ind = 1 to 23
	If ai_xloc > rect[li_ind].x and ai_xloc < (rect[li_ind].x + rect[li_ind].width) then 
		return rect[li_ind].fillcolor
	End if
Next

return -1
end function

public subroutine uf_set_background (long al_rgb_parm);//Set the backgroound back to a particular color

If rc_background.fillcolor <> al_rgb_parm Then
	rc_background.fillcolor = al_rgb_parm
End if
end subroutine

public subroutine uf_set_foreground (long al_rgb_parm);//set the forground box to a particular color (passed)

If rc_foreground.fillcolor <> al_rgb_parm Then
	rc_foreground.fillcolor = al_rgb_parm
End If
end subroutine

on u_color_bar170315.create
this.rc_background=create rc_background
this.rc_5=create rc_5
this.rc_6=create rc_6
this.rc_7=create rc_7
this.rc_8=create rc_8
this.rc_10=create rc_10
this.rc_11=create rc_11
this.rc_12=create rc_12
this.rc_13=create rc_13
this.rc_14=create rc_14
this.rc_15=create rc_15
this.rc_1=create rc_1
this.rc_2=create rc_2
this.rc_3=create rc_3
this.rc_23=create rc_23
this.rc_9=create rc_9
this.rc_4=create rc_4
this.rc_foreground=create rc_foreground
this.rc_16=create rc_16
this.rc_17=create rc_17
this.rc_18=create rc_18
this.rc_19=create rc_19
this.rc_20=create rc_20
this.rc_21=create rc_21
this.rc_22=create rc_22
this.Control[]={this.rc_background,&
this.rc_5,&
this.rc_6,&
this.rc_7,&
this.rc_8,&
this.rc_10,&
this.rc_11,&
this.rc_12,&
this.rc_13,&
this.rc_14,&
this.rc_15,&
this.rc_1,&
this.rc_2,&
this.rc_3,&
this.rc_23,&
this.rc_9,&
this.rc_4,&
this.rc_foreground,&
this.rc_16,&
this.rc_17,&
this.rc_18,&
this.rc_19,&
this.rc_20,&
this.rc_21,&
this.rc_22}
end on

on u_color_bar170315.destroy
destroy(this.rc_background)
destroy(this.rc_5)
destroy(this.rc_6)
destroy(this.rc_7)
destroy(this.rc_8)
destroy(this.rc_10)
destroy(this.rc_11)
destroy(this.rc_12)
destroy(this.rc_13)
destroy(this.rc_14)
destroy(this.rc_15)
destroy(this.rc_1)
destroy(this.rc_2)
destroy(this.rc_3)
destroy(this.rc_23)
destroy(this.rc_9)
destroy(this.rc_4)
destroy(this.rc_foreground)
destroy(this.rc_16)
destroy(this.rc_17)
destroy(this.rc_18)
destroy(this.rc_19)
destroy(this.rc_20)
destroy(this.rc_21)
destroy(this.rc_22)
end on

type rc_background from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 16777215
integer x = 41
integer y = 16
integer width = 233
integer height = 88
end type

type rc_5 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 65535
integer x = 791
integer y = 16
integer width = 105
integer height = 88
end type

type rc_6 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 16711680
integer x = 896
integer y = 16
integer width = 105
integer height = 88
end type

type rc_7 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 16776960
integer x = 1001
integer y = 16
integer width = 105
integer height = 88
end type

type rc_8 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 128
integer x = 1106
integer y = 16
integer width = 105
integer height = 88
end type

type rc_10 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 32768
integer x = 1317
integer y = 16
integer width = 105
integer height = 88
end type

type rc_11 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 32896
integer x = 1422
integer y = 16
integer width = 105
integer height = 88
end type

type rc_12 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 8388608
integer x = 1527
integer y = 16
integer width = 105
integer height = 88
end type

type rc_13 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 8421376
integer x = 1632
integer y = 16
integer width = 105
integer height = 88
end type

type rc_14 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 8421504
integer x = 1737
integer y = 16
integer width = 105
integer height = 88
end type

type rc_15 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 12632256
integer x = 1842
integer y = 16
integer width = 105
integer height = 88
end type

type rc_1 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 16777215
integer x = 370
integer y = 16
integer width = 105
integer height = 88
end type

type rc_2 from rectangle within u_color_bar170315
event left_button_clicked pbm_lbuttondown
event right_button_clicked pbm_rbuttondown
integer linethickness = 4
long fillcolor = 255
integer x = 475
integer y = 16
integer width = 105
integer height = 88
end type

type rc_3 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 16711935
integer x = 581
integer y = 16
integer width = 105
integer height = 88
end type

type rc_23 from rectangle within u_color_bar170315
integer linethickness = 4
integer x = 265
integer y = 16
integer width = 105
integer height = 88
end type

type rc_9 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 8388736
integer x = 1211
integer y = 16
integer width = 105
integer height = 88
end type

type rc_4 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 65280
integer x = 686
integer y = 16
integer width = 105
integer height = 88
end type

type rc_foreground from rectangle within u_color_bar170315
integer linethickness = 4
integer x = 101
integer y = 28
integer width = 105
integer height = 64
end type

type rc_16 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 7733247
integer x = 1947
integer y = 16
integer width = 105
integer height = 88
end type

type rc_17 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 16777083
integer x = 2053
integer y = 16
integer width = 105
integer height = 88
end type

type rc_18 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 8323072
integer x = 2158
integer y = 16
integer width = 105
integer height = 88
end type

type rc_19 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 4210880
integer x = 2263
integer y = 16
integer width = 105
integer height = 88
end type

type rc_20 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 4210752
integer x = 2368
integer y = 16
integer width = 105
integer height = 88
end type

type rc_21 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 8405056
integer x = 2473
integer y = 16
integer width = 105
integer height = 88
end type

type rc_22 from rectangle within u_color_bar170315
integer linethickness = 4
long fillcolor = 8437952
integer x = 2578
integer y = 16
integer width = 105
integer height = 88
end type

