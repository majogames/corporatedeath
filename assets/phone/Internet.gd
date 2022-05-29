extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CreateMeeting_pressed():
	var dialog = Dialogic.start('create meeting')
	dialog.connect('dialogic_signal', self, 'dialogic_signal')
	get_viewport().get_parent().add_child(dialog)

func dialogic_signal(signal_name: String):
	$Meeting.visible = false
	$MeetingSent.visible = true
