extends Area2D

func _on_Fim_do_mapa_body_entered(body):
	get_node("/root/Level").queda = true
