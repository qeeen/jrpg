extends Label

func _process(delta):
	text = str(Controller.turnOrder[get_parent().currentTurn])