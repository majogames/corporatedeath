extends Spatial


# Called when the node enters the scene tree for the first time.
func action():
	var dialog = Dialogic.start('sleep')
	add_child(dialog)
