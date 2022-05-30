extends Control


var page_index = 0 setget _set_page
onready var pages = $Pages

func _set_page(index):
	var page_count = pages.get_child_count()
	if index >= page_count:
		return
	print(index)
	for i in page_count:
		pages.get_child(i).visible = i == index
	var coming_page = pages.get_child(page_index).name
	Dialogic.set_variable('mail_app_action', coming_page)
	var dialog = Dialogic.start('email app')
	get_viewport().get_parent().add_child(dialog)
	page_index = index
	
	

func _on_Next_button_pressed():
	self.page_index = page_index+1
