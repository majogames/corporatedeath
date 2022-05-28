tool
extends Spatial

export (Color) var color = Color('e79444') setget set_color
var bookmaterial: SpatialMaterial = null
var dialog: Node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	bookmaterial = SpatialMaterial.new()

func set_color(newcolor):
	color = newcolor
	if bookmaterial == null:
		bookmaterial = SpatialMaterial.new()
	bookmaterial.albedo_color = newcolor
	$Cube002.set_surface_material(0, bookmaterial)

func action():
	if is_instance_valid(dialog):
		#dialog still running
		return
	dialog = Dialogic.start('read book')
	add_child(dialog)
