class_name Jump
extends InAir


export(float) var BASE_MAX_HORIZONTAL_SPEED = 400.0


var enter_velocity : Vector2 = Vector2.ZERO
var max_horizontal_speed : float = 0.0
var horizontal_speed : float = 0.0
var motion : Vector2 = Vector2.ZERO
var height : float = 0.0

func _enter():
	owner.nbOfJumps += 1
	owner.get_node("AnimatedSprite").animation = "jump"
	var input_direction = get_input_direction()
	update_look_direction(input_direction)
	
	motion = enter_velocity if input_direction else Vector2.ZERO
	jump_speed = 125
	
func initialize(speed : float,motion:Vector2):
	horizontal_speed = speed
	max_horizontal_speed = speed if speed >0.0 else BASE_MAX_HORIZONTAL_SPEED
	enter_velocity = motion
	
func update(delta):
	var input_direction = get_input_direction()
	update_look_direction(input_direction)

	move_horizontally(delta, input_direction)
#	animate_jump_height(delta)
	if jump_speed <=0.0 :
		emit_signal("finished","fall")

func move_horizontally(delta, direction):
	jump_speed -= GRAVITY
	if direction:
		horizontal_speed += AIR_ACCELERATION * delta
	else:
		horizontal_speed -= AIR_DECCELERATION * delta
	horizontal_speed = clamp(horizontal_speed, 0, max_horizontal_speed)

	var target_velocity = horizontal_speed * direction.normalized()
	var steering_velocity = (target_velocity - motion).normalized() * AIR_STEERING_POWER
	motion += steering_velocity
	motion.y -= jump_speed
	owner.move_and_slide(motion,UP)



