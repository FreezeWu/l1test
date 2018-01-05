$PBExportHeader$w_inheritance.srw
forward
global type w_inheritance from w_base_case
end type
type uo_ancestor from u_parent within w_inheritance
end type
type uo_1 from u_inherit within w_inheritance
end type
end forward

global type w_inheritance from w_base_case
uo_ancestor uo_ancestor
uo_1 uo_1
end type
global w_inheritance w_inheritance

forward prototypes
public subroutine of_testcase_point_module ()
public subroutine of_testcase_point_module1 ()
public subroutine of_testcase_point_module2 ()
end prototypes

public subroutine of_testcase_point_module ();

uo_1.cb_update.triggerevent("clicked")
uo_1.cb_insert.triggerevent("clicked")
uo_1.cb_retrieve.triggerevent("clicked")
uo_1.cb_delete.triggerevent("clicked")

is_resultlog += wf_result_add("testcasepoint1", "Inheritance for relation", &
		                                    uo_1.cb_update.visible = true and uo_1.cb_insert.visible = true and &
										uo_1.cb_retrieve.visible = true and uo_1.cb_delete.visible = true)
end subroutine

public subroutine of_testcase_point_module1 ();
is_resultlog += wf_result_add("testcasepoint2", "Inheritance for property", &
		                                    uo_1.cb_update.text = 'update_test' and uo_1.cb_insert.text = 'insert_test' and &
										uo_1.cb_retrieve.text = 'retrieve_test' and uo_1.cb_delete.text = 'delete_test')
end subroutine

public subroutine of_testcase_point_module2 ();uo_1.cb_extend.triggerevent("clicked")
uo_ancestor.cb_extend.triggerevent("clicked")


is_resultlog += wf_result_add("testcasepoint3", "Extend AncestorScript", &
		                                    uo_1.cb_extend.text = 'inherit' and uo_ancestor.cb_extend.text = 'ancestor' )

end subroutine

on w_inheritance.create
int iCurrent
call super::create
this.uo_ancestor=create uo_ancestor
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_ancestor
this.Control[iCurrent+2]=this.uo_1
end on

on w_inheritance.destroy
call super::destroy
destroy(this.uo_ancestor)
destroy(this.uo_1)
end on

type uo_ancestor from u_parent within w_inheritance
integer x = 73
integer y = 592
integer width = 1705
integer height = 448
integer taborder = 50
end type

on uo_ancestor.destroy
call u_parent::destroy
end on

type uo_1 from u_inherit within w_inheritance
integer x = 55
integer y = 56
integer width = 1714
integer height = 412
integer taborder = 10
end type

on uo_1.destroy
call u_inherit::destroy
end on

