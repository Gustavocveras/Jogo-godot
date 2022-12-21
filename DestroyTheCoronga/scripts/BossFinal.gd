extends KinematicBody2D


export(int) var speed = 150
var lado:int = 1
var hp:int
var velocity = Vector2()
var bossHp:int = 100
var volatil:int
var olhoDS:int = 30
var olhoES:int = 30
var olhoCI:int = 30
var imunidade:int
var tempo
var tempo2
var tempo3
var segundos:int = 10
var pre_tiroCI = preload("res://scenes/olhoCiTiro.tscn")
var pre_tiroDS = preload("res://scenes/OlhoDsTiro.tscn")
var pre_tiroES = preload("res://scenes/OlhoESTiro.tscn")
var pre_explosao = preload("res://scenes/explosao.tscn")
var pre_cloroTiro = preload("res://scenes/cloroTiro.tscn")
var ciFim:int = 1
var dsFim:int = 1
var esFim:int = 1

 
func _ready():
	$OlhoDS/Sprite.play("idle")
	$OlhoCI/Sprite.play("idle")
	$OlhoES/Sprite.play("idle")
	$Sprite.play("idle")
	moving()
	volatil = Comunicacao.globulo
	bossHp += (volatil * 5)
	Comunicacao.bossVida = bossHp
	print(Comunicacao.bossVida)

	tempo = Timer.new()
	tempo.connect("timeout", self, "_on_tempo_semtempo")
	tempo.set_wait_time(2)
	tempo.set_one_shot(false)
	add_child(tempo)
	tempo.start()
	
	tempo2 = Timer.new() 
	tempo2.connect("timeout", self, "_on_tempo_semtempo2")
	tempo2.set_wait_time(0.5)
	tempo2.set_one_shot(false)
	add_child(tempo2)
	tempo2.start()
	
	tempo3 = Timer.new() 
	tempo3.connect("timeout", self, "_on_tempo_semtempo3")
	tempo3.set_wait_time(1.5)
	tempo3.set_one_shot(false)
	add_child(tempo3)
	tempo3.start()
	
	
func _on_tempo_semtempo():
	if ciFim == 1:
		var tiroCi = pre_tiroCI.instance()
		tiroCi.set_global_position(get_node("OlhoCI/CiTiro").get_global_position())
		tiroCi.direcao = Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(tiroCi)
		pass
func _on_tempo_semtempo2():		
	if dsFim == 1:
		var tiroDs = pre_tiroDS.instance()
		tiroDs.set_global_position(get_node("OlhoDS/DsTiro").get_global_position())
		tiroDs.direcao = Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(tiroDs)
		pass
	if esFim == 1:
		var tiroEs = pre_tiroES.instance()
		tiroEs.set_global_position(get_node("OlhoES/EsTiro").get_global_position())
		tiroEs.direcao = Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(tiroEs)
		pass
		
func _on_tempo_semtempo3():
	if imunidade == 3:
		var cloroTiro = pre_cloroTiro.instance()
		cloroTiro.set_global_position(get_node("boca").get_global_position())
		cloroTiro.direcao = Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(cloroTiro)
		pass

func _physics_process(delta):
	velocity = move_and_slide(velocity)	
func moving():
	velocity = Vector2()
	if lado == 1:
		velocity.x -= 1
	else:
		velocity.x += 1
	velocity = velocity.normalized() * speed
	return velocity
	

func _on_Area2D_area_entered(area):
	if lado == 1:
		lado -=1
	else:
		lado += 1
	moving()

func _on_OlhoES_area_entered(area):
	olhoES-=1
	print(olhoES)
	if olhoES <=0:
		get_node("OlhoES").queue_free()
		esFim += 1
		speed += 50
		Comunicacao.virus+=666
		moving()
		imunidade+=1
		var explosao = pre_explosao.instance()
		explosao.set_global_position(get_node("OlhoES").get_global_position())
		get_parent().add_child(explosao)
		

func _on_OlhoDS_area_entered(area):
	olhoDS-=1
	print(olhoDS)
	if olhoDS <=0:
		get_node("OlhoDS").queue_free()
		dsFim += 1
		speed += 50
		Comunicacao.virus+=666
		moving()
		imunidade+=1
		var explosao = pre_explosao.instance()
		explosao.set_global_position(get_node("OlhoDS").get_global_position())
		get_parent().add_child(explosao)

func _on_OlhoCI_area_entered(area):
	olhoCI-=1
	print(olhoCI)
	if olhoCI <=0:
		$Sprite.play("explode")
		ciFim += 1
		speed += 50
		Comunicacao.virus+=666
		get_node("OlhoCI").queue_free()
		moving()
		imunidade+=1
		var explosao = pre_explosao.instance()
		explosao.set_global_position(get_node("OlhoCI").get_global_position())
		get_parent().add_child(explosao)


func _on_corpoPrincipal_area_entered(area):
	if imunidade == 3:
		Comunicacao.calcVida()


func _on_ativadorEspecial_area_entered(area):
	if imunidade == 3:
		Comunicacao.funcionando
		Comunicacao.especialLadoEscolha()
