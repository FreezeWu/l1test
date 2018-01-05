$PBExportHeader$n_errorobject3.sru
forward
global type n_errorobject3 from error
end type
end forward

global type n_errorobject3 from error
event ue_custom01 ( )
end type
global n_errorobject3 n_errorobject3

forward prototypes
public function integer of_custom01 ()
public function integer of_custom03 (integer ai_parm1, ref string as_parm2)
public function integer of_custom02 (integer ai_parm1, ref string as_parm2)
public function string of_custom03 (string as_parm1, ref integer ai_parm2)
end prototypes

event ue_custom01();
gs_output2 = "Error object ue_custom01 event triggered."
end event

public function integer of_custom01 ();

gs_output = "Error object of_custom01 function triggered."

return 1
end function

public function integer of_custom03 (integer ai_parm1, ref string as_parm2);

gs_output = "Error object of_custom03(integer ai_parm1, ref string as_parm2) function triggered."

return 1
end function

public function integer of_custom02 (integer ai_parm1, ref string as_parm2);
ai_parm1 = ai_parm1 * 2

as_parm2 = as_parm2 + " [World]"

gs_output = "Error object of_custom02 function triggered."


return ai_parm1
end function

public function string of_custom03 (string as_parm1, ref integer ai_parm2);

as_parm1 =  as_parm1 + "[World]"

ai_parm2 = ai_parm2 * 2

gs_output = "Error object of_custom03(string as_parm1, ref integer ai_parm2) function triggered."


return as_parm1

end function

on n_errorobject3.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_errorobject3.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;gs_output = "Error object constructor event triggered."
end event

event destructor;gs_output = "Error object destructor event triggered."
end event

