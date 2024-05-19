extends Node3D

const rot_amount = deg_to_rad(90)

func rotate_segment(rot_dir):
	var rotation_to = rotation.z + rot_dir * rot_amount
	rotation_to = round(rotation_to / rot_amount) * rot_amount
	var tween = get_tree().create_tween()
	tween.tween_property(self, "rotation", Vector3(0, 0, rotation_to), 1)
