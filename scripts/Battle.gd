extends Node2D



#crea una instanzacion de enemies:
var enemies = load("res://scripts/lvlOneEnemies.gd").new()

func _ready():
#	se llama a la funcion de la lista de enemigos
	var currEnemy = enemies.chooseRandEnemy()
	
	
