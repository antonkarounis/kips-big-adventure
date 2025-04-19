extends CharacterBody2D

@export var speed = 400
@export var gravity = 300
@export var jump = 400

# https://dev.to/christinec_dev/learn-godot-4-by-making-a-2d-platformer-part-2-player-setup-movement-input-4k9n

func _physics_process(delta):
	# horizontal movement processing (left, right)
	horizontal_movement()
	vertical_movement(delta)
	
	#applies movement
	move_and_slide() 

func horizontal_movement():
	# if keys are pressed it will return 1 for ui_right, -1 for ui_left, and 0 for neither	
	var horizontal_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	# horizontal velocity which moves player left or right based on input
	velocity.x = horizontal_input * speed

func vertical_movement(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		print(velocity.y)
		return
		
	var vertical_input = Input.get_action_strength("ui_jump")
	
	if vertical_input > 0:
		velocity.y = vertical_input * jump
		print(velocity.y)
