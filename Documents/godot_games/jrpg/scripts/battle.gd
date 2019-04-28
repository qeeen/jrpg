extends Node

var activeUnit;

enum Turn{
	one = 0,
	two = 1,
	three = 2,
	four = 3
}

var timer = 60
var currentTurn = Turn.one

func _ready():
	pass 

func nextTurn():
	match currentTurn:
		Turn.one:
			currentTurn = Turn.two
		Turn.two:
			currentTurn = Turn.three
		Turn.three:
			currentTurn = Turn.four
		Turn.four:
			currentTurn = Turn.one
	if Controller.turnOrder[currentTurn] == "":
		nextTurn();
		
		
func _process(delta):
	activeUnit =  Controller.turnOrder[currentTurn]
	if activeUnit != "player":
		timer -= 1
		if timer == 0:
			timer = 40
			Controller.send(activeUnit + "_turn")
			nextTurn()
