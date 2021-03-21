extends StateMachine

func _state_logic(delta):
	add_state("idle")
	add_state("walk_left")
	add_state("walk_right")
	add_state("jump")
	add_state("fall")
	call_deferred("set_state", states.idle)

func _get_transition(delta):
	pass
func _enter_state(new_state, old_state):
	pass
func _exit_state(old_state, new_state):
	pass
