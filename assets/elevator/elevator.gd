extends Spatial

var door_open = false

onready var elevator = $"elevator box/AnimationPlayer"
onready var elevator2 = $"elevator box2/AnimationPlayer"

var ignore_first_event = true
var ready = false

func _ready():
	ready = true
	if Dialogic.get_variable('previous_location') == 'home':
		ignore_first_event = false

func toggle_door():
	door_open = !door_open
	if door_open == true:
		$AnimationPlayer.play("OpenExternal")
		elevator.play("Open")
		elevator2.play("Open")
	else:
		$AnimationPlayer.play_backwards("OpenExternal")
		elevator.play_backwards("Open")
		elevator2.play_backwards("Open")


func home_on_Area_body_entered(body):
	if ignore_first_event or !ready:
		ignore_first_event = false
		return
		
	var dialog = Dialogic.start('Elevator')
	add_child(dialog)
