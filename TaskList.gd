extends Node

func _ready():
	print('TaskList helper is at ', get_path())
	update_bucket_list()
	update_notes()

func update_bucket_list():
	var bucket_list = get_tree().root.find_node('BucketList2D', true, false)
	bucket_list.update_bucket_list()

func update_notes():
	var player = get_tree().root.find_node('Player', true, false)
	#update saturation
	player.set_saturation()
	var notes = player.find_node('Notes', true, false)
	notes.update_notes()
