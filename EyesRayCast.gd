extends RayCast

onready var hold_pos = $"HeldObject"
onready var is_held = false
onready var player = $"../../.."

onready var highlight

func _physics_process(delta):
	if !player.movement_enabled():
		return
	
	if self.is_colliding():
		var collider = self.get_collider()
		var obj_col: Spatial = collider.get_parent() # not a cast
		if highlight != null and is_instance_valid(highlight):
			highlight.visible = false
			
		highlight = obj_col.get_node_or_null("Highlight")
		if highlight:
			highlight.visible = true
		else:
			print("Object '{obj}' has no 'Highlight' children".format({"obj": obj_col.name}))
		
		var old_pos = obj_col.get_global_transform()
		var old_rot = obj_col.rotation_degrees
		
		if Input.is_action_just_pressed("action") && is_held == false:
			
			print(collider.get_collision_layer())
			if(collider.get_collision_layer() == 16): # should be pickable
				# logic for picking up objects
				obj_col.get_parent().remove_child(obj_col)
				hold_pos.add_child(obj_col)
			
				obj_col.transform.origin = Vector3(0,0,0)
				obj_col.rotation_degrees = Vector3(0,0,0)
				is_held = true
			
				if highlight:
					highlight.scale = Vector3(0,0,0)
			else:
				# logic for interactive objects
				if obj_col.has_method("action"):
					obj_col.action()
				else:
					print("Object '{obj}' does not have method 'action'".format({"obj": obj_col}))
			
		elif Input.is_action_just_pressed("action") && is_held == true:
			hold_pos.remove_child(obj_col)
			get_node("/root/Spatial").add_child(obj_col)
			
			obj_col.transform.origin = old_pos.origin
			obj_col.rotation_degrees = old_rot
			is_held = false
			
			if highlight:
				highlight.scale = Vector3(1,1,1)
	else:
		if highlight != null and is_instance_valid(highlight):
			highlight.visible = false
			highlight = null
