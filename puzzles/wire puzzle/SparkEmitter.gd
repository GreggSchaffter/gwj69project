extends Node3D


@onready var timer = $Timer
@onready var path = $"../Path"

const SPARK = preload("res://puzzles/wire puzzle/spark.tscn")

func _on_timer_timeout():
	var new_spark = SPARK.instantiate()
	path.add_child(new_spark)
