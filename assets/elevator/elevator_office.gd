extends Spatial

var door_open = false

onready var elevator = $"elevator box/AnimationPlayer"
var first_event = true

func _ready():
	toggle_door()

func toggle_door():
	door_open = !door_open
	if door_open == true:
		$AnimationPlayer.play("open")
		elevator.play("Open")
	else:
		$AnimationPlayer.play_backwards("open")
		elevator.play_backwards("Open")

func _on_Area_body_entered(body):
	if first_event:
		#skip first event, as we start from the elevator
		first_event = false
		return
	var dialog = Dialogic.start('Elevator')
	add_child(dialog)


func _on_Checkin_checkin():
	toggle_door()
