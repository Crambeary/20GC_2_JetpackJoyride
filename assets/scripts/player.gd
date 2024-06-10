extends CharacterBody2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var vfx_land = $VFX_Land
@onready var vfx_run = $VFX_Run



const SPEED = 300.0
const JET_ACCELERATION = -50.0

signal hit

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction := 1 # Run to the right
var is_dead := false
var landed := true
# TODO: Place the VFX_Land element in worldspace on landing. Do not instantiate

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		velocity.y = clamp(velocity.y, -500, 500)
		vfx_run.visible = false
		landed = false
	elif is_on_floor() and direction == 1:
		vfx_run.visible = true
		vfx_run.play("default")
		animated_sprite.play("run")
		if landed == false:
			landed = true
		
	# Handle jump.
	if (Input.is_action_pressed("jet") \
		or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)) \
		and not is_on_ceiling() \
		and not is_dead:
		velocity.y += JET_ACCELERATION
		animated_sprite.play("fly")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	if direction < 0 and is_dead:
		direction += 0.8 * delta
	elif direction > 0 and is_dead:
		direction = 0
	elif direction:
		velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func death():
	if not is_dead:
		animated_sprite.play("death")
		direction = -1
		is_dead = true
