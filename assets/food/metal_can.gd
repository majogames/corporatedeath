extends Spatial

var dialog: Node = null

func action():
	if is_instance_valid(dialog):
		#dialog still running
		return
	dialog = Dialogic.start('eat breakfast')
	add_child(dialog)

