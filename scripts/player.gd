extends CharacterBody2D

@onready var player_animation: AnimatedSprite2D = %PlayerAnimation

func _ready() -> void:
	player_animation.play("run")
	pass
