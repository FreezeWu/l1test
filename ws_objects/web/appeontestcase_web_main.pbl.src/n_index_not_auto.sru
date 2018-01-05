$PBExportHeader$n_index_not_auto.sru
$PBExportComments$Index zum schnelleren Zugriff auf per String angesprochene unsortierte Arrays
forward
global type n_index_not_auto from nonvisualobject
end type
end forward

global type n_index_not_auto from nonvisualobject
end type
global n_index_not_auto n_index_not_auto

type variables
Protected:

string		is_index,&
		is_Separator
		
long		il_MaxIndexSizeAndOne,&
		il_MaxIndexSize,&
		il_IndexEntries

end variables

forward prototypes
public function string of_GetValues ()
public function long of_findinindex (readonly string as_string)
public subroutine of_initindex (long al_indexsize, readonly character ac_separator)
public subroutine of_setvalues (long al_entries, string as_values)
public function long of_addindex (readonly string as_string)
public function long of_getvalues (ref string as_values[])
public function long of_addindexunique (readonly string as_string)
public subroutine of_setvalues (string as_values)
public function string of_getvalues (string as_separator)
public subroutine of_clear ()
public function long of_getsize ()
public function long of_getvalues (ref long al_values[])
public function long of_getvalues (ref decimal adec_values[])
public function string of_test (string as_var1, string as_var2, ref string as_ref1, ref string as_ref2, ref string as_ref3, ref string as_ref4, ref string as_ref5, ref string as_ref6, ref string as_ref7, ref string as_ref8, ref string as_ref9, ref string as_refty)
end prototypes

public function string of_GetValues ();RETURN is_Index
end function

public function long of_findinindex (readonly string as_string);/*********************************************************************
Objekt:		n_index

Vorfahr:		nonvisualobject_anc 

Funktion:	of_findinindex

Zugriff:		Public

Zweck:		

Parameter:	readonly	string	as_string

Return:		LONG

Datum			Entwickler		Kommentar
--------------------------------------------------------------------
23.11.2004	XGXTIWE			as_String auf Leerstring geprüft, weil die olle Security mit leeren Schlüsseln zugreift
20.05.2010	XGWSAST			Division durch 0 vermieden
--------------------------------------------------------------------*/


IF as_String = "" OR il_MaxIndexSizeAndOne = 0 THEN
	RETURN 0
ELSE
	RETURN ( Pos( is_Index, is_Separator + as_String + is_Separator ) + il_MaxIndexSize ) / il_MaxIndexSizeAndOne
END IF
end function

public subroutine of_initindex (long al_indexsize, readonly character ac_separator);il_MaxIndexSizeAndOne = al_IndexSize + 1
il_MaxIndexSize = al_IndexSize
is_Separator = ac_Separator
is_Index = ac_Separator
il_IndexEntries = 0
end subroutine

public subroutine of_setvalues (long al_entries, string as_values);is_Index = as_Values
il_IndexEntries = al_Entries

end subroutine

public function long of_addindex (readonly string as_string);long	ll_AnzSeparators
long	ll_Index

ll_Index = of_FindInIndex( as_string )
IF ll_Index = 0 THEN
	ll_AnzSeparators = il_MaxIndexSizeAndOne - Len( as_String )
	IF ll_AnzSeparators > 0 THEN
		is_Index += as_String + Fill( is_Separator, ll_AnzSeparators )
		il_IndexEntries ++
		ll_index = il_IndexEntries
	ELSE
		ll_index = -1
	END IF
END IF

RETURN ll_Index

end function

public function long of_getvalues (ref string as_values[]);/*********************************************************************
Objekt:		n_index

Vorfahr:		nonvisualobject_anc 

Funktion:	of_getvalues

Zugriff:		Public

Zweck:		

Parameter:	reference	string	as_values[]

Return:		LONG

Datum			Entwickler		Kommentar
--------------------------------------------------------------------
14.09.2006	XGXTIWE			Initial Version of Comment
--------------------------------------------------------------------*/
long	ll_i, ll_Anz
long	ll_StartPos = 2

FOR ll_i = 1 TO il_IndexEntries
	ll_Anz ++
	as_Values[ ll_Anz ] = Mid( is_index, ll_StartPos, Pos( is_Index, is_Separator, ll_StartPos ) - ll_StartPos  )
	ll_StartPos += il_MaxIndexSizeAndOne
NEXT
RETURN il_IndexEntries
end function

public function long of_addindexunique (readonly string as_string);long	ll_AnzSeparators
long	ll_Index

ll_AnzSeparators = il_MaxIndexSizeAndOne - Len( as_String )
IF ll_AnzSeparators > 0 THEN
	is_Index += as_String + Fill( is_Separator, ll_AnzSeparators )
	il_IndexEntries ++
	ll_index = il_IndexEntries
ELSE
	ll_index = -1
END IF
RETURN ll_Index

end function

public subroutine of_setvalues (string as_values);is_Index = as_Values
il_IndexEntries = Len( is_Index ) / il_MaxIndexSizeAndOne

end subroutine

public function string of_getvalues (string as_separator);long	ll_i
long		ll_StartPos = 2
string	ls_Value

FOR ll_i = 1 TO il_IndexEntries
	ls_Value += Mid( is_index, ll_StartPos, Pos( is_Index, is_Separator, ll_StartPos ) - ll_StartPos  ) + as_separator
	ll_StartPos += il_MaxIndexSizeAndOne
NEXT

ls_Value = Left( ls_Value, Len(ls_Value) - Len ( as_separator ) )


RETURN ls_Value
end function

public subroutine of_clear ();/*********************************************************************
Objekt:		n_index

Vorfahr:		nonvisualobject_anc 

Subroutine:	of_Clear

Zugriff:		Public

Zweck:		

Parameter:	value	integer	

Return:		(None)

Datum			Entwickler		Kommentar
--------------------------------------------------------------------
24.01.2006	XGXTIWE			Initial Version
--------------------------------------------------------------------*/
il_indexentries = 0
is_index = is_Separator
end subroutine

public function long of_getsize ();/*********************************************************************
Objekt:		n_index

Vorfahr:		nonvisualobject_anc 

Funktion:	of_GetSize

Zugriff:		Public

Zweck:		

Parameter:	value	integer	

Return:		LONG

Datum			Entwickler		Kommentar
--------------------------------------------------------------------
12.04.2006	XGXTIWE			Initial Version
--------------------------------------------------------------------*/
RETURN il_indexentries
end function

public function long of_getvalues (ref long al_values[]);/*********************************************************************
Objekt:		n_index

Vorfahr:		nonvisualobject_anc 

Funktion:	of_GetValues

Zugriff:		Public

Zweck:		

Parameter:	reference	long	al_values[]

Return:		LONG

Datum			Entwickler		Kommentar
--------------------------------------------------------------------
14.09.2006	XGXTIWE			Initial Version
--------------------------------------------------------------------*/
long	ll_i, ll_Anz
long	ll_StartPos = 2

FOR ll_i = 1 TO il_IndexEntries
	ll_Anz ++
	al_Values[ ll_Anz ] = Long( Mid( is_index, ll_StartPos, Pos( is_Index, is_Separator, ll_StartPos ) - ll_StartPos  ) )
	ll_StartPos += il_MaxIndexSizeAndOne
NEXT
RETURN il_IndexEntries
end function

public function long of_getvalues (ref decimal adec_values[]);/*********************************************************************
Objekt:		n_index

Vorfahr:		nonvisualobject_anc 

Funktion:	of_GetValues

Zugriff:		Public

Zweck:		

Parameter:	reference	decimal	al_values[]

Return:		LONG

Datum			Entwickler		Kommentar
--------------------------------------------------------------------
02.01.2007	XGWSJWE			Initial Version
--------------------------------------------------------------------*/
long	ll_i, ll_Anz
long	ll_StartPos = 2

FOR ll_i = 1 TO il_IndexEntries
	ll_Anz ++
	adec_Values[ ll_Anz ] = dec( Mid( is_index, ll_StartPos, Pos( is_Index, is_Separator, ll_StartPos ) - ll_StartPos  ) )
	ll_StartPos += il_MaxIndexSizeAndOne
NEXT
RETURN il_IndexEntries
end function

public function string of_test (string as_var1, string as_var2, ref string as_ref1, ref string as_ref2, ref string as_ref3, ref string as_ref4, ref string as_ref5, ref string as_ref6, ref string as_ref7, ref string as_ref8, ref string as_ref9, ref string as_refty);string ls_str

ls_str = as_ref1 + as_ref2 + as_ref3 + as_ref4 + as_ref5 + as_refty

return ls_str
end function

on n_index_not_auto.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_index_not_auto.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

