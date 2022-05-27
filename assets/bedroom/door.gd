extends Spatial

var door_open = false
export var enabled = false

func toggle_door():
	if !enabled:
		return
	if TaskList.daytime == TaskList.DayTime.Morning:
		print("TODO text: first I have to complete my morning tasks")
		return
	door_open = !door_open
	if door_open == true:
		$AnimationPlayer.play("DoorOpen")
	else:
		$AnimationPlayer.play_backwards("DoorOpen")
