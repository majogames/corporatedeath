extends Control

var tasks1: Dictionary = {
	'breakfast': false,
	'sortmail': false,
	'go_to_work': false,
	'work_checkin': false,
	'create_meeting': false,
	'computer_work': false,
	'fill_excel_sheet': false,
	'take_break': false,
}

var tasks2: Dictionary = {
	'join_virtual_meeting': false,
	'get_forms': false,
	'lunch': false,
	'join_physical_meeting': false,
	'call_manager': false,
	'more_excel_sheet': false,
	'work_new_forms': false,
	'take_break_2': false,
}

var tasks3: Dictionary = {
	'clean_desk': false,
	'clock_out_work': false,
	'go_to_home': false,
	'vacuum': false,
	'pay_transport': false,
	'pay_insurance': false,
	'dinner': false,
	'clean_spam': false,
}

var tasks4: Dictionary = {
	'reply_dentist': false,
	'create_next_day_todo': false,
	'charge_phone': false,
	'clean_kitchen': false,
	'take_quick_shower': false,
	'sleep': false,
}

onready var page1 = $Notes1
onready var page2 = $Notes2
onready var page3 = $Notes3
onready var page4 = $Notes4
var page = 1 setget set_page

func _ready():
	print("Notes app full path is: ", get_path())
	update_notes()

func set_page(newpage):
	if newpage < 1 or newpage > 4:
		print("no page ", page, " found")
		return
		
	page1.visible = newpage == 1
	page2.visible = newpage == 2
	page3.visible = newpage == 3
	page4.visible = newpage == 4
	page = newpage
	update_notes()
	
func update_notes():
	print("diocane")
	if page == 1:
		$Ticks/Tick1.visible = _test_var('task_breakfast')
		$Ticks/Tick2.visible = _test_var('task_sortmail')
		$Ticks/Tick3.visible = _test_var('task_go_to_work')
		$Ticks/Tick4.visible = _test_var('task_work_checkin')
		$Ticks/Tick5.visible = _test_var('task_create_meeting')
		$Ticks/Tick6.visible = _test_var('task_computer_work')
		$Ticks/Tick7.visible = _test_var('task_fill_excel_sheet')
		$Ticks/Tick8.visible = _test_var('task_take_break')
	elif page == 2:
		$Ticks/Tick1.visible = _test_var('task_join_virtual_meeting')
		$Ticks/Tick2.visible = _test_var('task_get_forms')
		$Ticks/Tick3.visible = _test_var('task_lunch')
		$Ticks/Tick4.visible = _test_var('task_join_physical_meeting')
		$Ticks/Tick5.visible = _test_var('task_call_manager')
		$Ticks/Tick6.visible = _test_var('task_more_excel_sheet')
		$Ticks/Tick7.visible = _test_var('task_work_new_forms')
		$Ticks/Tick8.visible = _test_var('task_take_break_2')
	elif page == 3:
		$Ticks/Tick1.visible = _test_var('task_clean_desk')
		$Ticks/Tick2.visible = _test_var('task_clock_out_work')
		$Ticks/Tick3.visible = _test_var('task_go_to_home')
		$Ticks/Tick4.visible = _test_var('task_vacuum')
		$Ticks/Tick5.visible = _test_var('task_pay_transport')
		$Ticks/Tick6.visible = _test_var('task_pay_insurance')
		$Ticks/Tick7.visible = _test_var('task_dinner')
		$Ticks/Tick8.visible = _test_var('task_clean_spam')
	elif page == 4:
		$Ticks/Tick1.visible = _test_var('task_reply_dentist')
		#$Ticks/Tick2.visible = _test_var('task_create_next_day_todo')
		$Ticks/Tick2.visible = _test_var('task_charge_phone')
		#$Ticks/Tick4.visible = _test_var('task_clean_kitchen')
		$Ticks/Tick3.visible = _test_var('task_take_quick_shower')
		$Ticks/Tick4.visible = _test_var('task_sleep')
		$Ticks/Tick5.visible = false
		$Ticks/Tick6.visible = false
		$Ticks/Tick7.visible = false
		$Ticks/Tick8.visible = false
	else:
		print("ERROR NO PAGE 4")

func reset_notes():
	_reset_var('task_breakfast')
	_reset_var('task_sortmail')
	_reset_var('task_go_to_work')
	_reset_var('task_work_checkin')
	_reset_var('task_create_meeting')
	_reset_var('task_computer_work')
	_reset_var('task_fill_excel_sheet')
	_reset_var('task_take_break')
	_reset_var('task_join_virtual_meeting')
	_reset_var('task_get_forms')
	_reset_var('task_lunch')
	_reset_var('task_join_physical_meeting')
	_reset_var('task_call_manager')
	_reset_var('task_more_excel_sheet')
	_reset_var('task_work_new_forms')
	_reset_var('task_take_break_2')
	_reset_var('task_clean_desk')
	_reset_var('task_clock_out_work')
	_reset_var('task_go_to_home')
	_reset_var('task_vacuum')
	_reset_var('task_pay_transport')
	_reset_var('task_pay_insurance')
	_reset_var('task_dinner')
	_reset_var('task_clean_spam')
	_reset_var('task_reply_dentist')
#	_reset_var('task_create_next_day_todo')
	_reset_var('task_charge_phone')
#	_reset_var('task_clean_kitchen')
	_reset_var('task_take_quick_shower')
	_reset_var('task_sleep')
	_reset_var('MorningTasks')
	
	
func _test_var(name: String):
	return Dialogic.get_variable(name, 'false') == 'true'

func _reset_var(name: String):
	Dialogic.set_variable(name, 'false')

func _on_HomeButton_pressed():
	var newpage = page - 1
	if newpage < 1:
		get_parent()._on_HomeButton_pressed()
	else:
		self.page = newpage


func _on_NextButton_pressed():
	var newpage = page + 1
	if newpage <= 4:
		self.page = newpage
