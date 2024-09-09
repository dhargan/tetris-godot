extends Node2D

signal block_collided(collided_bodies)

var collided_objects = []


func _ready() -> void:
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)


func _on_body_entered(body) -> void:
	if body:
		if body not in collided_objects:
			collided_objects.append(body)
		block_collided.emit(collided_objects)

func _on_body_exited(body) -> void:
	if body:
		if body in collided_objects:
			collided_objects.erase(body)
		block_collided.emit(collided_objects)
