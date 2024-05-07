extends Node2D

func shoot():
	const ARROW = preload("res://Scenes/Player/arrow.tscn")
	var new_arrow = ARROW.instantiate()
	new_arrow.global_position = %ShootingPoint.global_position
	new_arrow.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_arrow)


func _on_timer_timeout():
	shoot()
