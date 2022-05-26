extends Spatial

var door_open = false

func toggle_door():
	door_open = !door_open
	if door_open == true:
		$AnimationPlayer.play("DoorOpen")
	else:
		$AnimationPlayer.play_backwards("DoorOpen")
