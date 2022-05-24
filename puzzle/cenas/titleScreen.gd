extends Control

func _ready():
	$musica.play()

func _on_iniciar_pressed():
	get_tree().change_scene("res://cenas/fase1.tscn")


func _on_sair_pressed():
	get_tree().quit()
