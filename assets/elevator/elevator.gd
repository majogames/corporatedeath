extends Spatial

var door_open = false

onready var elevator = $"elevator box/AnimationPlayer"

func toggle_door():
	door_open = !door_open
	if door_open == true:
		$AnimationPlayer.play("OpenExternal")
		elevator.play("Open")
	else:
		$AnimationPlayer.play_backwards("OpenExternal")
		elevator.play_backwards("Open")
