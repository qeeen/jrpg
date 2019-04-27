extends Node

var currentEnemy = null
var turnOrder = ["player", "", "", "enemy"]

var money = 0

var main = "../main"
var player = "../main/player"

var enemyHealth = 0
var enemyDamage = 0


func enter_battle(enemy):
	var battle_source = preload("res://objects/battle.tscn")
	var battle = battle_source.instance()
	var mainNode = get_node(main)
	mainNode.add_child(battle)
	
	currentEnemy = enemy
	match currentEnemy:
		"test":
			enemyHealth = 50
			enemyDamage = 20

func instance_create(directory):
	var source = load(directory)
	var obj = source.instance()
	var mainNode = get_node(main)
	mainNode.add_child(obj)
	return obj

func add_to_inv(item):
	if get_node(player).inventory.size() < 20:
		get_node(player).inventory.append(item)

func attack():
	enemyHealth -= get_node(player).damage
	
func enemy_attack():
	var playerNode = get_node(player)
	playerNode.health -= enemyDamage
	
func getHealth():
	var playerNode = get_node(player)
	return playerNode.health
	
func stopPlayer():
	var playerNode = get_node(player)
	playerNode.status = playerNode.State.cannotMove
	
func allowPlayerMovement():
	var playerNode = get_node(player)
	playerNode.status = playerNode.State.canMove
	
	
	
	