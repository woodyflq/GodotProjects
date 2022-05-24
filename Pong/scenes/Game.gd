extends Node2D


var scoreP1 = 0
var scoreP2 = 0

func _process(delta):
	if scoreP1 == 10 || scoreP2 == 10:
		scoreP1 = 0
		scoreP2 = 0
