extends CharacterBody2D
@export var speed = 300
var inhand = 0
var spell_list = ["fireball","ice_wave","lightning"]

var proj_cooldown = true
var proj = preload("res://Scenes/projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#Movement
func get_input():
	#Movement
	var input_direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = input_direction * speed
	if velocity.length() > 1:
		velocity.normalized()
		#These allows the player to scroll through the spell list
	if Input.is_action_just_pressed("wheel_down"):
		if inhand == len(spell_list) - 1:
			inhand = 0
		else:
			inhand += 1
	if Input.is_action_just_pressed("wheel_up"):
		if inhand == 0:
			inhand = len(spell_list) - 1
		else:
			inhand -= 1
	$"Spells".text = spell_list[inhand]
# Called every frame. 'delta' is the elapsed time since the previous frame.#
func _physics_process(_delta):
	get_input()
	move_and_slide()
	var mouse_position = get_global_mouse_position()
	$Marker2D.look_at(mouse_position)
	
	if Input.is_action_just_pressed('spell') and proj_cooldown:
		proj_cooldown = false
		var proj_instance = proj.instantiate()
		proj_instance.rotation = $Marker2D.rotation
		proj_instance.global_position = $Marker2D.global_position
		add_child(proj_instance)
		
		
		await get_tree().create_timer(0.4).timeout
		proj_cooldown = true
		
		
	attacks()

## Function to show which attack is active
func attacks():
	if Input.is_action_pressed("weapon_attack"):
		$"Testing Attacks".text = "Melee"
	elif Input.is_action_pressed("spell"):
		$"Testing Attacks".text = "Casting..."
	else:
		$"Testing Attacks".text = "No Input"


	
