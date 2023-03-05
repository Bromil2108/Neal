
extends Area2D
class_name Coin

signal on_collect

var value = 10

func _process(delta):
	$AnimatedSprite.play("Gold")

func _on_Coins_body_entered(body):
	emit_signal("on_collect", value)
	queue_free()
