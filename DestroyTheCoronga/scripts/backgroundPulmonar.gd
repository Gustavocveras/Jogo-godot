
extends KinematicBody2D


export(int) var speed = 150

var velocity = Vector2()
func _ready():
	velocity = Vector2()
	velocity.y += 1
	velocity = velocity.normalized() * speed
	
	return velocity

func _physics_process(delta):
	velocity = move_and_slide(velocity)

	var x = get_global_position().x
	var y = get_global_position().y
	var tela = get_viewport().get_visible_rect().size
	
	if x < 0:
		set_global_position(Vector2(tela.x, y))
	elif x > tela.x:
		set_global_position(Vector2(0, y))
		
	if y < 0:
		set_global_position(Vector2(x, tela.y))
	elif y > tela.y:
		set_global_position(Vector2(x, 0))	
