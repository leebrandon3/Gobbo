extends Control

var is_open = false

func _ready():
	visible = false

func _process(delta):
	if Input.is_action_just_pressed("open menu"):
		if is_open == false:
			visible = true
			is_open = true
			get_tree().paused = true
		elif is_open == true:
			visible = false
			is_open = false
			get_tree().paused = false
