extends Spatial


var open: bool = false
onready var animation: AnimationPlayer = $"../../AnimationPlayer"

func action():
	open = !open
	if open:
		animation.play("open")
	else:
		animation.play_backwards("open")
