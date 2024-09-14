extends Node2D

@onready var deathzone: Area2D = $Deathzone
@onready var player: CharacterBody2D = $Player
@onready var spawn_point: Marker2D = $SpawnPoint


func _ready() -> void:
	deathzone.body_entered.connect(_on_entered_deathzone)
	player.position = spawn_point.global_position

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		_quit_game()
		return
	if event.is_action_pressed("reset"):
		_reset_game()

func _quit_game() -> void:
	get_tree().quit()

func _reset_game() -> void:
	get_tree().call_deferred("reload_current_scene")

func _on_entered_deathzone(body: Node2D) -> void:
	# Reset Player Position and their velocity
	player.velocity = Vector2.ZERO
	player.position = spawn_point.global_position
