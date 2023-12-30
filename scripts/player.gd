extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var joystick_left : CustomVirtualJoystick
@export var joystick_right : CustomVirtualJoystick

var move_vector := Vector2.ZERO

@export var player_stats:PlayerStats
const SPEED = 300.0
const FLY_SPEED = 300


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animated_sprite_2d.play("default")
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
func handle_ground_movement(delta):
	# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
			
func _process(delta: float) -> void:
	
	move_vector = Vector2.ZERO
	move_vector.x = Input.get_axis("ui_left", "ui_right")
	move_vector.y = Input.get_axis("ui_up", "ui_down")
	position += move_vector * SPEED * delta
	

