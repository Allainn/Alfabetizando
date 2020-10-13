extends Control

onready var Audio = get_node("Audio")

func _ready():
	Audio.set_stream(preload("res://assets/sons/a-z.tres"))
	Audio.play()


func _on_ButtonA_pressed():
	Audio.set_stream(preload("res://assets/sons/a.tres"))
	Audio.play()


func _on_ButtonB_pressed():
	Audio.set_stream(preload("res://assets/sons/b.tres"))
	Audio.play()


func _on_ButtonC_pressed():
	Audio.set_stream(preload("res://assets/sons/c.tres"))
	Audio.play()


func _on_ButtonD_pressed():
	Audio.set_stream(preload("res://assets/sons/d.tres"))
	Audio.play()


func _on_ButtonE_pressed():
	Audio.set_stream(preload("res://assets/sons/e.tres"))
	Audio.play()


func _on_ButtonF_pressed():
	Audio.set_stream(preload("res://assets/sons/f.tres"))
	Audio.play()


func _on_ButtonG_pressed():
	Audio.set_stream(preload("res://assets/sons/g.tres"))
	Audio.play()


func _on_ButtonH_pressed():
	Audio.set_stream(preload("res://assets/sons/h.tres"))
	Audio.play()


func _on_ButtonI_pressed():
	Audio.set_stream(preload("res://assets/sons/i.tres"))
	Audio.play()


func _on_ButtonJ_pressed():
	Audio.set_stream(preload("res://assets/sons/j.tres"))
	Audio.play()


func _on_ButtonK_pressed():
	Audio.set_stream(preload("res://assets/sons/k.tres"))
	Audio.play()


func _on_ButtonL_pressed():
	Audio.set_stream(preload("res://assets/sons/l.tres"))
	Audio.play()


func _on_ButtonM_pressed():
	Audio.set_stream(preload("res://assets/sons/m.tres"))
	Audio.play()


func _on_ButtonN_pressed():
	Audio.set_stream(preload("res://assets/sons/n.tres"))
	Audio.play()


func _on_ButtonO_pressed():
	Audio.set_stream(preload("res://assets/sons/o.tres"))
	Audio.play()


func _on_ButtonP_pressed():
	Audio.set_stream(preload("res://assets/sons/p.tres"))
	Audio.play()


func _on_ButtonQ_pressed():
	Audio.set_stream(preload("res://assets/sons/q.tres"))
	Audio.play()


func _on_ButtonR_pressed():
	Audio.set_stream(preload("res://assets/sons/r.tres"))
	Audio.play()


func _on_ButtonS_pressed():
	Audio.set_stream(preload("res://assets/sons/s.tres"))
	Audio.play()


func _on_ButtonT_pressed():
	Audio.set_stream(preload("res://assets/sons/t.tres"))
	Audio.play()


func _on_ButtonU_pressed():
	Audio.set_stream(preload("res://assets/sons/u.tres"))
	Audio.play()


func _on_ButtonV_pressed():
	Audio.set_stream(preload("res://assets/sons/v.tres"))
	Audio.play()


func _on_ButtonW_pressed():
	Audio.set_stream(preload("res://assets/sons/w.tres"))
	Audio.play()


func _on_ButtonX_pressed():
	Audio.set_stream(preload("res://assets/sons/x.tres"))
	Audio.play()


func _on_ButtonY_pressed():
	Audio.set_stream(preload("res://assets/sons/y.tres"))
	Audio.play()


func _on_ButtonZ_pressed():
	Audio.set_stream(preload("res://assets/sons/z.tres"))
	Audio.play()
	

func _on_Voltar_pressed():
	get_tree().change_scene("res://scenes/main.tscn")
	queue_free()
