extends CharacterBody2D

@export var speed = 150 #speed of enemy
var player_chase = false #boolean that tells enemy to chase the player or not
var player = null
@onready var navi_agent: NavigationAgent2D = $NavigationAgent2D #navigationagent2d import
var movement_target_position : Vector2 = Vector2(767,336)

func _ready():
	navi_agent.path_desired_distance = 4.0
	navi_agent.target_desired_distance = 4.0
	
	call_deferred("actor_setup")
	
func actor_setup():
		await get_tree().physics_frame
		set_movement_target(movement_target_position)
		
		

func set_movement_target(movement_target: Vector2):
	navi_agent.target_position = movement_target
	
	
func _physics_process(_delta):
	if navi_agent.is_navigation_finished():
		return
	velocity = Vector2.ZERO
	if player_chase:
		var current_agent_position: Vector2 = global_position
		var next_path_position: Vector2 = navi_agent.get_next_path_position()
		velocity = position.direction_to(player.position) * speed
		velocity = current_agent_position.direction_to(next_path_position) * speed
		move_and_slide()
		
func _on_detection_body_entered(_body): # function that makes the enemy chase the player when player 
									   # is in th collision shape
	player = _body
	player_chase = true

func _on_detection_body_exited(_body):  # function that makes the enemy chase the player when player 
									   # is in th collision shape
	player = null
	player_chase = false
