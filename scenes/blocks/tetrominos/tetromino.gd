extends Node2D

const BASE_SPEED = 40.0
const MAX_SPEED = 400.0

var current_speed = BASE_SPEED
var is_static = false
var is_leftmost = false
var is_rightmost = false


func _ready() -> void:
	for block in get_children():
		if block is StaticBody2D:
			block.connect("block_collided", _on_block_collided)


func _physics_process(delta: float) -> void:
	if not is_static:
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
	if not is_rightmost:
		position.x += 32
		is_leftmost = false
	
	
func move_left():
	if not is_leftmost:
		position.x -= 32
		is_rightmost = false
	
	
func switch():
	is_leftmost = false
	is_rightmost = false
	rotate(deg_to_rad(90))


func _on_block_collided(collided_bodies):	
	for body in collided_bodies:
		if body not in get_children():
			if body.name == 'Floor':
				is_static = true
				
			if body.name == 'LeftWall':
				is_leftmost = true
				
			if body.name == 'RightWall':
				is_rightmost = true
				
			if body.name == 'OuterLeftWall':
				position.x += 32

			if body.name == 'OuterRightWall':
				position.x -= 32
