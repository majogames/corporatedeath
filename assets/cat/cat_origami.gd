extends Spatial

export var cat_name = 'none'

func action():
	if get_tree().get_current_scene().get_name() == "Forest":
		print(cat_name)
		print("bring me home!!")
	else:
		print("purr")
	pass
