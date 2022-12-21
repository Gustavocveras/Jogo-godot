extends KinematicBody2D



export(int) var speed = 130
var lado:int = 1
var hp:int
var velocity = Vector2()
var bossHp:int = 100
var volatil:int
var pre_tiroVirus = preload("res://scenes/tiroVirus.tscn")
var tempo

#coronguinhas
var pre_tiroES = preload("res://scenes/OlhoESTiro.tscn")
var coronguinha0:int = 15
var coronguinha1:int = 15
var coronguinha2:int = 15
var coronguinha3:int = 15
var coronguinha4:int = 15
var coronguinha5:int = 15
var coronguinha6:int = 15
var coronguinha7:int = 15
var coronguinha8:int = 15
var coronguinha9:int = 15
var coronguinha10:int = 15
var tempoc
# Called when the node enters the scene tree for the first time.
func _ready():
	$bossSprite.play("idle")
	moving()
	volatil = Comunicacao.globulo
	bossHp += (volatil * 5)
	Comunicacao.bossVida = bossHp
	
	tempo = Timer.new()
	tempo.connect("timeout", self, "_on_tempo_semtempo")
	tempo.set_wait_time(1.5)
	tempo.set_one_shot(false)
	add_child(tempo)
	tempo.start()
	
	#coronguinhas 
	tempoc = Timer.new()
	tempoc.connect("timeout", self, "_on_tempo_semtempoc")
	tempoc.set_wait_time(1)
	tempoc.set_one_shot(false)
	add_child(tempoc)
	tempoc.start()
	

func _on_tempo_semtempo():	
	var tiroVirus = pre_tiroVirus.instance()
	tiroVirus.set_global_position(get_node("tiroVirus").get_global_position())
	tiroVirus.direcao = Vector2(sin(-get_rotation()), cos(get_rotation()))
	get_parent().add_child(tiroVirus)

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


func _on_hitBox_area_entered(area):
	Comunicacao.calcVida()
	
func change():
	pass

#CORONGUINHAS 10, 1, 3, 5, 9

func _on_tempo_semtempoc():
	var tiroEs10 = pre_tiroES.instance()
	if coronguinha10 >0:
		tiroEs10.set_global_position(get_node("Coronguinhas/Coronguinha10").get_global_position())
		tiroEs10.direcao = Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(tiroEs10)
	var tiroEs1 = pre_tiroES.instance()
	if coronguinha1 >0:
		tiroEs1.set_global_position(get_node("Coronguinhas/Coronguinha1").get_global_position())
		tiroEs1.direcao = Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(tiroEs1)
	var tiroEs3 = pre_tiroES.instance()
	if coronguinha3 >0:
		tiroEs3.set_global_position(get_node("Coronguinhas/Coronguinha3").get_global_position())
		tiroEs3.direcao = Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(tiroEs3)
	var tiroEs5 = pre_tiroES.instance()
	if coronguinha5 >0:
		tiroEs5.set_global_position(get_node("Coronguinhas/Coronguinha5").get_global_position())
		tiroEs5.direcao = Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(tiroEs5)
	var tiroEs9 = pre_tiroES.instance()
	if coronguinha9 >0:
		tiroEs9.set_global_position(get_node("Coronguinhas/Coronguinha9").get_global_position())
		tiroEs9.direcao = Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(tiroEs9)	
		
func _on_Coronguinha0_area_entered(area):
	coronguinha0 -= 1
	if coronguinha0 <= 0:
		get_node("Coronguinhas/Coronguinha0").queue_free()
		Comunicacao.virus+=150


func _on_Coronguinha1_area_entered(area):
	coronguinha1 -= 1
	if coronguinha1 <= 0:
		get_node("Coronguinhas/Coronguinha1").queue_free()
		Comunicacao.virus+=150


func _on_Coronguinha2_area_entered(area):
	coronguinha2 -= 1
	if coronguinha2 <= 0:
		get_node("Coronguinhas/Coronguinha2").queue_free()
		Comunicacao.virus+=150


func _on_Coronguinha3_area_entered(area):
	coronguinha3 -= 1
	if coronguinha3 <= 0:
		get_node("Coronguinhas/Coronguinha3").queue_free()
		Comunicacao.virus+=150


func _on_Coronguinha4_area_entered(area):
	coronguinha4 -= 1
	if coronguinha4 <= 0:
		get_node("Coronguinhas/Coronguinha4").queue_free()
		Comunicacao.virus+=150


func _on_Coronguinha5_area_entered(area):
	coronguinha5 -= 1
	if coronguinha5 <= 0:
		get_node("Coronguinhas/Coronguinha5").queue_free()
		Comunicacao.virus+=150


func _on_Coronguinha6_area_entered(area):
	coronguinha6 -= 1
	if coronguinha6 <= 0:
		get_node("Coronguinhas/Coronguinha6").queue_free()
		Comunicacao.virus+=150


func _on_Coronguinha7_area_entered(area):
	coronguinha7 -= 1
	if coronguinha7 <= 0:
		get_node("Coronguinhas/Coronguinha7").queue_free()
		Comunicacao.virus+=150


func _on_Coronguinha8_area_entered(area):
	coronguinha8 -= 1
	if coronguinha8 <= 0:
		get_node("Coronguinhas/Coronguinha8").queue_free()
		Comunicacao.virus+=150


func _on_Coronguinha9_area_entered(area):
	coronguinha9 -= 1
	if coronguinha9 <= 0:
		get_node("Coronguinhas/Coronguinha9").queue_free()
		Comunicacao.virus+=150


func _on_Coronguinha10_area_entered(area):
	coronguinha10 -= 1
	if coronguinha10 <= 0:
		get_node("Coronguinhas/Coronguinha10").queue_free()
		Comunicacao.virus+=150
