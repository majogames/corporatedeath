extends KinematicBody

var speed = 5
var acceleration = 9.8
var gravity = 9.8
var jump = 3

var mouse_sensitivity = 0.1

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3()

var on_button = false

export (bool) var show_phone: bool = false setget _show_phone

onready var head = $head
onready var phone = $head/phone
onready var reach = $head/Camera/EyesRayCast

var mat = SpatialMaterial.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	phone.visible = show_phone

func _input(event):
	if !show_phone and event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
		head.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity))
		head.rotation.x = clamp(head.rotation.x, deg2rad(-90), deg2rad(90))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	direction = Vector3()

	if not is_on_floor():
		fall.y -= gravity * delta
		
	if Input.is_action_just_pressed("jump"):
		fall.y = jump
	
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			self.show_phone = true
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			self.show_phone = false
		
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
	elif Input.is_action_pressed("move_backward"):
		direction += transform.basis.z
		
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x

	elif Input.is_action_pressed("move_right"):
		direction += transform.basis.x

	# direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	
	velocity = move_and_slide(velocity, Vector3.UP)
	move_and_slide(fall, Vector3.UP)

func _process(delta):
	if reach.is_colliding():
		#mat.albedo_color = Color(1, 0, 0)
		#reach.get_collider().mesh.set_surface_material(0, mat)

		if Input.is_action_just_pressed("action"):
			print(reach.get_collider().get_name())
			reach.get_collider().action()
	#mat.albedo_color = Color(0, 0, 0)
	#reach.get_collider().mesh.set_surface_material(0, mat)

func _show_phone(show):
	show_phone = show
	if phone != null:
		phone.visible = show_phone
