extends RayCast

onready var hold_pos = $"HeldObject"
onready var is_held = false

onready var highlight

func _physics_process(delta):
	if self.is_colliding():
		var collider = self.get_collider()
		var obj_col: Spatial = collider.get_parent() # not a cast
		highlight = obj_col.get_node("Highlight")
		highlight.visible = true
		
		var old_pos = obj_col.get_global_transform()
		var old_rot = obj_col.rotation_degrees
		
		if Input.is_action_just_pressed("action") && is_held == false:
			# logic for picking up objects
			obj_col.get_parent().remove_child(obj_col)
			hold_pos.add_child(obj_col)
			
			obj_col.transform.origin = Vector3(0,0,0)
			obj_col.rotation_degrees = Vector3(0,0,0)
			is_held = true
			
			highlight.scale = Vector3(0,0,0)
			
		elif Input.is_action_just_pressed("action") && is_held == true:
			hold_pos.remove_child(obj_col)
			get_node("/root/Spatial").add_child(obj_col)
			
			obj_col.transform.origin = old_pos.origin
			obj_col.rotation_degrees = old_rot
			is_held = false
			
			highlight.scale = Vector3(1,1,1)
	else:
		if highlight != null:
			highlight.visible = false
