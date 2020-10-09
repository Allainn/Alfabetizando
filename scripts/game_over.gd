extends Control

var pode = false

func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventScreenTouch and pode:
		get_tree().reload_current_scene()

func start():
	show()
	get_node("AnimationPlayer").play("GameOver")
	get_node("Timer").start()

func _on_Timer_timeout():
	pode = true
	get_node("Label2").show()
	get_node("Label3").show()
	get_node("Balao").show()
	get_node("ScoreFinal").show()
