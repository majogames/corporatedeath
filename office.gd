extends Spatial


# Called when the node enters the scene tree for the first time.
func _ready():
	var previous_location = Dialogic.get_variable('location')
	Dialogic.set_variable('previous_location', previous_location)
	print('previous location: ', previous_location)
	Dialogic.set_variable('location', 'office')
	previous_location = Dialogic.get_variable('location')
	print('test new location: ', previous_location)
