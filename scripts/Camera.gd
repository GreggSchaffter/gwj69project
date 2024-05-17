extends Camera3D

@export var center: Marker3D
@export var dist_from_center = 100
@export var hight = 16

@onready var looker = $Looker

var original_pos: Vector3
var original_rot: Vector3

func _ready():
	original_pos = global_position
	original_rot = global_rotation



func _process(_delta):
	var should_be_pos: Vector3
	if !Global.puzzling:
		should_be_pos = original_pos
		looker.global_rotation = original_rot
	else:
		should_be_pos = Global.puzzle_camera_pos
		looker.global_rotation = Global.puzzle_camera_rot
	
	global_position = (global_position - should_be_pos) * 0.99 + should_be_pos
	global_rotation = (global_rotation - $Looker.global_rotation) * 0.99 + $Looker.global_rotation
