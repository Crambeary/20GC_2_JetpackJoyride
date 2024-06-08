extends CharacterBody2D
@onready var animated_sprite = $AnimatedSprite2D


const SPEED = 300.0
const JET_ACCELERATION = -40.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		animated_sprite.play("run")
		
	# Handle jump.
	if (Input.is_action_pressed("jet") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) and not is_on_ceiling():
		velocity.y += JET_ACCELERATION
		animated_sprite.play("fly")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = 1
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
