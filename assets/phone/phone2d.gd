extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum PhonePage {Lockscreen=0, Home=1, Notes=2, Calls=3, Maps=4, Mail=5, Bank=6, MAX=7}
export (PhonePage) var current_page = PhonePage.Lockscreen setget _set_page

onready var lockscreen = $Lockscreen
onready var home = $Home
onready var notes = $Notes
onready var calls = $Calls
onready var maps = $Maps
onready var mail = $Mail
onready var bank = $Bank
var ready = false

# Called when the node enters the scene tree for the first time.
func _ready():
	ready = true

func _set_page(newpage):
	if newpage >= PhonePage.MAX:
		newpage = 0
	current_page = newpage
	if !ready:
		return
	lockscreen.visible = (newpage == PhonePage.Lockscreen)
	home.visible = (newpage == PhonePage.Home)
	notes.visible = (newpage == PhonePage.Notes)
	calls.visible = (newpage == PhonePage.Calls)
	maps.visible = (newpage == PhonePage.Maps)
	mail.visible = (newpage == PhonePage.Mail)
	bank.visible = (newpage == PhonePage.Bank)


func _on_LaunchNotes_pressed():
	self.current_page = PhonePage.Notes


func _on_LaunchBank_pressed():
	self.current_page = PhonePage.Bank


func _on_LaunchMaps_pressed():
	self.current_page = PhonePage.Maps


func _on_LaunchInternet_pressed():
	self.current_page = PhonePage.MAX


func _on_LaunchPhone_pressed():
	self.current_page = PhonePage.Calls


func _on_LaunchEmail_pressed():
	self.current_page = PhonePage.Mail


func _on_HomeButton_pressed():
	self.current_page = PhonePage.Home


func _on_Lockscreen_unlock():
	self.current_page = PhonePage.Home
