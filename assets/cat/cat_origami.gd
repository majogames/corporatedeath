extends Spatial

export var cat_name = 'none'
var dialog = null

func action():
	if is_instance_valid(dialog):
		return
	Dialogic.set_variable('cat_name', cat_name)
	dialog = Dialogic.start('pet cat')
	add_child(dialog)
