extends Node

var turnOrder = ["player", "", "", ""]

var money = 0

var main = "/root/main"
var player = "/root/main/player"
var battle = "/root/main/battle"

var enemyHealth = [0, 0, 0]
var enemyXP = [0, 0, 0]

func _process(delta):
	if get_node(main).has_node("battle"):
		for i in range(0,3):
			if enemyHealth[i] <= 0 and turnOrder[i+1] != "":
				turnOrder[i+1] = ""
				get_node(player).xp += enemyXP[i]
				if get_node(battle).has_node("enemy" + str(i) + "_sprite"):
					get_node(battle).get_node("enemy" + str(i) + "_sprite").queue_free()



func enter_battle(enemy, enemy1, enemy2):
	var battleNode = instance_create("res://objects/battle.tscn")
	var i = 0
	for enem in [enemy, enemy1, enemy2]:
		if turnOrder[i] != enem and turnOrder[i] != enem + "2":
			turnOrder[i+1] = enem
		else:
			if turnOrder[i] != enem + "2":
				turnOrder[i+1] = enem + "2"
			else:
				turnOrder[i+1] = enem + "3"
				
		match enem:
			"test":
				var spr = preload("res://sprites/ba2.png")
				enemyHealth[i] = 50
				enemyXP[i] = 50
				battleNode.get_node("enemy" + str(i) + "_sprite").set_texture(spr)
		i+=1

func add_enemy(enemy, enemy1, enemy2):
	turnOrder[1] = enemy
	turnOrder[2] = enemy
	turnOrder[3] = enemy

func instance_create(directory):
	var source = load(directory)
	var obj = source.instance()
	var mainNode = get_node(main)
	mainNode.add_child(obj)
	return obj

func add_to_inv(item):
	if get_node(player).inventory.size() < 20:
		get_node(player).inventory.append(item)

func attack(enem):
	enemyHealth[enem-1] -= get_node(player).damage

func getHealth():
	var playerNode = get_node(player)
	return playerNode.health
	
func stopPlayer():
	var playerNode = get_node(player)
	playerNode.status = playerNode.State.cannotMove
	
func allowPlayerMovement():
	var playerNode = get_node(player)
	playerNode.status = playerNode.State.canMove
	
func send(message):
	for checkEnem in range(1, 4):
		if turnOrder[checkEnem] == message:
			attack(checkEnem)
			return
	message = message.replace("2", "")
	message = message.replace("3", "")
	message = message.replace("_turn", "")
	match message:
		"test":
			var playerNode = get_node(player)
			playerNode.health -= 20
			return
		"もどる":
			get_node("../main/battle/listMenu").queue_free()
			return

