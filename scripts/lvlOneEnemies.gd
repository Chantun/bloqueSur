extends Node2D

# esta funcion es llamada desde la escena combat
func chooseRandEnemy():
	randomize()
#	toma el tamaño del dic y elige una key random del Array
	var listSize = enemieList.size()
	var listKeys = enemieList.keys()
	var randKey = listKeys[randi()%listSize-1]
	var currEnemy = enemieList[randKey]
#	lo devuelve a combat
	return currEnemy

#lista de enemigos
var enemieList = {
	rat = {
		"nme": "Rata reputasmil grande",
		"hp": 2,
		"armor": 0,
		"attack": 1,
		"desc": "Una rata recontrareputasmil grande"
		},
	dog = {
		"nme": "Perro cimarron",
		"hp": 6,
		"armor": 0,
		"attack": 2,
		"desc": "Cucha! Cucha!"
		},
	puma = {
		"nme": "Puma",
		"hp": 4,
		"armor": 0,
		"attack": 8,
		"desc": "HAAAAAA"
		}
	}

