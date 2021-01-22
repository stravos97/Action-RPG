extends KinematicBody2D

#Velocity measures the change in x, & change in y position
var velocity = Vector2.ZERO #A vector is the x and y position combined
const ACCELERATION = 50
const MAX_SPEED = 200
const FRICTION = 400

func _ready():
	print("Hello World")

#This function is called every time the physics wants to update. Basically update() method
#If we have something changing over time, we need to multiply it by delta 

func _physics_process(delta):

	var input_vector = Vector2.ZERO
	"""
	This isn't getting the exact coordinates. Action strength is only equal to 1 or 0. 
	If you press one key, and not the opposite one, the action strength will equal to 1
	This info is them passed to the move and collide method

	e.g. if player movement of x axis is 1 move right, and if its is -1 then move left
	"""
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized() #math issue where if you move at a right angle, player moves faster. This makes sure movement is consistent at all angles

	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	
	move_and_collide(velocity)