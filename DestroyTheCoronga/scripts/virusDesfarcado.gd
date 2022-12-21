extends KinematicBody2D
var vel = Vector2()
var rot_speed
var virus:int

func _ready():
	add_to_group(game.GRUPO_INIMIGO)
	#acrescenta aleatoriedade na movimentação do objeto
	randomize()
	set_process(true)
	vel = Vector2(rand_range(50, 150), 0).rotated(rand_range(0, 2*PI))
	rot_speed = rand_range(-1.5, 1.5)
	
func _process(delta):
	set_rotation(get_rotation() + rot_speed * delta)
	move_and_collide(vel * delta)
	
	#metodo wrap
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

#define tempo do globulo branco na tela
func _on_Timer_timeout():
	queue_free()

#destroi globulo branco
func _on_Area2D_area_entered(area):
	virus = 100
	Comunicacao.virusMorto(virus)
	queue_free()
