extends TileMap


func _ready():
	pass

func _physics_process(delta):
	Global.currTile = get_cellv(world_to_map(to_local(Global.playerGlobalPos)))