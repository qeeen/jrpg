extends Node

var toBeText = ""
var index = 0;
var lineIndex = -1
var isOn = false
var autoLoop = false
var lines = []

func init(aL, newLines):
	if aL:
		autoLoop = true
		isOn = true
		lines = newLines
		new_line()
	else:
		toBeText = newLines
	Controller.stopPlayer()

func _process(delta):
	if isOn and !autoLoop:
		print_text()
	if autoLoop:
		auto_loop()

func print_text():
	var textbox = get_node("the_text")
	textbox.text = toBeText.substr(0,index+1)
	index += 1
	if index == toBeText.length():
		isOn = false

func reset_text(newText):
	index = 0
	get_node("the_text").text = ""
	toBeText = newText
	
func auto_loop():
		if isOn:
			print_text()
		elif Input.is_action_just_pressed("ui_a") and lineIndex+1 != lines.size():
			new_line()
		elif Input.is_action_just_pressed("ui_a"):
			queue_free()
			Controller.allowPlayerMovement()

func add_line(newLine):
	lines.append(newLine)

func new_line():
		isOn = true
		lineIndex += 1
		reset_text(lines[lineIndex])