extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum PhonePage {Lockscreen=0, Home=1, Notes=2, Calls=3, Maps=4, Mail=5, Bank=6, Internet=7, MAX=8}
export (PhonePage) var current_page = PhonePage.Lockscreen setget _set_page

onready var lockscreen = $Lockscreen
onready var home = $Home
onready var notes = $Notes
onready var calls = $Calls
onready var maps = $Maps
onready var mail = $Mail
onready var bank = $Bank
onready var internet = $Internet
var ready = false

# Called when the node enters the scene tree for the first time.
func _ready():
	ready = true
	var dead: bool = Dialogic.get_variable('dead') == 'true'
	var panic: bool = Dialogic.get_variable('panic') == 'true'
	if dead:
		self.current_page = PhonePage.Lockscreen
		$Mail/outoforder.visible = true
		$Mail/Pages.visible = false
		$"Calls/out of order".visible = true
		$Bank/OutOfOrder.visible = true
		$Notes/outoforder.visible = true
#		$Notes/Notes1.visible = false
#		$Notes/Ticks.visible = false
	else:
		self.current_page = PhonePage.Home

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
	internet.visible = (newpage == PhonePage.Internet)
	
	var dead: bool = Dialogic.get_variable('dead') == 'true'
	var panic: bool = Dialogic.get_variable('panic') == 'true'
	if panic and bank.visible:
		var dialog = Dialogic.start('panic_bank')
		get_viewport().get_parent().add_child(dialog)

func unlockscreen():
	pass

func lockscreen():
	$lock.play()
	if Dialogic.get_variable('dead') == 'true':
		self.current_page = PhonePage.Lockscreen

func _on_LaunchNotes_pressed():
	$click.play()
	self.current_page = PhonePage.Notes


func _on_LaunchBank_pressed():
	$click.play()
	self.current_page = PhonePage.Bank


func _on_LaunchMaps_pressed():
	$click.play()
	self.current_page = PhonePage.Maps


func _on_LaunchInternet_pressed():
	$click.play()
	self.current_page = PhonePage.Internet


func _on_LaunchPhone_pressed():
	$click.play()
	self.current_page = PhonePage.Calls


func _on_LaunchEmail_pressed():
	$click.play()
	self.current_page = PhonePage.Mail


func _on_HomeButton_pressed():
	$click.play()
	self.current_page = PhonePage.Home


func _on_Lockscreen_unlock():
	$click.play()
	self.current_page = PhonePage.Home
