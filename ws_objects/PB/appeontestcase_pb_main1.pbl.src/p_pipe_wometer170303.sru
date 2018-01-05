$PBExportHeader$p_pipe_wometer170303.sru
$PBExportComments$Inherited from pipeline object. No status information available
forward
global type p_pipe_wometer170303 from pipeline
end type
end forward

global type p_pipe_wometer170303 from pipeline
end type
global p_pipe_wometer170303 p_pipe_wometer170303

type variables
statictext st_read,st_written,st_errors
end variables

on p_pipe_wometer170303.create
call super::create
TriggerEvent( this, "constructor" )
end on

on p_pipe_wometer170303.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

