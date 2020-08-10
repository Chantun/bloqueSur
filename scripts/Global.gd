extends Node2D

var scrnSize
var playerGlobalPos
var mousePos
var currTile

func _ready():
	
	scrnSize = get_viewport_rect().size
	
	pass
	
func _physics_process(delta):
	
	mousePos = get_viewport().get_mouse_position()