extends Area

var dialog = null

func _on_Hallway_area_body_entered(body):
	if is_instance_valid(dialog):
		return
	dialog = Dialogic.start('hallway')
	add_child(dialog)
#	yield(dialog, "timeline_end")
#	if Dialogic.get_variable("task_work_new_forms") == 'true':
#		pass
