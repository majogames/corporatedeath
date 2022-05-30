extends Spatial

func _ready():
	if Dialogic.get_variable('bucket_tiedye_bedsheets') == 'true':
		apply_color()

func action():
	var dialog = Dialogic.start('sleep')
	dialog.connect('dialogic_signal', self, 'dialogic_signal')
	add_child(dialog)

func apply_color():
	var mattress_tiedye = load("res://assets/bedroom/bed_tie_dye.tres")
	$Mattress.set_surface_material(0, mattress_tiedye)
	var pillow_tiedye = load("res://assets/bedroom/pillow_tie_dye.tres")
	$Pillowlowres.set_surface_material(0, pillow_tiedye)

func dialogic_signal(signal_name: String):
	match signal_name:
		"tiedye":
			apply_color()
