extends Node2D

var life
var armor
var damage = 5

var patron = []

var attTimer = 100
var defTimer
var iddleTimer

func _ready():
	#Tomar del objeto enemies todas las variables
	pass
	

func _physics_process(delta):
	#Llamar a la funcion que corresponda
	
	attTimer -= 1
	
	if attTimer <= 0:
		attack()
		attTimer = 100

func attack():
	get_parent().get_node("PlayerNew").life -= damage
	
func defend():
	pass
	
func iddle():
	pass
