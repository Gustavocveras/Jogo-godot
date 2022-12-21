extends KinematicBody2D

var giro_vel = 150
var direcao = Vector2()
var vel = 10
var pre_tiro = preload("res://scenes/tiro.tscn")
var vida = 6
var animanave :int
 
func _ready():
	animanave = 1
	$naveSprite.play("idle")
func _process(delta):
	#movimentação
	var giro = 0
	
	if Input.is_action_pressed("ui_right"):
		giro += 1
		
	if Input.is_action_pressed("ui_left"):
		giro -= 1
		
	if Input.is_action_pressed("ui_up"):
		if animanave == 1:
			$naveSprite.play("run")
		direcao -= Vector2(sin(-get_rotation()), cos(get_rotation())) * delta * vel
		
	rotate (deg2rad(giro_vel) * delta * giro)	
	
	translate (direcao * delta * vel)
	
	#wrap
	var x = get_global_position().x
	var y = get_global_position().y
	var tela = get_viewport().get_visible_rect().size
	
	if x < 0:
		vida+=1
		set_global_position(Vector2(tela.x, y))
	elif x > tela.x:
		vida+=1
		set_global_position(Vector2(0, y))
		
		
	if y < 0:
		vida+=1
		set_global_position(Vector2(x, tela.y))
	elif y > tela.y:
		vida+=1
		set_global_position(Vector2(x, 0))			
	
			
	#atirar
	if Input.is_action_just_pressed("dispararE"):
		get_node("tiro").play()
		var tiro = pre_tiro.instance()
		tiro.set_global_position(get_node("torretaE").get_global_position())
		tiro.direcao -= Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(tiro)
		pass
		
	if Input.is_action_just_pressed("dispararD"):
		$tiro.play()
		var tiro = pre_tiro.instance()
		tiro.set_global_position(get_node("torretaD").get_global_position())
		tiro.direcao -= Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(tiro)
		pass
	


func _on_Area2D_body_entered(body):
	animanave = 0
	if vida >= 1 and vida < 6:
		$naveSprite.play("dano")
	vida -= 1
	Comunicacao.trocaVida(vida)
	print(vida)
	if vida == 0:
		animanave = 0
		vel = 0
		giro_vel = 0
		$naveSprite.play("explode")
		
func _on_Timer_timeout():
	if vida > 0:
		animanave = 1
		$naveSprite.play("idle")

func _on_Timer2_timeout():
	if vida <= 0:
		get_tree().change_scene("res://scenes/GameOver.tscn")
