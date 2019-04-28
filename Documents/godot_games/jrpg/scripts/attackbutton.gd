extends TextureButton

func _ready():
	$".".connect("pressed", self, "on_press")
	
func on_press():
	if get_parent().activeUnit != "player":
		return
	var menu_source = preload("res://objects/listMenu.tscn")
	var menu = menu_source.instance()
	get_parent().add_child(menu)
	var optionList = ["もどる"]
	for i in range(1,4):
		if Controller.turnOrder[i] != "":
			optionList.append(Controller.turnOrder[i])
	menu.init(optionList)