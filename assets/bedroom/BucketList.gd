extends Spatial

var dialog = null

func action():
	if is_instance_valid(dialog):
		return
	dialog = Dialogic.start('pick up bucket list')
	add_child(dialog)
	yield(dialog, "timeline_end")
	if Dialogic.get_variable("has_bucket_list") == 'true':
		queue_free()
