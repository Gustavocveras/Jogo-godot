extends Node2D


var tempo
var segundos :int = 122
var textones
var setor:int 
var segundosDois :int = 60
var tempoDois
var hlc:int = 1
func _ready():
	$musica_runner.play()
	tempo = Timer.new()
	tempo.connect("timeout", self, "_on_tempo_semtempo")
	tempo.set_wait_time(1)
	tempo.set_one_shot(false)
	add_child(tempo)
	tempo.start()
	
	tempoDois = Timer.new()
	tempoDois.connect("timeout", self, "_on_tempo_semtempoDois")
	tempoDois.set_wait_time(0.1)
	tempoDois.set_one_shot(false)
	add_child(tempoDois)
	tempoDois.start()

func _on_tempo_semtempo():
	segundos -= 1
	get_node("HUD/MarginContainer/LabelTimer").set_text(str(segundos))
	if segundos == 120:
		setor = 1
		Comunicacao.escolhendoSetor(setor)
		if Comunicacao.globulonaro == 1:
			get_node("HUD/DBGlobulonaroFrase1").show()
		elif Comunicacao.globulonaro == 2:
			get_node("HUD/DBGlobulonaroFrase2").show()
		elif Comunicacao.globulonaro == 3:
			get_node("HUD/DBGlobulonaroFrase3").show()
		
	elif segundos == 115:
		if Comunicacao.globulonaro == 1:
			get_node("HUD/DBGlobulonaroFrase1").hide()
		elif Comunicacao.globulonaro == 2:
			get_node("HUD/DBGlobulonaroFrase2").hide()
		elif Comunicacao.globulonaro == 3:
			get_node("HUD/DBGlobulonaroFrase3").hide()
	elif segundos == 96:
		setor = 2
		Comunicacao.escolhendoSetor(setor)
		if Comunicacao.globulonaro == 4:
			get_node("HUD/DBGlobulonaroFrase4").show()
		elif Comunicacao.globulonaro == 5:
			get_node("HUD/DBGlobulonaroFrase5").show()
		elif Comunicacao.globulonaro == 6:
			get_node("HUD/DBGlobulonaroFrase6").show()
	elif segundos == 91:
		if Comunicacao.globulonaro == 4:
			get_node("HUD/DBGlobulonaroFrase4").hide()
		elif Comunicacao.globulonaro == 5:
			get_node("HUD/DBGlobulonaroFrase5").hide()
		elif Comunicacao.globulonaro == 6:
			get_node("HUD/DBGlobulonaroFrase6").hide()
	elif segundos == 72:
		setor = 3
		Comunicacao.escolhendoSetor(setor)
		if Comunicacao.globulonaro == 7:
			get_node("HUD/DBGlobulonaroFrase7").show()
		elif Comunicacao.globulonaro == 8:
			get_node("HUD/DBGlobulonaroFrase8").show()
		elif Comunicacao.globulonaro == 9:
			get_node("HUD/DBGlobulonaroFrase9").show()
	elif segundos == 67:
		if Comunicacao.globulonaro == 7:
			get_node("HUD/DBGlobulonaroFrase7").hide()
		elif Comunicacao.globulonaro == 8:
			get_node("HUD/DBGlobulonaroFrase8").hide()
		elif Comunicacao.globulonaro == 9:
			get_node("HUD/DBGlobulonaroFrase9").hide()
	elif segundos == 48:
		setor = 4
		Comunicacao.escolhendoSetor(setor)
		if Comunicacao.globulonaro == 10:
			get_node("HUD/DBGlobulonaroFrase10").show()
		elif Comunicacao.globulonaro == 11:
			get_node("HUD/DBGlobulonaroFrase11").show()
		elif Comunicacao.globulonaro == 12:
			get_node("HUD/DBGlobulonaroFrase12").show()
	elif segundos == 43:
		if Comunicacao.globulonaro == 10:
			get_node("HUD/DBGlobulonaroFrase10").hide()
		elif Comunicacao.globulonaro == 11:
			get_node("HUD/DBGlobulonaroFrase11").hide()
		elif Comunicacao.globulonaro == 12:
			get_node("HUD/DBGlobulonaroFrase12").hide()
	elif segundos == 24:
		setor = 5
		Comunicacao.escolhendoSetor(setor)
		if Comunicacao.globulonaro == 13:
			get_node("HUD/DBGlobulonaroFrase13").show()
		elif Comunicacao.globulonaro == 14:
			get_node("HUD/DBGlobulonaroFrase14").show()
		elif Comunicacao.globulonaro == 15:
			get_node("HUD/DBGlobulonaroFrase15").show()
	elif segundos == 19:
		if Comunicacao.globulonaro == 13:
			get_node("HUD/DBGlobulonaroFrase13").hide()
		elif Comunicacao.globulonaro == 14:
			get_node("HUD/DBGlobulonaroFrase14").hide()
		elif Comunicacao.globulonaro == 15:
			get_node("HUD/DBGlobulonaroFrase15").hide()
	elif segundos == 0 and Comunicacao.vidao > 0:
		get_tree().change_scene("res://scenes/cutscene3.tscn")
	
func _on_tempo_semtempoDois():
	segundosDois -= 0.1
	get_node("HUD/MarginContainer/LabelScore").set_text(str(Comunicacao.virus))
	var vida:int
	vida = Comunicacao.vidao
	if vida == 5:
		get_node("HUD/vida100").show()
	elif vida == 4:
		if hlc == 1:
			get_node("HUD/vida100").hide()
			hlc = 2
		get_node("HUD/vida80").show()
	elif vida == 3:
		if hlc == 2:
			get_node("HUD/vida80").hide()
			hlc = 3
		get_node("HUD/vida60").show()
	elif vida == 2:
		if hlc == 3:
			get_node("HUD/vida60").hide()
			hlc = 4
		get_node("HUD/vida40").show()
	elif vida == 1:
		if hlc == 4:
			get_node("HUD/vida40").hide()
			hlc = 5
		get_node("HUD/vida20").show()
	elif vida == 0:
		if hlc == 5:
			get_node("HUD/vida20").hide()
			hlc = 6
		get_node("HUD/vida00").show()
		get_tree().change_scene("res://scenes/GameOver.tscn")	

func _on_Area2D3_area_entered(area):
	pass # Replace with function body.
