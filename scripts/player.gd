extends KinematicBody2D

export var h_speed = 500
export var gravity = Vector2(0,50)
export var jump_speed = Vector2(0,-600)
export var max_speed = 450

var velocity = Vector2(0,0)
var horizontal_movement_dir = 0

func _physics_process(delta):
	
	# horizontal movement
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	
	horizontal_movement_dir = -int(left) + int(right) 
	
	if left and right:
		velocity.x = 0
	elif left:
		velocity.x += h_speed * horizontal_movement_dir * delta
	elif right: 
		velocity.x += h_speed * horizontal_movement_dir * delta
	else: 
		velocity.x = 0 

	# jump  
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity += jump_speed 
	
	# apply gravity 
	if !is_on_floor():
		velocity += gravity 
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
