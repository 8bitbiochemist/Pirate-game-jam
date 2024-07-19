extends Sprite2D

@export var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		position.x += speed * delta
	if Input.is_action_pressed("move_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("move_down"):
		position.y += speed * delta
	if Input.is_action_pressed("move_up"):
		position.y -= speed * delta
	attacks()


func attacks():
	if Input.is_action_pressed("weapon_attack"):
		$"Testing Attacks".text = "Melee"
	elif Input.is_action_pressed("spell_1"):
		$"Testing Attacks".text = "Spell 1"
	elif Input.is_action_pressed("spell_2"):
		$"Testing Attacks".text = "Spell 2"
	else:
		$"Testing Attacks".text = "No Input"
	
	
	
		
	
		
