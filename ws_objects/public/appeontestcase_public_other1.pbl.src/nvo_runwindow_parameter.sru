$PBExportHeader$nvo_runwindow_parameter.sru
forward
global type nvo_runwindow_parameter from nonvisualobject
end type
end forward

global type nvo_runwindow_parameter from nonvisualobject
end type
global nvo_runwindow_parameter nvo_runwindow_parameter

type variables
//
//integer ii_user          //who is login
//integer ii_product    //which product we test (1, JS; 2, Atl; 3, .Net; ......)
long    il_assignid     //we need to save test result, the test result is relative taskid
long    il_windowid   //the window id
long    il_categoryid  //the categoryid
long    il_envidefineid  //which envinorment we select
long    il_resultmasterid   // we save test result,
long    il_taskwindowid    
//long    il_featureid // the featureid

string  is_where  // The feature id, at dw retrieve, we need to filter it
string  is_auto   // the window is autorun window?, 1 true; 0 false
string  is_winname    // the window name
string  is_status = '3'
string  is_filter
string  is_Fpoint

//boolean ib_feature   // Is Feature task mode
//boolean ib_administrator // is administrator login
//boolean ib_environment   // whether we think about environment parameter
boolean ib_newtest
boolean ib_filter 
end variables

on nvo_runwindow_parameter.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_runwindow_parameter.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

