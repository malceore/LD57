extends Control


func _on_button_pressed() -> void:
	Globals.SCORE = 0
	Globals.SPOTS_REMAINING = 6
	Globals.BOMBS_CAPTURED = 0
	get_tree().change_scene_to_file("res://scenes/main/main_game.tscn")
