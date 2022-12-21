extends AnimatedSprite

func _ready():
	play("cutscene2pt2")

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		_on_cutscene2pt2_animation_finished()
		
func _on_cutscene2pt2_animation_finished():
	get_tree().change_scene("res://scenes/bossFight.tscn")
