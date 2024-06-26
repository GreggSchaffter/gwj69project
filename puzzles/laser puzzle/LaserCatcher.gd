extends Node

@onready var flag = $"../Flag"

@onready var timer: Timer = $Timer

var since_zapped = 1

func _process(_delta):
	if since_zapped > 0:
		flag.hide()
	#since_zapped += 1

func zap(laser_rot):
	var from_rot = laser_rot - get_parent().global_rotation
	var deg = round(rad_to_deg(from_rot.y) / 90) * 90
	
	if test(deg, -180) && since_zapped == 1:
		timer.start()
		flag.show()
		since_zapped = 0


func test(deg, test):
	var a = deg == test
	var b = deg == test + 360
	var c = deg == test - 360
	return a || b || c
	


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/end.tscn")
