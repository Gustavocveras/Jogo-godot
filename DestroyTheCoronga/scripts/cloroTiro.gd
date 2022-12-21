extends Node2D

var vel = 700
var direcao = Vector2()

func _ready():
	set_process(true)
	pass

#tiro segue posição atual da nave	
func _process(delta):
	translate(direcao * vel * delta)
	pass	

#faz tiro sumir depois de um tempo pre-determinado
func _on_Timer_timeout():
	queue_free()

func _on_Area2D_area_entered(area):
	queue_free()
