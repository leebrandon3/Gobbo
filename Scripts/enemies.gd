extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D



@onready var player = get_node('/root/World/Gobbo')

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 60.0
	move_and_slide()	
	#
	#
#func play_walk_animation():
	#animated_sprite_2d.play("walk")
	##
#const SPEED = 60 
#func _process(delta):
	#play_walk_animation()
	#position.x+=SPEED * delta 
	###position.y+=1
