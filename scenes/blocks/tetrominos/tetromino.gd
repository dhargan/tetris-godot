extends Node2D

var SPEED = 40.0

func _process(delta: float) -> void:
	position.y += SPEED * delta
