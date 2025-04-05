extends CharacterBody2D

var speed = 100.0
var rotation_speed = 1.5

func _process(delta):
	var move_direction = Vector2.ZERO
	var rotate_direction = 0.0

	if Input.is_action_pressed("up"):
		move_direction += Vector2(0, -1)
	if Input.is_action_pressed("down"):
		move_direction += Vector2(0, 1)
	if Input.is_action_pressed("left"):
		rotate_direction -= 1.0
	if Input.is_action_pressed("right"):
		rotate_direction += 1.0

	velocity = move_direction.normalized() * speed
	rotate_direction *= rotation_speed

	rotation += rotate_direction * delta
	move_and_slide()
