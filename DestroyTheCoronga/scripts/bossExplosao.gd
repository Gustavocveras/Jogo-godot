extends AnimatedSprite


func _ready():
	play("explosao")


func _on_bossExplosao_animation_finished():
	#get_tree().change_scene('res://scenes/win.tscn')
	pass
