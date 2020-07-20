extends Node

class_name State
signal finished(next_state_name)


func _enter()->void:
	pass

func exit()->void:
	pass

func handle_input(event:InputEvent)->bool:
	return true

func update(delta)->void:
	pass
