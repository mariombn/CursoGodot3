extends CanvasLayer

var points = 0

func _ready():
	if not $music.playing:
		$music.play()

func count_score():
	points += 1
	$score.text = str(points)
	

func game_over():
	$score.hide()
	$gameover/animation.play("game_over")
	$gameover/last_score.text = str(points)
	
	if points > game_controller.best_score:
		game_controller.best_score = points
	
	$gameover/best_score.text = str(game_controller.best_score)
	points = 0


func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_menu_pressed():
	get_tree().change_scene("res://assets/scene/menu.tscn")
