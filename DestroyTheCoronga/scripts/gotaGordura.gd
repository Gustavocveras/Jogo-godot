
extends KinematicBody2D


export(int) var speed = 250

var velocity = Vector2()
func _ready():
	velocity = Vector2()
	velocity.y += 1
	velocity = velocity.normalized() * speed
	return velocity

func _physics_process(delta):
	velocity = move_and_slide(velocity)

