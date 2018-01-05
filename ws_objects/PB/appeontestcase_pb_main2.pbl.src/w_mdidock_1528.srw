$PBExportHeader$w_mdidock_1528.srw
forward
global type w_mdidock_1528 from window
end type
type mdi_1 from mdiclient within w_mdidock_1528
end type
end forward

global type w_mdidock_1528 from window
integer width = 3378
integer height = 1740
boolean titlebar = true
string title = "Untitled"
string menuname = "m_mdi_1528"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdidockhelp!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
end type
global w_mdidock_1528 w_mdidock_1528

type variables
boolean ib_timer
end variables

forward prototypes
public function string wf_output ()
public subroutine wf_start ()
public subroutine wf_stop ()
end prototypes

public function string wf_output ();string ls_rtn
long  ll_start
//等待1秒
ll_start = cpu()
do while true
	yield()
	if cpu() - ll_start > 1200 then
			exit
	end if
loop

ls_rtn = "MdiTimer is "+string(ib_timer)

return ls_rtn
end function

public subroutine wf_start ();ib_timer = false
timer(1)
end subroutine

public subroutine wf_stop ();timer(0,this)
long  ll_start
//等待1秒
ll_start = cpu()
do while true
	yield()
	if cpu() - ll_start > 1200 then
		ib_timer = false
			exit
	end if
loop


end subroutine

on w_mdidock_1528.create
if this.MenuName = "m_mdi_1528" then this.MenuID = create m_mdi_1528
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_mdidock_1528.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event open;wf_start()

end event

event timer;ib_timer = true
end event

type mdi_1 from mdiclient within w_mdidock_1528
long BackColor=268435456
end type

