extends Node2D

onready var baloes = get_node("Baloes")
onready var input = get_node("InputProc")

var balao = preload("res://scenes/balao.tscn")

var letras = ["A", "B", "C", "D", "E"]
var letra

func _ready():
	randomize()
	letra = letras[rand_range(0,5)]
	input.set_letra(letra)
	print(letra)
	pass # Replace with function body.


func _on_Genarator_timeout():
	randomize()
	var obj = balao.instance()
	
	obj.set_letra_certa(letra)
	obj.born(Vector2(rand_range(90, 630), 1500))
	
	baloes.add_child(obj)
