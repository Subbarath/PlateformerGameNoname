extends KinematicBody2D

signal direction_changed(new_direction)
const UP : Vector2 = Vector2(0,-1)
const MAX_JUMPS : int = 2
const PROJECTILE = preload("res://Scenes/Projectile.tscn")

var can_dash : bool = false
var nbOfJumps : int = 0

var dash_vector : Vector2 =  Vector2(1,0)
var dashing : bool = false

var look_direction = Vector2(1,0) setget set_look_direction


func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func set_look_direction(value : Vector2) :
	look_direction = value
	emit_signal("direction_changed",value)

func _unhandled_input(event : InputEvent):
	if event is InputEventMouseButton :
		if event.is_action_released("action_fire"):
			var projectile_position : Vector2 = get_global_mouse_position()
			var projectile : Projectile = PROJECTILE.instance()
			projectile.global_position = projectile_position
			projectile.motion = Vector2(200,-200)
			if projectile_position.x < position.x:
				projectile.motion.x = - projectile.motion.x
			owner.add_child(projectile)
