extends Path3D

@export var top_level_node: Node

func _ready():
	var points: PackedVector3Array = curve.get_baked_points()
	var beginning_node = Marker3D.new()
	var ending_node = Marker3D.new()
	add_child(beginning_node)
	add_child(ending_node)
	beginning_node.position = position + points[0]
	ending_node.position = position + points[points.size() - 1]
