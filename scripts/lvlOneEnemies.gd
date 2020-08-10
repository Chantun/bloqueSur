extends Node2D

# esta funcion es llamada desde la escena battle
func chooseRandEnemy():
	randomize()
#	toma el tamaño del dic y elige una key random del Array
	var listSize = enemieList.size()
	var listKeys = enemieList.keys()
	var randKey = listKeys[randi()%listSize-1]
	var currEnemy = enemieList[randKey]
#	lo devuelve a Battle
	return currEnemy

#lista de enemigos
var enemieList = {
	rat = {
		"nme": "Rat",
		"HP": 2,
		"attack": 1,
		"speed": 4
		},
	dog = {
		"nme": "Dog",
		"HP": 6,
		"attack": 2,
		"speed": 2
		},
	puma = {
		"nme": "Puma",
		"HP": 4,
		"attack": 8,
		}
	}

