extends Spatial

var dialog = null

func action():
	if is_instance_valid(dialog):
		#dialog still running
		return
	dialog = Dialogic.start('take a break')
	add_child(dialog)
