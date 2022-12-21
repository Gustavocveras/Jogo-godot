extends Node2D

var pre_meteor = preload("res://scenes/virusDesfarcado.tscn")
var intervalo = 3

func _ready():
	set_process(true)
	randomize()
	pass

func _process(delta): 
	
	if intervalo > 0:
		intervalo -= delta
	
	else:
		intervalo = rand_range(1, 2.2)
		var globuloBranco = pre_meteor.instance()
		globuloBranco.set_position(Vector2(rand_range(40, 980),-80))
		get_parent().add_child(globuloBranco)
		
