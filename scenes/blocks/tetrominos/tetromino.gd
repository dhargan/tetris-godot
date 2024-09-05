extends Node2D

const BASE_SPEED = 40.0
const MAX_SPEED = 5000.0

var current_speed = BASE_SPEED

func _process(delta: float) -> void:
	if Input.is_action_pressed("move_down"):
		current_speed = MAX_SPEED
	else:
		current_speed = BASE_SPEED
	position.y += current_speed * delta
