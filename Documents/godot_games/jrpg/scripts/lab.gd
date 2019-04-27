extends TextureButton

var text = ""
var notDone = true

func _ready():
	$".".connect("pressed", self, "on_press")
	
func on_press():
	if text != "":
		get_parent().queue_free()
	
func _process(delta):
	if notDone:
		get_node("Label").text = text
		notDone = false