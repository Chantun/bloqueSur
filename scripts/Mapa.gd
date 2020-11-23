extends TileMap

func get_tile(pos):
	var tileNum
	tileNum = get_cellv(world_to_map(to_local(pos)))
	return tileNum