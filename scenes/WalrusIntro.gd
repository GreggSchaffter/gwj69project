extends Node2D

var test = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($WalrusIntro.modulate.a < 1):
		$WalrusIntro.modulate.a += 1*delta;
	else:
		if($StudioTimer.is_stopped()):
			$StudioTimer.start()


func _on_studio_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/game_world.tscn");
