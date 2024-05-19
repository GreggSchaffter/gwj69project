extends Node3D

var activated = false

@export var step_size = 1.0

@onready var segment_folder = $"../Segments"

func _input(event):
	if !activated:
		return
	
	var movement_vector = Vector2( \
		int(event.is_action_pressed("right")) - \
		int(event.is_action_pressed("left")), \
		int(event.is_action_pressed("up")) - \
		int(event.is_action_pressed("down")) \
	)
	if movement_vector.x != 0 && movement_vector.y != 0:
		movement_vector = Vector2.ZERO
	if movement_vector == Vector2.ZERO: 
		return
	movement_vector = Vector3(movement_vector.x, movement_vector.y, 0)
				   
	var going_to = position + movement_vector * step_size
	
	var really_going = true
	#for segment in segment_folder.get_children():
		#if going_to.distance_to(segment.position) < step_size / 2:
			#really_going = true
			#going_to = segment.position
	
	if really_going:
		position = going_to



func _process(delta):
	if !activated:
		return
	
	var rotation_input = int(Input.is_action_just_pressed("rotate_clockwise")) - int(Input.is_action_just_pressed("rotate_counter_clockwise"))
	if rotation_input == 0:
		return
	for segment in segment_folder.get_children():
		if segment.position.distance_to(position) < step_size / 2:
			find_segment_node(segment).rotate_segment(rotation_input)

func find_segment_node(root: Node):
	if root.is_in_group("segment"):
		return root
	for i in root.get_children():
		if i.is_in_group("segment"):
			return i

func _on_puzzle_activated():
	show()
	activated = true


func _on_puzzle_deactivated():
	hide()
	activated = false
