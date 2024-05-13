extends Node3D

@onready var remote_transform = $RemoteTransform3D
@onready var plus_x = $"AnimatableBody3D/+X"
@onready var minus_x = $"AnimatableBody3D/-X"
@onready var plus_z = $"AnimatableBody3D/+Z"
@onready var minus_z = $"AnimatableBody3D/-Z"


const STEP_SIZE = 2;
const SPEED = 0.5;



@export var moving = false

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
	var movement_tween = get_tree().create_tween()
	var going_to = remote_transform.position + dir * STEP_SIZE
	movement_tween.tween_property(remote_transform, "position", going_to, SPEED)
	movement_tween.connect("finished", done_moving)
	moving = true

func done_moving():
	moving = false

func has_player(object):
	for i in object.get_overlapping_bodies():
		if i.is_in_group("player"):
			return true
	return false
