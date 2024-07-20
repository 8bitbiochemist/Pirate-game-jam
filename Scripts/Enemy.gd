extends CharacterBody2D

@export var speed = 150 #speed of enemy
var player_chase = false #boolean that tells enemy to chase the player or not
var player = null
@onready var nav: NavigationAgent2D = $NavigationAgent2D #navigationagent2d import

func _physics_process(_delta):
	if player_chase: 
		position += (player.position - position) / speed
		
func _on_detection_body_entered(body): # function that makes the enemy chase the player when player 
									   # is in th collision shape
	player = body
	player_chase = true

func _on_detection_body_exited(body):  # function that makes the enemy chase the player when player 
									   # is in th collision shape
	player = null
	player_chase = false
