extends Spatial


onready var player: KinematicBody = $Player
onready var elevator: Spatial = $"RoomList/ElevatorCorridor/elevator corridor/elevator box"
onready var elevator_entrance: Spatial = $"RoomList/ElevatorCorridor/elevator corridor"


func _debug_evening():
	Dialogic.set_variable('Time of the day', 'Evening')
	Dialogic.set_variable('location', 'office')
	Dialogic.set_variable('previous_location', 'home')
	Dialogic.set_variable('game_just_loaded', 'false')
	Dialogic.set_variable('task_go_to_work', 'true')
	Dialogic.set_variable('task_go_to_home', 'true')
	Dialogic.set_variable('MorningTasks', 'true')
	Dialogic.set_variable('task_sortmail', 'true')
	Dialogic.set_variable('task_breakfast', 'true')
	Dialogic.set_variable('dressed', 'true')
	$"RoomList/ElevatorCorridor/elevator corridor".ignore_first_event = true
	
func _debug_night():
	_debug_evening()
	Dialogic.set_variable('dressed', 'false')
	Dialogic.set_variable('task_vacuum', 'true')
	Dialogic.set_variable('task_pay_transport', 'true')
	Dialogic.set_variable('task_pay_insurance', 'true')
	Dialogic.set_variable('task_dinner', 'true')
	Dialogic.set_variable('task_clean_spam', 'true')
	Dialogic.set_variable('task_reply_dentist', 'true')
#	Dialogic.set_variable('task_create_next_day_todo', 'true')
	Dialogic.set_variable('task_charge_phone', 'true')
#	Dialogic.set_variable('task_clean_kitchen', 'true')
	Dialogic.set_variable('task_take_quick_shower', 'true')

# Called when the node enters the scene tree for the first time.
func _ready():
	var dead: bool = Dialogic.get_variable('dead') == 'true'
	var panic: bool = Dialogic.get_variable('panic') == 'true'
	var time: String = Dialogic.get_variable('Time of the day')
	if panic:
		$"RoomList/Studio/Carpet/letter pile/MeshInstance".visible = false
	if not panic and dead:
		$"RoomList/Studio/Carpet/letter pile".visible = false
	if time != 'Morning':
		pass #TODO
		#$"RoomList/Studio/Carpet/letter pile".visible = false
		#$"RoomList/Studio/Carpet/letter pile/StaticBody/CollisionShape".disabled = true
	
	var previous_location = Dialogic.get_variable('location')
	Dialogic.set_variable('previous_location', previous_location)
	print('HOME previous location ', previous_location)
	if previous_location != 'home':
		var newtransform: Transform
		if dead:
			newtransform = $CorridorEnter.global_transform
		else:
			newtransform = elevator_entrance.find_node('PlayerEnter', false).global_transform
			elevator_entrance.toggle_door()
		player.transform = newtransform
		Dialogic.set_variable('location', 'home')
		previous_location = Dialogic.get_variable('location')
		print('HOME test new location: ', previous_location)
	else:
		#this is supposed to be the sleep
		$Player/head/phone/Viewport/Control/Notes.reset_notes()
	
	if dead:
		$lisa_neighbour.visible = true
		$lisa_neighbour/StaticBody/CollisionShape.disabled = false
	
	if Dialogic.get_variable('bucket_buy_plants') == 'true':
		$RoomList/Studio/Flowers.visible = true
	if Dialogic.get_variable('bucket_cat') == 'true':
		$RoomList/Studio/Carpet/cat_origami.visible = true
		$RoomList/Studio/cat2.visible = true
	if Dialogic.get_variable('bucket_grow_food') == 'true':
		$RoomList/CarrotPot.visible = true

	$Player/head/phone/Viewport/Control/Notes.update_notes()

func _input(event):
	if Input.is_action_just_pressed("debug"):
		#self._debug_evening()
		self._debug_night()
