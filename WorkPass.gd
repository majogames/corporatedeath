extends CollisionShape


# Called when the node enters the scene tree for the first time.
func _ready():
	if Dialogic.get_variable("dead") == "true":
		disabled = false
