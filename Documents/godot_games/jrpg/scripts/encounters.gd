extends Area2D

var chances = 1

func _ready():
	$".".connect("body_entered", self, "entered")

func entered(body):
	randomize()
	if body.is_in_group("player") and true if randi()%chances+1 == 1 else false:
		var player = get_node("../../player")
		player.status = player.State.inBattle
		Controller.enter_battle("test")