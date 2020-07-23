class_name Projectile
extends KinematicBody2D

var gravity : int = 10
var motion : Vector2 = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _process(delta):
	motion.y += gravity
	if is_on_floor() :
		motion.y = - motion.y / 2
		motion.x = motion.x / 2
		
	move_and_slide(motion, Vector2(0,-1))
