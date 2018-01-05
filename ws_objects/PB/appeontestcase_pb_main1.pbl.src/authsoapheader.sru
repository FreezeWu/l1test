$PBExportHeader$authsoapheader.sru
$PBExportComments$Proxy imported from Web service using Web Service Proxy Generator.
forward
    global type AuthSoapHeader from nonvisualobject
    end type
end forward

global type AuthSoapHeader from nonvisualobject
end type

type variables
    string PassWord
    string UserName
    any AnyAttr[]
    string EncodedMustUnderstand
    string EncodedMustUnderstand12
    boolean MustUnderstand
    string Actor
    string Role
    boolean DidUnderstand
    string EncodedRelay
    boolean Relay
end variables

on AuthSoapHeader.create
call super::create
TriggerEvent( this, "constructor" )
end on

on AuthSoapHeader.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

