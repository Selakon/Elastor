extends KinematicBody2D

# Constants 
const SPEED = 100
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2.UP

# Atributes
export var velocity := Vector2.ZERO; 

# Every frame 
func _physics_process(_delta):
	# Move 
	if Input.is_action_pressed("ui_right"):
		$Animations.play("walk")
		$Animations.flip_h = false
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$Animations.play("walk")
		$Animations.flip_h = true
	else :
		velocity.x = 0
		if is_on_floor() : 
			$Animations.play("idle")
		
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_POWER
	
	if !is_on_floor():
		if velocity.y < 0 :
			$Animations.play("jump")
		else: 
			$Animations.play("fall")
			
	velocity.y += GRAVITY
		
	velocity = move_and_slide(velocity, FLOOR)
