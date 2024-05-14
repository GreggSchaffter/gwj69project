extends Node3D

@onready var ray_cast = $RayCast3D
@onready var mesh_holder = $MeshHolder

@export var body: PhysicsBody3D

func _ready():
	ray_cast.add_exception(body)

func _process(_delta):
	if !visible:
		return
	
	if ray_cast.is_colliding():
		var origin = ray_cast.global_transform.origin
		var collision_point = ray_cast.get_collision_point()
		var distance = origin.distance_to(collision_point)
		mesh_holder.scale.z = distance;
		
		var collision_body: Node = ray_cast.get_collider()
		if collision_body.has_node("Mirror"):
			var mirror_node = collision_body.get_node("Mirror")
			#var source = MeshInstance3D.new()
			#source.name = "Source"
			#source.mesh = BoxMesh.new()
			#mirror_node.add_child(source)
			#source.global_position = global_position
			mirror_node.reflect(global_rotation)
	else:
		mesh_holder.scale.z = 30;
