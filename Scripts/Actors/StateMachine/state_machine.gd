extends Node
class_name StateMachine

signal state_changed(current_state)

export(NodePath) var START_STATE : NodePath

var state_map = {}
var state_stack = []
var current_state : State = null
var _active : bool = false setget set_active

func _ready():
	for child in get_children():
		var state = child as State
		state.connect("finished",self,"_change_state")
	initialize(START_STATE)

func initialize(start_state : NodePath):
	set_active(true)
	state_stack.push_front(get_node(start_state))
	current_state = state_stack[0]
	current_state._enter()
	emit_signal("state_changed",current_state)

func _unhandled_input(event : InputEvent):
	current_state.handle_input(event)

func _physics_process(delta):
	current_state.update(delta)

func _change_state(state_name : String):
	if not _active :
		return
	current_state.exit()
	
	if state_name == "previous" :
		state_stack.pop_front()
	else :
		state_stack[0] = state_map[state_name]
	
	current_state = state_stack[0]
	emit_signal("state_changed",current_state)
	
	if state_name != "previous" :
		current_state._enter()

func set_active(value):
	_active = value
	set_physics_process(value)
	set_process_internal(value)
	if not _active :
		state_stack = []
		current_state = null

