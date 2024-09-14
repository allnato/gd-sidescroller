extends CharacterBody2D
class_name Player

@onready var player_animation: AnimatedSprite2D = %PlayerAnimation

@export_category("Player Settings")
@export var player_gravity: float = 500.0
@export var player_speed: float = 200.0
@export var player_jump_force: float = 200.0

var player_direction: float = 0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Apply Gravity
	if not self.is_on_floor():
		velocity.y += player_gravity * delta
		velocity.y = clampf(velocity.y, -1000, 1000)

	if Input.is_action_just_pressed("move_jump") and self.is_on_floor():
		jump(player_jump_force)

	player_direction = Input.get_axis("move_left", "move_right")

	if player_direction != 0.0:
		player_animation.flip_h = (player_direction < 0.0)
	update_animation(player_direction)

	velocity.x = player_speed * player_direction
	move_and_slide()

func jump(force: float):
	velocity.y = -(force)

func update_animation(direction: float):
	if is_on_floor():
		if direction != 0.0:
			player_animation.play("run")
		else:
			player_animation.play("idle")
	else:
		if velocity.y < 0.0:
			player_animation.play("jump")
		else:
			player_animation.play("fall")
