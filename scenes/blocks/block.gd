extends Node2D

signal block_collided(collided_bodies)

var collided_objects = []


func _ready() -> void:
	$Area2D.body_entered.connect(_on_body_entered)


func _on_body_entered(body) -> void:
	if body:
		collided_objects.append(body)
		block_collided.emit(collided_objects)
