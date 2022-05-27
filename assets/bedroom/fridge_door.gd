extends Spatial


var open: bool = false
onready var animation: AnimationPlayer = $"../../AnimationPlayer"
onready var light: OmniLight = $"../../FridgeLight"

func action():
	open = !open
	if open:
		light.visible = true
		animation.play("open")
	else:
		light.visible = false
		animation.play_backwards("open")
