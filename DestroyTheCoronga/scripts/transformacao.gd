extends Node2D

var pre_boss = preload("res://scenes/composicao.tscn")

func _ready():
	$AnimatedSprite.play("transicao")

func _on_Timer_timeout():
	var bossFim = pre_boss.instance()
	get_parent().add_child(bossFim)
