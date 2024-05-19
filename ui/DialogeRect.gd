@tool
extends NinePatchRect

const window_size = Vector2(1152, 648)

@export var dist_from_edge = 40 : set = set_dist
@export var hight = 40 : set = set_hight

func _ready():
	orient()


func set_dist(new):
	dist_from_edge = new
	orient()

func set_hight(new):
	hight = new
	orient()

func orient():
	position.x = dist_from_edge
	position.y = window_size.y - dist_from_edge - hight
	size.x = window_size.x - dist_from_edge * 2
	size.y = hight
