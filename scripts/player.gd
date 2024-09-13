extends CharacterBody2D

@onready var player_animation: AnimatedSprite2D = %PlayerAnimation

@export_category("Player Settings")
@export var player_gravity: float = 500.0
@export var player_speed: float = 200.0
@export var player_jump_force: float = 200.0

var player_direction: int = 0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if not self.is_on_floor():
		velocity.y += player_gravity * delta
		velocity.y = clampf(velocity.y, -1000, 1000)
		print("Velocity:%.2f" % velocity.y)
	
	if Input.is_action_just_pressed("move_jump"):
		velocity.y += -player_jump_force
	
	player_direction = Input.get_axis("move_left", "move_right")
	
	if player_direction != 0.0:
		player_animation.flip_h = 1.0 - player_direction
		player_animation.play("run")
	else:
		player_animation.play("idle")
	velocity.x = player_speed * player_direction
	
	
	move_and_slide()
