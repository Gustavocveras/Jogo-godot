extends Node2D

func _ready():
	var data_to_send = {
			"type":"save",
			"game_id":Comunicacao.game_id,
			"score":Comunicacao.virus
			}		
			
	var var_post = JSON.print(data_to_send)
	var header = ["Content-Type: application/json"]
	var url = "http://apijogao.atwebpages.com/api/game.php"
	var use_ssl = false
	$HTTPRequest.request(url, header, use_ssl, HTTPClient.METHOD_POST, var_post)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	#alert(Global.user_name + ", " + "você morreu\n\nO 'score' do jogo foi salvo via API", "Aviso")
	#alert(Global.user_name + " você morreu/ganhou.", json.result['value'])
	
func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/menu.tscn")



