
extends KinematicBody2D


export(int) var speed = 377

var velocity = Vector2()
func _ready(): 
	get_node("sprite").play()
	velocity = Vector2()
	velocity.x += 1
	velocity = velocity.normalized() * speed

	return velocity
	

func _physics_process(delta):
	velocity = move_and_slide(velocity)


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
