extends CenterContainer

export var locksequence = [4,3,6]
var current_sequence_index = 0

onready var control: Control

signal unlock

func _ready():
	control = get_parent()
	#TODO randomize password


func input_number(number):
	print("unlock pressed number", number)
	if locksequence[current_sequence_index] == number:
		current_sequence_index += 1
		if current_sequence_index >= locksequence.size():
			current_sequence_index = 0
			emit_signal("unlock")
			
	else:
		current_sequence_index = 0
