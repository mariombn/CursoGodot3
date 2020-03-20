extends Node2D

export (PackedScene) var ground

func _ready():
	randomize()
	

func generete_ground(current_position_x):
	var new_ground = ground.instance()
	#var new_range_x = rand_range(550, 650)
	var new_range_x = 700
	var new_range_y = rand_range(1400, 1200)
	var new_position = Vector2(new_range_x + current_position_x, new_range_y)
	
	new_ground.position = new_position
	add_child(new_ground)
