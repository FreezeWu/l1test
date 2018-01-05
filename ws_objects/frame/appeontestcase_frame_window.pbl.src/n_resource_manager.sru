$PBExportHeader$n_resource_manager.sru
forward
global type n_resource_manager from nonvisualobject
end type
end forward

global type n_resource_manager from nonvisualobject autoinstantiate
end type

forward prototypes
public function integer f_insert_resource (string as_filename, string as_resource)
public function integer f_update_resource (string as_filename, string as_resource)
public function integer f_delete_resource (string as_filename)
public function string f_get_resource (string as_filename)
end prototypes

public function integer f_insert_resource (string as_filename, string as_resource);integer li_count
select count(1) into :li_count from caseresfile where filename = :as_filename;
if li_count > 0 then
	Return f_update_resource(as_filename,  as_resource)
else	
	insert into caseresfile (filename, filestring) values (:as_filename,: as_resource);
	Commit;
	Return 1
end if

end function

public function integer f_update_resource (string as_filename, string as_resource);Update caseresfile set filestring = :as_resource where filename = :as_filename;
Commit;
Return 1
end function

public function integer f_delete_resource (string as_filename);delete from caseresfile where filename = :as_filename;
Commit;
Return 1
end function

public function string f_get_resource (string as_filename);string ls_return
blob		lblob

SELECTBLOB filestring into :lblob  from caseresfile where filename = :as_filename;


ls_return = String(lblob)


Return ls_return
end function

on n_resource_manager.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_resource_manager.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

