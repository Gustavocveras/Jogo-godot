extends KinematicBody2D


export(int) var speed = 120
var pontos:int
var velocity = Vector2()
var rot_speed

func _ready():
	randomize()
	velocity = Vector2().rotated(rand_range(0, 2*PI))
	rot_speed = rand_range(-1.5, 1.5)
	velocity.x -= 1
	velocity = velocity.normalized() * speed

	return velocity
	

func _physics_process(delta):
	velocity = move_and_slide(velocity)
	set_rotation(get_rotation() + rot_speed * delta)


func _on_Area2D_area_entered(area):
	pontos = 100
	Comunicacao.virusMorto(pontos)
	queue_free()
	pass # Replace with function body.


func _on_Area2D2_area_entered(area):
	queue_free()
