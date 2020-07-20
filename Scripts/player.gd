extends KinematicBody2D

signal direction_changed(new_direction)
const UP : Vector2 = Vector2(0,-1)

const MAX_JUMPS : int = 2

var can_dash : bool = false
var nbOfJumps : int = 0

var dash_vector : Vector2 =  Vector2(1,0)
var dashing : bool = false


var look_direction = Vector2(1,0) setget set_look_direction

func _ready():
	pass # Replace with function body.

func _process(delta):
#	friction()
#	dash()
#	move_and_slide(motion,UP)
	pass


func set_look_direction(value : Vector2) :
	look_direction = value
	emit_signal("direction_changed",value)
