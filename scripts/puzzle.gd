extends Node


@export var canvas_layer: CanvasLayer
@export var active_area: Area3D
@export var camera_point: Node3D



func _input(event):
	if !(event.is_action_pressed("interact") && has_player()):
		return
	
	if !Global.puzzling:
		Global.puzzling = true
		Global.puzzle_camera_pos = camera_point.global_position
		Global.puzzle_camera_rot = camera_point.global_rotation
		#canvas_layer.show()
	else:
		Global.puzzling = false
		#canvas_layer.hide()

func has_player():
	for i in active_area.get_overlapping_bodies():
		if i.is_in_group("player"):
			return true
	return false
