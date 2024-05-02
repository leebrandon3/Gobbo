extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D




	
#const SPEED = 60
#func _process(delta):
	#play_walk_animation()
	#position.x+=SPEED * delta
	
@onready var player = get_node("/root/World/Gobbo")
func play_walk_animation():
	animated_sprite_2d.play("walk")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 90.0
	move_and_slide()
	play_walk_animation()
