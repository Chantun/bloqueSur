extends TileMap


func _ready():
	pass

func _physics_process(delta):
	pass
	
		
func get_tile(pos):
	var tileNum
	tileNum = get_cellv(world_to_map(to_local(pos)))
	return tileNum