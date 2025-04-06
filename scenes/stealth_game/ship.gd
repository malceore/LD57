extends CharacterBody2D

signal dive(location)
signal sonar
@onready var ap_motor = get_node("AP_Motor")
@onready var ap_sonar= get_node("AP_Sonar")

var sonar_ready = true

var current_area = null

var speed = 400.0
var rotation_speed = 1.5

func _process(delta):
	var move_direction = Vector2.ZERO
	var rotate_direction = 0.0
	var moved = false

	if Input.is_action_just_pressed("dive"):
		attempt_dive()
	if Input.is_action_just_pressed("sonar"):
		attempt_sonar_sweep()

	
	if Input.is_action_pressed("up"):
		move_direction += Vector2.UP
		moved = true
	if Input.is_action_pressed("down"):
		move_direction += Vector2.DOWN
		moved = true
	if Input.is_action_pressed("left"):
		rotate_direction -= 1.0
		moved = true
	if Input.is_action_pressed("right"):
		rotate_direction += 1.0
		moved = true
	
	if moved && !ap_motor.is_playing():
		ap_motor.play()
		print("playing")
	# else:
	# 	if audio_stream_player.is_playing():
	# 		audio_stream_player.stop()
	# 		print("not playing")
	rotation += rotate_direction * rotation_speed * delta

	move_direction = move_direction.rotated(rotation)
	velocity = move_direction.normalized() * speed

	move_and_slide()

func entered_area(area):
	current_area = area
	print(current_area)

func exited_area(area):
	if(area != current_area):
		return
	current_area = null

func attempt_dive():
	if(current_area == null):
		return
	var completed_area = current_area
	dive.emit(current_area.location)
	completed_area.queue_free()
	Globals.SPOTS_REMAINING -= 1

func attempt_sonar_sweep():
	if !sonar_ready:
		return
	sonar_ready = false
	ap_sonar.play()
	var dive_spots = $sonar.get_overlapping_areas()
	for spot in dive_spots:
		if spot.has_method("reveal_spot"):
			spot.reveal_spot()
			
	sonar.emit()
	$SonarTimer.start()

func _on_sonar_timer_timeout() -> void:
	sonar_ready = true
