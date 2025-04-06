extends Node2D

@export var direction: int = 1
@export var spawn_rate: float = 1.0
@export var fish_scene: PackedScene
@export var spawn_points: Path2D

func _ready() -> void:
	$timer.wait_time = spawn_rate
	$timer.start()

func _on_timer_timeout() -> void:
	spawn_fish_along_path()

func spawn_fish_along_path():
	var curve = spawn_points.curve
	var points = curve.get_baked_points()
	var random_index = randi() % points.size()
	var spawn_point = points[random_index]
	var new_fish = fish_scene.instantiate()
	new_fish.position = spawn_point
	new_fish.direction = direction
	add_child(new_fish)
