extends Node2D

@onready var gobbo = get_node('/root/World/Gobbo')
@export var health: Card
@export var speed: Card
@export var fire_rate: Card
@onready var timer = get_node('/root/World/Gobbo/Bow').get_node("%Timer")

func _ready():
	randomize()

func _on_body_entered(body):
	var all_cards = [health, speed, fire_rate]
	var random_card = all_cards[randi() % all_cards.size()]
	if random_card == health:
		gobbo.MAX_HEALTH += 20
		gobbo.current_health += 20
	elif random_card == speed:
		gobbo.SPEED += 20
	elif random_card == fire_rate:
		timer.wait_time = timer.wait_time * 0.8
	gobbo.collect(random_card)
	queue_free()
	
