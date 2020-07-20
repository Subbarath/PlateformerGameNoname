class_name OnGround
extends Motion

var speed : float = 0.0
var motion : Vector2 = Vector2()

func handle_input(event : InputEvent) -> bool:
	if event.is_action_pressed("movement_jump"):
		emit_signal("finished","jump")
		return true
	return .handle_input(event)
