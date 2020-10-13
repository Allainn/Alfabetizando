extends Control

onready var audio = get_node("Audio")
onready var timer = get_node("Timer")

func _ready():
	pass 


func _on_Alfabeto_pressed():
	get_tree().change_scene("res://scenes/a_z.tscn")
	queue_free()
	

func _on_Jogo_pressed():
	get_tree().change_scene("res://scenes/game.tscn")
	queue_free()


func _on_Sair_pressed():
	audio.play()
	timer.start()
	

func _on_Timer_timeout():
	queue_free()
	get_tree().quit()
