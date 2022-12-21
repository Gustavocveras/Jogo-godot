extends Node2D

var pre_meteor = preload("res://scenes/globuloFerido.tscn")
var intervalo = 1

func _ready():
	set_process(true)
	randomize()
	pass

func _process(delta): 
	
	if intervalo > 0:
		intervalo -= delta
	
	else:
		intervalo = rand_range(0.1, 0.8)
		var globuloBranco = pre_meteor.instance()
		globuloBranco.set_position(Vector2(rand_range(1000, 50000), rand_range(200, 415)))
		get_parent().add_child(globuloBranco)
		

