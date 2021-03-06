extends Node2D

onready var baloes = get_node("Baloes")
onready var input = get_node("InputProc")
onready var genaratorAleatorio = get_node("GenaratorAleatoria")
onready var genaratorCerta = get_node("GenaratorCerta")
onready var gerarLetra = get_node("GerarLetra")
onready var parar = get_node("Parar")
onready var label_score = get_node("Control/Score")
onready var balao1 = get_node("Control/Balao1")
onready var balao2 = get_node("Control/Balao2")
onready var balao3 = get_node("Control/Balao3")
onready var balao4 = get_node("Control/Balao4")
onready var balao5 = get_node("Control/Balao5")
onready var audio = get_node("Audio")

var letras_audio = {
	"A": preload("res://assets/sons/a.tres"),
	"B": preload("res://assets/sons/b.tres"),
	"C": preload("res://assets/sons/c.tres"),
	"D": preload("res://assets/sons/d.tres"),
	"E": preload("res://assets/sons/e.tres"),
	"F": preload("res://assets/sons/f.tres"),
	"G": preload("res://assets/sons/g.tres"),
	"H": preload("res://assets/sons/h.tres"),
	"I": preload("res://assets/sons/i.tres"),
	"J": preload("res://assets/sons/j.tres"),
	"K": preload("res://assets/sons/k.tres"),
	"L": preload("res://assets/sons/l.tres"),
	"M": preload("res://assets/sons/m.tres"),
	"N": preload("res://assets/sons/n.tres"),
	"O": preload("res://assets/sons/o.tres"),
	"P": preload("res://assets/sons/p.tres"),
	"Q": preload("res://assets/sons/q.tres"),
	"R": preload("res://assets/sons/r.tres"),
	"S": preload("res://assets/sons/s.tres"),
	"T": preload("res://assets/sons/t.tres"),
	"U": preload("res://assets/sons/u.tres"),
	"V": preload("res://assets/sons/v.tres"),
	"W": preload("res://assets/sons/w.tres"),
	"X": preload("res://assets/sons/x.tres"),
	"Y": preload("res://assets/sons/y.tres"),
	"Z": preload("res://assets/sons/z.tres")
}

var balao = preload("res://scenes/balao.tscn")

var letras = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", 
			  "N", "O", "P", "Q", "R", "S", "T", "U", "V", "X", "Y", "W", "Z"]
var letra

var score = 0
var lifes = 5

func _ready():
	randomize()
	audio.set_stream(preload("res://assets/sons/jogar.tres"))
	audio.play()
	label_score.set_text(str(score))

func gerar_letra():
	letra = letras[rand_range(0,26)]
	input.set_letra(letra)
	audio.set_stream(letras_audio[letra])
	audio.play()
	print(letra)

func _on_Genarator_timeout():
	randomize()
	var obj = balao.instance()
	
	var letra2 = letras[rand_range(0,26)]
	
	obj.set_letra(letra2)
	obj.set_letra_certa(letra)
	obj.born(Vector2(rand_range(90, 630), 1500))
	
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
	if lifes == 4:
		balao5.set_texture(preload("res://assets/estouros/estouro_vermelho.png"))
	if lifes == 3:
		balao4.set_texture(preload("res://assets/estouros/estouro_verde_escuro.png"))
	if lifes == 2:
		balao3.set_texture(preload("res://assets/estouros/estouro_magenta.png"))
	if lifes == 1:
		balao2.set_texture(preload("res://assets/estouros/estouro_azul_m_escuro.png"))
	if lifes == 0:
		balao1.set_texture(preload("res://assets/estouros/estouro_azul.png"))
		genaratorAleatorio.stop()
		genaratorCerta.stop()
		gerarLetra.stop()
		parar.stop()
		get_node("GameOverScreen").start()
		get_node("GameOverScreen/ScoreFinal").set_text(str(score))
		get_node("InputProc").acabou = true
		print("GameOver")
	else:
		print("Lifes: ", lifes)
		
func _inc_score():
	if lifes == 0: return
	score += 1
	label_score.set_text(str(score))
	print("Score: ", score)
	
	
func _on_Iniciar_timeout():
	parar.start()
	genaratorAleatorio.start()
	genaratorCerta.start()
	gerar_letra()
