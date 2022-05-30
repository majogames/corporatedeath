extends MeshInstance

var dialog = null

func action():
	print("action on flower")
	if is_instance_valid(dialog):
		return
	dialog = Dialogic.start('pick flower')
	add_child(dialog)
