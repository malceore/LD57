extends Area2D

@onready var score_float_text = get_node("float_text")
@onready var colShape2D = get_node("CollisionShape2D")
@onready var set_sail_button = get_node("SetSailButton")

var enabled = false

func _ready() -> void:
	set_sail_button.visible = false

func enable():
	enabled = true

func _on_body_entered(body:Node2D) -> void:
	if enabled:
		for item in body.get_node("inventory").get_children():
			if body.get_parent().has_method("stop_playing"):
				body.get_parent().stop_playing()
			score_float_text.reveal("Plus " + str(item.score_value) + " points!")
			Globals.SCORE += item.score_value
			#item.queue_free()
			await get_tree().create_timer(0.4).timeout
		set_sail_button.visible = true

func _on_set_sale_button_pressed() -> void:
	get_tree().get_root().get_node("main_game")._on_dive_game_end_game_pressed()
