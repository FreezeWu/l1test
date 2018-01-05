$PBExportHeader$nvo_indextest.sru
forward
global type nvo_indextest from nonvisualobject
end type
end forward

global type nvo_indextest from nonvisualobject
end type
global nvo_indextest nvo_indextest

type variables
private:
str_index istr_index[]

str_index istr_ind

str_index_not_auto istr_index_not_auto[]
end variables

forward prototypes
public subroutine create_autoinstance ()
public subroutine create_not_autoinstance ()
end prototypes

public subroutine create_autoinstance ();long ll_i

//MessageBox ( "NVO_indextest", "Begin create_autoinstance" )
str_index lstr_index[]

for ll_i = 1 to 2 
	lstr_index[ll_i].name = "Appeon"
	lstr_index[ll_i].index.of_InitIndex( 2, "$" )
	istr_ind.index.of_InitIndex( 2, "$" )
	
	istr_index[ll_i].index.of_InitIndex( 2, "$" )
	if isvalid(istr_index[ll_i].index) then
		gs_output = 'valid'
	else
		gs_output = 'invalid'
	end if
	istr_index[ll_i].index.of_addIndex("Test" + string(ll_i))
NEXT 
	
//MessageBox ( "NVO_indextest", "End create_autoinstance" )	
end subroutine

public subroutine create_not_autoinstance ();long ll_i 

MessageBox ( "NVO_indextest", "BEGIN create_not_autoinstance" )

for ll_i  = 1 to 2
	istr_index_not_auto[ ll_i ].index = CREATE n_index_not_auto
	istr_index_not_auto[ ll_i ].index.of_InitIndex( 2, "$" )
	istr_index_not_auto[ll_i].index.of_addIndex("Test" + string(ll_i))	
NEXT 

MessageBox ( "NVO_indextest", "END create_not_autoinstance" )
end subroutine

on nvo_indextest.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_indextest.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

