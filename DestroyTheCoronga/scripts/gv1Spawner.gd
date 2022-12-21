extends Node2D

var pre_meteor = preload("res://scenes/globuloVermelho1.tscn")
var intervalo = 1

func _ready():
	set_process(true)
	randomize()
	pass

func _process(delta): 
	
	if intervalo > 0:
		intervalo -= delta
	
	else:
		intervalo = rand_range(0.1, 1)
		var globuloBranco = pre_meteor.instance()
		globuloBranco.set_position(Vector2(0, rand_range(160, 450)))
		get_parent().add_child(globuloBranco)
		


func _on_Timer_timeout():
	queue_free()
	pass
