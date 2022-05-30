extends Spatial

var dialog = null

func action():
	if is_instance_valid(dialog):
		return
	dialog = Dialogic.start('vacuum')
	add_child(dialog)
#	yield(dialog, "timeline_end")
#	if Dialogic.get_variable("task_work_new_forms") == 'true':
#		pass
