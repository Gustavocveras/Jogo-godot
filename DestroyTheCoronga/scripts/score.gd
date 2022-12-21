extends Button

func _ready():
	pass 



func _on_score_mouse_entered():
	get_node("fxSong").play()
