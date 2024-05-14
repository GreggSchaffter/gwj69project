extends Node3D

@onready var remote_transform = $RemoteTransform3D
@onready var box_cast = $AnimatableBody3D/BoxCast

@onready var plus_x = $"AnimatableBody3D/+X"
@onready var minus_x = $"AnimatableBody3D/-X"
@onready var plus_z = $"AnimatableBody3D/+Z"
@onready var minus_z = $"AnimatableBody3D/-Z"


const STEP_SIZE = 1;
const SPEED = 0.5;


@export var moving = false

func _ready():
	force_grid()

func _process(_delta):
	if moving:
		return
	
	if has_player(plus_x):
		move(Vector3.RIGHT)
	elif has_player(minus_x):
		move(Vector3.LEFT)
	elif has_player(plus_z):
		move(Vector3.FORWARD)
	elif has_player(minus_z):
		move(Vector3.BACK)

func move(dir):
	# Use a shapecast in order to make sure that the box is not moving into another box
	box_cast.target_position = dir * STEP_SIZE
	box_cast.force_shapecast_update()
	if will_smash_box():
		return
	
	var movement_tween = get_tree().create_tween()
	var going_to = remote_transform.position + dir * STEP_SIZE
	movement_tween.tween_property(remote_transform, "position", going_to, SPEED)
	movement_tween.connect("finished", done_moving)
	moving = true

func done_moving():
	moving = false
	force_grid()

func has_player(object):
	for i in object.get_overlapping_bodies():
		if i.is_in_group("player"):
			return true
	return false

func will_smash_box():
	var amount_of_collions = box_cast.get_collision_count()
	for id in amount_of_collions:
		var collider  = box_cast.get_collider(id)
		if collider.is_in_group("Movable Block"):
			return true
		return false

func force_grid():
	position = round(position / STEP_SIZE) * STEP_SIZE
