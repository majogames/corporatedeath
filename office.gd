extends Spatial

func _debug_dead():
	Dialogic.set_variable('dressed', 'true')
	Dialogic.set_variable('dead', 'true')
	Dialogic.set_variable('panic', 'true')
	Dialogic.set_variable('Time of the day', 'MorningWork')
	Dialogic.set_variable('location', 'home')

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

#func _process(delta):
#	if Input.is_action_just_pressed("debug"):
