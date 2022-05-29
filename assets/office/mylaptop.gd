extends Spatial

func action():
	var dialog = Dialogic.start('laptop work')
	add_child(dialog)
