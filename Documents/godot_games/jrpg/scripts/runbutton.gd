extends TextureButton

func _ready():
	$".".connect("pressed", self, "on_press")
	
func on_press():
	get_parent().queue_free()
	var player = Controller.get_node(Controller.player)
	player.status = player.State.canMove