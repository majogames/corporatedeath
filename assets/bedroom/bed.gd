extends Spatial


# Called when the node enters the scene tree for the first time.
func action():
	var dialog = Dialogic.start('sleep')
	add_child(dialog)

func apply_color():
	var mattress_tiedye = load("res://assets/bedroom/bed_tie_dye.tres")
	$Mattress.set_surface_material(0, mattress_tiedye)
	var pillow_tiedye = load("res://assets/bedroom/pillow_tie_dye.tres")
	$Pillowlowres.set_surface_material(0, pillow_tiedye)
