extends Spatial

var player_infront = false
var door_open = false

func _input(event):
	
	if Input.is_action_just_pressed("left_mouse_click"):
		if player_infront == true and $AnimationPlayer.is_playing() == false:
			door_open = !door_open
			if door_open == true:
				$AnimationPlayer.play("DoorOpen")
			else:
				$AnimationPlayer.play("DoorClose")

func _on_Area_body_entered(body):
	if body.is_in_group("player"):
		player_infront = true
		#$Label.show()
		
func _on_Area_body_exited(body):
	if body.is_in_group("player"):
		player_infront = false
		#$Label.hide()
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
