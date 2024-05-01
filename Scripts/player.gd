extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	print(velocity)
	if velocity.length() == 0:
		animated_sprite_2d.play("idle")
	elif velocity.x > 0:
		animated_sprite_2d.play("running")
		animated_sprite_2d.flip_h = false
	elif  velocity.x < 0:
		animated_sprite_2d.play("running")
		animated_sprite_2d.flip_h = true
	
	if  velocity.y != 0:
		animated_sprite_2d.play("running")
	
