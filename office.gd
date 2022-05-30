extends Spatial

func _end_office_day():
	Dialogic.set_variable('dressed', 'true')
	Dialogic.set_variable('Time of the day', 'Evening')
	Dialogic.set_variable('location', 'office')
	Dialogic.set_variable('MorningTasks', 'true')
	Dialogic.set_variable('task_breakfast', 'true')
	Dialogic.set_variable('task_sortmail', 'true')
	Dialogic.set_variable('task_go_to_work', 'true')
	Dialogic.set_variable('task_work_checkin', 'true')
	Dialogic.set_variable('task_create_meeting', 'true')
	Dialogic.set_variable('task_computer_work', 'true')
	Dialogic.set_variable('task_fill_excel_sheet', 'true')
	Dialogic.set_variable('task_take_break', 'true')
	Dialogic.set_variable('task_join_virtual_meeting', 'true')
	Dialogic.set_variable('task_get_forms', 'true')
	Dialogic.set_variable('task_lunch', 'true')
	Dialogic.set_variable('task_join_physical_meeting', 'true')
	Dialogic.set_variable('task_call_manager', 'true')
	Dialogic.set_variable('task_more_excel_sheet', 'true')
	Dialogic.set_variable('task_work_new_forms', 'true')
	Dialogic.set_variable('task_take_break_2', 'true')
	Dialogic.set_variable('task_clean_desk', 'true')
	

func _debug_dead():
	Dialogic.set_variable('dressed', 'true')
	Dialogic.set_variable('dead', 'true')
	Dialogic.set_variable('panic', 'true')
	Dialogic.set_variable('Time of the day', 'MorningWork')
	Dialogic.set_variable('location', 'home')
	Dialogic.set_variable('MorningTasks', 'true')

# Called when the node enters the scene tree for the first time.
func _ready():
	#_debug_dead()
	var previous_location = Dialogic.get_variable('location')
	Dialogic.set_variable('previous_location', previous_location)
	print('previous location: ', previous_location)
	Dialogic.set_variable('location', 'office')
	
	if Dialogic.get_variable('dead') == 'true':
		$Player.transform = $CorridorEnter.global_transform
	
	$Player/head/phone/Viewport/Control/Notes.update_notes()


func _on_MeetingArea_body_entered(body):
	var dialog = Dialogic.start('attend meeting')
	add_child(dialog)

func _process(delta):
	if Input.is_action_just_pressed("debug"):
		_end_office_day()
