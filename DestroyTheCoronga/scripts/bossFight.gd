extends Node2D

var pre_boss = preload("res://scenes/transformacao.tscn")
var tempo
var tempo2
var segundos :int = 0
var vida:int
var change:int = 1
#boss especial
var ativado:int = 0
var funcionando:int = 0
var tentaculoLeft:int = 0
var bossVermelho:int = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	tempo = Timer.new()
	tempo.connect("timeout", self, "_on_tempo_semtempo")
	tempo.set_wait_time(0.1)
	tempo.set_one_shot(false)
	add_child(tempo)
	tempo.start()
	
	tempo2 = Timer.new()
	tempo2.connect("timeout", self, "_on_tempo_semtempo2")
	tempo2.set_wait_time(1)
	tempo2.set_one_shot(false)
	add_child(tempo2)
	tempo2.start()
	
	$ampulheta.play("idle")
	get_node("tentaculosL").hide()
	get_node("tentaculosR").hide()
#Label de quanto tempo esta levando para passar o boss
func _on_tempo_semtempo2():
	segundos +=1
	Comunicacao.virus -=5
	get_node("tempoAsc").set_text(str(segundos))
	
	
func _on_tempo_semtempo():
		
	get_node("score").set_text(str(Comunicacao.virus))
	vida = Comunicacao.vidao
	if vida == 5:
		get_node("Vida100").show()
	elif vida == 4:
		get_node("Vida100").hide()
		get_node("Vida80").show()
	elif vida == 3:
		get_node("Vida80").hide()
		get_node("Vida60").show()
	elif vida == 2:
		get_node("Vida60").hide()
		get_node("Vida40").show()
	elif vida == 1:
		get_node("Vida40").hide()
		get_node("Vida20").show()
	elif vida == 0:
		get_node("Vida20").hide()
		get_node("vida00").show()
	vida = Comunicacao.bossVida
	if vida <= 0 and change == 1:
		get_node("Boss").queue_free()
		get_node("tentaculosL").show()
		get_node("tentaculosR").show()
		change+=1
		var bossFim = pre_boss.instance()
		Comunicacao.virus += 10000
		bossFim.set_global_position(get_node("Boss").get_global_position())
		#bossFim.direcao = Vector2(sin(-get_rotation()), cos(get_rotation()))
		get_parent().add_child(bossFim)
	get_node("bossHpLabel").set_text(str(vida))
	
func _on_Timer2_timeout():
	pass # Replace with function body.

func _on_musica_fundo_finished():
	$musica_fundo.play()
