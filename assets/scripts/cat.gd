extends KinematicBody2D

const GRAVITY    = 2000
const SPEED      = 500
const JUMP_FORCE = -900

var linear_velocity = Vector2(0, 0)
var is_jumping      = false
var is_moving       = false
var is_alive        = true


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)


# Trabalha da mesma maneira que o _process
func _physics_process(delta):
	
	linear_velocity.y += GRAVITY * delta
	
	if is_alive:
		if is_on_floor():
			linear_velocity.x = 0
			if is_jumping:
				$audio_jump.play()
				linear_velocity.y = JUMP_FORCE
		elif is_moving:
			linear_velocity.x = SPEED
		else:
			linear_velocity.x = 0
			
		is_jumping = false
		 
		if position.y > get_viewport_rect().size.y:
			dead()
	
	#linear_velocity = move_and_slide(linear_velocity, Vector2(0,-1))
	move_and_slide(linear_velocity, Vector2(0,-1))
	
	play_animations()

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			is_moving = true and is_on_floor()
			is_jumping = true
		else:
			is_moving = false
			

func play_animations():
	if is_alive:
		if is_on_floor():
			$animation.play("idle")
		else:
			if linear_velocity.y > 0:
				$animation.play("fall")
			if linear_velocity.y < 0:
				$animation.play("jump")
	else:
		$animation.play("dead")

func dead():
	if is_alive:
		$audio_death.play()
		is_alive = false
		linear_velocity = Vector2(0, JUMP_FORCE)
		get_tree().call_group("hud_group", "game_over")























