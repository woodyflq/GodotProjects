extends KinematicBody2D


var life = 100

var boss_can_atk = false
var boss_can_do_damage = false

var can_atk_the_Boss = false


var rng = RandomNumberGenerator.new()

func _rng():
	rng.randomize()
	var my_random_number = rng.randi_range(1, 10)
	print(my_random_number)
	return my_random_number

func _on_BossCanAtk_body_entered(body):
	if _rng() < 5:
		boss_can_atk = true
		$AnimatedSprite.play("attacking")
		$"/root/Level".vida -= 1
	

func _on_BossCanAtk_body_exited(body):
	boss_can_atk = false
	$AnimatedSprite.play("idle")


func _on_Area2D_body_entered(body):
	can_atk_the_Boss = true
	print(can_atk_the_Boss)

func _on_Area2D_body_exited(body):
	can_atk_the_Boss = false
	print(can_atk_the_Boss)


func _process(delta):
	print(life)
	if (Input.is_action_pressed("ataque") and can_atk_the_Boss == true):
		life -= 1
		if life == 0:
			queue_free()
			$"/root/Level".vitoria = true
