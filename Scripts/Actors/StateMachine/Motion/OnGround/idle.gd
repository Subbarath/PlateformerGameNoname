class_name Idle
extends OnGround


func _enter()->void:
	owner.get_node("AnimatedSprite").animation = "idle"

func update(delta)->void:
	var input_direction = get_input_direction()
	if not owner.is_on_floor() :
		emit_signal("finished","fall")
	if input_direction :
		emit_signal("finished","move")
