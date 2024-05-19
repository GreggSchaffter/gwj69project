extends PathFollow3D

const SPEED = 1
const SEGMENT_SIZE = 1

func _ready():
	var path: Path3D = get_parent()
	
	var tween = get_tree().create_tween()
	var time_to_move_over_segment = SPEED * SEGMENT_SIZE * path.curve.get_baked_length()
	tween.tween_property(self, "progress_ratio", 1, time_to_move_over_segment)
	tween.connect("finished", tween_over)

func tween_over():
	var segment_folder: Node
