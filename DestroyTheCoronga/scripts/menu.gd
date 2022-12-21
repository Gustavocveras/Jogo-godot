extends Node2D

func _ready():
	get_node("musica").play()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 8)

func _on_ranking_geral_pressed():
	# carrega o Ranking Geral
	get_tree().change_scene("res://scenes/placar_geral.tscn")


func _on_ranking_usuario_pressed():
	# carrega o Ranking Geral
	get_tree().change_scene("res://scenes/placar_usuario.tscn")


func _on_logout_pressed():
	Login.logout()
	get_tree().change_scene("res://scenes/login.tscn")


func _on_help_pressed():
	get_tree().change_scene("res://scenes/help.tscn")


func _on_musica_finished():
	get_node("musica").play()
