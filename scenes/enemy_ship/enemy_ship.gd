extends CharacterBody2D
@export var path: Path2D


func _on_area_2d_body_entered(body):
	if name != body.name:
		print(body.name)

