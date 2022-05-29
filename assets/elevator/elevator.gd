extends Spatial

var door_open = false

onready var elevator = $"elevator box/AnimationPlayer"
onready var elevator2 = $"elevator box2/AnimationPlayer"

var ignore_first_event = true
var ready = false

func _ready():
	print('A ', ready, ' ', ignore_first_event)
	ready = true
	if Dialogic.get_variable('previous_location') == 'home':
		print('B ', ready, ' ', ignore_first_event)
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
	print('C ', ready, ' ', ignore_first_event)
	if ignore_first_event or !ready:
		print('D ', ready, ' ', ignore_first_event)
		ignore_first_event = false
		return
		
	print('E ', ready, ' ', ignore_first_event)
	var dialog = Dialogic.start('Elevator')
	add_child(dialog)
