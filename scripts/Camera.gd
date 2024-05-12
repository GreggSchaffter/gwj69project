extends Camera3D

@export var center: Marker3D
@export var dist_from_center = 100
@export var hight = 16

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	var player_from_center = Global.player.global_position - center.global_position
	var should_be = (player_from_center.normalized() * dist_from_center) + center.global_position
	should_be.y = hight
	global_position = (global_position - should_be) * 0.99 + should_be
	$Looker.look_at(Global.player.global_position)
	global_rotation = (global_rotation - $Looker.global_rotation) * 0.99 + $Looker.global_rotation
