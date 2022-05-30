extends Spatial


func _ready():
	var previous_location = Dialogic.get_variable('location')
	Dialogic.set_variable('previous_location', previous_location)
	print('previous location: ', previous_location)
	Dialogic.set_variable('location', 'park')
	
	var dialog = Dialogic.start('enter park')
	add_child(dialog)
