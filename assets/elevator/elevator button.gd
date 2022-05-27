extends MeshInstance

onready var mydoor = $".."

func action():
	mydoor.toggle_door()

