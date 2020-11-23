extends Node2D

#	este nodo va a contener informacion global del juego, cambio de escenas,
#	parametros de quests y UI

var scrnSize


func _ready():
	
	scrnSize = get_viewport_rect().size
	
	
func _physics_process(delta):
	
#	para testeo los encuentros se triggerean con tecla esc
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to(load("res://Scenes/Combat.tscn"))
	