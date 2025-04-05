extends Node2D

@export var speed = 600

@onready var chain = get_node("chain")
@onready var hook = get_node("hook")
@onready var inventory = $hook/inventory
@onready var cooldown = get_node("cooldown")

var hit_count = 0

func on_hit():
	hit_count += 1
	if inventory.get_children().size() > 0:
		if hit_count == 1:
			var child = inventory.get_child(0)  
			child.release()
			child.reparent(get_parent())
		elif hit_count > 1:
			var child = inventory.get_child(0) 
			if child != null and child.has_method("explode"):
				print("Bomb explodes!")
				child.explode()
			else:
				child.release()
				child.queue_free()

func get_input():
	if ready:
		var input_direction = Input.get_vector("left", "right", "up", "down")
		hook.velocity = input_direction * speed

func _physics_process(delta):
	if ready:
		var colliding = hook.get_last_slide_collision()
		if cooldown.is_stopped() && colliding != null:# and colliding.name == "obstacle":
			cooldown.start()
			on_hit()
		get_input()
		chain.set_point_position(0, get_node("spool").get_global_position())
		chain.set_point_position(1, get_node("hook").get_global_position())
		hook.move_and_slide()
