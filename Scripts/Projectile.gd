extends Area2D

@export var speed = 100 
@export var damage_amount = 1
func _ready():
	set_as_top_level(true)
	
	
func _physics_process(_delta):
	position += (Vector2.RIGHT*speed).rotated(rotation)* _delta
	

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(_area: Area2D) -> void:
	print("Bullet Area entered")
	
	
func _on_body_entered(_body: Node2D) -> void:
	print("bullet body entered")

func get_damage_amount() -> int:
	return damage_amount
