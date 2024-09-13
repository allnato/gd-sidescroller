extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		_quit_game()
		return
	if event.is_action_pressed("reset"):
		_reset_game()

func _quit_game() -> void:
	get_tree().quit()

func _reset_game() -> void:
	get_tree().reload_current_scene()
