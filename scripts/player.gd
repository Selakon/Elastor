extends KinematicBody2D

export var h_speed = 100
export var max_h_speed = 300
export var jump_speed = -100
export var gravity = 100

var velocity = Vector2(0,0)
var movement_dir = 0 

# Every frame 
func _physics_process(delta):
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var jump = Input.is_action_just_pressed("ui_up")
	
	# horizontal move
	movement_dir = -int(left) + int(right)
	if movement_dir != 0 :
		var new_velocity = velocity.x + (h_speed * movement_dir * delta)
		velocity.x = min(new_velocity, max_h_speed)
	else:
		velocity.x = 0
	
	
	# vertical move (jump and gravity)
	if jump and is_on_floor():
		velocity.y += jump_speed
	if !is_on_floor():
		velocity.y += gravity * delta
	
	# apply movement
	velocity = move_and_slide(velocity, Vector2.UP)
