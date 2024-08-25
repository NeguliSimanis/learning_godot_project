extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var game_manager = %GameManager


func _on_body_entered(body):
	animation_player.play("pickup_animation")
	game_manager.add_food()
