extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D



@onready var player = get_node('/root/World/Gobbo')
#plays the "walk animation"
func play_walk_animation():
	animated_sprite_2d.play("walk")
	
#makes Kinght Enemy target and walk towards player "Gobbo"
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 60.0
	move_and_slide()	
	play_walk_animation()
	
	#
	

	##
#const SPEED = 60 
#func _process(delta):
	#play_walk_animation()
	#position.x+=SPEED * delta 
	###position.y+=1
