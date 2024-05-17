extends Node3D

@export var step_size: float = 1
@export var segments_folder: Node3D

var active = false

func _input(event):
	if !active:
		return
	
	var movement_vector = Vector2( \
		int(event.is_action_pressed("left")) - \
		int(event.is_action_pressed("right")), \
		int(event.is_action_pressed("up")) - \
		int(event.is_action_pressed("down")) \
	)
	if movement_vector.x != 0 && movement_vector.y != 0:
		movement_vector = Vector2.ZERO
	if movement_vector == Vector2.ZERO: 
		return
	movement_vector = movement_vector.rotated(deg_to_rad(-90))
	movement_vector = Vector3(movement_vector.x, 0, movement_vector.y)
				   
	var going_to = position + movement_vector * step_size
	
	var really_going = false
	for segment in segments_folder.get_children():
		if going_to.distance_to(segment.position) < step_size / 2:
			really_going = !segment.traveled
			going_to = segment.position
	
	if really_going:
		for segment in segments_folder.get_children():
			if position.distance_to(segment.position) < step_size / 2:
				segment.traveled = true
		
		position = going_to


func _on_puzzle_activated():
	active = true


func _on_puzzle_deactivated():
	active = false
