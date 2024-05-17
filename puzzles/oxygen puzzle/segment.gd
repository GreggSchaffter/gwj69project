extends Node3D

@export var untraveled_material: StandardMaterial3D
@export var traveled_material: StandardMaterial3D

@onready var mesh_instance_3d = $MeshInstance3D

var traveled = false : set = travel

func travel(new_traveled):
	if new_traveled:
		mesh_instance_3d.material_override = traveled_material
	else:
		mesh_instance_3d.material_override = untraveled_material
	
	traveled = new_traveled

func _ready():
	#mesh_instance_3d.mesh = mesh_instance_3d.mesh.duplicate()
	traveled = false
