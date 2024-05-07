extends Node2D

@onready var gobbo = get_node('/root/World/Gobbo')

func _on_body_entered(body):
	print(gobbo)
	gobbo.MAX_HEALTH += 5
	gobbo.current_health += 5
	print(gobbo.MAX_HEALTH)
	queue_free()
