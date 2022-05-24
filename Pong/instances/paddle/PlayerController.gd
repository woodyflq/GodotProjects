extends KinematicBody2D

export var speed = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if Input.is_action_pressed("move_up1"):
		move_and_collide(Vector2(0.0, -speed) * delta)
	elif Input.is_action_pressed("move_down1"):
		move_and_collide(Vector2(0.0, speed) * delta)
