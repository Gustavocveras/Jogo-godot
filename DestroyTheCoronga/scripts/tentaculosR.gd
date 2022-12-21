extends KinematicBody2D


var velocity = Vector2()
var tempo
var speed:int = 500
var tentaculoLeft = 0
var controle:int = 1
var lado:int = 1
func _ready():
	tempo = Timer.new()
	tempo.connect("timeout", self, "_on_tempo_semtempo")
	tempo.set_wait_time(0.1)
	tempo.set_one_shot(false)
	add_child(tempo)
	tempo.start()

func _on_tempo_semtempo():
	velocity = Vector2()
	if Comunicacao.rightTent == 1:
		speed = 400
		moving()
	
	
func moving():
	velocity = Vector2()
	if lado == 1:
		velocity.x -= 1
	else:
		velocity.x += 1
	velocity = velocity.normalized() * speed
	return velocity
	
	
func _physics_process(delta):
	velocity = move_and_slide(velocity)

func _on_Area2D_area_entered(area):
	if lado == 1:
		lado -=1
	else:
		lado += 1
		Comunicacao.rightTent = 2
	moving()
	
	
		
		
		
		
		
		
		
		
		
		
		
