extends Node2D

func _ready():	
	$cutscene2pt1.play("cutscene2pt1")
	
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		_on_cutscene2pt1_animation_finished()
		
func _on_cutscene2pt1_animation_finished():
	get_tree().change_scene("res://scenes/runner.tscn")


func _on_Timer_timeout():
	pass # Replace with function body.
