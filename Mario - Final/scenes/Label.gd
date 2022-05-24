extends Label


func _process(delta):
	var score = get_node("/root/Level").coins
	if score != 0:
		text = str(score)
