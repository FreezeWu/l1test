$PBExportHeader$n_errorobject2.sru
forward
global type n_errorobject2 from error
end type
end forward

global type n_errorobject2 from error
event ue_custom01 ( )
end type
global n_errorobject2 n_errorobject2

forward prototypes
public function integer of_custom01 ()
public function integer of_custom02 (integer ai_parm1, ref string as_parm2)
public function integer of_custom03 (integer ai_parm1, ref string as_parm2)
public function integer of_custom03 (string as_parm1, ref integer ai_parm2)
end prototypes

public function integer of_custom01 ();return 1
end function

public function integer of_custom02 (integer ai_parm1, ref string as_parm2);
ai_parm1 = ai_parm1 * 2

as_parm2 = "Modified [" + as_parm2 + "]"

Messagebox("info", "Function of_custom02 triggered.")


return 1
end function

public function integer of_custom03 (integer ai_parm1, ref string as_parm2);

return 1
end function

public function integer of_custom03 (string as_parm1, ref integer ai_parm2);  

as_parm1 =  "[modified]" + as_parm1 

ai_parm2 = ai_parm2 * 2

Messagebox("info", "Function of_custom03(as_aprm1, ai_parm2) triggered.")


return 1

end function

on n_errorobject2.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_errorobject2.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

