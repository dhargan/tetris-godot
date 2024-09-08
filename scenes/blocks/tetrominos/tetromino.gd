extends Node2D

const BASE_SPEED = 40.0
const MAX_SPEED = 5000.0

var current_speed = BASE_SPEED


func _ready() -> void:
	for block in get_children():
		if block is StaticBody2D:
			block.connect("block_collided", _on_block_collided)

func _process(delta: float) -> void:
	move_down(Input.is_action_pressed("move_down"), delta)
	
	if Input.is_action_just_pressed("move_right"):
		move_right()
		
	if Input.is_action_just_pressed("move_left"):
		move_left()
		
	if Input.is_action_just_pressed("switch"):
		switch()
		
	
func move_down(speed_up: bool, delta: float) -> void:
	if speed_up:
		current_speed = MAX_SPEED
	else:
		current_speed = BASE_SPEED
		
	position.y += current_speed * delta


func move_right():
	position.x += 32
	
	
func move_left():
	position.x -= 32
	
	
func switch():
	rotate(deg_to_rad(90))


func _on_block_collided(collided_bodies):
	for body in collided_bodies:
		if body not in get_children():
			print(body)
