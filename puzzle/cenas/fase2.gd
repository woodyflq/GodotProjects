extends Node2D

var array = [1, 2, 3, 4]

var random_piece1
var random_piece2
var random_piece3
var random_piece4

var esqCima = false
var dirCima = false
var dirBaixo = false
var esqBaixo = false


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
		$LeaoEsqCima.position = $Position2D.position
	elif random_piece1 == 2:
		$LeaoEsqCima.position = $Position2D2.position
	elif random_piece1 == 3:
		$LeaoEsqCima.position = $Position2D3.position
	elif random_piece1 == 4:
		$LeaoEsqCima.position = $Position2D4.position

	if random_piece2 == 1:
		$LeaoDirCima.position = $Position2D.position
	elif random_piece2 == 2:
		$LeaoDirCima.position = $Position2D2.position
	elif random_piece2 == 3:
		$LeaoDirCima.position = $Position2D3.position
	elif random_piece2 == 4:
		$LeaoDirCima.position = $Position2D4.position

	if random_piece3 == 1:
		$LeaoDirBaixo.position = $Position2D.position
	elif random_piece3 == 2:
		$LeaoDirBaixo.position = $Position2D2.position
	elif random_piece3 == 3:
		$LeaoDirBaixo.position = $Position2D3.position
	elif random_piece3 == 4:
		$LeaoDirBaixo.position = $Position2D4.position

	if random_piece4 == 1:
		$LeaoEsqBaixo.position = $Position2D.position
	elif random_piece4 == 2:
		$LeaoEsqBaixo.position = $Position2D2.position
	elif random_piece4 == 3:
		$LeaoEsqBaixo.position = $Position2D3.position
	elif random_piece4 == 4:
		$LeaoEsqBaixo.position = $Position2D4.position
	
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

	if esqCima == true:
		$LeaoEsqCima.position.x = 420
		$LeaoEsqCima.position.y = 199
	if dirCima == true:
		$LeaoDirCima.position.x = 608
		$LeaoDirCima.position.y = 199
	if dirBaixo == true:
		$LeaoDirBaixo.position.x = 608
		$LeaoDirBaixo.position.y = 387
	if esqBaixo == true:
		$LeaoEsqBaixo.position.x = 420
		$LeaoEsqBaixo.position.y = 387
	
	if dirCima and dirBaixo and esqCima and esqBaixo == true and canPlay == false:
#		$musica.stop()
		teste = 100
		canPlay = true
	if canPlay == true and teste == 0:
		$kidsYeah.play()


func _on_ConfirmEsqCima_area_entered(area):
	if area.is_in_group("LeaoEsqCima"):
		esqCima = true
		$click.play()

func _on_ConfirmDirCima_area_entered(area):
	if area.is_in_group("LeaoDirCima"):
		dirCima = true
		$click.play()
		
func _on_ConfirmDirBaixo_area_entered(area):
	if area.is_in_group("LeaoDirBaixo"):
		dirBaixo = true
		$click.play()
		
func _on_ConfirmEsqBaixo_area_entered(area):
	if area.is_in_group("LeaoEsqBaixo"):
		esqBaixo = true
		$click.play()
