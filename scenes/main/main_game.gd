extends Node2D

@onready var stealth_game_scene = $stealth_game

var dive_spots = [null, preload("res://scenes/dive_game/dive_game.tscn")]

var current_dive_spot = null

func _on_title_screen_start_game_pressed() -> void:
	$title_screen.hide()
	$stealth_game/Camera2D.make_current()
	$stealth_game.show()

func _on_stealth_game_dive(location) -> void:
	current_dive_spot = dive_spots[location].instantiate()
	get_tree().root.get_node("main_game").add_child(current_dive_spot)
	current_dive_spot.get_node("hook").get_node("hook").get_node("Camera2D").make_current()
	remove_child($stealth_game)

func _on_dive_game_end_game_pressed() -> void:
	current_dive_spot.queue_free()
	get_tree().root.get_node("main_game").add_child(stealth_game_scene)
	stealth_game_scene.get_node("Camera2D").make_current()
