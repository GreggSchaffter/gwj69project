extends Area3D


@export var camera: Camera3D;




func _on_body_entered(body):
	if body.is_in_group("player"):
		camera.make_current()
