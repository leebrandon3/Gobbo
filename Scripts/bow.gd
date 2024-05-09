extends Area2D

var target_enemy = null
@onready var gobbo = get_node('/root/World/Gobbo')

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		target_enemy = enemies_in_range.front()
		var shortestDist = distSquared(gobbo, enemies_in_range.front())
		for enemy in enemies_in_range:
			var current_dist = distSquared(gobbo, enemy)
			if current_dist < shortestDist:
				target_enemy = enemy
		look_at(target_enemy.global_position)

func distSquared(player_position, enemy_position):
	var calc_x = player_position.global_position.x - enemy_position.global_position.x
	var calc_y = player_position.global_position.y - enemy_position.global_position.y
	var calc = (calc_x * calc_x) + (calc_y * calc_y)
	return calc

func shoot():
	const ARROW = preload("res://Scenes/Player/arrow.tscn")
	var new_arrow = ARROW.instantiate()
	new_arrow.global_position = %ShootingPoint.global_position
	new_arrow.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_arrow)


func _on_timer_timeout():
	shoot()
