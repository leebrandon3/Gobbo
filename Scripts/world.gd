extends Node2D

@onready var path_follow_2d = $Gobbo/Camera2D/Path2D/PathFollow2D

@onready var mob_timer = $"Mob Timer"

@onready var clock_text = $"Gobbo/Camera2D/Clock Text"

var seconds = 0
var time = {
	"minutes" : 0,
	"seconds" : 0
}

# Mob spawning function
func spawn_mob():
	var new_soldier = preload("res://Scenes/enemies.tscn").instantiate()
	path_follow_2d.progress_ratio = randf()
	new_soldier.global_position = path_follow_2d.global_position
	add_child(new_soldier)

# Mob Timer triggers "mob_spawn_timeout" function. spawning mob. To update spawn frequency
# update the mob timer node.
func mob_spawn_timeout():
	spawn_mob()
	if mob_timer.wait_time > 0.2:
		mob_timer.wait_time -= 0.1
	print(mob_timer.wait_time)

# Clock function to add a second to the clock. Triggers every second.
func clock_timeout():
	seconds += 1
	seconds_conversion()

func seconds_conversion():
	time["minutes"] = str(seconds / 60)
	time["seconds"] = str(seconds % 60)
	if len(time["minutes"]) == 1:
		time["minutes"] = str("0", time["minutes"])
	if len(time["seconds"]) == 1:
		time["seconds"] = str("0", time["seconds"])
	clock_text.text = str(time["minutes"], " : ", time["seconds"])
