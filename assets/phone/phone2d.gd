extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum PhonePage {Lockscreen, Home, Notes, Calls, Maps, Mail, Bank}
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
	pass # Replace with function body.

func _set_page(newpage):
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
