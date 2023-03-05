class_name Player
extends KinematicBody2D


const gravity = 8.1
const speed = 92
const jump_force = -240
var jump_count = 0
export var extra_jumps = 1

var velocity = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		velocity.x = -speed 
	elif Input.is_action_pressed("right"):
		velocity.x = speed
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("up") && jump_count < extra_jumps:
		velocity.y = jump_force
		jump_count += 1

	if is_on_floor():
		jump_count = 0

	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2.UP)
	
var i:= 0.0
var is_hit = false 
func hit()->void: 
	if is_hit:return 
	is_hit = true 
	$Playe1.modulate = Color.red
	yield(get_tree().create_timer(0.3), "timeout")
	$Playe1.modulate = Color.white
	is_hit = false


func _on_Respawn_area_entered(area):
	get_tree().reload_current_scene()
	pass # Replace with function body.
