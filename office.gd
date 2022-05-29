extends Spatial


# Called when the node enters the scene tree for the first time.
func _ready():
	var previous_location = Dialogic.get_variable('location')
	Dialogic.set_variable('previous_location', previous_location)
	print('previous location: ', previous_location)
	Dialogic.set_variable('location', 'office')
	
	$Player/head/phone/Viewport/Control/Notes.update_notes()


func _on_MeetingArea_body_entered(body):
	var dialog = Dialogic.start('attend meeting')
	add_child(dialog)
