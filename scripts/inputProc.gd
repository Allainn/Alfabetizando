extends Node2D

var curpos = Vector2(0, 0)


var letra

func _ready():
	set_process_input(true)
	set_physics_process(true)

func _physics_process(_delta):
	if curpos != Vector2(0, 0):
		var space_state = get_world_2d().get_direct_space_state()
		var result = space_state.intersect_point(curpos)
		if not result.empty():
			if result[0].collider.letra == letra:
				result[0].collider.acertou()
			else:
				result[0].collider.errou()

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
	
func set_letra(letra):
	self.letra = letra
