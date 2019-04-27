extends Area2D

func _ready():
	pass
	#$".".connect("body_entered", self, "entered")

func _physics_process(delta):
	interact()
	change_dir()
	

func interact():
	if Input.is_action_just_pressed("ui_a"):
		for body in get_overlapping_bodies():
			if body.is_in_group("Interactable"):
				var speech = Controller.instance_create("res://objects/speechbox.tscn")
				speech.init(true,["you got trash"])
				body.queue_free()

func change_dir():
	match get_parent().dir:
		"down":
			set_rotation_degrees(0)
		"up":
			set_rotation_degrees(180)
		"right":
			set_rotation_degrees(270)
		"left":
			set_rotation_degrees(90)