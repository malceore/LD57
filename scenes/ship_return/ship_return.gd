extends Area2D

@onready var score_float_text = get_node("float_text")
@onready var colShape2D = get_node("CollisionShape2D")

var enabled = false

func enable():
	enabled = true

func _on_body_entered(body:Node2D) -> void:
	if enabled:
		score_float_text.reveal("test")
