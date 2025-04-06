extends Node2D

@onready var stealth_game_scene = $stealth_game

var dive_spots = [null, preload("res://scenes/dive_game/dive_game.tscn")]

func _on_title_screen_start_game_pressed() -> void:
	$title_screen.hide()
	$stealth_game/Camera2D.make_current()
	$stealth_game.show()


func _on_stealth_game_dive(location) -> void:
	var dive_spot_current = dive_spots[location].instantiate()
	get_tree().root.add_child(dive_spot_current)
	dive_spot_current.get_node("hook").get_node("hook").get_node("Camera2D").make_current()
	remove_child($stealth_game)
