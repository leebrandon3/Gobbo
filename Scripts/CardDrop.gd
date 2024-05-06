extends Node2D

@onready var gobbo = get_node('/root/World/Gobbo')

const HEALTH = preload("res://Scenes/Player/Card_Menu/Card/health.tres")

func _on_body_entered(body):
	gobbo.MAX_HEALTH += 5
	gobbo.current_health += 5
	gobbo.collect(HEALTH)
	print(gobbo.MAX_HEALTH)
	queue_free()
