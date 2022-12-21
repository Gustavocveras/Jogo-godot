extends StaticBody2D

func _ready():
	pass

func _on_lixeira_area_entered(area):
	queue_free()
