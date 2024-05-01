extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

func play_walk_animation():
	animated_sprite_2d.play("walk")
	
const SPEED = 60 
func _process(delta):
	play_walk_animation()
	position.x+=SPEED * delta 
	##position.y+=1
