tool
extends Spatial

export (Color) var color = Color('e79444') setget set_color
var bookmaterial: SpatialMaterial = SpatialMaterial.new()
var dialog: Node = null

func set_color(newcolor):
	color = newcolor
	bookmaterial.albedo_color = newcolor
	$Cube002.set_surface_material(0, bookmaterial)

func action():
	if is_instance_valid(dialog):
		#dialog still running
		return
	dialog = Dialogic.start('read book')
	add_child(dialog)
