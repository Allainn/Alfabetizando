extends Node2D

onready var baloes = get_node("Baloes")
onready var input = get_node("InputProc")
onready var genaratorAleatorio = get_node("GenaratorAleatoria")
onready var genaratorCerta = get_node("GenaratorCerta")
onready var gerarLetra = get_node("GerarLetra")

var balao = preload("res://scenes/balao.tscn")

var letras = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", 
			  "N", "O", "P", "Q", "R", "S", "T", "U", "V", "X", "Y", "W", "Z"]
var letra

var score = 0
var lifes = 5

func _ready():
	randomize()
	gerar_letra()
	pass # Replace with function body.

func gerar_letra():
	letra = letras[rand_range(0,26)]
	input.set_letra(letra)
	print(letra)

func _on_Genarator_timeout():
	randomize()
	var obj = balao.instance()
	
	var letra2 = letras[rand_range(0,26)]
	
	obj.set_letra(letra2)
	obj.set_letra_certa(letra)
	obj.born(Vector2(rand_range(90, 630), 1500))
	
	obj.connect("ponto", self, "_inc_score")
	obj.connect("perde", self, "_dec_life")
	
	baloes.add_child(obj)


func _on_GenaratorCerta_timeout():
	var obj = balao.instance()
	
	obj.set_letra(letra)
	obj.set_letra_certa(letra)
	obj.born(Vector2(rand_range(90, 630), 1500))
	
	baloes.add_child(obj)

func _on_GerarLetra_timeout():
	gerar_letra()
	gerarLetra.stop()
	genaratorAleatorio.start()
	genaratorCerta.start()

func _on_Parar_timeout():
	genaratorAleatorio.stop()
	genaratorCerta.stop()
	gerarLetra.start()
	
func _dec_life():
	lifes -= 1
	if lifes == 0:
		print("GameOver")
	else:
		print("Lifes: ", lifes)
		
func _inc_score():
	print("Entrou")
	if lifes == 0: return
	score += 1
	print("Score: ", score)
	
	
