extends Node2D

@export var speed = 600

@onready var chain = get_node("chain")
@onready var hook = get_node("hook")
@onready var inventory = $hook/inventory

var hit_count = 0

func on_hit():
	print("Yo, I got hit!")
	hit_count += 1
	
	if hit_count == 1 and inventory.get_children().size() > 0:
		var child = inventory.get_child(0)  
		child.release()
		child.reparent(get_parent())
	elif hit_count > 1:
		print("Bomb explodes!")

func get_input():
	if ready:
		var input_direction = Input.get_vector("left", "right", "up", "down")
		hook.velocity = input_direction * speed

func _physics_process(delta):
	if ready:
		var colliding = hook.get_last_slide_collision()
		if colliding != null:# and colliding.name == "obstacle":
			on_hit()
		get_input()
		chain.set_point_position(0, get_node("spool").get_global_position())
		chain.set_point_position(1, get_node("hook").get_global_position())
		hook.move_and_slide()
