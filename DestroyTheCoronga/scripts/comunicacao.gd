extends Node

# API
var user_id	# guarda o ID do usuário
var user_user # guarda o usuário
var game_id # ID do Game criado
var game_score :int # Score do jogo somando todas as fases

# geral
var globulo:int
var virus:int
var vidao:int = 5
var setor:int
var bossVida:int
var texto
var globulonaro:int
var antcheat:int = 1
# boss especial
var funcionando:int = 0
var leftTent:int
var rightTent:int
func especialLadoEscolha():
	var rdn:int
	randomize()
	rdn = rand_range(1, 4)
	if rdn == 3:
		leftTent = 1
	
	if rdn == 2:
		rightTent = 1
		
	
#fim boss especial
func calcVida():
	bossVida-= 1
	
	if(bossVida == 0 and antcheat == 2):
		queue_free()
		virus+= 100000
		get_tree().change_scene('res://scenes/win.tscn')
	if(bossVida == 0):
		antcheat += 1
		
func globuloMorto(globuloUm):
	globulo += globuloUm
	
func virusMorto(virusUm):
	virus += virusUm
	
func trocaVida(vida):
	vidao = vida
	
func escolhendoSetor(setorial):
	setor = setorial
	globulonaroText()
	
func globulonaroText():
	var num:int 
	randomize()	
	if setor == 1:
		num = rand_range(1, 4)
		print(num)
		if num == 1:
			globulonaro = 1
		elif num == 2:
			globulonaro = 2
		elif num == 3:
			globulonaro = 3
	elif setor == 2:
		num = rand_range(1, 4)
		print(num)
		if num == 1:
			globulonaro = 4
		elif num == 2:
			globulonaro = 5
		elif num == 3:
			globulonaro = 6
	elif setor == 3:
		num = rand_range(1, 4)
		print(num)
		if num == 1:
			globulonaro = 7
		elif num == 2:
			globulonaro = 8
		elif num == 3:
			globulonaro = 9
	elif setor == 4:
		num = rand_range(1, 4)
		print(num)
		if num == 1:
			globulonaro = 10
		elif num == 2:
			globulonaro = 11
		elif num == 3:
			globulonaro = 12
	elif setor == 5:
		num = rand_range(1, 4)
		print(num)
		if num == 1:
			globulonaro = 13
		elif num == 2:
			globulonaro = 14
		elif num == 3:
			globulonaro = 15
	
