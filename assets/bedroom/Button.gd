extends Area

onready var mydoor = $".."
onready var mesh = $"../DoorInput"

func action():
	mydoor.toggle_door()
