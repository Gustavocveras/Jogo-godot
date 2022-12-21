extends Node2D


func _ready():
	# verificar se um usuário já existe localmente
	if (Login.load_login() != null):
		# carrega os dados
		var user_data = Login.load_login()

		if (user_data ['id'] == 0):
			get_tree().change_scene("res://scenes/login.tscn")
			return

		# atribuir os dados para as variáveis globais
		Comunicacao.user_id = user_data['id']
		Comunicacao.user_user = user_data['user']

		# chamar o menu do jogo
		get_tree().change_scene("res://scenes/menu.tscn")
	else:
		# chama a tela de login
		get_tree().change_scene("res://scenes/login.tscn")
