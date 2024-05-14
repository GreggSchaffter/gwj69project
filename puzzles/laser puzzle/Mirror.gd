extends Node

@export var plus_x: Array[Node3D]
@export var plus_z: Array[Node3D]
@export var minus_x: Array[Node3D]
@export var minus_z: Array[Node3D]

var time_since_plus_x = 0
var time_since_plus_z = 0
var time_since_minus_x = 0
var time_since_minus_z = 0

func _process(_delta):
	if time_since_plus_z > 0:
		deactivate(plus_z)
	if time_since_minus_x > 0:
		deactivate(minus_x)
	if time_since_plus_x > 0:
		deactivate(plus_x)
	if time_since_minus_z > 0:
		deactivate(minus_z)
	
	time_since_plus_z += 1
	time_since_minus_x += 1
	time_since_plus_x += 1
	time_since_minus_z += 1

func reflect(laser_rot):
	var from_rot = laser_rot - get_parent().global_rotation
	var deg = round(rad_to_deg(from_rot.y) / 90) * 90
	print(deg)
	
	if test(deg, -180):
		activate(plus_z)
		time_since_plus_z = 0
	elif test(deg, -270):
		activate(minus_x)
		time_since_minus_x = 0
	if test(deg, -90):
		activate(plus_x)
		time_since_plus_x = 0
	elif test(deg, 0):
		activate(minus_z)
		time_since_minus_z = 0

func test(deg, test):
	var a = deg == test
	var b = deg == test + 360
	var c = deg == test - 360
	return a || b || c
	
func activate(side: Array[Node3D]):
	for i in side:
		i.show()

func deactivate(side: Array[Node3D]):
	for i in side:
		i.hide()
