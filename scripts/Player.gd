extends CharacterBody3D


const SPEED = 10.0
const JUMP_VELOCITY = 4


@onready var idle = $Idle


var gravity_strength = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Global.player = self

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity_strength * delta
	
	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	
	var input_dir = Input.get_vector("left", "right", "up", "down")
	input_dir *= int(!Global.puzzling);
	input_dir = input_dir.rotated(-get_viewport().get_camera_3d().global_rotation.y)
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	if input_dir != Vector2.ZERO:
		var rot_dir = Vector2(-input_dir.x, input_dir.y)
		idle.global_rotation.y = rot_dir.rotated(deg_to_rad(-90)).angle()
	
	move_and_slide()
	
	idle.scale = Vector3.ONE * 0.013
