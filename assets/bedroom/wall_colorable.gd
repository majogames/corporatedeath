extends Spatial

func apply_color():
	var material = load("res://assets/bedroom/wall_colorable.tres")
	$Wall001.set_surface_material(0, material)
