extends KinematicBody2D

func _ready():
	$Sprite.play("explosao")
	pass
func _on_Timer_timeout():
	queue_free()
