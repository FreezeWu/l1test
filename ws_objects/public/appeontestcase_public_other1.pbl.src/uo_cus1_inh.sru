$PBExportHeader$uo_cus1_inh.sru
forward
global type uo_cus1_inh from uo_cus_1
end type
end forward

global type uo_cus1_inh from uo_cus_1
end type
global uo_cus1_inh uo_cus1_inh

on uo_cus1_inh.create
call super::create
end on

on uo_cus1_inh.destroy
call super::destroy
end on

type p_1 from uo_cus_1`p_1 within uo_cus1_inh
end type

type dp_1 from uo_cus_1`dp_1 within uo_cus1_inh
end type

type cbx_1 from uo_cus_1`cbx_1 within uo_cus1_inh
long textcolor = 134217857
end type

type cb_1 from uo_cus_1`cb_1 within uo_cus1_inh
end type

type hpb_1 from uo_cus_1`hpb_1 within uo_cus1_inh
end type

type gb_1 from uo_cus_1`gb_1 within uo_cus1_inh
end type

