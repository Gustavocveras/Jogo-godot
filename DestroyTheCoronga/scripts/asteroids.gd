extends Node2D

#variavel pra controlar o tempo
var timer
var tempo

#variavel para informar o tempo de duração do timer
var seconds :int = 60
var segundos :int = 60
var globulosCont:int
var pontosCont:int
var vida :int

#funcão que é executada quando a cena é carregada
func _ready():
	Comunicacao.virus -= Comunicacao.virus
	Comunicacao.globulo -= Comunicacao.globulo 
	$musica_fundo.play()
	get_node("AmpulhetaHUD").play()
	timer = Timer.new() #cria o timer
	timer.connect("timeout", self, "_on_timer_timeout") # controla o fim do timer
	timer.set_wait_time(1) # tempo de duração do timer = 1se
	timer.set_one_shot(false) # relogio contínuo
	add_child(timer) # adciona o objeto timer na árvore de processo
	timer.start() # iniciar o relógio
	
	tempo = Timer.new()
	tempo.connect("timeout", self, "_on_tempo_semtempo")
	tempo.set_wait_time(0.1)
	tempo.set_one_shot(false)
	add_child(tempo)
	tempo.start()
		
func _physics_process(delta):
	# mostra no contador o valor dos segundos
	# iteração do Timer
	get_node("contador").set_text(str(seconds) )
	# lógica para verificar quando o tempo terminar 
	if(seconds < 1):
		timer.stop() # para o tempo 
		get_tree().change_scene("res://scenes/menu.tscn")
		
	
#função para realizar algo quando o tempo terminar	
func _on_timer_timeout():	
	seconds -= 1
	if seconds == 0 and vida > 0:
		get_tree().change_scene("res://scenes/cutscene2pt1.tscn")
	globulosCont = Comunicacao.globulo
	get_node("contGlob").set_text(str(globulosCont) )
	pontosCont = Comunicacao.virus
	get_node("pontos").set_text(str(pontosCont))
	
func _on_tempo_semtempo():
	segundos -= 0.1
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






