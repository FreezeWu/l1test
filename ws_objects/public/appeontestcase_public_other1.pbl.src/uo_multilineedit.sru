$PBExportHeader$uo_multilineedit.sru
forward
global type uo_multilineedit from multilineedit
end type
end forward

global type uo_multilineedit from multilineedit
integer width = 549
integer height = 324
integer textsize = -10
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "宋体"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
event doubleclicked pbm_lbuttondblclk
end type
global uo_multilineedit uo_multilineedit

type variables
long originX, originY, OriginWidth, OriginHeight
long targetX, TargetY, TargetWidth, TargetHeight
groupbox fgb
end variables

forward prototypes
public function integer of_setgroupbox (groupbox agb)
public function integer of_setorigin ()
public function integer of_settarget (long ax, long ay, long awidth, long aheight)
end prototypes

event doubleclicked;

if height = originheight then
	x = targetx
	y = targety
	width = targetwidth
	height = targetheight
	fgb.x = targetx - 18
	fgb.y = targety - 72
	fgb.width = targetwidth + 37
	fgb.height = targetwidth + 92
else
	x = originx
	y = originy
	width = originwidth
	height = originheight
	fgb.x = originx - 18
	fgb.y = originy - 72
	fgb.width = originwidth + 37
	fgb.height = originwidth + 92
end if
bringtotop = true

end event

public function integer of_setgroupbox (groupbox agb);if not isvalid(agb) then return -1
fgb = agb
return 1
end function

public function integer of_setorigin ();originX = x
OriginY = Y
OriginWidth = Width
OriginHeight = Height

return 1
end function

public function integer of_settarget (long ax, long ay, long awidth, long aheight);//
if isnull(ax) then return -1
if isnull(ay) then return -1
if isnull(awidth) then return -1
if isnull(aheight) then return -1
targetx = ax
targety = ay
targetwidth = awidth
targetheight = aheight
return 1
end function

on uo_multilineedit.create
end on

on uo_multilineedit.destroy
end on

