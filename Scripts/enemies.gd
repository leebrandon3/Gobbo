#extends CharacterBody2D
#@onready var animated_sprite_2d = $AnimatedSprite2D
#
#
#@onready var player = get_node('/root/World/Gobbo')
##variable that defines the helath
#var health = 2
#
#var card_drop = preload("res://Scenes/Enemies/card_drop.tscn").instantiate()
##plays the "walk animation"
#func play_walk_animation():
	#animated_sprite_2d.play("walk")
	#
#func play_death_animation():
	#animated_sprite_2d.play("death")
	#
##makes Kinght Enemy target and walk towards player "Gobbo"
#func _physics_process(delta):
	#var direction = global_position.direction_to(player.global_position)
	#velocity = direction * 60.0
	#move_and_slide()	
	#play_walk_animation()
	#
##this function uses the health variable declaried above and sets it 
##to  -1 once its called if health goes to 0 we play death animation 
##and call queue_free
#func take_damage():
	#health -= 1
	#if health == 0:
		#play_death_animation()
		#card_drop.global_position = global_position
		#add_sibling(card_drop)
		#queue_free()
 #func _on_animated_sprite_2d_animation_finished():
	#print("finished")
	#if is_dead == true:
		#queue_free()
		#print("died")





extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D


@onready var player = get_node('/root/World/Gobbo')
#variable that defines the helath
var health = 100.0
var direction
var is_dead = false
var DAMAGE_RATE = 35


var card_drop = preload("res://Scenes/Enemies/card_drop.tscn").instantiate()
func play_walk_animation():
	animated_sprite_2d.play("walk")
	
func play_death_animation():
	animated_sprite_2d.play("death")

	
#makes Kinght Enemy target and walk towards player "Gobbo"
func _physics_process(delta):
	if is_dead == false:
		direction = global_position.direction_to(player.global_position)
		velocity = direction * 60.0
		move_and_slide()	
		play_walk_animation()
	elif is_dead == true:
		velocity = direction * 0.0
#cahnge health == 0 to health <= 0 to queue free even if health is less than zero
	if health <= 0:
		play_death_animation()
		is_dead = true
	
#this function uses the health variable declaried above and sets it 
#to  -1 once its called if health goes to 0 we play death animation 
#and call queue_free
func take_damage():
	health -= DAMAGE_RATE
	print(health)
	#card_drop.global_position = global_position
	#add_sibling(card_drop)
	#if health == 0:
		#play_death_animation()
		#is_dead = true
		#queue_free()
		#_on_animated_sprite_2d_animation_finished()

#
func _on_animated_sprite_2d_animation_finished():
	#print("finished")
	if is_dead == true:
		queue_free()
		card_drop.global_position = global_position
		add_sibling(card_drop)
		print("died")
