extends Camera3D

@export var center: Marker3D
@export var dist_from_center = 100
@export var hight = 16

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var should_be_pos: Vector3
	if !Global.puzzling:
		var player_from_center = Global.player.global_position - center.global_position
		should_be_pos = (player_from_center.normalized() * dist_from_center) + center.global_position
		should_be_pos.y = hight
		$Looker.look_at(Global.player.global_position)
	else:
		should_be_pos = Global.puzzle_camera_pos
		$Looker.global_rotation = Global.puzzle_camera_rot
	
	global_position = (global_position - should_be_pos) * 0.99 + should_be_pos
	global_rotation = (global_rotation - $Looker.global_rotation) * 0.99 + $Looker.global_rotation
