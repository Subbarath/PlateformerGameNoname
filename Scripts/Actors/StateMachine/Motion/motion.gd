class_name Motion
extends State

const UP : Vector2 = Vector2(0,-1)


func get_input_direction() -> Vector2:
	var direction = Vector2.ZERO
	direction.x = int(Input.is_action_pressed("movement_right")) - int(Input.is_action_pressed("movement_left"))
	return	direction

func update_look_direction(direction : Vector2) -> void :
	if direction and owner.look_direction != direction:
		owner.look_direction = direction
	if not direction.x in [-1,1] :
		return
	owner.get_node("AnimatedSprite").set_scale(Vector2(direction.x,1))
	


