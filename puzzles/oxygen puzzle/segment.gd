@tool
extends Node3D

@export var untraveled_material: StandardMaterial3D
@export var traveled_material: StandardMaterial3D

@onready var mesh_instance_3d = $MeshInstance3D
@onready var rubble = $Rubble

var traveled = false : set = travel

@export var rubbled = false : set = set_rubble

func travel(new_traveled):
	if new_traveled:
		mesh_instance_3d.material_override = traveled_material
	else:
		mesh_instance_3d.material_override = untraveled_material
	
	traveled = new_traveled

func set_rubble(new):
	$Rubble.visible = new
	rubbled = new

func _ready():
	traveled = false
