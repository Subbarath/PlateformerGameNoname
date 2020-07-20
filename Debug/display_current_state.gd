extends Label

func _on_Player_state_changed(state):
	text = state.get_name()
