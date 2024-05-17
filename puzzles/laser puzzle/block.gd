extends Node3D

@export var movable = true;

func _ready():
	$MovableBlock.movable = movable;
