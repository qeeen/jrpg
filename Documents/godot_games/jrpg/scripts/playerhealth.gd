extends Label

func _process(delta):
	text = str(Controller.getHealth())