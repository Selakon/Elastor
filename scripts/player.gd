extends KinematicBody2D

export var h_speed = 600
export var gravity = Vector2(0,50)
export var jump_speed = Vector2(0,-600)
export var max_speed = 450

var velocity = Vector2(0,0)
var horizontal_movement_dir

func _physics_process(delta):
	# horizontal movement
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	
	if left and right:
		velocity.x = 0
	elif left:
		velocity.x += h_speed * delta * horizontal_movement_dir
	elif right: 
		velocity.x += h_speed * delta * horizontal_movement_dir
	else: 
		velocity.x = 0 
	if(left):
		print("left: ", left) 
	if(right):
		print("right: ", right) 
	horizontal_movement_dir = -int(left) + int(right) 

	# jump  
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity += jump_speed 
	
	# apply gravity 
	if !is_on_floor():
		velocity += gravity 
	
	velocity = move_and_slide(velocity, Vector2.UP)
