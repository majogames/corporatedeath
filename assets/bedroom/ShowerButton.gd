extends MeshInstance

var dialog = null

func action():
	if is_instance_valid(dialog):
		return
	var dialog = Dialogic.start('shower')
	add_child(dialog)
	#yield(dialog, "timeline_end")
	#disable animation
