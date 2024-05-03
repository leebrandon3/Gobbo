extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D


@onready var player = get_node('/root/World/Gobbo')
#variable that defines the helath
var health = 2


#plays the "walk animation"
func play_walk_animation():
	animated_sprite_2d.play("walk")
	
func play_death_animation():
	animated_sprite_2d.play("death")
	
#makes Kinght Enemy target and walk towards player "Gobbo"
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 60.0
	move_and_slide()	
	play_walk_animation()
	
#this function uses the health variable declaried above and sets it 
#to  -1 once its called if health goes to 0 we play death animation 
#and call queue_free
func take_damage():
	health -= 1
	if health == 0:
		play_death_animation()
		queue_free()
 
