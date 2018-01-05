$PBExportHeader$w_bugid1401.srw
forward
global type w_bugid1401 from window
end type
end forward

global type w_bugid1401 from window
integer width = 3931
integer height = 1624
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
end type
global w_bugid1401 w_bugid1401

type variables

end variables

event open;long ll_mouse_event , ll_rtn = 0 


ll_mouse_event = message.doubleparm

message.number = 32 
message.longparm = ll_mouse_event
if string(gi_major)+string(gi_minor) <> "126" then 
	ll_rtn = this.event other( ll_mouse_event, 536870912)			//61458
end if 


if ll_rtn = 1 then 
	if isvalid(gw_setvalue) then gw_setvalue.DYNAMIC of_setflag(true)
end if 
end event

on w_bugid1401.create
end on

on w_bugid1401.destroy
end on

event other;long ll_mouse_event
//	
CHOOSE CASE message.number
CASE 32 // WM_SETCURSOR
	// vola se kdyz mys se nezpravuje v aktualnim okne
	ll_mouse_event = message.longparm / 65535				//33684990			//33750525
	
	
	RETURN 1

END CHOOSE

return 0 
end event

