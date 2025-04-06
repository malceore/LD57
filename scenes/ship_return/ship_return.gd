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
		score_float_text.reveal("<your score here>")
		set_sail_button.visible = true

func _on_set_sale_button_pressed() -> void:
	get_tree().get_root().get_node("main_game")._on_dive_game_end_game_pressed()
