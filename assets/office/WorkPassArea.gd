extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_WorkPassArea_body_entered(body):
	pass


func _on_WorkPassArea_body_exited(body):
	var dialog = Dialogic.start('work entered')
	add_child(dialog)
