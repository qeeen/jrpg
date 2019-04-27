extends TextureButton

func _ready():
	$".".connect("pressed", self, "on_press")
	
func on_press():
	pass