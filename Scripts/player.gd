extends CharacterBody2D

signal health_updated
signal death

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var bow = $Bow

var MAX_HEALTH = 100.0
var current_health = 100.0
const DAMAGE_RATE = 30.0
var alive = true
var regen = 0.01

func _physics_process(delta):
	if alive == true:
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = direction * 170
		move_and_slide()

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
		
		if current_health < MAX_HEALTH:
			if (current_health + regen) <= MAX_HEALTH:
				current_health += regen
			else:
				current_health = MAX_HEALTH
	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		current_health -= overlapping_mobs.size() * DAMAGE_RATE * delta
		health_updated.emit()
		
		if current_health <= 0 and alive == true:
			alive = false
			animated_sprite_2d.play("death")
			death.emit()
			bow.queue_free()
	
