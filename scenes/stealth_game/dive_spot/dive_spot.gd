extends Area2D

@export var location = "divespot1"

func _on_body_entered(body: Node2D) -> void:
	if(body.has_method("entered_area")):
		body.entered_area(self)
func _on_body_exited(body: Node2D) -> void:
	if(body.has_method("exited_area")):
		body.exited_area(self)
