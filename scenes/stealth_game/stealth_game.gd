extends Node2D
signal dive(location)

func _on_ship_dive(location) -> void:
	dive.emit(location)

func _on_ship_sonar() -> void:
	var ship_position = $ship.global_position
	var closest_dive_spot_position = $DiveSpots.get_child(0).global_position
	var closest_position_distance = closest_dive_spot_position.distance_to(ship_position)
	
	for dive_spot in $DiveSpots.get_children():
		var position_distance = dive_spot.global_position.distance_to(ship_position)
		if position_distance < closest_position_distance:
			closest_dive_spot_position = dive_spot.global_position
			closest_position_distance = position_distance
	
	$Camera2D/DiveSpotPointer.look_at(closest_dive_spot_position)
	$Camera2D/DiveSpotPointer.show()
	$Camera2D/DiveSpotPointer/Timer.start()

func _on_timer_timeout() -> void:
	$Camera2D/DiveSpotPointer.hide()
