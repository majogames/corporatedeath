extends Spatial

var dialog = null

func _on_Area_body_entered(body: StaticBody):
	if body == $StaticBody:
		return
	if is_instance_valid(dialog):
		return
	dialog = Dialogic.start('corridor')
	add_child(dialog)
