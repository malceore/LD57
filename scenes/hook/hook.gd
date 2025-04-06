extends Node2D

@export var speed = 600

@onready var chain = get_node("chain")
@onready var hook = get_node("hook")
@onready var inventory = $hook/inventory
@onready var cooldown = get_node("cooldown")
@onready var animation_player = get_node("AnimationPlayer")
@onready var ap_splash = get_node("AP_Splash")
@onready var ap_winch = get_node("AP_Winch")

var hit_count = 0
var playing = true


func _ready():
	ap_splash.play()

func on_hit():
	hit_count += 1
	if inventory.get_children().size() > 0:
		if hit_count > 2:
			# Time to destory the item.
			var child = inventory.get_child(0) 
			if child != null and child.has_method("explode"):
				print("Bomb explodes!")
				animation_player.play("shake")
				child.explode()
			else:
				animation_player.play("shake")
				child.release()
				child.queue_free()
		else:
			# Otherwise we just drop it.
			var child = inventory.get_child(0)  
			child.release()
			animation_player.play("shake")
			child.reparent(get_parent())


func get_input():
	if ready and playing:
		var input_direction = Input.get_vector("left", "right", "up", "down")
		hook.velocity = input_direction * speed
		if hook.velocity != Vector2.ZERO && !ap_winch.is_playing():
			ap_winch.play()


func _physics_process(delta):
	if ready:
		var colliding = hook.get_last_slide_collision()
		if cooldown.is_stopped() && colliding != null:
			if "fish" in colliding.get_collider().get_parent().name or "obstacle" in colliding.get_collider().get_parent().name:
				#print(colliding.get_collider().get_parent().name)
				cooldown.start()
				on_hit()
		get_input()
		chain.set_point_position(0, get_node("spool").get_global_position())
		chain.set_point_position(1, get_node("hook").get_global_position())
		hook.move_and_slide()
