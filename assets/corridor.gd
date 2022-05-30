extends Spatial

var dialog = null

func _on_Area_body_entered(body):
	if is_instance_valid(dialog):
		return
	dialog = Dialogic.start('corridor')
	add_child(dialog)
