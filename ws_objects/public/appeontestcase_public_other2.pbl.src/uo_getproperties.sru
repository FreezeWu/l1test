$PBExportHeader$uo_getproperties.sru
forward
global type uo_getproperties from nonvisualobject
end type
end forward

global type uo_getproperties from nonvisualobject autoinstantiate
end type

type variables
powerobject iobj_control[] 

end variables

forward prototypes
public function string of_enutostring (any aenu_type, string as_type)
public function string of_prac_getproperties (powerobject aobj_name, string as_prolist)
public function string of_prac_checkbox (ref powerobject aobj_name, string as_pname)
public function string of_prac_multilineedit (ref powerobject aobj_name, string as_pname)
public function string of_getpracticevalue (window aw_name, string as_prolist)
public function string of_prac_commandbutton (ref powerobject aobj_name, string as_pname)
public function string of_prac_dropdownlistbox (ref powerobject aobj_name, string as_pname)
public function string of_prac_dropdownpicturelistbox (ref powerobject aobj_name, string as_pname)
public function string of_prac_editmask (ref powerobject aobj_name, string as_pname)
public function string of_prac_groupbox (ref powerobject aobj_name, string as_pname)
public function string of_prac_hscrollbar (ref powerobject aobj_name, string as_pname)
public function string of_prac_line (ref powerobject aobj_name, string as_pname)
public function string of_prac_listbox (ref powerobject aobj_name, string as_pname)
public function string of_prac_listview (ref powerobject aobj_name, string as_pname)
public function string of_prac_olecustomcontrol (ref powerobject aobj_name, string as_pname)
public function string of_prac_oval (ref powerobject aobj_name, string as_pname)
public function string of_prac_olecontrol (ref powerobject aobj_name, string as_pname)
public function string of_prac_picture (ref powerobject aobj_name, string as_pname)
public function string of_prac_picturebutton (ref powerobject aobj_name, string as_pname)
public function string of_prac_picturelistbox (ref powerobject aobj_name, string as_pname)
public function string of_prac_radiobutton (ref powerobject aobj_name, string as_pname)
public function string of_prac_rectangle (ref powerobject aobj_name, string as_pname)
public function string of_prac_richtextedit (ref powerobject aobj_name, string as_pname)
public function string of_prac_roundrectangle (ref powerobject aobj_name, string as_pname)
public function string of_prac_tab (ref powerobject aobj_name, string as_pname)
public function string of_prac_treeview (ref powerobject aobj_name, string as_pname)
public function string of_prac_vscrollbar (ref powerobject aobj_name, string as_pname)
public function string of_prac_datawindow (ref powerobject aobj_name, string as_pname)
public function string of_prac_singlelineedit (ref powerobject aobj_name, string as_pname)
public function string of_prac_statictext (ref powerobject aobj_name, string as_pname)
public function string of_prac_statichyperlink (ref powerobject aobj_name, string as_pname)
public function string of_prac_picturehyperlink (ref powerobject aobj_name, string as_pname)
public function string of_prac_vtrackbar (ref powerobject aobj_name, string as_pname)
public function string of_prac_htrackbar (ref powerobject aobj_name, string as_pname)
public function string of_prac_hprogressbar (ref powerobject aobj_name, string as_pname)
public function string of_prac_vprogressbar (ref powerobject aobj_name, string as_pname)
public function string of_getdwdata (ref datawindowchild adw_name)
public function string of_getdwdata (ref datawindow adw_name)
public function powerobject of_get_tabobject (powerobject aobj_name, string as_objname)
public function string of_get_objandproname (string as_str, ref string as_objname)
public function powerobject of_get_userobject (powerobject aobj_name, string as_objname)
public function string of_prac_userobject (ref powerobject aobj_name, string as_pname)
public function string of_controllist (powerobject as_object[])
public function string of_prac_datastore (ref powerobject aobj_name, string as_pname)
public function string of_getdwdata (ref datastore adw_name)
public function string of_getpracticevalue (powerobject aobj_name, string as_objname, string as_prolist)
end prototypes

public function string of_enutostring (any aenu_type, string as_type);string ls_temstr

		

choose case as_type
		
	//BorderStyle 	
	case "BorderStyle"  		
		choose case aenu_type
			case StyleBox!
				ls_temstr = "StyleBox!"
			case StyleShadowBox!
				ls_temstr = "StyleShadowBox!"	
			case StyleLowered!
				ls_temstr = "StyleLowered!"
			case StyleRaised!
				ls_temstr = "StyleRaised!"						
			case else
			   ls_temstr = "Unknown!"					
		end choose
	
	//	FontCharSet	
   case "FontCharSet"
		choose case aenu_type		 
			case ANSI!
				ls_temstr = "ANSI!"
			case ChineseBig5!
				ls_temstr = "ChineseBig5!"
			case DefaultCharSet!
				ls_temstr = "DefaultCharSet!"
			case Hangeul!
				ls_temstr = "Hangeul!"
			case OEM!
				ls_temstr = "OEM!"
			case ShiftJIS!
				ls_temstr = "ShiftJIS!"
			case Symbol!
				ls_temstr = "Symbol!"
			case else
				ls_temstr = "Unknown!"	
		end choose
			
	//	FontFamily 
	case "FontFamily"
		choose case aenu_type
			case AnyFont!
				ls_temstr = "AnyFont!"
			case Decorative!
				ls_temstr = "Decorative!"
			case Modern!
				ls_temstr = "Modern!"
			case Roman!
				ls_temstr = "Roman!"
			case Script!
				ls_temstr = "Script!"
			case Swiss!
				ls_temstr = "Swiss!"
			case else
			ls_temstr = "Unknown!"	
		end choose
		
	//	FontPitch 
	case "FontPitch"
		choose case aenu_type
			case Default!
				ls_temstr = "Default!"
			case Fixed!
				ls_temstr = "Fixed!"
			case Variable!
				ls_temstr = "Variable!"
			case else
				ls_temstr = "Unknown!"	
		end choose	
	
	//FillPattern 
   case "FillPattern"
		choose case aenu_type
			case BDiagonal!
				ls_temstr = "BDiagonal!"
		   case Diamond!
				ls_temstr = "Diamond!"
		   case FDiagonal!
				ls_temstr = "FDiagonal!"
			case Horizontal!
				ls_temstr = "Horizontal!"
			case Solid!
				ls_temstr = "Solid!"
			case Square!
				ls_temstr = "Square!"
			case Vertical!
				ls_temstr = "Vertical!"
			case else
				ls_temstr = "Unknown!"	
		end choose	
		
	//LineStyle
	case "LineStyle"
		choose case aenu_type
			case Continuous!
				ls_temstr = "Continuous!"
		   case Dash!
				ls_temstr = "Dash!"
		   case DashDot!
				ls_temstr = "DashDot!"
			case DashDotDot!
				ls_temstr = "DashDotDot!"
			case Dot!
				ls_temstr = "Dot!"
			case Transparent!
				ls_temstr = "Transparent!"			
			case else
				ls_temstr = "Unknown!"	
		end choose	
	
	//TextCase
	case "TextCase"
		choose case aenu_type
			case AnyCase!
				ls_temstr = "AnyCase!"
		   case Lower!
				ls_temstr = "Lower!"
		   case Upper!
				ls_temstr = "Upper!"				
			case else
				ls_temstr = "Unknown!"	
		end choose
	
	//Alignment
   case "Alignment"
		choose case aenu_type
			case Center!
				ls_temstr = "Center!"
			case Justify!
				ls_temstr = "Justify!"
			case Left!
				ls_temstr = "Left!"
			case Right!
				ls_temstr = "Right!"
			case else
				ls_temstr = "Unknown!"	
		end choose
		
		
	//VTextAlign
   case "VTextAlign"
		choose case aenu_type
			case Bottom!
				ls_temstr = "Bottom!"
			case Bottom!
				ls_temstr = "Bottom!"
			case Top!
				ls_temstr = "Top!"
			case VCenter!
				ls_temstr = "VCenter!"
			case else
				ls_temstr = "Unknown!"	
		end choose
		
		
	//MaskDataType 
   case "MaskDataType"
		choose case aenu_type
			case DateMask!
				ls_temstr = "DateMask!"
			case DateTimeMask!
				ls_temstr = "DateTimeMask!"
			case DecimalMask!
				ls_temstr = "DecimalMask!"
			case NumericMask!
				ls_temstr = "NumericMask!"
			case StringMask!
				ls_temstr = "StringMask!"
			case TimeMask!
				ls_temstr = "TimeMask!"
			case else
				ls_temstr = "Unknown!"	
		end choose
	
	//HTickMarks 	 
   case "HTickMarks"
		choose case aenu_type
			case HTicksOnBottom!
				ls_temstr = "HTicksOnBottom!"
			case HTicksOnTop!
				ls_temstr = "HTicksOnTop!"
			case HTicksOnBoth!
				ls_temstr = "HTicksOnBoth!"
			case HTicksOnNeither!
				ls_temstr = "HTicksOnNeither!"			
			case else
				ls_temstr = "Unknown!"	
		end choose
	
	//HTickMarks 	 
   case "VTickMarks"
		choose case aenu_type
			case VTicksOnRight!
				ls_temstr = "VTicksOnRight!"
			case VTicksOnLeft!
				ls_temstr = "VTicksOnLeft!"
			case VTicksOnBoth!
				ls_temstr = "VTicksOnBoth!"
			case VTicksOnNeither!
				ls_temstr = "VTicksOnNeither!"			
			case else
				ls_temstr = "Unknown!"	
		end choose
		
	//grSortType	 
   case "grSortType"
		choose case aenu_type
			case Ascending!
				ls_temstr = "Ascending!"
			case Descending!
				ls_temstr = "Descending!"
			case UserDefinedsort!
				ls_temstr = "UserDefinedsort!"
			case Unsorted!
				ls_temstr = "Unsorted!"			
			case else
				ls_temstr = "Unknown!"	
		end choose	
	
	//TabPosition	 
   case "TabPosition"
		choose case aenu_type
			case TabsOnBottom!
				ls_temstr = "TabsOnBottom!"
			case TabsOnBottomAndTop!
				ls_temstr = "TabsOnBottomAndTop!"
			case TabsOnLeft!
				ls_temstr = "TabsOnLeft!"
			case TabsOnLeftAndRight!
				ls_temstr = "TabsOnLeftAndRight!"				
			case TabsOnRight!
				ls_temstr = "TabsOnRight!"
			case TabsOnRightAndLeft!
				ls_temstr = "TabsOnRightAndLeft!"
			case TabsOnTop!
				ls_temstr = "TabsOnTop!"
			case TabsOnTopAndBottom!
				ls_temstr = "TabsOnTopAndBottom!"
				
			case else
				ls_temstr = "Unknown!"	
		end choose	
		
	case "UserObjects"
		choose case aenu_type
			case CustomVisual!
				ls_temstr = "CustomVisual!"	
			case ExternalVisual!
				ls_temstr = "ExternalVisual!"	
			case VBXVisual!
				ls_temstr = "VBXVisual!"	
			case else
				ls_temstr = "Unknown!"		
		end choose
	case else
	   ls_temstr = "Unknown!"	
	
end choose



return ls_temstr
end function

public function string of_prac_getproperties (powerobject aobj_name, string as_prolist);string ls_pro
object type_obj

if not IsValid (aobj_name) then
	//MessageBox("Information","The object is not valid!")
	return "The object is not valid or expression is error!"
end if

type_obj = aobj_name.TypeOf()


CHOOSE CASE type_obj
		
CASE CheckBox!	
	  ls_pro = of_prac_checkbox(aobj_name,as_prolist)
CASE CommandButton!
	  ls_pro = of_prac_commandbutton(aobj_name,as_prolist)
CASE DataWindow!	
	  ls_pro = of_prac_DataWindow(aobj_name,as_prolist)
CASE DataStore!	
	  ls_pro = of_prac_DataStore(aobj_name,as_prolist)	  
CASE DropDownListBox!
	  ls_pro = of_prac_DropDownListBox(aobj_name,as_prolist)
CASE DropDownPictureListBox!
	  ls_pro = of_prac_DropDownPictureListBox(aobj_name,as_prolist)
CASE EditMask!
	  ls_pro = of_prac_EditMask(aobj_name,as_prolist)
CASE GroupBox!
	  ls_pro = of_prac_GroupBox(aobj_name,as_prolist)
CASE Graph!
//	  ls_pro = of_prac_Graph(aobj_name,as_prolist)
CASE HTrackBar!	
	  ls_pro = of_prac_HTrackBar(aobj_name,as_prolist)
CASE HScrollBar!	
	  ls_pro = of_prac_HScrollBar(aobj_name,as_prolist)	  
CASE HProgressBar!	
	  ls_pro = of_prac_hprogressbar(aobj_name,as_prolist)
CASE Line!
	  ls_pro = of_prac_Line(aobj_name,as_prolist)
CASE ListBox!
	  ls_pro = of_prac_ListBox(aobj_name,as_prolist)	
CASE ListView!
	  ls_pro = of_prac_ListView(aobj_name,as_prolist)	
CASE MultiLineEdit!	
	ls_pro = of_prac_MultiLineEdit(aobj_name,as_prolist)
CASE OLECustomControl!	
//	  ls_pro = of_prac_OLECustomControl(aobj_name,as_prolist)
CASE Oval!	
	  ls_pro = of_prac_Oval(aobj_name,as_prolist)	
CASE OLEControl!	
//	  ls_pro = of_prac_OLEControl(aobj_name,as_prolist)
CASE Picture!
	  ls_pro = of_prac_Picture(aobj_name,as_prolist)	
CASE PictureHyperLink!
	  ls_pro = of_prac_PictureHyperLink(aobj_name,as_prolist)	  
CASE PictureButton!
	  ls_pro = of_prac_PictureButton(aobj_name,as_prolist)		
CASE PictureListBox!
	  ls_pro = of_prac_PictureListBox(aobj_name,as_prolist)	
CASE RadioButton!	
	  ls_pro = of_prac_RadioButton(aobj_name,as_prolist)	
CASE Rectangle!	
	  ls_pro = of_prac_Rectangle(aobj_name,as_prolist)	
CASE RichTextEdit!
	  ls_pro = of_prac_RichTextEdit(aobj_name,as_prolist)
CASE RoundRectangle!	
	  ls_pro = of_prac_RoundRectangle(aobj_name,as_prolist)	
CASE SingleLineEdit!	
	  ls_pro = of_prac_SingleLineEdit(aobj_name,as_prolist)	
CASE StaticText!	
	  ls_pro = of_prac_StaticText(aobj_name,as_prolist)	
CASE StaticHyperLink!	
	  ls_pro = of_prac_StaticHyperLink(aobj_name,as_prolist)
CASE Tab!
	  ls_pro = of_prac_Tab(aobj_name,as_prolist)
CASE TreeView!	
	  ls_pro = of_prac_TreeView(aobj_name,as_prolist)	
CASE UserObject!
	  ls_pro = of_prac_userobject(aobj_name,as_prolist)
CASE VScrollBar!
	  ls_pro = of_prac_VScrollBar(aobj_name,as_prolist)	
CASE VTrackBar!	
	  ls_pro = of_prac_vTrackBar(aobj_name,as_prolist)
CASE VProgressBar!	
	  ls_pro = of_prac_vprogressbar(aobj_name,as_prolist)
CASE ELSE
END CHOOSE

return ls_pro
end function

public function string of_prac_checkbox (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
checkbox cbx_name

cbx_name = aobj_name


choose case lower(as_pname)
   case "automatic"
      ls_pro = string(cbx_name.Automatic)
   case "backcolor"
      ls_pro = string(cbx_name.BackColor)
   case "borderstyle"
		
		any_temp = cbx_name.BorderStyle
      ls_pro = of_enutostring(any_temp, "BorderStyle")
		
   case "bringtotop"
      ls_pro = string(cbx_name.BringToTop)
   case "checked"
      ls_pro = string(cbx_name.Checked)
   case "classdefinition"
      ls_pro = string(cbx_name.ClassDefinition)
   case "dragauto"
      ls_pro = string(cbx_name.DragAuto)
   case "dragicon"
      ls_pro = string(cbx_name.DragIcon)
   case "enabled"
      ls_pro = string(cbx_name.Enabled)
   case "facename"
      ls_pro = string(cbx_name.FaceName)
   case "fontcharset"
		
		any_temp = cbx_name.FontCharSet
      ls_pro = of_enutostring(any_temp, "FontCharSet")
   case "fontfamily"
		
		any_temp = cbx_name.FontFamily
      ls_pro = of_enutostring(any_temp, "FontFamily")
   case "fontpitch"
		
		any_temp = cbx_name.FontPitch
      ls_pro = of_enutostring(any_temp, "FontPitch")
		
   case "height"
      ls_pro = string(cbx_name.Height)
   case "italic"
      ls_pro = string(cbx_name.Italic)
   case "lefttext"
      ls_pro = string(cbx_name.LeftText)
   case "pointer"
      ls_pro = string(cbx_name.Pointer)
   case "righttoleft"
      ls_pro = string(cbx_name.RightToLeft)
   case "taborder"
      ls_pro = string(cbx_name.TabOrder)
   case "tag"
      ls_pro = string(cbx_name.Tag)
   case "text"
      ls_pro = string(cbx_name.Text)
   case "textcolor"
      ls_pro = string(cbx_name.TextColor)
   case "textsize"
      ls_pro = string(cbx_name.TextSize)
   case "thirdstate"
      ls_pro = string(cbx_name.ThirdState)
   case "threestate"
      ls_pro = string(cbx_name.ThreeState)
   case "underline"
      ls_pro = string(cbx_name.Underline)
   case "visible"
      ls_pro = string(cbx_name.Visible)
   case "weight"
      ls_pro = string(cbx_name.Weight)
   case "width"
      ls_pro = string(cbx_name.Width)
   case "x"
      ls_pro = string(cbx_name.X)
   case "y"
      ls_pro = string(cbx_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_multilineedit (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
MultiLineEdit    Mle_name
Mle_name = aobj_name
int i,j

choose case lower(as_pname) 
   case "accelerator"
      ls_pro = string(Mle_name.Accelerator)
   case "alignment"
		
		any_temp = Mle_name.Alignment
	   ls_pro = of_enutostring(any_temp, "Alignment")
      
   case "autohscroll"
      ls_pro = string(Mle_name.AutoHScroll)
   case "autovscroll"
      ls_pro = string(Mle_name.AutoVScroll)
   case "backcolor"
      ls_pro = string(Mle_name.BackColor)
   case "border"
      ls_pro = string(Mle_name.Border)
   case "borderstyle"

	   any_temp = Mle_name.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(Mle_name.BringToTop)
   case "classdefinition"
      ls_pro = string(Mle_name.ClassDefinition)
   case "displayonly"
      ls_pro = string(Mle_name.DisplayOnly)
   case "dragauto"
      ls_pro = string(Mle_name.DragAuto)
   case "dragicon"
      ls_pro = string(Mle_name.DragIcon)
   case "enabled"
      ls_pro = string(Mle_name.Enabled)
   case "facename"
      ls_pro = string(Mle_name.FaceName)
   case "fontcharset"

	   any_temp = Mle_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = Mle_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = Mle_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(Mle_name.Height)
   case "hideselection"
      ls_pro = string(Mle_name.HideSelection)
   case "hscrollbar"
      ls_pro = string(Mle_name.HScrollBar)
   case "ignoredefaultbutton"
      ls_pro = string(Mle_name.IgnoreDefaultButton)
   case "imemode"
      ls_pro = string(Mle_name.ImeMode)
   case "italic"
      ls_pro = string(Mle_name.Italic)
   case "limit"
      ls_pro = string(Mle_name.Limit)
   case "pointer"
      ls_pro = string(Mle_name.Pointer)
   case "righttoleft"
      ls_pro = string(Mle_name.RightToLeft)
   case "taborder"
      ls_pro = string(Mle_name.TabOrder)
   case "tabstop[ ]","tabstop[]"
		
		j = upperbound(Mle_name.TabStop[ ])
      for i = 1 to j
	      ls_pro +=string(Mle_name.TabStop[i]) +";"
      next 

   case "tag"
      ls_pro = string(Mle_name.Tag)
   case "text"
      ls_pro = string(Mle_name.Text)
   case "textcase"
		
		any_temp = Mle_name.TextCase
	   ls_pro = of_enutostring(any_temp, "TextCase")
      
   case "textcolor"
      ls_pro = string(Mle_name.TextColor)
   case "textsize"
      ls_pro = string(Mle_name.TextSize)
   case "underline"
      ls_pro = string(Mle_name.Underline)
   case "visible"
      ls_pro = string(Mle_name.Visible)
   case "vscrollbar"
      ls_pro = string(Mle_name.VScrollBar)
   case "weight"
      ls_pro = string(Mle_name.Weight)
   case "width"
      ls_pro = string(Mle_name.Width)
   case "x"
      ls_pro = string(Mle_name.X)
   case "y"
      ls_pro = string(Mle_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_getpracticevalue (window aw_name, string as_prolist);string ls_pro,ls_objpro
string ls_objandpro,ls_objname,ls_proname
int li_pos,li_posdot
int i,li_count
string ls_tabobjname,ls_tabpro
powerobject lobj_tab

as_prolist = trim(as_prolist)
if as_prolist = "" or as_prolist = ";" or  isnull(as_prolist) then
	return ""
end if

if right(as_prolist,1)<>";" then as_prolist +=";"
if left(as_prolist,1) = ";" then as_prolist = mid(as_prolist,2)

iobj_control = aw_name.control[]

li_count = upperbound(iobj_control)

li_pos = 1
do while li_pos >= 1
	li_pos = pos(as_prolist,";")
	ls_objpro = ""
	if li_pos >= 1 then
		ls_objandpro = left(as_prolist,li_pos - 1)
		as_prolist = mid(as_prolist,li_pos + 1)
		
		li_posdot = pos(ls_objandpro,".")
		ls_objname = trim(left(ls_objandpro, li_posdot - 1))
		ls_proname = trim(mid(ls_objandpro, li_posdot + 1))
	
	
	for i = 1 to li_count 
		 if iobj_control[i].classname() = ls_objname then
			//messagebox("ls_objname = "+ ls_objname,"ls_proname = "+ ls_proname)
			choose case iobj_control[i].typeof()
				case Tab!
					ls_tabpro = of_get_objandProname(ls_objname + "." + ls_proname,ls_tabobjname)
					lobj_tab = of_get_tabobject(iobj_control[i],ls_tabobjname)
					ls_objpro = ls_objandpro + " = " + of_prac_getproperties(lobj_tab , ls_tabpro) + "~r~n"
			   case Userobject!
					ls_tabpro = of_get_objandProname(ls_objname + "." + ls_proname,ls_tabobjname)
					lobj_tab = of_get_userobject(iobj_control[i],ls_tabobjname)
					ls_objpro = ls_objandpro + " = " + of_prac_getproperties(lobj_tab , ls_tabpro) + "~r~n"
			   case else					
			      ls_objpro = ls_objandpro + " = " + of_prac_getproperties(iobj_control[i] , ls_proname) + "~r~n"
		   end choose
			i = li_count //
	     end if
	next
	
	 if ls_objpro = ""  or isnull(ls_objpro) then
		   ls_objpro = ls_objandpro + " =  The object is not valid or expression is error!" + "~r~n"
	 end if
	
	end if
	
	ls_pro += ls_objpro
loop

return ls_pro

end function

public function string of_prac_commandbutton (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
Commandbutton    Cb_name

Cb_name = aobj_name

choose case lower(as_pname) 
   case "bringtotop"
      ls_pro = string(Cb_name.BringToTop)
   case "cancel"
      ls_pro = string(Cb_name.Cancel)
   case "classdefinition"
      ls_pro = string(Cb_name.ClassDefinition)
   case "default"
      ls_pro = string(Cb_name.Default)
   case "dragauto"
      ls_pro = string(Cb_name.DragAuto)
   case "dragicon"
      ls_pro = string(Cb_name.DragIcon)
   case "enabled"
      ls_pro = string(Cb_name.Enabled)
   case "facename"
      ls_pro = string(Cb_name.FaceName)
   case "fontcharset"

	   any_temp = Cb_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = Cb_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = Cb_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(Cb_name.Height)
   case "italic"
      ls_pro = string(Cb_name.Italic)
   case "pointer"
      ls_pro = string(Cb_name.Pointer)
   case "taborder"
      ls_pro = string(Cb_name.TabOrder)
   case "tag"
      ls_pro = string(Cb_name.Tag)
   case "text"
      ls_pro = string(Cb_name.Text)
   case "textsize"
      ls_pro = string(Cb_name.TextSize)
   case "underline"
      ls_pro = string(Cb_name.Underline)
   case "visible"
      ls_pro = string(Cb_name.Visible)
   case "weight"
      ls_pro = string(Cb_name.Weight)
   case "width"
      ls_pro = string(Cb_name.Width)
   case "x"
      ls_pro = string(Cb_name.X)
   case "y"
      ls_pro = string(Cb_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_dropdownlistbox (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
DropDownListBox    ddlb_name
int i,j
ddlb_name = aobj_name

choose case lower(as_pname)
   case "accelerator"
      ls_pro = string(ddlb_name.Accelerator)
   case "allowedit"
      ls_pro = string(ddlb_name.AllowEdit)
   case "autohscroll"
      ls_pro = string(ddlb_name.AutoHScroll)
   case "backcolor"
      ls_pro = string(ddlb_name.BackColor)
   case "border"
      ls_pro = string(ddlb_name.Border)
   case "borderstyle"

	   any_temp = ddlb_name.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(ddlb_name.BringToTop)
   case "classdefinition"
      ls_pro = string(ddlb_name.ClassDefinition)
   case "dragauto"
      ls_pro = string(ddlb_name.DragAuto)
   case "dragicon"
      ls_pro = string(ddlb_name.DragIcon)
   case "enabled"
      ls_pro = string(ddlb_name.Enabled)
   case "facename"
      ls_pro = string(ddlb_name.FaceName)
   case "fontcharset"

	   any_temp = ddlb_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = ddlb_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = ddlb_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(ddlb_name.Height)
   case "hscrollbar"
      ls_pro = string(ddlb_name.HScrollBar)
   case "imemode"
      ls_pro = string(ddlb_name.ImeMode)
   case "italic"
      ls_pro = string(ddlb_name.Italic)
   case "item[ ]","item[]"
		
		j = upperbound(ddlb_name.Item[ ])
      for i = 1 to j
	      ls_pro +=ddlb_name.item[i] +";"
      next 
		
   case "limit"
      ls_pro = string(ddlb_name.Limit)
   case "pointer"
      ls_pro = string(ddlb_name.Pointer)
   case "righttoleft"
      ls_pro = string(ddlb_name.RightToLeft)
   case "showlist"
      ls_pro = string(ddlb_name.ShowList)
   case "sorted"
      ls_pro = string(ddlb_name.Sorted)
   case "taborder"
      ls_pro = string(ddlb_name.TabOrder)
   case "tag"
      ls_pro = string(ddlb_name.Tag)
   case "text"
      ls_pro = string(ddlb_name.Text)
   case "textcolor"
      ls_pro = string(ddlb_name.TextColor)
   case "textsize"
      ls_pro = string(ddlb_name.TextSize)
   case "underline"
      ls_pro = string(ddlb_name.Underline)
   case "visible"
      ls_pro = string(ddlb_name.Visible)
   case "vscrollbar"
      ls_pro = string(ddlb_name.VScrollBar)
   case "weight"
      ls_pro = string(ddlb_name.Weight)
   case "width"
      ls_pro = string(ddlb_name.Width)
   case "x"
      ls_pro = string(ddlb_name.X)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_dropdownpicturelistbox (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
dropdownpicturelistbox    ddplb_name
int i,j
ddplb_name = aobj_name

choose case lower(as_pname) 
   case "accelerator"
      ls_pro = string(ddplb_name.Accelerator)
   case "allowedit"
      ls_pro = string(ddplb_name.AllowEdit)
   case "autohscroll"
      ls_pro = string(ddplb_name.AutoHScroll)
   case "backcolor"
      ls_pro = string(ddplb_name.BackColor)
   case "border"
      ls_pro = string(ddplb_name.Border)
   case "borderstyle"

	   any_temp = ddplb_name.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(ddplb_name.BringToTop)
   case "classdefinition"
      ls_pro = string(ddplb_name.ClassDefinition)
   case "dragauto"
      ls_pro = string(ddplb_name.DragAuto)
   case "dragicon"
      ls_pro = string(ddplb_name.DragIcon)
   case "enabled"
      ls_pro = string(ddplb_name.Enabled)
   case "facename"
      ls_pro = string(ddplb_name.FaceName)
   case "fontcharset"

	   any_temp = ddplb_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = ddplb_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = ddplb_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(ddplb_name.Height)
   case "hscrollbar"
      ls_pro = string(ddplb_name.HScrollBar)
   case "imemode"
      ls_pro = string(ddplb_name.ImeMode)
   case "italic"
      ls_pro = string(ddplb_name.Italic)
   case "item[ ]","item[]"
		
		j = upperbound(ddplb_name.Item[ ])
      for i = 1 to j
	      ls_pro +=ddplb_name.item[i] +";"
      next 		
      
   case "itempictureindex[ ]","itempictureindex[]"
		
		j = upperbound(ddplb_name.ItemPictureIndex[ ])
      for i = 1 to j
	      ls_pro +=string(ddplb_name.ItemPictureIndex[i]) +";"
      next 
		
      //ls_pro = string(ddplb_name.ItemPictureIndex[ ])
   case "limit"
      ls_pro = string(ddplb_name.Limit)
   case "pictureheight"
      ls_pro = string(ddplb_name.PictureHeight)
   case "picturewidth"
      ls_pro = string(ddplb_name.PictureWidth)
   case "picturemaskcolor"
      ls_pro = string(ddplb_name.PictureMaskColor)
   case "picturename[ ]","picturename[]"
		
		j = upperbound(ddplb_name.PictureName[ ])
      for i = 1 to j
	      ls_pro +=ddplb_name.PictureName[i] +";"
      next 
      //ls_pro = string(ddplb_name.PictureName[ ])
		
   case "pointer"
      ls_pro = string(ddplb_name.Pointer)
   case "righttoleft"
      ls_pro = string(ddplb_name.RightToLeft)
   case "showlist"
      ls_pro = string(ddplb_name.ShowList)
   case "sorted"
      ls_pro = string(ddplb_name.Sorted)
   case "taborder"
      ls_pro = string(ddplb_name.TabOrder)
   case "tag"
      ls_pro = string(ddplb_name.Tag)
   case "text"
      ls_pro = string(ddplb_name.Text)
   case "textcolor"
      ls_pro = string(ddplb_name.TextColor)
   case "textsize"
      ls_pro = string(ddplb_name.TextSize)
   case "underline"
      ls_pro = string(ddplb_name.Underline)
   case "visible"
      ls_pro = string(ddplb_name.Visible)
   case "vscrollbar"
      ls_pro = string(ddplb_name.VScrollBar)
   case "weight"
      ls_pro = string(ddplb_name.Weight)
   case "width"
      ls_pro = string(ddplb_name.Width)
   case "x"
      ls_pro = string(ddplb_name.X)
   case "y"
      ls_pro = string(ddplb_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_editmask (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
EditMask    em_name
int i,j
em_name = aobj_name

choose case lower(as_pname) 
   case "accelerator"
      ls_pro = string(em_name.Accelerator)
   case "alignment"
		
		any_temp = em_name.Alignment
	   ls_pro = of_enutostring(any_temp, "Alignment")
      
   case "autohscroll"
      ls_pro = string(em_name.AutoHScroll)
   case "autoskip"
      ls_pro = string(em_name.AutoSkip)
   case "autovscroll"
      ls_pro = string(em_name.AutoVScroll)
   case "backcolor"
      ls_pro = string(em_name.BackColor)
   case "border"
      ls_pro = string(em_name.Border)
   case "borderstyle"

	   any_temp = em_name.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(em_name.BringToTop)
   case "classdefinition"
      ls_pro = string(em_name.ClassDefinition)
   case "displaydata"
      ls_pro = string(em_name.DisplayData)
   case "displayonly"
      ls_pro = string(em_name.DisplayOnly)
   case "dragauto"
      ls_pro = string(em_name.DragAuto)
   case "dragicon"
      ls_pro = string(em_name.DragIcon)
   case "enabled"
      ls_pro = string(em_name.Enabled)
   case "facename"
      ls_pro = string(em_name.FaceName)
   case "fontcharset"

	   any_temp = em_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = em_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = em_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(em_name.Height)
   case "hscrollbar"
      ls_pro = string(em_name.HScrollBar)
   case "hideselection"
      ls_pro = string(em_name.HideSelection)
   case "ignoredefaultbutton"
      ls_pro = string(em_name.IgnoreDefaultButton)
   case "imemode"
      ls_pro = string(em_name.ImeMode)
   case "increment"
      ls_pro = string(em_name.Increment)
   case "italic"
      ls_pro = string(em_name.Italic)
   case "limit"
      ls_pro = string(em_name.Limit)
   case "mask"
      ls_pro = string(em_name.Mask)
   case "maskdatatype"
		
		any_temp = em_name.MaskDataType
	   ls_pro = of_enutostring(any_temp, "MaskDataType")
      
   case "minmax"
      ls_pro = string(em_name.MinMax)
   case "pointer"
      ls_pro = string(em_name.Pointer)
   case "righttoleft"
      ls_pro = string(em_name.RightToLeft)
   case "spin"
      ls_pro = string(em_name.Spin)
   case "taborder"
      ls_pro = string(em_name.TabOrder)
   case "tabstop[ ]","tabstop[]"
		
		j = upperbound(em_name.TabStop[ ])
      for i = 1 to j
	      ls_pro +=string(em_name.TabStop[i]) +";"
      next 
		
      //ls_pro = string(em_name.TabStop[ ])
   case "tag"
      ls_pro = string(em_name.Tag)
   case "text"
      ls_pro = string(em_name.Text)
   case "textcolor"
      ls_pro = string(em_name.TextColor)
   case "textcase"
		
		any_temp = em_name.TextCase
	   ls_pro = of_enutostring(any_temp, "TextCase")		
      
   case "textsize"
      ls_pro = string(em_name.TextSize)
   case "underline"
      ls_pro = string(em_name.Underline)
   case "usecodetable"
      ls_pro = string(em_name.UseCodeTable)
   case "visible"
      ls_pro = string(em_name.Visible)
   case "vscrollbar"
      ls_pro = string(em_name.VScrollBar)
   case "weight"
      ls_pro = string(em_name.Weight)
   case "width"
      ls_pro = string(em_name.Width)
   case "x"
      ls_pro = string(em_name.X)
   case "y"
      ls_pro = string(em_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_groupbox (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
GroupBox    gb_name

gb_name = aobj_name

choose case lower(as_pname)
   case "backcolor"
      ls_pro = string(gb_name.BackColor)
   case "borderstyle"

	   any_temp = gb_name.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(gb_name.BringToTop)
   case "classdefinition"
      ls_pro = string(gb_name.ClassDefinition)
   case "dragauto"
      ls_pro = string(gb_name.DragAuto)
   case "dragicon"
      ls_pro = string(gb_name.DragIcon)
   case "enabled"
      ls_pro = string(gb_name.Enabled)
   case "facename"
      ls_pro = string(gb_name.FaceName)
   case "fontcharset"

	   any_temp = gb_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = gb_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = gb_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(gb_name.Height)
   case "italic"
      ls_pro = string(gb_name.Italic)
   case "pointer"
      ls_pro = string(gb_name.Pointer)
   case "righttoleft"
      ls_pro = string(gb_name.RightToLeft)
   case "taborder"
      ls_pro = string(gb_name.TabOrder)
   case "tag"
      ls_pro = string(gb_name.Tag)
   case "text"
      ls_pro = string(gb_name.Text)
   case "textcolor"
      ls_pro = string(gb_name.TextColor)
   case "textsize"
      ls_pro = string(gb_name.TextSize)
   case "underline"
      ls_pro = string(gb_name.Underline)
   case "visible"
      ls_pro = string(gb_name.Visible)
   case "weight"
      ls_pro = string(gb_name.Weight)
   case "width"
      ls_pro = string(gb_name.Width)
   case "x"
      ls_pro = string(gb_name.X)
   case "y"
      ls_pro = string(gb_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_hscrollbar (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
HScrollBar    hsb_name
hsb_name = aobj_name


choose case lower(as_pname) 
   case "bringtotop"
      ls_pro = string(hsb_name.BringToTop)
   case "classdefinition"
      ls_pro = string(hsb_name.ClassDefinition)
   case "dragauto"
      ls_pro = string(hsb_name.DragAuto)
   case "dragicon"
      ls_pro = string(hsb_name.DragIcon)
   case "height"
      ls_pro = string(hsb_name.Height)
   case "maxposition"
      ls_pro = string(hsb_name.MaxPosition)
   case "minposition"
      ls_pro = string(hsb_name.MinPosition)
   case "pointer"
      ls_pro = string(hsb_name.Pointer)
   case "position"
      ls_pro = string(hsb_name.Position)
   case "stdheight"
      ls_pro = string(hsb_name.StdHeight)
   case "taborder"
      ls_pro = string(hsb_name.TabOrder)
   case "tag"
      ls_pro = string(hsb_name.Tag)
   case "visible"
      ls_pro = string(hsb_name.Visible)
   case "width"
      ls_pro = string(hsb_name.Width)
   case "x"
      ls_pro = string(hsb_name.X)
   case "y"
      ls_pro = string(hsb_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_line (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
Line    ln_name

ln_name = aobj_name

choose case lower(as_pname) 
   case "beginx"
      ls_pro = string(ln_name.BeginX)
   case "beginy"
      ls_pro = string(ln_name.BeginY)
   case "classdefinition"
      ls_pro = string(ln_name.ClassDefinition)
   case "endx"
      ls_pro = string(ln_name.EndX)
   case "endy"
      ls_pro = string(ln_name.EndY)
   case "linecolor"
      ls_pro = string(ln_name.LineColor)
   case "linestyle"
		
		any_temp = ln_name.LineStyle
		ls_pro = of_enutostring(any_temp, "LineStyle")
      
   case "linethickness"
      ls_pro = string(ln_name.LineThickness)
   case "tag"
      ls_pro = string(ln_name.Tag)
   case "visible"
      ls_pro = string(ln_name.Visible)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_listbox (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
ListBox    lb_name
int i,j
lb_name = aobj_name

choose case lower(as_pname) 
   case "accelerator"
      ls_pro = string(lb_name.Accelerator)
   case "backcolor"
      ls_pro = string(lb_name.BackColor)
   case "border"
      ls_pro = string(lb_name.Border)
   case "borderstyle"

	   any_temp = lb_name.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(lb_name.BringToTop)
   case "classdefinition"
      ls_pro = string(lb_name.ClassDefinition)
   case "disablenoscroll"
      ls_pro = string(lb_name.DisableNoScroll)
   case "dragauto"
      ls_pro = string(lb_name.DragAuto)
   case "dragicon"
      ls_pro = string(lb_name.DragIcon)
   case "enabled"
      ls_pro = string(lb_name.Enabled)
   case "extendedselect"
      ls_pro = string(lb_name.ExtendedSelect)
   case "facename"
      ls_pro = string(lb_name.FaceName)
   case "fontcharset"

	   any_temp = lb_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = lb_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = lb_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(lb_name.Height)
   case "hscrollbar"
      ls_pro = string(lb_name.HScrollBar)
   case "italic"
      ls_pro = string(lb_name.Italic)
   case "item[ ]","item[]"
		
		j = upperbound(lb_name.Item[ ])
      for i = 1 to j
	      ls_pro +=string(lb_name.Item[i]) +";"
      next 
		
      //ls_pro = string(lb_name.Item[ ])
   case "multiselect"
      ls_pro = string(lb_name.MultiSelect)
   case "pointer"
      ls_pro = string(lb_name.Pointer)
   case "righttoleft"
      ls_pro = string(lb_name.RightToLeft)
   case "sorted"
      ls_pro = string(lb_name.Sorted)
   case "taborder"
      ls_pro = string(lb_name.TabOrder)
   case "tabstop[ ]","tabstop[]"
		
		j = upperbound(lb_name.TabStop[ ])
      for i = 1 to j
	      ls_pro +=string(lb_name.TabStop[i]) +";"
      next 
		
      //ls_pro = string(lb_name.TabStop[ ])
   case "tag"
      ls_pro = string(lb_name.Tag)
   case "textcolor"
      ls_pro = string(lb_name.TextColor)
   case "textsize"
      ls_pro = string(lb_name.TextSize)
   case "underline"
      ls_pro = string(lb_name.Underline)
   case "visible"
      ls_pro = string(lb_name.Visible)
   case "vscrollbar"
      ls_pro = string(lb_name.VScrollBar)
   case "weight"
      ls_pro = string(lb_name.Weight)
   case "width"
      ls_pro = string(lb_name.Width)
   case "x"
      ls_pro = string(lb_name.X)
   case "y"
      ls_pro = string(lb_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_listview (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
ListView    Lv_name
int i,j
Lv_name = aobj_name

choose case lower(as_pname) 
   case "accelerator"
      ls_pro = string(Lv_name.Accelerator)
   case "autoarrange"
      ls_pro = string(Lv_name.AutoArrange)
   case "backcolor"
      ls_pro = string(Lv_name.BackColor)
   case "border"
      ls_pro = string(Lv_name.Border)
   case "borderstyle"

	   any_temp = Lv_name.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(Lv_name.BringToTop)
   case "buttonheader"
      ls_pro = string(Lv_name.ButtonHeader)
   case "checkboxes"
      ls_pro = string(Lv_name.CheckBoxes)
   case "classdefinition"
      ls_pro = string(Lv_name.ClassDefinition)
   case "deleteitems"
      ls_pro = string(Lv_name.DeleteItems)
   case "dragauto"
      ls_pro = string(Lv_name.DragAuto)
   case "dragicon"
      ls_pro = string(Lv_name.DragIcon)
   case "editlabels"
      ls_pro = string(Lv_name.EditLabels)
   case "enabled"
      ls_pro = string(Lv_name.Enabled)
   case "extendedselect"
      ls_pro = string(Lv_name.ExtendedSelect)
   case "facename"
      ls_pro = string(Lv_name.FaceName)
   case "fixedlocations"
      ls_pro = string(Lv_name.FixedLocations)
   case "fontcharset"

	   any_temp = Lv_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = Lv_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = Lv_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "fullrowselect"
      ls_pro = string(Lv_name.FullRowSelect)
   case "gridlines"
      ls_pro = string(Lv_name.GridLines)
   case "headerdragdrop"
      ls_pro = string(Lv_name.HeaderDragDrop)
   case "height"
      ls_pro = string(Lv_name.Height)
   case "hideselection"
      ls_pro = string(Lv_name.HideSelection)
   case "imemode"
      ls_pro = string(Lv_name.ImeMode)
   case "italic"
      ls_pro = string(Lv_name.Italic)
   case "item[ ]","item[]"
		
		j = upperbound(Lv_name.Item[ ])
      for i = 1 to j
	      ls_pro +=string(Lv_name.Item[i]) +";"
      next 
      //ls_pro = string(Lv_name.Item[ ])
   case "itempictureindex[ ]"
		
		j = upperbound(Lv_name.ItemPictureIndex[ ])
      for i = 1 to j
	      ls_pro +=string(Lv_name.ItemPictureIndex[i]) +";"
      next 
		
      //ls_pro = string(Lv_name.ItemPictureIndex[ ])
   case "labelwrap"
      ls_pro = string(Lv_name.LabelWrap)
   case "largepictureheight"
      ls_pro = string(Lv_name.LargePictureHeight)
   case "largepicturemaskcolor"
      ls_pro = string(Lv_name.LargePictureMaskColor)
   case "largepicturename[ ]"
		
		j = upperbound(Lv_name.LargePictureName[ ])
      for i = 1 to j
	      ls_pro +=string(Lv_name.LargePictureName[i]) +";"
      next 
		
      //ls_pro = string(Lv_name.LargePictureName[ ])
   case "largepicturewidth"
      ls_pro = string(Lv_name.LargePictureWidth)
   case "oneclickactivate"
      ls_pro = string(Lv_name.OneClickActivate)
   case "pointer"
      ls_pro = string(Lv_name.Pointer)
   case "scrolling"
      ls_pro = string(Lv_name.Scrolling)
   case "showheader"
      ls_pro = string(Lv_name.ShowHeader)
   case "smallpictureheight"
      ls_pro = string(Lv_name.SmallPictureHeight)
   case "smallpicturemaskcolor"
      ls_pro = string(Lv_name.SmallPictureMaskColor)
   case "smallpicturename[ ]","smallpicturename[]"
		
		j = upperbound(Lv_name.SmallPictureName[ ])
      for i = 1 to j
	      ls_pro +=string(Lv_name.SmallPictureName[i]) +";"
      next 
		
      //ls_pro = string(Lv_name.SmallPictureName[ ])
   case "smallpicturewidth"
      ls_pro = string(Lv_name.SmallPictureWidth)
   case "sorttype"
		
		any_temp = Lv_name.SortType
	   ls_pro = of_enutostring(any_temp, "grSortType")
      
   case "statepictureheight"
      ls_pro = string(Lv_name.StatePictureHeight)
   case "statepicturemaskcolor"
      ls_pro = string(Lv_name.StatePictureMaskColor)
   case "statepicturename[ ]","statepicturename[]"
		
		j = upperbound(Lv_name.StatePictureName[ ])
      for i = 1 to j
	      ls_pro +=string(Lv_name.StatePictureName[i]) +";"
      next 
      //ls_pro = string(Lv_name.StatePictureName[ ])
   case "statepicturewidth"
      ls_pro = string(Lv_name.StatePictureWidth)
   case "taborder"
      ls_pro = string(Lv_name.TabOrder)
   case "tag"
      ls_pro = string(Lv_name.Tag)
   case "textcolor"
      ls_pro = string(Lv_name.TextColor)
   case "textsize"
      ls_pro = string(Lv_name.TextSize)
   case "trackselect"
      ls_pro = string(Lv_name.TrackSelect)
   case "twoclickactivate"
      ls_pro = string(Lv_name.TwoClickActivate)
   case "underline"
      ls_pro = string(Lv_name.Underline)
   case "underlinecold"
      ls_pro = string(Lv_name.UnderlineCold)
   case "underlinehot"
      ls_pro = string(Lv_name.UnderlineHot)
   case "view"
      ls_pro = string(Lv_name.View)
   case "visible"
      ls_pro = string(Lv_name.Visible)
   case "weight"
      ls_pro = string(Lv_name.Weight)
   case "width"
      ls_pro = string(Lv_name.Width)
   case "x"
      ls_pro = string(Lv_name.X)
   case "y"
      ls_pro = string(Lv_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_olecustomcontrol (ref powerobject aobj_name, string as_pname);string ls_pro

return ls_pro
end function

public function string of_prac_oval (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
Oval    Ov_name
Ov_name = aobj_name

choose case lower(as_pname) 
   case "fillcolor"
      ls_pro = string(Ov_name.FillColor)
   case "fillpattern"
		
		any_temp = Ov_name.FillPattern
      ls_pro = of_enutostring(any_temp, "FillPattern")
		
   case "height"
      ls_pro = string(Ov_name.Height)
   case "linecolor"
      ls_pro = string(Ov_name.LineColor)
   case "linestyle"
		
		any_temp = Ov_name.LineStyle
      ls_pro = of_enutostring(any_temp, "LineStyle")
      
   case "linethickness"
      ls_pro = string(Ov_name.LineThickness)
   case "tag"
      ls_pro = string(Ov_name.Tag)
   case "visible"
      ls_pro = string(Ov_name.Visible)
   case "width"
      ls_pro = string(Ov_name.Width)
   case "x"
      ls_pro = string(Ov_name.X)
   case "y"
      ls_pro = string(Ov_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_olecontrol (ref powerobject aobj_name, string as_pname);string ls_pro

return ls_pro
end function

public function string of_prac_picture (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
Picture    P_name
P_name = aobj_name

choose case lower(as_pname) 
   case "border"
      ls_pro = string(P_name.Border)
   case "borderstyle"

	   any_temp = P_name.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(P_name.BringToTop)
   case "classdefinition"
      ls_pro = string(P_name.ClassDefinition)
   case "dragauto"
      ls_pro = string(P_name.DragAuto)
   case "dragicon"
      ls_pro = string(P_name.DragIcon)
   case "enabled"
      ls_pro = string(P_name.Enabled)
   case "focusrectangle"
      ls_pro = string(P_name.FocusRectangle)
   case "height"
      ls_pro = string(P_name.Height)
   case "invert"
      ls_pro = string(P_name.Invert)
   case "map3dcolors"
      ls_pro = string(P_name.Map3DColors)
   case "originalsize"
      ls_pro = string(P_name.OriginalSize)
   case "picturename"
      ls_pro = string(P_name.PictureName)
   case "pointer"
      ls_pro = string(P_name.Pointer)
   case "powertiptext"
      ls_pro = string(P_name.PowerTipText)
   case "taborder"
      ls_pro = string(P_name.TabOrder)
   case "tag"
      ls_pro = string(P_name.Tag)
   case "visible"
      ls_pro = string(P_name.Visible)
   case "width"
      ls_pro = string(P_name.Width)
   case "x"
      ls_pro = string(P_name.X)
   case "y"
      ls_pro = string(P_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_picturebutton (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
PictureButton    Pb_name
Pb_name = aobj_name

choose case lower(as_pname) 
   case "bringtotop"
      ls_pro = string(Pb_name.BringToTop)
   case "cancel"
      ls_pro = string(Pb_name.Cancel)
   case "classdefinition"
      ls_pro = string(Pb_name.ClassDefinition)
   case "default"
      ls_pro = string(Pb_name.Default)
   case "disabledname"
      ls_pro = string(Pb_name.DisabledName)
   case "dragauto"
      ls_pro = string(Pb_name.DragAuto)
   case "dragicon"
      ls_pro = string(Pb_name.DragIcon)
   case "enabled"
      ls_pro = string(Pb_name.Enabled)
   case "facename"
      ls_pro = string(Pb_name.FaceName)
   case "fontcharset"

	   any_temp = Pb_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = Pb_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = Pb_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(Pb_name.Height)
   case "htextalign"
		
		any_temp = Pb_name.HTextAlign
	   ls_pro = of_enutostring(any_temp, "Alignment")
      
   case "italic"
      ls_pro = string(Pb_name.Italic)
   case "map3dcolors"
      ls_pro = string(Pb_name.Map3DColors)
   case "originalsize"
      ls_pro = string(Pb_name.OriginalSize)
   case "picturename"
      ls_pro = string(Pb_name.PictureName)
   case "pointer"
      ls_pro = string(Pb_name.Pointer)
   case "powertiptext"
      ls_pro = string(Pb_name.PowerTipText)
   case "taborder"
      ls_pro = string(Pb_name.TabOrder)
   case "tag"
      ls_pro = string(Pb_name.Tag)
   case "text"
      ls_pro = string(Pb_name.Text)
   case "textsize"
      ls_pro = string(Pb_name.TextSize)
   case "underline"
      ls_pro = string(Pb_name.Underline)
   case "visible"
      ls_pro = string(Pb_name.Visible)
   case "vtextalign"
		
		any_temp = Pb_name.VTextAlign
	   ls_pro = of_enutostring(any_temp, "VTextAlign")		
     
   case "weight"
      ls_pro = string(Pb_name.Weight)
   case "width"
      ls_pro = string(Pb_name.Width)
   case "x"
      ls_pro = string(Pb_name.X)
   case "y"
      ls_pro = string(Pb_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_picturelistbox (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
PictureListBox    Plb_name
int i,j
Plb_name = aobj_name

choose case lower(as_pname) 
   case "accelerator"
      ls_pro = string(Plb_name.Accelerator)
   case "backcolor"
      ls_pro = string(Plb_name.BackColor)
   case "border"
      ls_pro = string(Plb_name.Border)
   case "borderstyle"

	   any_temp = Plb_name.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(Plb_name.BringToTop)
   case "classdefinition"
      ls_pro = string(Plb_name.ClassDefinition)
   case "disablenoscroll"
      ls_pro = string(Plb_name.DisableNoScroll)
   case "dragauto"
      ls_pro = string(Plb_name.DragAuto)
   case "dragicon"
      ls_pro = string(Plb_name.DragIcon)
   case "enabled"
      ls_pro = string(Plb_name.Enabled)
   case "extendedselect"
      ls_pro = string(Plb_name.ExtendedSelect)
   case "facename"
      ls_pro = string(Plb_name.FaceName)
   case "fontcharset"

	   any_temp = Plb_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = Plb_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = Plb_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(Plb_name.Height)
   case "hscrollbar"
      ls_pro = string(Plb_name.HScrollBar)
   case "italic"
      ls_pro = string(Plb_name.Italic)
   case "item[ ]","item[]"
		
		j = upperbound(Plb_name.Item[ ])
      for i = 1 to j
	      ls_pro +=string(Plb_name.Item[i]) +";"
      next 
		
      //ls_pro = string(Plb_name.Item[ ])
   case "itempictureindex[ ]","itempictureindex[]"
		
		j = upperbound(Plb_name.ItemPictureIndex[ ])
      for i = 1 to j
	      ls_pro +=string(Plb_name.ItemPictureIndex[i]) +";"
      next 
		
      //ls_pro = string(Plb_name.ItemPictureIndex[ ])
   case "multiselect"
      ls_pro = string(Plb_name.MultiSelect)
   case "pictureheight"
      ls_pro = string(Plb_name.PictureHeight)
   case "picturewidth"
      ls_pro = string(Plb_name.PictureWidth)
   case "picturemaskcolor"
      ls_pro = string(Plb_name.PictureMaskColor)
   case "picturename[ ]","picturename[]"
		 
		j = upperbound(Plb_name.PictureName[ ])
      for i = 1 to j
	      ls_pro +=string(Plb_name.PictureName[i]) +";"
      next 
		
      //ls_pro = string(Plb_name.PictureName[ ])
   case "pointer"
      ls_pro = string(Plb_name.Pointer)
   case "righttoleft"
      ls_pro = string(Plb_name.RightToLeft)
   case "sorted"
      ls_pro = string(Plb_name.Sorted)
   case "taborder"
      ls_pro = string(Plb_name.TabOrder)
   case "tabstop[ ]","tabstop[]"
		
		j = upperbound(Plb_name.TabStop[ ])
      for i = 1 to j
	      ls_pro +=string(Plb_name.TabStop[i]) +";"
      next 
		
      //ls_pro = string(Plb_name.TabStop[ ])
   case "tag"
      ls_pro = string(Plb_name.Tag)
   case "textcolor"
      ls_pro = string(Plb_name.TextColor)
   case "textsize"
      ls_pro = string(Plb_name.TextSize)
   case "underline"
      ls_pro = string(Plb_name.Underline)
   case "visible"
      ls_pro = string(Plb_name.Visible)
   case "vscrollbar"
      ls_pro = string(Plb_name.VScrollBar)
   case "weight"
      ls_pro = string(Plb_name.Weight)
   case "width"
      ls_pro = string(Plb_name.Width)
   case "x"
      ls_pro = string(Plb_name.X)
   case "y"
      ls_pro = string(Plb_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_radiobutton (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
RadioButton    rb_name

rb_name = aobj_name

choose case lower(as_pname) 
   case "automatic"
      ls_pro = string(rb_name.Automatic)
   case "backcolor"
      ls_pro = string(rb_name.BackColor)
   case "borderstyle"

	   any_temp = rb_name.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(rb_name.BringToTop)
   case "checked"
      ls_pro = string(rb_name.Checked)
   case "classdefinition"
      ls_pro = string(rb_name.ClassDefinition)
   case "dragauto"
      ls_pro = string(rb_name.DragAuto)
   case "dragicon"
      ls_pro = string(rb_name.DragIcon)
   case "enabled"
      ls_pro = string(rb_name.Enabled)
   case "facename"
      ls_pro = string(rb_name.FaceName)
   case "fontcharset"

	   any_temp = rb_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = rb_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = rb_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(rb_name.Height)
   case "italic"
      ls_pro = string(rb_name.Italic)
   case "lefttext"
      ls_pro = string(rb_name.LeftText)
   case "pointer"
      ls_pro = string(rb_name.Pointer)
   case "righttoleft"
      ls_pro = string(rb_name.RightToLeft)
   case "taborder"
      ls_pro = string(rb_name.TabOrder)
   case "tag"
      ls_pro = string(rb_name.Tag)
   case "text"
      ls_pro = string(rb_name.Text)
   case "textcolor"
      ls_pro = string(rb_name.TextColor)
   case "textsize"
      ls_pro = string(rb_name.TextSize)
   case "underline"
      ls_pro = string(rb_name.Underline)
   case "visible"
      ls_pro = string(rb_name.Visible)
   case "weight"
      ls_pro = string(rb_name.Weight)
   case "width"
      ls_pro = string(rb_name.Width)
   case "x"
      ls_pro = string(rb_name.X)
   case "y"
      ls_pro = string(rb_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_rectangle (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
Rectangle    R_name
R_name = aobj_name

choose case lower(as_pname) 
   case "classdefinition"
      ls_pro = string(R_name.ClassDefinition)
   case "fillcolor"
      ls_pro = string(R_name.FillColor)
   case "fillpattern"
		
		any_temp = R_name.FillPattern		
      ls_pro = of_enutostring(any_temp, "FillPattern")
		
   case "height"
      ls_pro = string(R_name.Height)
   case "linecolor"
      ls_pro = string(R_name.LineColor)
   case "linestyle"
		
		any_temp = R_name.LineStyle		
      ls_pro = of_enutostring(any_temp, "LineStyle")
     
   case "linethickness"
      ls_pro = string(R_name.LineThickness)
   case "tag"
      ls_pro = string(R_name.Tag)
   case "visible"
      ls_pro = string(R_name.Visible)
   case "width"
      ls_pro = string(R_name.Width)
   case "x"
      ls_pro = string(R_name.X)
   case "y"
      ls_pro = string(R_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_richtextedit (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
RichTextEdit    Rte_xname
Rte_xname = aobj_name

choose case lower(as_pname) 
   case "accelerator"
      ls_pro = string(Rte_xname.Accelerator)
   case "backcolor"
      ls_pro = string(Rte_xname.BackColor)
   case "border"
      ls_pro = string(Rte_xname.Border)
   case "borderstyle"

	   any_temp = Rte_xname.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bottommargin"
      ls_pro = string(Rte_xname.BottomMargin)
   case "bringtotop"
      ls_pro = string(Rte_xname.BringToTop)
   case "classdefinition"
      ls_pro = string(Rte_xname.ClassDefinition)
   case "displayonly"
      ls_pro = string(Rte_xname.DisplayOnly)
   case "documentname"
      ls_pro = string(Rte_xname.DocumentName)
   case "dragauto"
      ls_pro = string(Rte_xname.DragAuto)
   case "dragicon"
      ls_pro = string(Rte_xname.DragIcon)
   case "enabled"
      ls_pro = string(Rte_xname.Enabled)
   case "headerfooter"
      ls_pro = string(Rte_xname.HeaderFooter)
   case "height"
      ls_pro = string(Rte_xname.Height)
   case "hscrollbar"
      ls_pro = string(Rte_xname.HScrollBar)
   case "imemode"
      ls_pro = string(Rte_xname.ImeMode)
   case "inputfieldbackcolor"
      ls_pro = string(Rte_xname.InputFieldBackColor)
   case "inputfieldnamesvisible"
      ls_pro = string(Rte_xname.InputFieldNamesVisible)
   case "inputfieldsvisible"
      ls_pro = string(Rte_xname.InputFieldsVisible)
   case "modified"
      ls_pro = string(Rte_xname.Modified)
   case "picturesasframe"
      ls_pro = string(Rte_xname.PicturesAsFrame)
   case "pointer"
      ls_pro = string(Rte_xname.Pointer)
   case "popmenu"
      ls_pro = string(Rte_xname.PopMenu)
   case "resizable"
      ls_pro = string(Rte_xname.Resizable)
   case "returnsvisible"
      ls_pro = string(Rte_xname.ReturnsVisible)
   case "rightmargin"
      ls_pro = string(Rte_xname.RightMargin)
   case "rulerbar"
      ls_pro = string(Rte_xname.RulerBar)
   case "spacesvisible"
      ls_pro = string(Rte_xname.SpacesVisible)
   case "tabbar"
      ls_pro = string(Rte_xname.TabBar)
   case "taborder"
      ls_pro = string(Rte_xname.TabOrder)
   case "tabsvisible"
      ls_pro = string(Rte_xname.TabsVisible)
   case "tag"
      ls_pro = string(Rte_xname.Tag)
   case "toolbar"
      ls_pro = string(Rte_xname.ToolBar)
   case "topmargin"
      ls_pro = string(Rte_xname.TopMargin)
   case "undodepth"
      ls_pro = string(Rte_xname.UndoDepth)
   case "visible"
      ls_pro = string(Rte_xname.Visible)
   case "vscrollbar"
      ls_pro = string(Rte_xname.VScrollBar)
   case "width"
      ls_pro = string(Rte_xname.Width)
   case "wordwrap"
      ls_pro = string(Rte_xname.WordWrap)
   case "x"
      ls_pro = string(Rte_xname.X)
   case "y"
      ls_pro = string(Rte_xname.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_roundrectangle (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
RoundRectangle    Rr_name
Rr_name = aobj_name


choose case lower(as_pname) 
   case "classdefinition"
      ls_pro = string(Rr_name.ClassDefinition)
   case "cornerheight"
      ls_pro = string(Rr_name.CornerHeight)
   case "cornerwidth"
      ls_pro = string(Rr_name.CornerWidth)
   case "fillcolor"
      ls_pro = string(Rr_name.FillColor)
   case "fillpattern"
		
		any_temp = Rr_name.FillPattern
      ls_pro = of_enutostring(any_temp, "FillPattern")
		
   case "height"
      ls_pro = string(Rr_name.Height)
   case "linecolor"
      ls_pro = string(Rr_name.LineColor)
   case "linestyle"
		
		any_temp = Rr_name.LineStyle
      ls_pro = of_enutostring(any_temp, "LineStyle")
      
   case "linethickness"
      ls_pro = string(Rr_name.LineThickness)
   case "tag"
      ls_pro = string(Rr_name.Tag)
   case "visible"
      ls_pro = string(Rr_name.Visible)
   case "width"
      ls_pro = string(Rr_name.Width)
   case "x"
      ls_pro = string(Rr_name.X)
   case "y"
      ls_pro = string(Rr_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_tab (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
Tab    Tab_xname
Tab_xname = aobj_name

choose case lower(as_pname) 
   case "alignment"

	   any_temp = Tab_xname.Alignment
	   ls_pro = of_enutostring(any_temp, "Alignment")

   case "backcolor"
      ls_pro = string(Tab_xname.BackColor)
   case "boldselectedtext"
      ls_pro = string(Tab_xname.BoldSelectedText)
   case "bringtotop"
      ls_pro = string(Tab_xname.BringToTop)
   case "classdefinition"
      ls_pro = string(Tab_xname.ClassDefinition)
   case "createondemand"
      ls_pro = string(Tab_xname.CreateOnDemand)
   case "control[ ]","control[]"
      ls_pro = of_controllist(Tab_xname.Control[ ])
   case "dragauto"
      ls_pro = string(Tab_xname.DragAuto)
   case "dragicon"
      ls_pro = string(Tab_xname.DragIcon)
   case "enabled"
      ls_pro = string(Tab_xname.Enabled)
   case "facename"
      ls_pro = string(Tab_xname.FaceName)
   case "fixedwidth"
      ls_pro = string(Tab_xname.FixedWidth)
   case "focusonbuttondown"
      ls_pro = string(Tab_xname.FocusOnButtonDown)
   case "fontcharset"

	   any_temp = Tab_xname.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = Tab_xname.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = Tab_xname.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(Tab_xname.Height)
   case "italic"
      ls_pro = string(Tab_xname.Italic)
   case "multiline"
      ls_pro = string(Tab_xname.Multiline)
   case "perpendiculartext"
      ls_pro = string(Tab_xname.PerpendicularText)
   case "pictureonright"
      ls_pro = string(Tab_xname.PictureOnRight)
   case "pointer"
      ls_pro = string(Tab_xname.Pointer)
   case "powertips"
      ls_pro = string(Tab_xname.PowerTips)
   case "raggedright"
      ls_pro = string(Tab_xname.RaggedRight)
   case "selectedtab"
      ls_pro = string(Tab_xname.SelectedTab)
   case "showpicture"
      ls_pro = string(Tab_xname.ShowPicture)
   case "showtext"
      ls_pro = string(Tab_xname.ShowText)
   case "taborder"
      ls_pro = string(Tab_xname.TabOrder)
   case "tabposition"
		
		any_temp = tab_xname.TabPosition
      ls_pro = of_enutostring(any_temp, "TabPosition")
   case "tag"
      ls_pro = string(Tab_xname.Tag)
   case "textsize"
      ls_pro = string(Tab_xname.TextSize)
   case "underline"
      ls_pro = string(Tab_xname.Underline)
   case "visible"
      ls_pro = string(Tab_xname.Visible)
   case "weight"
      ls_pro = string(Tab_xname.Weight)
   case "width"
      ls_pro = string(Tab_xname.Width)
   case "x"
      ls_pro = string(Tab_xname.X)
   case "y"
      ls_pro = string(Tab_xname.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_treeview (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
TreeView    tv_name
int i,j
tv_name = aobj_name

choose case lower(as_pname) 
   case "accelerator"
      ls_pro = string(tv_name.Accelerator)
   case "backcolor"
      ls_pro = string(tv_name.BackColor)
   case "border"
      ls_pro = string(tv_name.Border)
   case "borderstyle"

	   any_temp = tv_name.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(tv_name.BringToTop)
   case "checkboxes"
      ls_pro = string(tv_name.CheckBoxes)
   case "classdefinition"
      ls_pro = string(tv_name.ClassDefinition)
   case "deleteitems"
      ls_pro = string(tv_name.DeleteItems)
   case "disabledragdrop"
      ls_pro = string(tv_name.DisableDragDrop)
   case "dragauto"
      ls_pro = string(tv_name.DragAuto)
   case "dragicon"
      ls_pro = string(tv_name.DragIcon)
   case "editlabels"
      ls_pro = string(tv_name.EditLabels)
   case "enabled"
      ls_pro = string(tv_name.Enabled)
   case "facename"
      ls_pro = string(tv_name.FaceName)
   case "fontcharset"

	   any_temp = tv_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = tv_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = tv_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "fullrowselect"
      ls_pro = string(tv_name.FullRowSelect)
   case "hasbuttons"
      ls_pro = string(tv_name.HasButtons)
   case "haslines"
      ls_pro = string(tv_name.HasLines)
   case "height"
      ls_pro = string(tv_name.Height)
   case "hideselection"
      ls_pro = string(tv_name.HideSelection)
   case "imemode"
      ls_pro = string(tv_name.ImeMode)
   case "indent"
      ls_pro = string(tv_name.Indent)
   case "italic"
      ls_pro = string(tv_name.Italic)
   case "linesatroot"
      ls_pro = string(tv_name.LinesAtRoot)
   case "pictureheight"
      ls_pro = string(tv_name.PictureHeight)
   case "picturemaskcolor"
      ls_pro = string(tv_name.PictureMaskColor)
   case "picturename[ ]","picturename[]"
		
		j = upperbound(tv_name.PictureName[ ])
      for i = 1 to j
	      ls_pro +=string(tv_name.PictureName[i]) +";"
      next 
		
      //ls_pro = string(tv_name.PictureName[1])
   case "picturewidth"
      ls_pro = string(tv_name.PictureWidth)
   case "pointer"
      ls_pro = string(tv_name.Pointer)
   case "singleexpand"
      ls_pro = string(tv_name.SingleExpand)
   case "sorttype"
		
		any_temp = tv_name.SortType
	   ls_pro = of_enutostring(any_temp, "grSortType")		
      
   case "statepictureheight"
      ls_pro = string(tv_name.StatePictureHeight)
   case "statepicturemaskcolor"
      ls_pro = string(tv_name.StatePictureMaskColor)
   case "statepicturename[ ]","statepicturename[]"
		
		j = upperbound(tv_name.StatePictureName[ ])
      for i = 1 to j
	      ls_pro +=string(tv_name.StatePictureName[i]) +";"
      next 
		
      //ls_pro = string(tv_name.StatePictureName[ ])
   case "statepicturewidth"
      ls_pro = string(tv_name.StatePictureWidth)
   case "taborder"
      ls_pro = string(tv_name.TabOrder)
   case "tag"
      ls_pro = string(tv_name.Tag)
   case "textcolor"
      ls_pro = string(tv_name.TextColor)
   case "textsize"
      ls_pro = string(tv_name.TextSize)
   case "tooltips"
      ls_pro = string(tv_name.ToolTips)
   case "trackselect"
      ls_pro = string(tv_name.TrackSelect)
   case "underline"
      ls_pro = string(tv_name.Underline)
   case "visible"
      ls_pro = string(tv_name.Visible)
   case "weight"
      ls_pro = string(tv_name.Weight)
   case "width"
      ls_pro = string(tv_name.Width)
   case "x"
      ls_pro = string(tv_name.X)
   case "y"
      ls_pro = string(tv_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_vscrollbar (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
VScrollBar    vsb_name
vsb_name = aobj_name


choose case lower(as_pname) 
   case "bringtotop"
      ls_pro = string(vsb_name.BringToTop)
   case "classdefinition"
      ls_pro = string(vsb_name.ClassDefinition)
   case "dragauto"
      ls_pro = string(vsb_name.DragAuto)
   case "dragicon"
      ls_pro = string(vsb_name.DragIcon)
   case "height"
      ls_pro = string(vsb_name.Height)
   case "maxposition"
      ls_pro = string(vsb_name.MaxPosition)
   case "minposition"
      ls_pro = string(vsb_name.MinPosition)
   case "pointer"
      ls_pro = string(vsb_name.Pointer)
   case "position"
      ls_pro = string(vsb_name.Position)
   case "stdwidth"
      ls_pro = string(vsb_name.StdWidth)
   case "taborder"
      ls_pro = string(vsb_name.TabOrder)
   case "tag"
      ls_pro = string(vsb_name.Tag)
   case "visible"
      ls_pro = string(vsb_name.Visible)
   case "width"
      ls_pro = string(vsb_name.Width)
   case "x"
      ls_pro = string(vsb_name.X)
   case "y"
      ls_pro = string(vsb_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_datawindow (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
Datawindow    Dw_xname
DataWindowChild dwc_report
Dw_xname = aobj_name

as_pname = lower(as_pname) 
choose case as_pname 
   case "border"
      ls_pro = string(Dw_xname.Border)
   case "borderstyle"

	   any_temp = Dw_xname.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(Dw_xname.BringToTop)
   case "classdefinition"
      ls_pro = string(Dw_xname.ClassDefinition)
   case "controlmenu"
      ls_pro = string(Dw_xname.ControlMenu)
   case "dataobject"
      ls_pro = string(Dw_xname.DataObject)
   case "dragauto"
      ls_pro = string(Dw_xname.DragAuto)
   case "dragicon"
      ls_pro = string(Dw_xname.DragIcon)
   case "enabled"
      ls_pro = string(Dw_xname.Enabled)
   case "height"
      ls_pro = string(Dw_xname.Height)
   case "hscrollbar"
      ls_pro = string(Dw_xname.HScrollBar)
   case "hsplitscroll"
      ls_pro = string(Dw_xname.HSplitScroll)
   case "icon"
      ls_pro = string(Dw_xname.Icon)
   case "livescroll"
      ls_pro = string(Dw_xname.LiveScroll)
   case "maxbox"
      ls_pro = string(Dw_xname.MaxBox)
   case "minbox"
      ls_pro = string(Dw_xname.MinBox)
   case "object"
      ls_pro = string(Dw_xname.Object)
   case "resizable"
      ls_pro = string(Dw_xname.Resizable)
   case "righttoleft"
      ls_pro = string(Dw_xname.RightToLeft)
   case "taborder"
      ls_pro = string(Dw_xname.TabOrder)
   case "tag"
      ls_pro = string(Dw_xname.Tag)
   case "title"
      ls_pro = string(Dw_xname.Title)
   case "titlebar"
      ls_pro = string(Dw_xname.TitleBar)
   case "visible"
      ls_pro = string(Dw_xname.Visible)
   case "vscrollbar"
      ls_pro = string(Dw_xname.VScrollBar)
   case "width"
      ls_pro = string(Dw_xname.Width)
   case "x"
      ls_pro = string(Dw_xname.X)
   case "y"
      ls_pro = string(Dw_xname.Y)	
   case else	
		
		int li_pos_object,li_pos_dddw
		
		if as_pname = "datawindow.data" then
				ls_pro = of_getdwdata(dw_xname)
				return ls_pro
		end if
		
		if pos(as_pname,".dddw.") > 0 then  //dddw
			
			li_pos_object = pos(as_pname,"object.") + 7
			li_pos_dddw   = pos(as_pname,".dddw.")
			dw_xname.GetChild( mid(as_pname,li_pos_object, li_pos_dddw - li_pos_object), dwc_report)					
			
			if right(as_pname, 12) = "dddw.objects" then
				  ls_pro = dwc_report.describe("datawindow.objects")
					return ls_pro
			end if
			
			if right(as_pname, 9) = "dddw.data" then
				  	ls_pro =  of_getdwdata(dwc_report)
					return ls_pro
			end if	
			
			ls_pro = dwc_report.describe("datawindow."+mid(as_pname,li_pos_dddw + 6))
			return ls_pro
			
		end if
		
				
		if left(as_pname,7) = "object." then
			as_pname = mid(as_pname, 8)
		end if
		if right(as_pname,5) = ".data" then //report
		    //dw_xxx.type		   
				dw_xname.GetChild( left(as_pname,pos(as_pname,".") - 1) , dwc_report)	
				ls_pro =  of_getdwdata(dwc_report)
				return ls_pro
			// end if
	   end if
		ls_pro = Dw_xname.Describe(as_pname)	
	  
end choose

return ls_pro
end function

public function string of_prac_singlelineedit (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
SingleLineEdit    sle_name
sle_name = aobj_name

choose case lower(as_pname) 
   case "accelerator"
      ls_pro = string(sle_name.Accelerator)
   case "autohscroll"
      ls_pro = string(sle_name.AutoHScroll)
   case "backcolor"
      ls_pro = string(sle_name.BackColor)
   case "border"
      ls_pro = string(sle_name.Border)
   case "borderstyle"

	   any_temp = sle_name.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(sle_name.BringToTop)
   case "classdefinition"
      ls_pro = string(sle_name.ClassDefinition)
   case "displayonly"
      ls_pro = string(sle_name.DisplayOnly)
   case "dragauto"
      ls_pro = string(sle_name.DragAuto)
   case "dragicon"
      ls_pro = string(sle_name.DragIcon)
   case "enabled"
      ls_pro = string(sle_name.Enabled)
   case "facename"
      ls_pro = string(sle_name.FaceName)
   case "fontcharset"

	   any_temp = sle_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = sle_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = sle_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(sle_name.Height)
   case "hideselection"
      ls_pro = string(sle_name.HideSelection)
   case "imemode"
      ls_pro = string(sle_name.ImeMode)
   case "italic"
      ls_pro = string(sle_name.Italic)
   case "limit"
      ls_pro = string(sle_name.Limit)
   case "password"
      ls_pro = string(sle_name.Password)
   case "pointer"
      ls_pro = string(sle_name.Pointer)
   case "righttoleft"
      ls_pro = string(sle_name.RightToLeft)
   case "taborder"
      ls_pro = string(sle_name.TabOrder)
   case "tag"
      ls_pro = string(sle_name.Tag)
   case "text"
      ls_pro = string(sle_name.Text)
   case "textcase"
		
		any_temp = sle_name.TextCase
	   ls_pro = of_enutostring(any_temp, "TextCase")
    
   case "textcolor"
      ls_pro = string(sle_name.TextColor)
   case "textsize"
      ls_pro = string(sle_name.TextSize)
   case "underline"
      ls_pro = string(sle_name.Underline)
   case "visible"
      ls_pro = string(sle_name.Visible)
   case "weight"
      ls_pro = string(sle_name.Weight)
   case "width"
      ls_pro = string(sle_name.Width)
   case "x"
      ls_pro = string(sle_name.X)
   case "y"
      ls_pro = string(sle_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_statictext (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
StaticText    St_name
St_name = aobj_name

choose case lower(as_pname) 
   case "alignment"
		
		any_temp = St_name.Alignment
	   ls_pro = of_enutostring(any_temp, "Alignment")
      
   case "backcolor"
      ls_pro = string(St_name.BackColor)
   case "border"
      ls_pro = string(St_name.Border)
   case "bordercolor"
      ls_pro = string(St_name.BorderColor)
   case "borderstyle"

	   any_temp = St_name.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(St_name.BringToTop)
   case "classdefinition"
      ls_pro = string(St_name.ClassDefinition)
   case "disabledlook"
      ls_pro = string(St_name.DisabledLook)
   case "dragauto"
      ls_pro = string(St_name.DragAuto)
   case "dragicon"
      ls_pro = string(St_name.DragIcon)
   case "enabled"
      ls_pro = string(St_name.Enabled)
   case "facename"
      ls_pro = string(St_name.FaceName)
   case "fillpattern"
		
		any_temp = St_name.FillPattern
	   ls_pro = of_enutostring(any_temp, "FillPattern")		
     
   case "focusrectangle"
      ls_pro = string(St_name.FocusRectangle)
   case "fontcharset"

	   any_temp = St_name.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = St_name.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = St_name.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(St_name.Height)
   case "italic"
      ls_pro = string(St_name.Italic)
   case "pointer"
      ls_pro = string(St_name.Pointer)
   case "righttoleft"
      ls_pro = string(St_name.RightToLeft)
   case "taborder"
      ls_pro = string(St_name.TabOrder)
   case "tag"
      ls_pro = string(St_name.Tag)
   case "text"
      ls_pro = string(St_name.Text)
   case "textcolor"
      ls_pro = string(St_name.TextColor)
   case "textsize"
      ls_pro = string(St_name.TextSize)
   case "underline"
      ls_pro = string(St_name.Underline)
   case "visible"
      ls_pro = string(St_name.Visible)
   case "weight"
      ls_pro = string(St_name.Weight)
   case "width"
      ls_pro = string(St_name.Width)
   case "x"
      ls_pro = string(St_name.X)
   case "y"
      ls_pro = string(St_name.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_statichyperlink (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
StaticHyperLink    shl_xname
shl_xname = aobj_name

choose case lower(as_pname) 
   case "alignment"

	   any_temp = shl_xname.Alignment
	   ls_pro = of_enutostring(any_temp, "Alignment")

   case "backcolor"
      ls_pro = string(shl_xname.BackColor)
   case "border"
      ls_pro = string(shl_xname.Border)
   case "bordercolor"
      ls_pro = string(shl_xname.BorderColor)
   case "borderstyle"

	   any_temp = shl_xname.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(shl_xname.BringToTop)
   case "classdefinition"
      ls_pro = string(shl_xname.ClassDefinition)
   case "disabledlook"
      ls_pro = string(shl_xname.DisabledLook)
   case "dragauto"
      ls_pro = string(shl_xname.DragAuto)
   case "dragicon"
      ls_pro = string(shl_xname.DragIcon)
   case "enabled"
      ls_pro = string(shl_xname.Enabled)
   case "facename"
      ls_pro = string(shl_xname.FaceName)
   case "fillpattern"

	   any_temp = shl_xname.FillPattern
	   ls_pro = of_enutostring(any_temp, "FillPattern")

   case "focusrectangle"
      ls_pro = string(shl_xname.FocusRectangle)
   case "fontcharset"

	   any_temp = shl_xname.FontCharSet
	   ls_pro = of_enutostring(any_temp, "FontCharSet")

   case "fontfamily"

	   any_temp = shl_xname.FontFamily
	   ls_pro = of_enutostring(any_temp, "FontFamily")

   case "fontpitch"

	   any_temp = shl_xname.FontPitch
	   ls_pro = of_enutostring(any_temp, "FontPitch")

   case "height"
      ls_pro = string(shl_xname.Height)
   case "italic"
      ls_pro = string(shl_xname.Italic)
   case "pointer"
      ls_pro = string(shl_xname.Pointer)
   case "righttoleft"
      ls_pro = string(shl_xname.RightToLeft)
   case "taborder"
      ls_pro = string(shl_xname.TabOrder)
   case "tag"
      ls_pro = string(shl_xname.Tag)
   case "text"
      ls_pro = string(shl_xname.Text)
   case "textcolor"
      ls_pro = string(shl_xname.TextColor)
   case "textsize"
      ls_pro = string(shl_xname.TextSize)
   case "underline"
      ls_pro = string(shl_xname.Underline)
   case "url"
      ls_pro = string(shl_xname.URL)
   case "visible"
      ls_pro = string(shl_xname.Visible)
   case "weight"
      ls_pro = string(shl_xname.Weight)
   case "width"
      ls_pro = string(shl_xname.Width)
   case "x"
      ls_pro = string(shl_xname.X)
   case "y"
      ls_pro = string(shl_xname.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_picturehyperlink (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
PictureHyperLink    phl_xname
phl_xname = aobj_name

choose case lower(as_pname) 
   case "border"
      ls_pro = string(phl_xname.Border)
   case "borderstyle"

	   any_temp = phl_xname.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(phl_xname.BringToTop)
   case "classdefinition"
      ls_pro = string(phl_xname.ClassDefinition)
   case "dragauto"
      ls_pro = string(phl_xname.DragAuto)
   case "dragicon"
      ls_pro = string(phl_xname.DragIcon)
   case "enabled"
      ls_pro = string(phl_xname.Enabled)
   case "focusrectangle"
      ls_pro = string(phl_xname.FocusRectangle)
   case "height"
      ls_pro = string(phl_xname.Height)
   case "invert"
      ls_pro = string(phl_xname.Invert)
   case "map3dcolors"
      ls_pro = string(phl_xname.Map3DColors)
   case "originalsize"
      ls_pro = string(phl_xname.OriginalSize)
   case "picturename"
      ls_pro = string(phl_xname.PictureName)
   case "pointer"
      ls_pro = string(phl_xname.Pointer)
   case "powertiptext"
      ls_pro = string(phl_xname.PowerTipText)
   case "taborder"
      ls_pro = string(phl_xname.TabOrder)
   case "tag"
      ls_pro = string(phl_xname.Tag)
   case "url"
      ls_pro = string(phl_xname.URL)
   case "visible"
      ls_pro = string(phl_xname.Visible)
   case "width"
      ls_pro = string(phl_xname.Width)
   case "x"
      ls_pro = string(phl_xname.X)
   case "y"
      ls_pro = string(phl_xname.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_vtrackbar (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
VTrackBar    Vtb_xname
Vtb_xname = aobj_name

choose case lower(as_pname) 
   case "bringtotop"
      ls_pro = string(Vtb_xname.BringToTop)
   case "classdefinition"
      ls_pro = string(Vtb_xname.ClassDefinition)
   case "dragauto"
      ls_pro = string(Vtb_xname.DragAuto)
   case "dragicon"
      ls_pro = string(Vtb_xname.DragIcon)
   case "height"
      ls_pro = string(Vtb_xname.Height)
   case "linesize"
      ls_pro = string(Vtb_xname.LineSize)
   case "maxposition"
      ls_pro = string(Vtb_xname.MaxPosition)
   case "minposition"
      ls_pro = string(Vtb_xname.MinPosition)
   case "pagesize"
      ls_pro = string(Vtb_xname.PageSize)
   case "pointer"
      ls_pro = string(Vtb_xname.Pointer)
   case "position"
      ls_pro = string(Vtb_xname.Position)
   case "slider"
      ls_pro = string(Vtb_xname.Slider)
   case "slidersize"
      ls_pro = string(Vtb_xname.SliderSize)
   case "taborder"
      ls_pro = string(Vtb_xname.TabOrder)
   case "tag"
      ls_pro = string(Vtb_xname.Tag)
   case "tickfrequency"
      ls_pro = string(Vtb_xname.TickFrequency)
   case "tickmarks"
		
		any_temp = Vtb_xname.TickMarks
      ls_pro = of_enutostring(any_temp, "VTickMarks")
		
   case "visible"
      ls_pro = string(Vtb_xname.Visible)
   case "width"
      ls_pro = string(Vtb_xname.Width)
   case "x"
      ls_pro = string(Vtb_xname.X)
   case "y"
      ls_pro = string(Vtb_xname.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_htrackbar (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
Htrackbar    Htb_xname
Htb_xname = aobj_name

choose case lower(as_pname) 
   case "bringtotop"
      ls_pro = string(Htb_xname.BringToTop)
   case "classdefinition"
      ls_pro = string(Htb_xname.ClassDefinition)
   case "dragauto"
      ls_pro = string(Htb_xname.DragAuto)
   case "dragicon"
      ls_pro = string(Htb_xname.DragIcon)
   case "height"
      ls_pro = string(Htb_xname.Height)
   case "linesize"
      ls_pro = string(Htb_xname.LineSize)
   case "maxposition"
      ls_pro = string(Htb_xname.MaxPosition)
   case "minposition"
      ls_pro = string(Htb_xname.MinPosition)
   case "pagesize"
      ls_pro = string(Htb_xname.PageSize)
   case "pointer"
      ls_pro = string(Htb_xname.Pointer)
   case "position"
      ls_pro = string(Htb_xname.Position)
   case "slider"
      ls_pro = string(Htb_xname.Slider)
   case "slidersize"
      ls_pro = string(Htb_xname.SliderSize)
   case "taborder"
      ls_pro = string(Htb_xname.TabOrder)
   case "tag"
      ls_pro = string(Htb_xname.Tag)
   case "tickfrequency"
      ls_pro = string(Htb_xname.TickFrequency)
   case "tickmarks"
		any_temp = Htb_xname.TickMarks
      ls_pro = of_enutostring(any_temp, "HTickMarks")
   case "visible"
      ls_pro = string(Htb_xname.Visible)
   case "width"
      ls_pro = string(Htb_xname.Width)
   case "x"
      ls_pro = string(Htb_xname.X)
   case "y"
      ls_pro = string(Htb_xname.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_hprogressbar (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
hprogressbar    hpb_xname
hpb_xname = aobj_name

choose case lower(as_pname) 
   case "bringtotop"
      ls_pro = string(hpb_xname.BringToTop)
   case "classdefinition"
      ls_pro = string(hpb_xname.ClassDefinition)
   case "dragauto"
      ls_pro = string(hpb_xname.DragAuto)
   case "dragicon"
      ls_pro = string(hpb_xname.DragIcon)
   case "height"
      ls_pro = string(hpb_xname.Height)
   case "maxposition"
      ls_pro = string(hpb_xname.MaxPosition)
   case "minposition"
      ls_pro = string(hpb_xname.MinPosition)
   case "pointer"
      ls_pro = string(hpb_xname.Pointer)
   case "position"
      ls_pro = string(hpb_xname.Position)
   case "setstep"
      ls_pro = string(hpb_xname.SetStep)
   case "smoothscroll"
      ls_pro = string(hpb_xname.SmoothScroll)
   case "taborder"
      ls_pro = string(hpb_xname.TabOrder)
   case "tag"
      ls_pro = string(hpb_xname.Tag)
   case "visible"
      ls_pro = string(hpb_xname.Visible)
   case "width"
      ls_pro = string(hpb_xname.Width)
   case "x"
      ls_pro = string(hpb_xname.X)
   case "y"
      ls_pro = string(hpb_xname.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_prac_vprogressbar (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
VProgressBar    Vpb_xname
Vpb_xname = aobj_name

choose case lower(as_pname) 
   case "bringtotop"
      ls_pro = string(Vpb_xname.BringToTop)
   case "classdefinition"
      ls_pro = string(Vpb_xname.ClassDefinition)
   case "dragauto"
      ls_pro = string(Vpb_xname.DragAuto)
   case "dragicon"
      ls_pro = string(Vpb_xname.DragIcon)
   case "height"
      ls_pro = string(Vpb_xname.Height)
   case "maxposition"
      ls_pro = string(Vpb_xname.MaxPosition)
   case "minposition"
      ls_pro = string(Vpb_xname.MinPosition)
   case "pointer"
      ls_pro = string(Vpb_xname.Pointer)
   case "position"
      ls_pro = string(Vpb_xname.Position)
   case "setstep"
      ls_pro = string(Vpb_xname.SetStep)
   case "smoothscroll"
      ls_pro = string(Vpb_xname.SmoothScroll)
   case "taborder"
      ls_pro = string(Vpb_xname.TabOrder)
   case "tag"
      ls_pro = string(Vpb_xname.Tag)
   case "visible"
      ls_pro = string(Vpb_xname.Visible)
   case "width"
      ls_pro = string(Vpb_xname.Width)
   case "x"
      ls_pro = string(Vpb_xname.X)
   case "y"
      ls_pro = string(Vpb_xname.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_getdwdata (ref datawindowchild adw_name);string ls_data,ls_tempdata
int i,j,li_row,li_column
string ls_coltype[]

li_row = adw_name.rowcount()
li_column =  integer(adw_name.Describe("DataWindow.Column.Count"))

for j =  1 to li_column
	ls_coltype[j] = lower(left(adw_name.Describe("#"+string(j)+".coltype"),5))
next

if li_row < 1 or li_column < 1 then return ""

for i = 1 to li_row	   
	for j = 1 to li_column
		
		choose case ls_coltype[j]
			case "char("
			 ls_tempdata = adw_name.getitemstring(i,j)
			case "date"
			 ls_tempdata = string(adw_name.getitemdate(i,j))
			case "datet"
			 ls_tempdata = string(adw_name.getitemdatetime(i,j))
			case "time","times"
			 ls_tempdata = string(adw_name.getitemTime(i,j))
			case "decim","real"
			 ls_tempdata = string(adw_name.getitemdecimal(i,j))
			case "int","long","numbe","ulong"
			 ls_tempdata = string(adw_name.getitemNumber(i,j))
			 case else
			  ls_tempdata = "Unknown Data"
		end choose

		if isnull(ls_tempdata) then
			ls_tempdata = ""
		end if
		
		ls_data += ls_tempdata + "~t"
   next
	ls_data += "~r~n"
next
   
return ls_data
end function

public function string of_getdwdata (ref datawindow adw_name);string ls_data,ls_tempdata
int i,j,li_row,li_column
string ls_coltype[]

li_row = adw_name.rowcount()
li_column =  integer(adw_name.Describe("DataWindow.Column.Count"))

for j =  1 to li_column
	ls_coltype[j] = lower(left(adw_name.Describe("#"+string(j)+".coltype"),5))
next
//messagebox("share",string(adw_name.sharedata(dw_temp)))

if li_row < 1 or li_column < 1 then return ""

for i = 1 to li_row	   
	for j = 1 to li_column
		
		choose case ls_coltype[j]
			case "char("
			 ls_tempdata = adw_name.getitemstring(i,j)
			case "date"
			 ls_tempdata = string(adw_name.getitemdate(i,j))
			case "datet"
			 ls_tempdata = string(adw_name.getitemdatetime(i,j))
			case "time","times"
			 ls_tempdata = string(adw_name.getitemTime(i,j))
			case "decim","real"
			 ls_tempdata = string(adw_name.getitemdecimal(i,j))
			case "int","long","numbe","ulong"
			 ls_tempdata = string(adw_name.getitemNumber(i,j))
			 case else
			  ls_tempdata = "Unknown Data"
		end choose

		if isnull(ls_tempdata) then
			ls_tempdata = ""
		end if
		
		ls_data += ls_tempdata + "~t"
   next
	ls_data += "~r~n"
next
 
return ls_data
end function

public function powerobject of_get_tabobject (powerobject aobj_name, string as_objname);//of_get_tabobject(iobj_control[li_Pdata],ls_filter)
Tab tab_xname
userobject uo_xname

powerobject lobj_list[]
powerobject lobj_temp 
int i,li_pagcount
string ls_pname,ls_objname

if aobj_name.classname() = as_objname then
		return aobj_name
end if

ls_pname = left(as_objname,pos(as_objname,".") -1 )
ls_objname = mid(as_objname,pos(as_objname,".") +1)

if aobj_name.classname() = ls_pname then
		lobj_temp =  of_get_tabobject(aobj_name,ls_objname)
		return lobj_temp 
end if

choose case aobj_name.typeof() 
	case Tab! 
    tab_xname = aobj_name
    lobj_list = tab_xname.control[]
   case userobject! 	
    uo_xname = aobj_name
    lobj_list = uo_xname.control[]
   case else
	 
end choose

li_pagcount = upperbound(lobj_list)
 for i = 1 to  li_pagcount
	 if lobj_list[i].classname() = ls_objname then
		lobj_temp =  lobj_list[i]
		return lobj_temp 
	 end if
	 if lobj_list[i].classname() = ls_pname then
		lobj_temp =  of_get_tabobject(lobj_list[i],ls_objname)
		return lobj_temp 
	 end if
 next
 
 return lobj_temp 

end function

public function string of_get_objandproname (string as_str, ref string as_objname);string ls_proname

int li_pos

do 
	as_objname = left(as_str,li_pos - 1)
	ls_proname = mid(as_str, li_pos + 1)
	li_pos = pos(as_str,".",li_pos+1)		
loop while li_pos > 0

return ls_proname
end function

public function powerobject of_get_userobject (powerobject aobj_name, string as_objname);//of_get_tabobject(iobj_control[li_Pdata],ls_filter)
Tab tab_xname
userobject uo_xname

powerobject lobj_list[]
powerobject lobj_temp
int i,li_pagcount
string ls_pname,ls_objname

if aobj_name.classname() = as_objname then
		return aobj_name
end if

ls_pname = left(as_objname,pos(as_objname,".") -1 )
ls_objname = mid(as_objname,pos(as_objname,".") +1)

if aobj_name.classname() = ls_pname then
		lobj_temp = of_get_userobject(aobj_name,ls_objname)
		return lobj_temp
end if

choose case aobj_name.typeof() 
	case Tab! 
    tab_xname = aobj_name
    lobj_list = tab_xname.control[]
   case userobject! 	
    uo_xname = aobj_name
    lobj_list = uo_xname.control[]
   case else
	 
end choose

li_pagcount = upperbound(lobj_list)
 for i = 1 to  li_pagcount
	 if lobj_list[i].classname() = ls_objname then
		lobj_temp = lobj_list[i]
		return lobj_temp
	 end if
	 if lobj_list[i].classname() = ls_pname then
		lobj_temp = of_get_userobject(lobj_list[i],ls_objname)
		return lobj_temp
	 end if
 next
 
return lobj_temp 

end function

public function string of_prac_userobject (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
UserObject    uo_xname
uo_xname = aobj_name

choose case lower(as_pname) 
   case "backcolor"
      ls_pro = string(uo_xname.BackColor)
   case "border"
      ls_pro = string(uo_xname.Border)
   case "borderstyle"

	   any_temp = uo_xname.BorderStyle
	   ls_pro = of_enutostring(any_temp, "BorderStyle")

   case "bringtotop"
      ls_pro = string(uo_xname.BringToTop)
   case "classdefinition"
      ls_pro = string(uo_xname.ClassDefinition)
   case "classname"
      ls_pro = string(uo_xname.ClassName())
   case "columnsperpage"
      ls_pro = string(uo_xname.ColumnsPerPage)
   case "control[ ]","control[]"
      ls_pro = of_controllist(uo_xname.Control[ ])
   case "dragauto"
      ls_pro = string(uo_xname.DragAuto)
   case "dragicon"
      ls_pro = string(uo_xname.DragIcon)
   case "enabled"
      ls_pro = string(uo_xname.Enabled)
   case "height"
      ls_pro = string(uo_xname.Height)
   case "hScrollbar"
      ls_pro = string(uo_xname.HScrollBar)
   case "libraryname"
      ls_pro = string(uo_xname.LibraryName)
   case "linesperpage"
      ls_pro = string(uo_xname.LinesPerPage)
   case "objecttype"
		
		any_temp = uo_xname.ObjectType
      ls_pro = of_enutostring(any_temp, "UserObjects")
		
   case "picturemaskcolor"
      ls_pro = string(uo_xname.PictureMaskColor)
   case "picturename"
      ls_pro = string(uo_xname.PictureName)
   case "pointer"
      ls_pro = string(uo_xname.Pointer)
   case "powertiptext"
      ls_pro = string(uo_xname.PowerTipText)
   case "style"
      ls_pro = string(uo_xname.Style)
   case "tabbackcolor"
      ls_pro = string(uo_xname.TabBackColor)
   case "tabtextcolor"
      ls_pro = string(uo_xname.TabTextColor)
   case "taborder"
      ls_pro = string(uo_xname.TabOrder)
   case "tag"
      ls_pro = string(uo_xname.Tag)
   case "text"
      ls_pro = string(uo_xname.Text)
   case "unitspercolumn"
      ls_pro = string(uo_xname.UnitsPerColumn)
   case "unitsperline"
      ls_pro = string(uo_xname.UnitsPerLine)
   case "visible"
      ls_pro = string(uo_xname.Visible)
   case "vscrollbar"
      ls_pro = string(uo_xname.VScrollBar)
   case "width"
      ls_pro = string(uo_xname.Width)
   case "x"
      ls_pro = string(uo_xname.X)
   case "y"
      ls_pro = string(uo_xname.Y)
   case else 
      ls_pro = "Unknown" 
end choose

return ls_pro
end function

public function string of_controllist (powerobject as_object[]);int i,j
string ls_controllist
j = upperbound(as_object)
for i = 1 to j
	ls_controllist +=as_object[i].classname() +";"
next

return ls_controllist
end function

public function string of_prac_datastore (ref powerobject aobj_name, string as_pname);string ls_pro
any    any_temp
Datastore    ds_xname
DataWindowChild dwc_report
ds_xname = aobj_name

as_pname = lower(as_pname) 
choose case as_pname 
   
   case "dataobject"
      ls_pro = string(ds_xname.DataObject)  
   case else	
		
		int li_pos_object,li_pos_dddw
		
		if as_pname = "datawindow.data" then
				ls_pro = of_getdwdata(ds_xname)
				return ls_pro
		end if
		
		if pos(as_pname,".dddw.") > 0 then  //dddw
			
			li_pos_object = pos(as_pname,"object.") + 7
			li_pos_dddw   = pos(as_pname,".dddw.")
			ds_xname.GetChild( mid(as_pname,li_pos_object, li_pos_dddw - li_pos_object), dwc_report)					
			
			if right(as_pname, 12) = "dddw.objects" then
				  ls_pro = dwc_report.describe("datawindow.objects")
					return ls_pro
			end if
			
			if right(as_pname, 9) = "dddw.data" then
				  	ls_pro =  of_getdwdata(dwc_report)
					return ls_pro
			end if	
			
			ls_pro = dwc_report.describe("datawindow."+mid(as_pname,li_pos_dddw + 6))
			return ls_pro
			
		end if
		
				
		if left(as_pname,7) = "object." then
			as_pname = mid(as_pname, 8)
		end if
		if right(as_pname,5) = ".data" then //report
		    
				ds_xname.GetChild( left(as_pname,pos(as_pname,".") - 1) , dwc_report)	
				ls_pro =  of_getdwdata(dwc_report)
				return ls_pro
			// end if
	   end if
		ls_pro = ds_xname.Describe(as_pname)	
	  
end choose

return ls_pro
end function

public function string of_getdwdata (ref datastore adw_name);string ls_data,ls_tempdata
int i,j,li_row,li_column
string ls_coltype[]

li_row = adw_name.rowcount()
li_column =  integer(adw_name.Describe("DataWindow.Column.Count"))

for j =  1 to li_column
	ls_coltype[j] = lower(left(adw_name.Describe("#"+string(j)+".coltype"),5))
next


if li_row < 1 or li_column < 1 then return ""

for i = 1 to li_row	   
	for j = 1 to li_column
		
		choose case ls_coltype[j]
			case "char("
			 ls_tempdata = adw_name.getitemstring(i,j)
			case "date"
			 ls_tempdata = string(adw_name.getitemdate(i,j))
			case "datet"
			 ls_tempdata = string(adw_name.getitemdatetime(i,j))
			case "time","times"
			 ls_tempdata = string(adw_name.getitemTime(i,j))
			case "decim","real"
			 ls_tempdata = string(adw_name.getitemdecimal(i,j))
			case "int","long","numbe","ulong"
			 ls_tempdata = string(adw_name.getitemNumber(i,j))
			case else
			  ls_tempdata = "Unknown Data"
		end choose

		if isnull(ls_tempdata) then
			ls_tempdata = ""
		end if
		
		ls_data += ls_tempdata + "~t"
   next
	ls_data += "~r~n"
next
 
return ls_data
end function

public function string of_getpracticevalue (powerobject aobj_name, string as_objname, string as_prolist);string ls_pro,ls_objpro

string ls_objandpro,ls_objname,ls_proname
int li_pos,li_posdot
int i,li_count
string ls_tabobjname,ls_tabpro


as_prolist = trim(as_prolist)
if as_prolist = "" or as_prolist = ";" or  isnull(as_prolist) then
	return ""
end if

if right(as_prolist,1)<>";" then as_prolist +=";"
if left(as_prolist,1) = ";" then as_prolist = mid(as_prolist,2)



choose case aobj_name.typeof()
	case Datastore!	
	datastore lds_temp
	lds_temp = aobj_name   

		
		li_pos = 1
		do while li_pos >= 1
			li_pos = pos(as_prolist,";")
			ls_objpro = ""
			if li_pos >= 1 then
				ls_objandpro = left(as_prolist,li_pos - 1)
				as_prolist = mid(as_prolist,li_pos + 1)
				
				//li_posdot = pos(ls_objandpro,".")
				//ls_objname = left(ls_objandpro, li_posdot - 1)
				//ls_proname = mid(ls_objandpro, li_posdot + 1)	
				ls_proname = trim(ls_objandpro)
			
			   ls_objpro = as_objname +"."+ls_objandpro + " = " + of_prac_getproperties(aobj_name , ls_proname) + "~r~n"
			
			 if ls_objpro = ""  or isnull(ls_objpro) then
					ls_objpro = as_objname +"."+ls_objandpro + " =  The object is not valid or expression is error!" + "~r~n"
			 end if
			
			end if
			
			ls_pro += ls_objpro
		loop
		
end choose

return ls_pro

end function

on uo_getproperties.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_getproperties.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

