extends StaticBody2D

var life = 1


func _on_Area2D_body_entered(body):
	$AnimationPlayer.play("coin_colecting")
	get_node("/root/Level").coins += 1
	life -= 1
	if life == 0:
		queue_free()
	
