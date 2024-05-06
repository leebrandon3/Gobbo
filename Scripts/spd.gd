extends Node2D

@onready var gobbo = get_node('/root/World/Gobbo')

func _on_body_entered(body):
	gobbo.SPEED +=5
	queue_free()
