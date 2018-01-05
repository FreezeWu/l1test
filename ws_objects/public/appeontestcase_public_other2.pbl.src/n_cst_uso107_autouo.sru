$PBExportHeader$n_cst_uso107_autouo.sru
forward
global type n_cst_uso107_autouo from nonvisualobject
end type
end forward

global type n_cst_uso107_autouo from nonvisualobject autoinstantiate
event ue_customevent ( )
event ue_same ( )
end type

type variables
String is_str = "Create"

String is_status = 'No Event Triggered'
end variables

forward prototypes
public subroutine of_function ()
public subroutine of_this_function ()
public subroutine of_user ()
public subroutine of_this_user ()
public subroutine of_override (integer ai_data)
public subroutine of_override (string as_data)
public subroutine of_override (integer ai_data, string as_data)
public subroutine of_same ()
public subroutine of_same_user ()
public subroutine of_override_user (string as_call)
public function string of_getmystatus ()
public function string of_getstatus (n_cst_uso107_autouo auo_object)
end prototypes

event ue_customevent();is_status = 'Call UserObject Event n_cst_uso107_autouo.ue_customevent()'
end event

event ue_same();is_status = 'Call UserObject Event n_cst_uso107_autouo.ue_same()'
end event

public subroutine of_function ();is_status = 'Call UserObject Function n_cst_uso107_autouo.of_function()'
end subroutine

public subroutine of_this_function ();is_status = 'Call UserObject Function n_cst_uso107_autouo.of_this_function()'

end subroutine

public subroutine of_user ();of_function()
end subroutine

public subroutine of_this_user ();this.of_this_function()
end subroutine

public subroutine of_override (integer ai_data);is_status = 'Call UserObject Function n_cst_uso107_autouo.of_override(integer ai_data)'
end subroutine

public subroutine of_override (string as_data);is_status = 'Call UserObject Function n_cst_uso107_autouo.of_override(string as_data)'
end subroutine

public subroutine of_override (integer ai_data, string as_data);is_status = 'Call UserObject Function n_cst_uso107_autouo.of_override(integer ai_data, string as_data)'
end subroutine

public subroutine of_same ();is_status = 'Call UserObject Function n_cst_uso107_autouo.of_same()'

end subroutine

public subroutine of_same_user ();of_same()
end subroutine

public subroutine of_override_user (string as_call);////////////////////////////////////////////////////////////////
//Function : wf_override_user ; Choose Override Function
//Argument : String as_call ;  The Argument For Choose Override
//Output   : none
//Designer : 
//Date     :
////////////////////////////////////////////////////////////////
Choose Case as_call
	Case '1'
		of_override(1)
	Case '2'
		of_override('1')
	Case Else
		of_override(1,'1')
End Choose 
		
end subroutine

public function string of_getmystatus ();return of_getstatus(this)
end function

public function string of_getstatus (n_cst_uso107_autouo auo_object);return auo_object.is_status
end function

on n_cst_uso107_autouo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso107_autouo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;is_status = 'Call UserObject Event n_cst_uso107_autouo.constructor()'
end event

