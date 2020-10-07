extends Node2D

onready var baloes = get_node("Baloes")

var balao = preload("res://scenes/balao.tscn")

func _ready():
	pass # Replace with function body.


func _on_Genarator_timeout():
	randomize()
	var obj = balao.instance()
	
	obj.born(Vector2(rand_range(90, 630), 1500))
	
	baloes.add_child(obj)
