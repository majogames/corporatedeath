extends Spatial

var dialog: Node = null

func action():
	if is_instance_valid(dialog):
		#dialog still running
		return
	dialog = Dialogic.start('eat quick food')
	dialog.connect('dialogic_signal', self, 'dialogic_signal')
	add_child(dialog)

func dialogic_signal(signal_name):
	yield(dialog, "timeline_end")
	queue_free()
	match signal_name:
		"lunch":
			var desk_people = $"/root".find_node('MeetingPeopleDesk', true, false)
			desk_people.visible = false
			var meeting_people = $"/root".find_node('MeetingPeople', true, false)
			meeting_people.visible = true
			
