extends TextureButton

func _ready():
	$".".connect("pressed", self, "on_press")
	
func on_press():
	if get_parent().activeUnit != "player":
		return
	get_parent().queue_free()
	var player = Controller.get_node(Controller.player)
	player.status = player.State.canMove