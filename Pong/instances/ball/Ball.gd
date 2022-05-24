extends KinematicBody2D


var velocity = Vector2(100.0, 200.0)
export var rebound_intesity = 100

func _ready():
	pass

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.is_in_group("Wall"):
			velocity.y *= -1
			$Wall_Sound.play()
		elif collision.collider.is_in_group("Paddle"):
			velocity.x *= -1
			velocity.y = y_da_colisao(collision)
			$Paddle_Sound.play()
		elif collision.collider.is_in_group("LeftWall"):
			position = Vector2(320.0, 240.0)
			velocity = Vector2(100.0, 200.0)
			get_node("/root/Game").scoreP1 += 1
		elif collision.collider.is_in_group("RightWall"):
			position = Vector2(320.0, 240.0)
			velocity = Vector2(100.0, 200.0)
			get_node("/root/Game").scoreP2 += 1

func y_da_colisao(collision):
	var paddle_y_extent = collision.collider.get_node("CollisionShape2D").shape.extents.y
	var normal_value = (position.y - collision.collider.position.y)/40
	return normal_value * rebound_intesity
