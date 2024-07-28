extends CharacterBody2D

@export var speed = 150 #speed of enemy
var player_chase = false #boolean that tells enemy to chase the player or not
var player = null
var movement_target_position : Vector2 = Vector2(767,336)
	
func _physics_process(_delta):
	velocity = Vector2.ZERO
	if player_chase:
		velocity = position.direction_to(player.position) * speed
		move_and_slide()
		
func _on_detection_body_entered(_body): # function that makes the enemy chase the player when player 
									   # is in th collision shape
	player = _body
	player_chase = true

func _on_detection_body_exited(_body):  # function that makes the enemy chase the player when player 
									   # is in th collision shape
	player = null
	player_chase = false
