extends Spatial

var door_open = false

onready var elevator = $"elevator box/AnimationPlayer"
onready var elevator2 = $"elevator box2/AnimationPlayer"


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
	var dialog = Dialogic.start('Elevator')
	add_child(dialog)
