extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$LaserEmitter.
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends Node3D

@export var movable = true;

func _ready():
	$MovableBlock.movable = movable;
