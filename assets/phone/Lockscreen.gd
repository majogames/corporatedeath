extends CenterContainer

export var locksequence = [4,3,6]
var current_sequence_index = 0

onready var control: Control

signal unlock

func _ready():
	control = get_parent()
	var code = Dialogic.get_variable('phone_code', '')
	if code == '':
		_create_random_password()
	else:
		_load_password(code)
	print("phone password is ", locksequence)

func _create_random_password():
	randomize()
	# randomize password
	locksequence = [
		randi() % 10,
		randi() % 10,
		randi() % 10,
		]
	var code = "{0} {1} {2}".format(locksequence)
	Dialogic.set_variable('phone_code', code)
	

func _load_password(code_str: String):
	locksequence = code_str.split_floats(' ')

func input_number(number):
	print("unlock pressed number", number)
	if locksequence[current_sequence_index] == number:
		current_sequence_index += 1
		if current_sequence_index >= locksequence.size():
			current_sequence_index = 0
			emit_signal("unlock")
			$unlock.play()
			return
		$click2.play()
	else:
		current_sequence_index = 0
		$error.play()
