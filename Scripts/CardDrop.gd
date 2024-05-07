extends Node2D

@onready var gobbo = get_node('/root/World/Gobbo')
@export var health: Card
@export var speed: Card
@export var fire_rate: Card
func _ready():
	randomize()

var all_cards = [health, speed, fire_rate]

func _on_body_entered(body):
	var random_card = all_cards[randi() & all_cards.size()]
	#if random_card == speed:
	queue_free()
	
