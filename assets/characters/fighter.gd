extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var targets = []

export var SPEED = 1.8
export var ACCELERATION = 9.8
export var GRAVITY = 9.8

var camera
var path = []
var navigation

onready var animation: AnimationPlayer = $fighter/AnimationPlayer
onready var animation_tree: AnimationTree = $fighter/AnimationTree

# debug variables
export var show_path: bool = false
var show_path_material = SpatialMaterial.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	navigation = get_parent()
	var path: Spatial = $"../Path1"
	for target in path.get_children():
		targets.append(target.translation)
	goto(targets[0])
	animation.get_animation("Idle").loop = true
	animation.get_animation("walk in place").loop = true
	animation_tree["parameters/state/current"] = 1

func _process(delta):
	var direction = Vector3()
	
	# We need to scale the movement speed by how much delta has passed,
	# otherwise the motion won't be smooth.
	var step_size = delta * SPEED

	if path.size() > 0:
		# Direction is the difference between where we are now
		# and where we want to go.
		var destination = path[0]
		direction = destination - self.translation

		# If the next node is closer than we intend to 'step', then
		# take a smaller step. Otherwise we would go past it and
		# potentially go through a wall or over a cliff edge!
		if step_size > direction.length():
			step_size = direction.length()
			# We should also remove this node since we're about to reach it.
			path.remove(0)

		# Move the robot towards the path node, by how far we want to travel.
		# Note: For a KinematicBody, we would instead use move_and_slide
		# so collisions work properly.
		#1: simple translate
		# self.translation += direction.normalized() * step_size
		#2: translate with collisions
		move_and_slide(direction.normalized() * SPEED)
		#3: translate using animation movement
#		var anim_transform: Transform = animation_tree.get_root_motion_transform()
#		var new_transform = (anim_transform * transform)
#		var velocity = (new_transform.origin - transform.origin) # / delta
#		transform.basis = new_transform.basis
##		var x = velocity.x
##		var y = velocity.y
##		var z = velocity.z
##		velocity.x = x
##		velocity.y = z
##		velocity.z = y
#
#		#move_and_slide(velocity, Vector3.UP)
#		self.translation += velocity.normalized() * delta
#		self.transform.basis

		# Lastly let's make sure we're looking in the direction we're traveling.
		# Clamp y to 0 so the robot only looks left and right, not up/down.
		direction.y = 0
		if direction:
			# Direction is relative, so apply it to the robot's location to
			# get a point we can actually look at.
			var look_at_point = self.translation - direction.normalized()
			# Make the robot look at the point.
#			var tmp = look_at_point.x
#			look_at_point.x = look_at_point.z
#			look_at_point.z = tmp
			self.look_at(look_at_point, Vector3.UP)
	else:
		# Generate new path
		var old_target = targets.pop_front()
		targets.push_back(old_target)
		goto(targets[0])

func goto(target_point):
	# Set the path between the robots current location and our target.
	path = navigation.get_simple_path(self.translation, target_point, true)
	if show_path:
		draw_path(path)

func draw_path(path_array: Array):
	if path_array.size() > 0:
		var im = get_node("Draw")
		im.set_material_override(show_path_material)
		im.clear()
		im.begin(Mesh.PRIMITIVE_POINTS, null)
		im.add_vertex(path_array[0])
		im.add_vertex(path_array[path_array.size() - 1])
		im.end()
		im.begin(Mesh.PRIMITIVE_LINE_STRIP, null)
		for x in path:
			im.add_vertex(x)
		im.end()
