extends MeshInstance

var dialog = null

func action():
	if is_instance_valid(dialog):
		return
	dialog = Dialogic.start('charge phone')
	add_child(dialog)
	yield(dialog, "timeline_end")
	var phone_charging = Dialogic.get_variable("task_charge_phone", 'false')
	if phone_charging == 'true':
		$phone.visible = true
