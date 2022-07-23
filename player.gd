extends KinematicBody

var speed = 3
var acceleration = 9.8
var gravity = 9.8
var jump = 3

var mouse_sensitivity = 0.002
var joy_sensitivity = 0.05

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3()

var on_button = false

export (bool) var show_phone: bool = false setget _show_phone

onready var head = $head
onready var phone = $head/phone
onready var reach = $head/Camera/EyesRayCast
onready var bucket_list = $head/BucketList

var mat = SpatialMaterial.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	phone.visible = show_phone
	self.set_saturation()

func movement_enabled():
	if show_phone:
		return false
	var has_dialog = Dialogic.has_current_dialog_node()
	if has_dialog:
		return false
	return true

func _rotate_camera(input: Vector2):
	# if flip_y:
	#     move_joystick.y = -move_joystick.y
	rotate_y(-input.x)
	head.rotate_x(-input.y)
	head.rotation.x = clamp(head.rotation.x, -PI/2.0, PI/2.0)


func _input(event):
	if movement_enabled() and event is InputEventMouseMotion:
		_rotate_camera(event.relative * mouse_sensitivity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	direction = Vector3()
	
	if not is_on_floor():
		fall.y -= gravity * delta
		
	if movement_enabled():
		# Gravity
		if Input.is_action_just_pressed("jump"):
			fall.y = jump
		# Movement
		var move_input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
		direction = transform.basis * Vector3(move_input.x, 0, move_input.y)
		
		# Joystick camera
		var rot_joystick = Input.get_vector("rotate_left", "rotate_right", "rotate_up", "rotate_down")
		_rotate_camera(rot_joystick * joy_sensitivity)


	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			self.show_phone = true
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			self.show_phone = false

	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	
	velocity = move_and_slide(velocity, Vector3.UP)
	move_and_slide(fall, Vector3.UP)

func _show_phone(show):
	show_phone = show
	$head/HUD/Aim.visible = !show_phone
	
	if Dialogic.get_variable('has_bucket_list') == 'true':
		if bucket_list != null:
			bucket_list.visible = show_phone
	else:
		if phone != null:
			phone.visible = show_phone
			if not show:
				phone.lockscreen()
			else:
				phone.unlockscreen()

func set_saturation():
	var screen_saturation = Dialogic.get_variable('screen_saturation', 1.0)
	var environment: WorldEnvironment = $"/root".find_node('WorldEnvironment', true, false)
	environment.environment.adjustment_enabled = true
	environment.environment.adjustment_saturation = float(screen_saturation)
