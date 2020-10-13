extends Control

var pode = false

func _ready():
	set_process_input(true)

func start():
	show()
	get_node("AnimationPlayer").play("GameOver")
	get_node("Timer").start()

func _on_Timer_timeout():
	pode = true
	get_node("Jogar").show()
	get_node("Voltar").show()


func _on_Jogar_pressed():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()


func _on_Voltar_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/main.tscn")
	queue_free()
