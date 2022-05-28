extends Spatial

var dialog: Node = null

func action():
	if is_instance_valid(dialog):
		#dialog still running
		return
	dialog = Dialogic.start('wardrobe')
	add_child(dialog)
