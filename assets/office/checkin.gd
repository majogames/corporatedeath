extends Spatial

var dialog = null

signal checkin

func action():
	if is_instance_valid(dialog):
		#dialog still running
		return
	dialog = Dialogic.start('work checkin')
	dialog.connect('dialogic_signal', self, 'dialogic_signal')
	add_child(dialog)

func dialogic_signal(signal_name: String):
	$MeshInstance/Screen.visible = false
	$MeshInstance/ScreenDONE.visible = false
	$MeshInstance/ScreenERROR.visible = false
	match signal_name:
		"WORKING":
			$MeshInstance/Screen.visible = true
		"GOOD":
			$MeshInstance/ScreenDONE.visible = true
			emit_signal("checkin")
		"BAD":
			$MeshInstance/ScreenERROR.visible = true
