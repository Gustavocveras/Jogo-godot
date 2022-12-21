extends Sprite

func _ready():
	pass # Replace with function body.
	
	if get_node("Timer") < "0":
		get_tree().change_scene("res://scenes/menu.tscn")

