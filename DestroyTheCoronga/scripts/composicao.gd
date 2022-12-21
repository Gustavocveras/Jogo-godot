extends Node2D

var pre_boss = preload("res://scenes/BossFinal.tscn")

func _ready():
	$Sprite.play("composicao")

func _on_Timer_timeout():
	var bossFim = pre_boss.instance()
	get_parent().add_child(bossFim)
