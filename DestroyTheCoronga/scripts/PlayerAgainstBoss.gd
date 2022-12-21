extends KinematicBody2D

var vida :int
var velocity = Vector2()
export(int) var velocidade = 376
var pre_tiro = preload("res://scenes/tiro.tscn")

func _ready():
	$Sprite.play("run")
	vida = Comunicacao.vidao
	pass
	
func get_input():
	# pega as coordenadas atuais
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		
	velocity = velocity.normalized() * velocidade
	return velocity
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("dispararE"):
		$tiro.play()
		var tiro = pre_tiro.instance()
		tiro.set_global_position(get_node("torretaEsquerda").get_global_position())
		tiro.direcao -= Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(tiro)
		pass
		
	if Input.is_action_just_pressed("dispararD"):
		$tiro.play()
		var tiro = pre_tiro.instance()
		tiro.set_global_position(get_node("torretaDireita").get_global_position())
		tiro.direcao -= Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(tiro)
		pass

func _on_hitBox_area_entered(area):
	if vida >= 1:
		$Sprite.play("dano")
		vida -= 1
		Comunicacao.trocaVida(vida)
		if vida == 0:
			velocidade = 0
			$Sprite.play("explode")

func _on_Timer_timeout():
	if vida > 0:
		$Sprite.play("run")

func _on_Timer2_timeout():
	if vida <= 0:
		get_tree().change_scene("res://scenes/GameOver.tscn")


func _on_especialTomado_area_entered(area):
	_on_hitBox_area_entered(area)
