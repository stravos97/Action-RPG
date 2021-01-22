extends KinematicBody2D

#Velocity measures the change in x, & change in y position
var velocity = Vector2.ZERO #A vector is the x and y position combined

func _ready():
	print("Hello World")

#This function is called every time the physics wants to update. Basically update() method	
func _physics_process(delta):

	var input_vector = Vector2.ZERO
	"""
	This isn't getting the exact coordinates. Action strength is only equal to 1 or 0. 
	If you press one key, and not the opposite one, the action strength will equal to 1
	This info is them passed to the move and collide method
	"""
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if input_vector != Vector2.ZERO:
		velocity = input_vector
	else:
		velocity = Vector2.ZERO

	
	move_and_collide(velocity)	

