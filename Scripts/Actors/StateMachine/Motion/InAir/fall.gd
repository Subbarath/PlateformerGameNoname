class_name Fall
extends InAir


var fall_motion : Vector2 = Vector2.ZERO

func _enter():
	owner.get_node("AnimatedSprite").animation = "fall"

func initialize(motion : Vector2):
	fall_motion = motion

func update(delta):
	var input_direction = get_input_direction()
	falling(delta,input_direction)
	if owner.is_on_floor():
		owner.nbOfJumps = 0
		if input_direction :
			emit_signal("finished","move")
		else :
			emit_signal("finished","idle")
		print(owner)
	
func falling(delta : float, direction : Vector2) :
	
	fall_motion.y += GRAVITY
	if fall_motion.y >=800 :
		fall_motion.y = 800
	owner.move_and_slide(fall_motion,UP)

func handle_input(event : InputEvent) -> bool:
	if event.is_action_pressed("movement_jump") and owner.nbOfJumps < owner.MAX_JUMPS:
		emit_signal("finished","jump")
		return true
	return .handle_input(event)
