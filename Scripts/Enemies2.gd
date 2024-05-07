extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
	
@onready var player = get_node('/root/World/Gobbo')

var health = 1.0
var direction
var is_dead = false

var card_drop = preload("res://Scenes/Enemies/card_drop.tscn").instantiate()

func play_walk_animation():
	animated_sprite_2d.play("walk")
func play_death_animation():
	animated_sprite_2d.play("death")

func _physics_process(delta):
	if is_dead == false:	
		direction = global_position.direction_to(player.global_position)
		velocity = direction * 40.0
		move_and_slide()
		play_walk_animation()
	elif is_dead == true:
		velocity = direction * 0.0

	if health <= 0: 
		
		#play_death_animation()
		#is_dead = true

		card_drop.global_position = global_position
		add_sibling(card_drop)
		queue_free()
	
func take_damage():
	health -= 1
	
	
#func _on_animated_sprite_2d_animation_finished():
	#print("finished")
	#if is_dead == true:
		#queue_free()
		#print("died")
