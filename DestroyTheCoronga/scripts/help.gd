extends Node2D

func _ready():
	pass # Replace with function body.


func _on_Button1_pressed():
	get_tree().change_scene("res://scenes/help_fase1.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://scenes/help_fase2.tscn")


func _on_Button3_pressed():
	get_tree().change_scene("res://scenes/help_fase3.tscn")


func _on_Button4_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")
