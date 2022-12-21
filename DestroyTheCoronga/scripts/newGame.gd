extends Button

func _ready():
	pass

func _on_newGame_pressed():
	# monta o json para enviar para a API e criar um novo jogo
	var data_to_send = {
		"type":"new",
		"user_id":Comunicacao.user_id
	}

	var var_post = JSON.print(data_to_send)
	var header = ["Content-Type: application/json"]
	var url = "http://apijogao.atwebpages.com/api/game.php"
	var use_ssl = false
	$HTTPRequest.request(url, header, use_ssl, HTTPClient.METHOD_POST, var_post)
	
# recebe a requisição enviada
func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	# pega os dados retornados pela API
	var json = JSON.parse(body.get_string_from_utf8())

	if(json.result["data"] == "game_created"):
		# salva o ID do game criado na variável Global
		Comunicacao.game_id = json.result['value']
		get_tree().change_scene("res://scenes/cutscene1.tscn")
		
	


func _on_newGame_mouse_entered():
	get_node("fxSong").play()
