extends CharacterBody2D

@export var speed = 600

var point1 = get_node("Line2d").get_point_position(0)
var point2 = get_node("Line2d").get_point_position(1)

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	point1.set_position(get_node("spool").get_global_position())
	point2.set_position(get_global_position())
	move_and_slide()
