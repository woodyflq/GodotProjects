extends Node2D

var array = [1, 2, 3, 4]

var random_piece1
var random_piece2
var random_piece3
var random_piece4

var dirCima = false
var dirBaixo = false
var esqBaixo = false
var esqCima = false

var cu = false
var canChangeLevel = false
var canPlay = false
var teste = -1


func _ready():
	var arrayList = shuffleList(array)
	arrayList.shuffle()
	random_piece1 = arrayList[0]
	random_piece2 = arrayList[1]
	random_piece3 = arrayList[2]
	random_piece4 = arrayList[3]
	
	if random_piece1 == 1:
		$ElefDirCima.position = $Position2D.position
	elif random_piece1 == 2:
		$ElefDirCima.position = $Position2D2.position
	elif random_piece1 == 3:
		$ElefDirCima.position = $Position2D3.position
	elif random_piece1 == 4:
		$ElefDirCima.position = $Position2D4.position

	if random_piece2 == 1:
		$ElefDirBaixo.position = $Position2D.position
	elif random_piece2 == 2:
		$ElefDirBaixo.position = $Position2D2.position
	elif random_piece2 == 3:
		$ElefDirBaixo.position = $Position2D3.position
	elif random_piece2 == 4:
		$ElefDirBaixo.position = $Position2D4.position

	if random_piece3 == 1:
		$ElefEsqBaixo.position = $Position2D.position
	elif random_piece3 == 2:
		$ElefEsqBaixo.position = $Position2D2.position
	elif random_piece3 == 3:
		$ElefEsqBaixo.position = $Position2D3.position
	elif random_piece3 == 4:
		$ElefEsqBaixo.position = $Position2D4.position

	if random_piece4 == 1:
		$ElefEsqCima.position = $Position2D.position
	elif random_piece4 == 2:
		$ElefEsqCima.position = $Position2D2.position
	elif random_piece4 == 3:
		$ElefEsqCima.position = $Position2D3.position
	elif random_piece4 == 4:
		$ElefEsqCima.position = $Position2D4.position

	$musica.play()


func shuffleList(list):
	var shuffledList = []
	var indexList = range(list.size())
	for i in range(list.size()):
		randomize()
		var x = randi()%indexList.size()
		shuffledList.append(list[x])
		indexList.remove(x)
		list.remove(x)
	return shuffledList



func _process(delta):
	print(teste)
	teste -= 10
	
	if dirCima == true:
		$ElefDirCima.position.x = 608
		$ElefDirCima.position.y = 199
	if dirBaixo == true:
		$ElefDirBaixo.position.x = 608
		$ElefDirBaixo.position.y = 387
	if esqBaixo == true:
		$ElefEsqBaixo.position.x = 420
		$ElefEsqBaixo.position.y = 387
	if esqCima == true:
		$ElefEsqCima.position.x = 420
		$ElefEsqCima.position.y = 199
	
	if dirCima and dirBaixo and esqCima and esqBaixo == true and canPlay == false:
#		$musica.stop()
		teste = 100
		canPlay = true
	if canPlay == true and teste == 0:
		$kidsYeah.play()
		canChangeLevel = true
		if cu == false:
			teste = 3000
			cu = true
	if canChangeLevel == true and teste == 0:
		get_tree().change_scene("res://cenas/fase2.tscn")

#func _on_tempo_timeout():
#	get_tree().change_scene("res://cenas/fase2.tscn")
#	print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")



func _on_ConfirmDirCima_area_entered(area):
	if area.is_in_group("ElefDirCima"):
		$click.play()
		dirCima = true


func _on_ConfirmDirBaixo_area_entered(area):
	if area.is_in_group("ElefDirBaixo"):
		dirBaixo = true
		$click.play()

func _on_ConfirmEsqBaixo_area_entered(area):
	if area.is_in_group("ElefEsqBaixo"):
		esqBaixo = true
		$click.play()

func _on_ConfirmEsqCima_area_entered(area):
	if area.is_in_group("ElefEsqCima"):
		esqCima = true
		$click.play()

