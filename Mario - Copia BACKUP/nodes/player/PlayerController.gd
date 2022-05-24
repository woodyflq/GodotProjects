extends KinematicBody2D

var gravity = 30
var walk_speed = 220
var jump_speed = 420
var movement = Vector2(0, 0)

var can_attack = false
var can_double_jump = true
var number_random

var rng = RandomNumberGenerator.new()

func _rng():
	rng.randomize()
	var my_random_number = rng.randi_range(1, 3)
	print(my_random_number)
	return my_random_number


func _process(delta):
	if $"/root/Level".queda == true and $"/root/Level".vida > 0:
		position.x = 80
		position.y = 434
		get_node("/root/Level").vida -= 1
		$"/root/Level".queda = false
		gravity = 30
		print($"/root/Level".queda)
	elif $"/root/Level".vida == 0:
		get_tree().reload_current_scene()
		$"/root/Level".vida = 3
		$"/root/Level".coins = 0
		
		
		

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ataque"):
		number_random = _rng()
	
	if Input.is_action_pressed("ataque"):
		can_attack = true
		gravity = 100
	elif Input.is_action_just_released("ataque"):
		can_attack = false
		gravity = 30
	
	if !is_on_floor():
		movement.y += gravity
	else:
		movement.y = 1
		can_double_jump = true
	
	var horizontal_axis = Input.get_action_strength("right") - Input.get_action_strength("left")
	movement.x = horizontal_axis * walk_speed
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		movement.y = -jump_speed
		can_attack = false
	elif Input.is_action_just_pressed("jump") and can_double_jump:
			can_double_jump = false
			movement.y = -jump_speed
			can_attack = false
			
	move_and_slide(movement, Vector2.UP)
	
	if is_on_ceiling():
		movement.y = 0
	
	
	update_animations()

	
func update_animations():
	if movement.x > 0:
		$AnimatedSprite.scale.x = 2
	elif movement.x < 0:
		$AnimatedSprite.scale.x = -2
		
	if is_on_floor():
		if abs(movement.x) > 0 and can_attack == false:
			$AnimatedSprite.play("walk")
		elif (movement.x == 0) and can_attack == false:
			$AnimatedSprite.play("idle")
		else:
			$AnimatedSprite.play("atk")
			
	else:
		if !is_on_floor() and can_attack == true:
			if number_random == 1:
				$AnimatedSprite.play("atk")
			if number_random == 2:
				$AnimatedSprite.play("atk_02")
			if number_random == 3:
				$AnimatedSprite.play("atk_03")
		else:
			$AnimatedSprite.play("jump")
