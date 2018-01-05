$PBExportHeader$w_sheet_1528.srw
forward
global type w_sheet_1528 from window
end type
type timing_1 from timing within w_sheet_1528
end type
end forward

global type w_sheet_1528 from window
integer width = 3378
integer height = 1600
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
timing_1 timing_1
end type
global w_sheet_1528 w_sheet_1528

type variables
boolean ib_sheettimer,ib_timing
string is_log
long il_log
end variables

forward prototypes
public function integer of_stop ()
public subroutine of_start ()
public function string of_output ()
end prototypes

public function integer of_stop ();timer(0,this)
timing_1.stop( )
long  ll_start
//等待1秒
ll_start = cpu()
do while true
	yield()
	if cpu() - ll_start > 1010 then
		ib_sheettimer = false
		ib_timing = false
		exit
	end if
loop


return 1
end function

public subroutine of_start ();ib_sheettimer = false
ib_timing = false
timer(1)
timing_1.start(1)

end subroutine

public function string of_output ();//返回timer和timing触发结果
string ls_return
long  ll_start
//等待1秒
ll_start = cpu()
do while true
	yield()
	if cpu() - ll_start > 1200 then
			exit
	end if
loop

ls_return = "SheetTimer is "+string(ib_sheettimer)+";Timing is "+string(ib_timing)

return ls_return
end function

on w_sheet_1528.create
this.timing_1=create timing_1
end on

on w_sheet_1528.destroy
destroy(this.timing_1)
end on

event open;//开启timer事件
of_start()
//is_log = "timer.txt"
//filedelete(is_log)
//il_log = fileopen(is_log,linemode!,write!,shared!,append!,encodingutf8!)
end event

event timer;ib_sheettimer = true

string ls_log

ls_log = string(now())+":Timer"

//filewrite(il_log,ls_log)

end event

type timing_1 from timing within w_sheet_1528 descriptor "pb_nvo" = "true" 
end type

on timing_1.create
call super::create
TriggerEvent( this, "constructor" )
end on

on timing_1.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event timer;ib_timing = true

string ls_log

ls_log = string(now())+":Timing"

//filewrite(il_log,ls_log)
end event

