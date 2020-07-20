class_name PlayerStateMachine
extends StateMachine

func _ready():
	state_map = {
		"idle" : $Idle,
		"move" : $Move,
		"jump" : $Jump,
		"fall" : $Fall
	}

func _change_state(state_name):
	if not _active :
		return
	if state_name in ["jump"]:
		state_stack.push_front(state_map[state_name])
	if state_name in["jump"] and current_state == $Move:
		$Jump.initialize($Move.speed,$Move.motion)
	if state_name in["fall"] and current_state == $Jump:
		$Fall.initialize($Jump.motion)
	._change_state(state_name)
	print(state_name)
	
func _unhandled_input(event : InputEvent):
	current_state.handle_input(event)
