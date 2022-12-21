
extends KinematicBody2D


export(int) var speed = 300

var velocity = Vector2()
func _ready():
	velocity = Vector2()
	velocity.x += 1
	velocity = velocity.normalized() * speed

	return velocity
	

func _physics_process(delta):
	velocity = move_and_slide(velocity)


func _on_Area2D2_area_entered(area):
	get_tree().change_scene("res://scenes/GameOver.tscn")


func _on_lixeira_area_entered(area):
	pass
