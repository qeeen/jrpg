extends TextureButton

func _ready():
	$".".connect("pressed", self, "on_press")
	
func on_press():
	if get_parent().activeUnit != "player":
		return
	var menu_source = preload("res://objects/listMenu.tscn")
	var menu = menu_source.instance()
	get_parent().add_child(menu)
	menu.init(get_node(Controller.player).skills)