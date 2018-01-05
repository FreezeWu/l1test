$PBExportHeader$nvo_transaction.sru
forward
global type nvo_transaction from transaction
end type
end forward

global type nvo_transaction from transaction
end type
global nvo_transaction nvo_transaction

on nvo_transaction.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_transaction.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

