extends TextureButton

func _ready():
	$".".connect("pressed", self, "on_press")
	
func on_press():
	if Controller.turnOrder[get_parent().currentTurn] != "enemy":
		Controller.attack()
		get_parent().nextTurn()