extends Spatial

onready var phone2D: Control = $Viewport/Control
onready var shape: CollisionShape = $Area/CollisionShape
onready var viewport: Viewport = $Viewport

func _unhandled_input(event):
	if event is InputEventMouseButton: #and event.button_index == BUTTON_LEFT and event.pressed:
		var camera = get_viewport().get_camera()
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * 10
		#var target_point = get_closest_point_to_segment(from, to)
		
		var space_state = get_world().direct_space_state
		var res: Dictionary = space_state.intersect_ray(from, to, [], 32, false, true)
		if res.empty() or res['collider'] != $Area:
			return
		#collider: The colliding object.
		#collider_id: The colliding object's ID.
		#normal: The object's surface normal at the intersection point.
		#position: The intersection point.
		#rid: The intersecting object's RID.
		#shape: The shape index of the colliding shape.

		var _new_pos: Vector3 = shape.to_local(res['position'])
		var new_pos = Vector2(
			(_new_pos.x / shape.shape.extents.x + 1.0) / 2.0,
			(-_new_pos.y / shape.shape.extents.y + 1.0) / 2.0
		)
		#print(new_pos.x,'\t', new_pos.y)
		
		event.position = new_pos * viewport.size
		viewport.input(event)
