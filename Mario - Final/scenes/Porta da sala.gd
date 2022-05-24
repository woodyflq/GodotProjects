extends TileMap


func _process(delta):
	if $"/root/Level".coins == 7:
		queue_free()
