extends Control

func _ready():
	update_bucket_list()
	
func update_bucket_list():
	$Handwritten/Tick1.visible = _test_var('bucket_long_shower')
	$Handwritten/Tick2.visible = _test_var('bucket_play_game')
	$Handwritten/Tick3.visible = _test_var('bucket_long_breakfast')
	$Handwritten/Tick4.visible = _test_var('bucket_buy_plants')
	$Handwritten/Tick5.visible = _test_var('bucket_write_diary')
	$Handwritten/Tick6.visible = _test_var('bucket_take_long_nap')
	$Handwritten/Tick7.visible = _test_var('bucket_finish_reading_book')
	$Handwritten/Tick8.visible = _test_var('bucket_childwood_friend')
	$Handwritten/Tick9.visible = _test_var('bucket_clubbing')
	$Handwritten/Tick10.visible = _test_var('bucket_wall_colour')
	$Handwritten/Tick11.visible = _test_var('bucket_grow_food')
	$Handwritten/Tick12.visible = _test_var('bucket_park')
	$Handwritten/Tick13.visible = _test_var('bucket_paint')
	$Handwritten/Tick14.visible = _test_var('bucket_tiedye_bedsheets')
	$Handwritten/Tick15.visible = _test_var('bucket_new_friend')
	$Handwritten/Tick16.visible = _test_var('bucket_chess')
	$Handwritten/Tick17.visible = _test_var('bucket_cat')
	$Handwritten/Tick18.visible = _test_var('bucket_new_furniture')
	$Handwritten/Tick19.visible = _test_var('bucket_basketball')
	$Handwritten/Tick20.visible = _test_var('bucket_vacation')
	$Handwritten/Tick21.visible = _test_var('bucket_house')
	
func _test_var(name: String) -> bool:
	return Dialogic.get_variable(name, 'false') == 'true'
