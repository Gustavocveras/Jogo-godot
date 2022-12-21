extends Button

func _ready():
	pass 
	
func _on_exit_pressed():
	get_tree().quit()


func _on_exit_mouse_entered():
	get_node("fxSong").play()
