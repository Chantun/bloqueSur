extends Node2D

#	Este nodo se instancia cuando hay un encuentro 
#	se cambia la escena de world por esta

#	se prelodea y se instancia la escena enemy y el diccionario de enemigos
var enemies = load("res://scripts/lvlOneEnemies.gd").new()
var enemyNode = preload("res://Scenes/Enemy.tscn").instance()
var currEnemy

#	se accede a los nodos Label que van a mostrar info en la pantalla
onready var hpNode = get_node("HP")
onready var textNode = get_node("Desc")


func _ready():
	
	get_node("LineEdit").grab_focus()
#	se llama a la funciona de lvlOneEnemies donde elige uno al azar
	currEnemy = enemies.chooseRandEnemy()
	
	enemyNode.nme = currEnemy.nme
	enemyNode.armor = currEnemy.armor
	enemyNode.desc = currEnemy.desc
	enemyNode.hp = currEnemy.hp
	

func _physics_process(delta):
#	se actualiza la informacion mostrada en pantalla, 
#	es medio sketchy, debe haber una forma mejor
	var completeTextDesc = "Te encontraste un %s es %s" 
	var completeTextHp = "HP = %s"
	
	if enemyNode.hp > 0:
		textNode.set_text(completeTextDesc % [enemyNode.nme, enemyNode.desc])
		hpNode.set_text(completeTextHp % enemyNode.hp)
		
	else:
		textNode.set_text("Lo hiciste mierda")
		hpNode.set_text(completeTextHp % enemyNode.hp)
	



func ataque():
	enemyNode.hp -= PlayerInfoInv.playerDam

#	Funcion que toma el input del jugador
func _on_LineEdit_text_entered(new_text):
	match new_text:
		"atacar": 
			ataque()

