extends RigidBody2D

onready var shape = get_node("Shape")
onready var sprite0 = get_node("Sprite0")
onready var sprite1 = get_node("Sprite1")
onready var limpar = get_node("Limpar")
onready var animation = get_node("Animation")
onready var label = get_node("Letra")

var letra
var letra_certa

func _ready():
	randomize()
	#born(Vector2(630, 1500))
	label.set_text(letra)
	set_process(true)
	
func _process(_delta):
	if position.y < -100:
		if letra == letra_certa:
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
	
func errou():
	estourar()
	print("Errou")
	
func acertou():
	estourar()
	print("Acertou")

func _on_Limpar_timeout():
	queue_free()
	
func set_letra_certa(letra):
	letra_certa = letra
	
func set_letra(letra):
	self.letra = letra
