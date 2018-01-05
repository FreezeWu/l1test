$PBExportHeader$w_f132a03_main.srw
forward
global type w_f132a03_main from window
end type
end forward

global type w_f132a03_main from window
integer width = 2533
integer height = 1408
boolean titlebar = true
string title = "MainWindowType"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
end type
global w_f132a03_main w_f132a03_main

on w_f132a03_main.create
end on

on w_f132a03_main.destroy
end on

event open;w_f132a03w01_openwithparm.wf_OutPut('Message.LongParm = ' + String(Message.LongParm), False)

end event

