extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var joystick:CustomVirtualJoystick

@export var player_stats:PlayerStats

func _ready():
	animated_sprite_2d.play("default")
func _process(delta: float) -> void:
	velocity=joystick.output*player_stats.move_speed
	move_and_slide()
