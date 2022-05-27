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
			#dialog still running
			return
		
		var time_of_day = Dialogic.get_variable("Time of the day")
		var tasks_done = Dialogic.get_variable("MorningTasks")
		if time_of_day == 'Morning':
			dialog = Dialogic.start('Home door')
			add_child(dialog)
		if tasks_done != 'done':
			#TODO remove this, this should be done by single tasks instead
			Dialogic.set_variable("MorningTasks", 'done')
			return
	
	door_open = !door_open
	if door_open == true:
		$AnimationPlayer.play("DoorOpen")
	else:
		$AnimationPlayer.play_backwards("DoorOpen")
