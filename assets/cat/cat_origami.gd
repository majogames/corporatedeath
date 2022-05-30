extends Spatial

export var cat_name = 'none'
var dialog = null

func action():
	if is_instance_valid(dialog):
		return
	dialog = Dialogic.start('pet cat')
	add_child(dialog)
