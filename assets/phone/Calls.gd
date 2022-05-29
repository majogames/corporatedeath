extends Control


var dialog = null

func _generic_call(name: String):
	$ContactList.visible = false
	match name:
		"CEO":
			$CallCEO.visible = true
		"Manager":
			$CallManager.visible = true
		_:
			$CallGeneric.visible = true
	if is_instance_valid(dialog):
		return
	Dialogic.set_variable('calling', name)
	dialog = Dialogic.start('calling')
	#dialog.connect('dialogic_signal', self, 'dialogic_signal')
	get_viewport().get_parent().add_child(dialog)
	yield(dialog, "timeline_end")
	$CallCEO.visible = false
	$CallManager.visible = false
	$CallGeneric.visible = false
	$ContactList.visible = true

func _on_Work_colleague_pressed():
	_generic_call('work colleague')


func _on_Repair_guy_pressed():
	_generic_call('Repair guy')


func _on_CEO_pressed():
	_generic_call('CEO')


func _on_CFO_pressed():
	_generic_call('CFO')


func _on_CIO_pressed():
	_generic_call('CIO')


func _on_CMO_pressed():
	_generic_call('CMO')


func _on_COO_pressed():
	_generic_call('COO')


func _on_Dad_pressed():
	_generic_call('Dad')


func _on_Dentist_pressed():
	_generic_call('Dentist')


func _on_Manager_pressed():
	_generic_call('Manager')


func _on_Food_delivery_pressed():
	_generic_call('Food delivery')


func _on_Mom_pressed():
	_generic_call('Mom')


func _on_Receptionist_pressed():
	_generic_call('Receptionist')
