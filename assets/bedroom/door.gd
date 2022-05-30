extends Spatial

var door_open = false
export var enabled = false
export var homedoor = false
var dialog: Node = null

func toggle_door():
	if !enabled:
		# door is disabled
		return
		
	if homedoor:
		if is_instance_valid(dialog):
			print("dialog still running")
			return
		
		if Dialogic.get_variable('has_bucket_list') == 'true':
			_toggle_door()
			return
		
		var time_of_day = Dialogic.get_variable("Time of the day")
		if time_of_day == 'Morning':
			dialog = Dialogic.start('Home door')
			add_child(dialog)
		var tasks_done = Dialogic.get_variable("MorningTasks")
		if tasks_done != 'true':
			return
	
	_toggle_door()
	
func _toggle_door():
	door_open = !door_open
	if door_open == true:
		$AnimationPlayer.play("DoorOpen")
	else:
		$AnimationPlayer.play_backwards("DoorOpen")
