extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D
@onready var shadow = $shadow

func _physics_process(delta):

	# get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	var direction_vertical = Input.get_axis("move_up", "move_down")
	
	# apply movement horizontal
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# apply vertical movement
	if direction_vertical:
		velocity.y = direction_vertical * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	#rotate sprite
	if direction_vertical < 0:
		animated_sprite.flip_v = false
		animated_sprite.rotation_degrees = 0
		shadow.flip_v = false
		shadow.rotation_degrees = 0;
	elif direction_vertical > 0:
		animated_sprite.flip_v = true
		animated_sprite.rotation_degrees = 0
		shadow.flip_v = true;
		shadow.rotation_degrees = 0;
		
	if direction > 0:
		animated_sprite.flip_v = false
		shadow.flip_v = false
		animated_sprite.rotation_degrees = 90
		shadow.rotation_degrees = 90
	elif direction < 0:
		animated_sprite.flip_v = false
		animated_sprite.rotation_degrees = -90
		shadow.flip_v = false
		shadow.rotation_degrees = -90

	move_and_slide()
