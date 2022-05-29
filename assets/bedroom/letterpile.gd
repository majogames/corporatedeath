extends Spatial

var dialog: Node = null

func action():
	if is_instance_valid(dialog):
		#dialog still running
		return
	dialog = Dialogic.start('sort mail')
	dialog.connect('dialogic_signal', self, 'dialogic_signal')
	add_child(dialog)

func dialogic_signal(signal_name):
	queue_free()
