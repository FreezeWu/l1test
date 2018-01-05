$PBExportHeader$u_style_bar170315.sru
$PBExportComments$Ribbon bar with text, border, fonts, type styles, justifications
forward
global type u_style_bar170315 from userobject
end type
type ddlb_font from dropdownlistbox within u_style_bar170315
end type
type ddlb_size from dropdownlistbox within u_style_bar170315
end type
type p_underline from picture within u_style_bar170315
end type
type p_italic from picture within u_style_bar170315
end type
type p_bold from picture within u_style_bar170315
end type
type p_right from picture within u_style_bar170315
end type
type p_center from picture within u_style_bar170315
end type
type p_left from picture within u_style_bar170315
end type
type ddlb_border from dropdownlistbox within u_style_bar170315
end type
type sle_text from singlelineedit within u_style_bar170315
end type
end forward

global type u_style_bar170315 from userobject
integer width = 2825
integer height = 156
boolean border = true
long backcolor = 78682240
long tabtextcolor = 33554432
event ue_style_changed pbm_custom01
ddlb_font ddlb_font
ddlb_size ddlb_size
p_underline p_underline
p_italic p_italic
p_bold p_bold
p_right p_right
p_center p_center
p_left p_left
ddlb_border ddlb_border
sle_text sle_text
end type
global u_style_bar170315 u_style_bar170315

type variables
string is_alignment
string is_type_change
end variables

forward prototypes
public subroutine uf_load_true_type_size ()
public function string uf_get_style (ref object_style170315 astr_style)
public subroutine uf_set_style (object_style170315 astr_style)
end prototypes

public subroutine uf_load_true_type_size ();//Loads the ddlb.size with appriopirate font sizes for
//True Type Fonts

int li_index

ddlb_size.AddItem (String(li_index," 8"))
ddlb_size.AddItem (String(li_index," 9"))

For li_index = 10 to 12
	ddlb_size.AddItem (String(li_index,"##"))
Next
For li_index = 14 to 72 step 2
	ddlb_size.AddItem (String(li_index,"##"))
Next

end subroutine

public function string uf_get_style (ref object_style170315 astr_style);// return text
// this will populate the structure passed with the contents of the style bar.
// the last changed item on the style bar is returned directly by the function in a string

astr_style.text = sle_text.text

// return border
choose case ddlb_border.text
	case "None"
		astr_style.border = "0"
	case "Shadow Box"
		astr_style.border = "1"
	case "Box"
		astr_style.border = "2"
	case "Underline"
		astr_style.border = "4"
	case "3D Lowered"
		astr_style.border = "5"
	case "3D Raised"
		astr_style.border = "6"
	case "Resize"
		astr_style.border = "3"
end choose

// return font
astr_style.font_face = ddlb_font.text

// return font size
astr_style.font_height = ddlb_size.text

// return bold value

if p_bold.invert = true then
	astr_style.font_weight = "700"
else
	astr_style.font_weight = "400"
end if

//if p_bold.picturename = "pb_b_dn.bmp" then
//	astr_style.font_weight = "700"
//else
//	astr_style.font_weight = "400"
//end if

// return italic
if p_italic.invert = true then
	astr_style.italic = "1"
else
	astr_style.italic = "0"
end if
//if p_italic.picturename = "pb_i_dn.bmp" then
//	astr_style.italic = "1"
//else
//	astr_style.italic = "0"
//end if

// return underline
if p_underline.invert = true then
	astr_style.underline = "1"
else
	astr_style.underline = "0"
end if

//if p_underline.picturename = "pb_u_dn.bmp" then
//	astr_style.underline = "1"
//else
//	astr_style.underline = "0"
//end if

// return alignment
astr_style.alignment = is_alignment

return is_type_change

end function

public subroutine uf_set_style (object_style170315 astr_style);//this will set the correct style bar positions and labels with passed a structure
//of type style 

string ls_text
boolean lb_flag

// Set text
if astr_style.text = "" then
	hide (sle_text)
else
	sle_text.text = astr_style.text
	show (sle_text)
end if

// Set Border
choose case astr_style.border
	case "0"
		ls_text = "None"
	case "1"
		ls_text = "Shadow Box"
	case "2"
		ls_text = "Box"
	case "4"
		ls_text = "Underline"
	case "5"
		ls_text = "3D Lowered"
	case "6"
		ls_text = "3D Raised"
end choose
if ddlb_border.text <> ls_text then ddlb_border.text = ls_text

// Set font face
if ddlb_font.text <> astr_style.font_face then
	ddlb_font.text = astr_style.font_face
	Triggerevent (ddlb_font, selectionchanged!)
end if

// Set Font Height if a non-zero one was passed.
// Otherwise, let it default based on font face.
if astr_style.font_height <> "0" then
	if ddlb_size.text <> astr_style.font_height then ddlb_size.text = astr_style.font_height
end if

// Set Font Weight
if astr_style.font_weight = "400" then
	//ls_text = "pb_b_up.bmp"
	lb_flag = false
else
	//ls_text = "pb_b_dn.bmp"
	lb_flag = true
end if
p_bold.invert = lb_flag
//if p_bold.picturename <> ls_text then p_bold.picturename = ls_text

// Set Italic
if astr_style.italic = "1" then
//	ls_text = "pb_i_dn.bmp"
	lb_flag = true
else
//	ls_text = "pb_i_up.bmp"
	lb_flag = false
end if
p_italic.invert = lb_flag
//if p_italic.picturename <> ls_text then p_italic.picturename = ls_text

// Set Underline
if astr_style.underline = "1" then
	//ls_text = "pb_u_dn.bmp"
	lb_flag = true
else
	//ls_text = "pb_u_up.bmp"
	lb_flag = false
end if
p_underline.invert = lb_flag
//if p_underline.picturename <> ls_text then p_underline.picturename = ls_text

// Set Alignment
choose case astr_style.alignment
	case "0"
		p_left.invert = true
		p_center.invert = false
		p_right.invert = false
//		if p_left.picturename = "pb_l_up.bmp" then
//			p_left.picturename  = "pb_l_dn.bmp"
//			p_center.picturename = "pb_c_up.bmp"
//			p_right.picturename = "pb_r_up.bmp"
//		end if
	case "1"
		p_left.invert =  false
		p_center.invert = false
		p_right.invert = true
//		if p_right.picturename = "pb_r_up.bmp" then
//			p_left.picturename = "pb_l_up.bmp"
//			p_center.picturename = "pb_c_up.bmp"
//			p_right.picturename = "pb_r_dn.bmp"
//		end if
	case "2"
		p_left.invert =  false
		p_center.invert = true
		p_right.invert = false
//		if p_center.picturename = "pb_c_up.bmp" then
//			p_left.picturename = "pb_l_up.bmp"
//			p_center.picturename = "pb_c_dn.bmp"
//			p_right.picturename = "pb_r_up.bmp"
//		end if
end choose

is_alignment = astr_style.alignment

end subroutine

on u_style_bar170315.create
this.ddlb_font=create ddlb_font
this.ddlb_size=create ddlb_size
this.p_underline=create p_underline
this.p_italic=create p_italic
this.p_bold=create p_bold
this.p_right=create p_right
this.p_center=create p_center
this.p_left=create p_left
this.ddlb_border=create ddlb_border
this.sle_text=create sle_text
this.Control[]={this.ddlb_font,&
this.ddlb_size,&
this.p_underline,&
this.p_italic,&
this.p_bold,&
this.p_right,&
this.p_center,&
this.p_left,&
this.ddlb_border,&
this.sle_text}
end on

on u_style_bar170315.destroy
destroy(this.ddlb_font)
destroy(this.ddlb_size)
destroy(this.p_underline)
destroy(this.p_italic)
destroy(this.p_bold)
destroy(this.p_right)
destroy(this.p_center)
destroy(this.p_left)
destroy(this.ddlb_border)
destroy(this.sle_text)
end on

type ddlb_font from dropdownlistbox within u_style_bar170315
integer x = 1175
integer y = 20
integer width = 626
integer height = 324
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "System"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Arial","Courier New","System","Times New Roman"}
borderstyle borderstyle = stylelowered!
end type

on selectionchanged;//Selectionchanged script for ddlb_font

string ls_hold 

ls_hold = ddlb_size.text

ddlb_size.Reset( ) 

choose case this.text
	case "Arial"
		uf_load_true_type_size()
	case "Courier New"
		uf_load_true_type_size()		
	case "System"
		ddlb_size.AddItem(" 9")
		ddlb_size.AddItem("10")
	case "Times New Roman"
		uf_load_true_type_size()
end choose

ddlb_size.text = ls_hold

is_type_change = "Font"
parent.triggerevent("ue_style_changed")
end on

type ddlb_size from dropdownlistbox within u_style_bar170315
integer x = 1842
integer y = 20
integer width = 242
integer height = 352
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78682240
string text = "15"
boolean allowedit = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

on modified;is_type_change = "Size"
parent.triggerevent("ue_style_changed")
end on

type p_underline from picture within u_style_bar170315
integer x = 2373
integer y = 20
integer width = 73
integer height = 64
integer taborder = 70
boolean originalsize = true
string picturename = "Underline!"
boolean border = true
end type

event clicked;//Clicked script for p_underline

if this.invert = true then
	this.invert = false
else
	this.invert = true
end if

//if this.picturename = "pb_u_up.bmp" then
//	this.picturename = "pb_u_dn.bmp"
//else
//	this.picturename = "pb_u_up.bmp"
//end if

is_type_change = "underline"
parent.triggerevent("ue_style_changed")
end event

type p_italic from picture within u_style_bar170315
integer x = 2290
integer y = 20
integer width = 73
integer height = 64
integer taborder = 60
boolean originalsize = true
string picturename = "Italic!"
boolean border = true
end type

event clicked;//Clicked script for p_italic

if this.invert = true then
	this.invert = false
else
	this.invert = true
end if
//
//if this.picturename = "pb_i_up.bmp" then
//	this.picturename = "pb_i_dn.bmp"
//else
//	this.picturename = "pb_i_up.bmp"
//end if
//
is_type_change = "italic"
parent.triggerevent("ue_style_changed")
end event

type p_bold from picture within u_style_bar170315
integer x = 2208
integer y = 20
integer width = 73
integer height = 64
integer taborder = 50
boolean originalsize = true
string picturename = "Bold!"
boolean border = true
end type

event clicked;//Clicked script for p_bold

if this.invert = true then
	this.invert = false
else
	this.invert = true
end if
//if this.picturename = "pb_b_up.bmp" then
//	this.picturename = "pb_b_dn.bmp"
//else
//	this.picturename = "pb_b_up.bmp"
//end if

is_type_change = "Bold"
parent.triggerevent("ue_style_changed")
end event

type p_right from picture within u_style_bar170315
integer x = 2656
integer y = 20
integer width = 73
integer height = 64
integer taborder = 100
boolean originalsize = true
string picturename = "Right!"
boolean border = true
end type

event clicked;//Clicked script for p_right

is_alignment = "1"

 this.invert = true
 p_left.invert = false
 p_center.invert = false
 
//this.picturename = "pb_r_dn.bmp"
//p_center.picturename = "pb_c_up.bmp"
//p_left.picturename = "pb_l_up.bmp"

is_type_change = "right"
parent.triggerevent("ue_style_changed")

end event

type p_center from picture within u_style_bar170315
integer x = 2574
integer y = 20
integer width = 73
integer height = 64
integer taborder = 90
boolean originalsize = true
string picturename = "Center!"
boolean border = true
end type

event clicked;//Clicked script for p_center

is_alignment = "2"

 this.invert = true
 p_left.invert = false
 p_right.invert = false
 
//this.picturename = "pb_c_dn.bmp"
//p_left.picturename = "pb_l_up.bmp"
//p_right.picturename = "pb_r_up.bmp"

is_type_change = "center"
parent.triggerevent("ue_style_changed")

end event

type p_left from picture within u_style_bar170315
integer x = 2491
integer y = 20
integer width = 73
integer height = 64
integer taborder = 80
boolean originalsize = true
string picturename = "Left!"
boolean border = true
end type

event clicked;//Clicked script for p_left

is_alignment = "0"


 this.invert = true
 p_center.invert = false
 p_right.invert = false
//this.picturename = "pb_l_dn.bmp"
//p_center.picturename = "pb_c_up.bmp"
//p_right.picturename = "pb_r_up.bmp"


is_type_change = "left"
parent.triggerevent("ue_style_changed")
end event

type ddlb_border from dropdownlistbox within u_style_bar170315
integer x = 645
integer y = 20
integer width = 471
integer height = 324
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "None"
boolean vscrollbar = true
string item[] = {"None","Shadow Box","Box","3D Lowered","3D Raised","Resize"}
borderstyle borderstyle = stylelowered!
end type

on selectionchanged;is_type_change = "border"

parent.triggerevent("ue_style_changed")
end on

type sle_text from singlelineedit within u_style_bar170315
integer x = 23
integer y = 20
integer width = 581
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "arrow!"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on modified;is_type_change = "text"
parent.triggerevent("ue_style_changed")
end on

