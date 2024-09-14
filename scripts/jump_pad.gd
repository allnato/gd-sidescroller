extends Area2D

@onready var pad_animation: AnimatedSprite2D = $AnimatedSprite2D
@export var launch_force: float = 400

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)
	pad_animation.animation_finished.connect(_on_launch_anim_finished)


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		pad_animation.play("launch")
		body.jump(launch_force)

func _on_launch_anim_finished() -> void:
	if pad_animation.animation == "launch":
		pad_animation.animation = "idle"
