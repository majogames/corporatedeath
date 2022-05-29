extends Spatial

var dialog: Node = null

func action():
	if is_instance_valid(dialog):
		#dialog still running
		return
	dialog = Dialogic.start('eat breakfast')
	dialog.connect('dialogic_signal', self, 'dialogic_signal')
	add_child(dialog)

func dialogic_signal(signal_name):
	yield(dialog, "timeline_end")
	queue_free()
