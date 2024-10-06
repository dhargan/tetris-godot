extends Node2D

@export var tetrominos: Array[PackedScene] = []

var current_tetromino = null

func _ready() -> void:
	spawn_tetromino()

func _process(delta: float) -> void:
	if current_tetromino and current_tetromino.is_static:
		spawn_tetromino()

func spawn_tetromino() -> void:
	var tetromino_index = randi_range(0, 6)
	current_tetromino = tetrominos[tetromino_index].instantiate() as Node2D
	add_child(current_tetromino)
