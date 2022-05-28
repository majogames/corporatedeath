tool
extends Spatial


var tshirtmaterial: SpatialMaterial = SpatialMaterial.new()
var trousersmaterial: SpatialMaterial = SpatialMaterial.new()
var hairmaterial: SpatialMaterial = SpatialMaterial.new()
var skinmaterial: SpatialMaterial = SpatialMaterial.new()

export (Color) var skin_color = Color('e7c5b2') setget set_skin_color
export (Color) var tshirt_color = Color('e74444') setget set_tshirt_color
export (Color) var trousers_color = Color('4474e7') setget set_trousers_color
export (Color) var hair_color = Color('000000') setget set_hair_color

export (NodePath) var mesh_path
onready var mesh = get_node(mesh_path)

onready var animation: AnimationPlayer = $AnimationPlayer
onready var animation_tree: AnimationTree = $AnimationTree

enum Anim {Idle, Walking, Typing}
export(Anim) var animation_state = Anim.Idle setget set_animation_state

func _init():
	skinmaterial.subsurf_scatter_enabled = true
	skinmaterial.subsurf_scatter_strength = 0.1

func _ready():
	set_animation_state(animation_state)
	
	set_skin_color(skin_color)
	set_tshirt_color(tshirt_color)
	set_trousers_color(trousers_color)
	set_hair_color(hair_color)
	mesh.set_surface_material(0, skinmaterial)
	mesh.set_surface_material(1, tshirtmaterial)
	mesh.set_surface_material(2, trousersmaterial)
	mesh.set_surface_material(4, hairmaterial)

func set_animation_state(newstate):
	animation_state = newstate
	if animation_tree != null:
		animation_tree["parameters/state/current"] = animation_state

func set_tshirt_color(newcolor):
	tshirt_color = newcolor
	tshirtmaterial.albedo_color = newcolor

func set_trousers_color(newcolor):
	trousers_color = newcolor
	trousersmaterial.albedo_color = newcolor

func set_hair_color(newcolor):
	hair_color = newcolor
	hairmaterial.albedo_color = newcolor

func set_skin_color(newcolor):
	skin_color = newcolor
	skinmaterial.albedo_color = newcolor
