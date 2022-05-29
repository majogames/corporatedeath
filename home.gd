extends Spatial


onready var player: KinematicBody = $Player
onready var elevator: Spatial = $"RoomList/ElevatorCorridor/elevator corridor/elevator box"
onready var elevator_entrance: Spatial = $"RoomList/ElevatorCorridor/elevator corridor"


# Called when the node enters the scene tree for the first time.
func _ready():
	var previous_location = Dialogic.get_variable('location')
	Dialogic.set_variable('previous_location', previous_location)
	print('HOME previous location ', previous_location)
	if previous_location != 'home':
		player.transform = elevator_entrance.find_node('PlayerEnter', false).global_transform
		elevator_entrance.toggle_door()
		Dialogic.set_variable('location', 'home')
		previous_location = Dialogic.get_variable('location')
		print('HOME test new location: ', previous_location)
