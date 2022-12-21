extends CanvasLayer

func _ready():
	$ampulheta.play("idle")
	$MarginContainer/LabelScore.set_text(str(Comunicacao.virus))

func mudar_placar():
	$MarginContainer/LabelScore.set_text(str(Comunicacao.virus))
