$PBExportHeader$w_mdi_1528.srw
forward
global type w_mdi_1528 from w_mdidock_1528
end type
end forward

global type w_mdi_1528 from w_mdidock_1528
integer height = 1824
windowtype windowtype = mdi!
end type
global w_mdi_1528 w_mdi_1528

on w_mdi_1528.create
call super::create
end on

on w_mdi_1528.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

