extends StaticBody2D

var speed = 100
var is_moving = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	speed = int(rand_range(100, 300))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_moving:
		position.y += speed * delta
		if position.y > get_viewport_rect().size.y + 320:
			queue_free()


func _on_area_body_entered(body):
	if body.name == "cat" and not is_moving:
		is_moving = true
		get_tree().call_group("node_ground_group", "generete_ground", position.x)
		get_tree().call_group("hud_group", "count_score")
