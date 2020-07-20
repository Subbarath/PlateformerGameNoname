class_name Move
extends OnGround

export(float) var MAX_WALK_SPEED : float = 200
export(float) var DASH_SPEED : float = 500

func _enter():
	speed=0.0
	motion = Vector2.ZERO
	
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	owner.get_node("AnimatedSprite").animation = "walk"
	
func handle_input(event:InputEvent) -> bool :
	return .handle_input(event)
	
func update(delta) :
	var input_direction = get_input_direction()
	if not input_direction :
		emit_signal("finished","idle")
	update_look_direction(input_direction)
	speed = MAX_WALK_SPEED
	move(speed,input_direction)

func move(speed:float,direction : Vector2):
	motion = direction.normalized() * speed
	owner.move_and_slide(motion,Vector2(0,-1))
