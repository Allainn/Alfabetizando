extends RigidBody2D

onready var shape = get_node("Shape")
onready var sprite0 = get_node("Sprite0")
onready var sprite1 = get_node("Sprite1")
onready var limpar = get_node("Limpar")
onready var animation = get_node("Animation")
onready var label = get_node("Letra")
onready var audio = get_node("AudioEstouro")

signal ponto
signal perde

var letra = "A"
var letra_certa

func _ready():
	randomize()
	cor_balao()
	label.set_text(letra)
	set_process(true)
	
func cor_balao():
	var op = int(rand_range(0, 12))
	var cor_balao
	var cor_estouro
	if op == 0:
		cor_balao = preload("res://assets/balao_amarelo.png")
		cor_estouro = preload("res://assets/estouro_amarelo.png")
	elif op == 1:
		cor_balao = preload("res://assets/balao_azul.png")
		cor_estouro = preload("res://assets/estouro_azul.png")
	elif op == 2:
		cor_balao = preload("res://assets/balao_azul_escuro.png")
		cor_estouro = preload("res://assets/estouro_azul_escuro.png")
	elif op == 3:
		cor_balao = preload("res://assets/balao_azul_m.png")
		cor_estouro = preload("res://assets/estouro_azul_m.png")
	elif op == 4:
		cor_balao = preload("res://assets/balao_azul_m_escuro.png")
		cor_estouro = preload("res://assets/estouro_azul_m_escuro.png")
	elif op == 5:
		cor_balao = preload("res://assets/balao_branco.png")
		cor_estouro = preload("res://assets/estouro_branco.png")
	elif op == 6:
		cor_balao = preload("res://assets/balao_magenta.png")
		cor_estouro = preload("res://assets/estouro_magenta.png")
	elif op == 7:
		cor_balao = preload("res://assets/balao_marrom.png")
		cor_estouro = preload("res://assets/estouro_marrom.png")
	elif op == 8:
		cor_balao = preload("res://assets/balao_roxo.png")
		cor_estouro = preload("res://assets/estouro_roxo.png")
	elif op == 9:
		cor_balao = preload("res://assets/balao_verde.png")
		cor_estouro = preload("res://assets/estouro_verde.png")
	elif op == 10:
		cor_balao = preload("res://assets/balao_verde_escuro.png")
		cor_estouro = preload("res://assets/estouro_verde_escuro.png")
	elif op == 11:
		cor_balao = preload("res://assets/balao_vermelho.png")
		cor_estouro = preload("res://assets/estouro_vermelho.png")
	
	sprite0.set_texture(cor_balao)
	sprite1.set_texture(cor_estouro)
	
func _process(_delta):
	if position.y < -100:
		if letra == letra_certa:
			emit_signal("perde")
			print("perdeu")
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
	audio.play()
	
func errou():
	emit_signal("perde")
	estourar()
	print("Errou")
	
func acertou():
	emit_signal("ponto")
	estourar()
	print("Acertou")

func _on_Limpar_timeout():
	queue_free()
	
func set_letra_certa(_letra):
	letra_certa = _letra
	
func set_letra(_letra):
	letra = _letra
