extends "res://scripts/Mapa.gd"


func _physics_process(delta):
# 	toma del global de Player la posicion global de este y la traduce a local
	if PlayerInfoInv.playerGlobalPos:
		dissolve_fog(world_to_map(to_local(PlayerInfoInv.playerGlobalPos)))


func dissolve_fog(pos):
#	Esto hay que buscar alguna forma menos sketchy de hacerlo
#	selecciona las tiles al rededor de la del jugador y las elimina
	var tiles = [pos, pos+Vector2(0,-1), pos+Vector2(0,1), pos+Vector2(1,-1),
				 pos+Vector2(1,0), pos+Vector2(-1,0), pos+Vector2(1,1),
				pos+Vector2(-1,1), pos+Vector2(-1,-1), pos+Vector2(0,-2),
				pos+Vector2(2,0), pos+Vector2(0,2), pos+Vector2(-2,0),
				pos+Vector2(1,-2), pos+Vector2(2,-1), pos+Vector2(2,1),
				pos+Vector2(1,2), pos+Vector2(-1,2), pos+Vector2(-2,1),
				pos+Vector2(-2, -1), pos+Vector2(-1,-2), pos+Vector2(2,-2),
				pos+Vector2(2,2), pos+Vector2(-2,2), pos+Vector2(-2,-2)]

	for i in tiles:
		set_cellv(i, -1)