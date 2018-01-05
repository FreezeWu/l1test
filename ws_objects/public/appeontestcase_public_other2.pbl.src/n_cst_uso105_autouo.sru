$PBExportHeader$n_cst_uso105_autouo.sru
forward
global type n_cst_uso105_autouo from nonvisualobject
end type
end forward

global type n_cst_uso105_autouo from nonvisualobject autoinstantiate
end type

type variables
String is_str1 = "Create"
String is_str2

Date id_date1 = 2000-01-01
Date id_date2

n_cst_uso105_customautoclass iuo_autouo

String is_samename = 'Variable is_samename inner n_cst_uso105_autouo'
end variables

forward prototypes
public function string of_dateinstance ()
public function string of_objectinstance ()
public function string of_same ()
public function string of_string ()
public function string of_strinstance ()
public function string of_this_string ()
end prototypes

public function string of_dateinstance ();Return 'id_date1 = ' + String(id_date1) + ', id_date2 = ' + String(id_date2)
end function

public function string of_objectinstance ();Return 'iuo_autouo.is_str = ' + iuo_autouo.is_str
end function

public function string of_same ();Return is_samename
end function

public function string of_string ();Return 'is_str1 = ' + is_str1
end function

public function string of_strinstance ();Return 'is_str1 = ' + is_str1 + ', is_str2 = ' + is_str2

end function

public function string of_this_string ();Return 'This.is_str1 = ' + This.is_str1
end function

on n_cst_uso105_autouo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_uso105_autouo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

