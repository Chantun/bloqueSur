extends "res://scripts/Mapa.gd"


func _physics_process(delta):

	if Global.playerGlobalPos:
		dissolve_fog(world_to_map(to_local(Global.playerGlobalPos)))


func dissolve_fog(pos):

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