extends Node2D


	#variavel pra controlar o tempo
var timer

#variavel para informar o tempo de duração do timer
var seconds :int = 42

func _ready():
	$AnimatedSprite.play("cutscene")
	
#funcão que é executada quando a cena é carregada
	timer = Timer.new() #cria o timer
	timer.connect("timeout", self, "_on_timer_timeout") # controla o fim do timer
	timer.set_wait_time(1) # tempo de duração do timer = 1se
	timer.set_one_shot(false) # relogio contínuo
	add_child(timer) # adciona o objeto timer na árvore de processo
	timer.start() # iniciar o relógio
	
func _physics_process(delta):
	# lógica para verificar quando o tempo terminar 
	if(seconds < 1):
		timer.stop() # para o tempo 
		get_tree().change_scene("res://scenes/asteroids.tscn")
	#pula cutscene	
	if Input.is_action_just_pressed("ui_focus_next"):
		seconds = 0
	
#função para realizar algo quando o tempo terminar	
func _on_timer_timeout():	
	seconds -= 1
	print(seconds)
			

