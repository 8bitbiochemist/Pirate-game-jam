extends CharacterBody2D

@export var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#Movement
func get_input():
	var input_direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = input_direction * speed
	if velocity.length() > 1:
		velocity.normalized()
# Called every frame. 'delta' is the elapsed time since the previous frame.#
func _physics_process(_delta):
	get_input()
	move_and_slide()
	attacks()
	spells()

## Function to show which attack is active
func attacks():
	if Input.is_action_pressed("weapon_attack"):
		$"Testing Attacks".text = "Melee"
	elif Input.is_action_pressed("spell"):
		$"Testing Attacks".text = "Casting..."
	else:
		$"Testing Attacks".text = "No Input"
###  MAKE FUNCTION TO ALLOW SCROLL WHEEL TO ACCESS SPELLS SLOTS
func spells():
	var spells = ["fireball","ice_wave","lightning"]
	for i in spells:
		if Input.is_action_just_released("wheel_up")
	if Input.is_action_just_released("fireball"):
		$"Spells".text = "Fireball"
	elif Input.is_action_just_released("ice_wave"):
		$"Spells".text = "Icewave"
