extends KinematicBody2D

var life = 1
var can_atk_the_Boss = false



func _on_Area2D_body_entered(body):
	can_atk_the_Boss = true
	print(can_atk_the_Boss)

func _on_Area2D_body_exited(body):
	can_atk_the_Boss = false
	print(can_atk_the_Boss)


func _process(delta):
	if (Input.is_action_pressed("ataque") and can_atk_the_Boss == true):
		life -= 1
		if life == 0:
			queue_free()
			$"/root/Level".vitoria = true

