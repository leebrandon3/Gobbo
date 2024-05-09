extends Control

@onready var inv: Card_Menu = preload("res://Scenes/Player/Card_Menu/card_menu.tres")
@onready var slots: Array = $GridContainer.get_children()
var is_open = false

func _ready():
	inv.update.connect(update_slots)
	visible = false
	update_slots()

func update_slots():
	#print("pickup")
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])

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
