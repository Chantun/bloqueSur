extends Node2D

var direction
var velocity = 16
var movCoolDownTimer = 0.0
var movDifficulty = 0.2

func _ready():
#	posicion inicial en el centro de la pantalla:
	position = Vector2(Global.scrnSize.x/2, Global.scrnSize.y/2)
	

func _physics_process(delta):
#	Seteamos posicion global del jugador en Global
	Global.playerGlobalPos = self.global_position
	
	movCoolDownTimer += delta
#	movimiento normalizado con timer:
	if movCoolDownTimer > movDifficulty:
		var currPos = position
		if Input.is_action_pressed("ui_up"):
			position += Vector2(0, -1).normalized() * velocity
			movCoolDownTimer = 0
		if Input.is_action_pressed("ui_down"):
			position += Vector2(0, 1).normalized() * velocity
			movCoolDownTimer = 0
		if Input.is_action_pressed("ui_right"):
			position += Vector2(1, 0).normalized() * velocity
			movCoolDownTimer = 0
		if Input.is_action_pressed("ui_left"):
			position += Vector2(-1, 0).normalized() * velocity
			movCoolDownTimer = 0

	
#	zoom-in/zoom-out:
	if Input.is_action_just_pressed("ui_plus"):
		get_node("PlayerCam").zoom -= Vector2(0.1, 0.1)
	if Input.is_action_just_pressed("ui_minus"):
		get_node("PlayerCam").zoom += Vector2(0.1, 0.1)
#	zoom limits:
	if get_node("PlayerCam").zoom > Vector2(1.5, 1.5):
		get_node("PlayerCam").zoom = Vector2(1.5, 1.5)
	if get_node("PlayerCam").zoom < Vector2(0.5, 0.5):
		get_node("PlayerCam").zoom = Vector2(0.5, 0.5)

#	Restricciones de movimiento:
	if Global.currTile == 0:
		movDifficulty = 0.2
	elif Global.currTile == 3:
		movDifficulty = 0.3
