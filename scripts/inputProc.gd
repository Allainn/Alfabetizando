extends Node2D

var curpos = Vector2(0, 0)

func _ready():
	set_process_input(true)
	set_physics_process(true)

func _physics_process(_delta):
	if curpos != Vector2(0, 0):
		var space_state = get_world_2d().get_direct_space_state()
		var result = space_state.intersect_point(curpos)
		if not result.empty():
			result[0].collider.estourar()

func _input(event):
	event = make_input_local(event)
	if event is InputEventScreenTouch:
		if event.pressed:
			pressed(event.position)
		else:
			released()
			
func pressed(pos):
	curpos = pos

func released():
	curpos = Vector2(0, 0)
