extends Node2D

const MAX_HEALTH = 5
var current_health = MAX_HEALTH

func _ready():
	update_health_ui()
	$health_bar.max_value = MAX_HEALTH
	
func update_health_ui():
	set_health_bar()

func set_health_bar():
	$health_bar.value = current_health
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("damage_test"):
		damage()

func damage():
	current_health -= 1
	if current_health <= 0:
		current_health = MAX_HEALTH
	update_health_ui()



		
