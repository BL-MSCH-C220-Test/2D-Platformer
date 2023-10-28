extends CharacterBody2D


const SPEED = 30.0
const MAX_SPEED = 500.0
const JUMP_VELOCITY = -400.0
const WALL_VELOCITY = 2000.0
var can_double_jump = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var glide_gravity = gravity / 20


func set_animation(a):
	if $Sprite.animation != a:
		$Sprite.play(a)

func is_on_my_wall():
	if $Left.is_colliding() and $Left.get_collider().name == "Wall":
		return 1
	if $Right.is_colliding() and $Right.get_collider().name == "Wall":
		return -1
	return 0

func _physics_process(delta):
	if is_on_floor():
		can_double_jump = true
	# Add the gravity.
	if not is_on_floor():
		if Input.is_action_pressed("glide") and velocity.y > 0:
			velocity.y += glide_gravity * delta
			set_animation("Glide")
		else:
			velocity.y += gravity * delta
			set_animation("Fall")
	elif abs(velocity.x) >= 5 and $Sprite.animation != "Walk":
		set_animation("Walk")
	elif abs(velocity.x) < 5:
		set_animation("Idle")

	# Handle Jump.
	var check_wall = is_on_my_wall()
	if Input.is_action_just_pressed("Jump") and (is_on_floor() or can_double_jump or check_wall):
		if not is_on_floor() and not check_wall:
			can_double_jump = false
		set_animation("Jump")
		velocity.y = JUMP_VELOCITY
	else:
		check_wall = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x += direction * SPEED
		if direction < 0:
			$Sprite.flip_h = true
		else:
			$Sprite.flip_h = false;
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.1)
	
	velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
	velocity.x += check_wall * WALL_VELOCITY
	

	move_and_slide()
