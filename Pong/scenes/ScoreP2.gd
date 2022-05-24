extends Label

func _process(delta):
	var score = get_node("/root/Game").scoreP2
	if score != 0:
		text = str(score)
