extends RigidBody2D

@export var ship_return : Area2D

@onready var particals = $particals

var grabbed = false

func explode():
	particals.set_emitting(true)
	await particals.finished
	queue_free()

func release():
	set_freeze_enabled(false)
	await get_tree().create_timer(0.5).timeout
	grabbed = false

func _on_area_2d_body_entered(body:Node2D) -> void:
	if body.name == "hook" and !grabbed:
		if ship_return != null:
			ship_return.enable()
		grabbed = true
		reparent(body.get_node("inventory"))

		set_freeze_enabled(true)


