extends Label


func _process(delta):
	var score = get_node("/root/Level").vida
	if score != 0:
		text = str(score)

