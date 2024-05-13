extends Node3D

@onready var remote_transform = $RemoteTransform3D

const STEP_SIZE = 2;

@export var moving = false

func move(dir):
	if moving:
		return
	
	var movement_tween = get_tree().create_tween()
	var going_to = remote_transform.position + dir * STEP_SIZE
	movement_tween.tween_property(remote_transform, "position", going_to, 1)
	movement_tween.connect("finished", done_moving)
	moving = true

func done_moving():
	moving = false

func _plus_x(body):
	if !body.is_in_group("player"):
		return
	move(Vector3.RIGHT)

func _minus_x(body):
	if !body.is_in_group("player"):
		return
	move(Vector3.LEFT)


func _plus_z(body):
	if !body.is_in_group("player"):
		return
	move(Vector3.FORWARD)


func _minus_z(body):
	if !body.is_in_group("player"):
		return
	move(Vector3.BACK)
