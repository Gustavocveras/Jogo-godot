extends Node2D

func _on_bt_novo_pressed():
	# criar o json para enviar para a APIpa
	var data_to_send = {
		"type":"new",
		"user":$user.text
	}
	
	#var data_to_send = {"type":"ranking_general"}
	# prepara o json para ser enviado
	var var_post = JSON.print(data_to_send)
	var header = ["Content-Type: application/json"]
	var url = "http://apijogao.atwebpages.com/api/user.php"
	var use_ssl = false
	$HTTPRequest.request(url, header, use_ssl, HTTPClient.METHOD_POST, var_post)
	
func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	# pega os dados retornados pela API
	var json = JSON.parse(body.get_string_from_utf8())
		
	if(json.result['data'] == 'err'):
		if(json.result['value'] == "Dados  invalidos"):
			$mensagem.set_text(json.result['value'])	
			return
		
		if(json.result['value'] == "Usuario  ja  existe"):
			$mensagem.set_text(json.result['value'])
			return
		
	Comunicacao.user_id = json.result['value']	
	Comunicacao.user_user = $user.text
	
		
	# grava os dados de login no arquivo local que vai ser usado quando carregar o jogo
	Login.save_login(json.result['value'], $user.text)

	$mensagem.set_text('Usuario   registrado')
	
func _on_bt_entrar_pressed():
	# criar o json para enviar para a APIpa
	var data_to_send = {
		"type":"login",
		"user":$user.text
	}
	
	#var data_to_send = {"type":"ranking_general"}
	# prepara o json para ser enviado
	var var_post = JSON.print(data_to_send)
	var header = ["Content-Type: application/json"]
	var url = "http://apijogao.atwebpages.com/api/user.php"
	var use_ssl = false
	$HTTPRequest2.request(url, header, use_ssl, HTTPClient.METHOD_POST, var_post)
	
func _on_HTTPRequest2_request_completed(result, response_code, headers, body):
	# pega os dados retornados pela API
	var json = JSON.parse(body.get_string_from_utf8())
		
	if(json.result['data'] == 'err'):
		if(json.result['value'] == "Dados  invalidos"):
			$mensagem.set_text(json.result['value'])
			return
		
		if(json.result['value'] == "Dados  invalidos"):
			$mensagem.set_text(json.result['value'])
			return	
			
	# se ocorreu tudo bem, então grava os dados na variável global
	Comunicacao.user_id = json.result['id']	
	Comunicacao.user_user = json.result['user']
	
	# grava os dados de login no arquivo local que vai ser usado quando carregar o jogo
	Login.save_login(json.result['id'], json.result['user'])

	# carrega o Menu do jogo
	get_tree().change_scene("res://scenes/menu.tscn")

func _on_help_mouse_entered():
	$mensagem_help.set_text('Informe  seu  Nick\n e  se  registre\n  antes  de  logar')
	
func _on_help_mouse_exited():
	$mensagem_help.set_text('')
