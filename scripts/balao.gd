extends RigidBody2D

onready var shape = get_node("Shape")
onready var sprite0 = get_node("Sprite0")
onready var sprite1 = get_node("Sprite1")
onready var limpar = get_node("Limpar")
onready var animation = get_node("Animation")

func _ready():
	randomize()
	#born(Vector2(630, 1500))
	set_process(true)
	
func _process(_delta):
	if position.y < -100:
		print("perdeu")
		#emit_signal("life")
		queue_free()

func born(inipos):
	position = inipos
	var inivel = Vector2(0, rand_range(-600, -200))
	set_linear_velocity(inivel)

func estourar():
	set_mode(MODE_KINEMATIC)
	sprite0.queue_free()
	#sprite0.visible = false
	shape.queue_free()
	sprite1.visible = true
	animation.play("Estouro")
	limpar.start()

func _on_Limpar_timeout():
	queue_free()
