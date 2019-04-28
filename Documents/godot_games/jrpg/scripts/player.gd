extends KinematicBody2D
const SPD = 120
const MXSPD = 350
const SLWDWN = 100
var v = Vector2()
var dir = "down"

var inventory = ["もどる"]
var skills = ["もどる", "charge"]
var damage = 50
var health = 100
var level = 1
var xp = 0
var weapon = "none"

enum State{
	canMove,
	cannotMove,
	inBattle
	}
	
var status = State.canMove

func _physics_process(delta):
	match status:
		State.canMove:
			take_input()
			move_and_slide(v)
			dir_loop()
		State.cannotMove:
			take_input()
		State.inBattle:
			pass
		#State.always:
			level_up()
		

func level_up():
	if xp >= int(pow(2.0,level-1)*150.0 + 200):
		level += 1
	match level:
		3:
			skills.append("heal")
	

func take_input():
	var left = Input.is_action_pressed('ui_left')
	var right = Input.is_action_pressed('ui_right')
	var up = Input.is_action_pressed('ui_up')
	var down = Input.is_action_pressed('ui_down')
	var debug_key = Input.is_action_just_pressed('ui_debug')
	
	v.x += SPD if right else 0 - SPD if left else 0
	v.y += SPD if down else 0 - SPD if up else 0
	
	if !left and v.x < 0 or (left and right):
		v.x -= sign(v.x)*SLWDWN
		if v.x > 0:
			v.x = 0
	if !right and v.x > 0:
		v.x -= sign(v.x)*SLWDWN
		if v.x < 0:
			v.x = 0
	if !up and v.y < 0 or (up and down):
		v.y -= sign(v.y)*SLWDWN
		if v.y > 0:
			v.y = 0
	if !down and v.y > 0:
		v.y -= sign(v.y)*SLWDWN
		if v.y < 0:
			v.y = 0
	
	if v.x > MXSPD or v.x < -MXSPD:
		v.x = sign(v.x)*MXSPD
	if v.y > MXSPD or v.y < -MXSPD:
		v.y = sign(v.y)*MXSPD
	
	if debug_key:
		print(str(xp) + " " + str(level) + " " + str(int(pow(2.0,level-1)*150.0 + 200)))

func dir_loop():
	var sign_v = Vector2(sign(v.x),sign(v.y))
	
	match sign_v:
		Vector2(1,0):
			dir = "right"
		Vector2(-1,0):
			dir = "left"
		Vector2(0,-1):
			dir = "up"
		Vector2(0,1):
			dir = "down"

































