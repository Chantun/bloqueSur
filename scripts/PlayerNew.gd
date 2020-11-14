extends KinematicBody2D

var life = 100
var armor
var damage

var movCoolDownTimer = 0.0
var movDifficulty = 0.2
var currTile

var mapNode
var fogNode


func _ready():
#	posicion inicial en el centro de la pantalla:
	mapNode = get_parent().get_node("Mapa")
	fogNode = get_parent().get_node("Fog")

func _physics_process(delta):
#	Seteamos posicion global del jugador en Global
	Global.playerGlobalPos = self.global_position
	currTile = mapNode.get_tile(self.position)

	
	
	movCoolDownTimer += delta
	
#	movimiento con cooldown:
	if movCoolDownTimer > movDifficulty:
		if Input.is_action_pressed("ui_up"):
			move("up")
			movCoolDownTimer = 0
		if Input.is_action_pressed("ui_down"):
			move("down")
			movCoolDownTimer = 0
		if Input.is_action_pressed("ui_right"):
			move("right")
			movCoolDownTimer = 0
		if Input.is_action_pressed("ui_left"):
			move("left")
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
	if currTile == 3:
		movDifficulty = 0.4
	else:
		movDifficulty = 0.2

# Funcion para moverse, checkea la tile objetivo para ver si se puede ir
func move(dir):
	var vec = Vector2()
	var targetTile
	
	match dir:
		"up":
			vec = Vector2(0, -16)
		"down":
			vec = Vector2(0, 16)
		"right":
			vec = Vector2(16, 0)
		"left":
			vec = Vector2(-16, 0)
	
	targetTile = mapNode.get_tile(self.position + vec)
	
	if targetTile != 2 and targetTile != 4:
		for n in range(16):
			self.position += vec.normalized()
	else:
		return
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	