$PBExportHeader$nnvo_1.sru
forward
global type nnvo_1 from nonvisualobject
end type
end forward

global type nnvo_1 from nonvisualobject
end type
global nnvo_1 nnvo_1

on nnvo_1.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nnvo_1.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

