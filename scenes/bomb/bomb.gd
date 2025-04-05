extends RigidBody2D

@export var ship_return : Area2D

var grabbed = false

func release():
	grabbed = false
	set_freeze_enabled(false)


func _on_area_2d_body_entered(body:Node2D) -> void:
	if body.name == "hook":
		grabbed = true
		reparent(body.get_parent().get_node("inventory"))
		set_freeze_enabled(true)
		if ship_return != null:
			ship_return.enable()

func _on_body_entered(body:Node) -> void:
	if body.name == "hook":
		grabbed = true
		set_freeze_enabled(true)
		reparent(body.get_parent().get_node("inventory"))
		print(body.get_parent().name)
		if ship_return != null:
			ship_return.enable()
