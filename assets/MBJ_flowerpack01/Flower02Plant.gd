extends MeshInstance

var dialog = null

func action():
	if is_instance_valid(dialog):
		return
	dialog = Dialogic.start('pick flower')
	add_child(dialog)
