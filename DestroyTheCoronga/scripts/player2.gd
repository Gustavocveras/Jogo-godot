##
# Aprendendo a trabalhar com movimentação de objetos
# Este movimento é conhecido como: 8-way movement
##

# importa a classe para utilização
extends KinematicBody2D

# Salva a variável junto com o recurso que ela está ligada
# e a torna visível e modificável no editor.
export(int) var speed = 315
var animanave = 1
# O tipo vetor 2D contém as coordenadas x e y.
# Também pode ser acessado como uma matriz.
var velocity = Vector2()
# definição de uma função sem parâmetros
func get_input():
	# pega as coordenadas atuais
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		if animanave == 1:
			$Sprite.play("run")
		velocity.x += 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	

	return velocity

# função que realiza o processamento do comportamento físico da interface
func _physics_process(delta):
	get_input()
	# move_and_slide() desloca para a posição informada via teclado
	# e guarda a nova posição (x,y)
	velocity = move_and_slide(velocity)


func _on_Area2D_area_entered(area):
	speed = 200
		
func _on_Area2D_area_exited(area):
	speed = 315
	pass


func _on_Area2D2_area_entered(area):
	animanave = 0
	Comunicacao.vidao-=1
	speed = 180
	if animanave == 0 and Comunicacao.vidao > 0: 
		$Sprite.play("dano")

func _on_Area2D3_area_entered(area):
	animanave = 0
	Comunicacao.vidao-=1
	speed = 180
	if animanave == 0 and Comunicacao.vidao > 0: 
		$Sprite.play("dano")

func _on_Timer_timeout():
	animanave = 1

func _on_Area2D2_area_exited(area):
	speed = 315

func _on_Area2D3_area_exited(area):
	speed = 315
