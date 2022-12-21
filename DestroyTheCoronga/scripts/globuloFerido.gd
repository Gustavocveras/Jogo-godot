extends KinematicBody2D


export(int) var speed = 250
var pontos:int
var rot_speed
var velocity = Vector2()
func _ready():
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


func _on_lixeira_area_entered(area):
	queue_free()
