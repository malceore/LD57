extends CharacterBody2D

var speed = 100.0
var rotation_speed = 1.5

func _process(delta):
	var move_direction = Vector2.ZERO
	var rotate_direction = 0.0

	if Input.is_action_pressed("up"):
		move_direction += Vector2.UP
	if Input.is_action_pressed("down"):
		move_direction += Vector2.DOWN
	if Input.is_action_pressed("left"):
		rotate_direction -= 1.0
	if Input.is_action_pressed("right"):
		rotate_direction += 1.0

	rotation += rotate_direction * rotation_speed * delta

	move_direction = move_direction.rotated(rotation)
	velocity = move_direction.normalized() * speed

	move_and_slide()
