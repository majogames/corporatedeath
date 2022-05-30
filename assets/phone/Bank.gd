extends Control

enum BankPage {List, Transport, TransportDone, Insurance, InsuranceDone, OutOrder}

var current_page = BankPage.List setget _set_page
var dialog = null 

func _ready():
	#dialog = Dialogic.open
	pass

func _set_page(newpage):
	current_page = newpage
	$BankList.visible = newpage == BankPage.List
	$PayTransport.visible = newpage == BankPage.Transport
	$PayTransportDone.visible = newpage == BankPage.TransportDone
	$PayInsurance.visible = newpage == BankPage.Insurance
	$PayInsuranceDone.visible = newpage == BankPage.InsuranceDone
	$OutOfOrder.visible = newpage == BankPage.OutOrder

func _on_HomeButton_pressed():
	match current_page:
		BankPage.List:
			get_parent()._on_HomeButton_pressed()
		BankPage.OutOrder:
			get_parent()._on_HomeButton_pressed()
		_:
			self.current_page = BankPage.List

func _on_PayButton_pressed():
	match current_page:
		BankPage.Transport:
			Dialogic.set_variable('task_pay_transport', 'true')
			self.current_page = BankPage.TransportDone
		BankPage.Insurance:
			Dialogic.set_variable('task_pay_insurance', 'true')
			self.current_page = BankPage.InsuranceDone
		_:
			return


func _on_PayTransportButton_pressed():
	if Dialogic.get_variable('task_pay_transport') == 'true':
		self.current_page = BankPage.TransportDone
	else:
		self.current_page = BankPage.Transport


func _on_PayInsuranceButton_pressed():
	if Dialogic.get_variable('task_pay_insurance') == 'true':
		self.current_page = BankPage.InsuranceDone
	else:
		self.current_page = BankPage.Insurance
