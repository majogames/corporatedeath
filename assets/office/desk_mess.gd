extends Spatial


var dialog = null

func action():
	if is_instance_valid(dialog):
		return
	dialog = Dialogic.start('clean desk')
	add_child(dialog)
	yield(dialog, "timeline_end")
	if Dialogic.get_variable("task_clean_desk") == 'true':
		$StaticBody/CollisionShape.disabled = true
		visible = false
