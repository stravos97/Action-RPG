extends KinematicBody2D


func _ready():
	print("Hello World")

#Every time the physics updates, this function is called	
func _physics_process(delta):
	if Input.is_action_pressed("ui")

